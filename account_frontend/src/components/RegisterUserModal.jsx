import React, { useState, useRef, useEffect } from 'react';
import { X, User, Lock, Building2, Wallet, Loader } from 'lucide-react';
import apiClient from '../api/apiClient';
import { cn } from '../utils';

export function RegisterUserModal({ isOpen, onClose }) {
  const [name, setName] = useState('');
  const [role, setRole] = useState('Staff');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  
  const [selectedFirms, setSelectedFirms] = useState(['swayam billing software']);
  const [store, setStore] = useState('');
  const [book, setBook] = useState('');
  
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  // User Role Master States
  const [availableRoles, setAvailableRoles] = useState(['Admin', 'Staff', 'Manager', 'Accountant', 'Cashier', 'Salesman']);
  const [showRoleDropdown, setShowRoleDropdown] = useState(false);
  const [isRoleMasterOpen, setIsRoleMasterOpen] = useState(false);
  const [roleMasterName, setRoleMasterName] = useState('');
  const [activeRoleTab, setActiveRoleTab] = useState('Master');
  const roleDropdownRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (roleDropdownRef.current && !roleDropdownRef.current.contains(event.target)) {
        setShowRoleDropdown(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const roleTabs = [
    'Master', 'Inventory', 'Branch Management', 'Account',
    'Account Summary', 'Inventory Summary', 'Final Accounts',
    'Gst Summary', 'Tools', 'Setting'
  ];

  const permissionsMatrix = {
    Master: [
      'Customer Master', 'Company Master', 'Employee Master',
      'Income Master', 'Product Master', 'Category Master',
      'Bank Master', 'Expense Master', 'Payment Master',
      'Voucher Master', 'Store Master', 'Unit Master'
    ],
    Inventory: [
      'Stock Details', 'Stock Inventory', 'Stock Adjustment',
      'Purchase Invoice', 'Purchase Return', 'Purchase Order',
      'Order List', 'Expiry Report'
    ],
    'Branch Management': [
      'Branch Master', 'Warehouse Master', 'Godown Transfer', 'Location Master'
    ],
    Account: [
      'Sales Invoice', 'Sales Return', 'Quotation',
      'Payment Ledger', 'Expense Ledger', 'Income Ledger'
    ],
    'Account Summary': [
      'Cash & Bank Summary', 'Day Book Summary', 'Sale Summary',
      'Purchase Summary', 'Customer Outstanding', 'Company Outstanding'
    ],
    'Inventory Summary': [
      'Itemwise Sale Summary', 'Itemwise Purchase Summary',
      'Categorywise Sale Summary', 'Brandwise Sale Summary'
    ],
    'Final Accounts': [
      'Trading Account', 'Profit & Loss Account', 'Balance Sheet', 'Trial Balance'
    ],
    'Gst Summary': [
      'GSTR-1 Summary', 'GSTR-2 Summary', 'GSTR-3B Summary',
      'GST Wise Summary', 'HSN Wise Summary'
    ],
    Tools: [
      'Barcode Generator', 'Print Setting', 'Audit Logs',
      'Bank Statement Import', 'Hard Refresh'
    ],
    Setting: [
      'Company Profile', 'User Management', 'Notification Permission', 'Firm Registration'
    ]
  };

  const columns = [
    { key: 'view', label: 'View' },
    { key: 'create', label: 'Create' },
    { key: 'edit', label: 'Edit' },
    { key: 'delete', label: 'Delete' },
    { key: 'undoMerge', label: 'Undo Merge' },
    { key: 'export', label: 'Export' },
    { key: 'backdate', label: 'Backdate Access' },
    { key: 'showBalance', label: 'Show Balance' }
  ];

  const [permissionsState, setPermissionsState] = useState(() => {
    const initialState = {};
    Object.keys(permissionsMatrix).forEach(tab => {
      initialState[tab] = {};
      permissionsMatrix[tab].forEach(item => {
        initialState[tab][item] = {
          view: true, create: true, edit: true, delete: true,
          undoMerge: true, export: true, backdate: true, showBalance: true
        };
      });
    });
    return initialState;
  });

  const togglePermissionCell = (tab, item, colKey) => {
    setPermissionsState(prev => ({
      ...prev,
      [tab]: {
        ...prev[tab],
        [item]: {
          ...prev[tab]?.[item],
          [colKey]: !prev[tab]?.[item]?.[colKey]
        }
      }
    }));
  };

  const handleCheckAll = (checkValue) => {
    setPermissionsState(prev => {
      const updatedTab = { ...prev[activeRoleTab] };
      (permissionsMatrix[activeRoleTab] || []).forEach(item => {
        updatedTab[item] = {
          view: checkValue, create: checkValue, edit: checkValue, delete: checkValue,
          undoMerge: checkValue, export: checkValue, backdate: checkValue, showBalance: checkValue
        };
      });
      return { ...prev, [activeRoleTab]: updatedTab };
    });
  };

  if (!isOpen) return null;

  const handleSubmit = async () => {
    setError('');
    setSuccess('');
    
    if (!name || !password || !role) {
      setError('Please fill all required basic details');
      return;
    }
    if (password !== confirmPassword) {
      setError('Passwords do not match');
      return;
    }

    setLoading(true);
    try {
      const res = await apiClient.post('/auth/register-sub-user', {
        name,
        password,
        role: role === 'Admin' ? 'COMPANY_ADMIN' : role.toUpperCase().replace(/\s+/g, '_'),
        allowFirms: selectedFirms,
        stores: store ? [store] : [],
        books: book ? [book] : []
      });

      if (res.data.success) {
        setSuccess('User registered successfully!');
        setTimeout(() => {
          handleClose();
        }, 1500);
      }
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to register user');
    } finally {
      setLoading(false);
    }
  };

  const handleClose = () => {
    setName('');
    setRole('Staff');
    setPassword('');
    setConfirmPassword('');
    setSelectedFirms(['swayam billing software']);
    setStore('');
    setBook('');
    setError('');
    setSuccess('');
    setShowRoleDropdown(false);
    setIsRoleMasterOpen(false);
    onClose();
  };

  return (
    <>
      <div 
        className="fixed inset-0 z-[100] flex items-center justify-center p-4"
        style={{ backgroundColor: 'rgba(0, 0, 0, 0.4)' }}
      >
        <div className="bg-[#f0f4f8] w-full max-w-5xl rounded-md shadow-2xl overflow-hidden animate-in fade-in zoom-in duration-200 flex flex-col max-h-[95vh]">
          {/* Header */}
          <div className="bg-[#4F46E5] px-5 py-3 flex justify-between items-start text-white">
            <div>
              <h2 className="text-[18px] font-bold">Register New User</h2>
              <p className="text-[13px] text-teal-100 mt-0.5">Create account and set firm-wise access</p>
            </div>
            <button 
              onClick={handleClose}
              className="text-red-500 hover:text-red-600 transition-colors bg-transparent border-none outline-none mt-1"
            >
              <X className="w-6 h-6 stroke-[4px]" />
            </button>
          </div>

          {/* Content - Scrollable */}
          <div className="p-4 overflow-y-auto flex-1 space-y-4">
            
            {error && (
              <div className="bg-red-50 text-red-600 text-sm px-3 py-2 rounded border border-red-200">
                {error}
              </div>
            )}
            {success && (
              <div className="bg-green-50 text-green-600 text-sm px-3 py-2 rounded border border-green-200">
                {success}
              </div>
            )}

            {/* Basic Details */}
            <div className="bg-white rounded shadow-sm border border-gray-200 p-4">
              <h3 className="text-[12px] font-bold text-gray-500 uppercase tracking-wider mb-4">BASIC DETAILS</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-x-6 gap-y-4">
                {/* Full Name */}
                <div>
                  <label className="block text-[13px] font-bold text-gray-700 mb-1">Full Name</label>
                  <div className="relative">
                    <input 
                      type="text" 
                      value={name}
                      onChange={e => setName(e.target.value)}
                      placeholder="Full name" 
                      className="w-full border border-gray-300 rounded px-3 py-2 pr-10 text-[14px] focus:outline-none focus:border-[#4F46E5]" 
                    />
                    <div className="absolute right-0 top-0 bottom-0 w-10 flex items-center justify-center bg-gray-100 border-l border-gray-300 rounded-r">
                      <User className="w-4 h-4 text-gray-500" />
                    </div>
                  </div>
                </div>
                
                {/* User Role */}
                <div>
                  <label className="block text-[13px] font-bold text-gray-700 mb-1">User Role</label>
                  <div className="relative" ref={roleDropdownRef}>
                    <input 
                      type="text" 
                      value={role}
                      onChange={e => {
                        setRole(e.target.value);
                        setShowRoleDropdown(true);
                      }}
                      onFocus={() => setShowRoleDropdown(true)}
                      onKeyDown={(e) => {
                        if (e.key === 'Enter') {
                          e.preventDefault();
                          const trimmedRole = role.trim();
                          if (!trimmedRole) return;

                          const existingMatch = availableRoles.find(r => r.toLowerCase() === trimmedRole.toLowerCase());
                          if (existingMatch) {
                            setRole(existingMatch);
                            setShowRoleDropdown(false);
                          } else {
                            setShowRoleDropdown(false);
                            setRoleMasterName(trimmedRole);
                            setIsRoleMasterOpen(true);
                          }
                        }
                      }}
                      placeholder="Select Role" 
                      className="w-full border border-gray-300 rounded px-3 py-2 text-[14px] text-gray-700 focus:outline-none focus:border-[#4F46E5] bg-white cursor-pointer" 
                    />
                    <div className="absolute right-3 top-0 bottom-0 flex items-center pointer-events-none text-gray-400 text-[10px]">
                      ▼
                    </div>

                    {showRoleDropdown && (
                      <div className="absolute left-0 right-0 top-full mt-1 bg-white border border-gray-300 rounded shadow-xl z-[150] max-h-48 overflow-y-auto">
                        {availableRoles
                          .filter(r => r.toLowerCase().includes((role || '').toLowerCase()))
                          .map((r) => (
                            <div
                              key={r}
                              onClick={() => {
                                setRole(r);
                                setShowRoleDropdown(false);
                              }}
                              className="px-3 py-2 text-[13px] text-gray-700 hover:bg-blue-50 cursor-pointer flex justify-between items-center border-b border-gray-100"
                            >
                              <span>{r}</span>
                              {role === r && <span className="text-blue-600 font-bold">✓</span>}
                            </div>
                          ))}

                        {role.trim() !== '' && !availableRoles.some(r => r.toLowerCase() === role.trim().toLowerCase()) && (
                          <div
                            onClick={() => {
                              setShowRoleDropdown(false);
                              setRoleMasterName(role.trim());
                              setIsRoleMasterOpen(true);
                            }}
                            className="px-3 py-2 text-[13px] font-bold text-[#007bff] bg-[#d0ebf7] hover:bg-[#b8e2f2] cursor-pointer flex items-center gap-1 border-t border-gray-200"
                          >
                            <span>+Add "{role.trim()}"</span>
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                </div>

                {/* Password */}
                <div>
                  <label className="block text-[13px] font-bold text-gray-700 mb-1">Password</label>
                  <div className="relative">
                    <input 
                      type="password" 
                      value={password}
                      onChange={e => setPassword(e.target.value)}
                      placeholder="Password" 
                      className="w-full border border-gray-300 rounded px-3 py-2 pr-10 text-[14px] focus:outline-none focus:border-[#4F46E5]" 
                    />
                    <div className="absolute right-0 top-0 bottom-0 w-10 flex items-center justify-center bg-gray-100 border-l border-gray-300 rounded-r">
                      <Lock className="w-4 h-4 text-gray-500" />
                    </div>
                  </div>
                </div>

                {/* Confirm Password */}
                <div>
                  <label className="block text-[13px] font-bold text-gray-700 mb-1">Confirm Password</label>
                  <div className="relative">
                    <input 
                      type="password" 
                      value={confirmPassword}
                      onChange={e => setConfirmPassword(e.target.value)}
                      placeholder="Retype password" 
                      className="w-full border border-gray-300 rounded px-3 py-2 pr-10 text-[14px] focus:outline-none focus:border-[#4F46E5]" 
                    />
                    <div className="absolute right-0 top-0 bottom-0 w-10 flex items-center justify-center bg-gray-100 border-l border-gray-300 rounded-r">
                      <Lock className="w-4 h-4 text-gray-500" />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Firm Access */}
            <div className="bg-white rounded shadow-sm border border-gray-200 p-4">
              <h3 className="text-[12px] font-bold text-gray-500 uppercase tracking-wider mb-4">FIRM ACCESS</h3>
              <div>
                <label className="block text-[13px] font-bold text-gray-700 mb-1">Allow Firms</label>
                <div className="w-full border border-gray-300 rounded p-1.5 flex flex-wrap gap-1 items-center bg-white min-h-[38px]">
                  {selectedFirms.map(firm => (
                    <div key={firm} className="bg-[#e8f0fe] text-[#1a73e8] text-[13px] flex items-center gap-1.5 px-2 py-0.5 rounded border border-[#d2e3fc]">
                      <span 
                        className="cursor-pointer hover:text-red-500"
                        onClick={() => setSelectedFirms(selectedFirms.filter(f => f !== firm))}
                      >
                        ×
                      </span>
                      {firm}
                    </div>
                  ))}
                  <div className="flex-1 min-w-[50px] flex justify-end">
                    <span className="text-gray-400 cursor-pointer px-2 text-[10px]">▼</span>
                  </div>
                </div>
              </div>
            </div>

            {/* Stores & Books by Firm */}
            <div className="bg-white rounded shadow-sm border border-gray-200 p-4">
              <div className="flex justify-between items-center mb-4">
                <h3 className="text-[12px] font-bold text-gray-500 uppercase tracking-wider">STORES & BOOKS BY FIRM</h3>
                <span className="text-[12px] text-gray-400">Empty selection = all allowed for that firm</span>
              </div>
              
              <div className="mb-4">
                <button className="bg-teal-50 border border-[#4F46E5] text-[#111] px-3 py-1.5 rounded-full text-[13px] font-medium flex items-center gap-2">
                  swayam billing software
                  <span className="text-gray-500 text-[11px] font-bold">S:{store ? '1' : 'All'}</span>
                  <span className="text-gray-500 text-[11px] font-bold">B:{book ? '1' : 'All'}</span>
                </button>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 bg-gray-50 p-4 rounded border border-gray-100">
                {/* Stores */}
                <div>
                  <div className="flex justify-between items-center mb-1">
                    <label className="flex items-center gap-1.5 text-[13px] font-bold text-[#1a237e]">
                      <Building2 className="w-4 h-4" />
                      Stores
                    </label>
                    <span className="text-[11px] text-gray-400 font-medium">{store ? 'Selected' : 'All stores'}</span>
                  </div>
                  <div className="relative">
                    <input 
                      type="text" 
                      value={store}
                      onChange={e => setStore(e.target.value)}
                      list="storesList"
                      placeholder="Select stores (or leave empty for all)"
                      className="w-full border border-gray-300 rounded px-3 py-2 text-[13px] text-gray-600 focus:outline-none focus:border-[#4F46E5] bg-white" 
                    />
                    <datalist id="storesList">
                      <option value="Main Store" />
                      <option value="Branch 1" />
                    </datalist>
                    <div className="absolute right-3 top-0 bottom-0 flex items-center pointer-events-none text-gray-400">
                      ▼
                    </div>
                  </div>
                </div>

                {/* Cash & Bank */}
                <div>
                  <div className="flex justify-between items-center mb-1">
                    <label className="flex items-center gap-1.5 text-[13px] font-bold text-[#1a237e]">
                      <Wallet className="w-4 h-4" />
                      Cash & Bank
                    </label>
                    <span className="text-[11px] text-gray-400 font-medium">{book ? 'Selected' : 'All books'}</span>
                  </div>
                  <div className="relative">
                    <input 
                      type="text"
                      value={book}
                      onChange={e => setBook(e.target.value)}
                      list="booksList"
                      placeholder="Select books (or leave empty for all)"
                      className="w-full border border-gray-300 rounded px-3 py-2 text-[13px] text-gray-600 focus:outline-none focus:border-[#4F46E5] bg-white" 
                    />
                    <datalist id="booksList">
                      <option value="Cash Book" />
                      <option value="Bank Book" />
                    </datalist>
                    <div className="absolute right-3 top-0 bottom-0 flex items-center pointer-events-none text-gray-400">
                      ▼
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>

          {/* Footer */}
          <div className="border-t border-gray-200 bg-white p-3 flex justify-end gap-2 shrink-0">
            <button 
              onClick={handleClose}
              disabled={loading}
              className="px-5 py-2 border border-gray-300 text-gray-700 rounded bg-white hover:bg-gray-50 text-[14px] font-medium transition-colors disabled:opacity-50"
            >
              Cancel
            </button>
            <button 
              onClick={handleSubmit}
              disabled={loading}
              className="px-5 py-2 bg-[#007bff] hover:bg-[#0069d9] text-white font-medium rounded text-[14px] transition-colors disabled:opacity-70 flex items-center gap-2"
            >
              {loading && <Loader className="w-4 h-4 animate-spin" />}
              Register User
            </button>
          </div>
        </div>
      </div>

      {/* User Role Master Modal */}
      {isRoleMasterOpen && (
        <div className="fixed inset-0 z-[200] flex items-center justify-center p-2 sm:p-4 bg-black/60 backdrop-blur-xs animate-in fade-in duration-200">
          <div className="bg-white w-full max-w-6xl rounded-md shadow-2xl overflow-hidden flex flex-col max-h-[95vh] sm:max-h-[90vh] border border-gray-200">
            {/* Header Banner - Website Theme Indigo (#4F46E5) */}
            <div className="bg-[#4F46E5] px-4 sm:px-5 py-3 flex justify-between items-center text-white shadow-sm shrink-0">
              <h2 className="text-[16px] sm:text-[18px] font-bold tracking-wide">User Role Master</h2>
              <button
                onClick={() => setIsRoleMasterOpen(false)}
                className="bg-[#dc3545] hover:bg-[#c82333] text-white p-1 sm:p-1.5 rounded transition-colors flex items-center justify-center focus:outline-none"
              >
                <X className="w-4 h-4 sm:w-5 sm:h-5 stroke-[3px]" />
              </button>
            </div>

            {/* Body Content */}
            <div className="p-3 sm:p-5 overflow-y-auto flex-1 space-y-4">
              {/* Enter User Role Input */}
              <div className="bg-gray-50 p-3 rounded-md border border-gray-200">
                <label className="block text-[13px] font-bold text-gray-800 mb-1">Enter User Role</label>
                <input
                  type="text"
                  value={roleMasterName}
                  onChange={(e) => setRoleMasterName(e.target.value)}
                  className="w-full border border-[#c7d2fe] rounded px-3 py-2 text-[14px] bg-[#eef2ff] text-gray-900 font-bold focus:outline-none focus:border-[#4F46E5] focus:ring-1 focus:ring-[#4F46E5]"
                />
              </div>

              {/* User's Permissions Header */}
              <div className="bg-white rounded-md border border-gray-200 p-3 sm:p-4 shadow-xs">
                <h3 className="text-[15px] sm:text-[16px] font-bold text-gray-800 mb-3">User's Permissions</h3>

                {/* Category Tabs */}
                <div className="flex flex-wrap gap-1 sm:gap-1.5 border-b border-gray-200 pb-2.5 overflow-x-auto">
                  {roleTabs.map(tab => (
                    <button
                      key={tab}
                      onClick={() => setActiveRoleTab(tab)}
                      className={cn(
                        "px-3 py-1.5 rounded text-[12px] sm:text-[13px] font-medium transition-all duration-150 whitespace-nowrap",
                        activeRoleTab === tab
                          ? "bg-[#4F46E5] text-white font-bold shadow-sm"
                          : "bg-gray-100 text-gray-700 hover:bg-gray-200"
                      )}
                    >
                      {tab}
                    </button>
                  ))}
                </div>

                {/* Radio Options: Check All / Uncheck All */}
                <div className="flex items-center gap-6 py-3">
                  <label className="flex items-center gap-2 cursor-pointer text-[13px] font-bold text-gray-800 select-none">
                    <input
                      type="radio"
                      name="checkAllRadio"
                      onChange={() => handleCheckAll(true)}
                      className="w-4 h-4 accent-[#4F46E5] cursor-pointer"
                    />
                    <span>Check All</span>
                  </label>

                  <label className="flex items-center gap-2 cursor-pointer text-[13px] font-bold text-gray-800 select-none">
                    <input
                      type="radio"
                      name="checkAllRadio"
                      onChange={() => handleCheckAll(false)}
                      className="w-4 h-4 accent-[#4F46E5] cursor-pointer"
                    />
                    <span>Uncheck All</span>
                  </label>
                </div>

                {/* Matrix Table */}
                <div className="overflow-x-auto border border-gray-300 rounded-md">
                  <table className="w-full text-left border-collapse min-w-[700px]">
                    <thead>
                      <tr className="bg-[#343a40] text-white text-[12px]">
                        <th className="py-2.5 px-3 border-r border-gray-600 font-bold w-[220px]">Permissions</th>
                        {columns.map(col => (
                          <th key={col.key} className="py-2.5 px-2 border-r border-gray-600 font-bold text-center whitespace-nowrap">
                            {col.label}
                          </th>
                        ))}
                      </tr>
                    </thead>
                    <tbody>
                      {(permissionsMatrix[activeRoleTab] || []).map(item => (
                        <tr key={item} className="border-b border-gray-200 hover:bg-indigo-50/40 bg-white transition-colors">
                          <td className="py-2.5 px-3 text-[13px] font-medium text-gray-800 border-r border-gray-200 whitespace-nowrap">
                            {item}
                          </td>
                          {columns.map(col => {
                            const isChecked = permissionsState[activeRoleTab]?.[item]?.[col.key] !== false;
                            return (
                              <td key={col.key} className="py-2.5 px-2 text-center border-r border-gray-200">
                                <div className="flex justify-center items-center">
                                  <div
                                    onClick={() => togglePermissionCell(activeRoleTab, item, col.key)}
                                    className={cn(
                                      "w-7 h-4 rounded-full relative cursor-pointer transition-colors shadow-inner",
                                      isChecked ? "bg-[#dc3545]" : "bg-gray-300"
                                    )}
                                  >
                                    <div
                                      className={cn(
                                        "w-3 h-3 bg-white rounded-full absolute top-[2px] transition-transform shadow-sm",
                                        isChecked ? "translate-x-[14px]" : "translate-x-[2px]"
                                      )}
                                    />
                                  </div>
                                </div>
                              </td>
                            );
                          })}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            {/* Footer Save Button */}
            <div className="border-t border-gray-200 bg-gray-50 p-3 sm:px-5 flex justify-end shrink-0">
              <button
                onClick={() => {
                  const newRoleName = roleMasterName.trim();
                  if (newRoleName) {
                    if (!availableRoles.includes(newRoleName)) {
                      setAvailableRoles(prev => [...prev, newRoleName]);
                    }
                    setRole(newRoleName);
                  }
                  setIsRoleMasterOpen(false);
                }}
                className="bg-[#4F46E5] hover:bg-[#4338ca] text-white px-6 py-2 rounded-md text-[14px] font-bold transition-colors shadow-sm focus:outline-none"
              >
                Save
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
