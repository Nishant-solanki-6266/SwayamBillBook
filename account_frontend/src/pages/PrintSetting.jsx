import React, { useState, useRef, useEffect } from 'react';
import { Search, Bell, ChevronRight, QrCode, X } from 'lucide-react';
import { cn } from '../utils';
import html2canvas from 'html2canvas';
import { jsPDF } from 'jspdf';
import apiClient from '../api/apiClient';
import { Template1 } from './PrintTemplates';

export function PrintSetting() {
    const [pageSize, setPageSize] = useState('2inch');
    const [transactionType, setTransactionType] = useState('General Template');
    const [transactionType2, setTransactionType2] = useState('Income Transaction');
    const [pdfFormat, setPdfFormat] = useState('Thermal Print');
    const [isInvoiceTemplateModalOpen, setIsInvoiceTemplateModalOpen] = useState(false);
    const [isCustomizationOpen, setIsCustomizationOpen] = useState(false);
    const [isHeaderSettingsOpen, setIsHeaderSettingsOpen] = useState(false);

    const [isFooterSettingsOpen, setIsFooterSettingsOpen] = useState(false);
    const [footerSettings, setFooterSettings] = useState({
        showQrCode: true,
        showHsnSummary: false,
        showCurrentOutstanding: false,
        outstandingPosition: 'After this Transaction',
        showPaymentDetails: true,
        labelTermsAndConditions: 'Terms And Conditions',
        labelThankYouNote: 'Thank You Note'
    });

    const [isTableSettingsOpen, setIsTableSettingsOpen] = useState(false);

    const [tableSettings, setTableSettings] = useState({
        thItemName: '',
        thHsnSac: '',
        showThHsnSac: true,
        thGst: '',
        showThGst: true,
        thQty: '',
        showThQty: true,
        thRate: '',
        showThRate: true,
        thDiscount: '',
        showThDiscount: true,
        thTaxableValue: '',
        showThTaxableValue: true,
        thTotalAmount: '',
        showThTotalAmount: true,
        tlIgst: '',
        showTlIgst: true,
        tlCgst: '',
        showTlCgst: true,
        tlSgst: '',
        showTlSgst: true,
        tlCess: '',
        showTlCess: true,
        tlTcs: '',
        showTlTcs: true,
        tlRoundOff: '',
        showTlRoundOff: true,
    });

    const [headerSettings, setHeaderSettings] = useState({
        showLogo: false,
        showMobileNumber: true,
        showEmail: true,
        showQrCode: true,
        labelGstin: 'GSTIN',
        labelInvoiceNumber: 'Invoice Number',
        labelDate: 'Date',
        labelCustomer: 'Customer',
        labelAddress: 'Address',
        labelPartyContact: 'Contact Number',
        labelPartyPan: 'Pan Number',
        labelPartyGstin: 'GSTIN',
        partyContactNumber: true,
        partyPanNumber: true,
        partyGstin: true,
        customFields: [{ name: 'pass BILL3', value: '1' }],
        showMrp: true,
        showPrimaryQty: true,
        showSecondaryQty: true,
        showDiscount1: true,
        showDiscount2: true,
        showDiscount: true,
        showUnit: true,
        showCompanyProductCode: true,
        showBatchNo: true,
        showExpDate: true,
        showHsn: true,
        showPurchasePrice: true
    });

    const [customization, setCustomization] = useState({
        thermalMarginRight: '0',
        thermalNumPrint: '1',
        thermalFontWeight: '400',
        headerCompanyNameB: true,
        headerCompanyNameU: true,
        headerCompanyNameFontSize: '24',
        headerCompanyAddressFontSize: '13',
        headerLabelsFontSize: '11',
        headerContentsFontSize: '11',
        tableHeadingsFontSize: '11',
        tableContentsFontSize: '11',
        tableDescriptionFontSize: '9',
        tableTotalFontSize: '13',
        footerHeadingsFontSize: '11',
        footerContentsFontSize: '11',
        footerTermsFontSize: '12',
        footerNoteFontSize: '12'
    });
    const updateCustomization = (key, value) => {
        setCustomization(prev => ({ ...prev, [key]: value }));
    };

    const [allPrintSettings, setAllPrintSettings] = useState({});
    const [previewInvoice, setPreviewInvoice] = useState(null);
    const [companyProfile, setCompanyProfile] = useState(null);

    useEffect(() => {
        // Fetch company profile on mount
        apiClient.get('/auth/me')
            .then(res => {
                if (res.data?.success && res.data?.data?.company) {
                    setCompanyProfile(res.data.data.company);
                }
            })
            .catch(err => console.error('Failed to load company profile:', err));

        // Fetch print settings on mount
        apiClient.get('/settings')
            .then(res => {
                if (res.data.success && res.data.data) {
                    const settings = res.data.data;
                    if (settings.printSettings) {
                        setAllPrintSettings(settings.printSettings);
                        const currentTypeSettings = settings.printSettings[transactionType2];
                        if (currentTypeSettings) {
                            if (currentTypeSettings.pageSize) setPageSize(currentTypeSettings.pageSize);
                            if (currentTypeSettings.pdfFormat) setPdfFormat(currentTypeSettings.pdfFormat);
                            if (currentTypeSettings.footerSettings) setFooterSettings(prev => ({ ...prev, ...currentTypeSettings.footerSettings }));
                            if (currentTypeSettings.tableSettings) setTableSettings(prev => ({ ...prev, ...currentTypeSettings.tableSettings }));
                            if (currentTypeSettings.headerSettings) setHeaderSettings(prev => ({ ...prev, ...currentTypeSettings.headerSettings }));
                            if (currentTypeSettings.customization) setCustomization(prev => ({ ...prev, ...currentTypeSettings.customization }));
                        }
                    }
                }
            })
            .catch(err => console.error('Failed to load print settings:', err));
    }, []); // Only run once on mount

    useEffect(() => {
        // Map the selected transaction type to the backend Invoice Type enum
        let typeParam = '';
        const t = transactionType2 ? transactionType2.toUpperCase() : '';
        if (t.includes('INCOME TRANSACTION') || t.includes('SALE INVOICE')) typeParam = 'SALES';
        else if (t.includes('EXPENSE TRANSACTION') || t.includes('PURCHASE INVOICE')) typeParam = 'PURCHASE';
        else if (t.includes('ESTIMATE') || t.includes('QUOTE') || t.includes('SALE ORDER')) typeParam = 'QUOTATION';
        else if (t.includes('CHALLAN')) typeParam = 'CHALLAN';
        else if (t.includes('PURCHASE ORDER')) typeParam = 'PURCHASE_ORDER';
        else if (t.includes('RECEIPT')) typeParam = 'SALES';

        const url = typeParam ? `/invoices?type=${typeParam}&limit=1` : '/invoices?limit=1';

        apiClient.get(url)
            .then(res => {
                if (res.data.success && res.data.data && res.data.data.length > 0) {
                    setPreviewInvoice(res.data.data[0]);
                } else {
                    setPreviewInvoice(null);
                }
            })
            .catch(err => console.error('Failed to load invoice:', err));
    }, [transactionType2]);

    const handleTransactionTypeChange = (newType) => {
        const currentConfig = {
            pageSize, transactionType, pdfFormat, footerSettings,
            tableSettings, headerSettings, customization
        };

        setAllPrintSettings(prev => {
            const updatedAllSettings = {
                ...prev,
                [transactionType2]: currentConfig
            };

            const newConfig = updatedAllSettings[newType];
            if (newConfig) {
                if (newConfig.pageSize) setPageSize(newConfig.pageSize);
                if (newConfig.transactionType) setTransactionType(newConfig.transactionType);
                if (newConfig.pdfFormat) setPdfFormat(newConfig.pdfFormat);
                if (newConfig.footerSettings) setFooterSettings(p => ({ ...p, ...newConfig.footerSettings }));
                if (newConfig.tableSettings) setTableSettings(p => ({ ...p, ...newConfig.tableSettings }));
                if (newConfig.headerSettings) setHeaderSettings(p => ({ ...p, ...newConfig.headerSettings }));
                if (newConfig.customization) setCustomization(p => ({ ...p, ...newConfig.customization }));
            }
            return updatedAllSettings;
        });

        setTransactionType2(newType);
    };

    const savePrintSettings = async (showAlertMsg = true) => {
        try {
            const currentConfig = {
                pageSize, transactionType, pdfFormat, footerSettings,
                tableSettings, headerSettings, customization
            };
            const finalSettings = {
                ...allPrintSettings,
                [transactionType2]: currentConfig,
                'POS Billing': {
                    ...(allPrintSettings['POS Billing'] || {}),
                    pageSize,
                    pdfFormat: 'Thermal Print',
                    customization: { ...(allPrintSettings['POS Billing']?.customization || {}), ...customization },
                    headerSettings: { ...(allPrintSettings['POS Billing']?.headerSettings || {}), ...headerSettings },
                    footerSettings: { ...(allPrintSettings['POS Billing']?.footerSettings || {}), ...footerSettings }
                },
                'Thermal Print': {
                    ...(allPrintSettings['Thermal Print'] || {}),
                    pageSize,
                    pdfFormat: 'Thermal Print',
                    customization: { ...(allPrintSettings['Thermal Print']?.customization || {}), ...customization },
                    headerSettings: { ...(allPrintSettings['Thermal Print']?.headerSettings || {}), ...headerSettings },
                    footerSettings: { ...(allPrintSettings['Thermal Print']?.footerSettings || {}), ...footerSettings }
                }
            };
            setAllPrintSettings(finalSettings);

            await apiClient.put('/settings', { printSettings: finalSettings });
            if (showAlertMsg) alert('Settings saved to database successfully!');
            return true;
        } catch (err) {
            console.error('Failed to save print settings:', err);
            alert('Failed to save settings to database.');
            return false;
        }
    };

    const invoiceRef = useRef(null);
    const previewRef = useRef(null);

    // Helper: replace oklch() colors in computed styles with safe fallbacks
    // html2canvas v1.x does not support the CSS oklch() color function (used by Tailwind v4).
    // We walk the cloned DOM and replace any oklch inline styles with a neutral fallback.
    const stripOklchColors = (clonedDoc) => {
        const allElements = clonedDoc.querySelectorAll('*');
        const oklchRegex = /oklch\([^)]*\)/gi;

        allElements.forEach((el) => {
            const style = el.style;
            if (!style) return;

            // List of CSS color properties to sanitize
            const colorProps = [
                'color', 'backgroundColor', 'borderColor', 'borderTopColor',
                'borderRightColor', 'borderBottomColor', 'borderLeftColor',
                'outlineColor', 'boxShadow', 'textDecorationColor', 'fill', 'stroke',
            ];

            colorProps.forEach((prop) => {
                const val = style[prop];
                if (val && oklchRegex.test(val)) {
                    // Replace oklch(...) with a safe fallback
                    style[prop] = val.replace(oklchRegex, '#000000');
                }
                oklchRegex.lastIndex = 0; // reset regex state
            });

            // Also handle cssText for any other properties
            if (el.style.cssText && oklchRegex.test(el.style.cssText)) {
                el.style.cssText = el.style.cssText.replace(oklchRegex, '#000000');
                oklchRegex.lastIndex = 0;
            }
        });

        // Also remove any <style> tags that contain oklch (e.g. injected by Tailwind/browser)
        const styleTags = clonedDoc.querySelectorAll('style');
        styleTags.forEach((tag) => {
            if (oklchRegex.test(tag.textContent)) {
                tag.textContent = tag.textContent.replace(oklchRegex, '#000000');
                oklchRegex.lastIndex = 0;
            }
        });
    };

    // Updated handleDownloadPdf to return a boolean indicating success
    const handleDownloadPdf = async (showAlert = false, filename = 'Invoice_Template.pdf') => {
        // First save the settings to backend
        await savePrintSettings(false);

        // If the invoice template modal is open, use its ref. Otherwise, use the main preview ref.
        const element = isInvoiceTemplateModalOpen ? invoiceRef.current : previewRef.current;
        if (!element) return false;
        try {
            const canvas = await html2canvas(element, {
                scale: 2,
                useCORS: true,
                backgroundColor: '#ffffff',
                // Strip oklch() colors from the cloned doc before rendering
                // html2canvas v1.x does not support oklch (used by Tailwind CSS v4)
                onclone: (_clonedDoc, clonedElement) => {
                    stripOklchColors(clonedElement.ownerDocument);
                },
            });
            const imgData = canvas.toDataURL('image/png');

            let pdf;
            // If the user selected Thermal Print (and it's not the Glass Template modal)
            if (pdfFormat === 'Thermal Print' && !isInvoiceTemplateModalOpen) {
                // Determine mm width from pageSize
                const thermalWidth = pageSize === '2inch' ? 58 : pageSize === '3inch' ? 80 : 102;
                const thermalHeight = (canvas.height * thermalWidth) / canvas.width;
                // Create custom PDF size for thermal printer roll
                pdf = new jsPDF('p', 'mm', [thermalWidth, thermalHeight]);
                pdf.addImage(imgData, 'PNG', 0, 0, thermalWidth, thermalHeight);
            } else {
                const orientation = (pdfFormat.includes('Landscape') || pdfFormat === 'A4 Half') ? 'l' : 'p';
                const format = pdfFormat.includes('A5') || pdfFormat === 'A4 Half' ? 'a5' : 'a4';
                pdf = new jsPDF(orientation, 'mm', format);
                const pdfWidth = pdf.internal.pageSize.getWidth();
                const pdfHeight = (canvas.height * pdfWidth) / canvas.width;
                pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            }

            pdf.save(filename);
            // Optionally show an alert after download
            if (showAlert) {
                alert('Invoice PDF downloaded successfully!');
            }
            return true;
        } catch (err) {
            console.error('PDF download error:', err);
            alert('Failed to generate PDF: ' + (err.message || 'Unknown error'));
            return false;
        }
    };

    // In the Invoice Template modal, update Save button to await handleDownloadPdf(true)
    // Find the Save button inside the modal (lines ~1275) and modify its onClick


    // Calculate parsed items and totals
    const parsedItems = previewInvoice?.items?.length > 0
        ? previewInvoice.items.map(i => {
            const rawExp = i.expDate || i.expiryDate || i.expiry || i.product?.expDate || i.product?.expiryDate || i.product?.expiry || '';
            let formattedExp = rawExp;
            if (rawExp && typeof rawExp === 'string' && rawExp.includes('-') && !isNaN(Date.parse(rawExp))) {
                try {
                    formattedExp = new Date(rawExp).toLocaleDateString('en-GB');
                } catch {
                    formattedExp = rawExp;
                }
            }
            return {
                name: (i.product?.name || i.name || 'Unknown') + (i.description ? ` - ${i.description}` : ''),
                productCode: i.productCode || i.product?.sku || i.product?.barcode || i.product?.productCode || '',
                batchNo: i.batchNo || i.product?.batchNo || '',
                expDate: formattedExp || '-',
                hsnCode: i.hsnCode || i.product?.hsnCode || '',
                purchasePrice: i.purchasePrice || i.product?.purchasePrice || '',
                mrp: i.mrp || i.product?.mrp || '',
                qty: i.quantity || 1,
                secQty: i.secOpeningQty || i.product?.secOpeningQty || '',
                priQty: i.primaryOpeningQty || i.quantity || 1,
                unit: i.unit || i.product?.salesUnit || i.product?.purchaseUnit || i.product?.baseUnit || '',
                size: i.size || i.product?.size || '',
                rate: i.price || i.product?.price || 0,
                discount1: i.discount1 || 0,
                discount2: i.discount2 || 0,
                discount: (i.discount1 || 0) + (i.discount2 || 0),
                gstRate: i.gstRate || i.product?.tax || '',
                taxableValue: i.amount || 0,
                totalAmount: i.amount || 0,
                desc: ''
            };
        })
        : [];

    let totalQty = 0;
    let totalTaxable = 0;
    let totalFinal = 0;
    parsedItems.forEach(i => {
        totalQty += Number(i.qty);
        totalTaxable += Number(i.taxableValue);
        totalFinal += Number(i.totalAmount);
    });

    const calculatedGst = parsedItems.reduce((s, i) => s + ((Number(i.taxableValue || 0) * Number(i.gstRate || 0)) / 100), 0);
    const invoiceTaxable = Number(previewInvoice?.subTotal || previewInvoice?.taxableAmount || totalTaxable || 0);
    const invoiceGst = Number(previewInvoice?.totalGstAmount || previewInvoice?.taxAmount || previewInvoice?.gstAmount || calculatedGst || 0);
    const invoiceIgst = Number(previewInvoice?.totalIgst || (previewInvoice?.totalIgst === 0 && calculatedGst > 0 ? calculatedGst : 0));
    const invoiceCgst = Number(previewInvoice?.totalCgst || 0);
    const invoiceSgst = Number(previewInvoice?.totalSgst || 0);
    const invoiceTcs = Number(previewInvoice?.tcsAmount || 0);
    const invoiceCess = Number(previewInvoice?.cessAmount || previewInvoice?.cess || 0);
    const invoiceRoundOff = Number(previewInvoice?.roundOff || 0);
    const invoiceTotal = Number(previewInvoice?.totalAmount || totalFinal || (invoiceTaxable + invoiceGst));

    const qrUpiId = previewInvoice?.upiId || allPrintSettings?.bankDetails?.upiId || '9000000000@axisbank';
    const qrPayeeName = allPrintSettings?.bankDetails?.bankAccountName || 'Merchant';
    const qrAmount = previewInvoice?.totalAmount ? Number(previewInvoice.totalAmount).toFixed(2) : totalFinal.toFixed(2);
    const qrUpiLink = `upi://pay?pa=${qrUpiId}&pn=${encodeURIComponent(qrPayeeName)}&am=${qrAmount}`;
    const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(qrUpiLink)}`;

    const getFormatStyles = () => {
        switch (pdfFormat) {
            case 'A4': return { width: '210mm', minHeight: '297mm' };
            case 'A5': return { width: '148mm', maxWidth: '148mm', minHeight: '205mm', maxHeight: '210mm', margin: '0 auto', boxSizing: 'border-box', overflow: 'hidden' };
            case 'Landscape A4': return { width: '297mm', minHeight: '210mm' };
            case 'Landscape A5': return { width: '210mm', minHeight: '148mm' };
            case 'Letter Head': return { width: '210mm', minHeight: '297mm', paddingTop: '45mm' };
            case 'A4 Half': return { width: '210mm', minHeight: '148mm' };
            default: return { width: '210mm', minHeight: '297mm' };
        }
    };

    return (
        <div className="flex flex-col h-[calc(100vh-45px)] bg-[#ffffff] overflow-hidden relative">


            <div className="flex flex-1 overflow-hidden">

                {/* Left Column Controls */}
                <div className="w-[300px] border-r border-[#e5e7eb] p-6 flex flex-col gap-6 overflow-y-auto">

                    {/* Dropdowns */}
                    <div className="flex flex-col gap-5">
                        <CustomSelect
                            label="Template Type"
                            value={transactionType}
                            onChange={setTransactionType}
                            options={['General Template', 'Glass Template']}
                        />

                        <CustomSelect
                            label="Transaction Type"
                            value={transactionType2}
                            onChange={handleTransactionTypeChange}
                            options={[
                                'Income Transaction',
                                'Estimate / Quote',
                                'Delivery Challan',
                                'Expense Transaction',
                                'Sale Order',
                                'Receipt'
                            ]}
                        />

                        <CustomSelect
                            label="PDF Format"
                            value={pdfFormat}
                            onChange={setPdfFormat}
                            options={[
                                'A4',
                                'A5',
                                'Thermal Print',
                                'Landscape A4',
                                'Landscape A5',
                                'Letter Head',
                                'A4 Half'
                            ]}
                        />
                    </div>

                    {/* Page Size */}
                    <div className="flex flex-col gap-2">
                        <label className="text-[13px] font-bold text-[#1f2937]">Page Size :</label>
                        <div className="flex items-center gap-3">
                            <button
                                onClick={() => setPageSize('2inch')}
                                className={`px-5 py-1.5 rounded-[4px] text-[13px] font-medium transition-colors ${pageSize === '2inch'
                                    ? 'border border-indigo-200 text-[#4F46E5] bg-[#ffffff]'
                                    : 'bg-[#e9ecef] text-gray-600 border border-transparent'
                                    }`}
                            >
                                2 inch
                            </button>
                            <button
                                onClick={() => setPageSize('3inch')}
                                className={`px-5 py-1.5 rounded-[4px] text-[13px] font-medium transition-colors ${pageSize === '3inch'
                                    ? 'border border-indigo-200 text-[#4F46E5] bg-[#ffffff]'
                                    : 'bg-[#e9ecef] text-gray-600 border border-transparent'
                                    }`}
                            >
                                3 inch
                            </button>
                            <button
                                onClick={() => setPageSize('4inch')}
                                className={`px-5 py-1.5 rounded-[4px] text-[13px] font-medium transition-colors ${pageSize === '4inch'
                                    ? 'border border-indigo-200 text-[#4F46E5] bg-[#ffffff]'
                                    : 'bg-[#e9ecef] text-gray-600 border border-transparent'
                                    }`}
                            >
                                4 inch
                            </button>
                        </div>
                    </div>

                    {/* Menu Items */}
                    <div className="flex flex-col gap-3 mt-2">
                        <MenuItem label="Invoice Template" onClick={() => setIsInvoiceTemplateModalOpen(true)} />
                        <MenuItem label="Customize Format" onClick={() => setIsCustomizationOpen(true)} />
                        <MenuItem label="Header Settings" onClick={() => setIsHeaderSettingsOpen(true)} />
                        <MenuItem label="Table Settings" onClick={() => setIsTableSettingsOpen(true)} />
                        <MenuItem label="Footer Settings" onClick={() => setIsFooterSettingsOpen(true)} />
                    </div>

                </div>

                {/* Right Column Preview */}
                <div className="flex-1 bg-[#fbfbfe] overflow-auto p-8 flex border-l-4 border-[#4F46E5]/10">


                    {(transactionType === 'Glass Template' || pdfFormat !== 'Thermal Print') ? (
                        <>
                            {(pdfFormat === 'A5' || pdfFormat === 'Landscape A5' || pdfFormat === 'A4 Half') && (
                                <style type="text/css" media="print">
                                    {`
                                      @page {
                                        size: ${pdfFormat === 'A5' ? 'A5 portrait' : 'A5 landscape'};
                                        margin: 5mm;
                                      }
                                    `}
                                </style>
                            )}
                            <div
                                ref={previewRef}
                                className={`bg-[#ffffff] shadow-sm shrink-0 text-[#000000] border border-black box-border flex flex-col justify-between w-full h-auto m-auto text-[11px] ${pdfFormat === 'A5' ? 'format-a5' : ''} ${(pdfFormat === 'Landscape A5' || pdfFormat === 'A4 Half') ? 'format-a5-landscape' : ''}`}
                                style={{ ...getFormatStyles(), fontFamily: 'Arial, sans-serif' }}
                            >
                                {/* 1. Header Section */}
                                <div className="w-full flex flex-col border-b border-black">
                                    <div className="flex w-full pt-1.5 px-2 pb-1">
                                        {/* Logo */}
                                        <div className="w-[130px] flex items-center justify-center">
                                            {headerSettings.showLogo && (
                                                (companyProfile?.logo || previewInvoice?.company?.logo) ? (
                                                    <img src={companyProfile?.logo || previewInvoice?.company?.logo} alt="Logo" className="max-h-16 object-contain" />
                                                ) : (
                                                    <div className="flex items-center gap-1.5 p-1">
                                                        <svg className="w-8 h-8 shrink-0 drop-shadow-sm" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <mask id="blue-doc-mask-ps" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                                                <rect width="24" height="24" fill="white" />
                                                                <rect x="10" y="7" width="12" height="14" rx="2" fill="black" />
                                                                <line x1="6" y1="7" x2="10" y2="7" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                                <line x1="6" y1="10" x2="10" y2="10" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                                <line x1="6" y1="13" x2="10" y2="13" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                                <line x1="6" y1="16" x2="11" y2="16" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                            </mask>
                                                            <rect x="2" y="3" width="14" height="18" rx="3" fill="#3b82f6" mask="url(#blue-doc-mask-ps)" />
                                                            <rect x="10" y="7" width="12" height="14" rx="2" fill="white" stroke="#3b82f6" strokeWidth="1.5" />
                                                            <line x1="13" y1="11" x2="19" y2="11" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                            <line x1="13" y1="14" x2="19" y2="14" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                            <line x1="13" y1="17" x2="19" y2="17" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                        </svg>
                                                        <div className="flex flex-col text-left">
                                                            <span className="text-[13px] font-bold text-gray-900 leading-tight">Swayam</span>
                                                            <span className="text-[12px] font-bold text-gray-900 leading-tight">Bill <span className="text-[#3b82f6]">Book</span></span>
                                                        </div>
                                                    </div>
                                                )
                                            )}
                                        </div>
                                        {/* Company Info */}
                                        <div className="flex-1 text-center flex flex-col items-center justify-center px-2 gap-0.5">
                                            <div className="font-bold mb-1">{transactionType2.toUpperCase()} {transactionType2 === 'Income Transaction' ? '( Original )' : ''}</div>
                                            <h2 className="text-[20px] font-bold">{companyProfile?.name || previewInvoice?.company?.name || 'Swayam Bill Book'}</h2>
                                            <p className="text-[12px] text-gray-500 font-medium">{companyProfile?.tagline || 'The Digital Accounting Book'}</p>
                                            <p>{companyProfile?.address || previewInvoice?.company?.address || 'NO, , OPP GRAM PANCHAYAT, SH 31, BELAGAVI, KARNATAKA, INDIA, 591220'}</p>
                                            <p>Tel : {companyProfile?.phone || previewInvoice?.company?.phone || '9845972853'} | {companyProfile?.ownerEmail || companyProfile?.email || previewInvoice?.company?.email || 'swayamsoftwaretarget@gmail.com'}</p>
                                            <p>GSTIN: {companyProfile?.companySetting?.gstin || companyProfile?.gstin || previewInvoice?.company?.gstin || '29DCDPP7499L2ZH'}</p>
                                            <p>pass BILL3: 1</p>
                                        </div>
                                        {/* QR Code */}
                                        {headerSettings.showQrCode && (
                                            <div className="w-[120px] flex items-center justify-center">
                                                <div className="w-[80px] h-[80px] bg-gray-100 flex items-center justify-center">
                                                    <img src={qrCodeUrl} alt="QR Code" className="w-full h-full" />
                                                </div>
                                            </div>
                                        )}
                                    </div>
                                </div>

                                {/* 2. Parties & Invoice Info */}
                                <div className="w-full flex border-b border-black">
                                    {/* Bill To */}
                                    <div className="flex-1 border-r border-black p-2 flex flex-col">
                                        <div className="text-[#4F46E5] mb-1 font-bold">Bill to:</div>
                                        <div className="font-bold uppercase">{previewInvoice?.customer?.name || 'Walk-in Customer'}</div>
                                        {previewInvoice?.customer?.address && <div className="uppercase">{previewInvoice.customer.address}</div>}
                                        {previewInvoice?.customer?.phone && <div className="uppercase">Contact No: {previewInvoice.customer.phone}</div>}
                                        {previewInvoice?.customer?.email && <div>Email: {previewInvoice.customer.email}</div>}
                                        {previewInvoice?.customer?.gstin && <div className="uppercase">GSTIN: {previewInvoice.customer.gstin}</div>}
                                        {previewInvoice?.customer?.pan && <div className="uppercase">PAN: {previewInvoice.customer.pan}</div>}
                                    </div>
                                    {/* Ship To */}
                                    <div className="flex-[0.8] border-r border-black p-2 flex flex-col">
                                        <div className="text-[#4F46E5] mb-1 font-bold">Ship to:</div>
                                        <div className="font-bold uppercase">{previewInvoice?.shippingAddress?.name || previewInvoice?.customer?.name || 'Walk-in Customer'}</div>
                                        {(previewInvoice?.shippingAddress?.address || previewInvoice?.customer?.address) && (
                                            <div className="uppercase">{previewInvoice?.shippingAddress?.address || previewInvoice?.customer?.address}</div>
                                        )}
                                        {(previewInvoice?.shippingAddress?.phone || previewInvoice?.customer?.phone) && (
                                            <div className="uppercase">Contact No: {previewInvoice?.shippingAddress?.phone || previewInvoice?.customer?.phone}</div>
                                        )}
                                        {previewInvoice?.customer?.gstin && <div className="uppercase">GSTIN: {previewInvoice.customer.gstin}</div>}
                                        {previewInvoice?.customer?.pan && <div className="uppercase">PAN: {previewInvoice.customer.pan}</div>}
                                    </div>
                                    {/* Invoice Details */}
                                    <div className="flex-[0.8] p-2 flex flex-col">
                                        <div className="text-[#4F46E5] mb-1 font-bold">Invoice Details:</div>
                                        <div className="flex justify-between"><span className="uppercase">Invoice No:</span> <span className="font-bold uppercase">{previewInvoice?.invoiceNo || 'MA22/2348'}</span></div>
                                        <div className="flex justify-between"><span className="uppercase">Invoice Date:</span> <span className="font-bold uppercase">{previewInvoice?.date ? new Date(previewInvoice.date).toLocaleDateString('en-GB') : '24-08-2023'}</span></div>
                                    </div>
                                </div>

                                {/* 3. Transport Details */}
                                <div className="w-full flex border-b border-black">
                                    <div className="flex-[1.8] border-r border-black p-2 flex flex-col gap-1">
                                        <div className="flex"><span className="w-32">Transport Name:</span> <span className="uppercase">{previewInvoice?.transportName || ''}</span></div>
                                        <div className="flex"><span className="w-32">Document No:</span> <span className="uppercase">{previewInvoice?.documentNo || ''}</span></div>
                                        <div className="flex"><span className="w-32">Document Date:</span> <span className="uppercase">{previewInvoice?.documentDate ? new Date(previewInvoice.documentDate).toLocaleDateString('en-GB') : ''}</span></div>
                                    </div>
                                    <div className="flex-1 p-2 flex flex-col gap-1">
                                        <div className="flex justify-between"><span className="w-32">Ack No:</span> <span className="uppercase">{previewInvoice?.ackNo || ''}</span></div>
                                        <div className="flex justify-between"><span className="w-32">Ack Date:</span> <span className="uppercase">{previewInvoice?.ackDate ? new Date(previewInvoice.ackDate).toLocaleDateString('en-GB') : ''}</span></div>
                                        <div className="flex justify-between"><span className="w-32">IRN:</span> <span className="uppercase">{previewInvoice?.irn || ''}</span></div>
                                    </div>
                                </div>

                                {/* 4. PO / E-way Details */}
                                <div className="w-full flex border-b border-black">
                                    <div className="flex-1 border-r border-black p-2 flex flex-col gap-1">
                                        <div className="flex justify-between"><span>PO No:</span> <span className="uppercase">{previewInvoice?.poNo || ''}</span></div>
                                        <div className="flex justify-between"><span>PO Date:</span> <span className="uppercase">{previewInvoice?.poDate ? new Date(previewInvoice.poDate).toLocaleDateString('en-GB') : ''}</span></div>
                                    </div>
                                    <div className="flex-1 border-r border-black p-2 flex flex-col gap-1">
                                        <div className="flex justify-between"><span>E-way Bill No:</span> <span className="uppercase">{previewInvoice?.ewayBillNo || ''}</span></div>
                                        <div className="flex justify-between"><span>E-way Bill Date:</span> <span className="uppercase">{previewInvoice?.ewayBillDate ? new Date(previewInvoice.ewayBillDate).toLocaleDateString('en-GB') : ''}</span></div>
                                        <div className="flex justify-between"><span>Vehicle No:</span> <span className="uppercase">{previewInvoice?.vehicleNo || ''}</span></div>
                                    </div>
                                    <div className="flex-1 p-2 flex flex-col gap-1">
                                        <div className="flex justify-between"><span>Custom field 1:</span> <span className="uppercase text-gray-500"></span></div>
                                        <div className="flex justify-between"><span>Custom field 2:</span> <span className="uppercase text-gray-500"></span></div>
                                        <div className="flex justify-between"><span>Custom field 3:</span> <span className="uppercase text-gray-500"></span></div>
                                    </div>
                                </div>

                                {/* 5. Main Items Table */}
                                <div className="w-full border-b border-black">
                                    <table className="w-full text-center border-collapse text-[10px] m-0">
                                        <thead>
                                            <tr className="bg-white border-b border-black">
                                                <th className="border-r border-black p-1 font-normal">SN</th>
                                                <th className="border-r border-black p-1 font-normal text-left">Item<br />Name</th>
                                                {headerSettings.showCompanyProductCode && <th className="border-r border-black p-1 font-normal">Product<br />Code</th>}
                                                {headerSettings.showBatchNo && <th className="border-r border-black p-1 font-normal">Batch<br />No</th>}
                                                {headerSettings.showExpDate && <th className="border-r border-black p-1 font-normal">Exp<br />Date</th>}
                                                {headerSettings.showHsn && <th className="border-r border-black p-1 font-normal">HSN/<br />SAC</th>}
                                                {headerSettings.showPurchasePrice && <th className="border-r border-black p-1 font-normal">Purchase<br />Price</th>}
                                                {headerSettings.showMrp && <th className="border-r border-black p-1 font-normal">MRP</th>}
                                                {headerSettings.showSecondaryQty && <th className="border-r border-black p-1 font-normal">Sec.<br />Qty</th>}
                                                {headerSettings.showPrimaryQty && <th className="border-r border-black p-1 font-normal">Pri.<br />Qty</th>}
                                                {headerSettings.showUnit && <th className="border-r border-black p-1 font-normal">Unit</th>}
                                                <th className="border-r border-black p-1 font-normal">Size</th>
                                                <th className="border-r border-black p-1 font-normal">Rate</th>
                                                {headerSettings.showDiscount1 && <th className="border-r border-black p-1 font-normal">Dis.<br />1</th>}
                                                {headerSettings.showDiscount2 && <th className="border-r border-black p-1 font-normal">Dis.<br />2</th>}
                                                {headerSettings.showDiscount && <th className="border-r border-black p-1 font-normal">Total<br />Dis.</th>}
                                                <th className="border-r border-black p-1 font-normal">GST<br />(%)</th>
                                                <th className="p-1 font-normal text-right">Taxable<br />Value</th>
                                            </tr>
                                        </thead>
                                        <tbody className="align-top">
                                            {parsedItems.map((item, idx) => (
                                                <tr key={idx}>
                                                    <td className="border-r border-black p-1 pt-2">{idx + 1}</td>
                                                    <td className="border-r border-black p-1 pt-2 text-left h-[50px]">
                                                        {item.name}
                                                        {item.desc && <><br /><span className="text-[9px]">{item.desc}</span></>}
                                                    </td>
                                                    {headerSettings.showCompanyProductCode && <td className="border-r border-black p-1 pt-2">{item.productCode || '-'}</td>}
                                                    {headerSettings.showBatchNo && <td className="border-r border-black p-1 pt-2">{item.batchNo || '-'}</td>}
                                                    {headerSettings.showExpDate && <td className="border-r border-black p-1 pt-2">{item.expDate || item.expiryDate || item.expiry || '-'}</td>}
                                                    {headerSettings.showHsn && <td className="border-r border-black p-1 pt-2">{item.hsnCode || '-'}</td>}
                                                    {headerSettings.showPurchasePrice && <td className="border-r border-black p-1 pt-2">{item.purchasePrice || '-'}</td>}
                                                    {headerSettings.showMrp && <td className="border-r border-black p-1 pt-2">{item.mrp || '-'}</td>}
                                                    {headerSettings.showSecondaryQty && <td className="border-r border-black p-1 pt-2">{item.secQty || '-'}</td>}
                                                    {headerSettings.showPrimaryQty && <td className="border-r border-black p-1 pt-2">{item.priQty || '-'}</td>}
                                                    {headerSettings.showUnit && <td className="border-r border-black p-1 pt-2">{item.unit || '-'}</td>}
                                                    <td className="border-r border-black p-1 pt-2">{item.size || '-'}</td>
                                                    <td className="border-r border-black p-1 pt-2">{item.rate || '-'}</td>
                                                    {headerSettings.showDiscount1 && <td className="border-r border-black p-1 pt-2">{item.discount1 > 0 ? item.discount1 : '-'}</td>}
                                                    {headerSettings.showDiscount2 && <td className="border-r border-black p-1 pt-2">{item.discount2 > 0 ? item.discount2 : '-'}</td>}
                                                    {headerSettings.showDiscount && <td className="border-r border-black p-1 pt-2">{item.discount > 0 ? item.discount : '-'}</td>}
                                                    <td className="border-r border-black p-1 pt-2">{item.gstRate || '-'}</td>
                                                    <td className="p-1 pt-2 text-right">₹{item.taxableValue}</td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>

                                <div className="w-full flex border-b border-black text-[10px]">
                                    <div className="flex-[4] border-r border-black text-right p-1 font-bold">Total:</div>
                                    <div className="flex-1 border-r border-black p-1"></div>
                                    <div className="flex-1 border-r border-black p-1"></div>
                                    <div className="flex-1 border-r border-black p-1"></div>
                                    <div className="flex-1 border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-[0.5] border-r border-black p-1"></div>
                                    <div className="flex-1 p-1 text-right font-bold">₹{totalTaxable.toFixed(2)}</div>
                                </div>

                                {/* 6. Footer Layout */}
                                <div className="w-full flex border-b border-black">
                                    {/* Left side info */}
                                    <div className="flex-[1.8] border-r border-black flex flex-col">
                                        <div className="p-0.5 border-b border-black text-[10px]">
                                            <div className="font-bold mb-1">Terms and Conditions:</div>
                                            <div className="mb-1">{footerSettings?.labelTermsAndConditions || "Terms and Conditions"}</div>
                                            <p className="mb-2 text-gray-700">{previewInvoice?.terms || ''}</p>

                                            <div className="font-bold mb-1">Notes:</div>
                                            <p className="text-gray-700">{previewInvoice?.notes || footerSettings?.labelThankYouNote || ''}</p>
                                        </div>
                                        <div className="p-0.5 flex flex-col justify-end flex-1">
                                            <div className="flex gap-2"><span>In Words:</span> <span>{previewInvoice?.amountInWords || ''}</span></div>
                                            {footerSettings?.showPaymentDetails !== false && (
                                                <div className="flex gap-2"><span>Payment Details:</span> <span>{previewInvoice?.paymentMode || 'Cash / Bank Transfer'}</span></div>
                                            )}
                                            {footerSettings?.showCurrentOutstanding && (
                                                <div className="flex gap-2">
                                                    <span>Current Outstanding ({footerSettings.outstandingPosition || 'After this Transaction'}):</span>
                                                    <span>₹{Number(previewInvoice?.currentOutstanding ?? previewInvoice?.customer?.balance ?? 0).toFixed(2)}</span>
                                                </div>
                                            )}
                                        </div>
                                    </div>

                                    {/* Right side summary */}
                                    <div className="flex-1 flex flex-col">
                                        <div className="p-0.5 border-b border-black flex flex-col gap-1 flex-1">
                                            <div className="flex justify-between"><span>Credit Period:</span> <span>{previewInvoice?.creditPeriod ? `${previewInvoice.creditPeriod} Days` : ''}</span></div>
                                            <div className="flex justify-between"><span>Due Date:</span> <span>{previewInvoice?.dueDate ? new Date(previewInvoice.dueDate).toLocaleDateString('en-GB') : ''}</span></div>
                                            <div className="flex justify-between mt-2"><span>Broker:</span> <span>{previewInvoice?.brokerName || ''}</span></div>
                                            <div className="flex justify-between"><span>GSTIN:</span> <span>{previewInvoice?.customer?.gstin || ''}</span></div>
                                        </div>

                                        <div className="p-0.5 border-b border-black flex flex-col gap-1">
                                            <div className="flex justify-between"><span>{tableSettings?.thTaxableValue || 'Taxable Value'}:</span> <span>₹{invoiceTaxable.toFixed(2)}</span></div>
                                            {invoiceIgst > 0 ? (
                                                <div className="flex justify-between"><span>{tableSettings?.tlIgst || 'IGST'}:</span> <span>₹{invoiceIgst.toFixed(2)}</span></div>
                                            ) : (invoiceCgst > 0 || invoiceSgst > 0) ? (
                                                <>
                                                    <div className="flex justify-between"><span>{tableSettings?.tlCgst || 'CGST'}:</span> <span>₹{invoiceCgst.toFixed(2)}</span></div>
                                                    <div className="flex justify-between"><span>{tableSettings?.tlSgst || 'SGST'}:</span> <span>₹{invoiceSgst.toFixed(2)}</span></div>
                                                </>
                                            ) : (
                                                <div className="flex justify-between"><span>{tableSettings?.thGst || 'GST'}:</span> <span>₹{invoiceGst.toFixed(2)}</span></div>
                                            )}
                                            <div className="flex justify-between"><span>{tableSettings?.tlTcs || 'TCS'}:</span> <span>₹{invoiceTcs.toFixed(2)}</span></div>
                                            <div className="flex justify-between"><span>{tableSettings?.tlCess || 'Cess'}:</span> <span>₹{invoiceCess.toFixed(2)}</span></div>
                                            <div className="flex justify-between"><span>{tableSettings?.tlRoundOff || 'Round off'}:</span> <span>₹{invoiceRoundOff.toFixed(2)}</span></div>
                                        </div>

                                        <div className="p-0.5 flex justify-between font-bold text-[12px] h-full items-end">
                                            <span>Total:</span> <span>₹{invoiceTotal.toFixed(2)}</span>
                                        </div>
                                    </div>
                                </div>

                                {/* 7. Tax Breakup Table */}
                                {footerSettings?.showHsnSummary !== false && (
                                    <div className="w-full border-b border-black">
                                        <table className="w-full text-center border-collapse text-[10px] m-0">
                                            <thead>
                                                <tr className="bg-white border-b border-black">
                                                    <th className="border-r border-black p-1 font-bold w-12">SN</th>
                                                    <th className="border-r border-black p-1 font-bold">HSN/SAC</th>
                                                    <th className="border-r border-black p-1 font-bold">Taxable Amount</th>
                                                    <th className="border-r border-black p-1 font-bold">GST (%)</th>
                                                    <th className="border-r border-black p-1 font-bold">IGST</th>
                                                    <th className="p-1 font-bold">Total Tax</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {parsedItems && parsedItems.length > 0 ? (
                                                    parsedItems.map((item, idx) => {
                                                        const itemTaxable = Number(item.taxableValue || 0);
                                                        const rate = Number(item.gstRate || 0);
                                                        const itemTax = (itemTaxable * rate) / 100;
                                                        return (
                                                            <tr key={idx}>
                                                                <td className="border-r border-black p-1">{idx + 1}</td>
                                                                <td className="border-r border-black p-1">{item.hsnCode || '-'}</td>
                                                                <td className="border-r border-black p-1">₹{itemTaxable.toFixed(2)}</td>
                                                                <td className="border-r border-black p-1">{rate}%</td>
                                                                <td className="border-r border-black p-1">₹{itemTax.toFixed(2)}</td>
                                                                <td className="p-1">₹{itemTax.toFixed(2)}</td>
                                                            </tr>
                                                        );
                                                    })
                                                ) : (
                                                    <tr>
                                                        <td className="border-r border-black p-1">1</td>
                                                        <td className="border-r border-black p-1">-</td>
                                                        <td className="border-r border-black p-1">₹{totalTaxable.toFixed(2)}</td>
                                                        <td className="border-r border-black p-1">0%</td>
                                                        <td className="border-r border-black p-1">₹0.00</td>
                                                        <td className="p-1">₹0.00</td>
                                                    </tr>
                                                )}
                                                <tr className="border-t border-black font-bold">
                                                    <td colSpan="2" className="border-r border-black p-1">Total</td>
                                                    <td className="border-r border-black p-1">₹{totalTaxable.toFixed(2)}</td>
                                                    <td className="border-r border-black p-1"></td>
                                                    <td className="border-r border-black p-1">
                                                        ₹{Number(previewInvoice?.totalIgst ?? previewInvoice?.totalGstAmount ?? 0).toFixed(2)}
                                                    </td>
                                                    <td className="p-1">
                                                        ₹{Number(previewInvoice?.totalGstAmount ?? previewInvoice?.taxAmount ?? previewInvoice?.gstAmount ?? 0).toFixed(2)}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                )}

                                {/* 8. Bottom Footer */}
                                <div className="w-full border-t border-black grid grid-cols-2 text-[6.8px] leading-[1.15] box-border mt-auto">
                                    <div className="p-1 border-r border-black flex flex-col justify-center gap-[1px]">
                                        <p><strong>Bank:</strong> {previewInvoice?.bankName || allPrintSettings?.bankDetails?.bankName || '-'}</p>
                                        <p><strong>IFSC Code:</strong> {previewInvoice?.bankIfsc || allPrintSettings?.bankDetails?.bankIfsc || '-'}</p>
                                        <p><strong>A/C Number:</strong> {previewInvoice?.bankAccountNo || allPrintSettings?.bankDetails?.bankAccountNo || '-'}</p>
                                        <p><strong>Bank Branch:</strong> {previewInvoice?.bankBranch || allPrintSettings?.bankDetails?.bankBranch || '-'}</p>
                                        <p><strong>A/C Name:</strong> {previewInvoice?.bankAccountName || allPrintSettings?.bankDetails?.bankAccountName || '-'}</p>
                                        <p><strong>UPI ID:</strong> {previewInvoice?.upiId || allPrintSettings?.bankDetails?.upiId || '-'}</p>
                                    </div>
                                    <div className="p-1 flex flex-col justify-between items-end text-right min-h-[45px] pb-1">
                                        <p className="font-semibold">For, {companyProfile?.name || previewInvoice?.company?.name || 'Authorized Signatory'}</p>
                                        <p className="font-medium text-[6px]">Authorized Signatory</p>
                                    </div>
                                </div>

                            </div>
                        </>
                    ) : (
                        <div
                            ref={previewRef}
                            className={`bg-[#ffffff] shadow-sm p-2 flex flex-col items-center shrink-0 mx-auto ${pageSize === '2inch' ? 'w-[58mm]' : pageSize === '3inch' ? 'w-[80mm]' : 'w-[102mm]'}`}
                            style={{
                                paddingRight: customization.thermalMarginRight ? `calc(20px + ${customization.thermalMarginRight}mm)` : undefined,
                                fontWeight: customization.thermalFontWeight
                            }}
                        >

                            <div className="w-full border-2 border-black flex flex-col px-1 pb-2">
                                {/* Header */}
                                <div className="text-center w-full mb-3">
                                    {headerSettings.showLogo && (
                                        <div className="flex justify-center mb-2">
                                            {(companyProfile?.logo || previewInvoice?.company?.logo) ? (
                                                <img src={companyProfile?.logo || previewInvoice?.company?.logo} alt="Logo" className="max-h-12 object-contain" />
                                            ) : (
                                                <div className="flex items-center gap-1.5 p-1 bg-gray-50/80 rounded border border-gray-200">
                                                    <svg className="w-6 h-6 shrink-0" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <mask id="blue-doc-mask-thermal-ps" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                                            <rect width="24" height="24" fill="white" />
                                                            <rect x="10" y="7" width="12" height="14" rx="2" fill="black" />
                                                            <line x1="6" y1="7" x2="10" y2="7" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                            <line x1="6" y1="10" x2="10" y2="10" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                            <line x1="6" y1="13" x2="10" y2="13" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                            <line x1="6" y1="16" x2="11" y2="16" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                                        </mask>
                                                        <rect x="2" y="3" width="14" height="18" rx="3" fill="#3b82f6" mask="url(#blue-doc-mask-thermal-ps)" />
                                                        <rect x="10" y="7" width="12" height="14" rx="2" fill="white" stroke="#3b82f6" strokeWidth="1.5" />
                                                        <line x1="13" y1="11" x2="19" y2="11" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                        <line x1="13" y1="14" x2="19" y2="14" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                        <line x1="13" y1="17" x2="19" y2="17" stroke="#3b82f6" strokeWidth="1.5" strokeLinecap="round" />
                                                    </svg>
                                                    <div className="flex flex-col text-left">
                                                        <span className="text-[11px] font-bold text-gray-900 leading-none">Swayam</span>
                                                        <span className="text-[10px] font-bold text-gray-900 leading-none">Bill <span className="text-[#3b82f6]">Book</span></span>
                                                    </div>
                                                </div>
                                            )}
                                        </div>
                                    )}
                                    <h3 className="text-[#4F46E5] font-bold mb-1" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>
                                        {transactionType2.toUpperCase() === 'INCOME TRANSACTION' ? 'TAX INVOICE' : transactionType2.toUpperCase()}
                                    </h3>
                                    <h2
                                        className="text-[#111827] tracking-wide mb-1"
                                        style={{
                                            fontSize: `${customization.headerCompanyNameFontSize}px`,
                                            fontWeight: customization.headerCompanyNameB ? 'bold' : 'normal',
                                            textDecoration: customization.headerCompanyNameU ? 'underline' : 'none'
                                        }}
                                    >{companyProfile?.name || previewInvoice?.company?.name || 'Swayam Bill Book'}</h2>
                                    <p className="text-gray-500 mb-1" style={{ fontSize: `max(10px, calc(${customization.headerCompanyNameFontSize}px * 0.55))` }}>
                                        {companyProfile?.tagline || 'The Digital Accounting Book'}
                                    </p>
                                    <p className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerCompanyAddressFontSize}px` }}>
                                        {companyProfile?.address || previewInvoice?.company?.address || ''}
                                    </p>
                                    <p className="text-[#374151] leading-tight mt-1" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>
                                        {headerSettings.showMobileNumber && (companyProfile?.phone || previewInvoice?.company?.phone) && (
                                            <span>Tel : {companyProfile?.phone || previewInvoice?.company?.phone}</span>
                                        )}
                                        {headerSettings.showMobileNumber && headerSettings.showEmail && (companyProfile?.ownerEmail || companyProfile?.email || previewInvoice?.company?.email) && (
                                            <span> | </span>
                                        )}
                                        {headerSettings.showEmail && (companyProfile?.ownerEmail || companyProfile?.email || previewInvoice?.company?.email) && (
                                            <span>{companyProfile?.ownerEmail || companyProfile?.email || previewInvoice?.company?.email}</span>
                                        )}
                                    </p>
                                    {(companyProfile?.companySetting?.gstin || companyProfile?.gstin || previewInvoice?.company?.gstin) && (
                                        <p className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>
                                            {headerSettings.labelGstin || 'GSTIN'}: {companyProfile?.companySetting?.gstin || companyProfile?.gstin || previewInvoice?.company?.gstin}
                                        </p>
                                    )}

                                    {headerSettings.customFields.map((field, index) => (
                                        field.name && (
                                            <p key={index} className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>
                                                {field.name}: {field.value}
                                            </p>
                                        )
                                    ))}
                                </div>

                                {/* Invoice Details */}
                                <div className="w-full text-[#1f2937] leading-[1.4] mb-3" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>
                                    <div className="flex justify-between">
                                        <span className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelInvoiceNumber || 'Invoice Number'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.invoiceNo || '-'}</span></span>
                                        <span className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelDate || 'Date'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.date ? new Date(previewInvoice.date).toLocaleDateString('en-GB') : '-'}</span></span>
                                    </div>
                                    <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelCustomer || 'Customer'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.name || 'Walk-in Customer'}</span></div>
                                    {previewInvoice?.customer?.address && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelAddress || 'Address'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice.customer.address}</span></div>
                                    )}
                                    <div>{previewInvoice?.customer?.city ? `${previewInvoice.customer.city}, ${previewInvoice.customer.state || ''}` : ''}</div>

                                    {headerSettings.partyGstin && previewInvoice?.customer?.gstin && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyGstin || 'GSTIN'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice.customer.gstin}</span></div>
                                    )}
                                    {headerSettings.partyContactNumber && (previewInvoice?.customer?.phone || previewInvoice?.customer?.mobile) && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyContact || 'Contact No'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice.customer.phone || previewInvoice.customer.mobile}</span></div>
                                    )}
                                    {headerSettings.partyPanNumber && previewInvoice?.customer?.pan && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyPan || 'PAN'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice.customer.pan}</span></div>
                                    )}
                                </div>

                                {/* Table */}
                                <div className="w-full mb-1">
                                    <PrintDashedLine />
                                    <div className="flex w-full py-1 font-bold overflow-hidden" style={{ fontSize: `${customization.tableHeadingsFontSize}px` }}>
                                        <div className="flex-[1.5] text-left pr-1 min-w-0 break-words">{tableSettings.thItemName || 'Item Name'}</div>
                                        {headerSettings.showCompanyProductCode && <div className="flex-1 min-w-0 break-all px-0.5 text-right">P.Code</div>}
                                        {headerSettings.showBatchNo && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Batch</div>}
                                        {headerSettings.showExpDate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Exp</div>}
                                        {headerSettings.showHsn && <div className="flex-1 min-w-0 break-all px-0.5 text-right">HSN</div>}
                                        {headerSettings.showPurchasePrice && <div className="flex-1 min-w-0 break-all px-0.5 text-right">P.Price</div>}
                                        {headerSettings.showMrp && <div className="flex-1 min-w-0 break-all px-0.5 text-right">MRP</div>}
                                        {headerSettings.showPrimaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Pri.Qty</div>}
                                        {headerSettings.showSecondaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Sec.Qty</div>}
                                        {tableSettings.showThQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{tableSettings.thQty || 'Qty'}</div>}
                                        {headerSettings.showUnit && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Unit</div>}
                                        {tableSettings.showThRate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{tableSettings.thRate || 'Rate'}</div>}
                                        {headerSettings.showDiscount1 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Dis.1</div>}
                                        {headerSettings.showDiscount2 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Dis.2</div>}
                                        {(tableSettings.showThDiscount || headerSettings.showDiscount) && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{tableSettings.thDiscount || 'Dis.'}</div>}
                                        {tableSettings.showThTaxableValue && <div className="flex-[1.2] min-w-0 break-all px-0.5 text-right">{tableSettings.thTaxableValue || 'Taxable Value'}</div>}
                                        {tableSettings.showThTotalAmount && <div className="flex-[1.2] min-w-0 break-all pl-0.5 text-right">{tableSettings.thTotalAmount || 'Total Amount'}</div>}
                                    </div>
                                    <PrintDashedLine />

                                    <div className="flex flex-col w-full align-top" style={{ fontSize: `${customization.tableContentsFontSize}px` }}>
                                        {(parsedItems && parsedItems.length > 0
                                             ? parsedItems
                                             : [
                                                 { name: 'Adrian Bell', qty: 1, rate: 1000, discount: 120, taxableValue: 880, totalAmount: 1006.40 },
                                                 { name: 'Saree', qty: 1, rate: 1500, discount: 20, taxableValue: 1200, totalAmount: 1416.00 },
                                                 { name: 'Blue Saree', qty: 5, rate: 781, discount: 0, taxableValue: 3905, totalAmount: 4999.68, desc: tableSettings.showThHsnSac ? '( HSN/SAC: 1006, GST: 28% )' : '' },
                                                 { name: 'Cricket Bat', qty: 3, rate: 100, discount: 0, taxableValue: 300, totalAmount: 384.00, desc: tableSettings.showThGst ? '(GST: 28%)' : '' }
                                             ]
                                        ).map((item, idx) => (
                                            <div key={idx} className="flex flex-col w-full py-0.5">
                                                {item.name === 'Blue Saree' ? (
                                                    <>
                                                        <div className="w-full pb-1" style={{ fontSize: `${customization.tableDescriptionFontSize}px` }}>{item.name} {item.desc}</div>
                                                        <div className="flex w-full py-0.5 overflow-hidden">
                                                            <div className="flex-[1.5] pr-1 min-w-0"></div>
                                                            {headerSettings.showCompanyProductCode && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.productCode || '-'}</div>}
                                                            {headerSettings.showBatchNo && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.batchNo || '-'}</div>}
                                                            {headerSettings.showExpDate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.expDate || item.expiryDate || item.expiry || '-'}</div>}
                                                            {headerSettings.showHsn && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.hsnCode || '-'}</div>}
                                                            {headerSettings.showPurchasePrice && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.purchasePrice || '-'}</div>}
                                                            {headerSettings.showMrp && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.mrp || '-'}</div>}
                                                            {headerSettings.showPrimaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.priQty || '-'}</div>}
                                                            {headerSettings.showSecondaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.secQty || '-'}</div>}
                                                            {tableSettings.showThQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.qty || '-'}</div>}
                                                            {headerSettings.showUnit && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.unit || '-'}</div>}
                                                            {tableSettings.showThRate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.rate || '-'}</div>}
                                                            {headerSettings.showDiscount1 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount1 || '-'}</div>}
                                                            {headerSettings.showDiscount2 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount2 || '-'}</div>}
                                                            {(tableSettings.showThDiscount || headerSettings.showDiscount) && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount || '-'}</div>}
                                                            {tableSettings.showThTaxableValue && <div className="flex-[1.2] min-w-0 break-all px-0.5 text-right">{item.taxableValue || '-'}</div>}
                                                            {tableSettings.showThTotalAmount && <div className="flex-[1.2] min-w-0 break-all pl-0.5 text-right">{item.totalAmount || '-'}</div>}
                                                        </div>
                                                    </>
                                                ) : (
                                                    <div className="flex w-full py-0.5 overflow-hidden">
                                                        <div className="flex-[1.5] pr-1 leading-tight min-w-0 break-words">
                                                            {item.name}
                                                            {item.desc && <span className="block" style={{ fontSize: `${customization.tableDescriptionFontSize}px` }}>{item.desc}</span>}
                                                        </div>
                                                        {headerSettings.showCompanyProductCode && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.productCode || '-'}</div>}
                                                        {headerSettings.showBatchNo && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.batchNo || '-'}</div>}
                                                        {headerSettings.showExpDate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.expDate || item.expiryDate || item.expiry || '-'}</div>}
                                                        {headerSettings.showHsn && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.hsnCode || '-'}</div>}
                                                        {headerSettings.showPurchasePrice && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.purchasePrice || '-'}</div>}
                                                        {headerSettings.showMrp && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.mrp || '-'}</div>}
                                                        {headerSettings.showPrimaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.priQty || '-'}</div>}
                                                        {headerSettings.showSecondaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.secQty || '-'}</div>}
                                                        {tableSettings.showThQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.qty || '-'}</div>}
                                                        {headerSettings.showUnit && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.unit || '-'}</div>}
                                                        {tableSettings.showThRate && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.rate || '-'}</div>}
                                                        {headerSettings.showDiscount1 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount1 || '-'}</div>}
                                                        {headerSettings.showDiscount2 && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount2 || '-'}</div>}
                                                        {(tableSettings.showThDiscount || headerSettings.showDiscount) && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{item.discount || '-'}</div>}
                                                        {tableSettings.showThTaxableValue && <div className="flex-[1.2] min-w-0 break-all px-0.5 text-right">{item.taxableValue || '-'}</div>}
                                                        {tableSettings.showThTotalAmount && <div className="flex-[1.2] min-w-0 break-all pl-0.5 text-right">{item.totalAmount || '-'}</div>}
                                                    </div>
                                                )}
                                            </div>
                                        ))}
                                    </div>

                                    {/* Totals border */}
                                    <PrintDashedLine />
                                    {(() => {
                                        const items = previewInvoice?.items?.length > 0
                                            ? previewInvoice.items.map(i => ({ qty: i.quantity || 1, taxableValue: i.amount || 0, totalAmount: i.amount || 0 }))
                                            : [{ qty: 10, taxableValue: 6285, totalAmount: 7806.08 }];
                                        const totalQty = items.reduce((acc, i) => acc + Number(i.qty), 0);
                                        const totalTaxable = items.reduce((acc, i) => acc + Number(i.taxableValue), 0);
                                        const totalFinal = items.reduce((acc, i) => acc + Number(i.totalAmount), 0);
                                        return (
                                            <>
                                                <div className="flex w-full py-1 font-bold overflow-hidden" style={{ fontSize: `${customization.tableTotalFontSize}px` }}>
                                                    <div className="flex-[1.5] pr-1 min-w-0 break-words">Total</div>
                                                    {headerSettings.showCompanyProductCode && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showBatchNo && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showExpDate && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showHsn && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showPurchasePrice && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showMrp && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showPrimaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{totalQty.toFixed(2)}</div>}
                                                    {headerSettings.showSecondaryQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {tableSettings.showThQty && <div className="flex-1 min-w-0 break-all px-0.5 text-right">{totalQty.toFixed(2)}</div>}
                                                    {headerSettings.showUnit && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {tableSettings.showThRate && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showDiscount1 && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {headerSettings.showDiscount2 && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {(tableSettings.showThDiscount || headerSettings.showDiscount) && <div className="flex-1 min-w-0 break-all px-0.5 text-right"></div>}
                                                    {tableSettings.showThTaxableValue && <div className="flex-[1.2] min-w-0 break-all px-0.5 text-right">{totalTaxable.toFixed(2)}</div>}
                                                    {tableSettings.showThTotalAmount && <div className="flex-[1.2] min-w-0 break-all pl-0.5 text-right">{totalFinal.toFixed(2)}</div>}
                                                </div>
                                                <PrintDashedLine />

                                                {/* Totals */}
                                                <div className="w-full text-[11px] mb-3">
                                                    <div className="flex justify-between w-full font-bold">
                                                        <span>Total</span>
                                                        <span>{totalQty.toFixed(2)}</span>
                                                        <span>{totalFinal.toFixed(2)}</span>
                                                    </div>
                                                </div>
                                            </>
                                        );
                                    })()}

                                    {tableSettings.showTlCgst && <div className="flex justify-between w-full"><span>{tableSettings.tlCgst || 'CGST'}:</span><span>{previewInvoice?.totalCgst ? Number(previewInvoice.totalCgst).toFixed(2) : ''}</span></div>}
                                    {tableSettings.showTlSgst && <div className="flex justify-between w-full"><span>{tableSettings.tlSgst || 'SGST'}:</span><span>{previewInvoice?.totalSgst ? Number(previewInvoice.totalSgst).toFixed(2) : ''}</span></div>}
                                    {tableSettings.showTlIgst && <div className="flex justify-between w-full"><span>{tableSettings.tlIgst || 'IGST'}:</span><span>{previewInvoice?.totalIgst ? Number(previewInvoice.totalIgst).toFixed(2) : ''}</span></div>}
                                    {tableSettings.showTlTcs && <div className="flex justify-between w-full"><span>{tableSettings.tlTcs || 'TCS'}:</span><span>{previewInvoice?.tcsAmount ? Number(previewInvoice.tcsAmount).toFixed(2) : ''}</span></div>}
                                    {tableSettings.showTlCess && <div className="flex justify-between w-full"><span>{tableSettings.tlCess || 'Cess'}:</span><span>{previewInvoice?.totalCess ? Number(previewInvoice.totalCess).toFixed(2) : ''}</span></div>}
                                    {tableSettings.showTlRoundOff && <div className="flex justify-between w-full"><span>{tableSettings.tlRoundOff || 'Round off'}:</span><span>{previewInvoice?.roundOff ? Number(previewInvoice.roundOff).toFixed(2) : ''}</span></div>}

                                    <div className="mt-1 w-full"><PrintDashedLine /></div>
                                    <div className="flex justify-between w-full font-bold text-[13px] my-1">
                                        <span>Total Payable Amount:</span>
                                        <span>{previewInvoice?.totalAmount ? Number(previewInvoice.totalAmount).toFixed(2) : '4,365.00'}</span>
                                    </div>
                                    <div className="mb-1 w-full"><PrintDashedLine /></div>

                                    <div className="flex justify-between w-full mt-1"><span>Balance:</span><span></span></div>
                                    <div className="flex justify-between w-full"><span>Previous O/S:</span><span></span></div>
                                    <div className="flex justify-between w-full"><span>Current O/S:</span><span></span></div>
                                </div>
                                <PrintDashedLine className="mb-3" />

                                {/* Footer Text */}
                                {footerSettings.showPaymentDetails && (
                                    <div className="w-full text-[#1f2937] leading-tight mb-4 mt-2" style={{ fontSize: `${customization.footerContentsFontSize}px` }}>
                                        <div className="font-bold mb-2" style={{ fontSize: `${customization.footerHeadingsFontSize}px` }}>
                                            Payment Details: <span className="font-normal" style={{ fontSize: `${customization.footerContentsFontSize}px` }}>{previewInvoice?.paymentMode || 'Cash'}</span>
                                        </div>
                                        {previewInvoice?.terms && (
                                            <div className="mt-2">
                                                <div className="font-bold mb-1" style={{ fontSize: `${customization.footerTermsFontSize}px` }}>{footerSettings.labelTermsAndConditions || "Terms and conditions"}:</div>
                                                <div style={{ fontSize: `${customization.footerTermsFontSize}px` }}>{previewInvoice.terms}</div>
                                            </div>
                                        )}
                                    </div>
                                )}
                                {/* QR and Thank you */}
                                <div className="w-full flex flex-col items-center gap-4 mt-auto">
                                    {(headerSettings.showQrCode && footerSettings.showQrCode) && (
                                        <div className="w-24 h-24">
                                            <img src={qrCodeUrl} alt="QR Code" className="w-full h-full" />
                                        </div>
                                    )}
                                    <div className="text-[#1f2937] text-center" style={{ fontSize: `${customization.footerNoteFontSize}px` }}>
                                        {footerSettings.labelThankYouNote || "Thank you for choosing us, visit again."}
                                    </div>
                                </div>
                            </div>

                        </div>
                    )}
                </div>
            </div>


            {/* Footer Settings Drawer */}
            {isFooterSettingsOpen && (
                <div className="fixed sm:absolute top-0 right-0 h-full w-full sm:w-[420px] max-w-full bg-[#ffffff] shadow-2xl z-50 flex flex-col border-l border-[#e5e7eb] animate-slide-in-right">

                    <div className="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-[#e5e7eb] shrink-0">
                        <h2 className="text-[18px] font-bold text-[#1f2937]">Footer Settings</h2>
                        <button onClick={() => setIsFooterSettingsOpen(false)} className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-md hover:bg-gray-100">
                            <X className="w-5 h-5" />
                        </button>
                    </div>

                    <div className="flex-1 overflow-y-auto p-4 sm:p-6 flex flex-col gap-6 bg-[#ffffff]">

                        <div className="flex flex-col gap-4">
                            <h3 className="text-[14px] font-bold text-[#1f2937]">Show / Hide</h3>

                            <div className="flex items-center justify-between">
                                <div className="text-[13px] text-[#4b5563] font-medium">QR Code</div>
                                <button
                                    onClick={() => setFooterSettings(prev => ({ ...prev, showQrCode: !prev.showQrCode }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${footerSettings.showQrCode ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${footerSettings.showQrCode ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="text-[13px] text-[#4b5563] font-medium">HSN Summary</div>
                                <button
                                    onClick={() => setFooterSettings(prev => ({ ...prev, showHsnSummary: !prev.showHsnSummary }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${footerSettings.showHsnSummary ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${footerSettings.showHsnSummary ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="text-[13px] text-[#4b5563] font-medium">Current Outstanding</div>
                                <div className="flex items-center gap-2">
                                    <div className="relative">
                                        <select
                                            value={footerSettings.outstandingPosition}
                                            onChange={(e) => setFooterSettings(prev => ({ ...prev, outstandingPosition: e.target.value }))}
                                            className="appearance-none bg-white border border-gray-300 text-gray-700 py-1 pl-3 pr-8 rounded text-[12px] leading-tight focus:outline-none focus:border-indigo-500"
                                        >
                                            <option>After this Transaction</option>
                                            <option>Before this Transaction</option>
                                        </select>
                                        <div className="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-500">
                                            <svg className="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
                                        </div>
                                    </div>
                                    <button
                                        onClick={() => setFooterSettings(prev => ({ ...prev, showCurrentOutstanding: !prev.showCurrentOutstanding }))}
                                        className={`w-9 h-5 rounded-full relative transition-colors ${footerSettings.showCurrentOutstanding ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                    >
                                        <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${footerSettings.showCurrentOutstanding ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                    </button>
                                </div>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="text-[13px] text-[#4b5563] font-medium">Payment Details</div>
                                <button
                                    onClick={() => setFooterSettings(prev => ({ ...prev, showPaymentDetails: !prev.showPaymentDetails }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${footerSettings.showPaymentDetails ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${footerSettings.showPaymentDetails ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>
                        </div>

                        <div className="flex flex-col gap-4 mt-2">
                            <h3 className="text-[14px] font-bold text-[#1f2937]">Footer Labels</h3>
                            <div className="flex gap-4">
                                <input
                                    type="text"
                                    value={footerSettings.labelTermsAndConditions}
                                    onChange={(e) => setFooterSettings(prev => ({ ...prev, labelTermsAndConditions: e.target.value }))}
                                    placeholder="Terms And Conditions"
                                    className="w-1/2 border border-gray-300 rounded-md px-3 py-2 text-[13px] text-gray-700 focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                                />
                                <input
                                    type="text"
                                    value={footerSettings.labelThankYouNote}
                                    onChange={(e) => setFooterSettings(prev => ({ ...prev, labelThankYouNote: e.target.value }))}
                                    placeholder="Thank You Note"
                                    className="w-1/2 border border-gray-300 rounded-md px-3 py-2 text-[13px] text-gray-700 focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                                />
                            </div>
                        </div>

                    </div>

                    <div className="px-5 sm:px-6 py-3.5 flex items-center gap-3 border-t border-[#e5e7eb] bg-[#ffffff] shrink-0 sticky bottom-0">
                        <button
                            onClick={async () => {
                                const success = await savePrintSettings(true);
                                if (success) {
                                    setIsFooterSettingsOpen(false);
                                }
                            }}
                            className="bg-[#4F46E5] hover:bg-[#4338ca] text-[#ffffff] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Save
                        </button>
                        <button
                            onClick={() => setIsFooterSettingsOpen(false)}
                            className="bg-[#e9ecef] hover:bg-[#dde0e3] text-[#4F46E5] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Back
                        </button>
                    </div>
                </div>
            )}

            {/* Customization Drawer */}
            {isCustomizationOpen && (
                <div className="fixed sm:absolute right-0 top-0 h-full w-full sm:w-[500px] max-w-full bg-[#ffffff] shadow-2xl z-50 flex flex-col border-l border-[#e5e7eb] animate-slide-in-right">

                    {/* Drawer Header */}
                    <div className="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-[#e5e7eb] shrink-0">
                        <h2 className="text-[18px] font-bold text-[#1f2937]">Customization</h2>
                        <button
                            onClick={() => setIsCustomizationOpen(false)}
                            className="w-8 h-8 flex items-center justify-center text-[#6b7280] hover:bg-gray-100 rounded-full"
                        >
                            <X className="w-5 h-5" />
                        </button>
                    </div>

                    {/* Drawer Body */}
                    <div className="flex-1 overflow-y-auto p-6 flex flex-col gap-8 bg-[#f9fafb]">

                        {/* Thermal Print Margin */}
                        <div className="flex flex-col gap-4">
                            <h4 className="font-bold text-[#1f2937] text-[15px]">Thermal Print Margin</h4>
                            <div className="grid grid-cols-2 gap-x-5 gap-y-6">
                                <FloatingInput
                                    label="Right"
                                    suffix="MM"
                                    value={customization.thermalMarginRight}
                                    onChange={(e) => updateCustomization('thermalMarginRight', e.target.value)}
                                />
                                <FloatingInput
                                    label="Number Of Print"
                                    value={customization.thermalNumPrint}
                                    onChange={(e) => updateCustomization('thermalNumPrint', e.target.value)}
                                />
                                <div className="col-span-1">
                                    <CustomSelect
                                        label="Font Weight"
                                        value={customization.thermalFontWeight}
                                        options={['400', '500', '600', '700']}
                                        onChange={(val) => updateCustomization('thermalFontWeight', val)}
                                    />
                                </div>
                            </div>
                        </div>

                        {/* Header */}
                        <div className="flex flex-col gap-4">
                            <h4 className="font-bold text-[#1f2937] text-[15px]">Header</h4>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Company Name</span>
                                <div className="flex items-center gap-3">
                                    <button
                                        onClick={() => updateCustomization('headerCompanyNameB', !customization.headerCompanyNameB)}
                                        className={`w-[32px] h-[32px] flex items-center justify-center border-[1.5px] rounded-[6px] font-bold text-[14px] transition-colors ${customization.headerCompanyNameB ? 'border-[#4F46E5] text-[#4F46E5] bg-indigo-50' : 'border-[#4F46E5] text-[#6b7280] hover:border-[#4F46E5] hover:text-[#4F46E5]'
                                            }`}
                                    >
                                        B
                                    </button>
                                    <button
                                        onClick={() => updateCustomization('headerCompanyNameU', !customization.headerCompanyNameU)}
                                        className={`w-[32px] h-[32px] flex items-center justify-center border-[1.5px] rounded-[6px] font-bold text-[14px] underline transition-colors ${customization.headerCompanyNameU ? 'border-[#4F46E5] text-[#4F46E5] bg-indigo-50' : 'border-[#4F46E5] text-[#6b7280] hover:border-[#4F46E5] hover:text-[#4F46E5]'
                                            }`}
                                    >
                                        U
                                    </button>
                                    <FloatingInput
                                        label="Font Size"
                                        suffix="PX"
                                        value={customization.headerCompanyNameFontSize}
                                        onChange={(e) => updateCustomization('headerCompanyNameFontSize', e.target.value)}
                                        className="w-[140px]"
                                    />
                                </div>
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Company Address</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.headerCompanyAddressFontSize}
                                    onChange={(e) => updateCustomization('headerCompanyAddressFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Header Labels</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.headerLabelsFontSize}
                                    onChange={(e) => updateCustomization('headerLabelsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Header Contents</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.headerContentsFontSize}
                                    onChange={(e) => updateCustomization('headerContentsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>
                        </div>

                        {/* Table */}
                        <div className="flex flex-col gap-4">
                            <h4 className="font-bold text-[#1f2937] text-[15px]">Table</h4>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Table Headings</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.tableHeadingsFontSize}
                                    onChange={(e) => updateCustomization('tableHeadingsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Table Contents</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.tableContentsFontSize}
                                    onChange={(e) => updateCustomization('tableContentsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Description</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.tableDescriptionFontSize}
                                    onChange={(e) => updateCustomization('tableDescriptionFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Total</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.tableTotalFontSize}
                                    onChange={(e) => updateCustomization('tableTotalFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>
                        </div>

                        {/* Footer */}
                        <div className="flex flex-col gap-4">
                            <h4 className="font-bold text-[#1f2937] text-[15px]">Footer</h4>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Footer Headings</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.footerHeadingsFontSize}
                                    onChange={(e) => updateCustomization('footerHeadingsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Footer Contents</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.footerContentsFontSize}
                                    onChange={(e) => updateCustomization('footerContentsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Terms and Conditions</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.footerTermsFontSize}
                                    onChange={(e) => updateCustomization('footerTermsFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>

                            <div className="flex items-center justify-between">
                                <span className="text-[14px] text-[#374151] font-medium">Note</span>
                                <FloatingInput
                                    label="Font Size"
                                    suffix="PX"
                                    value={customization.footerNoteFontSize}
                                    onChange={(e) => updateCustomization('footerNoteFontSize', e.target.value)}
                                    className="w-[140px]"
                                />
                            </div>
                        </div>

                    </div>

                    {/* Drawer Footer */}
                    <div className="px-5 sm:px-6 py-3.5 flex flex-wrap items-center justify-between gap-3 border-t border-[#e5e7eb] bg-[#ffffff] shrink-0 sticky bottom-0">
                        <div className="flex items-center gap-3">
                            <button
                                onClick={async () => {
                                    const success = await savePrintSettings(true);
                                    if (success) {
                                        setIsCustomizationOpen(false);
                                    }
                                }}
                                className="bg-[#4F46E5] hover:bg-[#4338ca] text-[#ffffff] px-6 sm:px-8 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                            >
                                Save
                            </button>
                            <button
                                onClick={() => setIsCustomizationOpen(false)}
                                className="bg-[#e9ecef] hover:bg-[#dde0e3] text-[#4F46E5] px-6 sm:px-8 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                            >
                                Back
                            </button>
                        </div>
                        <button
                            onClick={async () => {
                                const resetDefaults = {
                                    thermalMarginRight: '0',
                                    thermalNumPrint: '1',
                                    thermalFontWeight: '400',
                                    headerCompanyNameB: true,
                                    headerCompanyNameU: true,
                                    headerCompanyNameFontSize: '24',
                                    headerCompanyAddressFontSize: '13',
                                    headerLabelsFontSize: '11',
                                    headerContentsFontSize: '11',
                                    tableHeadingsFontSize: '11',
                                    tableContentsFontSize: '11',
                                    tableDescriptionFontSize: '9',
                                    tableTotalFontSize: '13',
                                    footerHeadingsFontSize: '11',
                                    footerContentsFontSize: '11',
                                    footerTermsFontSize: '12',
                                    footerNoteFontSize: '12'
                                };
                                setCustomization(resetDefaults);
                            }}
                            className="bg-[#f3f4f6] hover:bg-[#e5e7eb] text-[#4F46E5] px-4 sm:px-6 py-2 rounded-[6px] text-[13px] sm:text-[14px] font-bold transition-colors"
                        >
                            Reset to original
                        </button>
                    </div>
                </div>
            )}

            {/* Invoice Template Modal */}
            {isInvoiceTemplateModalOpen && (
                <div className="fixed inset-0 z-50 flex flex-col items-center justify-center bg-black/40 backdrop-blur-sm p-4 md:p-8">
                    <div className="bg-[#ffffff] rounded-[6px] shadow-2xl w-full max-w-6xl h-full flex flex-col overflow-hidden">

                        {/* Modal Header */}
                        <div className="px-6 py-4 flex items-center justify-between border-b border-[#e5e7eb]">
                            <h3 className="text-[#1f2937] font-bold text-[16px]">Invoice Format</h3>
                            <button onClick={() => setIsInvoiceTemplateModalOpen(false)} className="text-[#6b7280] hover:text-[#374151] transition-colors">
                                <X className="w-5 h-5" strokeWidth={2} />
                            </button>
                        </div>

                        {/* Modal Body */}
                        <div className="flex-1 overflow-y-auto p-6 bg-[#ffffff] flex">
                            {/* Template Preview Box */}
                            <div className="flex flex-col items-center shrink-0">
                                <div ref={invoiceRef} className="border-[1px] border-[#e5e7eb] rounded-[4px] w-full max-w-[750px] bg-white p-4 overflow-auto">
                                    <Template1
                                        pdfFormat={pdfFormat}
                                        previewInvoice={previewInvoice}
                                        parsedItems={parsedItems}
                                        totalQty={totalQty}
                                        totalTaxable={Number(totalTaxable) || 0}
                                        totalFinal={Number(totalFinal) || 0}
                                        qrCodeUrl={qrCodeUrl}
                                        allPrintSettings={allPrintSettings}
                                        headerSettings={headerSettings}
                                        tableSettings={tableSettings}
                                        footerSettings={footerSettings}
                                        customization={customization}
                                        transactionType={transactionType}
                                        transactionType2={transactionType2}
                                        companyProfile={companyProfile}
                                    />
                                </div>
                                {/* Selected Footer - Placed outside invoiceRef */}
                                <div className="w-full max-w-[750px] bg-[#4F46E5] text-[#ffffff] text-center py-2 font-bold text-[13px] tracking-widest mt-4 rounded-[4px]">
                                    ** SELECTED **
                                </div>
                            </div>

                            {/* Template Format Selection Area */}
                            <div className="flex-1 ml-8 flex flex-col gap-4 overflow-y-auto">
                                <h4 className="text-[16px] font-bold text-[#1f2937] border-b border-[#e5e7eb] pb-3">Available Invoice Formats</h4>
                                <div className="flex flex-col gap-3">
                                    {[
                                        { id: 'General Template', title: 'General Template', desc: 'Standard GST tax invoice with clean borders & complete company details', badge: 'Standard' },
                                        { id: 'Glass Template', title: 'Glass Template', desc: 'Modern styled format with elegant header & soft border accents', badge: 'Modern' },
                                        { id: 'GST Tax Invoice', title: 'GST Tax Invoice', desc: 'Structured layout emphasizing tax breakdown & HSN code summary', badge: 'GST Focus' },
                                        { id: 'Classic Template', title: 'Classic Template', desc: 'Traditional compact invoice format for fast printing', badge: 'Classic' },
                                        { id: 'Thermal Print', title: `Thermal POS (${pageSize === '2inch' ? '2-inch' : pageSize === '4inch' ? '4-inch' : '3-inch'})`, desc: 'Compact receipt format designed for POS thermal roll printers', badge: 'POS Thermal' }
                                    ].map((tpl) => {
                                        const isSelected = (tpl.id === 'Thermal Print' && pdfFormat === 'Thermal Print') || (tpl.id === transactionType && pdfFormat !== 'Thermal Print');
                                        return (
                                            <div
                                                key={tpl.id}
                                                onClick={() => {
                                                    if (tpl.id === 'Thermal Print') {
                                                        setPdfFormat('Thermal Print');
                                                        setTransactionType('General Template');
                                                    } else {
                                                        if (pdfFormat === 'Thermal Print') setPdfFormat('A4');
                                                        setTransactionType(tpl.id);
                                                    }
                                                    try {
                                                        localStorage.setItem('selectedPrintTemplate', tpl.id);
                                                    } catch (e) {}
                                                }}
                                                className={`p-4 rounded-lg border-2 cursor-pointer transition-all flex items-center justify-between ${
                                                    isSelected 
                                                        ? 'border-[#4F46E5] bg-indigo-50/50 shadow-sm' 
                                                        : 'border-gray-200 hover:border-indigo-300 hover:bg-gray-50'
                                                }`}
                                            >
                                                <div className="flex flex-col gap-1">
                                                    <div className="flex items-center gap-2">
                                                        <span className="font-bold text-[14px] text-gray-900">{tpl.title}</span>
                                                        <span className="text-[10px] px-2 py-0.5 rounded bg-indigo-100 text-[#4F46E5] font-semibold">{tpl.badge}</span>
                                                    </div>
                                                    <p className="text-[12px] text-gray-500">{tpl.desc}</p>
                                                </div>
                                                <div>
                                                    {isSelected ? (
                                                        <span className="px-3 py-1 bg-[#4F46E5] text-white rounded text-[11px] font-bold shadow-sm">SELECTED</span>
                                                    ) : (
                                                        <span className="px-3 py-1 bg-gray-100 text-gray-700 rounded text-[11px] font-medium hover:bg-indigo-100">Select</span>
                                                    )}
                                                </div>
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        </div>

                        {/* Modal Footer */}
                        <div className="px-6 py-4 flex gap-3 border-t border-[#e5e7eb]">
                            <button
                                type="button"
                                onClick={async () => {
                                    const success = await handleDownloadPdf(true);
                                    if (success) {
                                        setIsInvoiceTemplateModalOpen(false);
                                        alert('Print Template saved and downloaded successfully!');
                                    }
                                }}
                                className="bg-[#4F46E5] hover:bg-[#4338ca] text-[#ffffff] px-8 py-2 rounded-[6px] text-[20px] font-bold transition-colors shadow-sm"
                            >
                                Save
                            </button>
                            <button
                                type="button"
                                onClick={() => setIsInvoiceTemplateModalOpen(false)}
                                className="bg-[#e9ecef] hover:bg-[#dde0e3] text-[#4F46E5] px-8 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                            >
                                Back
                            </button>
                        </div>

                    </div>
                </div>
            )}

            {/* Header Settings Drawer */}
            {isHeaderSettingsOpen && (
                <div className="fixed sm:absolute top-0 right-0 h-full w-full sm:w-[420px] max-w-full bg-[#ffffff] shadow-2xl z-50 flex flex-col border-l border-[#e5e7eb] animate-slide-in-right">

                    {/* Drawer Header */}
                    <div className="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-[#e5e7eb] shrink-0">
                        <h2 className="text-[18px] font-bold text-[#1f2937]">Header Settings</h2>
                        <button onClick={() => setIsHeaderSettingsOpen(false)} className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-md hover:bg-gray-100">
                            <X className="w-5 h-5" />
                        </button>
                    </div>

                    {/* Drawer Body */}
                    <div className="flex-1 overflow-y-auto p-4 sm:p-6 flex flex-col gap-6 bg-[#ffffff]">

                        {/* Show / Hide Section */}
                        <div className="flex flex-col gap-4">
                            <h3 className="text-[14px] font-bold text-[#1f2937]">Show / Hide</h3>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Logo
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showLogo: !prev.showLogo }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showLogo ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showLogo ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                Company Name
                                <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Mobile Number
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showMobileNumber: !prev.showMobileNumber }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showMobileNumber ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showMobileNumber ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Email
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showEmail: !prev.showEmail }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showEmail ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showEmail ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    QR Code
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showQrCode: !prev.showQrCode }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showQrCode ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showQrCode ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    MRP
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showMrp: !prev.showMrp }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showMrp ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showMrp ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Primary Qty
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showPrimaryQty: !prev.showPrimaryQty }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showPrimaryQty ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showPrimaryQty ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Secondary Qty
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showSecondaryQty: !prev.showSecondaryQty }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showSecondaryQty ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showSecondaryQty ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Discount 1
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showDiscount1: !prev.showDiscount1 }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showDiscount1 ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showDiscount1 ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Discount 2
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showDiscount2: !prev.showDiscount2 }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showDiscount2 ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showDiscount2 ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>



                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Unit
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showUnit: !prev.showUnit }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showUnit ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showUnit ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Company Product Code
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showCompanyProductCode: !prev.showCompanyProductCode }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showCompanyProductCode ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showCompanyProductCode ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Batch No
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showBatchNo: !prev.showBatchNo }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showBatchNo ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showBatchNo ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Exp Date
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showExpDate: !prev.showExpDate }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showExpDate ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showExpDate ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    HSN
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showHsn: !prev.showHsn }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showHsn ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showHsn ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>

                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-2 text-[13px] text-[#4b5563] font-medium">
                                    Purchase Price
                                    <svg className="w-3.5 h-3.5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </div>
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, showPurchasePrice: !prev.showPurchasePrice }))}
                                    className={`w-9 h-5 rounded-full relative transition-colors ${headerSettings.showPurchasePrice ? 'bg-[#4F46E5]' : 'bg-gray-200 border border-gray-300'}`}
                                >
                                    <div className={`absolute top-[2px] w-4 h-4 rounded-full bg-white shadow-sm transition-all ${headerSettings.showPurchasePrice ? 'left-[18px]' : 'left-[2px]'}`}></div>
                                </button>
                            </div>
                        </div>

                        {/* Header Labels */}
                        <div className="flex flex-col gap-3">
                            <h3 className="text-[14px] font-bold text-[#1f2937] mb-1">Header Labels</h3>
                            <div className="flex gap-3">
                                <input
                                    type="text"
                                    value={headerSettings.labelGstin}
                                    onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelGstin: e.target.value }))}
                                    className="flex-1 border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                />
                                <input
                                    type="text"
                                    value={headerSettings.labelInvoiceNumber}
                                    onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelInvoiceNumber: e.target.value }))}
                                    className="flex-1 border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                />
                            </div>
                            <div className="flex gap-3">
                                <input
                                    type="text"
                                    value={headerSettings.labelDate}
                                    onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelDate: e.target.value }))}
                                    className="flex-1 border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                />
                                <input
                                    type="text"
                                    value={headerSettings.labelCustomer}
                                    onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelCustomer: e.target.value }))}
                                    className="flex-1 border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                />
                            </div>
                            <input
                                type="text"
                                value={headerSettings.labelAddress}
                                onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelAddress: e.target.value }))}
                                className="w-[calc(50%-6px)] border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                            />
                        </div>

                        {/* Party Details */}
                        <div className="flex flex-col gap-3">
                            <h3 className="text-[14px] font-bold text-[#1f2937] mb-1">Party Details</h3>
                            <div className="flex gap-3">
                                <div className="flex-1 relative">
                                    <input
                                        type="text"
                                        value={headerSettings.labelPartyContact}
                                        onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelPartyContact: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setHeaderSettings(prev => ({ ...prev, partyContactNumber: !prev.partyContactNumber }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${headerSettings.partyContactNumber ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {headerSettings.partyContactNumber && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="flex-1 relative">
                                    <input
                                        type="text"
                                        value={headerSettings.labelPartyPan}
                                        onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelPartyPan: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setHeaderSettings(prev => ({ ...prev, partyPanNumber: !prev.partyPanNumber }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${headerSettings.partyPanNumber ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {headerSettings.partyPanNumber && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                            </div>
                            <div className="w-[calc(50%-6px)] relative">
                                <input
                                    type="text"
                                    value={headerSettings.labelPartyGstin}
                                    onChange={(e) => setHeaderSettings(prev => ({ ...prev, labelPartyGstin: e.target.value }))}
                                    className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                />
                                <button
                                    onClick={() => setHeaderSettings(prev => ({ ...prev, partyGstin: !prev.partyGstin }))}
                                    className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${headerSettings.partyGstin ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                >
                                    {headerSettings.partyGstin && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                </button>
                            </div>
                        </div>

                        {/* Custom field */}
                        <div className="bg-[#f8f5fd] rounded-[8px] p-4 flex flex-col gap-4">
                            <div className="flex items-center justify-between">
                                <h3 className="text-[14px] font-bold text-[#4F46E5]">Custom field</h3>
                                <button className="bg-[#4F46E5] text-white px-3 py-1 rounded-[4px] text-[12px] font-medium">Add +</button>
                            </div>

                            {headerSettings.customFields.map((field, index) => (
                                <div key={index} className="flex gap-3 items-center">
                                    <FloatingInput
                                        label="Field Name"
                                        value={field.name}
                                        onChange={(e) => {
                                            const newFields = [...headerSettings.customFields];
                                            newFields[index].name = e.target.value;
                                            setHeaderSettings(prev => ({ ...prev, customFields: newFields }));
                                        }}
                                        className="flex-1"
                                    />
                                    <FloatingInput
                                        label="Field Value"
                                        value={field.value}
                                        onChange={(e) => {
                                            const newFields = [...headerSettings.customFields];
                                            newFields[index].value = e.target.value;
                                            setHeaderSettings(prev => ({ ...prev, customFields: newFields }));
                                        }}
                                        className="flex-1"
                                    />
                                    <button className="text-red-500 hover:text-red-600 transition-colors p-1">
                                        <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                    </button>
                                </div>
                            ))}
                        </div>

                    </div>

                    {/* Drawer Footer */}
                    <div className="px-5 sm:px-6 py-3.5 flex items-center gap-3 border-t border-[#e5e7eb] bg-[#ffffff] shrink-0 sticky bottom-0">
                        <button
                            onClick={async () => {
                                const success = await savePrintSettings(true);
                                if (success) {
                                    setIsHeaderSettingsOpen(false);
                                }
                            }}
                            className="bg-[#4F46E5] hover:bg-[#4338ca] text-[#ffffff] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Save
                        </button>
                        <button
                            onClick={() => setIsHeaderSettingsOpen(false)}
                            className="bg-[#e9ecef] hover:bg-[#dde0e3] text-[#4F46E5] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Back
                        </button>
                    </div>

                </div>
            )}

            {/* Table Settings Drawer */}
            {isTableSettingsOpen && (
                <div className="fixed sm:absolute top-0 right-0 h-full w-full sm:w-[500px] max-w-full bg-[#ffffff] shadow-2xl z-50 flex flex-col border-l border-[#e5e7eb] animate-slide-in-right">

                    {/* Drawer Header */}
                    <div className="flex items-center justify-between px-5 sm:px-6 py-4 border-b border-[#e5e7eb] shrink-0">
                        <h2 className="text-[18px] font-bold text-[#1f2937]">Table Settings</h2>
                        <button onClick={() => setIsTableSettingsOpen(false)} className="text-gray-400 hover:text-gray-600 transition-colors p-1 rounded-md hover:bg-gray-100">
                            <X className="w-5 h-5" />
                        </button>
                    </div>

                    {/* Drawer Body */}
                    <div className="flex-1 overflow-y-auto p-4 sm:p-6 flex flex-col gap-8 bg-[#ffffff]">

                        {/* Table Headers Section */}
                        <div className="flex flex-col gap-4">
                            <h3 className="text-[14px] font-bold text-[#1f2937]">Table Headers</h3>
                            <div className="grid grid-cols-2 gap-3">
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thItemName}
                                        placeholder="Item Name"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thItemName: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thHsnSac}
                                        placeholder="HSN/SAC"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thHsnSac: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThHsnSac: !prev.showThHsnSac }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThHsnSac ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThHsnSac && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thGst}
                                        placeholder="GST (%)"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thGst: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThGst: !prev.showThGst }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThGst ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThGst && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thRate}
                                        placeholder="Rate"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thRate: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThRate: !prev.showThRate }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThRate ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThRate && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thDiscount}
                                        placeholder="Discount"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thDiscount: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThDiscount: !prev.showThDiscount }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThDiscount ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThDiscount && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thTaxableValue}
                                        placeholder="Taxable Value"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thTaxableValue: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThTaxableValue: !prev.showThTaxableValue }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThTaxableValue ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThTaxableValue && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.thTotalAmount}
                                        placeholder="Total Amount"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, thTotalAmount: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showThTotalAmount: !prev.showThTotalAmount }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showThTotalAmount ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showThTotalAmount && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                            </div>
                        </div>

                        {/* Total Labels Section */}
                        <div className="flex flex-col gap-4">
                            <h3 className="text-[14px] font-bold text-[#1f2937]">Total Labels</h3>
                            <div className="grid grid-cols-2 gap-3">
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlIgst}
                                        placeholder="IGST"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlIgst: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlIgst: !prev.showTlIgst }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlIgst ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlIgst && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlCgst}
                                        placeholder="CGST"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlCgst: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlCgst: !prev.showTlCgst }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlCgst ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlCgst && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlSgst}
                                        placeholder="SGST"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlSgst: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlSgst: !prev.showTlSgst }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlSgst ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlSgst && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlCess}
                                        placeholder="Cess"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlCess: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlCess: !prev.showTlCess }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlCess ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlCess && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlTcs}
                                        placeholder="TCS"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlTcs: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlTcs: !prev.showTlTcs }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlTcs ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlTcs && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                                <div className="relative">
                                    <input
                                        type="text"
                                        value={tableSettings.tlRoundOff}
                                        placeholder="Round off"
                                        onChange={(e) => setTableSettings(prev => ({ ...prev, tlRoundOff: e.target.value }))}
                                        className="w-full border-[1.5px] border-gray-300 rounded-[6px] px-3 py-2 pr-8 text-[13px] text-[#4b5563] outline-none focus:border-[#4F46E5]"
                                    />
                                    <button
                                        onClick={() => setTableSettings(prev => ({ ...prev, showTlRoundOff: !prev.showTlRoundOff }))}
                                        className={`absolute right-2 top-1/2 -translate-y-1/2 w-[18px] h-[18px] rounded-full flex items-center justify-center transition-colors ${tableSettings.showTlRoundOff ? 'bg-[#4F46E5]' : 'bg-gray-200'}`}
                                    >
                                        {tableSettings.showTlRoundOff && <svg className="w-3 h-3 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>}
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>

                    {/* Drawer Footer */}
                    <div className="px-5 sm:px-6 py-3.5 flex items-center gap-3 border-t border-[#e5e7eb] bg-[#ffffff] shrink-0 sticky bottom-0">
                        <button
                            onClick={async () => {
                                const success = await savePrintSettings(true);
                                if (success) {
                                    setIsTableSettingsOpen(false);
                                }
                            }}
                            className="bg-[#4F46E5] hover:bg-[#4338ca] text-[#ffffff] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Save
                        </button>
                        <button
                            onClick={() => setIsTableSettingsOpen(false)}
                            className="bg-[#e9ecef] hover:bg-[#dde0e3] text-[#4F46E5] px-6 py-2 rounded-[6px] text-[14px] font-bold transition-colors"
                        >
                            Back
                        </button>
                    </div>

                </div>
            )}
        </div>
    );
}

function MenuItem({ label, onClick }) {
    return (
        <div className="flex items-center justify-between cursor-pointer group" onClick={onClick}>
            <span className="text-[14px] font-bold text-[#4F46E5] group-hover:text-[#4F46E5] transition-colors">
                {label}
            </span>
            <div className="w-5 h-5 rounded-full bg-[#4F46E5] flex items-center justify-center group-hover:bg-[#4F46E5] transition-colors">
                <ChevronRight className="w-3.5 h-3.5 text-[#ffffff]" />
            </div>
        </div>
    );
}

function UserIcon({ className }) {
    return (
        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
            className={className}
        >
            <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
            <circle cx="12" cy="7" r="4" />
        </svg>
    );
}

function CustomSelect({ label, value, onChange, options }) {
    const [isOpen, setIsOpen] = useState(false);
    const selectRef = useRef(null);

    useEffect(() => {
        function handleClickOutside(event) {
            if (selectRef.current && !selectRef.current.contains(event.target)) {
                setIsOpen(false);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, []);

    return (
        <div className="relative" ref={selectRef}>
            <div
                className="w-full border-[1.5px] border-[#4F46E5] rounded-[6px] px-3 py-2 text-[13px] text-[#1f2937] cursor-pointer bg-[#ffffff] flex justify-between items-center"
                onClick={() => setIsOpen(!isOpen)}
            >
                <span className="absolute -top-[9px] left-3 bg-[#ffffff] px-1 text-[13px] font-medium text-[#4F46E5]">
                    {label}
                </span>
                <span>{value}</span>
                <svg className={`w-4 h-4 text-blue-600 transition-transform ${isOpen ? 'rotate-180' : ''}`} fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M19 9l-7 7-7-7"></path></svg>
            </div>

            {isOpen && (
                <div className="absolute top-full left-0 w-full mt-1 bg-[#ffffff] rounded-[4px] shadow-lg border border-[#e5e7eb] z-50 overflow-hidden">
                    {options.map((opt, idx) => (
                        <div
                            key={idx}
                            className={`px-4 py-2.5 text-[14px] cursor-pointer transition-colors ${value === opt ? 'bg-[#4F46E5] text-[#ffffff]' : 'text-[#1f2937] hover:bg-gray-100'}`}
                            onClick={() => {
                                onChange(opt);
                                setIsOpen(false);
                            }}
                        >
                            {opt}
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}

function FloatingInput({ label, suffix, value, onChange, className }) {
    return (
        <div className={`relative ${className || ''}`}>
            <span className="absolute -top-[9px] left-3 bg-[#ffffff] px-1 text-[12px] font-medium text-[#4F46E5] z-10">
                {label}
            </span>
            <div className="flex items-center border-[1.5px] border-[#4F46E5] rounded-[6px] bg-[#ffffff] px-3 py-1.5 focus-within:border-[#4F46E5]">
                <input
                    type="text"
                    className="w-full outline-none text-[13px] text-[#1f2937] bg-transparent font-medium"
                    value={value}
                    onChange={onChange}
                />
                {suffix && <span className="text-[13px] text-[#6b7280] ml-2 font-medium">{suffix}</span>}
            </div>
        </div>
    )
}

function PrintDashedLine({ className = "my-0.5" }) {
    return (
        <div className={`w-full overflow-hidden h-[2px] flex items-center ${className}`}>
            <svg width="100%" height="1" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
                <line x1="0" y1="0.5" x2="100%" y2="0.5" stroke="black" strokeWidth="1" strokeDasharray="3,3" />
            </svg>
        </div>
    );
}

