import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { 
  CheckCircle, 
  Package, 
  Tag, 
  Barcode as BarcodeIcon, 
  Layers, 
  ShieldCheck, 
  Building2, 
  MapPin, 
  Phone, 
  AlertCircle,
  FileText,
  Sparkles
} from 'lucide-react';
import apiClient from '../api/apiClient';

export function PublicProductPage() {
  const { identifier } = useParams();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        setLoading(true);
        setError(null);
        const res = await apiClient.get(`/public/product/${encodeURIComponent(identifier)}`);
        if (res.data && res.data.success) {
          setProduct(res.data.data);
        } else {
          setError(res.data?.message || 'Product not found');
        }
      } catch (err) {
        console.error('Failed to load product:', err);
        setError(err.response?.data?.message || 'Unable to find product details');
      } finally {
        setLoading(false);
      }
    };

    if (identifier) {
      fetchProduct();
    }
  }, [identifier]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-indigo-50 via-white to-blue-50 p-4">
        <div className="text-center bg-white/80 backdrop-blur-md p-8 rounded-2xl shadow-xl border border-indigo-100 max-w-sm w-full">
          <div className="w-12 h-12 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <h3 className="text-lg font-bold text-gray-800">Verifying Product...</h3>
          <p className="text-sm text-gray-500 mt-1">Fetching official details from Swayam Bill Book</p>
        </div>
      </div>
    );
  }

  if (error || !product) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-gray-50 to-gray-100 p-4">
        <div className="text-center bg-white p-8 rounded-2xl shadow-xl border border-red-100 max-w-md w-full">
          <div className="w-16 h-16 bg-red-50 text-red-500 rounded-full flex items-center justify-center mx-auto mb-4">
            <AlertCircle className="w-8 h-8" />
          </div>
          <h2 className="text-xl font-bold text-gray-800 mb-2">Product Not Found</h2>
          <p className="text-gray-600 text-sm mb-6">
            {error || `No registered product found for code: "${identifier}". Please check the QR code or barcode.`}
          </p>
          <a
            href="/"
            className="inline-flex items-center justify-center px-6 py-2.5 bg-indigo-600 text-white rounded-lg text-sm font-semibold hover:bg-indigo-700 transition-colors shadow-md"
          >
            Go to Home
          </a>
        </div>
      </div>
    );
  }

  const mrp = parseFloat(product.mrp) || 0;
  const price = parseFloat(product.price) || 0;
  const wholesalePrice = parseFloat(product.wholesalePrice) || 0;
  const discountPercent = mrp > price && mrp > 0 ? Math.round(((mrp - price) / mrp) * 100) : 0;

  return (
    <div className="min-h-screen bg-[#f3f4f8] py-8 px-4 sm:px-6 flex flex-col justify-between">
      <div className="max-w-2xl mx-auto w-full">
        
        {/* Verification Banner */}
        <div className="bg-gradient-to-r from-emerald-600 to-teal-600 text-white px-4 py-2.5 rounded-t-2xl flex items-center justify-between shadow-md">
          <div className="flex items-center gap-2">
            <ShieldCheck className="w-5 h-5 text-emerald-200" />
            <span className="text-xs sm:text-sm font-bold uppercase tracking-wider">
              Official QR Verified Product
            </span>
          </div>
          <span className="bg-white/20 text-white text-[11px] font-semibold px-2.5 py-0.5 rounded-full backdrop-blur-sm flex items-center gap-1">
            <CheckCircle className="w-3.5 h-3.5 text-emerald-300" /> Authentic
          </span>
        </div>

        {/* Main Card */}
        <div className="bg-white rounded-b-2xl shadow-xl border-x border-b border-gray-200 overflow-hidden">
          
          {/* Company / Store Header */}
          <div className="p-6 border-b border-gray-100 bg-gradient-to-b from-white to-gray-50 flex items-center justify-between gap-4">
            <div className="flex items-center gap-3">
              {product.company?.logo ? (
                <img 
                  src={product.company.logo} 
                  alt={product.company.name} 
                  className="w-12 h-12 object-contain rounded-lg border border-gray-200 bg-white p-1"
                />
              ) : (
                <div className="w-12 h-12 rounded-lg bg-indigo-600 text-white flex items-center justify-center font-bold text-lg shadow-sm">
                  <Building2 className="w-6 h-6" />
                </div>
              )}
              <div>
                <h3 className="font-extrabold text-gray-900 text-lg sm:text-xl leading-tight">
                  {product.company?.name || 'Swayam Bill Book'}
                </h3>
                {product.company?.address && (
                  <p className="text-xs text-gray-500 flex items-center gap-1 mt-0.5">
                    <MapPin className="w-3 h-3 text-gray-400 shrink-0" />
                    <span className="truncate max-w-[280px]">{product.company.address}</span>
                  </p>
                )}
              </div>
            </div>

            {product.company?.phone && (
              <a
                href={`tel:${product.company.phone}`}
                className="hidden sm:inline-flex items-center gap-1.5 px-3 py-1.5 bg-indigo-50 hover:bg-indigo-100 text-indigo-700 rounded-lg text-xs font-bold transition-colors border border-indigo-200"
              >
                <Phone className="w-3.5 h-3.5" /> Call Store
              </a>
            )}
          </div>

          {/* Product Showcase */}
          <div className="p-6 sm:p-8 space-y-6">
            
            {/* Title & Badges */}
            <div>
              <div className="flex flex-wrap items-center gap-2 mb-2">
                {product.brand && (
                  <span className="bg-indigo-50 text-indigo-700 text-xs font-bold px-2.5 py-1 rounded-md border border-indigo-200">
                    {product.brand}
                  </span>
                )}
                {product.category && (
                  <span className="bg-blue-50 text-blue-700 text-xs font-semibold px-2.5 py-1 rounded-md border border-blue-200">
                    {product.category}
                  </span>
                )}
                <span className="bg-emerald-50 text-emerald-700 text-xs font-semibold px-2.5 py-1 rounded-md border border-emerald-200">
                  {product.status || 'Active'}
                </span>
              </div>

              <h1 className="text-2xl sm:text-3xl font-black text-gray-900 leading-tight">
                {product.name}
              </h1>
              {product.hindiName && (
                <p className="text-lg text-gray-600 font-medium mt-0.5">{product.hindiName}</p>
              )}
            </div>

            {/* Price Box */}
            <div className="bg-gradient-to-br from-indigo-50/70 via-white to-blue-50/70 border border-indigo-100 rounded-xl p-5 shadow-sm">
              <div className="flex flex-wrap items-end justify-between gap-4">
                <div>
                  <span className="text-xs font-bold text-gray-500 uppercase tracking-wider block mb-1">
                    Special Offer Price
                  </span>
                  <div className="flex items-baseline gap-3">
                    <span className="text-3xl sm:text-4xl font-extrabold text-indigo-700">
                      ₹{price.toFixed(2)}
                    </span>
                    {mrp > price && (
                      <span className="text-lg text-gray-400 line-through font-semibold">
                        ₹{mrp.toFixed(2)}
                      </span>
                    )}
                  </div>
                  {discountPercent > 0 && (
                    <span className="inline-block mt-2 bg-gradient-to-r from-red-500 to-rose-600 text-white text-xs font-extrabold px-2.5 py-0.5 rounded-full shadow-sm">
                      Save {discountPercent}% OFF
                    </span>
                  )}
                </div>

                <div className="text-right">
                  <span className="text-xs text-gray-500 font-semibold block">Unit:</span>
                  <span className="text-base font-bold text-gray-800 uppercase">
                    {product.salesUnit || product.baseUnit || 'PCS'}
                  </span>
                </div>
              </div>
            </div>

            {/* Key Specs Grid */}
            <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 sm:gap-4">
              
              <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                  Barcode / QR Code
                </span>
                <span className="text-sm font-extrabold text-gray-900 break-words flex items-center gap-1">
                  <BarcodeIcon className="w-4 h-4 text-indigo-600 shrink-0" />
                  {product.barcode || product.sku || product.id}
                </span>
              </div>

              <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                  Item / SKU Code
                </span>
                <span className="text-sm font-extrabold text-gray-900 break-words">
                  {product.sku || '-'}
                </span>
              </div>

              <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                  HSN Code
                </span>
                <span className="text-sm font-extrabold text-gray-900">
                  {product.hsnCode || '-'}
                </span>
              </div>

              {product.tax > 0 && (
                <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                  <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                    GST / Tax Rate
                  </span>
                  <span className="text-sm font-extrabold text-gray-900">
                    {product.tax}% GST
                  </span>
                </div>
              )}

              {product.size && (
                <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                  <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                    Size
                  </span>
                  <span className="text-sm font-extrabold text-gray-900">
                    {product.size}
                  </span>
                </div>
              )}

              {product.colour && (
                <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                  <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                    Color
                  </span>
                  <span className="text-sm font-extrabold text-gray-900">
                    {product.colour}
                  </span>
                </div>
              )}

              {product.location && (
                <div className="bg-gray-50 p-3.5 rounded-xl border border-gray-200/80">
                  <span className="text-[11px] font-bold text-gray-500 uppercase block mb-1">
                    Location / Rack
                  </span>
                  <span className="text-sm font-extrabold text-gray-900">
                    {product.location}
                  </span>
                </div>
              )}

            </div>

            {/* Description / Additional Information */}
            {product.description && (
              <div className="bg-gray-50/70 p-4 rounded-xl border border-gray-200">
                <h4 className="text-xs font-bold text-gray-700 uppercase tracking-wider mb-1 flex items-center gap-1.5">
                  <FileText className="w-3.5 h-3.5 text-gray-500" /> Description
                </h4>
                <p className="text-sm text-gray-700 whitespace-pre-line leading-relaxed">
                  {product.description}
                </p>
              </div>
            )}

          </div>

          {/* Footer Security / Verification Note */}
          <div className="bg-gray-50 px-6 py-4 border-t border-gray-200 flex flex-col sm:flex-row items-center justify-between gap-3 text-center sm:text-left">
            <div className="flex items-center gap-2 text-xs text-gray-600 font-medium">
              <Sparkles className="w-4 h-4 text-amber-500 shrink-0" />
              <span>Scanned via Official Swayam Bill Book QR System</span>
            </div>
            <span className="text-[11px] text-gray-500">
              © {new Date().getFullYear()} {product.company?.name || 'Swayam Bill Book'}
            </span>
          </div>

        </div>

      </div>
    </div>
  );
}
