import React, { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { RefreshCw, X, Settings, Check, Printer, Type, QrCode, Image as ImageIcon, Square, Circle, Minus, Save, ChevronDown, ChevronUp, Barcode as BarcodeIcon, Info, Eye, Edit, Trash2, ScanBarcode } from 'lucide-react';
import { QRCodeSVG } from 'qrcode.react';
import Barcode from 'react-barcode';
import { getBarcodeSettings } from '../api/barcodeSettings';
import { cn } from '../utils';
import apiClient from '../api/apiClient';
import { ProductSelectDropdown } from '../components/ProductSelectDropdown';
import { ItemMasterModal } from '../components/ItemMasterModal';
import PageSettingModal from '../components/PageSettingModal';

// Custom YouTube SVG Icon
const YoutubeIcon = ({ className }) => (
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className={className}>
    <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
  </svg>
);

export function BarcodePage() {
  const navigate = useNavigate();
  const [isManufactureProduct, setIsManufactureProduct] = useState(false);
  const [isSpecialCommision, setIsSpecialCommision] = useState(false);
  const [isPageSettingModalOpen, setIsPageSettingModalOpen] = useState(false);
  const [mfgDate, setMfgDate] = useState('2026-06-03');
  const [showTemplates, setShowTemplates] = useState(false);
  const [showDesigner, setShowDesigner] = useState(false);
  const [zoom, setZoom] = useState(200);

  // Template Designer States
  const [elements, setElements] = useState([]);
  const [selectedId, setSelectedId] = useState(null);
  const [showGrid, setShowGrid] = useState(true);
  const [snapToGrid, setSnapToGrid] = useState(true);
  const [gridSize, setGridSize] = useState('1mm');
  const [templateName, setTemplateName] = useState('');

  // Page Setup Panel States
  const [showPageSetup, setShowPageSetup] = useState(false);
  const [activePreset, setActivePreset] = useState('50mm x 25mm');
  const [pageWidth, setPageWidth] = useState('50mm');
  const [pageHeight, setPageHeight] = useState('25mm');
  const [leftMargin, setLeftMargin] = useState('0.5mm');
  const [rightMargin, setRightMargin] = useState('0.5mm');
  const [labelGap, setLabelGap] = useState('1mm');
  const [heightGap, setHeightGap] = useState('1mm');
  const [labelCount, setLabelCount] = useState('1');
  const [pageBreak, setPageBreak] = useState('No');
  const [printerType, setPrinterType] = useState('A4 Sheet');

  // Integration States
  const [products, setProducts] = useState([]);
  const [units, setUnits] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState('');
  const [selectedUnit, setSelectedUnit] = useState('');
  const [searchMode, setSearchMode] = useState('Product Name');
  const [printList, setPrintList] = useState([]);
  const [editingItem, setEditingItem] = useState(null);
  const [viewingItem, setViewingItem] = useState(null);
  const [isItemModalOpen, setIsItemModalOpen] = useState(false);
  const [itemModalData, setItemModalData] = useState(null);
  const [printRowModal, setPrintRowModal] = useState(null);
  const [printRowQty, setPrintRowQty] = useState(1);

  // Form Fields mapped to product
  const [barcodeInput, setBarcodeInput] = useState('');
  const [mrpInput, setMrpInput] = useState('0');
  const [salePriceInput, setSalePriceInput] = useState('0');
  const [wholesalePriceInput, setWholesalePriceInput] = useState('0');
  const [printQty, setPrintQty] = useState('0');
  const [batchNoInput, setBatchNoInput] = useState('');

  // Active Template State
  const [templates, setTemplates] = useState([]);
  const [selectedTemplateName, setSelectedTemplateName] = useState('');
  const [activeTemplate, setActiveTemplate] = useState(null);

  const location = useLocation();

  useEffect(() => {
    fetchInitialData();
    if (location.state && location.state.invoiceItems) {
      const initialItems = location.state.invoiceItems.map((item, index) => ({
        id: Date.now() + index,
        productId: item.productId,
        name: item.name || 'Unknown',
        barcode: item.barcode || '',
        quantity: item.quantity || 1,
        salePrice: item.salePrice || 0,
        mrp: item.mrp || 0,
        unit: item.unit || item.unitName || '',
        category: item.category || item.categoryName || '',
        brand: item.brand || item.brandName || '',
        size: item.size || '',
        color: item.color || '',
        batchNo: item.batchNo || item.batch_no || '',
        imei: item.imei || '',
        location: item.location || item.rack || ''
      }));
      setPrintList(initialItems);
    }
  }, [location.state]);

  useEffect(() => {
    const tmpl = templates.find(t => t.name === selectedTemplateName);
    setActiveTemplate(tmpl || null);
    if (tmpl) {
      setPrinterType(tmpl.barcodeFormat === 'Thermal Roll' ? 'Thermal Roll' : 'A4 Sheet');
    }
  }, [selectedTemplateName, templates]);

  const fetchInitialData = async () => {
    try {
      const [prodRes, unitRes, templateRes] = await Promise.all([
        apiClient.get('/products'),
        apiClient.get('/units'),
        getBarcodeSettings()
      ]);
      setProducts(prodRes.data?.data || prodRes.data?.products || (Array.isArray(prodRes.data) ? prodRes.data : []));
      setUnits(unitRes.data?.data || (Array.isArray(unitRes.data) ? unitRes.data : []));
      if (templateRes && templateRes.success) {
        setTemplates(templateRes.data);
        if (templateRes.data.length > 0) {
          setSelectedTemplateName(templateRes.data[0].name);
        }
      }
    } catch (error) {
      console.error('Error fetching initial data:', error);
    }
  };

  const handleProductSelect = (e) => {
    const prodId = e.target.value;
    setSelectedProduct(prodId);
    if (prodId) {
      const prod = products.find(p => p.id.toString() === prodId.toString());
      if (prod) {
        setBarcodeInput(prod.barcode || '');
        setMrpInput(prod.mrp?.toString() || '0');
        setSalePriceInput(prod.salesPrice?.toString() || prod.price?.toString() || '0');
        setWholesalePriceInput(prod.wholesalePrice?.toString() || '0');
        setBatchNoInput(prod.batchNo?.toString() || prod.batch_no?.toString() || '');
        const unit = units.find(u => u.id.toString() === prod.unitId?.toString());
        setSelectedUnit(unit ? unit.name : (prod.unitId?.toString() || ''));
      }
    } else {
      setBarcodeInput('');
      setMrpInput('0');
      setSalePriceInput('0');
      setWholesalePriceInput('0');
      setBatchNoInput('');
      setSelectedUnit('');
    }
  };

  const handleAddToList = async () => {
    if (!selectedProduct) return alert('Please select a product');
    if (!printQty || parseInt(printQty) <= 0) return alert('Please enter a valid quantity');

    const prod = products.find(p => p.id.toString() === String(selectedProduct));
    
    if (prod && barcodeInput && prod.barcode !== barcodeInput) {
      try {
        await apiClient.put(`/products/${prod.id}`, { barcode: barcodeInput });
        prod.barcode = barcodeInput;
      } catch (err) {
        console.error('Failed to persist barcode to backend:', err);
      }
    }

    const newItem = {
      id: Date.now(),
      productId: selectedProduct,
      name: prod?.name || 'Unknown',
      barcode: barcodeInput || prod?.barcode || '',
      quantity: printQty,
      salePrice: salePriceInput,
      mrp: mrpInput,
      unit: selectedUnit,
      category: prod?.category?.name || prod?.category || '',
      brand: prod?.brand?.name || prod?.brand || '',
      size: prod?.size || '',
      color: prod?.color || '',
      batchNo: batchNoInput || prod?.batchNo || prod?.batch_no || '',
      imei: prod?.imei || '',
      location: prod?.location || prod?.rack || ''
    };
    setPrintList([...printList, newItem]);

    // Reset selection if needed, or keep it
    setPrintQty('0');
  };

  const handleRemoveFromList = (id) => {
    setPrintList(printList.filter(item => item.id !== id));
  };

  const handleEditItem = (item) => {
    setEditingItem(item);
  };

  const handleViewItem = (item) => {
    setViewingItem(item);
  };

  const handlePresetClick = (preset) => {
    setActivePreset(preset);
    if (preset === '50mm x 25mm') {
      setPageWidth('50mm');
      setPageHeight('25mm');
      setLeftMargin('0.5mm');
      setRightMargin('0.5mm');
      setLabelGap('1mm');
      setHeightGap('1mm');
      setLabelCount('1');
    } else if (preset === '38mm x 25mm') {
      setPageWidth('38mm');
      setPageHeight('25mm');
      setLeftMargin('0.5mm');
      setRightMargin('0.5mm');
      setLabelGap('1mm');
      setHeightGap('1mm');
      setLabelCount('1');
    } else if (preset === '38mm x 25mm (2 Labels)') {
      setPageWidth('78mm');
      setPageHeight('25mm');
      setLeftMargin('0.5mm');
      setRightMargin('0.5mm');
      setLabelGap('2mm');
      setHeightGap('1mm');
      setLabelCount('2');
    } else if (preset === '100mm x 50mm') {
      setPageWidth('100mm');
      setPageHeight('50mm');
      setLeftMargin('1mm');
      setRightMargin('1mm');
      setLabelGap('2mm');
      setHeightGap('2mm');
      setLabelCount('1');
    }
  };

  const getParsedElements = (tmpl) => {
    if (!tmpl || !tmpl.elements) return [];
    if (Array.isArray(tmpl.elements)) return tmpl.elements;
    if (typeof tmpl.elements === 'string') {
      try {
        const parsed = JSON.parse(tmpl.elements);
        return Array.isArray(parsed) ? parsed : [];
      } catch (e) {
        return [];
      }
    }
    return [];
  };

  const renderTemplateElement = (el, prodData, tmpl) => {
    if (!el) return null;

    // Check Settings Toggles
    if (el.type === 'barcode' || el.type === 'qrcode') {
      if (tmpl?.hideBarcode === true) return null;
    }

    if (el.type === 'text') {
      if (el.field === 'Category' && tmpl?.showCategory === false) return null;
      if (el.field === 'Brand' && tmpl?.showBrand === false) return null;
      if (el.field === 'Location' && tmpl?.showLocation === false) return null;
      if (el.field === 'GRN Number' && tmpl?.grnNumber === false) return null;
      if (el.field === 'Batch No' && tmpl?.showBatchNo === false) return null;
      if (el.field === 'Size' && tmpl?.showSize === false) return null;
      if (el.field === 'Color' && tmpl?.showColor === false) return null;
      if (el.field === 'Unit' && tmpl?.showUnit === false) return null;
      if (el.field === 'MRP' && tmpl?.showMRP === false) return null;
      if (el.field === 'Sale Price' && tmpl?.showSalePrice === false) return null;
      if (el.field === 'Whole Sale Price' && tmpl?.showWholeSalePrice === false) return null;
      if (el.field === 'Company Name' && tmpl?.showHeading === false) return null;
    }

    const leftMm = (el.x / 6).toFixed(2);
    const topMm = (el.y / 6).toFixed(2);
    const widthMm = (el.width / 6).toFixed(2);
    const heightMm = (el.height / 6).toFixed(2);

    let content = null;

    if (el.type === 'text') {
      let displayText = el.text || '';
      if (el.field === 'Product Name') {
        displayText = prodData.name || 'Product Name';
      } else if (el.field === 'MRP') {
        displayText = `MRP: ₹${prodData.mrp ?? 0}`;
      } else if (el.field === 'Sale Price') {
        displayText = `Price: ₹${prodData.salePrice ?? 0}`;
      } else if (el.field === 'Whole Sale Price') {
        displayText = `Wholesale: ₹${prodData.wholesalePrice ?? 0}`;
      } else if (el.field === 'Company Name') {
        displayText = tmpl?.barcodeHeading || 'SWAYAM BILL';
      } else if (el.field === 'Barcode Number') {
        displayText = prodData.barcode || '12345678';
      } else if (el.field === 'Category') {
        displayText = prodData.category ? `Cat: ${prodData.category}` : '';
      } else if (el.field === 'Brand') {
        displayText = prodData.brand ? `Brand: ${prodData.brand}` : '';
      } else if (el.field === 'Unit') {
        displayText = prodData.unit ? `Unit: ${prodData.unit}` : '';
      } else if (el.field === 'Batch No') {
        displayText = prodData.batchNo ? `Batch: ${prodData.batchNo}` : '';
      } else if (el.field === 'Location') {
        displayText = prodData.location ? `Loc: ${prodData.location}` : '';
      } else if (el.field === 'Size') {
        displayText = prodData.size ? `Size: ${prodData.size}` : '';
      } else if (el.field === 'Color') {
        displayText = prodData.color ? `Color: ${prodData.color}` : '';
      } else if (el.field === 'GRN Number') {
        displayText = prodData.grn ? `GRN: ${prodData.grn}` : '';
      }

      content = (
        <span
          className="truncate w-full block font-bold"
          style={{
            fontSize: `${el.fontSize || 12}px`,
            color: '#000000',
            lineHeight: 1.1
          }}
        >
          {displayText}
        </span>
      );
    } else if (el.type === 'barcode') {
      const bValue = String(prodData.barcode || el.text || '12345678').trim();
      content = (
        <div className="w-full h-full flex items-center justify-center overflow-hidden [&>svg]:w-full [&>svg]:h-full">
          <Barcode
            value={bValue}
            width={Math.max(0.6, el.width / 140)}
            height={Math.max(10, el.height - 14)}
            fontSize={Math.min(10, Math.max(7, Math.round(el.fontSize || 9)))}
            margin={0}
            displayValue={true}
            background="transparent"
          />
        </div>
      );
    } else if (el.type === 'qrcode') {
      const qrValue = prodData.barcode
        ? `${window.location.origin}/product/${encodeURIComponent(prodData.barcode)}`
        : (el.text || '12345');
      content = (
        <div className="w-full h-full flex items-center justify-center overflow-hidden">
          <QRCodeSVG
            value={qrValue}
            size={Math.min(Math.round(el.width * 0.95), Math.round(el.height * 0.95))}
            level="M"
            includeMargin={false}
          />
        </div>
      );
    } else if (el.type === 'image') {
      content = (
        <div className="w-full h-full bg-gray-100 border border-dashed border-gray-400 flex items-center justify-center text-[10px] text-gray-500 font-bold p-1 overflow-hidden">
          <ImageIcon className="w-3.5 h-3.5 mr-0.5 text-gray-400 shrink-0" />
          <span className="truncate">{el.text || 'Image'}</span>
        </div>
      );
    } else if (el.type === 'rectangle') {
      content = <div className="w-full h-full border-[1.5px] border-black bg-transparent" />;
    } else if (el.type === 'circle') {
      content = <div className="w-full h-full border-[1.5px] border-black rounded-full bg-transparent" />;
    } else if (el.type === 'line') {
      content = <div className="w-full h-0 border-t-[1.5px] border-black" />;
    }

    return (
      <div
        key={el.id}
        style={{
          position: 'absolute',
          left: `${leftMm}mm`,
          top: `${topMm}mm`,
          width: `${widthMm}mm`,
          height: el.type === 'line' ? '1px' : `${heightMm}mm`,
          overflow: 'hidden',
          display: 'flex',
          alignItems: 'center',
          justifyContent: el.type === 'text' ? 'flex-start' : 'center',
          boxSizing: 'border-box',
          pointerEvents: 'none'
        }}
      >
        {content}
      </div>
    );
  };

  const parsedWidth = parseFloat(pageWidth) || 50;
  const parsedHeight = parseFloat(pageHeight) || 25;
  const canvasWidth = Math.round(parsedWidth * 6);
  const canvasHeight = Math.round(parsedHeight * 6);

  const addElement = (type) => {
    let currentElements = [...elements];
    // Automatically remove the opposite code type to prevent user confusion (having both a QR and Barcode)
    if (type === 'barcode') {
      currentElements = currentElements.filter(el => el.type !== 'qrcode');
    } else if (type === 'qrcode') {
      currentElements = currentElements.filter(el => el.type !== 'barcode');
    }

    const offset = (currentElements.length * 15) % 150;
    const newEl = {
      id: Date.now().toString(),
      type,
      x: 40 + offset,
      y: 40 + offset,
      width: type === 'barcode' ? 140 : type === 'qrcode' ? 60 : type === 'image' ? 60 : type === 'circle' ? 40 : type === 'line' ? 120 : 80,
      height: type === 'barcode' ? 45 : type === 'qrcode' ? 60 : type === 'image' ? 60 : type === 'circle' ? 40 : type === 'line' ? 2 : 25,
      text: type === 'text' ? 'Sample Text' : type === 'barcode' ? '12345678' : type === 'qrcode' ? 'https://google.com' : type === 'image' ? 'Image' : '',
      fontSize: 12,
      field: type === 'text' ? 'Static Text' : undefined
    };
    setElements([...currentElements, newEl]);
    setSelectedId(newEl.id);
  };

  const handleMouseDown = (e, id) => {
    e.preventDefault();
    setSelectedId(id);

    const element = elements.find(el => el.id === id);
    if (!element) return;

    const startX = e.clientX;
    const startY = e.clientY;
    const startElX = element.x;
    const startElY = element.y;

    const handleMouseMove = (moveEvent) => {
      const deltaX = moveEvent.clientX - startX;
      const deltaY = moveEvent.clientY - startY;

      let newX = startElX + deltaX;
      let newY = startElY + deltaY;

      // Snap to grid logic if enabled (snap to cells based on selected gridSize)
      if (snapToGrid) {
        const snapValue = (parseFloat(gridSize) || 1) * 6;
        newX = Math.round(newX / snapValue) * snapValue;
        newY = Math.round(newY / snapValue) * snapValue;
      }

      // Constrain within the canvas boundaries
      newX = Math.max(0, Math.min(canvasWidth - element.width, newX));
      newY = Math.max(0, Math.min(canvasHeight - element.height, newY));

      setElements(prev => prev.map(el => el.id === id ? { ...el, x: newX, y: newY } : el));
    };

    const handleMouseUp = () => {
      document.removeEventListener('mousemove', handleMouseMove);
      document.removeEventListener('mouseup', handleMouseUp);
    };

    document.addEventListener('mousemove', handleMouseMove);
    document.addEventListener('mouseup', handleMouseUp);
  };

  const selectedEl = elements.find(el => el.id === selectedId);

  if (showDesigner) {
    return (
      <div className="bg-[#f4f6f9] min-h-[calc(100vh-60px)] flex flex-col select-none">
        {/* Top Teal Bar for Designer */}
        <div className="bg-[#4F46E5] px-4 py-[6px] flex justify-between items-center text-white h-[45px]">
          <h2 className="text-[14.5px] font-medium tracking-wide">Barcode Template Designer</h2>
          <button
            onClick={() => {
              setShowDesigner(false);
              setSelectedId(null);
              setElements([]);
              setShowPageSetup(false);
            }}
            className="bg-white text-gray-800 hover:bg-gray-100 border border-gray-300 px-3.5 h-[28px] text-[13px] font-bold rounded-[3px] flex items-center gap-1.5 focus:outline-none transition-colors"
          >
            <X className="w-3.5 h-3.5 text-gray-800" strokeWidth={3} /> Close
          </button>
        </div>

        {/* Toolbar */}
        <div className="bg-white border-b border-gray-200 py-2.5 px-4 flex flex-wrap items-center justify-between gap-4 shadow-sm">
          <div className="flex flex-wrap items-center gap-4">
            <input
              type="text"
              placeholder="Template Name"
              value={templateName}
              onChange={(e) => setTemplateName(e.target.value)}
              className="h-[32px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none placeholder-gray-400 text-gray-700 bg-white focus:border-[#4F46E5] w-[200px]"
            />

            <button
              onClick={() => setShowPageSetup(!showPageSetup)}
              className={cn(
                "px-3 h-[32px] rounded-[3px] flex items-center gap-1.5 text-[13px] font-bold transition-colors focus:outline-none text-white",
                showPageSetup ? "bg-[#0b5ed7]" : "bg-[#0d6efd] hover:bg-[#0b5ed7]"
              )}
            >
              <Settings className="w-3.5 h-3.5" /> Page Setup {showPageSetup ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />}
            </button>

            <label className="flex items-center gap-1.5 cursor-pointer select-none text-[13.5px] font-bold text-gray-800">
              <input
                type="checkbox"
                checked={showGrid}
                onChange={(e) => setShowGrid(e.target.checked)}
                className="w-4 h-4 accent-[#0d6efd]"
              />
              <span>Show Grid</span>
            </label>

            <div className="flex items-center gap-2">
              <span className="text-[13.5px] font-bold text-gray-800">Zoom:</span>
              <input
                type="range"
                min="100"
                max="300"
                step="50"
                value={zoom}
                onChange={(e) => setZoom(Number(e.target.value))}
                className="w-[100px] accent-[#0d6efd] cursor-pointer"
              />
              <span className="text-[13.5px] font-bold text-gray-800 w-[45px]">{zoom}%</span>
            </div>

            <label className="flex items-center gap-1.5 cursor-pointer select-none text-[13.5px] font-bold text-gray-800">
              <input
                type="checkbox"
                checked={snapToGrid}
                onChange={(e) => setSnapToGrid(e.target.checked)}
                className="w-4 h-4 accent-[#0d6efd]"
              />
              <span>Snap to Grid</span>
            </label>

            <div className="flex items-center gap-1.5">
              <span className="text-[13.5px] font-bold text-gray-800">Grid Size:</span>
              <select
                value={gridSize}
                onChange={(e) => setGridSize(e.target.value)}
                className="h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
              >
                <option value="1mm">1mm</option>
                <option value="2mm">2mm</option>
                <option value="3mm">3mm</option>
                <option value="5mm">5mm</option>
                <option value="10mm">10mm</option>
                <option value="15mm">15mm</option>
                <option value="20mm">20mm</option>
              </select>
            </div>
          </div>

          <button
            onClick={async () => {
              try {
                const payload = {
                  name: templateName || 'Custom Template',
                  pageWidth,
                  pageHeight,
                  leftMargin,
                  rightMargin,
                  labelGap,
                  heightGap,
                  labelsInRow: labelCount,
                  pageBreak,
                  barcodeFormat: printerType,
                  elements: elements
                };

                let res;
                if (activeTemplate && activeTemplate.name === templateName) {
                  res = await apiClient.put(`/barcode-settings/${activeTemplate.id}`, payload);
                } else {
                  res = await apiClient.post('/barcode-settings', payload);
                }

                if (res.data?.success) {
                  alert('Template saved successfully!');
                  await fetchInitialData();
                  setSelectedTemplateName(templateName || 'Custom Template');
                  setShowDesigner(false);
                  setElements([]);
                  setSelectedId(null);
                  setShowPageSetup(false);
                }
              } catch (e) {
                console.error(e);
                alert('Failed to save template');
              }
            }}
            className="bg-[#28a745] hover:bg-[#218838] text-white px-4 h-[32px] rounded-[3px] flex items-center justify-center gap-1.5 text-[13px] font-bold transition-colors focus:outline-none"
          >
            <Save className="w-4 h-4" /> Save Template
          </button>
        </div>

        {/* Page Setup Options Panel */}
        {showPageSetup && (
          <div className="bg-white border-b border-gray-200 p-5 flex flex-col gap-4 shadow-sm">
            {/* Quick Presets */}
            <div className="flex items-center gap-3">
              <span className="text-[13.5px] font-bold text-gray-800 whitespace-nowrap">Quick Presets:</span>
              <div className="flex flex-wrap gap-2">
                {['50mm x 25mm', '38mm x 25mm', '38mm x 25mm (2 Labels)', '100mm x 50mm', 'Custom'].map((preset) => {
                  const isActive = activePreset === preset;
                  return (
                    <button
                      key={preset}
                      onClick={() => handlePresetClick(preset)}
                      className={cn(
                        "px-3.5 py-1 text-[13px] font-medium border rounded-[3px] transition-all focus:outline-none",
                        isActive
                          ? "border-[#0d6efd] text-[#0d6efd] bg-[#0d6efd]/5 font-bold"
                          : "border-[#0d6efd]/40 text-[#0d6efd] bg-white hover:bg-[#0d6efd]/5"
                      )}
                    >
                      {preset}
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Form Inputs Grid */}
            <div className="grid grid-cols-4 gap-4">
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Page Width</label>
                <input
                  type="text"
                  value={pageWidth}
                  onChange={(e) => {
                    setPageWidth(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Page Height</label>
                <input
                  type="text"
                  value={pageHeight}
                  onChange={(e) => {
                    setPageHeight(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Left Margin</label>
                <input
                  type="text"
                  value={leftMargin}
                  onChange={(e) => {
                    setLeftMargin(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Right Margin</label>
                <input
                  type="text"
                  value={rightMargin}
                  onChange={(e) => {
                    setRightMargin(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Label Gap</label>
                <input
                  type="text"
                  value={labelGap}
                  onChange={(e) => {
                    setLabelGap(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Height Gap</label>
                <input
                  type="text"
                  value={heightGap}
                  onChange={(e) => {
                    setHeightGap(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Label Count (per row)</label>
                <input
                  type="text"
                  value={labelCount}
                  onChange={(e) => {
                    setLabelCount(e.target.value);
                    setActivePreset('Custom');
                  }}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                />
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Page Break</label>
                <select
                  value={pageBreak}
                  onChange={(e) => setPageBreak(e.target.value)}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                >
                  <option value="No">No</option>
                  <option value="Yes">Yes</option>
                </select>
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-[13.5px] font-bold text-gray-800">Printer Type</label>
                <select
                  value={printerType}
                  onChange={(e) => setPrinterType(e.target.value)}
                  className="h-[34px] border border-gray-300 rounded-[3px] px-2.5 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                >
                  <option value="A4 Sheet">A4 Sheet (PDF/Normal)</option>
                  <option value="Thermal Roll">Thermal Roll</option>
                </select>
              </div>
            </div>

            {/* Info Banner */}
            <div className="bg-[#4F46E5] text-white py-2.5 px-4 rounded-[3px] flex items-center gap-2 text-[13px] font-medium mt-2">
              <Info className="w-4 h-4 flex-shrink-0" />
              <span>Common sizes: 50mm x 25mm, 38mm x 25mm, 100mm x 50mm. Adjust margins and gaps for proper printing alignment.</span>
            </div>
          </div>
        )}

        {/* Main Work Area */}
        <div className="flex-1 bg-white flex overflow-hidden">
          {/* Left Elements Sidebar */}
          <div className="w-[200px] border-r border-gray-200 p-4 bg-white flex flex-col overflow-y-auto">
            <h3 className="text-[14.5px] font-bold text-gray-800 mb-3 select-none">Elements</h3>
            <div className="flex flex-col border border-gray-200 rounded-[4px] overflow-hidden">
              <button
                onClick={() => addElement('text')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <span className="font-serif font-bold text-[15px] text-gray-600 w-4 h-4 flex items-center justify-center">A</span>
                <span>Text</span>
              </button>
              <button
                onClick={() => addElement('barcode')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="w-4 h-4 text-gray-500">
                  <line x1="3" y1="5" x2="3" y2="19" />
                  <line x1="6" y1="5" x2="6" y2="19" />
                  <line x1="10" y1="5" x2="10" y2="19" />
                  <line x1="14" y1="5" x2="14" y2="19" />
                  <line x1="18" y1="5" x2="18" y2="19" />
                  <line x1="21" y1="5" x2="21" y2="19" />
                </svg>
                <span>Barcode</span>
              </button>
              <button
                onClick={() => addElement('qrcode')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <QrCode className="w-4 h-4 text-gray-500" />
                <span>QR Code</span>
              </button>
              <button
                onClick={() => addElement('image')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <ImageIcon className="w-4 h-4 text-gray-500" />
                <span>Image</span>
              </button>
              <button
                onClick={() => addElement('rectangle')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="w-4 h-4 text-gray-500">
                  <rect x="3" y="3" width="18" height="18" rx="0" />
                </svg>
                <span>Rectangle</span>
              </button>
              <button
                onClick={() => addElement('circle')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <Circle className="w-4 h-4 text-gray-500" />
                <span>Circle</span>
              </button>
              <button
                onClick={() => addElement('line')}
                className="w-full flex items-center gap-3 px-4 h-[42px] bg-white hover:bg-[#f8f9fa] border-b border-gray-150 last:border-b-0 text-gray-700 transition-colors text-[13px] font-semibold focus:outline-none"
              >
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="w-4 h-4 text-gray-500">
                  <line x1="5" y1="12" x2="19" y2="12" />
                </svg>
                <span>Line</span>
              </button>
            </div>
          </div>

          {/* Middle Design Canvas */}
          <div
            onClick={() => setSelectedId(null)}
            className="flex-1 bg-[#f1f3f5] flex items-center justify-center p-8 overflow-auto relative"
          >
            <div
              className="bg-white border-[3px] border-black shadow-lg relative overflow-hidden transition-transform duration-150 ease-out origin-center"
              onClick={(e) => e.stopPropagation()}
              style={{
                width: `${canvasWidth}px`,
                height: `${canvasHeight}px`,
                backgroundImage: showGrid ? 'linear-gradient(to right, #ccc 1px, transparent 1px), linear-gradient(to bottom, #ccc 1px, transparent 1px)' : 'none',
                backgroundSize: `${(parseFloat(gridSize) || 1) * 6}px ${(parseFloat(gridSize) || 1) * 6}px`,
                transform: `scale(${zoom / 100})`,
              }}
            >
              {elements.map((el) => (
                <div
                  key={el.id}
                  onMouseDown={(e) => handleMouseDown(e, el.id)}
                  onClick={(e) => {
                    e.stopPropagation();
                    setSelectedId(el.id);
                  }}
                  className={cn(
                    "absolute cursor-move select-none flex items-center justify-center",
                    selectedId === el.id ? "z-50" : "z-10"
                  )}
                  style={{
                    left: `${el.x}px`,
                    top: `${el.y}px`,
                    width: `${el.width}px`,
                    height: `${el.height}px`,
                  }}
                >
                  {/* Highlight outline if selected */}
                  {selectedId === el.id && (
                    <div className="absolute inset-[-2px] border-[2px] border-blue-500 pointer-events-none rounded-[1px]">
                      <div className="absolute top-[-3px] left-[-3px] w-1.5 h-1.5 bg-blue-500 rounded-full" />
                      <div className="absolute top-[-3px] right-[-3px] w-1.5 h-1.5 bg-blue-500 rounded-full" />
                      <div className="absolute bottom-[-3px] left-[-3px] w-1.5 h-1.5 bg-blue-500 rounded-full" />
                      <div className="absolute bottom-[-3px] right-[-3px] w-1.5 h-1.5 bg-blue-500 rounded-full" />
                    </div>
                  )}

                  {/* Render based on element type */}
                  {el.type === 'text' && (
                    <span
                      style={{ fontSize: `${el.fontSize}px` }}
                      className="font-bold text-black whitespace-nowrap block select-none pointer-events-none"
                    >
                      {el.text}
                    </span>
                  )}

                  {el.type === 'barcode' && (
                    <div className="w-full h-full bg-white flex items-center justify-center pointer-events-none select-none overflow-hidden [&>svg]:w-full [&>svg]:h-full">
                      <Barcode value={el.text || '12345678'} width={el.width / 100} height={el.height - 15} fontSize={10} margin={0} displayValue={true} />
                    </div>
                  )}

                  {el.type === 'qrcode' && (
                    <div className="w-full h-full bg-white flex items-center justify-center pointer-events-none select-none">
                      <QRCodeSVG value={el.text || '12345'} size={Math.min(el.width, el.height)} />
                    </div>
                  )}

                  {el.type === 'image' && (
                    <div className="w-full h-full bg-gray-100 border border-dashed border-gray-400 flex items-center justify-center text-[10px] text-gray-500 font-bold p-1 pointer-events-none select-none">
                      <ImageIcon className="w-3.5 h-3.5 mr-0.5 text-gray-400" />
                      <span className="truncate">{el.text || 'Image'}</span>
                    </div>
                  )}

                  {el.type === 'rectangle' && (
                    <div className="w-full h-full border-[2px] border-black bg-transparent pointer-events-none select-none" />
                  )}

                  {el.type === 'circle' && (
                    <div className="w-full h-full border-[2px] border-black rounded-full bg-transparent pointer-events-none select-none" />
                  )}

                  {el.type === 'line' && (
                    <div className="w-full h-0 border-t-[2px] border-black pointer-events-none select-none" />
                  )}
                </div>
              ))}
            </div>
          </div>

          {/* Right Properties Sidebar */}
          <div className="w-[220px] border-l border-gray-200 p-4 bg-white flex flex-col overflow-y-auto">
            <h3 className="text-[14.5px] font-bold text-gray-800 mb-3 select-none">Properties</h3>
            {selectedEl ? (
              <div className="flex flex-col gap-3">
                <div className="text-[12px] font-bold text-gray-700">
                  Type: <span className="text-[#0d6efd] uppercase">{selectedEl.type}</span>
                </div>

                {/* X & Y position */}
                <div className="flex gap-2">
                  <div className="flex-1 flex flex-col gap-1">
                    <label className="text-[11px] font-bold text-gray-500">Position X (px)</label>
                    <input
                      type="number"
                      value={selectedEl.x}
                      onChange={(e) => {
                        const val = Math.max(0, Math.min(canvasWidth - selectedEl.width, Number(e.target.value)));
                        setElements(prev => prev.map(el => el.id === selectedId ? { ...el, x: val } : el));
                      }}
                      className="h-[28px] border border-gray-300 rounded-[3px] px-1.5 text-[12px] outline-none text-gray-700 bg-white"
                    />
                  </div>
                  <div className="flex-1 flex flex-col gap-1">
                    <label className="text-[11px] font-bold text-gray-500">Position Y (px)</label>
                    <input
                      type="number"
                      value={selectedEl.y}
                      onChange={(e) => {
                        const val = Math.max(0, Math.min(canvasHeight - selectedEl.height, Number(e.target.value)));
                        setElements(prev => prev.map(el => el.id === selectedId ? { ...el, y: val } : el));
                      }}
                      className="h-[28px] border border-gray-300 rounded-[3px] px-1.5 text-[12px] outline-none text-gray-700 bg-white"
                    />
                  </div>
                </div>

                {/* Width & Height */}
                {selectedEl.type !== 'line' && (
                  <div className="flex gap-2">
                    <div className="flex-1 flex flex-col gap-1">
                      <label className="text-[11px] font-bold text-gray-500">Width (px)</label>
                      <input
                        type="number"
                        value={selectedEl.width}
                        onChange={(e) => {
                          const val = Math.max(10, Math.min(canvasWidth - selectedEl.x, Number(e.target.value)));
                          setElements(prev => prev.map(el => el.id === selectedId ? { ...el, width: val } : el));
                        }}
                        className="h-[28px] border border-gray-300 rounded-[3px] px-1.5 text-[12px] outline-none text-gray-700 bg-white"
                      />
                    </div>
                    <div className="flex-1 flex flex-col gap-1">
                      <label className="text-[11px] font-bold text-gray-500">Height (px)</label>
                      <input
                        type="number"
                        value={selectedEl.height}
                        onChange={(e) => {
                          const val = Math.max(10, Math.min(canvasHeight - selectedEl.y, Number(e.target.value)));
                          setElements(prev => prev.map(el => el.id === selectedId ? { ...el, height: val } : el));
                        }}
                        className="h-[28px] border border-gray-300 rounded-[3px] px-1.5 text-[12px] outline-none text-gray-700 bg-white"
                      />
                    </div>
                  </div>
                )}

                {/* Text Content (Value) */}
                {['text', 'barcode', 'qrcode', 'image'].includes(selectedEl.type) && (
                  <div className="flex flex-col gap-1">
                    <label className="text-[11px] font-bold text-gray-500">Content Value</label>
                    <input
                      type="text"
                      value={selectedEl.text}
                      onChange={(e) => setElements(prev => prev.map(el => el.id === selectedId ? { ...el, text: e.target.value } : el))}
                      className="h-[28px] border border-gray-300 rounded-[3px] px-2 text-[12px] outline-none text-gray-700 bg-white"
                    />
                  </div>
                )}

                {/* Data Binding for Text */}
                {selectedEl.type === 'text' && (
                  <div className="flex flex-col gap-1">
                    <label className="text-[11px] font-bold text-gray-500">Data Binding</label>
                    <select
                      value={selectedEl.field || 'Static Text'}
                      onChange={(e) => {
                        const field = e.target.value;
                        let defaultText = selectedEl.text;
                        if (field === 'Product Name') defaultText = 'Product Name';
                        if (field === 'MRP') defaultText = 'MRP: ₹0';
                        if (field === 'Sale Price') defaultText = 'Price: ₹0';
                        if (field === 'Whole Sale Price') defaultText = 'Wholesale: ₹0';
                        if (field === 'Company Name') defaultText = 'SWAYAM BILL';
                        if (field === 'Barcode Number') defaultText = '12345678';
                        if (field === 'Category') defaultText = 'Category';
                        if (field === 'Brand') defaultText = 'Brand';
                        if (field === 'Unit') defaultText = 'Unit';
                        if (field === 'Batch No') defaultText = 'Batch No';
                        if (field === 'Location') defaultText = 'Location';
                        if (field === 'Size') defaultText = 'Size';
                        if (field === 'Color') defaultText = 'Color';
                        if (field === 'GRN Number') defaultText = 'GRN';
                        setElements(prev => prev.map(el => el.id === selectedId ? { ...el, field, text: field === 'Static Text' ? el.text : defaultText } : el));
                      }}
                      className="h-[28px] border border-gray-300 rounded-[3px] px-2 text-[12px] outline-none text-gray-700 bg-white mb-2"
                    >
                      <option value="Static Text">Static Text</option>
                      <option value="Product Name">Product Name</option>
                      <option value="MRP">MRP</option>
                      <option value="Sale Price">Sale Price</option>
                      <option value="Whole Sale Price">Whole Sale Price</option>
                      <option value="Company Name">Company Name</option>
                      <option value="Barcode Number">Barcode Number</option>
                      <option value="Category">Category</option>
                      <option value="Brand">Brand</option>
                      <option value="Unit">Unit</option>
                      <option value="Batch No">Batch No</option>
                      <option value="Location">Location</option>
                      <option value="Size">Size</option>
                      <option value="Color">Color</option>
                      <option value="GRN Number">GRN Number</option>
                    </select>
                  </div>
                )}

                {/* Font Size */}
                {selectedEl.type === 'text' && (
                  <div className="flex flex-col gap-1">
                    <label className="text-[11px] font-bold text-gray-500">Font Size (px)</label>
                    <input
                      type="number"
                      value={selectedEl.fontSize}
                      onChange={(e) => setElements(prev => prev.map(el => el.id === selectedId ? { ...el, fontSize: Number(e.target.value) } : el))}
                      className="h-[28px] border border-gray-300 rounded-[3px] px-1.5 text-[12px] outline-none text-gray-700 bg-white"
                    />
                  </div>
                )}

                <button
                  onClick={() => {
                    setElements(prev => prev.filter(el => el.id !== selectedId));
                    setSelectedId(null);
                  }}
                  className="w-full mt-4 bg-red-600 hover:bg-red-700 text-white py-1.5 rounded-[3px] text-[12px] font-bold transition-colors focus:outline-none flex items-center justify-center gap-1"
                >
                  <X className="w-3.5 h-3.5" /> Delete Element
                </button>
              </div>
            ) : (
              <p className="text-[13px] text-gray-500 font-medium select-none">
                Select an element to edit properties
              </p>
            )}
          </div>
        </div>
      </div>
    );
  }

  if (showTemplates) {
    return (
      <div className="bg-[#f4f6f9] min-h-[calc(100vh-60px)] flex flex-col">
        {/* Top Teal Bar for Templates */}
        <div className="bg-[#4F46E5] px-4 py-[6px] flex justify-between items-center text-white h-[45px]">
          <h2 className="text-[14.5px] font-medium tracking-wide">Barcode Templates</h2>
          <div className="flex items-center gap-1.5">
            <button
              onClick={() => setShowDesigner(true)}
              className="bg-[#28a745] hover:bg-[#218838] text-white px-3.5 h-8 rounded-[3px] flex items-center justify-center gap-1 text-[13px] font-bold transition-colors focus:outline-none"
            >
              <span className="text-[15px] leading-none">+</span> New Template
            </button>
            <button
              onClick={() => setShowTemplates(false)}
              className="w-8 h-8 bg-[#dc3545] hover:bg-[#c82333] text-white rounded-[3px] flex items-center justify-center transition-colors focus:outline-none"
            >
              <X className="w-4 h-4" strokeWidth={3} />
            </button>
          </div>
        </div>

        <div className="flex-1 bg-white flex flex-col p-6">
          <div className="flex-1 border border-gray-150 rounded-[3px] bg-white flex flex-col items-center justify-center min-h-[350px] shadow-sm">
            <p className="text-gray-600 text-[14px] font-medium text-center">
              No templates found. Create your first template to get started.
            </p>
            <button
              onClick={() => setShowDesigner(true)}
              className="mt-4 bg-[#0d6efd] hover:bg-[#0b5ed7] text-white px-4 py-2 rounded-[3px] flex items-center gap-1.5 text-[13px] font-bold transition-colors focus:outline-none"
            >
              <span className="text-[15px] leading-none">+</span> Create Template
            </button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-[#f4f6f9] min-h-[calc(100vh-60px)] flex flex-col print:bg-white print:min-h-0 print:h-auto print:block">
      <div className="print:hidden flex-1 flex flex-col">
        {/* Top Teal Bar */}
        <div className="bg-[#4F46E5] px-4 py-[6px] flex justify-between items-center text-white h-[45px]">
          <h2 className="text-[14.5px] font-medium tracking-wide">Barcode</h2>
          <div className="flex items-center gap-1.5">
            <button className="w-8 h-8 bg-red-600 hover:bg-red-700 text-white rounded-[3px] flex items-center justify-center transition-colors focus:outline-none">
              <YoutubeIcon className="w-4 h-4" />
            </button>
            <button className="w-8 h-8 bg-[#ffc107] hover:bg-[#e0a800] text-gray-900 rounded-[3px] flex items-center justify-center transition-colors focus:outline-none">
              <RefreshCw className="w-4 h-4" strokeWidth={2.5} />
            </button>
            <button
              onClick={() => navigate(-1)}
              className="w-8 h-8 bg-[#dc3545] hover:bg-[#c82333] text-white rounded-[3px] flex items-center justify-center transition-colors focus:outline-none"
            >
              <X className="w-4 h-4" strokeWidth={3} />
            </button>
          </div>
        </div>

        <div className="flex-1 bg-white flex flex-col">
          {/* Main Form Area */}
          <div className="p-6 flex flex-col">
            <div className="flex flex-col md:flex-row gap-6 items-stretch">

              {/* Left Form */}
              <div className="flex-1 flex flex-col gap-4">

                {/* Barcode Template */}
                <div className="flex flex-col gap-1.5">
                  <label className="text-[13px] font-bold text-gray-800">Barcode Template</label>
                  <div className="flex gap-1.5">
                    <div className="flex-1 relative flex">
                      <input
                        list="barcode-templates"
                        value={selectedTemplateName}
                        onChange={e => setSelectedTemplateName(e.target.value)}
                        placeholder="Select Template (or use default)"
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                      <datalist id="barcode-templates">
                        {templates.map(t => <option key={t.id} value={t.name} />)}
                      </datalist>
                    </div>
                    <button
                      onClick={() => {
                        if (activeTemplate) {
                          setTemplateName(activeTemplate.name || selectedTemplateName || '');
                          if (activeTemplate.pageWidth) setPageWidth(activeTemplate.pageWidth);
                          if (activeTemplate.pageHeight) setPageHeight(activeTemplate.pageHeight);
                          if (activeTemplate.leftMargin) setLeftMargin(activeTemplate.leftMargin);
                          if (activeTemplate.rightMargin) setRightMargin(activeTemplate.rightMargin);
                          if (activeTemplate.labelGap) setLabelGap(activeTemplate.labelGap);
                          if (activeTemplate.heightGap) setHeightGap(activeTemplate.heightGap);
                          if (activeTemplate.labelsInRow) setLabelCount(String(activeTemplate.labelsInRow));
                          if (activeTemplate.pageBreak) setPageBreak(activeTemplate.pageBreak);
                          if (activeTemplate.barcodeFormat) setPrinterType(activeTemplate.barcodeFormat);
                          let tmplElements = [];
                          if (activeTemplate.elements) {
                            if (typeof activeTemplate.elements === 'string') {
                              try { tmplElements = JSON.parse(activeTemplate.elements); } catch (e) {}
                            } else if (Array.isArray(activeTemplate.elements)) {
                              tmplElements = activeTemplate.elements;
                            }
                          }
                          setElements(tmplElements);
                        } else {
                          setTemplateName(selectedTemplateName || 'Custom Template');
                        }
                        setShowDesigner(true);
                      }}
                      className="bg-[#4F46E5] hover:bg-[#4338ca] text-white px-2.5 rounded-[3px] flex items-center justify-center transition-colors focus:outline-none"
                      title="Barcode Template Designer"
                    >
                      <Settings className="w-4 h-4" strokeWidth={2} />
                    </button>
                  </div>
                </div>

                {/* Row 1: Product Select, Product Units, Barcode */}
                <div className="flex gap-4 items-end">
                  <div className="flex-1 flex flex-col gap-1.5">
                    <div className="flex items-center justify-between">
                      <span
                        onClick={() => setSearchMode(prev => prev === 'Product Name' ? 'Product Code' : 'Product Name')}
                        className="bg-[#4F46E5] text-white text-[11px] font-bold px-2 py-0.5 rounded-[2px] leading-none select-none cursor-pointer whitespace-nowrap"
                        title="Click to toggle search mode"
                      >
                        {searchMode === 'Product Code' ? 'Product Code' : 'Product Name'}
                      </span>
                      <div className="flex items-center gap-1.5">
                        <div
                          onClick={() => setIsManufactureProduct(!isManufactureProduct)}
                          className={cn(
                            "w-[32px] h-[18px] rounded-full relative cursor-pointer border transition-colors duration-200",
                            isManufactureProduct ? "bg-[#0d6efd] border-[#0d6efd]" : "bg-gray-300 border-gray-400"
                          )}
                        >
                          <div className={cn(
                            "w-[14px] h-[14px] bg-white rounded-full absolute top-[2px] transition-transform duration-200",
                            isManufactureProduct ? "translate-x-[16px]" : "translate-x-[2px]"
                          )}></div>
                        </div>
                        <span className="text-[13px] font-bold text-gray-800 select-none">Manufacture Product</span>
                      </div>
                    </div>
                    <div className="w-full h-[32px] border border-gray-300 bg-[#a6cdec] rounded-[3px] focus-within:border-[#4F46E5]">
                      <ProductSelectDropdown
                        products={products}
                        value={selectedProduct}
                        onChange={(id) => handleProductSelect({ target: { value: id } })}
                        onEdit={(data) => {
                          setItemModalData(data);
                          setIsItemModalOpen(true);
                        }}
                        onDelete={() => { }}
                        searchMode={searchMode}
                      />
                    </div>
                  </div>

                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Product Units</label>
                    <div className="flex-1 relative flex">
                      <input
                        list="product-units-list"
                        value={selectedUnit}
                        onChange={(e) => setSelectedUnit(e.target.value)}
                        placeholder="Select Unit"
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                      <datalist id="product-units-list">
                        {units.map(u => (
                          <option key={u.id} value={u.name} />
                        ))}
                      </datalist>
                    </div>
                  </div>

                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Barcode</label>
                    <input
                      type="text"
                      value={barcodeInput}
                      onChange={(e) => setBarcodeInput(e.target.value)}
                      placeholder="Barcode Number"
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none placeholder-gray-400 text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                </div>

                {/* Row 2: MRP, Sale Price & Whole Sale Price */}
                <div className="flex gap-4">
                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">MRP</label>
                    <input
                      type="text"
                      value={mrpInput}
                      onChange={(e) => setMrpInput(e.target.value)}
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Sale Price</label>
                    <input
                      type="text"
                      value={salePriceInput}
                      onChange={(e) => setSalePriceInput(e.target.value)}
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Whole Sale Price</label>
                    <input
                      type="text"
                      value={wholesalePriceInput}
                      onChange={(e) => setWholesalePriceInput(e.target.value)}
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                </div>

                {/* Row 3 (Conditional): Date of Manufacture, Batch No., Net Quantity */}
                {isManufactureProduct && (
                  <div className="flex gap-4">
                    <div className="flex-1 flex flex-col gap-1.5">
                      <label className="text-[13px] font-bold text-gray-800">Date of Manufacture</label>
                      <input
                        type="date"
                        value={mfgDate}
                        onChange={(e) => setMfgDate(e.target.value)}
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                    </div>
                    <div className="flex-1 flex flex-col gap-1.5">
                      <label className="text-[13px] font-bold text-gray-800">Batch No.</label>
                      <input
                        type="text"
                        value={batchNoInput}
                        onChange={(e) => setBatchNoInput(e.target.value)}
                        placeholder="Enter Batch No."
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none placeholder-gray-400 text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                    </div>
                    <div className="flex-1 flex flex-col gap-1.5">
                      <label className="text-[13px] font-bold text-gray-800">Net Quantity</label>
                      <input
                        type="text"
                        defaultValue="0"
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                    </div>
                  </div>
                )}

                {/* Row 4 (Conditional): Marketed By, Marketed Address */}
                {isManufactureProduct && (
                  <div className="flex gap-4">
                    <div className="flex-1 flex flex-col gap-1.5">
                      <label className="text-[13px] font-bold text-gray-800">Marketed By</label>
                      <input
                        type="text"
                        placeholder="Enter Marketed By"
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none placeholder-gray-400 text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                    </div>
                    <div className="flex-[2] flex flex-col gap-1.5">
                      <label className="text-[13px] font-bold text-gray-800">Marketed Address</label>
                      <input
                        type="text"
                        placeholder="Enter Marketed Address"
                        className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none placeholder-gray-400 text-gray-700 bg-white focus:border-[#4F46E5]"
                      />
                    </div>
                  </div>
                )}

                {/* Row 5: Quantity to Print & Auto Quantity */}
                <div className="flex gap-4">
                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Quantity to Print</label>
                    <input
                      type="number"
                      value={printQty}
                      onChange={(e) => setPrintQty(e.target.value)}
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                  <div className="flex-1 flex flex-col gap-1.5">
                    <label className="text-[13px] font-bold text-gray-800">Auto Quantity</label>
                    <input
                      type="text"
                      defaultValue="0"
                      className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 bg-white focus:border-[#4F46E5]"
                    />
                  </div>
                  <div className="flex-1"></div>
                </div>

              </div>

              {/* Right Preview */}
              <div className="w-full md:w-[380px] flex flex-col">
                <div className="w-full h-full min-h-[190px] border border-gray-800 bg-[#f8f9fa] flex flex-col items-center justify-center rounded-[3px] p-4 gap-4">

                  {selectedProduct ? (
                    (() => {
                      const prodObj = products.find(p => p.id.toString() === selectedProduct.toString());
                      const prodData = {
                        name: prodObj?.name || 'Product',
                        mrp: mrpInput || prodObj?.mrp || '0',
                        salePrice: salePriceInput || prodObj?.salesPrice || prodObj?.price || '0',
                        wholesalePrice: wholesalePriceInput || prodObj?.wholesalePrice || '0',
                        barcode: barcodeInput || prodObj?.barcode || '12345678',
                        unit: selectedUnit || prodObj?.unit?.name || '',
                        category: prodObj?.category?.name || prodObj?.category || '',
                        brand: prodObj?.brand?.name || prodObj?.brand || '',
                        batchNo: batchNoInput || prodObj?.batchNo || prodObj?.batch_no || '',
                        location: prodObj?.location || prodObj?.rack || '',
                        size: prodObj?.size || '',
                        color: prodObj?.color || ''
                      };

                      const tmplElements = getParsedElements(activeTemplate);
                      const hasCustomElements = tmplElements && tmplElements.length > 0;
                      const labelWidth = activeTemplate?.pageWidth || '50mm';
                      const labelHeight = activeTemplate?.pageHeight || '25mm';

                      return (
                        <div 
                          style={{
                            width: labelWidth,
                            height: labelHeight,
                            minHeight: labelHeight,
                            paddingTop: hasCustomElements ? '0' : (activeTemplate?.marginTop || '1mm'),
                            paddingBottom: hasCustomElements ? '0' : (activeTemplate?.marginBottom || '1mm'),
                            paddingLeft: hasCustomElements ? '0' : (activeTemplate?.marginLeft || '1mm'),
                            paddingRight: hasCustomElements ? '0' : (activeTemplate?.marginRight || '1mm'),
                            boxSizing: 'border-box',
                            position: 'relative',
                            overflow: 'hidden',
                            backgroundColor: '#ffffff'
                          }}
                          className={cn(
                            "bg-white shadow-sm overflow-hidden transition-all duration-150 relative",
                            activeTemplate?.showBorder !== false ? "border-[1.5px] border-black" : "border-none",
                            !hasCustomElements ? "flex items-center justify-between gap-2" : ""
                          )}
                        >
                          {hasCustomElements ? (
                            tmplElements.map(el => renderTemplateElement(el, prodData, activeTemplate))
                          ) : (
                            <>
                              {/* Left Details */}
                              <div 
                                className="flex flex-col items-start justify-center pr-1 overflow-hidden" 
                                style={{ flex: '1 1 auto', minWidth: 0, maxWidth: activeTemplate?.hideBarcode ? '100%' : 'calc(100% - 60px)' }}
                              >
                                {activeTemplate?.showHeading !== false && (
                                  <span 
                                    style={{ fontSize: activeTemplate?.headingFontSize || '9px' }} 
                                    className="font-bold text-[#034694] leading-none uppercase w-full truncate block"
                                  >
                                    {activeTemplate?.barcodeHeading || 'SWAYAM BILL'}
                                  </span>
                                )}
                                <span 
                                  style={{ fontSize: activeTemplate?.productFontSize || '11px', lineHeight: '1.1' }} 
                                  className={cn(
                                    "font-extrabold text-[#034694] uppercase mt-[2px] block w-full",
                                    activeTemplate?.showMultiLine ? "break-words line-clamp-2" : "truncate"
                                  )}
                                >
                                  {products.find(p => p.id.toString() === selectedProduct.toString())?.name || 'Product'}
                                </span>
                                <div className="flex flex-col mt-[2px] w-full text-left">
                                  {activeTemplate?.showCategory && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Cat: </span>{products.find(p => p.id.toString() === selectedProduct.toString())?.category?.name || products.find(p => p.id.toString() === selectedProduct.toString())?.category || ''}
                                    </span>
                                  )}
                                  {activeTemplate?.showBrand && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Brand: </span>{products.find(p => p.id.toString() === selectedProduct.toString())?.brand?.name || products.find(p => p.id.toString() === selectedProduct.toString())?.brand || ''}
                                    </span>
                                  )}
                                  {activeTemplate?.showSize && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Size: </span>{products.find(p => p.id.toString() === selectedProduct.toString())?.size || ''}
                                    </span>
                                  )}
                                  {activeTemplate?.showColor && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Color: </span>{products.find(p => p.id.toString() === selectedProduct.toString())?.color || ''}
                                    </span>
                                  )}
                                  {activeTemplate?.showUnit && selectedUnit && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Unit: </span>{selectedUnit}
                                    </span>
                                  )}
                                  {activeTemplate?.showBatchNo && batchNoInput && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Batch: </span>{batchNoInput}
                                    </span>
                                  )}
                                  {activeTemplate?.showLocation && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Loc: </span>{products.find(p => p.id.toString() === selectedProduct.toString())?.location || ''}
                                    </span>
                                  )}
                                  {activeTemplate?.showMRP !== false && (
                                    <span 
                                      style={{ fontSize: activeTemplate?.mrpFontSize || '9px' }} 
                                      className={cn("font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden", activeTemplate?.crossMRP ? "line-through text-gray-500" : "")}
                                    >
                                      <span className="text-black font-semibold">MRP: </span>{mrpInput || 0}
                                    </span>
                                  )}
                                  {activeTemplate?.showSalePrice !== false && (
                                    <span style={{ fontSize: activeTemplate?.salePriceFontSize || '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Price: </span>{salePriceInput || 0}
                                    </span>
                                  )}
                                  {activeTemplate?.showWholeSalePrice && (
                                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                                      <span className="text-black font-semibold">Wholesale: </span>{wholesalePriceInput || 0}
                                    </span>
                                  )}
                                </div>
                              </div>

                              {/* Right Barcode/QR */}
                              {!activeTemplate?.hideBarcode && (
                                <div className="flex flex-col items-center justify-center shrink-0" style={{ minWidth: '55px', maxWidth: '75px' }}>
                                  {(activeTemplate?.barcodeFormat === 'Format 1' || activeTemplate?.barcodeFormat === 'Format 2') ? (
                                    <Barcode
                                      value={String(barcodeInput || '1234567890').trim()}
                                      width={parseFloat(activeTemplate?.barcodeWidth) || 1.2}
                                      height={parseFloat(activeTemplate?.barcodeHeight) || 28}
                                      fontSize={parseFloat(activeTemplate?.footerFontSize) || 8}
                                      margin={0}
                                      displayValue={false}
                                      background="transparent"
                                    />
                                  ) : (
                                    <QRCodeSVG
                                      value={`${window.location.origin}/product/${encodeURIComponent(barcodeInput || selectedProduct || '12345')}`}
                                      size={58}
                                      level="M"
                                      fgColor="#000000"
                                      bgColor="#ffffff"
                                      includeMargin={false}
                                    />
                                  )}
                                  <span style={{ fontSize: activeTemplate?.footerFontSize || '8px' }} className="font-bold text-[#034694] mt-[2px] tracking-wide w-full text-center truncate block">
                                    {barcodeInput || '1234567890'}
                                  </span>
                                </div>
                              )}
                            </>
                          )}
                        </div>
                      );
                    })()
                  ) : (
                    <div className="text-gray-400 text-[13px] font-medium flex flex-col items-center">
                      <BarcodeIcon className="w-10 h-10 mb-2 opacity-30" />
                      <span>No product selected for preview</span>
                    </div>
                  )}

                  <div className="flex items-center gap-2">
                    <div
                      onClick={() => setIsSpecialCommision(!isSpecialCommision)}
                      className={cn(
                        "w-[32px] h-[18px] rounded-full relative cursor-pointer transition-colors duration-200 border",
                        isSpecialCommision ? "bg-[#0d6efd] border-[#0d6efd]" : "bg-gray-300 border-gray-400"
                      )}
                    >
                      <div className={cn(
                        "w-[14px] h-[14px] bg-white rounded-full absolute top-[2px] transition-transform duration-200 shadow-sm",
                        isSpecialCommision ? "translate-x-[16px]" : "translate-x-[2px]"
                      )}></div>
                    </div>
                    <span className="text-[13px] font-bold text-gray-800 select-none">Special Commision</span>
                  </div>
                </div>
              </div>

            </div>

            {/* Buttons */}
            <div className="flex gap-2 justify-center mt-6 mb-2">
              <button
                onClick={handleAddToList}
                className="bg-[#28a745] hover:bg-[#218838] text-white px-4 py-1.5 rounded-[3px] text-[13px] font-medium flex items-center justify-center gap-1.5 transition-colors focus:outline-none"
              >
                <Check className="w-3.5 h-3.5" strokeWidth={3} /> Submit
              </button>
              <button onClick={() => window.print()} className="bg-[#4F46E5] hover:bg-[#4338ca] text-white px-4 py-1.5 rounded-[3px] text-[13px] font-medium flex items-center justify-center gap-1.5 transition-colors focus:outline-none">
                <Printer className="w-[14px] h-[14px]" strokeWidth={2} /> Print
              </button>
            </div>
          </div>

          {/* Bottom Table */}
          <div className="w-full mb-1">
            <div className="table-scroll w-full overflow-x-auto">
              <table className="w-full border-collapse">
                <thead>
                  <tr className="bg-[#343a40] text-white">
                    <th className="py-[6px] px-2 text-left text-[11px] font-bold border-r border-gray-500 w-[60px] whitespace-nowrap">S/NO</th>
                    <th className="py-[6px] px-2 text-left text-[11px] font-bold border-r border-gray-500 whitespace-nowrap">Product Name</th>
                    <th className="py-[6px] px-2 text-left text-[11px] font-bold border-r border-gray-500 whitespace-nowrap">Barcode</th>
                    <th className="py-[6px] px-2 text-left text-[11px] font-bold border-r border-gray-500 w-[150px] whitespace-nowrap">Quantity to Print</th>
                    <th className="py-[6px] px-2 text-left text-[11px] font-bold border-r border-gray-500 w-[120px] whitespace-nowrap">Sale Price</th>
                    <th className="py-[6px] px-2 text-center text-[11px] font-bold uppercase w-[80px] whitespace-nowrap">ACTION</th>
                  </tr>
                </thead>
                <tbody>
                  {printList.map((item, index) => (
                    <React.Fragment key={item.id}>
                      <tr className="border-b border-gray-200">
                        <td className="py-2 px-2 text-left text-[12px] font-medium border-r border-gray-200">{index + 1}</td>
                        <td className="py-2 px-2 text-left text-[12px] font-medium border-r border-gray-200">{item.name}</td>
                        <td className="py-2 px-2 text-left text-[12px] font-medium border-r border-gray-200">{item.barcode}</td>
                        <td className="py-2 px-2 text-left text-[12px] font-medium border-r border-gray-200">{item.quantity}</td>
                        <td className="py-2 px-2 text-left text-[12px] font-medium border-r border-gray-200">{item.salePrice}</td>
                        <td className="py-2 px-2 text-center">
                          <div className="flex items-center justify-center gap-2">
                            <button
                              onClick={() => {
                                setPrintRowQty(item.quantity || 1);
                                setPrintRowModal(item);
                              }}
                              className="text-[#4F46E5] hover:text-[#4338ca] bg-[#e0f7fa] p-1.5 rounded-sm transition-colors focus:outline-none"
                              title="Print"
                            >
                              <Printer className="w-3.5 h-3.5" />
                            </button>
                            <button
                              onClick={() => handleEditItem(item)}
                              className="text-[#0d6efd] hover:text-[#0b5ed7] bg-[#e6f0ff] p-1.5 rounded-sm transition-colors focus:outline-none"
                              title="Edit"
                            >
                              <Edit className="w-3.5 h-3.5" />
                            </button>
                            <button
                              onClick={() => handleRemoveFromList(item.id)}
                              className="text-[#dc3545] hover:text-[#c82333] bg-[#fce4e4] p-1.5 rounded-sm transition-colors focus:outline-none"
                              title="Delete"
                            >
                              <Trash2 className="w-3.5 h-3.5" />
                            </button>
                          </div>
                        </td>
                      </tr>
                      {printRowModal && printRowModal.id === item.id && (
                        <tr className="bg-[#8fbce8] border-b border-[#7da9d6] print:hidden">
                          <td colSpan="6" className="py-2 px-4">
                            <div className="flex items-center justify-center gap-4">
                              <span className="text-[#1a365d] font-bold text-[13px]">Enter Quantity to Print:</span>
                              <input
                                type="number"
                                value={printRowQty}
                                onChange={(e) => setPrintRowQty(e.target.value)}
                                className="w-[60px] h-[26px] bg-[#d0e5f5] border border-blue-400 rounded-[3px] text-center font-bold text-blue-700 outline-none"
                                min="1"
                              />
                              <button
                                onClick={() => {
                                  window.print();
                                  setTimeout(() => setPrintRowModal(null), 100);
                                }}
                                className="bg-[#28a745] hover:bg-[#218838] text-white px-3 py-1 rounded-[3px] font-bold text-[12px] flex items-center gap-1 shadow-sm"
                              >
                                <Printer className="w-3.5 h-3.5" /> Print
                              </button>
                              <button
                                onClick={() => setPrintRowModal(null)}
                                className="bg-[#6c757d] hover:bg-[#5a6268] text-white px-3 py-1 rounded-[3px] font-bold text-[12px] flex items-center gap-1 shadow-sm"
                              >
                                <X className="w-3.5 h-3.5" /> Cancel
                              </button>
                            </div>
                          </td>
                        </tr>
                      )}
                    </React.Fragment>
                  ))}
                  {printList.length === 0 && (
                    <tr>
                      <td colSpan="6" className="text-center py-4 text-gray-500 text-[12px]">No barcodes added to print list.</td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
            <div className="h-6 w-full border border-t-0 border-gray-300"></div>
          </div>
        </div>

        {/* Edit Modal */}
        {editingItem && (
          <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-[9999]">
            <div className="bg-white rounded-[3px] p-5 w-[400px] shadow-2xl">
              <h2 className="text-[15px] font-bold text-gray-800 mb-4 border-b pb-2">Edit Print Item</h2>
              <div className="flex flex-col gap-3">
                <div className="flex flex-col gap-1.5">
                  <label className="text-[13px] font-bold text-gray-800">Quantity to Print</label>
                  <input
                    type="number"
                    className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 focus:border-[#4F46E5]"
                    value={editingItem.quantity}
                    onChange={e => setEditingItem({ ...editingItem, quantity: e.target.value })}
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-[13px] font-bold text-gray-800">Sale Price</label>
                  <input
                    type="text"
                    className="w-full h-[32px] border border-gray-300 rounded-[3px] px-2 text-[13px] outline-none text-gray-700 focus:border-[#4F46E5]"
                    value={editingItem.salePrice}
                    onChange={e => setEditingItem({ ...editingItem, salePrice: e.target.value })}
                  />
                </div>
                <div className="flex gap-2 justify-end mt-4">
                  <button className="bg-gray-400 hover:bg-gray-500 text-white px-4 py-1.5 rounded-[3px] text-[13px] font-medium transition-colors" onClick={() => setEditingItem(null)}>Cancel</button>
                  <button className="bg-[#0d6efd] hover:bg-[#0b5ed7] text-white px-4 py-1.5 rounded-[3px] text-[13px] font-medium transition-colors" onClick={() => {
                    setPrintList(printList.map(i => i.id === editingItem.id ? editingItem : i));
                    setEditingItem(null);
                  }}>Save Changes</button>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Item Master Modal (for adding/editing products) */}
        <ItemMasterModal
          isOpen={isItemModalOpen}
          onClose={() => setIsItemModalOpen(false)}
          editData={itemModalData}
          onSave={async (newItem) => {
            try {
              // Auto-create category if new
              if (newItem.category && newItem.category.trim() !== '') {
                try {
                  const catRes = await apiClient.get('/categories');
                  const existingCategories = catRes.data?.data || [];
                  const exists = existingCategories.some(
                    c => c.name.toLowerCase() === newItem.category.trim().toLowerCase()
                  );
                  if (!exists) {
                    await apiClient.post('/categories', {
                      name: newItem.category.trim(),
                      purchaseDiscount: 0,
                      saleDiscount: 0,
                      isActive: true,
                      attributes: []
                    });
                  }
                } catch (catErr) {
                  console.error('Failed to auto-create category:', catErr);
                }
              }

              const payload = {
                ...newItem,
                sku: newItem.sku || `SKU${Date.now()}-${Math.floor(1000 + Math.random() * 9000)}`,
                price: parseFloat(newItem.price) || 0,
                mrp: parseFloat(newItem.mrp) || 0,
                stock: parseInt(newItem.qty) || 0,
              };

              const isEdit = itemModalData && itemModalData.id;
              const res = isEdit
                ? await apiClient.put(`/products/${itemModalData.id}`, payload)
                : await apiClient.post('/products', payload);

              if (res.data?.success) {
                await fetchInitialData();
                if (res.data.data && res.data.data.id) {
                  setSelectedProduct(res.data.data.id.toString());
                } else if (!isEdit) {
                  // Try to select by name if ID isn't returned
                  const updatedProdRes = await apiClient.get('/products');
                  const allProds = updatedProdRes.data?.data || [];
                  const justAdded = allProds.find(p => p.name === payload.name);
                  if (justAdded) setSelectedProduct(justAdded.id.toString());
                }
              }
            } catch (error) {
              console.error('Failed to save product:', error);
              alert('Failed to save product');
            }
            setIsItemModalOpen(false);
          }}
          products={products}
        />
      </div>

      {/* Hidden Print Section for QR Codes */}
      {(() => {
        const parseMmVal = (val, defaultVal = 0) => {
          if (!val) return defaultVal;
          const num = parseFloat(val.toString().replace(/mm/gi, '').trim());
          return isNaN(num) ? defaultVal : num;
        };

        const isThermalMode = (activeTemplate?.barcodeFormat === 'Thermal Roll' || printerType === 'Thermal Roll');
        const hasBorder = activeTemplate?.showBorder !== false;

        const singleLabelWidthMm = parseMmVal(activeTemplate?.pageWidth || pageWidth, 50);
        const labelHeightMm = parseMmVal(activeTemplate?.pageHeight || pageHeight, 25);
        const labelsPerRow = Math.max(1, parseInt(activeTemplate?.labelsInRow || labelCount) || 1);
        const labelGapMm = parseMmVal(activeTemplate?.labelGap || labelGap, 1);
        const leftMarginMm = parseMmVal(activeTemplate?.leftMargin || leftMargin, 0.5);
        const rightMarginMm = parseMmVal(activeTemplate?.rightMargin || rightMargin, 0.5);

        const totalRollWidthMm = isThermalMode
          ? ((singleLabelWidthMm * labelsPerRow) + (Math.max(0, labelsPerRow - 1) * labelGapMm) + leftMarginMm + rightMarginMm)
          : 210;

        const itemsToPrint = printRowModal
          ? Array.from({ length: Math.max(1, parseInt(printRowQty) || 1) }).map(() => printRowModal)
          : printList.flatMap(item => Array.from({ length: Math.max(1, parseInt(item.quantity) || 1) }).map(() => item));

        const renderItemInner = (item, keyIndex) => {
          const fullProd = products.find(p => p.id?.toString() === item.productId?.toString());
          const prodData = {
            name: item.name || fullProd?.name || 'Product',
            mrp: item.mrp ?? fullProd?.mrp ?? 0,
            salePrice: item.salePrice ?? item.price ?? fullProd?.salesPrice ?? fullProd?.price ?? 0,
            wholesalePrice: item.wholesalePrice ?? fullProd?.wholesalePrice ?? 0,
            barcode: item.barcode || fullProd?.barcode || item.id?.toString() || '12345678',
            unit: item.unit || item.primaryUnit || fullProd?.baseUnit || fullProd?.salesUnit || '',
            category: item.category || item.categoryName || fullProd?.category?.name || fullProd?.category || '',
            brand: item.brand || item.brandName || fullProd?.brand?.name || fullProd?.brand || '',
            batchNo: item.batchNo || item.batch_no || fullProd?.batchNo || fullProd?.batch_no || '',
            location: item.location || item.rack || fullProd?.location || fullProd?.rack || '',
            size: item.size || fullProd?.size || '',
            color: item.color || fullProd?.color || fullProd?.colour || '',
            grn: item.grn || fullProd?.grn || '',
            discount: item.discount || fullProd?.discount || '0%'
          };

          const tmplElements = getParsedElements(activeTemplate);
          const hasCustomElements = tmplElements && tmplElements.length > 0;

          if (hasCustomElements) {
            return (
              <div
                key={keyIndex}
                className="print-item bg-white box-border relative overflow-hidden"
                style={{
                  width: isThermalMode ? `${singleLabelWidthMm}mm` : (labelsPerRow > 1 ? '100%' : `${singleLabelWidthMm}mm`),
                  height: `${labelHeightMm}mm`,
                  border: activeTemplate?.showBorder !== false ? '1.5px solid #000000' : 'none',
                  borderRadius: '2px',
                  boxSizing: 'border-box',
                  backgroundColor: '#ffffff',
                  position: 'relative'
                }}
              >
                {tmplElements.map(el => renderTemplateElement(el, prodData, activeTemplate))}
              </div>
            );
          }

          const format = activeTemplate?.barcodeFormat || 'Format 4';
          const isOneDBarcode = format === 'Format 1' || format === 'Format 2';

          return (
            <div
              key={keyIndex}
              className="print-item bg-white box-border flex items-center justify-between gap-3 overflow-hidden rounded-[4px]"
              style={{
                width: isThermalMode ? `${singleLabelWidthMm}mm` : undefined,
                height: `${labelHeightMm}mm`,
                border: '1.5px solid #000000',
                borderRadius: '4px',
                padding: '2mm 3mm',
                boxSizing: 'border-box',
                backgroundColor: '#ffffff'
              }}
            >
              {/* Left Details */}
              <div 
                className="flex flex-col items-start justify-center pr-1 overflow-hidden" 
                style={{ flex: '0 1 auto', minWidth: 0, maxWidth: activeTemplate?.hideBarcode ? '100%' : 'calc(100% - 70px)' }}
              >
                {activeTemplate?.showHeading !== false && (
                  <span 
                    style={{ fontSize: activeTemplate?.headingFontSize || '9px' }} 
                    className="font-bold text-[#034694] leading-none uppercase w-full truncate block"
                  >
                    {activeTemplate?.barcodeHeading || 'SWAYAM BILL'}
                  </span>
                )}
                <span 
                  style={{ fontSize: activeTemplate?.productFontSize || '11px', lineHeight: '1.1' }} 
                  className={`font-extrabold text-[#034694] uppercase mt-[2px] block w-full ${
                    activeTemplate?.showMultiLine ? 'break-words line-clamp-2' : 'truncate'
                  }`}
                >
                  {item.name || fullProd?.name || 'Product'}
                </span>
                <div className="flex flex-col mt-[2px] w-full text-left">
                  {activeTemplate?.showCategory && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Cat: </span>{item.category || item.categoryName || fullProd?.category?.name || fullProd?.category || ''}
                    </span>
                  )}
                  {activeTemplate?.showBrand && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Brand: </span>{item.brand || item.brandName || fullProd?.brand?.name || fullProd?.brand || ''}
                    </span>
                  )}
                  {activeTemplate?.showSize && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Size: </span>{item.size || fullProd?.size || ''}
                    </span>
                  )}
                  {activeTemplate?.showColor && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Color: </span>{item.color || fullProd?.color || fullProd?.colour || ''}
                    </span>
                  )}
                  {activeTemplate?.showUnit && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Unit: </span>{item.unit || item.primaryUnit || fullProd?.baseUnit || fullProd?.salesUnit || ''}
                    </span>
                  )}
                  {activeTemplate?.showBatchNo && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Batch: </span>{item.batchNo || item.batch_no || fullProd?.batchNo || fullProd?.batch_no || ''}
                    </span>
                  )}
                  {activeTemplate?.showImei && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">IMEI: </span>{item.imei || fullProd?.imei || ''}
                    </span>
                  )}
                  {activeTemplate?.showLocation && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Loc: </span>{item.location || item.rack || fullProd?.location || fullProd?.rack || ''}
                    </span>
                  )}
                  {activeTemplate?.grnNumber && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">GRN: </span>{item.grn || fullProd?.grn || ''}
                    </span>
                  )}
                  {activeTemplate?.showMRP !== false && (
                    <span 
                      style={{ fontSize: activeTemplate?.mrpFontSize || '9px' }} 
                      className={`font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden ${
                        activeTemplate?.crossMRP ? 'line-through text-gray-500' : ''
                      }`}
                    >
                      <span className="text-black font-semibold">MRP: </span>{item.mrp || fullProd?.mrp || 0}
                    </span>
                  )}
                  {activeTemplate?.showSalePrice !== false && (
                    <span style={{ fontSize: activeTemplate?.salePriceFontSize || '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Price: </span>{item.salePrice || item.price || fullProd?.salesPrice || fullProd?.price || 0}
                    </span>
                  )}
                  {activeTemplate?.showWholeSalePrice && (
                    <span style={{ fontSize: '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Wholesale: </span>{item.wholesalePrice || fullProd?.wholesalePrice || 0}
                    </span>
                  )}
                  {activeTemplate?.showDiscount && (
                    <span style={{ fontSize: activeTemplate?.discountFontSize || '9px' }} className="font-bold text-[#034694] w-full break-words line-clamp-1 overflow-hidden">
                      <span className="text-black font-semibold">Disc: </span>{item.discount || fullProd?.discount || '0%'}
                    </span>
                  )}
                </div>
              </div>

              {/* Right QR or Barcode */}
              {!activeTemplate?.hideBarcode && (
                <div className="flex flex-col items-center justify-center shrink-0" style={{ flex: '0 0 68px', width: '68px', minWidth: '68px', maxWidth: '68px' }}>
                  {isOneDBarcode ? (
                    <Barcode
                      value={String(item.barcode || fullProd?.barcode || item.id || '12345').trim()}
                      width={parseFloat(activeTemplate?.barcodeWidth) || 1.2}
                      height={parseFloat(activeTemplate?.barcodeHeight) || 28}
                      fontSize={parseFloat(activeTemplate?.footerFontSize) || 8}
                      margin={0}
                      displayValue={false}
                      background="transparent"
                    />
                  ) : (
                    <QRCodeSVG
                      value={`${window.location.origin}/product/${encodeURIComponent(item.barcode || fullProd?.barcode || item.productId || item.id || '12345')}`}
                      size={68}
                      level="M"
                      fgColor="#000000"
                      bgColor="#ffffff"
                      includeMargin={false}
                    />
                  )}
                  <span style={{ fontSize: activeTemplate?.footerFontSize || '8px' }} className="font-bold text-[#034694] mt-[2px] tracking-wide w-full text-center truncate block">
                    {item.barcode || fullProd?.barcode || item.id?.toString() || '12345'}
                  </span>
                </div>
              )}
            </div>
          );
        };

        return (
          <>
            <style>
              {`
                @media print {
                  @page {
                    size: ${isThermalMode ? `${totalRollWidthMm}mm ${labelHeightMm}mm` : 'A4 portrait'};
                    margin: 0 !important;
                  }
                  html, body, #root {
                    margin: 0 !important;
                    padding: 0 !important;
                    ${isThermalMode ? `width: ${totalRollWidthMm}mm !important;` : ''}
                    background-color: white !important;
                    height: auto !important;
                    min-height: 0 !important;
                    -webkit-print-color-adjust: exact !important;
                    print-color-adjust: exact !important;
                  }
                  nav, aside, header, .no-print, button {
                    display: none !important;
                  }
                  body * { visibility: hidden; }
                  #qr-print-section, #qr-print-section * { visibility: visible; }
                  #qr-print-section {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: ${isThermalMode ? `${totalRollWidthMm}mm` : '100%'};
                    display: ${isThermalMode ? 'block' : (labelsPerRow > 1 ? 'grid' : 'flex')};
                    ${!isThermalMode && labelsPerRow > 1 ? `grid-template-columns: repeat(${labelsPerRow}, 1fr);` : ''}
                    ${!isThermalMode ? `gap: ${activeTemplate?.heightGap || heightGap || '2mm'} ${activeTemplate?.labelGap || labelGap || '2mm'};` : ''}
                    padding: ${isThermalMode ? '0' : '10mm 8mm'};
                    margin: 0;
                    box-sizing: border-box;
                    -webkit-print-color-adjust: exact !important;
                    print-color-adjust: exact !important;
                  }
                  .barcode-row {
                    width: ${totalRollWidthMm}mm;
                    height: ${labelHeightMm}mm;
                    display: flex;
                    flex-direction: row;
                    gap: ${labelGapMm}mm;
                    padding-left: ${leftMarginMm}mm;
                    padding-right: ${rightMarginMm}mm;
                    page-break-after: always;
                    break-after: page;
                    box-sizing: border-box;
                    align-items: center;
                    overflow: hidden;
                  }
                  .print-item {
                    width: ${isThermalMode ? `${singleLabelWidthMm}mm` : (labelsPerRow > 1 ? '100%' : `${singleLabelWidthMm}mm`)};
                    height: ${labelHeightMm}mm;
                    overflow: hidden;
                    box-sizing: border-box;
                    margin: 0;
                    padding: 2mm 3mm !important;
                    border: 1.5px solid #000000 !important;
                    border-radius: 4px !important;
                    background: #ffffff !important;
                    background-color: #ffffff !important;
                    display: flex !important;
                    justify-content: space-between !important;
                    align-items: center !important;
                    -webkit-print-color-adjust: exact !important;
                    print-color-adjust: exact !important;
                    ${!isThermalMode ? (labelsPerRow > 1
                      ? 'page-break-inside: avoid; break-inside: avoid; page-break-after: avoid; break-after: avoid;'
                      : ((activeTemplate?.pageBreak === 'YES' || activeTemplate?.pageBreak === 'Yes' || pageBreak === 'Yes') ? 'page-break-after: always; break-after: page;' : 'page-break-inside: avoid; break-inside: avoid;')) : ''}
                  }
                }
              `}
            </style>
            <div id="qr-print-section" className="hidden print:block">
              {(() => {
                if (isThermalMode) {
                  const rowChunks = [];
                  for (let i = 0; i < itemsToPrint.length; i += labelsPerRow) {
                    rowChunks.push(itemsToPrint.slice(i, i + labelsPerRow));
                  }

                  return rowChunks.map((chunk, rowIdx) => (
                    <div
                      key={`row-${rowIdx}`}
                      className="barcode-row"
                      style={{
                        width: `${totalRollWidthMm}mm`,
                        height: `${labelHeightMm}mm`,
                        display: 'flex',
                        flexDirection: 'row',
                        gap: `${labelGapMm}mm`,
                        paddingLeft: `${leftMarginMm}mm`,
                        paddingRight: `${rightMarginMm}mm`,
                        pageBreakAfter: 'always',
                        breakAfter: 'page',
                        boxSizing: 'border-box',
                        alignItems: 'center',
                        overflow: 'hidden'
                      }}
                    >
                      {chunk.map((item, colIdx) => renderItemInner(item, `r${rowIdx}-c${colIdx}`))}
                    </div>
                  ));
                } else {
                  return itemsToPrint.map((item, i) => renderItemInner(item, i));
                }
              })()}
            </div>
          </>
        );
      })()}

      {/* Page Setting Modal */}
      {isPageSettingModalOpen && (
        <PageSettingModal
          isOpen={isPageSettingModalOpen}
          onClose={() => setIsPageSettingModalOpen(false)}
          defaultLabel={selectedTemplateName || (templates[0]?.name) || "50mm X 25mm"}
          labelData={activeTemplate || templates[0]}
          onSave={(updatedData) => {
            if (updatedData) {
              setActiveTemplate(prev => ({ ...(prev || {}), ...updatedData }));
              setTemplates(prev => prev.map(t => (t.id && updatedData.id && t.id === updatedData.id) ? { ...t, ...updatedData } : t));
            }
          }}
        />
      )}

    </div>
  );
}
