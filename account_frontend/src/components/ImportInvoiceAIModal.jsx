import React, { useState, useRef, useEffect } from 'react';
import { X, UploadCloud, FileText, CheckCircle, Loader2, Key, MessageSquare, Zap, Check, Settings, Eye, EyeOff, File, Sparkles } from 'lucide-react';
import apiClient from '../api/apiClient';

export function ImportInvoiceAIModal({ isOpen, onClose, onDataExtracted }) {
  const [selectedFile, setSelectedFile] = useState(null);
  const [isProcessing, setIsProcessing] = useState(false);
  const [statusMessage, setStatusMessage] = useState('');
  const [provider, setProvider] = useState('Gemini');
  const [apiKey, setApiKey] = useState('');
  const [showApiKey, setShowApiKey] = useState(false);
  const [instructions, setInstructions] = useState('');
  const [dragActive, setDragActive] = useState(false);
  
  const fileInputRef = useRef(null);

  useEffect(() => {
    // Load saved API key from local storage
    const savedKey = localStorage.getItem('geminiApiKey');
    if (savedKey) {
      setApiKey(savedKey);
    }
  }, []);

  if (!isOpen) return null;

  const handleFileChange = (e) => {
    if (e.target.files && e.target.files.length > 0) {
      setSelectedFile(e.target.files[0]);
    }
  };

  const handleClose = () => {
    if (isProcessing) return;
    setSelectedFile(null);
    setIsProcessing(false);
    setStatusMessage('');
    setInstructions('');
    onClose();
  };

  const handleSaveKey = () => {
    if (apiKey.trim()) {
      localStorage.setItem('geminiApiKey', apiKey.trim());
      alert('API Key saved securely in your browser!');
    } else {
      localStorage.removeItem('geminiApiKey');
      alert('API Key removed.');
    }
  };

  const handleProcess = async () => {
    if (!selectedFile) {
      alert("Please select a file to upload first.");
      return;
    }
    
    if (provider === 'Gemini' && !apiKey.trim()) {
       alert("Please enter and save your Gemini API Key first.");
       return;
    }

    setIsProcessing(true);
    setStatusMessage('Analyzing Document...');

    const formData = new FormData();
    formData.append('file', selectedFile);
    formData.append('apiKey', apiKey.trim());
    formData.append('provider', provider);
    if (instructions.trim()) {
      formData.append('instructions', instructions.trim());
    }

    try {
      const response = await apiClient.post('/import/ai-invoice', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });

      if (response.data.success) {
        setStatusMessage('Structuring Data...');
        setTimeout(() => {
          if (onDataExtracted) {
            onDataExtracted(response.data.data);
          }
          handleClose();
        }, 500);
      } else {
        alert(response.data.message || 'Failed to process invoice.');
        setIsProcessing(false);
      }
    } catch (error) {
      console.error('Error processing AI Invoice:', error);
      alert(error.response?.data?.message || 'An error occurred while connecting to the AI server.');
      setIsProcessing(false);
    }
  };

  const handleDrag = (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  const handleDrop = (e) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);
    if (isProcessing) return;
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      setSelectedFile(e.dataTransfer.files[0]);
    }
  };

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 sm:p-6 bg-slate-900/60 backdrop-blur-md transition-all">
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-[600px] flex flex-col overflow-hidden animate-in fade-in zoom-in-95 duration-300">
        
        {/* Header */}
        <div className="bg-gradient-to-r from-indigo-600 to-purple-600 px-5 py-4 flex items-center justify-between relative overflow-hidden">
          <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full blur-2xl -mr-10 -mt-10 pointer-events-none"></div>
          <div className="flex items-center gap-3 relative z-10">
            <div className="bg-white/20 p-2 rounded-lg backdrop-blur-sm shadow-sm">
              <Sparkles className="w-5 h-5 text-white" strokeWidth={2.5} />
            </div>
            <div>
              <h2 className="text-[18px] text-white font-bold tracking-wide leading-tight">AI Invoice Import</h2>
              <p className="text-indigo-100 text-[12px] font-medium opacity-90">Auto-fill details in seconds</p>
            </div>
          </div>
          <button 
            onClick={handleClose}
            disabled={isProcessing}
            className="text-white hover:bg-white/20 p-2 rounded-full transition-all flex items-center justify-center disabled:opacity-50 relative z-10"
          >
            <X className="w-5 h-5" strokeWidth={2.5} />
          </button>
        </div>

        {/* Body */}
        <div className="p-5 sm:p-6 flex flex-col gap-5 sm:gap-6 bg-slate-50 max-h-[75vh] overflow-y-auto custom-scrollbar">
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            {/* AI Provider Section */}
            <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm transition-all hover:shadow-md">
              <div className="flex items-center gap-2 mb-3">
                <Settings className="w-4 h-4 text-indigo-500" />
                <h3 className="text-[13px] font-bold text-slate-700 uppercase tracking-wider">AI Engine</h3>
              </div>
              <div className="grid grid-cols-2 gap-3">
                  <button 
                    onClick={() => setProvider('Gemini')}
                    className={`flex flex-col items-center justify-center py-2.5 rounded-lg border-2 transition-all duration-200 ${provider === 'Gemini' ? 'border-indigo-500 bg-indigo-50 text-indigo-700 shadow-sm scale-[1.02]' : 'border-slate-100 bg-slate-50 text-slate-500 hover:border-indigo-200 hover:bg-white'}`}
                  >
                    <div className="flex items-center gap-1.5 font-bold text-[14px]">
                      <span className="text-lg leading-none">♊</span> Gemini
                    </div>
                    <span className={`text-[10px] font-medium mt-0.5 ${provider === 'Gemini' ? 'text-indigo-500' : 'text-slate-400'}`}>Recommended</span>
                  </button>
                  <button 
                    onClick={() => setProvider('Groq')}
                    className={`flex flex-col items-center justify-center py-2.5 rounded-lg border-2 transition-all duration-200 ${provider === 'Groq' ? 'border-indigo-500 bg-indigo-50 text-indigo-700 shadow-sm scale-[1.02]' : 'border-slate-100 bg-slate-50 text-slate-500 hover:border-indigo-200 hover:bg-white'}`}
                  >
                    <div className="flex items-center gap-1.5 font-bold text-[14px]">
                      <Zap className="w-4 h-4" /> Groq
                    </div>
                    <span className={`text-[10px] font-medium mt-0.5 ${provider === 'Groq' ? 'text-indigo-500' : 'text-slate-400'}`}>Fast processing</span>
                  </button>
              </div>
            </div>

            {/* API Key Section */}
            <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm transition-all hover:shadow-md flex flex-col justify-center">
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-2">
                  <Key className="w-4 h-4 text-indigo-500" />
                  <h3 className="text-[13px] font-bold text-slate-700 uppercase tracking-wider">{provider} Key</h3>
                </div>
              </div>
              
              <div className="flex items-stretch gap-0 border border-slate-300 rounded-lg overflow-hidden focus-within:border-indigo-500 focus-within:ring-2 focus-within:ring-indigo-100 transition-all bg-white shadow-inner">
                <div className="relative flex-1">
                  <input 
                    type={showApiKey ? 'text' : 'password'}
                    value={apiKey}
                    onChange={(e) => setApiKey(e.target.value)}
                    placeholder={`Paste ${provider} Key...`}
                    className="w-full h-full px-3 py-2.5 outline-none text-[13px] bg-transparent text-slate-700 placeholder-slate-400"
                  />
                  <button 
                    type="button"
                    onClick={() => setShowApiKey(!showApiKey)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-indigo-500 transition-colors"
                  >
                    {showApiKey ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </button>
                </div>
                <button 
                  onClick={handleSaveKey}
                  className="bg-slate-100 hover:bg-indigo-50 text-indigo-600 px-3 py-2.5 text-[12px] font-bold transition-colors border-l border-slate-300 flex items-center justify-center"
                >
                  SAVE
                </button>
              </div>
            </div>
          </div>

          {/* File Upload Section */}
          <div className="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden transition-all hover:shadow-md">
             {selectedFile ? (
               <div className="bg-gradient-to-r from-blue-50 to-indigo-50 p-5 flex flex-col sm:flex-row items-center sm:justify-between border border-blue-100 gap-4">
                  <div className="flex items-center gap-4 w-full">
                    <div className="bg-white p-3 rounded-xl shadow-sm border border-blue-100 flex-shrink-0">
                      <File className="w-8 h-8 text-indigo-500" />
                    </div>
                    <div className="flex flex-col overflow-hidden w-full">
                      <div className="flex items-center gap-1.5 text-indigo-600 font-bold text-[12px] uppercase tracking-wider mb-0.5">
                        <CheckCircle className="w-3.5 h-3.5" /> Ready to process
                      </div>
                      <span className="text-[14px] text-slate-800 font-bold truncate" title={selectedFile.name}>
                        {selectedFile.name}
                      </span>
                      <span className="text-[11px] text-slate-500 font-medium">
                        {(selectedFile.size / 1024 / 1024).toFixed(2)} MB
                      </span>
                    </div>
                  </div>
                  <button 
                    onClick={() => !isProcessing && fileInputRef.current?.click()}
                    disabled={isProcessing}
                    className="flex-shrink-0 px-4 py-2 bg-white border border-slate-200 rounded-lg text-[12px] font-bold text-slate-600 hover:bg-slate-50 hover:text-indigo-600 transition-colors shadow-sm disabled:opacity-50 w-full sm:w-auto"
                  >
                    Change File
                  </button>
                  <input type="file" ref={fileInputRef} className="hidden" accept=".pdf,.jpg,.jpeg,.png" onChange={handleFileChange} disabled={isProcessing} />
               </div>
             ) : (
                <div 
                  className={`p-8 sm:p-10 flex flex-col items-center justify-center cursor-pointer group transition-all duration-300 border-2 border-dashed mx-4 my-4 rounded-xl
                    ${isProcessing ? 'opacity-50 pointer-events-none' : ''} 
                    ${dragActive ? 'border-indigo-500 bg-indigo-50 scale-[1.01]' : 'border-slate-300 hover:border-indigo-400 hover:bg-indigo-50/30'}`}
                  onClick={() => !isProcessing && fileInputRef.current?.click()}
                  onDragEnter={handleDrag}
                  onDragLeave={handleDrag}
                  onDragOver={handleDrag}
                  onDrop={handleDrop}
                >
                  <input type="file" ref={fileInputRef} className="hidden" accept=".pdf,.jpg,.jpeg,.png" onChange={handleFileChange} disabled={isProcessing} />
                  
                  <div className={`w-16 h-16 bg-white shadow-sm border border-slate-100 rounded-full flex items-center justify-center mb-4 transition-transform duration-300 ${dragActive ? 'scale-110 shadow-md' : 'group-hover:scale-110 group-hover:shadow-md'}`}>
                    <UploadCloud className={`w-8 h-8 ${dragActive ? 'text-indigo-600' : 'text-slate-400 group-hover:text-indigo-500'} transition-colors`} />
                  </div>
                  
                  <span className="text-[15px] font-bold text-slate-700 text-center">
                    Drag & drop your bill here
                  </span>
                  <span className="text-[13px] font-medium text-indigo-500 mt-1 mb-2 text-center">
                    or click to browse from device
                  </span>
                  <div className="flex items-center gap-2 mt-2">
                    <span className="px-2 py-1 bg-slate-100 text-slate-500 text-[10px] font-bold rounded uppercase tracking-wider">PDF</span>
                    <span className="px-2 py-1 bg-slate-100 text-slate-500 text-[10px] font-bold rounded uppercase tracking-wider">JPG</span>
                    <span className="px-2 py-1 bg-slate-100 text-slate-500 text-[10px] font-bold rounded uppercase tracking-wider">PNG</span>
                  </div>
                </div>
             )}
             
             {isProcessing && (
               <div className="flex flex-col items-center justify-center gap-3 p-6 border-t border-slate-100 bg-gradient-to-r from-indigo-50 via-purple-50 to-indigo-50 animate-pulse">
                 <Loader2 className="w-8 h-8 text-indigo-600 animate-spin" />
                 <span className="text-[14px] font-bold text-indigo-700">{statusMessage}</span>
               </div>
             )}
          </div>

          {/* Additional Instructions */}
          <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-sm flex flex-col gap-3 transition-all hover:shadow-md">
             <div className="flex items-center gap-2">
               <MessageSquare className="w-4 h-4 text-indigo-500" />
               <h3 className="text-[13px] font-bold text-slate-700 uppercase tracking-wider">Custom Prompt <span className="text-slate-400 font-medium normal-case">(Optional)</span></h3>
             </div>
             <textarea 
               value={instructions}
               onChange={(e) => setInstructions(e.target.value)}
               disabled={isProcessing}
               placeholder="E.g., Only extract the first 3 items..."
               className="w-full bg-slate-50 border border-slate-200 rounded-lg p-3 text-[13px] text-slate-700 placeholder-slate-400 outline-none focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-100 min-h-[70px] resize-none disabled:bg-slate-100 transition-all"
             />
          </div>

        </div>

        {/* Footer */}
        <div className="bg-slate-50 border-t border-slate-200 px-5 py-4 flex flex-col-reverse sm:flex-row justify-end gap-3 rounded-b-2xl">
          <button 
            onClick={handleClose}
            disabled={isProcessing}
            className="w-full sm:w-auto bg-white border border-slate-300 hover:bg-slate-100 hover:text-slate-900 text-slate-700 px-6 py-2.5 rounded-lg text-[14px] font-bold transition-colors shadow-sm disabled:opacity-50 flex items-center justify-center gap-2"
          >
            Cancel
          </button>
          <button 
            onClick={handleProcess}
            disabled={isProcessing || !selectedFile}
            className={`w-full sm:w-auto flex items-center justify-center gap-2 px-8 py-2.5 rounded-lg text-[14px] font-bold shadow-md transition-all duration-200
              ${(isProcessing || !selectedFile) 
                ? 'bg-slate-300 text-slate-500 cursor-not-allowed opacity-70' 
                : 'bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white hover:shadow-lg hover:-translate-y-0.5'}`}
          >
            {isProcessing ? (
              <>
                <Loader2 className="w-4 h-4 animate-spin" /> Processing...
              </>
            ) : (
              <>
                <Sparkles className="w-4 h-4" /> Extract Data
              </>
            )}
          </button>
        </div>

      </div>
    </div>
  );
}
