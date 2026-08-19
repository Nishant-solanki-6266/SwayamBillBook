import React from 'react';

export const PrintDashedLine = ({ className }) => (
    <div className={`w-full border-t border-dashed border-gray-400 my-1 ${className || ''}`}></div>
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
  transactionType2
}) => {
  return (
    <div className="bg-[#ffffff] text-[#000000] text-[11px] w-full h-full font-sans mx-auto" style={{ maxWidth: '210mm' }}>
      {/* 1. Header Section */}
                            <div className="w-full flex flex-col border-b border-black">
                                <div className="text-center font-bold py-1 border-b border-black">{transactionType2.toUpperCase()} {transactionType2 === 'Income Transaction' ? '( Original )' : ''}</div>
                                <div className="flex w-full p-2 h-[120px]">
                                    {/* Logo */}
                                    <div className="w-[120px] flex items-center justify-center">
                                    </div>
                                    {/* Company Info */}
                                    <div className="flex-1 text-center flex flex-col items-center justify-center px-2">
                                        <h2 className="text-[20px] font-bold">Swayam Bill Book</h2>
                                        <p className="text-[12px] text-gray-500 font-medium">The Digital Accounting Book</p>
                                        <p>NO, , OPP GRAM PANCHAYAT, SH 31, BELAGAVI, KARNATAKA, INDIA, 591220</p>
                                        <p>Tel : 9845972853 | swayamsoftwaretarget@gmail.com</p>
                                        <p>GSTIN: 29DCDPP7499L2ZH</p>
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
                                    <div className="font-bold uppercase">{previewInvoice?.customer?.name || 'NISHIT'}</div>
                                    <div className="uppercase">{previewInvoice?.customer?.address || 'A-406, 4TH FLOOR, MONARCH GAURAVPATH ROAD, PALIIIII, BAMBOO FLAT, ANDAMAN AND NICOBAR ISLANDS, INDIA'}</div>
                                    <div className="uppercase">Contact No: {previewInvoice?.customer?.phone || '9XXXXXX321 | 9XXXXXX321'}</div>
                                    <div>Email: {previewInvoice?.customer?.email || 'exa****@gmail.com'}</div>
                                    <div className="uppercase">GSTIN: {previewInvoice?.customer?.gstin || '24AADCD6XXXXXXX'}</div>
                                    <div className="uppercase">PAN: {previewInvoice?.customer?.pan || 'EDBARXXXXX'}</div>
                                </div>
                                {/* Ship To */}
                                <div className="flex-[0.8] border-r border-black p-2 flex flex-col">
                                    <div className="text-[#4F46E5] mb-1 font-bold">Ship to:</div>
                                    <div className="font-bold uppercase">{previewInvoice?.customer?.name || 'NISHIT'}</div>
                                    <div className="uppercase">{previewInvoice?.customer?.address || 'A-406, 4TH FLOOR, MONARCH GAURAVPATH ROAD, PAL, BAMBOO FLAT, ANDAMAN AND NICOBAR ISLANDS, INDIA'}</div>
                                    <div className="uppercase">Contact No: {previewInvoice?.customer?.phone || '9XXXXXX321'}</div>
                                    <div className="uppercase">GSTIN: {previewInvoice?.customer?.gstin || '24AADCD6XXXXXXX'}</div>
                                    <div className="uppercase">PAN: {previewInvoice?.customer?.pan || 'EDBARXXXXX'}</div>
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
                                            {headerSettings.showHsn && <th className="border-r border-black p-1 font-normal">HSN/<br />SAC</th>}
                                            {headerSettings.showPurchasePrice && <th className="border-r border-black p-1 font-normal">Purchase<br />Price</th>}
                                            {headerSettings.showMrp && <th className="border-r border-black p-1 font-normal">MRP</th>}
                                            <th className="border-r border-black p-1 font-normal">Pcs</th>
                                            {headerSettings.showSecondaryQty && <th className="border-r border-black p-1 font-normal">Sec.<br />Qty</th>}
                                            {headerSettings.showPrimaryQty && <th className="border-r border-black p-1 font-normal">Pri.<br />Qty</th>}

                                            {headerSettings.showUnit && <th className="border-r border-black p-1 font-normal">Unit</th>}
                                            <th className="border-r border-black p-1 font-normal">Size</th>
                                            <th className="border-r border-black p-1 font-normal">Pcs<br />Rate</th>

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
                                                {headerSettings.showHsn && <td className="border-r border-black p-1 pt-2">{item.hsnCode || '-'}</td>}
                                                {headerSettings.showPurchasePrice && <td className="border-r border-black p-1 pt-2">{item.purchasePrice || '-'}</td>}
                                                {headerSettings.showMrp && <td className="border-r border-black p-1 pt-2">{item.mrp || '-'}</td>}
                                                <td className="border-r border-black p-1 pt-2">{item.qty || '-'}</td>
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
                                    <div className="p-2 border-b border-black text-[10px]">
                                        <div className="font-bold mb-1">Terms and Conditions:</div>
                                        <div className="mb-1">{footerSettings.labelTermsAndConditions || "Terms and Conditions"}</div>
                                        <p className="mb-2 text-gray-700">{previewInvoice?.terms || ''}</p>

                                        <div className="font-bold mb-1">Notes:</div>
                                        <p className="text-gray-700">{previewInvoice?.notes || footerSettings.labelThankYouNote || ''}</p>
                                    </div>
                                    <div className="p-2 flex flex-col justify-end flex-1">
                                        <div className="flex gap-2"><span>In Words:</span> <span>{previewInvoice?.amountInWords || ''}</span></div>
                                        <div className="flex gap-2"><span>Payment Details:</span> <span>{previewInvoice?.paymentMode || 'Cash / Bank Transfer'}</span></div>
                                    </div>
                                </div>

                                {/* Right side summary */}
                                <div className="flex-1 flex flex-col">
                                    <div className="p-2 border-b border-black flex flex-col gap-1 flex-1">
                                        <div className="flex justify-between"><span>Credit Period:</span> <span>{previewInvoice?.creditPeriod ? `${previewInvoice.creditPeriod} Days` : ''}</span></div>
                                        <div className="flex justify-between"><span>Due Date:</span> <span>{previewInvoice?.dueDate ? new Date(previewInvoice.dueDate).toLocaleDateString('en-GB') : ''}</span></div>
                                        <div className="flex justify-between mt-2"><span>Broker:</span> <span>{previewInvoice?.brokerName || ''}</span></div>
                                        <div className="flex justify-between"><span>GSTIN:</span> <span>{previewInvoice?.customer?.gstin || ''}</span></div>
                                    </div>

                                    <div className="p-2 border-b border-black flex flex-col gap-1">
                                        <div className="flex justify-between"><span>Taxable Value:</span> <span>₹8,672.90</span></div>
                                        <div className="flex justify-between"><span>IGST:</span> <span>₹544.00</span></div>
                                        <div className="flex justify-between"><span>TCS:</span> <span>₹8.00</span></div>
                                        <div className="flex justify-between"><span>Cess:</span> <span>₹45.00</span></div>
                                        <div className="flex justify-between"><span>Round off:</span> <span>₹0.10</span></div>
                                    </div>

                                    <div className="p-2 flex justify-between font-bold text-[12px] h-full items-end">
                                        <span>Total:</span> <span>₹{previewInvoice?.totalAmount ? Number(previewInvoice.totalAmount).toFixed(2) : totalFinal.toFixed(2)}</span>
                                    </div>
                                </div>
                            </div>

                            {/* 7. Tax Breakup Table */}
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
                                        <tr>
                                            <td className="border-r border-black p-1">1</td>
                                            <td className="border-r border-black p-1">-</td>
                                            <td className="border-r border-black p-1">₹{totalTaxable.toFixed(2)}</td>
                                            <td className="border-r border-black p-1">0</td>
                                            <td className="border-r border-black p-1">₹0.00</td>
                                            <td className="p-1">₹0.00</td>
                                        </tr>
                                        <tr className="border-t border-black font-bold">
                                            <td colSpan="2" className="border-r border-black p-1">Total</td>
                                            <td className="border-r border-black p-1">₹{totalTaxable.toFixed(2)}</td>
                                            <td className="border-r border-black p-1"></td>
                                            <td className="border-r border-black p-1">₹{previewInvoice?.totalIgst ? Number(previewInvoice.totalIgst).toFixed(2) : '0.00'}</td>
                                            <td className="p-1">₹{previewInvoice?.totalGstAmount ? Number(previewInvoice.totalGstAmount).toFixed(2) : '0.00'}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            {/* 8. Bottom Footer */}
                            <div className="w-full flex flex-1">
                                <div className="flex-[1.8] flex flex-col justify-start">
                                    <div className="p-2 border-r border-black flex flex-col gap-1 w-full">
                                        <div className="flex"><span className="w-24">Bank:</span> <span>{previewInvoice?.bankName || allPrintSettings?.bankDetails?.bankName || ''}</span></div>
                                        <div className="flex"><span className="w-24">IFSC Code:</span> <span>{previewInvoice?.bankIfsc || allPrintSettings?.bankDetails?.bankIfsc || ''}</span></div>
                                        <div className="flex"><span className="w-24">A/C Number:</span> <span>{previewInvoice?.bankAccountNo || allPrintSettings?.bankDetails?.bankAccountNo || ''}</span></div>
                                        <div className="flex"><span className="w-24">Bank Branch:</span> <span>{previewInvoice?.bankBranch || allPrintSettings?.bankDetails?.bankBranch || ''}</span></div>
                                        <div className="flex"><span className="w-24">A/C Name:</span> <span>{previewInvoice?.bankAccountName || allPrintSettings?.bankDetails?.bankAccountName || ''}</span></div>
                                        <div className="flex"><span className="w-24">UPI ID:</span> <span>{previewInvoice?.upiId || allPrintSettings?.bankDetails?.upiId || ''}</span></div>
                                    </div>
                                </div>
                                <div className="flex-1 p-2 flex flex-col justify-between items-end text-right h-full pb-4">
                                    <div>For, SWAYAM BILLING<br />SOFTWARE</div>
                                    <div className="mt-16 text-gray-700">Authorized Signatory</div>
                                </div>
                            </div>
    </div>
  );
};

export const ThermalTemplate = ({
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
  transactionType2
}) => {
  return (
    <div className="bg-[#ffffff] text-[#000000] w-full font-sans mx-auto" style={{ paddingRight: customization?.thermalMarginRight ? `calc(20px + ${customization.thermalMarginRight}mm)` : undefined, fontWeight: customization?.thermalFontWeight || 'normal' }}>
      <div className="w-full border-2 border-black flex flex-col px-1 pb-2">
                                {/* Header */}
                                <div className="text-center w-full mb-3">
                                    {headerSettings.showLogo && (
                                        <div className="flex justify-center mb-2">
                                            <div className="w-14 h-14 bg-gray-200 border border-gray-300 flex items-center justify-center text-[10px] text-gray-500 rounded-full">Logo</div>
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
                                    >Swayam Bill Book</h2>
                                    <p className="text-gray-500 mb-1" style={{ fontSize: `max(10px, calc(${customization.headerCompanyNameFontSize}px * 0.55))` }}>The Digital Accounting Book</p>
                                    <p className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerCompanyAddressFontSize}px` }}>NO, , OPP GRAM PANCHAYAT, SH 31, BELAGAVI, KARNATA</p>
                                    <p className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerCompanyAddressFontSize}px` }}>KA, INDIA, 591220</p>
                                    <p className="text-[#374151] leading-tight mt-1" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>
                                        {headerSettings.showMobileNumber && <span>Tel : +91 9845972853</span>}
                                        {headerSettings.showMobileNumber && headerSettings.showEmail && <span> | </span>}
                                        {headerSettings.showEmail && <span>swayamsoftwaretarget@gmail.com</span>}
                                    </p>
                                    <p className="text-[#374151] leading-tight" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{headerSettings.labelGstin || 'GSTIN'}: 29DCDPP7499L2ZH</p>

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
                                        <span className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelInvoiceNumber || 'Invoice Number'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.invoiceNo || 'MA22/2348'}</span></span>
                                        <span className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelDate || 'Date'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.date ? new Date(previewInvoice.date).toLocaleDateString('en-GB') : '28-05-2026'}</span></span>
                                    </div>
                                    <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelCustomer || 'Customer'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.name || 'Walk-in Customer'}</span></div>
                                    <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelAddress || 'Address'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.address || 'Local'}</span></div>
                                    <div>{previewInvoice?.customer?.city ? `${previewInvoice.customer.city}, ${previewInvoice.customer.state || ''}` : ''}</div>

                                    {headerSettings.partyGstin && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyGstin || 'GSTIN'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.gstin || '24AADCD6XXXXXXX'}</span></div>
                                    )}
                                    {headerSettings.partyContactNumber && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyContact || 'Contact No'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.phone || '1234567891'}</span></div>
                                    )}
                                    {headerSettings.partyPanNumber && (
                                        <div className="font-bold" style={{ fontSize: `${customization.headerLabelsFontSize}px` }}>{headerSettings.labelPartyPan || 'PAN'}: <span className="font-normal" style={{ fontSize: `${customization.headerContentsFontSize}px` }}>{previewInvoice?.customer?.pan || 'EDqARXXXXX'}</span></div>
                                    )}
                                </div>

                                {/* Table */}
                                <div className="w-full mb-1">
                                    <PrintDashedLine />
                                    <div className="flex w-full py-1 font-bold overflow-hidden" style={{ fontSize: `${customization.tableHeadingsFontSize}px` }}>
                                        <div className="flex-[1.5] text-left pr-1 min-w-0 break-words">{tableSettings.thItemName || 'Item Name'}</div>
                                        {headerSettings.showCompanyProductCode && <div className="flex-1 min-w-0 break-all px-0.5 text-right">P.Code</div>}
                                        {headerSettings.showBatchNo && <div className="flex-1 min-w-0 break-all px-0.5 text-right">Batch</div>}
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
                                        {(previewInvoice?.items?.length > 0
                                            ? previewInvoice.items.map(i => ({
                                                name: i.product?.name || i.name || 'Unknown',
                                                qty: i.quantity || 1,
                                                rate: i.price || 0,
                                                discount: i.discount1 || 0,
                                                taxableValue: i.amount || 0,
                                                totalAmount: i.amount || 0,
                                                desc: ''
                                            }))
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
                                        <div className="font-bold mb-3" style={{ fontSize: `${customization.footerHeadingsFontSize}px` }}>
                                            Payment Details: <span className="font-normal" style={{ fontSize: `${customization.footerContentsFontSize}px` }}>{previewInvoice?.paymentMode || 'Cash / Bank Transfer'}</span>
                                        </div>
                                        <div className="font-bold mb-1" style={{ fontSize: `${customization.footerTermsFontSize}px` }}>{footerSettings.labelTermsAndConditions || "Terms and conditions"}:</div>
                                        <div className="mb-1" style={{ fontSize: `${customization.footerTermsFontSize}px` }}>Payment Terms:</div>
                                        <div style={{ fontSize: `${customization.footerTermsFontSize}px` }}>Clearly state the payment due date, which is the date by which the client must pay the invoice amount. Specify the accepted payment methods (e.g., credit card bank transfer, PayPal) and any associated fees for certain payment methods.</div>
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
