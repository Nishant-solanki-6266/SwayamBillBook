import React, { useState, useEffect } from 'react';
import { X } from 'lucide-react';

export function VoucherMasterModal({ isOpen, onClose, onSave, editData }) {
  const [voucherId, setVoucherId] = useState('1');
  const [voucherType, setVoucherType] = useState('');
  const [voucherHead, setVoucherHead] = useState('');

  useEffect(() => {
    if (isOpen) {
      if (editData) {
        setVoucherId(editData.voucherId || '1');
        setVoucherType(editData.voucherType || '');
        setVoucherHead(editData.voucherHead || '');
      } else {
        setVoucherId('1');
        setVoucherType('');
        setVoucherHead('');
      }
    }
  }, [isOpen, editData]);

  if (!isOpen) return null;

  const handleSubmit = () => {
    if (!voucherHead && !voucherId) {
      // it can be empty
    }
    onSave({ voucherId, voucherHead });
  };

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center p-4 bg-black/40">
      <div className="bg-white rounded-[3px] shadow-2xl w-full max-w-[450px] flex flex-col overflow-hidden animate-in fade-in zoom-in duration-200">
        
        {/* Header */}
        <div className="bg-[#4F46E5] flex items-center justify-between">
          <h2 className="text-[15px] text-white font-medium tracking-wide pl-4 py-2.5">
            Voucher Master
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
              placeholder="Enter Voucher Head (e.g. INV/26-27/)"
              className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5] bg-[#cce5ff]"
            />
          </div>
          
          <div className="flex flex-col gap-1">
            <label className="text-[13px] font-bold text-gray-800">Voucher Id</label>
            <input 
              type="number" 
              value={voucherId}
              onChange={(e) => setVoucherId(e.target.value)}
              placeholder="e.g. 501"
              className="w-full border border-gray-300 rounded-[3px] px-3 py-2 text-[13px] outline-none focus:border-[#4F46E5]"
            />
          </div>
        </div>

        {/* Footer */}
        <div className="bg-[#f8f9fa] px-4 py-3 flex justify-end gap-2 border-t border-gray-200">
          <button 
            onClick={handleSubmit}
            className="bg-[#ffc107] hover:bg-[#e0a800] text-gray-900 px-5 py-[7px] rounded-[3px] text-[14px] font-medium transition-colors shadow-sm"
          >
            Update
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
