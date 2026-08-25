import React, { useState, useEffect, useRef } from 'react';
import { X, Calculator, Save } from 'lucide-react';
import { cn } from '../utils';
import { useSettings } from '../context/SettingsContext';

export function TextileQuantityCalculatorModal({ isOpen, onClose, onSave, initialData }) {
  const { formatAmount } = useSettings();
  const firstInputRef = useRef(null);

  const [rollQty, setRollQty] = useState('');
  const [meterPerRoll, setMeterPerRoll] = useState('');
  const [totalMeterManual, setTotalMeterManual] = useState('');
  const [ratePerMeter, setRatePerMeter] = useState('');
  const [discountPercent, setDiscountPercent] = useState('');
  const [gstPercent, setGstPercent] = useState('');
  const [isGstInclusive, setIsGstInclusive] = useState(false);
  
  const [isTotalMeterManual, setIsTotalMeterManual] = useState(false);
  const [rollEntries, setRollEntries] = useState([]);

  const parseDescription = (desc) => {
    if (!desc) return [];
    // Replace + with commas, then split by commas
    const parts = desc.replace(/\+/g, ',').split(',');
    const entries = [];
    for (let part of parts) {
      part = part.trim();
      if (!part) continue;
      // Match pattern: "number x number", "number * number", "number X number"
      const match = part.match(/^([\d.]+)\s*[xX*]\s*([\d.]+)$/);
      if (match) {
        const rq = parseFloat(match[1]);
        const mpr = parseFloat(match[2]);
        if (!isNaN(rq) && !isNaN(mpr)) {
          entries.push({ rollQty: rq, meterPerRoll: mpr });
        }
      }
    }
    return entries;
  };

  useEffect(() => {
    if (isOpen) {
      // 1. Try to parse from description first
      let parsed = parseDescription(initialData?.description);
      
      // 2. If no entries found in description, fallback to rollQty & meterPerRoll
      if (parsed.length === 0) {
        const r = parseFloat(initialData?.rollQty) || 0;
        const m = parseFloat(initialData?.meterPerRoll) || 0;
        if (r > 0 && m > 0) {
          parsed = [{ rollQty: r, meterPerRoll: m }];
        }
      }

      setRollEntries(parsed);
      setRollQty('');
      setMeterPerRoll('');

      if (initialData?.qty) {
         setTotalMeterManual(initialData.qty);
      } else {
         setTotalMeterManual('');
      }

      const savedPrice = parseFloat(initialData?.price) || 0;
      const savedGstRate = parseFloat(initialData?.taxRate) || 0;
      const savedIsInclusive = initialData?.isGstInclusive || false;
      
      if (savedIsInclusive && savedPrice > 0) {
          setRatePerMeter((savedPrice * (1 + (savedGstRate / 100))).toFixed(2));
      } else {
          setRatePerMeter(initialData?.price || '');
      }
      
      setDiscountPercent(initialData?.disc1 || '');
      setGstPercent(initialData?.taxRate || '');
      setIsGstInclusive(savedIsInclusive);
      setIsTotalMeterManual(false);

      setTimeout(() => {
        if (firstInputRef.current) {
          firstInputRef.current.focus();
        }
      }, 100);
    }
  }, [isOpen, initialData]);

  if (!isOpen) return null;

  const handleAddRoll = () => {
    const rq = parseFloat(rollQty);
    const mpr = parseFloat(meterPerRoll);
    if (!isNaN(rq) && !isNaN(mpr) && rq > 0 && mpr > 0) {
      setRollEntries(prev => [...prev, { rollQty: rq, meterPerRoll: mpr }]);
      setRollQty('');
      setMeterPerRoll('');
      setTimeout(() => {
        if (firstInputRef.current) {
          firstInputRef.current.focus();
        }
      }, 50);
    }
  };

  // Auto Calculations
  const entriesTotalMeter = rollEntries.reduce((sum, entry) => sum + (entry.rollQty * entry.meterPerRoll), 0);
  const currentInputMeter = (parseFloat(rollQty) || 0) * (parseFloat(meterPerRoll) || 0);

  let computedTotalMeter = 0;
  if (isTotalMeterManual && totalMeterManual !== '') {
    computedTotalMeter = parseFloat(totalMeterManual) || 0;
  } else {
    computedTotalMeter = entriesTotalMeter + currentInputMeter;
  }

  const rate = parseFloat(ratePerMeter) || 0;
  const grossAmount = computedTotalMeter * rate;
  
  const discPercent = parseFloat(discountPercent) || 0;
  const discountAmount = (grossAmount * discPercent) / 100;
  
  let taxableAmount = grossAmount - discountAmount;
  const gstRate = parseFloat(gstPercent) || 0;
  let gstAmount = 0;

  if (isGstInclusive) {
      const netAmountCalc = taxableAmount;
      taxableAmount = netAmountCalc / (1 + (gstRate / 100));
      gstAmount = netAmountCalc - taxableAmount;
  } else {
      gstAmount = (taxableAmount * gstRate) / 100;
  }
  
  const netAmount = taxableAmount + gstAmount;

  const handleKeyDown = (e, nextId) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      
      // Special behavior for Meter / Roll:
      if (e.target.id === 'calc_meterPerRoll') {
        const rq = parseFloat(rollQty);
        const mpr = parseFloat(meterPerRoll);
        if (!isNaN(rq) && !isNaN(mpr) && rq > 0 && mpr > 0) {
          handleAddRoll();
          return;
        }
      }

      // Special behavior for Roll Qty: jump to rate if empty and we have entries
      if (e.target.id === 'calc_rollQty' && rollQty === '' && rollEntries.length > 0) {
        const nextInput = document.getElementById('calc_rate');
        if (nextInput) {
          nextInput.focus();
          if (nextInput.select) nextInput.select();
        }
        return;
      }
      
      if (nextId === 'save') {
        handleSave();
      } else {
        const nextInput = document.getElementById(nextId);
        if (nextInput) {
          nextInput.focus();
          if (nextInput.select) nextInput.select();
        }
      }
    }
  };

  const handleSave = () => {
    if (computedTotalMeter < 0 || rate < 0 || discPercent < 0 || gstRate < 0) {
      alert("Negative values are not allowed.");
      return;
    }

    const finalEntries = [...rollEntries];
    const rq = parseFloat(rollQty) || 0;
    const mpr = parseFloat(meterPerRoll) || 0;
    if (rq > 0 && mpr > 0) {
      finalEntries.push({ rollQty: rq, meterPerRoll: mpr });
    }

    const finalDescription = finalEntries
      .map(entry => `${entry.rollQty} X ${entry.meterPerRoll}`)
      .join(' + ');

    const totalRollQty = finalEntries.reduce((sum, entry) => sum + entry.rollQty, 0);
    const avgMeterPerRoll = totalRollQty > 0 ? (computedTotalMeter / totalRollQty) : 0;

    onSave({
      rollQty: totalRollQty,
      meterPerRoll: avgMeterPerRoll,
      qty: computedTotalMeter, // Total Meter becomes the quantity
      price: isGstInclusive ? (rate / (1 + (gstRate/100))) : rate,
      disc1: discPercent,
      taxRate: gstRate,
      amount: netAmount,
      d1Amt: discountAmount,
      gstAmount: gstAmount,
      isGstInclusive: isGstInclusive,
      description: finalDescription || (computedTotalMeter > 0 ? `${computedTotalMeter} m` : '')
    });
  };

  return (
    <div className="fixed inset-0 z-[100] flex items-start justify-center pt-[8vh] bg-black/50 backdrop-blur-sm p-4">
      <div className="bg-white rounded-[5px] shadow-2xl w-full max-w-[min(96vw,520px)] overflow-hidden flex flex-col animate-in zoom-in-95 duration-200">
        
        {/* Header */}
        <div className="bg-[#4F46E5] px-4 py-3 flex items-center justify-between border-b border-indigo-600">
          <div className="flex items-center gap-2 text-white">
            <Calculator className="w-5 h-5" strokeWidth={2.5} />
            <h2 className="text-[16px] font-bold">Textile Quantity Calculator</h2>
          </div>
          <button onClick={onClose} className="text-white hover:text-indigo-200 transition-colors">
            <X className="w-5 h-5 font-bold" strokeWidth={3} />
          </button>
        </div>

        {/* Content */}
        <div className="p-4 sm:p-5 flex flex-col gap-4 bg-[#f8f9fa]">
          
          {/* Item Info Box */}
          <div className="bg-white p-3 rounded-[4px] border border-gray-200 shadow-sm flex flex-col gap-1">
             <div className="flex justify-between items-center">
                <span className="text-[12px] text-gray-500 font-bold uppercase tracking-wider">Item Name</span>
                <span className="text-[12px] text-gray-500 font-bold uppercase tracking-wider">HSN Code</span>
             </div>
             <div className="flex justify-between items-center">
                <span className="text-[15px] text-gray-900 font-bold">{initialData?.productName || 'Unknown Item'}</span>
                <span className="text-[14px] text-gray-700 font-medium">{initialData?.hsn || '-'}</span>
             </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-4">
            
            {/* Left Column (Inputs) */}
            <div className="space-y-4">
                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Roll Qty</label>
                  <input 
                    id="calc_rollQty"
                    ref={firstInputRef}
                    type="number" 
                    min="0"
                    step="any"
                    value={rollQty} 
                    onChange={(e) => setRollQty(e.target.value)}
                    onKeyDown={(e) => handleKeyDown(e, 'calc_meterPerRoll')}
                    className="flex-1 bg-white border border-gray-300 rounded-[3px] px-3 py-1.5 text-[14px] font-semibold text-gray-800 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                    placeholder="0"
                  />
                </div>

                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Meter / Roll</label>
                  <div className="flex-1 flex gap-1">
                    <input 
                      id="calc_meterPerRoll"
                      type="number" 
                      min="0"
                      step="any"
                      value={meterPerRoll} 
                      onChange={(e) => setMeterPerRoll(e.target.value)}
                      onKeyDown={(e) => handleKeyDown(e, 'calc_rate')}
                      className="w-full bg-white border border-gray-300 rounded-[3px] px-3 py-1.5 text-[14px] font-semibold text-gray-800 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                      placeholder="0.00"
                    />
                    <button
                      type="button"
                      onClick={handleAddRoll}
                      className="px-3 bg-indigo-600 hover:bg-indigo-700 text-white rounded-[3px] font-bold text-[16px] transition-colors flex items-center justify-center shadow-sm"
                      title="Add to History"
                    >
                      +
                    </button>
                  </div>
                </div>

                <div className="flex items-center justify-between gap-3 pt-2 border-t border-gray-200">
                  <label className="text-[13px] font-bold text-indigo-700 w-[100px]">Total Meter</label>
                  <div className="flex-1 flex gap-2">
                     <input 
                       id="calc_totalMeter"
                       type="number" 
                       min="0"
                       step="any"
                       value={isTotalMeterManual ? totalMeterManual : (computedTotalMeter || '')} 
                       onChange={(e) => {
                         setIsTotalMeterManual(true);
                         setTotalMeterManual(e.target.value);
                       }}
                       onKeyDown={(e) => handleKeyDown(e, 'calc_rate')}
                       className="w-full bg-indigo-50 border border-indigo-200 rounded-[3px] px-3 py-1.5 text-[14px] font-bold text-indigo-900 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                       placeholder="Auto"
                     />
                  </div>
                </div>
            </div>

            {/* Right Column (Financials) */}
            <div className="space-y-4">
                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Rate / Meter</label>
                  <input 
                    id="calc_rate"
                    type="number" 
                    min="0"
                    step="any"
                    value={ratePerMeter} 
                    onChange={(e) => setRatePerMeter(e.target.value)}
                    onKeyDown={(e) => handleKeyDown(e, 'calc_disc')}
                    className="flex-1 bg-white border border-gray-300 rounded-[3px] px-3 py-1.5 text-[14px] font-semibold text-gray-800 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                    placeholder="0.00"
                  />
                </div>

                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Gross Amount</label>
                  <div className="flex-1 bg-gray-100 border border-gray-200 rounded-[3px] px-3 py-1.5 text-[14px] font-bold text-gray-600 text-right select-none">
                    {formatAmount(grossAmount)}
                  </div>
                </div>

                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Discount %</label>
                  <input 
                    id="calc_disc"
                    type="number" 
                    min="0"
                    step="any"
                    value={discountPercent} 
                    onChange={(e) => setDiscountPercent(e.target.value)}
                    onKeyDown={(e) => handleKeyDown(e, 'calc_gst')}
                    className="flex-1 bg-white border border-gray-300 rounded-[3px] px-3 py-1.5 text-[14px] font-semibold text-gray-800 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                    placeholder="0"
                  />
                </div>

                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Disc. Amount</label>
                  <div className="flex-1 bg-gray-100 border border-gray-200 rounded-[3px] px-3 py-1.5 text-[14px] font-bold text-red-600 text-right select-none">
                    {formatAmount(discountAmount)}
                  </div>
                </div>
            </div>

          </div>
          
          <div className="border-t border-gray-300 my-2"></div>
          
          {/* Summary Section */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-4">
             <div className="space-y-4">
                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">Taxable Amt</label>
                  <div className="flex-1 bg-gray-100 border border-gray-200 rounded-[3px] px-3 py-1.5 text-[14px] font-bold text-gray-800 text-right select-none">
                    {formatAmount(taxableAmount)}
                  </div>
                </div>

                <div className="flex flex-col gap-1">
                  <div className="flex items-center justify-between gap-3">
                    <label className="text-[13px] font-bold text-gray-700 w-[100px]">GST %</label>
                    <input 
                      id="calc_gst"
                      type="number" 
                      min="0"
                      step="any"
                      value={gstPercent} 
                      onChange={(e) => setGstPercent(e.target.value)}
                      onKeyDown={(e) => handleKeyDown(e, 'save')}
                      className="flex-1 bg-white border border-gray-300 rounded-[3px] px-3 py-1.5 text-[14px] font-semibold text-gray-800 outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5] text-right"
                      placeholder="0"
                    />
                  </div>
                  <div className="flex justify-end mt-1">
                     <label className="flex items-center gap-1.5 cursor-pointer">
                        <input 
                           type="checkbox" 
                           checked={isGstInclusive}
                           onChange={(e) => setIsGstInclusive(e.target.checked)}
                           className="w-3.5 h-3.5 text-indigo-600 rounded border-gray-300 focus:ring-indigo-500"
                        />
                        <span className="text-[11px] font-semibold text-gray-600">GST Inclusive</span>
                     </label>
                  </div>
                </div>

                <div className="flex items-center justify-between gap-3">
                  <label className="text-[13px] font-bold text-gray-700 w-[100px]">GST Amount</label>
                  <div className="flex-1 bg-gray-100 border border-gray-200 rounded-[3px] px-3 py-1.5 text-[14px] font-bold text-gray-600 text-right select-none">
                    {formatAmount(gstAmount)}
                  </div>
                </div>
             </div>
             
             <div className="flex flex-col justify-between h-full min-h-[160px]">
                {/* Roll Details History */}
                <div className="bg-white border border-gray-200 rounded-[4px] p-2.5 shadow-sm flex-1 flex flex-col overflow-hidden mb-3">
                   <div className="text-[11px] font-bold text-gray-500 uppercase tracking-wider mb-1.5 border-b border-gray-100 pb-1 flex justify-between items-center">
                      <span>Roll History</span>
                      {rollEntries.length > 0 && (
                         <button
                            type="button"
                            onClick={() => setRollEntries([])}
                            className="text-red-500 hover:text-red-700 text-[10px] font-bold uppercase tracking-wider"
                         >
                            Clear All
                         </button>
                      )}
                   </div>
                   <div className="flex-1 overflow-y-auto pr-1 space-y-1">
                      {rollEntries.length === 0 && !rollQty && !meterPerRoll ? (
                         <div className="text-gray-400 text-[11px] italic my-auto text-center py-2">
                            No rolls added yet
                         </div>
                      ) : (
                         <>
                            {rollEntries.map((entry, index) => (
                               <div key={index} className="flex justify-between items-center bg-gray-50 px-2 py-0.5 rounded border border-gray-100 text-[12px] font-semibold text-gray-700">
                                  <span>{entry.rollQty} × {entry.meterPerRoll}</span>
                                  <div className="flex items-center gap-1.5">
                                     <span className="text-gray-500">{(entry.rollQty * entry.meterPerRoll).toFixed(2)} m</span>
                                     <button 
                                        type="button"
                                        onClick={() => {
                                           setRollEntries(prev => prev.filter((_, i) => i !== index));
                                        }}
                                        className="text-red-500 hover:text-red-700 font-bold text-[14px] leading-none px-1"
                                     >
                                        &times;
                                     </button>
                                  </div>
                                </div>
                            ))}
                            {rollQty && meterPerRoll && (
                               <div className="flex justify-between items-center bg-indigo-50/50 px-2 py-0.5 rounded border border-indigo-100/50 border-dashed text-[12px] font-semibold text-indigo-600">
                                  <span>{rollQty} × {meterPerRoll} (Draft)</span>
                                  <span>{(parseFloat(rollQty) * parseFloat(meterPerRoll) || 0).toFixed(2)} m</span>
                               </div>
                            )}
                         </>
                      )}
                   </div>
                </div>

                <div className="bg-[#e8f5e9] border border-[#c3e6cb] rounded-[4px] p-3 flex flex-col items-center justify-center">
                   <span className="text-[12px] font-bold text-[#155724] uppercase tracking-wider mb-0.5">Net Amount</span>
                   <span className="text-[26px] font-bold text-[#155724] leading-none">
                      {formatAmount(netAmount)}
                   </span>
                </div>
             </div>
          </div>

        </div>

        {/* Footer */}
        <div className="px-4 py-3 bg-gray-50 border-t border-gray-200 flex justify-end gap-2">
          <button 
            onClick={onClose}
            className="px-4 py-1.5 bg-white border border-gray-300 text-gray-700 rounded-[3px] text-[13px] font-bold hover:bg-gray-50 transition-colors"
          >
            Cancel
          </button>
          <button 
            id="save"
            onClick={handleSave}
            className="flex items-center gap-1.5 px-6 py-1.5 bg-[#28a745] hover:bg-[#218838] text-white rounded-[3px] text-[13px] font-bold transition-colors shadow-sm"
          >
            <Save className="w-4 h-4" />
            Apply to Invoice
          </button>
        </div>

      </div>
    </div>
  );
}
