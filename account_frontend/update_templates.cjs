const fs = require('fs');

const content = fs.readFileSync('src/pages/PrintSetting.jsx', 'utf-8');

// 1. Find A4 Block
const a4StartMarker = '{/* 1. Header Section */}';
const a4EndMarker = ') : ('; // This is before the thermal block
const a4Start = content.indexOf(a4StartMarker);

let a4Block = '';
if (a4Start !== -1) {
    const nextCloseParen = content.indexOf(') : (', a4Start);
    // The wrapper div closes just before `) : (`
    let block = content.substring(a4Start, nextCloseParen);
    // It ends with </div>\n                    </div>. We want to exclude the last </div> which belongs to the wrapper
    let lastDivIdx = block.lastIndexOf('</div>');
    if(lastDivIdx !== -1) {
        a4Block = block.substring(0, lastDivIdx).trim();
    }
}

// 2. Find Thermal Block
const thermalStartMarker = '<div className="w-full border-2 border-black flex flex-col px-1 pb-2">';
const thermalEndMarker = '</div>\n                    )}\n                </div>';
const thermalStart = content.indexOf(thermalStartMarker);

let thermalBlock = '';
if (thermalStart !== -1) {
    // find the end of thermal block
    // It ends right before `)}\n                </div>`
    const nextBracket = content.indexOf(')}', thermalStart);
    let block = content.substring(thermalStart, nextBracket);
    let lastDivIdx = block.lastIndexOf('</div>');
    if(lastDivIdx !== -1) {
        // wait, the wrapper is `<div ref={previewRef} ... > ...thermalBlock... </div>`
        // Actually, the thermalStartMarker IS the inner block. 
        // We just need the closing div of that inner block.
        // It's the second to last </div> before `)}`
        // Let's just find the closing </div> of the wrapper and exclude it.
        // Wait, the thermalStartMarker is `<div className="w-full border-2 border-black flex flex-col px-1 pb-2">` which is already INSIDE the wrapper!
        // The wrapper closes before `)}`.
        // Let's just take everything from `thermalStartMarker` to the second-to-last `</div>`
        let innerEnd = block.lastIndexOf('</div>');
        // wait, `block` string ends before `)}`. It should end with `</div>\n</div>`.
        innerEnd = block.lastIndexOf('</div>', innerEnd - 1);
        if(innerEnd !== -1) {
             // We can just use the exact end marker instead.
        }
    }
}

// A better way is to use regex or match the tags, but since we know the exact markers:
const a4StartIndex = content.indexOf('{/* 1. Header Section */}');
let a4Content = '';
if (a4StartIndex > -1) {
    const endIdx = content.indexOf(') : (', a4StartIndex);
    let text = content.substring(a4StartIndex, endIdx);
    // remove the last </div>
    a4Content = text.substring(0, text.lastIndexOf('</div>')).trim();
}

const thermalStartIndex = content.indexOf('<div className="w-full border-2 border-black flex flex-col px-1 pb-2">');
let thermalContent = '';
if (thermalStartIndex > -1) {
    let footerDrawerIdx = content.indexOf('Footer Settings Drawer', thermalStartIndex);
    // Find the end of the thermal block which is the `</div>` just before the drawer
    let text = content.substring(thermalStartIndex, footerDrawerIdx);
    
    // We want to remove the wrapper `</div>`s. The text ends near `)} \n </div> \n </div>`.
    // Let's just find the `)}` that closes the wrapper, and then find the `</div>` before it.
    let closeConditionIdx = text.lastIndexOf(')}');
    text = text.substring(0, closeConditionIdx);
    thermalContent = text.substring(0, text.lastIndexOf('</div>')).trim();
}

const templateCode = `import React from 'react';

export const PrintDashedLine = ({ className }) => (
    <div className={\`w-full border-t border-dashed border-gray-400 my-1 \${className || ''}\`}></div>
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
      ${a4Content}
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
    <div className="bg-[#ffffff] text-[#000000] w-full font-sans mx-auto" style={{ paddingRight: customization?.thermalMarginRight ? \`calc(20px + \${customization.thermalMarginRight}mm)\` : undefined, fontWeight: customization?.thermalFontWeight || 'normal' }}>
      ${thermalContent}
    </div>
  );
};
`;

fs.writeFileSync('src/pages/PrintTemplates.jsx', templateCode);
console.log('Successfully updated PrintTemplates.jsx');
