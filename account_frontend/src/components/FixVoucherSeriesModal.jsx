import React, { useState, useEffect } from 'react';
import { X } from 'lucide-react';

export function FixVoucherSeriesModal({ isOpen, onClose, onSave, voucherData }) {
  const [voucherHead, setVoucherHead] = useState('');
  const [fromDate, setFromDate] = useState('');
  const [toDate, setToDate] = useState('');
  const [startOffset, setStartOffset] = useState('1');

  useEffect(() => {
    if (isOpen && voucherData) {
      setVoucherHead(voucherData.voucherHead || '');
      setStartOffset(voucherData.voucherId || '1');
      // Set some default dates if you want
      const today = new Date();
      setFromDate(today.toISOString().split('T')[0]);
      setToDate(today.toISOString().split('T')[0]);
    }
  }, [isOpen, voucherData]);

  if (!isOpen) return null;

  const handleSubmit = () => {
    onSave({
      voucherType: voucherData.voucherType,
      voucherHead,
      fromDate,
      toDate,
      startOffset
    });
  };

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center p-4 bg-black/40">
      <div className="bg-white rounded-[3px] shadow-2xl w-full max-w-[500px] flex flex-col overflow-hidden animate-in fade-in zoom-in duration-200">
        
        {/* Header */}
        <div className="bg-[#4F46E5] flex items-center justify-between">
          <h2 className="text-[15px] text-white font-medium tracking-wide pl-4 py-2.5">
            Fix Voucher Series — {voucherData?.voucherType}
          </h2>
          <button 
            onClick={onClose} 
            className="bg-[#dc3545] hover:bg-[#c82333] h-full px-3 py-2.5 focus:outline-none transition-colors"
          >
            <X className="w-5 h-5 text-white" strokeWidth={3} />
          </button>
        </div>

        {/* Body */}
        <div className="p-5 bg-white flex flex-col gap-4">
          <div className="flex flex-col gap-1">
            <label className="text-[13px] font-bold text-gray-800">Voucher Head</label>
            <input 
              type="text" 
              value={voucherHead}
              onChange={(e) => setVoucherHead(e.target.value)}
              placeholder="e.g. 26-27/"
              className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5]"
            />
            <span className="text-[11px] text-gray-500">Loaded from Invoice Setting (editable).</span>
          </div>
          
          <div className="grid grid-cols-2 gap-4">
            <div className="flex flex-col gap-1">
              <label className="text-[13px] font-bold text-gray-800">From Date</label>
              <input 
                type="date" 
                value={fromDate}
                onChange={(e) => setFromDate(e.target.value)}
                className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5]"
              />
            </div>
            <div className="flex flex-col gap-1">
              <label className="text-[13px] font-bold text-gray-800">To Date</label>
              <input 
                type="date" 
                value={toDate}
                onChange={(e) => setToDate(e.target.value)}
                className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5]"
              />
            </div>
          </div>

          <div className="flex flex-col gap-1">
            <label className="text-[13px] font-bold text-gray-800">Start Offset</label>
            <input 
              type="number" 
              value={startOffset}
              onChange={(e) => setStartOffset(e.target.value)}
              className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5]"
            />
            <span className="text-[11px] text-gray-500">Max series before From Date (auto). First invoice in range will be {startOffset}.</span>
          </div>
        </div>

        {/* Footer */}
        <div className="bg-[#f8f9fa] px-4 py-3 flex justify-end gap-2 border-t border-gray-200">
          <button 
            onClick={handleSubmit}
            className="bg-[#007bff] hover:bg-[#0069d9] text-white px-5 py-[7px] rounded-[3px] text-[14px] font-medium transition-colors shadow-sm"
          >
            Preview
          </button>
          <button 
            onClick={onClose}
            className="bg-[#dc3545] hover:bg-[#c82333] text-white px-5 py-[7px] rounded-[3px] text-[14px] font-medium transition-colors shadow-sm"
          >
            Close
          </button>
        </div>

      </div>
    </div>
  );
}
