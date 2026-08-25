import React from 'react';

export const PrintDashedLine = ({ className }) => (
    <div className={`w-full border-t border-dashed border-gray-400 my-1 ${className || '-'}`}></div>
);

export const Template1 = ({
    previewInvoice,
    parsedItems,
    totalQty,
    totalTaxable,
    totalFinal,
    qrCodeUrl,
    allPrintSettings,
    headerSettings,
    tableSettings,
    footerSettings,
    customization,
    transactionType,
    transactionType2,
    pdfFormat,
    companyProfile
}) => {
    const calculatedGst = (parsedItems || []).reduce((s, i) => s + ((Number(i.taxableValue || 0) * Number(i.gstRate || 0)) / 100), 0);
    const invoiceTaxable = Number(previewInvoice?.subTotal || previewInvoice?.taxableAmount || totalTaxable || 0);
    const invoiceGst = Number(previewInvoice?.totalGstAmount || previewInvoice?.taxAmount || previewInvoice?.gstAmount || calculatedGst || 0);
    const invoiceIgst = Number(previewInvoice?.totalIgst || (previewInvoice?.totalIgst === 0 && calculatedGst > 0 ? calculatedGst : 0));
    const invoiceCgst = Number(previewInvoice?.totalCgst || 0);
    const invoiceSgst = Number(previewInvoice?.totalSgst || 0);
    const invoiceTcs = Number(previewInvoice?.tcsAmount || 0);
    const invoiceCess = Number(previewInvoice?.cessAmount || previewInvoice?.cess || 0);
    const invoiceRoundOff = Number(previewInvoice?.roundOff || 0);
    const invoiceTotal = Number(previewInvoice?.totalAmount || totalFinal || (invoiceTaxable + invoiceGst));

    return (
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
            <div className={`bg-[#ffffff] text-[#000000] text-[11px] w-full h-auto box-border border border-black flex flex-col justify-between font-sans mx-auto printable-a4 ${pdfFormat === 'A5' ? 'format-a5' : ''} ${(pdfFormat === 'Landscape A5' || pdfFormat === 'A4 Half') ? 'format-a5-landscape' : ''}`}>
            {/* 1. Header Section */}
            <div className="w-full flex flex-col border-b border-black">
                <div className="flex w-full pt-1.5 px-2 pb-1">
                    {/* Logo */}
                    <div className="w-[130px] flex items-center justify-center">
                        {headerSettings?.showLogo && (
                            (companyProfile?.logo || previewInvoice?.company?.logo) ? (
                                <img src={companyProfile?.logo || previewInvoice?.company?.logo} alt="Logo" className="max-h-16 object-contain" />
                            ) : (
                                <div className="flex items-center gap-1.5 p-1">
                                    <svg className="w-8 h-8 shrink-0 drop-shadow-sm" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <mask id="blue-doc-mask-pt" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                            <rect width="24" height="24" fill="white" />
                                            <rect x="10" y="7" width="12" height="14" rx="2" fill="black" />
                                            <line x1="6" y1="7" x2="10" y2="7" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="10" x2="10" y2="10" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="13" x2="10" y2="13" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="16" x2="11" y2="16" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                        </mask>
                                        <rect x="2" y="3" width="14" height="18" rx="3" fill="#3b82f6" mask="url(#blue-doc-mask-pt)" />
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
                        <div className="font-bold mb-1">{transactionType2?.toUpperCase()} {transactionType2 === 'Income Transaction' ? '( Original )' : ''}</div>
                        <h2 className="text-[20px] font-bold">{companyProfile?.name || previewInvoice?.company?.name || 'Swayam Bill Book'}</h2>
                        <p className="text-[12px] text-gray-500 font-medium">{companyProfile?.tagline || 'The Digital Accounting Book'}</p>
                        <p>{companyProfile?.address || previewInvoice?.company?.address || 'NO, , OPP GRAM PANCHAYAT, SH 31, BELAGAVI, KARNATAKA, INDIA, 591220'}</p>
                        <p>Tel : {companyProfile?.phone || previewInvoice?.company?.phone || '9845972853'} | {companyProfile?.ownerEmail || companyProfile?.email || previewInvoice?.company?.email || 'swayamsoftwaretarget@gmail.com'}</p>
                        <p>GSTIN: {companyProfile?.companySetting?.gstin || companyProfile?.gstin || previewInvoice?.company?.gstin || '29DCDPP7499L2ZH'}</p>
                        <p>pass BILL3: 1</p>
                    </div>
                    {/* QR Code */}
                    {headerSettings?.showQrCode && (
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
                    <div className="flex"><span className="w-32">Transport Name:</span> <span className="uppercase">{previewInvoice?.transportName || '-'}</span></div>
                    <div className="flex"><span className="w-32">Document No:</span> <span className="uppercase">{previewInvoice?.documentNo || '-'}</span></div>
                    <div className="flex"><span className="w-32">Document Date:</span> <span className="uppercase">{previewInvoice?.documentDate ? new Date(previewInvoice.documentDate).toLocaleDateString('en-GB') : ''}</span></div>
                </div>
                <div className="flex-1 p-2 flex flex-col gap-1">
                    <div className="flex justify-between"><span className="w-32">Ack No:</span> <span className="uppercase">{previewInvoice?.ackNo || '-'}</span></div>
                    <div className="flex justify-between"><span className="w-32">Ack Date:</span> <span className="uppercase">{previewInvoice?.ackDate ? new Date(previewInvoice.ackDate).toLocaleDateString('en-GB') : ''}</span></div>
                    <div className="flex justify-between"><span className="w-32">IRN:</span> <span className="uppercase">{previewInvoice?.irn || '-'}</span></div>
                </div>
            </div>

            {/* 4. PO / E-way Details */}
            <div className="w-full flex border-b border-black">
                <div className="flex-1 border-r border-black p-2 flex flex-col gap-1">
                    <div className="flex justify-between"><span>PO No:</span> <span className="uppercase">{previewInvoice?.poNo || '-'}</span></div>
                    <div className="flex justify-between"><span>PO Date:</span> <span className="uppercase">{previewInvoice?.poDate ? new Date(previewInvoice.poDate).toLocaleDateString('en-GB') : ''}</span></div>
                </div>
                <div className="flex-1 border-r border-black p-2 flex flex-col gap-1">
                    <div className="flex justify-between"><span>E-way Bill No:</span> <span className="uppercase">{previewInvoice?.ewayBillNo || '-'}</span></div>
                    <div className="flex justify-between"><span>E-way Bill Date:</span> <span className="uppercase">{previewInvoice?.ewayBillDate ? new Date(previewInvoice.ewayBillDate).toLocaleDateString('en-GB') : ''}</span></div>
                    <div className="flex justify-between"><span>Vehicle No:</span> <span className="uppercase">{previewInvoice?.vehicleNo || '-'}</span></div>
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
                                <td className="border-r border-black p-1 pt-2 text-left whitespace-normal break-words">
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
                        <p className="mb-2 text-gray-700">{previewInvoice?.terms || '-'}</p>

                        <div className="font-bold mb-1">Notes:</div>
                        <p className="text-gray-700">{previewInvoice?.notes || footerSettings?.labelThankYouNote || '-'}</p>
                    </div>
                    <div className="p-0.5 flex flex-col justify-end flex-1">
                        <div className="flex gap-2"><span>In Words:</span> <span>{previewInvoice?.amountInWords || '-'}</span></div>
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
                        <div className="flex justify-between mt-2"><span>Broker:</span> <span>{previewInvoice?.brokerName || '-'}</span></div>
                        <div className="flex justify-between"><span>GSTIN:</span> <span>{previewInvoice?.customer?.gstin || '-'}</span></div>
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
                                    <td className="border-r border-black p-1">₹totalTaxable.toFixed(2)</td>
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
    );
};

export const ThermalTemplate = ({
    previewInvoice,
    companyProfile,
    parsedItems,
    totalQty,
    totalTaxable,
    totalFinal,
    qrCodeUrl,
    allPrintSettings,
    headerSettings,
    tableSettings,
    footerSettings,
    customization,
    transactionType,
    transactionType2
}) => {
    return (
        <div className="bg-[#ffffff] text-[#000000] w-full font-sans mx-auto" style={{ paddingRight: customization?.thermalMarginRight ? `calc(20px + ${customization.thermalMarginRight}mm)` : undefined, fontWeight: customization?.thermalFontWeight || 'normal' }}>
            <div className="w-full border-2 border-black flex flex-col px-1 pb-2">
                {/* Header */}
                <div className="text-center w-full mb-3">
                    {headerSettings?.showLogo && (
                        <div className="flex justify-center mb-2">
                            {(companyProfile?.logo || previewInvoice?.company?.logo) ? (
                                <img src={companyProfile?.logo || previewInvoice?.company?.logo} alt="Logo" className="max-h-12 object-contain" />
                            ) : (
                                <div className="flex items-center gap-1.5 p-1 bg-gray-50/80 rounded border border-gray-200">
                                    <svg className="w-6 h-6 shrink-0" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <mask id="blue-doc-mask-thermal-pt" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                                            <rect width="24" height="24" fill="white" />
                                            <rect x="10" y="7" width="12" height="14" rx="2" fill="black" />
                                            <line x1="6" y1="7" x2="10" y2="7" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="10" x2="10" y2="10" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="13" x2="10" y2="13" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                            <line x1="6" y1="16" x2="11" y2="16" stroke="black" strokeWidth="1.5" strokeLinecap="round" />
                                        </mask>
                                        <rect x="2" y="3" width="14" height="18" rx="3" fill="#3b82f6" mask="url(#blue-doc-mask-thermal-pt)" />
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
                    <div className="flex w-full py-1 font-bold whitespace-normal break-words" style={{ fontSize: `${customization.tableHeadingsFontSize}px` }}>
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
                                        <div className="flex w-full py-0.5 whitespace-normal break-words">
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
                                    <div className="flex w-full py-0.5 whitespace-normal break-words">
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
                                <div className="flex w-full py-1 font-bold whitespace-normal break-words" style={{ fontSize: `${customization.tableTotalFontSize}px` }}>
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
    );
};
