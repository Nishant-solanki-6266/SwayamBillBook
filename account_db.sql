-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2026 at 01:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `account_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Present',
  `employeeId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE `auditlog` (
  `id` int(11) NOT NULL,
  `actionType` varchar(191) NOT NULL,
  `details` text DEFAULT NULL,
  `referenceId` varchar(191) DEFAULT NULL,
  `userName` varchar(191) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `billNumber` varchar(191) DEFAULT NULL,
  `ipAddress` varchar(191) DEFAULT NULL,
  `moduleName` varchar(191) DEFAULT NULL,
  `previousData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previousData`)),
  `updatedData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`updatedData`)),
  `userRole` varchar(191) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auditlog`
--

INSERT INTO `auditlog` (`id`, `actionType`, `details`, `referenceId`, `userName`, `companyId`, `createdAt`, `billNumber`, `ipAddress`, `moduleName`, `previousData`, `updatedData`, `userRole`) VALUES
(1, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260703-1783068881324\",\"totalAmount\":1895.4441}', NULL, 'POS_USER', 1, '2026-07-03 08:54:41.350', NULL, NULL, NULL, NULL, NULL, 'User'),
(2, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260704-1783158158366\",\"totalAmount\":1941.4197}', NULL, 'POS_USER', 1, '2026-07-04 09:42:38.388', NULL, NULL, NULL, NULL, NULL, 'User'),
(3, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783316339253\",\"totalAmount\":2421.6687}', NULL, 'POS_USER', 1, '2026-07-06 05:38:59.273', NULL, NULL, NULL, NULL, NULL, 'User'),
(4, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783316524788\",\"totalAmount\":2650.3785000000003}', NULL, 'POS_USER', 1, '2026-07-06 05:42:04.814', NULL, NULL, NULL, NULL, NULL, 'User'),
(5, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783316960858\",\"totalAmount\":1256.85}', NULL, 'POS_USER', 1, '2026-07-06 05:49:20.865', NULL, NULL, NULL, NULL, NULL, 'User'),
(6, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317193566\",\"totalAmount\":1029.924}', NULL, 'POS_USER', 1, '2026-07-06 05:53:13.572', NULL, NULL, NULL, NULL, NULL, 'User'),
(7, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317221831\",\"totalAmount\":755.9369999999999}', NULL, 'POS_USER', 1, '2026-07-06 05:53:41.856', NULL, NULL, NULL, NULL, NULL, 'User'),
(8, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317292947\",\"totalAmount\":718.137}', NULL, 'POS_USER', 1, '2026-07-06 05:54:52.954', NULL, NULL, NULL, NULL, NULL, 'User'),
(9, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317340901\",\"totalAmount\":1121.648}', NULL, 'POS_USER', 1, '2026-07-06 05:55:40.918', NULL, NULL, NULL, NULL, NULL, 'User'),
(10, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317370446\",\"totalAmount\":687.368}', NULL, 'POS_USER', 1, '2026-07-06 05:56:10.451', NULL, NULL, NULL, NULL, NULL, 'User'),
(11, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783317990022\",\"totalAmount\":781.9713999999999}', NULL, 'POS_USER', 1, '2026-07-06 06:06:30.039', NULL, NULL, NULL, NULL, NULL, 'User'),
(12, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783320788591\",\"totalAmount\":1207.9479999999999}', NULL, 'POS_USER', 1, '2026-07-06 06:53:08.598', NULL, NULL, NULL, NULL, NULL, 'User'),
(13, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783320846500\",\"totalAmount\":775.67}', NULL, 'POS_USER', 1, '2026-07-06 06:54:06.508', NULL, NULL, NULL, NULL, NULL, 'User'),
(14, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783320900579\",\"totalAmount\":656.208}', NULL, 'POS_USER', 1, '2026-07-06 06:55:00.595', NULL, NULL, NULL, NULL, NULL, 'User'),
(15, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260706-1783320961275\",\"totalAmount\":765.4780000000001}', NULL, 'POS_USER', 1, '2026-07-06 06:56:01.281', NULL, NULL, NULL, NULL, NULL, 'User'),
(16, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260707-1783405216875\",\"totalAmount\":365.69}', NULL, 'POS_USER', 1, '2026-07-07 06:20:16.886', NULL, NULL, NULL, NULL, NULL, 'User'),
(17, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783489395786\",\"totalAmount\":1712.158}', NULL, 'POS_USER', 1, '2026-07-08 05:43:16.045', NULL, NULL, NULL, NULL, NULL, 'User'),
(18, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490163492\",\"totalAmount\":1712.158}', NULL, 'POS_USER', 1, '2026-07-08 05:56:03.513', NULL, NULL, NULL, NULL, NULL, 'User'),
(19, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490228776\",\"totalAmount\":816.83}', NULL, 'POS_USER', 1, '2026-07-08 05:57:08.781', NULL, NULL, NULL, NULL, NULL, 'User'),
(20, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490253174\",\"totalAmount\":372.4294}', NULL, 'POS_USER', 1, '2026-07-08 05:57:33.179', NULL, NULL, NULL, NULL, NULL, 'User'),
(21, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490373172\",\"totalAmount\":343.588}', NULL, 'POS_USER', 1, '2026-07-08 05:59:33.179', NULL, NULL, NULL, NULL, NULL, 'User'),
(22, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490405753\",\"totalAmount\":357.11199999999997}', NULL, 'POS_USER', 1, '2026-07-08 06:00:05.773', NULL, NULL, NULL, NULL, NULL, 'User'),
(23, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490536061\",\"totalAmount\":816.83}', NULL, 'POS_USER', 1, '2026-07-08 06:02:16.077', NULL, NULL, NULL, NULL, NULL, 'User'),
(24, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783490626635\",\"totalAmount\":816.83}', NULL, 'POS_USER', 1, '2026-07-08 06:03:46.640', NULL, NULL, NULL, NULL, NULL, 'User'),
(25, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783491558925\",\"totalAmount\":669.732}', NULL, 'POS_USER', 1, '2026-07-08 06:19:18.932', NULL, NULL, NULL, NULL, NULL, 'User'),
(26, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783491596779\",\"totalAmount\":669.732}', NULL, 'POS_USER', 1, '2026-07-08 06:19:56.785', NULL, NULL, NULL, NULL, NULL, 'User'),
(27, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783491618075\",\"totalAmount\":669.732}', NULL, 'POS_USER', 1, '2026-07-08 06:20:18.079', NULL, NULL, NULL, NULL, NULL, 'User'),
(28, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783500688522\",\"totalAmount\":836.9}', NULL, 'POS_USER', 1, '2026-07-08 08:51:28.532', NULL, NULL, NULL, NULL, NULL, 'User'),
(29, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783500703403\",\"totalAmount\":363.2}', NULL, 'POS_USER', 1, '2026-07-08 08:51:43.410', NULL, NULL, NULL, NULL, NULL, 'User'),
(30, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260708-1783500712246\",\"totalAmount\":361}', NULL, 'POS_USER', 1, '2026-07-08 08:51:52.250', NULL, NULL, NULL, NULL, NULL, 'User'),
(31, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783576739831\",\"totalAmount\":2438.1019180000003}', NULL, 'POS_USER', 1, '2026-07-09 05:58:59.881', NULL, NULL, NULL, NULL, NULL, 'User'),
(32, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783576758643\",\"totalAmount\":259.89599999999996}', NULL, 'POS_USER', 1, '2026-07-09 05:59:18.649', NULL, NULL, NULL, NULL, NULL, 'User'),
(33, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783577054509\",\"totalAmount\":509.028}', NULL, 'POS_USER', 1, '2026-07-09 06:04:14.515', NULL, NULL, NULL, NULL, NULL, 'User'),
(34, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783588478556\",\"totalAmount\":2999.802}', NULL, 'POS_USER', 1, '2026-07-09 09:14:38.568', NULL, NULL, NULL, NULL, NULL, 'User'),
(35, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783589021936\",\"totalAmount\":5704.451999999999}', NULL, 'POS_USER', 1, '2026-07-09 09:23:41.944', NULL, NULL, NULL, NULL, NULL, 'User'),
(36, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260709-1783595205237\",\"totalAmount\":9615.606}', NULL, 'POS_USER', 1, '2026-07-09 11:06:45.259', NULL, NULL, NULL, NULL, NULL, 'User'),
(37, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-11 06:29:20.393', 'INV-1783751360367', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1783751360367\",\"customerId\":\"test4\",\"date\":\"2026-07-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":40,\"totalDiscount\":2230,\"freightCharges\":24,\"totalAmount\":34.56,\"totalGstAmount\":4.8,\"totalCgst\":2.4,\"totalSgst\":2.4,\"totalIgst\":0,\"tcsAmount\":5.76,\"items\":[{\"productId\":26,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":340,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":40,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":40,\"gstRate\":12,\"gstAmount\":4.8,\"cgst\":2.4,\"sgst\":2.4,\"igst\":0}]}', 'COMPANY_ADMIN'),
(38, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260711-1783756876472\",\"totalAmount\":1085.6664}', NULL, 'POS_USER', 1, '2026-07-11 08:01:16.534', NULL, NULL, NULL, NULL, NULL, 'User'),
(39, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-13 07:36:45.921', 'INV-1783928205817', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1783928205817\",\"customerId\":6,\"date\":\"2026-07-13\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":726,\"totalAmount\":1175.9,\"totalGstAmount\":3.396039603960389,\"totalCgst\":1.698019801980195,\"totalSgst\":1.698019801980195,\"totalIgst\":0,\"tcsAmount\":106.9,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":1,\"gstAmount\":3.396039603960389,\"cgst\":1.698019801980195,\"sgst\":1.698019801980195,\"igst\":0}]}', 'COMPANY_ADMIN'),
(40, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-13 07:54:17.664', 'INV-1783929257637', '127.0.0.1', 'Customer Challan', 'null', '{\"invoiceNo\":\"INV-1783929257637\",\"customerId\":8,\"date\":\"2026-07-13\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":470,\"totalDiscount\":2320,\"freightCharges\":476,\"totalAmount\":476,\"totalGstAmount\":22.38095238095241,\"totalCgst\":11.1904761904762,\"totalSgst\":11.1904761904762,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":4,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":360,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":470,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":470,\"gstRate\":5,\"gstAmount\":22.38095238095241,\"cgst\":11.1904761904762,\"sgst\":11.1904761904762,\"igst\":0}]}', 'COMPANY_ADMIN'),
(41, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-13 07:55:06.826', 'INV-1783929306804', '127.0.0.1', 'Customer Challan', 'null', '{\"invoiceNo\":\"INV-1783929306804\",\"customerId\":8,\"date\":\"2026-07-13\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":340,\"totalDiscount\":340,\"freightCharges\":39,\"totalAmount\":39,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":3,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":340,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":340,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":340,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(42, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-13 10:37:19.065', 'INV-1783939038350', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1783939038350\",\"customerId\":6,\"date\":\"2026-07-13\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":340,\"totalDiscount\":40.8,\"freightCharges\":98.7,\"totalAmount\":477.48,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":79.58,\"items\":[{\"productId\":3,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":340,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":340,\"discount1\":40.8,\"discount2\":0,\"imei\":\"\",\"amount\":299.2,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(43, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-13 11:22:16.148', 'INV-1783941736116', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1783941736116\",\"customerId\":2,\"date\":\"2026-07-13\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":0,\"totalDiscount\":0,\"freightCharges\":24,\"totalAmount\":28.8,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":4.8,\"items\":[{\"productId\":30,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":213,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":0,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":0,\"gstRate\":5,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(44, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260713-1783948433812\",\"totalAmount\":308}', NULL, 'POS_USER', 1, '2026-07-13 13:13:53.820', NULL, NULL, NULL, NULL, NULL, 'User'),
(45, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260713-1783948958971\",\"totalAmount\":308}', NULL, 'POS_USER', 1, '2026-07-13 13:22:38.977', NULL, NULL, NULL, NULL, NULL, 'User'),
(46, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260713-1783948977981\",\"totalAmount\":604.0584}', NULL, 'POS_USER', 1, '2026-07-13 13:22:57.987', NULL, NULL, NULL, NULL, NULL, 'User'),
(47, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 06:54:24.269', 'INV-1784012064110', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784012064110\",\"customerId\":2,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":340,\"totalDiscount\":17,\"freightCharges\":0,\"totalAmount\":323,\"totalGstAmount\":15.38095238095241,\"totalCgst\":7.690476190476204,\"totalSgst\":7.690476190476204,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":3,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":340,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":340,\"discount1\":17,\"discount2\":0,\"imei\":\"\",\"amount\":323,\"gstRate\":5,\"gstAmount\":15.38095238095241,\"cgst\":7.690476190476204,\"sgst\":7.690476190476204,\"igst\":0}]}', 'COMPANY_ADMIN'),
(48, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 07:51:28.285', 'INV-1784015488220', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1784015488220\",\"customerId\":8,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":35,\"totalDiscount\":9.744,\"freightCharges\":483,\"totalAmount\":4711.556,\"totalGstAmount\":0.4952156862745092,\"totalCgst\":0.2476078431372546,\"totalSgst\":0.2476078431372546,\"totalIgst\":0,\"tcsAmount\":4203.3,\"items\":[{\"productId\":31,\"productCode\":\"\",\"unit\":\"bag \",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":233,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":35,\"discount1\":4.2,\"discount2\":5.544,\"imei\":\"\",\"amount\":25.256,\"gstRate\":2,\"gstAmount\":0.4952156862745092,\"cgst\":0.2476078431372546,\"sgst\":0.2476078431372546,\"igst\":0}]}', 'COMPANY_ADMIN'),
(49, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260714-1784020760266\",\"totalAmount\":719.6}', NULL, 'POS_USER', 1, '2026-07-14 09:19:20.282', NULL, NULL, NULL, NULL, NULL, 'User'),
(50, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 10:34:34.485', 'INV-1784025274416', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784025274416\",\"customerId\":4,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(51, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 10:43:22.949', 'INV-1784025802918', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784025802918\",\"customerId\":2,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(52, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 10:50:57.582', 'INV-1784026257517', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784026257517\",\"customerId\":5,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":320,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":320,\"totalGstAmount\":9.320388349514587,\"totalCgst\":4.660194174757294,\"totalSgst\":4.660194174757294,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":2,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":230,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":320,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":320,\"gstRate\":3,\"gstAmount\":9.320388349514587,\"cgst\":4.660194174757294,\"sgst\":4.660194174757294,\"igst\":0}]}', 'COMPANY_ADMIN'),
(53, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 10:52:36.857', 'INV-1784026356829', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784026356829\",\"customerId\":4,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(54, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-14 11:00:27.782', 'INV-1784026827699', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784026827699\",\"customerId\":12,\"date\":\"2026-07-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(55, 'MARK_INVOICE_PAID', '{\"invoiceNo\":\"PUR-1784013849288\"}', NULL, '2', 1, '2026-07-15 06:11:33.872', NULL, NULL, NULL, NULL, NULL, 'User'),
(56, 'MARK_INVOICE_PAID', '{\"invoiceNo\":\"PUR-1783941886275\"}', NULL, '2', 1, '2026-07-15 06:11:40.279', NULL, NULL, NULL, NULL, NULL, 'User'),
(57, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260715-1784120712703\",\"totalAmount\":1146.123}', NULL, 'POS_USER', 1, '2026-07-15 13:05:12.731', NULL, NULL, NULL, NULL, NULL, 'User'),
(58, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260715-1784121592842\",\"totalAmount\":829.7783999999999}', NULL, 'POS_USER', 1, '2026-07-15 13:19:52.851', NULL, NULL, NULL, NULL, NULL, 'User'),
(59, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260715-1784122215862\",\"totalAmount\":1359.468}', NULL, 'POS_USER', 1, '2026-07-15 13:30:15.896', NULL, NULL, NULL, NULL, NULL, 'User'),
(60, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260715-1784123253102\",\"totalAmount\":2406.4524}', NULL, 'POS_USER', 1, '2026-07-15 13:47:33.136', NULL, NULL, NULL, NULL, NULL, 'User'),
(61, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260715-1784123516860\",\"totalAmount\":936.7974}', NULL, 'POS_USER', 1, '2026-07-15 13:51:56.867', NULL, NULL, NULL, NULL, NULL, 'User'),
(62, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260716-1784208301412\",\"totalAmount\":805.6224}', NULL, 'POS_USER', 1, '2026-07-16 13:25:01.424', NULL, NULL, NULL, NULL, NULL, 'User'),
(63, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260717-1784270585684\",\"totalAmount\":1452.4289999999999}', NULL, 'POS_USER', 1, '2026-07-17 06:43:05.776', NULL, NULL, NULL, NULL, NULL, 'User'),
(64, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260718-1784369273166\",\"totalAmount\":1947.86}', NULL, 'POS_USER', 1, '2026-07-18 10:07:53.218', NULL, NULL, NULL, NULL, NULL, 'User'),
(65, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260718-1784370095793\",\"totalAmount\":2092.02}', NULL, 'POS_USER', 1, '2026-07-18 10:21:35.854', NULL, NULL, NULL, NULL, NULL, 'User'),
(66, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260720-1784547086558\",\"totalAmount\":679.6}', NULL, 'POS_USER', 1, '2026-07-20 11:31:26.597', NULL, NULL, NULL, NULL, NULL, 'User'),
(67, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260720-1784547336506\",\"totalAmount\":693}', NULL, 'POS_USER', 1, '2026-07-20 11:35:36.528', NULL, NULL, NULL, NULL, NULL, 'User'),
(68, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260720-1784547556055\",\"totalAmount\":672.804}', NULL, 'POS_USER', 1, '2026-07-20 11:39:16.084', NULL, NULL, NULL, NULL, NULL, 'User'),
(69, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260720-1784547969258\",\"totalAmount\":379.26}', NULL, 'POS_USER', 1, '2026-07-20 11:46:09.281', NULL, NULL, NULL, NULL, NULL, 'User'),
(70, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-21 05:52:21.443', 'INV-1784613141334', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784613141334\",\"customerId\":13,\"date\":\"2026-07-21\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"PCS\",\"batchNo\":\"wait\",\"mfgDate\":\"2026-07-21\",\"expDate\":\"2026-07-25\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":-29,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(71, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-21 06:28:45.924', 'INV-1784615325866', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784615325866\",\"customerId\":\"\",\"date\":\"2026-07-21\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":343,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":-30,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(72, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-21 06:29:18.603', 'INV-1784615358561', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784615358561\",\"customerId\":\"\",\"date\":\"2026-07-21\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":343,\"totalDiscount\":540,\"freightCharges\":0,\"totalAmount\":0,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":1,\"productCode\":\"\",\"unit\":\"PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":-31,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":344,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":343,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}]}', 'COMPANY_ADMIN'),
(73, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784702176510\",\"totalAmount\":1248.55}', NULL, 'POS_USER', 1, '2026-07-22 06:36:16.553', NULL, NULL, NULL, NULL, NULL, 'User'),
(74, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784704474287\",\"totalAmount\":451.5}', NULL, 'POS_USER', 1, '2026-07-22 07:14:34.295', NULL, NULL, NULL, NULL, NULL, 'User'),
(75, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784704545334\",\"totalAmount\":1126.65}', NULL, 'POS_USER', 1, '2026-07-22 07:15:45.359', NULL, NULL, NULL, NULL, NULL, 'User'),
(76, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784704584564\",\"totalAmount\":329.6}', NULL, 'POS_USER', 1, '2026-07-22 07:16:24.581', NULL, NULL, NULL, NULL, NULL, 'User'),
(77, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784704918736\",\"totalAmount\":318.6}', NULL, 'POS_USER', 1, '2026-07-22 07:21:58.742', NULL, NULL, NULL, NULL, NULL, 'User'),
(78, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784704981590\",\"totalAmount\":34}', NULL, 'POS_USER', 1, '2026-07-22 07:23:01.607', NULL, NULL, NULL, NULL, NULL, 'User'),
(79, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784705007692\",\"totalAmount\":663.3}', NULL, 'POS_USER', 1, '2026-07-22 07:23:27.708', NULL, NULL, NULL, NULL, NULL, 'User'),
(80, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784705146813\",\"totalAmount\":316.8}', NULL, 'POS_USER', 1, '2026-07-22 07:25:46.818', NULL, NULL, NULL, NULL, NULL, 'User'),
(81, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784711126292\",\"totalAmount\":33405.0354}', NULL, 'POS_USER', 1, '2026-07-22 09:05:26.341', NULL, NULL, NULL, NULL, NULL, 'User'),
(82, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260722-1784711144812\",\"totalAmount\":57.91499999999999}', NULL, 'POS_USER', 1, '2026-07-22 09:05:44.829', NULL, NULL, NULL, NULL, NULL, 'User'),
(83, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-23 06:30:19.884', 'INV-1784788219733', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784788219733\",\"customerId\":\"\",\"date\":\"2026-07-23\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":250,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":250,\"totalGstAmount\":4.901960784313729,\"totalCgst\":2.450980392156865,\"totalSgst\":2.450980392156865,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":46,\"productCode\":\"\",\"unit\":\"Pack\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":2,\"secOpeningQty\":4,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":250,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"amount\":250,\"gstRate\":2,\"gstAmount\":4.901960784313729,\"cgst\":2.450980392156865,\"sgst\":2.450980392156865,\"igst\":0}]}', 'COMPANY_ADMIN'),
(84, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260723-1784788253489\",\"totalAmount\":9}', NULL, 'POS_USER', 1, '2026-07-23 06:30:53.496', NULL, NULL, NULL, NULL, NULL, 'User'),
(85, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260723-1784796263250\",\"totalAmount\":10}', NULL, 'POS_USER', 1, '2026-07-23 08:44:23.265', NULL, NULL, NULL, NULL, NULL, 'User'),
(86, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-23 09:06:37.750', 'INV-1784797597693', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1784797597693\",\"customerId\":13,\"date\":\"2026-07-23\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":10000,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":10000,\"totalGstAmount\":2537.313432835821,\"totalCgst\":1268.656716417911,\"totalSgst\":1268.656716417911,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":39,\"productCode\":\"\",\"unit\":\"box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":20,\"freeQty\":0,\"primaryOpeningQty\":2,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":500,\"discount1\":0,\"discount2\":0,\"imei\":\"34345\",\"ram\":\"66\",\"storage\":\"787\",\"color\":\"bule\",\"amount\":10000,\"gstRate\":34,\"gstAmount\":2537.313432835821,\"cgst\":1268.656716417911,\"sgst\":1268.656716417911,\"igst\":0}]}', 'COMPANY_ADMIN'),
(87, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785141706577\",\"totalAmount\":908}', NULL, 'POS_USER', 1, '2026-07-27 08:41:46.600', NULL, NULL, NULL, NULL, NULL, 'User'),
(88, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785141719140\",\"totalAmount\":789.03}', NULL, 'POS_USER', 1, '2026-07-27 08:41:59.148', NULL, NULL, NULL, NULL, NULL, 'User'),
(89, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785141738771\",\"totalAmount\":449.46}', NULL, 'POS_USER', 1, '2026-07-27 08:42:18.777', NULL, NULL, NULL, NULL, NULL, 'User'),
(90, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785141801967\",\"totalAmount\":431.29999999999995}', NULL, 'POS_USER', 1, '2026-07-27 08:43:21.979', NULL, NULL, NULL, NULL, NULL, 'User'),
(91, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785141841795\",\"totalAmount\":431.29999999999995}', NULL, 'POS_USER', 1, '2026-07-27 08:44:01.801', NULL, NULL, NULL, NULL, NULL, 'User'),
(92, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785142151407\",\"totalAmount\":431.29999999999995}', NULL, 'POS_USER', 1, '2026-07-27 08:49:11.413', NULL, NULL, NULL, NULL, NULL, 'User'),
(93, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785142194411\",\"totalAmount\":431.29999999999995}', NULL, 'POS_USER', 1, '2026-07-27 08:49:54.436', NULL, NULL, NULL, NULL, NULL, 'User'),
(94, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785142226648\",\"totalAmount\":431.3}', NULL, 'POS_USER', 1, '2026-07-27 08:50:26.668', NULL, NULL, NULL, NULL, NULL, 'User'),
(95, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785151560294\",\"totalAmount\":3713.6}', NULL, 'POS_USER', 1, '2026-07-27 11:26:00.374', NULL, NULL, NULL, NULL, NULL, 'User'),
(96, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260727-1785151688945\",\"totalAmount\":451.6}', NULL, 'POS_USER', 1, '2026-07-27 11:28:08.956', NULL, NULL, NULL, NULL, NULL, 'User'),
(97, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-28 12:03:43.168', 'INV-1785240223117', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785240223117\",\"customerId\":\"\",\"date\":\"2026-07-28\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":54,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":54,\"totalGstAmount\":2.07692307692308,\"totalCgst\":1.03846153846154,\"totalSgst\":1.03846153846154,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":40,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":1,\"listPrice\":0,\"mrp\":454,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":54,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":54,\"gstRate\":4,\"gstAmount\":2.07692307692308,\"cgst\":1.03846153846154,\"sgst\":1.03846153846154,\"igst\":0}]}', 'COMPANY_ADMIN'),
(98, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-28 12:40:28.777', 'INV-1785242428630', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785242428630\",\"customerId\":13,\"date\":\"2026-07-28\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":500,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":500,\"totalGstAmount\":126.865671641791,\"totalCgst\":63.43283582089552,\"totalSgst\":63.43283582089552,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":39,\"productCode\":\"\",\"unit\":\"PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":1,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":500,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":500,\"gstRate\":34,\"gstAmount\":126.865671641791,\"cgst\":63.43283582089552,\"sgst\":63.43283582089552,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785242423832,\"bankId\":9,\"amount\":0}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(99, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-29 09:44:00.524', 'INV-1785318240454', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785318240454\",\"customerId\":13,\"date\":\"2026-07-29\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":3773,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":3773,\"totalGstAmount\":705.520325203252,\"totalCgst\":352.760162601626,\"totalSgst\":352.760162601626,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"PKT = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":11,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":1,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":3773,\"gstRate\":23,\"gstAmount\":705.520325203252,\"cgst\":352.760162601626,\"sgst\":352.760162601626,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785318238851,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(100, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-29 09:47:24.688', 'INV-1785318444629', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785318444629\",\"customerId\":13,\"date\":\"2026-07-29\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":4994,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":4994,\"totalGstAmount\":237.8095238095239,\"totalCgst\":118.9047619047619,\"totalSgst\":118.9047619047619,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":11,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":1,\"listPrice\":0,\"mrp\":45,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":4994,\"gstRate\":5,\"gstAmount\":237.8095238095239,\"cgst\":118.9047619047619,\"sgst\":118.9047619047619,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785318439429,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(101, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-29 12:55:20.521', 'INV-1785329720345', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1785329720345\",\"customerId\":13,\"date\":\"2026-07-29\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":3430,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":3430,\"totalGstAmount\":641.3821138211383,\"totalCgst\":320.6910569105692,\"totalSgst\":320.6910569105692,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"PKT = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":3430,\"gstRate\":23,\"gstAmount\":641.3821138211383,\"cgst\":320.6910569105692,\"sgst\":320.6910569105692,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785329718660,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(102, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:06:21.514', 'INV-1785402381318', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785402381318\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":3430,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":3430,\"totalGstAmount\":641.3821138211383,\"totalCgst\":320.6910569105692,\"totalSgst\":320.6910569105692,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"PKT = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":3430,\"gstRate\":23,\"gstAmount\":641.3821138211383,\"cgst\":320.6910569105692,\"sgst\":320.6910569105692,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785402380091,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(103, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:08:18.642', 'INV-1785402498580', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785402498580\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":455,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":455,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":42,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":455,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":455,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":455,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785402485736,\"bankId\":7,\"amount\":600,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(104, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:23:30.615', 'INV-1785403410457', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785403410457\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":455,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":455,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":42,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":455,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":455,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":455,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785403396167,\"bankId\":9,\"amount\":900,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(105, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:27:09.265', 'INV-1785403629134', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785403629134\",\"customerId\":4,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":51,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":300,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785403624899,\"bankId\":9,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(106, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:28:08.856', 'INV-1785403688774', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785403688774\",\"customerId\":4,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":3430,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":3430,\"totalGstAmount\":641.3821138211383,\"totalCgst\":320.6910569105692,\"totalSgst\":320.6910569105692,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"PKT = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":3430,\"gstRate\":23,\"gstAmount\":641.3821138211383,\"cgst\":320.6910569105692,\"sgst\":320.6910569105692,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785403685034,\"bankId\":9,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(107, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260730-1785403711779\",\"totalAmount\":343}', NULL, 'POS_USER', 1, '2026-07-30 09:28:31.786', NULL, NULL, NULL, NULL, NULL, 'User'),
(108, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:33:01.105', 'INV-1785403980890', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785403980890\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":5000,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":5000,\"totalGstAmount\":1268.656716417911,\"totalCgst\":634.3283582089553,\"totalSgst\":634.3283582089553,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":39,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":500,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":5000,\"gstRate\":34,\"gstAmount\":1268.656716417911,\"cgst\":634.3283582089553,\"sgst\":634.3283582089553,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785403976245,\"bankId\":7,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(109, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:34:34.786', 'INV-1785404074704', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785404074704\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":4540,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":4540,\"totalGstAmount\":216.1904761904761,\"totalCgst\":108.0952380952381,\"totalSgst\":108.0952380952381,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":45,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":4540,\"gstRate\":5,\"gstAmount\":216.1904761904761,\"cgst\":108.0952380952381,\"sgst\":108.0952380952381,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785404070253,\"bankId\":9,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(110, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-30 09:39:47.753', 'INV-1785404387581', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785404387581\",\"customerId\":13,\"date\":\"2026-07-30\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":455,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":455,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":42,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":455,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":455,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":455,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"paymentDetails\":{\"paymentRows\":[{\"id\":1785404384627,\"bankId\":9,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(111, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260730-1785406100197\",\"totalAmount\":1400}', NULL, 'POS_USER', 1, '2026-07-30 10:08:20.225', NULL, NULL, NULL, NULL, NULL, 'User'),
(112, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260730-1785406371820\",\"totalAmount\":665}', NULL, 'POS_USER', 1, '2026-07-30 10:12:51.834', NULL, NULL, NULL, NULL, NULL, 'User'),
(113, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260730-1785406393649\",\"totalAmount\":413.14}', NULL, 'POS_USER', 1, '2026-07-30 10:13:13.660', NULL, NULL, NULL, NULL, NULL, 'User'),
(114, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-31 07:48:49.388', 'INV-1785484129251', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1785484129251\",\"customerId\":4,\"date\":\"2026-07-31\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"salesperson\":\"demo \",\"commission\":15.78,\"subTotal\":68.6,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":68.6,\"totalGstAmount\":12.82764227642276,\"totalCgst\":6.413821138211382,\"totalSgst\":6.413821138211382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"box\",\"batchNo\":\"676\",\"mfgDate\":\"2026-08-01\",\"expDate\":\"2026-08-08\",\"quantity\":2,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":2,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":68.6,\"gstRate\":23,\"gstAmount\":12.82764227642276,\"cgst\":6.413821138211382,\"sgst\":6.413821138211382,\"igst\":0}],\"paymentDetails\":[{\"id\":1785484124153,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}]}', 'COMPANY_ADMIN'),
(115, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-31 07:57:13.288', 'INV-1785484633208', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1785484633208\",\"customerId\":4,\"date\":\"2026-07-31\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"salesperson\":\"\",\"commission\":0,\"subTotal\":34.3,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":34.3,\"totalGstAmount\":6.413821138211382,\"totalCgst\":3.206910569105691,\"totalSgst\":3.206910569105691,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":38,\"productCode\":\"\",\"unit\":\"box\",\"batchNo\":\"56\",\"mfgDate\":\"2026-07-02\",\"expDate\":\"2026-08-01\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":1,\"listPrice\":0,\"mrp\":3434,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":343,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":34.3,\"gstRate\":23,\"gstAmount\":6.413821138211382,\"cgst\":3.206910569105691,\"sgst\":3.206910569105691,\"igst\":0}],\"paymentDetails\":[{\"id\":1785484628957,\"bankId\":7,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}]}', 'COMPANY_ADMIN'),
(116, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-31 07:57:52.129', 'INV-1785484672079', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1785484672079\",\"customerId\":\"\",\"date\":\"2026-07-31\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"salesperson\":\"\",\"commission\":0,\"subTotal\":227,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":227,\"totalGstAmount\":10.80952380952382,\"totalCgst\":5.404761904761912,\"totalSgst\":5.404761904761912,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"PCS\",\"batchNo\":\"45\",\"mfgDate\":\"2026-08-01\",\"expDate\":\"2026-08-08\",\"quantity\":5,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":5,\"listPrice\":0,\"mrp\":45,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":227,\"gstRate\":5,\"gstAmount\":10.80952380952382,\"cgst\":5.404761904761912,\"sgst\":5.404761904761912,\"igst\":0}],\"paymentDetails\":[{\"id\":1785484670721,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}]}', 'COMPANY_ADMIN'),
(117, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260731-1785500791015\",\"totalAmount\":14}', NULL, 'POS_USER', 1, '2026-07-31 12:26:31.048', NULL, NULL, NULL, NULL, NULL, 'User');
INSERT INTO `auditlog` (`id`, `actionType`, `details`, `referenceId`, `userName`, `companyId`, `createdAt`, `billNumber`, `ipAddress`, `moduleName`, `previousData`, `updatedData`, `userRole`) VALUES
(118, 'Create', NULL, NULL, 'Unknown User', 1, '2026-07-31 12:29:15.268', 'INV-1785500955201', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1785500955201\",\"customerId\":\"\",\"date\":\"2026-07-31\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"salesperson\":\"\",\"commission\":0,\"subTotal\":500,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":500,\"totalGstAmount\":126.865671641791,\"totalCgst\":63.43283582089552,\"totalSgst\":63.43283582089552,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":39,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"45\",\"mfgDate\":\"2026-07-04\",\"expDate\":\"2026-08-01\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":500,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":500,\"gstRate\":34,\"gstAmount\":126.865671641791,\"cgst\":63.43283582089552,\"sgst\":63.43283582089552,\"igst\":0}],\"paymentDetails\":[{\"id\":1785500949387,\"bankId\":9,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}]}', 'COMPANY_ADMIN'),
(119, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-03 13:39:04.820', 'INV-1785764344552', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1785764344552\",\"customerId\":13,\"date\":\"2026-08-03\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":454,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":454,\"totalGstAmount\":21.61904761904765,\"totalCgst\":10.80952380952382,\"totalSgst\":10.80952380952382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":45,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":454,\"gstRate\":5,\"gstAmount\":21.61904761904765,\"cgst\":10.80952380952382,\"sgst\":10.80952380952382,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1785764339588,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"demo \",\"commission\":\"0.00\"}}', 'COMPANY_ADMIN'),
(120, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260805-1785919662715\",\"totalAmount\":1106}', NULL, 'POS_USER', 1, '2026-08-05 08:47:42.762', NULL, NULL, NULL, NULL, NULL, 'User'),
(121, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1785999478636\",\"totalAmount\":940}', NULL, 'POS_USER', 1, '2026-08-06 06:57:58.656', NULL, NULL, NULL, NULL, NULL, 'User'),
(122, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:18:10.802', 'INV-1786000690687', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786000690687\",\"customerId\":4,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":454,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":454,\"totalGstAmount\":21.61904761904765,\"totalCgst\":10.80952380952382,\"totalSgst\":10.80952380952382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":460,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":454,\"gstRate\":5,\"gstAmount\":21.61904761904765,\"cgst\":10.80952380952382,\"sgst\":10.80952380952382,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1786000649318,\"bankId\":9,\"amount\":5000,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(123, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:25:16.185', 'INV-1786001116098', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786001116098\",\"customerId\":4,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":454,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":454,\"totalGstAmount\":21.61904761904765,\"totalCgst\":10.80952380952382,\"totalSgst\":10.80952380952382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":460,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":454,\"gstRate\":5,\"gstAmount\":21.61904761904765,\"cgst\":10.80952380952382,\"sgst\":10.80952380952382,\"igst\":0}],\"offerId\":5,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1786001085274,\"bankId\":\"\",\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(124, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:26:16.415', 'INV-1786001176361', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786001176361\",\"customerId\":\"\",\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":567,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":567,\"totalGstAmount\":60.75000000000006,\"totalCgst\":30.37500000000003,\"totalSgst\":30.37500000000003,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":66,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":450,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":567,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":567,\"gstRate\":12,\"gstAmount\":60.75000000000006,\"cgst\":30.37500000000003,\"sgst\":30.37500000000003,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1786001158693,\"bankId\":\"\",\"amount\":100,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(125, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:33:37.836', 'INV-1786001617692', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786001617692\",\"customerId\":13,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":567,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":567,\"totalGstAmount\":60.75000000000006,\"totalCgst\":30.37500000000003,\"totalSgst\":30.37500000000003,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":66,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":450,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":567,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":567,\"gstRate\":12,\"gstAmount\":60.75000000000006,\"cgst\":30.37500000000003,\"sgst\":30.37500000000003,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1786001592658,\"bankId\":\"\",\"amount\":400,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(126, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:34:23.518', 'INV-1786001663467', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786001663467\",\"customerId\":\"\",\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":454,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":454,\"totalGstAmount\":21.61904761904765,\"totalCgst\":10.80952380952382,\"totalSgst\":10.80952380952382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":460,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":454,\"gstRate\":5,\"gstAmount\":21.61904761904765,\"cgst\":10.80952380952382,\"sgst\":10.80952380952382,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":{\"paymentRows\":[{\"id\":1786001646006,\"bankId\":12,\"amount\":400,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}}', 'COMPANY_ADMIN'),
(127, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:41:17.315', 'INV-1786002077110', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786002077110\",\"customerId\":4,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":454,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":454,\"totalGstAmount\":21.61904761904765,\"totalCgst\":10.80952380952382,\"totalSgst\":10.80952380952382,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":49,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":460,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":454,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":454,\"gstRate\":5,\"gstAmount\":21.61904761904765,\"cgst\":10.80952380952382,\"sgst\":10.80952380952382,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786002061653,\"bankId\":12,\"amount\":400,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(128, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:42:10.223', 'INV-1786002130069', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786002130069\",\"customerId\":4,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":567,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":567,\"totalGstAmount\":60.75000000000006,\"totalCgst\":30.37500000000003,\"totalSgst\":30.37500000000003,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":66,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":450,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":567,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":567,\"gstRate\":12,\"gstAmount\":60.75000000000006,\"cgst\":30.37500000000003,\"sgst\":30.37500000000003,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786002115313,\"bankId\":9,\"amount\":500,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(129, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 07:43:00.924', 'INV-1786002180828', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786002180828\",\"customerId\":\"\",\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":295,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":295,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":70,\"productCode\":\"\",\"unit\":\"\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":1,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":320,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":295,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":295,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786002166878,\"bankId\":11,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(130, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-06 10:49:11.856', 'INV-1786013351756', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786013351756\",\"customerId\":22,\"date\":\"2026-08-06\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":33.33333333333337,\"totalCgst\":16.66666666666669,\"totalSgst\":16.66666666666669,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":83,\"productCode\":\"\",\"unit\":\"PKT = bag \",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":19,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":5,\"gstAmount\":33.33333333333337,\"cgst\":16.66666666666669,\"sgst\":16.66666666666669,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786013330675,\"bankId\":14,\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(131, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015184283\",\"totalAmount\":2740}', NULL, 'POS_USER', 1, '2026-08-06 11:19:44.357', NULL, NULL, NULL, NULL, NULL, 'User'),
(132, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015459255\",\"totalAmount\":780}', NULL, 'POS_USER', 1, '2026-08-06 11:24:19.277', NULL, NULL, NULL, NULL, NULL, 'User'),
(133, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015470457\",\"totalAmount\":665}', NULL, 'POS_USER', 1, '2026-08-06 11:24:30.490', NULL, NULL, NULL, NULL, NULL, 'User'),
(134, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015482697\",\"totalAmount\":665}', NULL, 'POS_USER', 1, '2026-08-06 11:24:42.715', NULL, NULL, NULL, NULL, NULL, 'User'),
(135, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015500458\",\"totalAmount\":665}', NULL, 'POS_USER', 1, '2026-08-06 11:25:00.481', NULL, NULL, NULL, NULL, NULL, 'User'),
(136, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015873098\",\"totalAmount\":665}', NULL, 'POS_USER', 1, '2026-08-06 11:31:13.161', NULL, NULL, NULL, NULL, NULL, 'User'),
(137, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786015957621\",\"totalAmount\":693}', NULL, 'POS_USER', 1, '2026-08-06 11:32:37.643', NULL, NULL, NULL, NULL, NULL, 'User'),
(138, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260806-1786017597065\",\"totalAmount\":1480}', NULL, 'POS_USER', 1, '2026-08-06 11:59:57.097', NULL, NULL, NULL, NULL, NULL, 'User'),
(139, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-07 05:52:57.159', 'INV-1786081976936', '127.0.0.1', 'Quotation', 'null', '{\"invoiceNo\":\"INV-1786081976936\",\"customerId\":22,\"date\":\"2026-08-07\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":2468.421052631579,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":2468.421052631579,\"totalGstAmount\":117.5438596491231,\"totalCgst\":58.77192982456154,\"totalSgst\":58.77192982456154,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":83,\"productCode\":\"\",\"unit\":\"PKT = bag \",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":67,\"freeQty\":0,\"primaryOpeningQty\":3,\"secOpeningQty\":10,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":2468.421052631579,\"gstRate\":5,\"gstAmount\":117.5438596491231,\"cgst\":58.77192982456154,\"sgst\":58.77192982456154,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786081968524,\"bankId\":14,\"amount\":2468.421052631579,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(140, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260807-1786089297348\",\"totalAmount\":2740}', NULL, 'POS_USER', 1, '2026-08-07 07:54:57.378', NULL, NULL, NULL, NULL, NULL, 'User'),
(141, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-07 07:56:01.595', 'INV-1786089361490', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786089361490\",\"customerId\":22,\"date\":\"2026-08-07\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":33.33333333333337,\"totalCgst\":16.66666666666669,\"totalSgst\":16.66666666666669,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":83,\"productCode\":\"\",\"unit\":\"PKT = bag \",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":19,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":5,\"gstAmount\":33.33333333333337,\"cgst\":16.66666666666669,\"sgst\":16.66666666666669,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786089360494,\"bankId\":\"\",\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(142, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 07:32:54.477', 'INV-1786433574263', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786433574263\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":1,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786433559094,\"bankId\":14,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(143, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 07:39:28.002', 'INV-1786433967900', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786433967900\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":1,\"primaryOpeningQty\":0,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":0,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786433966220,\"bankId\":\"\",\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(144, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 07:54:30.144', 'INV-1786434870053', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786434870053\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":2,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786434868146,\"bankId\":\"\",\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(145, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 07:56:18.129', 'INV-1786434978060', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786434978060\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786434974594,\"bankId\":\"\",\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(146, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 12:12:53.515', 'INV-1786450373435', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786450373435\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786450371015,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(147, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:24:38.258', 'INV-1786454678179', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786454678179\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786454676617,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(148, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:25:09.613', 'INV-1786454709539', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786454709539\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786454698748,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(149, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:25:38.296', 'INV-1786454738235', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786454738235\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786454735750,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(150, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:27:02.220', 'INV-1786454822162', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786454822162\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786454820813,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(151, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:31:25.103', 'INV-1786455084298', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786455084298\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455081985,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(152, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:33:39.926', 'INV-1786455219815', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786455219815\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455216802,\"bankId\":\"\",\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(153, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:33:55.487', 'INV-1786455235415', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455235415\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":0,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":0,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":87,\"productCode\":\"\",\"unit\":\"packet = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":12,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":0,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":0,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":0,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455233817,\"bankId\":\"\",\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(154, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:34:08.919', 'INV-1786455248750', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455248750\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455247626,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(155, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:34:24.121', 'INV-1786455264054', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786455264054\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455260697,\"bankId\":14,\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(156, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:35:48.254', 'INV-1786455347902', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455347902\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455346579,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(157, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:35:51.283', 'INV-1786455351230', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455351230\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455350074,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(158, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:36:01.071', 'INV-1786455361014', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455361014\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455359118,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(159, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-11 13:36:14.527', 'INV-1786455374445', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786455374445\",\"customerId\":22,\"date\":\"2026-08-11\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786455372074,\"bankId\":\"\",\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(160, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260811-1786456388959\",\"totalAmount\":560}', NULL, 'POS_USER', 1, '2026-08-11 13:53:09.057', NULL, NULL, NULL, NULL, NULL, 'User'),
(161, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260811-1786456399593\",\"totalAmount\":700}', NULL, 'POS_USER', 1, '2026-08-11 13:53:19.636', NULL, NULL, NULL, NULL, NULL, 'User'),
(162, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260812-1786512317824\",\"totalAmount\":12}', NULL, 'POS_USER', 1, '2026-08-12 05:25:17.857', NULL, NULL, NULL, NULL, NULL, 'User'),
(163, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260812-1786512808595\",\"totalAmount\":780}', NULL, 'POS_USER', 1, '2026-08-12 05:33:28.654', NULL, NULL, NULL, NULL, NULL, 'User'),
(164, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260812-1786513048854\",\"totalAmount\":780}', NULL, 'POS_USER', 1, '2026-08-12 05:37:28.865', NULL, NULL, NULL, NULL, NULL, 'User'),
(165, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260812-1786513190645\",\"totalAmount\":6000}', NULL, 'POS_USER', 1, '2026-08-12 05:39:50.658', NULL, NULL, NULL, NULL, NULL, 'User'),
(166, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:07:38.351', 'INV-1786529257485', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786529257485\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786529253745,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(167, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:19:36.773', 'INV-1786529976509', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786529976509\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786529972729,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(168, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:22:35.217', 'INV-1786530155115', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786530155115\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530150263,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(169, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:23:24.989', 'INV-1786530204922', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786530204922\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530202573,\"bankId\":\"\",\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(170, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:24:09.316', 'INV-1786530249209', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786530249209\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530241597,\"bankId\":9999,\"amount\":7,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(171, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:26:05.997', 'INV-1786530365952', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786530365952\",\"customerId\":\"\",\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":0,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":0,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":87,\"productCode\":\"\",\"unit\":\"packet = box\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":12,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":0,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":0,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":0,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530361337,\"bankId\":14,\"amount\":0,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(172, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:27:08.151', 'INV-1786530428071', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786530428071\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":6000,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":6000,\"totalGstAmount\":230.7692307692314,\"totalCgst\":115.3846153846157,\"totalSgst\":115.3846153846157,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":89,\"productCode\":\"\",\"unit\":\"bag  = packet\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":6000,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":6000,\"gstRate\":4,\"gstAmount\":230.7692307692314,\"cgst\":115.3846153846157,\"sgst\":115.3846153846157,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530418386,\"bankId\":14,\"amount\":60,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN');
INSERT INTO `auditlog` (`id`, `actionType`, `details`, `referenceId`, `userName`, `companyId`, `createdAt`, `billNumber`, `ipAddress`, `moduleName`, `previousData`, `updatedData`, `userRole`) VALUES
(173, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-12 10:27:32.459', 'INV-1786530452391', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786530452391\",\"customerId\":22,\"date\":\"2026-08-12\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786530449411,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(174, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786688941547\",\"totalAmount\":7960}', NULL, 'POS_USER', 1, '2026-08-14 06:29:01.563', NULL, NULL, NULL, NULL, NULL, 'User'),
(175, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 06:29:38.060', 'INV-1786688977995', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786688977995\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786688975303,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(176, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 07:47:54.209', 'INV-1786693674086', '127.0.0.1', 'Customer Invoice', 'null', '{\"invoiceNo\":\"INV-1786693674086\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":6000,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":6000,\"totalGstAmount\":230.7692307692314,\"totalCgst\":115.3846153846157,\"totalSgst\":115.3846153846157,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":89,\"productCode\":\"\",\"unit\":\"bag  = packet\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":500,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":6000,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":6000,\"gstRate\":4,\"gstAmount\":230.7692307692314,\"cgst\":115.3846153846157,\"sgst\":115.3846153846157,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786693671012,\"bankId\":14,\"amount\":6000,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(177, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 08:41:45.449', 'INV-1786696905377', '127.0.0.1', 'Customer Challan', 'null', '{\"invoiceNo\":\"INV-1786696905377\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786696901973,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(178, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 08:56:23.471', 'INV-1786697783415', '127.0.0.1', 'Customer Challan', 'null', '{\"invoiceNo\":\"INV-1786697783415\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786697780372,\"bankId\":14,\"amount\":560,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(179, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:05:15.007', 'INV-1786698314929', '127.0.0.1', 'Customer Challan', 'null', '{\"invoiceNo\":\"INV-1786698314929\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786698311879,\"bankId\":14,\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(180, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:13:47.061', 'INV-1786698826979', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786698826979\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":9.523809523809518,\"totalCgst\":4.761904761904759,\"totalSgst\":4.761904761904759,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":5,\"gstAmount\":9.523809523809518,\"cgst\":4.761904761904759,\"sgst\":4.761904761904759,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786698823250,\"bankId\":14,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(181, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:21:28.934', 'INV-1786699288758', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699288758\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":9.523809523809518,\"totalCgst\":4.761904761904759,\"totalSgst\":4.761904761904759,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":5,\"gstAmount\":9.523809523809518,\"cgst\":4.761904761904759,\"sgst\":4.761904761904759,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699285802,\"bankId\":14,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(182, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:23:00.827', 'INV-1786699380765', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699380765\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":40,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":40,\"totalGstAmount\":1.904761904761905,\"totalCgst\":0.9523809523809526,\"totalSgst\":0.9523809523809526,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":2,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":2,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":40,\"gstRate\":5,\"gstAmount\":1.904761904761905,\"cgst\":0.9523809523809526,\"sgst\":0.9523809523809526,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699377319,\"bankId\":14,\"amount\":40,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(183, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:23:49.985', 'INV-1786699429892', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699429892\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":100,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":100,\"totalGstAmount\":4.761904761904759,\"totalCgst\":2.38095238095238,\"totalSgst\":2.38095238095238,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":5,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":5,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":100,\"gstRate\":5,\"gstAmount\":4.761904761904759,\"cgst\":2.38095238095238,\"sgst\":2.38095238095238,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699428238,\"bankId\":\"\",\"amount\":100,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(184, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:30:21.922', 'INV-1786699821784', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699821784\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":100,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":100,\"totalGstAmount\":4.761904761904759,\"totalCgst\":2.38095238095238,\"totalSgst\":2.38095238095238,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":5,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":5,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":100,\"gstRate\":5,\"gstAmount\":4.761904761904759,\"cgst\":2.38095238095238,\"sgst\":2.38095238095238,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699820356,\"bankId\":\"\",\"amount\":100,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(185, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:31:13.447', 'INV-1786699873359', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699873359\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":9.523809523809518,\"totalCgst\":4.761904761904759,\"totalSgst\":4.761904761904759,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":10,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":5,\"gstAmount\":9.523809523809518,\"cgst\":4.761904761904759,\"sgst\":4.761904761904759,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699867500,\"bankId\":\"\",\"amount\":186,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(186, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:31:57.245', 'INV-1786699917191', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786699917191\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":40,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":40,\"totalGstAmount\":1.904761904761905,\"totalCgst\":0.9523809523809526,\"totalSgst\":0.9523809523809526,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":2,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":2,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":40,\"gstRate\":5,\"gstAmount\":1.904761904761905,\"cgst\":0.9523809523809526,\"sgst\":0.9523809523809526,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786699913153,\"bankId\":14,\"amount\":40,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(187, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:33:30.380', 'INV-1786700010325', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786700010325\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":180,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":180,\"totalGstAmount\":8.571428571428584,\"totalCgst\":4.285714285714292,\"totalSgst\":4.285714285714292,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":9,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":9,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":180,\"gstRate\":5,\"gstAmount\":8.571428571428584,\"cgst\":4.285714285714292,\"sgst\":4.285714285714292,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786700007416,\"bankId\":14,\"amount\":180,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(188, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 09:37:04.804', 'INV-1786700224723', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786700224723\",\"customerId\":\"\",\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":40,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":40,\"totalGstAmount\":1.904761904761905,\"totalCgst\":0.9523809523809526,\"totalSgst\":0.9523809523809526,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":2,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":2,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":40,\"gstRate\":5,\"gstAmount\":1.904761904761905,\"cgst\":0.9523809523809526,\"sgst\":0.9523809523809526,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786700221629,\"bankId\":14,\"amount\":40,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(189, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 10:00:54.626', 'INV-1786701654347', '127.0.0.1', 'Sales Order', 'null', '{\"invoiceNo\":\"INV-1786701654347\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":728,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":728,\"totalGstAmount\":34.66666666666674,\"totalCgst\":17.33333333333337,\"totalSgst\":17.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":13,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":3,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":728,\"gstRate\":5,\"gstAmount\":34.66666666666674,\"cgst\":17.33333333333337,\"sgst\":17.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786701651374,\"bankId\":14,\"amount\":728,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(190, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 10:02:10.151', 'INV-1786701730042', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786701730042\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":112,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":112,\"totalGstAmount\":5.333333333333343,\"totalCgst\":2.666666666666671,\"totalSgst\":2.666666666666671,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":2,\"freeQty\":0,\"primaryOpeningQty\":0,\"secOpeningQty\":2,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":112,\"gstRate\":5,\"gstAmount\":5.333333333333343,\"cgst\":2.666666666666671,\"sgst\":2.666666666666671,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786701726948,\"bankId\":14,\"amount\":112,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(191, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786703419412\",\"totalAmount\":6560}', NULL, 'POS_USER', 1, '2026-08-14 10:30:19.437', NULL, NULL, NULL, NULL, NULL, 'User'),
(192, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786703528530\",\"totalAmount\":560}', NULL, 'POS_USER', 1, '2026-08-14 10:32:08.542', NULL, NULL, NULL, NULL, NULL, 'User'),
(193, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:03:30.257', 'INV-1786705409728', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786705409728\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786705390492,\"bankId\":14,\"amount\":460,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(194, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:22:24.466', 'INV-1786706544308', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786706544308\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786706530385,\"bankId\":\"\",\"amount\":460,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(195, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786707017818\",\"totalAmount\":560}', NULL, 'POS_USER', 1, '2026-08-14 11:30:17.962', NULL, NULL, NULL, NULL, NULL, 'User'),
(196, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786707087460\",\"totalAmount\":6000}', NULL, 'POS_USER', 1, '2026-08-14 11:31:27.470', NULL, NULL, NULL, NULL, NULL, 'User'),
(197, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786707165505\",\"totalAmount\":6000}', NULL, 'POS_USER', 1, '2026-08-14 11:32:45.539', NULL, NULL, NULL, NULL, NULL, 'User'),
(198, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786707539418\",\"totalAmount\":700}', NULL, 'POS_USER', 1, '2026-08-14 11:38:59.430', NULL, NULL, NULL, NULL, NULL, 'User'),
(199, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:39:51.585', 'INV-1786707591480', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786707591480\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":780,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":780,\"totalGstAmount\":37.14285714285722,\"totalCgst\":18.57142857142861,\"totalSgst\":18.57142857142861,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":86,\"productCode\":\"\",\"unit\":\"bag  = Pack\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":20,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":780,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":780,\"gstRate\":5,\"gstAmount\":37.14285714285722,\"cgst\":18.57142857142861,\"sgst\":18.57142857142861,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786707583950,\"bankId\":15,\"amount\":780,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(200, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260814-1786708115988\",\"totalAmount\":6000}', NULL, 'POS_USER', 1, '2026-08-14 11:48:36.018', NULL, NULL, NULL, NULL, NULL, 'User'),
(201, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:49:54.744', 'INV-1786708194665', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786708194665\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":780,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":780,\"totalGstAmount\":37.14285714285722,\"totalCgst\":18.57142857142861,\"totalSgst\":18.57142857142861,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":86,\"productCode\":\"\",\"unit\":\"bag  = Pack\",\"batchNo\":\"\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":20,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":780,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":780,\"gstRate\":5,\"gstAmount\":37.14285714285722,\"cgst\":18.57142857142861,\"sgst\":18.57142857142861,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786708173726,\"bankId\":\"\",\"amount\":700,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(202, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:52:34.302', 'INV-1786708354231', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786708354231\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":9.523809523809518,\"totalCgst\":4.761904761904759,\"totalSgst\":4.761904761904759,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":90,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":180,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":5,\"gstAmount\":9.523809523809518,\"cgst\":4.761904761904759,\"sgst\":4.761904761904759,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786708348763,\"bankId\":\"\",\"amount\":100,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(203, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 11:53:19.298', 'INV-1786708399198', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786708399198\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Credit\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786708393995,\"bankId\":\"\",\"amount\":300,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(204, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:20:02.835', 'INV-1786710002621', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786710002621\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786709982689,\"bankId\":\"\",\"amount\":400,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(205, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:21:33.726', 'INV-1786710093659', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786710093659\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Credit\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786710078968,\"bankId\":\"\",\"amount\":300,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(206, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:31:54.575', 'INV-1786710714260', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786710714260\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Credit\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":0,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786710708594,\"bankId\":16,\"amount\":300,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(207, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:39:59.146', 'INV-1786711198991', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1786711198991\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"2026-08-10\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786711173763,\"bankId\":14,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(208, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:40:58.176', 'INV-1786711258110', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786711258110\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":700,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":700,\"totalGstAmount\":39.62264150943395,\"totalCgst\":19.81132075471697,\"totalSgst\":19.81132075471697,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":700,\"gstRate\":6,\"gstAmount\":39.62264150943395,\"cgst\":19.81132075471697,\"sgst\":19.81132075471697,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786711253020,\"bankId\":16,\"amount\":400,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(209, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:42:26.537', 'INV-1786711346469', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786711346469\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Credit\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786711320321,\"bankId\":14,\"amount\":200,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(210, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-14 12:49:33.644', 'INV-1786711773424', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1786711773424\",\"customerId\":22,\"date\":\"2026-08-14\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":200,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":200,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"ok\",\"mfgDate\":\"2026-08-08\",\"expDate\":\"2026-08-22\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":200,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1786711763340,\"bankId\":14,\"amount\":100,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(211, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260815-1786793645962\",\"totalAmount\":2240}', NULL, 'POS_USER', 1, '2026-08-15 11:34:06.031', NULL, NULL, NULL, NULL, NULL, 'User'),
(212, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260815-1786793990586\",\"totalAmount\":2240}', NULL, 'POS_USER', 1, '2026-08-15 11:39:50.601', NULL, NULL, NULL, NULL, NULL, 'User'),
(213, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260815-1786794563743\",\"totalAmount\":2240}', NULL, 'POS_USER', 1, '2026-08-15 11:49:23.768', NULL, NULL, NULL, NULL, NULL, 'User'),
(214, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-18 11:56:14.248', 'INV-1787054174148', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1787054174148\",\"customerId\":22,\"date\":\"2026-08-18\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":560,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":560,\"totalGstAmount\":26.66666666666674,\"totalCgst\":13.33333333333337,\"totalSgst\":13.33333333333337,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":10,\"freeQty\":0,\"primaryOpeningQty\":1,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":560,\"gstRate\":5,\"gstAmount\":26.66666666666674,\"cgst\":13.33333333333337,\"sgst\":13.33333333333337,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1787054162431,\"bankId\":16,\"amount\":503,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(215, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-18 12:27:10.747', 'INV-1787056030694', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1787056030694\",\"customerId\":\"\",\"date\":\"2026-08-18\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":35840,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":35840,\"totalGstAmount\":1706.666666666672,\"totalCgst\":853.3333333333358,\"totalSgst\":853.3333333333358,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":640,\"freeQty\":0,\"primaryOpeningQty\":64,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"description\":\"Roll Qty: 2 | Meter/Roll: 32\",\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":35840,\"gstRate\":5,\"gstAmount\":1706.666666666672,\"cgst\":853.3333333333358,\"sgst\":853.3333333333358,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1787056026463,\"bankId\":16,\"amount\":358,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(216, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-18 12:28:30.697', 'INV-1787056110637', '127.0.0.1', 'Sales Invoice', 'null', '{\"invoiceNo\":\"INV-1787056110637\",\"customerId\":\"\",\"date\":\"2026-08-18\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":52612,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":52612,\"totalGstAmount\":2652.503144654091,\"totalCgst\":1326.251572327045,\"totalSgst\":1326.251572327045,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":84,\"productCode\":\"\",\"unit\":\"box = PKT\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":647,\"freeQty\":0,\"primaryOpeningQty\":64,\"secOpeningQty\":7,\"listPrice\":0,\"mrp\":700,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":560,\"description\":\"Roll Qty: 2 | Meter/Roll: 32\",\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":36232,\"gstRate\":5,\"gstAmount\":1725.333333333336,\"cgst\":862.6666666666679,\"sgst\":862.6666666666679,\"igst\":0},{\"productId\":85,\"productCode\":\"\",\"unit\":\"box = PCS\",\"batchNo\":\"wdwer\",\"mfgDate\":\"\",\"expDate\":\"\",\"quantity\":234,\"freeQty\":0,\"primaryOpeningQty\":23,\"secOpeningQty\":4,\"listPrice\":0,\"mrp\":50,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":700,\"description\":\"Roll Qty: 1 | Meter/Roll: 23\",\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":16380,\"gstRate\":6,\"gstAmount\":927.1698113207549,\"cgst\":463.5849056603774,\"sgst\":463.5849056603774,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1787056103136,\"bankId\":16,\"amount\":526,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN'),
(217, 'POS_CHECKOUT', '{\"invoiceNo\":\"POS-20260818-1787058589885\",\"totalAmount\":8240}', NULL, 'POS_USER', 1, '2026-08-18 13:09:49.928', NULL, NULL, NULL, NULL, NULL, 'User'),
(218, 'Create', NULL, NULL, 'Unknown User', 1, '2026-08-19 06:30:03.146', 'INV-1787121003045', '127.0.0.1', 'Sales Return', 'null', '{\"invoiceNo\":\"INV-1787121003045\",\"customerId\":22,\"date\":\"2026-08-19\",\"paymentMode\":\"Cash\",\"remark\":\"\",\"subTotal\":800,\"totalDiscount\":0,\"freightCharges\":0,\"totalAmount\":800,\"totalGstAmount\":0,\"totalCgst\":0,\"totalSgst\":0,\"totalIgst\":0,\"tcsAmount\":0,\"items\":[{\"productId\":88,\"productCode\":\"\",\"unit\":\"Pack = PCS\",\"batchNo\":\"ok\",\"mfgDate\":\"2026-08-08\",\"expDate\":\"2026-08-22\",\"quantity\":40,\"freeQty\":0,\"primaryOpeningQty\":4,\"secOpeningQty\":0,\"listPrice\":0,\"mrp\":200,\"purchasePrice\":0,\"salePrice\":0,\"wholeSalePrice\":0,\"price\":200,\"description\":\"2 X 2\",\"discount1\":0,\"discount2\":0,\"imei\":\"\",\"ram\":\"\",\"storage\":\"\",\"color\":\"\",\"amount\":800,\"gstRate\":0,\"gstAmount\":0,\"cgst\":0,\"sgst\":0,\"igst\":0}],\"offerId\":null,\"redeemedPoints\":0,\"loyaltyDiscountValue\":0,\"paymentDetails\":[{\"id\":1787120999309,\"bankId\":16,\"amount\":800,\"isCheque\":false,\"chequeNo\":\"\",\"chequeDate\":\"\"}],\"salesPerson\":\"\",\"commission\":\"\"}', 'COMPANY_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `address` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `ifsc` varchar(191) DEFAULT NULL,
  `accountNo` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`, `type`, `balance`, `address`, `branch`, `ifsc`, `accountNo`, `companyId`, `createdAt`, `updatedAt`) VALUES
(14, 'central', 'WALLET-BOOK', 84536.31578947368, 'infot', 'harda', 'fe423534546', '1234356567', 1, '2026-08-06 10:44:53.280', '2026-08-18 13:09:49.919'),
(16, 'Cash', 'CASH BOOK', -8699, NULL, NULL, NULL, NULL, 1, '2026-08-14 12:25:26.744', '2026-08-19 11:05:09.063');

-- --------------------------------------------------------

--
-- Table structure for table `bankstatement`
--

CREATE TABLE `bankstatement` (
  `id` int(11) NOT NULL,
  `bankId` int(11) NOT NULL,
  `uploadDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `fileName` varchar(191) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bankstatementrecord`
--

CREATE TABLE `bankstatementrecord` (
  `id` int(11) NOT NULL,
  `statementId` int(11) NOT NULL,
  `date` datetime(3) NOT NULL,
  `description` text NOT NULL,
  `refNo` varchar(191) DEFAULT NULL,
  `debit` double NOT NULL DEFAULT 0,
  `credit` double NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banktransaction`
--

CREATE TABLE `banktransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `amount` double NOT NULL DEFAULT 0,
  `bankCharges` double NOT NULL DEFAULT 0,
  `remark` varchar(191) DEFAULT NULL,
  `fromBankId` int(11) DEFAULT NULL,
  `toBankId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banktransaction`
--

INSERT INTO `banktransaction` (`id`, `date`, `amount`, `bankCharges`, `remark`, `fromBankId`, `toBankId`, `companyId`, `createdAt`, `updatedAt`) VALUES
(34, '2026-08-06 00:00:00.000', 400, 0, 'PURCHASE Payment - PUR-1786013135983', 14, NULL, 1, '2026-08-06 10:45:36.055', '2026-08-06 10:45:36.055'),
(35, '2026-08-06 00:00:00.000', 700, 0, 'SALES Receipt - INV-1786013351756', NULL, 14, 1, '2026-08-06 10:49:11.839', '2026-08-06 10:49:11.839'),
(36, '2026-08-06 11:19:44.283', 2740, 0, 'Cash POS Sale - POS-20260806-1786015184283', NULL, 14, 1, '2026-08-06 11:19:44.346', '2026-08-06 11:19:44.346'),
(37, '2026-08-06 11:24:19.255', 780, 0, 'Cash POS Sale - POS-20260806-1786015459255', NULL, 14, 1, '2026-08-06 11:24:19.273', '2026-08-06 11:24:19.273'),
(38, '2026-08-06 11:24:30.457', 665, 0, 'Cash POS Sale - POS-20260806-1786015470457', NULL, 14, 1, '2026-08-06 11:24:30.474', '2026-08-06 11:24:30.474'),
(39, '2026-08-06 11:24:42.697', 665, 0, 'Cash POS Sale - POS-20260806-1786015482697', NULL, 14, 1, '2026-08-06 11:24:42.712', '2026-08-06 11:24:42.712'),
(40, '2026-08-06 11:25:00.458', 665, 0, 'Cash POS Sale - POS-20260806-1786015500458', NULL, 14, 1, '2026-08-06 11:25:00.465', '2026-08-06 11:25:00.465'),
(41, '2026-08-06 11:31:13.098', 665, 0, 'Cash POS Sale - POS-20260806-1786015873098', NULL, 14, 1, '2026-08-06 11:31:13.155', '2026-08-06 11:31:13.155'),
(42, '2026-08-06 11:32:37.621', 693, 0, 'Cash POS Sale - POS-20260806-1786015957621', NULL, 14, 1, '2026-08-06 11:32:37.627', '2026-08-06 11:32:37.627'),
(43, '2026-08-06 11:59:57.065', 1480, 0, 'Cash POS Sale - POS-20260806-1786017597065', NULL, 14, 1, '2026-08-06 11:59:57.089', '2026-08-06 11:59:57.089'),
(44, '2026-08-07 00:00:00.000', 2468.421052631579, 0, 'QUOTATION Receipt - INV-1786081976936', NULL, 14, 1, '2026-08-07 05:52:57.093', '2026-08-07 05:52:57.093'),
(45, '2026-08-07 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786089275098', 14, NULL, 1, '2026-08-07 07:54:35.155', '2026-08-07 07:54:35.155'),
(46, '2026-08-07 07:54:57.348', 2740, 0, 'UPI POS Sale - POS-20260807-1786089297348', NULL, 14, 1, '2026-08-07 07:54:57.373', '2026-08-07 07:54:57.373'),
(47, '2026-08-07 00:00:00.000', 800, 0, 'PURCHASE_RETURN Receipt - PUR-1786089323586', NULL, 14, 1, '2026-08-07 07:55:23.631', '2026-08-07 07:55:23.631'),
(48, '2026-08-08 00:00:00.000', 700, 0, 'PURCHASE_RETURN Receipt - PUR-1786170198490', NULL, 14, 1, '2026-08-08 06:23:18.702', '2026-08-08 06:23:18.702'),
(49, '2026-08-08 00:00:00.000', 747.3684210526317, 0, 'PURCHASE Payment - PUR-1786189003497', 14, NULL, 1, '2026-08-08 11:36:43.539', '2026-08-08 11:36:43.539'),
(50, '2026-08-11 00:00:00.000', 3684.21052631579, 0, 'PURCHASE Payment - PUR-1786426910008', 14, NULL, 1, '2026-08-11 05:41:50.173', '2026-08-11 05:41:50.173'),
(51, '2026-08-11 00:00:00.000', 3610.526315789474, 0, 'PURCHASE Payment - PUR-1786427039191', 14, NULL, 1, '2026-08-11 05:43:59.235', '2026-08-11 05:43:59.235'),
(52, '2026-08-11 00:00:00.000', 4400, 0, 'PURCHASE Payment - PUR-1786427850017', 14, NULL, 1, '2026-08-11 05:57:30.067', '2026-08-11 05:57:30.067'),
(53, '2026-08-11 00:00:00.000', 200, 0, 'SALES Receipt - INV-1786433574263', NULL, 14, 1, '2026-08-11 07:32:54.441', '2026-08-11 07:32:54.441'),
(54, '2026-08-11 00:00:00.000', 560, 0, 'PURCHASE Payment - PUR-1786437422829', 14, NULL, 1, '2026-08-11 08:37:02.886', '2026-08-11 08:37:02.886'),
(55, '2026-08-11 00:00:00.000', 550, 0, 'PURCHASE Payment - PUR-1786445859269', 14, NULL, 1, '2026-08-11 10:57:39.426', '2026-08-11 10:57:39.426'),
(56, '2026-08-11 00:00:00.000', 110, 0, 'PURCHASE Payment - PUR-1786446295050', 14, NULL, 1, '2026-08-11 11:04:55.249', '2026-08-11 11:04:55.249'),
(57, '2026-08-11 00:00:00.000', 80, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786453104177-437', 14, NULL, 1, '2026-08-11 12:58:24.271', '2026-08-11 12:58:24.271'),
(58, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786453428784-805', 14, NULL, 1, '2026-08-11 13:03:48.828', '2026-08-11 13:03:48.828'),
(59, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786453838900-746', 14, NULL, 1, '2026-08-11 13:10:38.997', '2026-08-11 13:10:38.997'),
(60, '2026-08-11 00:00:00.000', 60, 0, 'PURCHASE Payment - PUR-1786454385733', 14, NULL, 1, '2026-08-11 13:19:45.899', '2026-08-11 13:19:45.899'),
(61, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786454403357', 14, NULL, 1, '2026-08-11 13:20:03.432', '2026-08-11 13:20:03.432'),
(62, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786454416933', 14, NULL, 1, '2026-08-11 13:20:16.974', '2026-08-11 13:20:16.974'),
(63, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786454627955', 14, NULL, 1, '2026-08-11 13:23:48.079', '2026-08-11 13:23:48.079'),
(64, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786454637867', 14, NULL, 1, '2026-08-11 13:23:57.935', '2026-08-11 13:23:57.935'),
(65, '2026-08-11 00:00:00.000', 60, 0, 'PURCHASE_RETURN Receipt - PUR-1786454652027', NULL, 14, 1, '2026-08-11 13:24:12.073', '2026-08-11 13:24:12.073'),
(66, '2026-08-11 00:00:00.000', 560, 0, 'SALES Receipt - INV-1786454709539', NULL, 14, 1, '2026-08-11 13:25:09.598', '2026-08-11 13:25:09.598'),
(67, '2026-08-11 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786455151784', 14, NULL, 1, '2026-08-11 13:32:31.842', '2026-08-11 13:32:31.842'),
(68, '2026-08-11 00:00:00.000', 700, 0, 'SALES_RETURN Payment - INV-1786455264054', 14, NULL, 1, '2026-08-11 13:34:24.098', '2026-08-11 13:34:24.098'),
(69, '2026-08-11 13:53:08.959', 560, 0, 'Cash POS Sale - POS-20260811-1786456388959', NULL, 14, 1, '2026-08-11 13:53:09.040', '2026-08-11 13:53:09.040'),
(70, '2026-08-11 13:53:19.593', 700, 0, 'Cash POS Sale - POS-20260811-1786456399593', NULL, 14, 1, '2026-08-11 13:53:19.610', '2026-08-11 13:53:19.610'),
(71, '2026-08-12 05:33:28.595', 780, 0, 'Cash POS Sale - POS-20260812-1786512808595', NULL, 14, 1, '2026-08-12 05:33:28.629', '2026-08-12 05:33:28.629'),
(72, '2026-08-12 05:37:28.854', 780, 0, 'Cash POS Sale - POS-20260812-1786513048854', NULL, 14, 1, '2026-08-12 05:37:28.861', '2026-08-12 05:37:28.861'),
(73, '2026-08-12 05:39:50.645', 6000, 0, 'Cash POS Sale - POS-20260812-1786513190645', NULL, 14, 1, '2026-08-12 05:39:50.653', '2026-08-12 05:39:50.653'),
(74, '2026-08-12 00:00:00.000', 560, 0, 'SALES Receipt - INV-1786529257485', NULL, 14, 1, '2026-08-12 10:07:38.325', '2026-08-12 10:07:38.325'),
(75, '2026-08-12 00:00:00.000', 560, 0, 'SALES Receipt - INV-1786529976509', NULL, 14, 1, '2026-08-12 10:19:36.715', '2026-08-12 10:19:36.715'),
(76, '2026-08-12 00:00:00.000', 560, 0, 'SALES Receipt - INV-1786530155115', NULL, 14, 1, '2026-08-12 10:22:35.171', '2026-08-12 10:22:35.171'),
(77, '2026-08-12 00:00:00.000', 800, 0, 'PURCHASE Payment - PUR-1786530179123', 14, NULL, 1, '2026-08-12 10:22:59.209', '2026-08-12 10:22:59.209'),
(78, '2026-08-12 00:00:00.000', 7, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786530293582-404', 14, NULL, 1, '2026-08-12 10:24:53.604', '2026-08-12 10:24:53.604'),
(79, '2026-08-12 00:00:00.000', 60, 0, 'PURCHASE Payment - PUR-1786530316985', 14, NULL, 1, '2026-08-12 10:25:17.037', '2026-08-12 10:25:17.037'),
(80, '2026-08-12 00:00:00.000', 39620, 0, 'PURCHASE_RETURN Receipt - PUR-1786530349376', NULL, 14, 1, '2026-08-12 10:25:49.410', '2026-08-12 10:25:49.410'),
(81, '2026-08-12 00:00:00.000', 60, 0, 'SALES_RETURN Payment - INV-1786530428071', 14, NULL, 1, '2026-08-12 10:27:08.128', '2026-08-12 10:27:08.128'),
(82, '2026-08-12 00:00:00.000', 560, 0, 'SALES_RETURN Payment - INV-1786530452391', 14, NULL, 1, '2026-08-12 10:27:32.431', '2026-08-12 10:27:32.431'),
(83, '2026-08-14 00:00:00.000', 700, 0, 'PURCHASE Payment - PUR-1786688883659', 14, NULL, 1, '2026-08-14 06:28:03.707', '2026-08-14 06:28:03.707'),
(84, '2026-08-14 06:29:01.547', 7960, 0, 'Cash:60 POS Sale - POS-20260814-1786688941547', NULL, 14, 1, '2026-08-14 06:29:01.559', '2026-08-14 06:29:01.559'),
(85, '2026-08-14 00:00:00.000', 560, 0, 'SALES Receipt - INV-1786688977995', NULL, 14, 1, '2026-08-14 06:29:38.045', '2026-08-14 06:29:38.045'),
(86, '2026-08-14 00:00:00.000', 6000, 0, 'SALES Receipt - INV-1786693674086', NULL, 14, 1, '2026-08-14 07:47:54.188', '2026-08-14 07:47:54.188'),
(87, '2026-08-14 00:00:00.000', 560, 0, 'CHALLAN Receipt - INV-1786696905377', NULL, 14, 1, '2026-08-14 08:41:45.429', '2026-08-14 08:41:45.429'),
(88, '2026-08-14 00:00:00.000', 560, 0, 'CHALLAN Receipt - INV-1786697783415', NULL, 14, 1, '2026-08-14 08:56:23.452', '2026-08-14 08:56:23.452'),
(89, '2026-08-14 00:00:00.000', 700, 0, 'CHALLAN Receipt - INV-1786698314929', NULL, 14, 1, '2026-08-14 09:05:14.968', '2026-08-14 09:05:14.968'),
(90, '2026-08-14 00:00:00.000', 200, 0, 'SALES Receipt - INV-1786698826979', NULL, 14, 1, '2026-08-14 09:13:47.041', '2026-08-14 09:13:47.041'),
(91, '2026-08-14 00:00:00.000', 200, 0, 'SALES Receipt - INV-1786699288758', NULL, 14, 1, '2026-08-14 09:21:28.917', '2026-08-14 09:21:28.917'),
(92, '2026-08-14 00:00:00.000', 40, 0, 'SALES Receipt - INV-1786699380765', NULL, 14, 1, '2026-08-14 09:23:00.812', '2026-08-14 09:23:00.812'),
(93, '2026-08-14 00:00:00.000', 40, 0, 'SALES Receipt - INV-1786699917191', NULL, 14, 1, '2026-08-14 09:31:57.229', '2026-08-14 09:31:57.229'),
(94, '2026-08-14 00:00:00.000', 180, 0, 'SALES Receipt - INV-1786700010325', NULL, 14, 1, '2026-08-14 09:33:30.364', '2026-08-14 09:33:30.364'),
(95, '2026-08-14 00:00:00.000', 40, 0, 'SALES Receipt - INV-1786700224723', NULL, 14, 1, '2026-08-14 09:37:04.786', '2026-08-14 09:37:04.786'),
(96, '2026-08-14 00:00:00.000', 68, 0, 'PURCHASE Payment - PUR-1786700299042', 14, NULL, 1, '2026-08-14 09:38:19.108', '2026-08-14 09:38:19.108'),
(97, '2026-08-14 00:00:00.000', 15, 0, 'PURCHASE Payment - PUR-1786700531384', 14, NULL, 1, '2026-08-14 09:42:11.431', '2026-08-14 09:42:11.431'),
(98, '2026-08-14 00:00:00.000', 15, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786700817623-655', 14, NULL, 1, '2026-08-14 09:46:57.646', '2026-08-14 09:46:57.646'),
(99, '2026-08-14 00:00:00.000', 728, 0, 'SALES Receipt - INV-1786701654347', NULL, 14, 1, '2026-08-14 10:00:54.591', '2026-08-14 10:00:54.591'),
(100, '2026-08-14 00:00:00.000', 112, 0, 'SALES Receipt - INV-1786701730042', NULL, 14, 1, '2026-08-14 10:02:10.124', '2026-08-14 10:02:10.124'),
(101, '2026-08-14 10:30:19.412', 6560, 0, 'Cash:60:7960 POS Sale - POS-20260814-1786703419412', NULL, 14, 1, '2026-08-14 10:30:19.429', '2026-08-14 10:30:19.429'),
(102, '2026-08-14 10:32:08.530', 560, 0, 'Cash POS Sale - POS-20260814-1786703528530', NULL, 14, 1, '2026-08-14 10:32:08.538', '2026-08-14 10:32:08.538'),
(103, '2026-08-14 00:00:00.000', 460, 0, 'SALES Receipt - INV-1786705409728', NULL, 14, 1, '2026-08-14 11:03:30.232', '2026-08-14 11:03:30.232'),
(104, '2026-08-14 11:30:17.914', 460, 0, 'Cash POS Sale - POS-20260814-1786707017818', NULL, 14, 1, '2026-08-14 11:30:17.915', '2026-08-14 12:13:25.472'),
(105, '2026-08-14 11:31:27.465', 5000, 0, 'Cash POS Sale - POS-20260814-1786707087460', NULL, 14, 1, '2026-08-14 11:31:27.467', '2026-08-14 12:13:25.472'),
(106, '2026-08-14 11:32:45.510', 5000, 0, 'Cash POS Sale - POS-20260814-1786707165505', NULL, 14, 1, '2026-08-14 11:32:45.511', '2026-08-14 12:13:25.472'),
(107, '2026-08-14 11:38:59.425', 600, 0, 'Cash POS Sale - POS-20260814-1786707539418', NULL, 14, 1, '2026-08-14 11:38:59.425', '2026-08-14 12:13:25.472'),
(108, '2026-08-14 00:00:00.000', 780, 0, 'SALES Receipt - INV-1786707591480', NULL, 14, 1, '2026-08-14 11:39:51.562', '2026-08-14 12:13:25.472'),
(109, '2026-08-14 11:48:36.012', 1000, 0, 'Cash POS Sale - POS-20260814-1786708115988', NULL, 14, 1, '2026-08-14 11:48:36.013', '2026-08-14 12:13:25.472'),
(110, '2026-08-14 00:00:00.000', 300, 0, 'SALES Receipt - INV-1786710714260', NULL, 16, 1, '2026-08-14 12:31:54.537', '2026-08-14 12:31:54.537'),
(111, '2026-08-14 00:00:00.000', 200, 0, 'SALES_RETURN Payment - INV-1786711198991', 14, NULL, 1, '2026-08-14 12:39:59.126', '2026-08-14 12:39:59.126'),
(112, '2026-08-14 00:00:00.000', 400, 0, 'SALES Receipt - INV-1786711258110', NULL, 16, 1, '2026-08-14 12:40:58.158', '2026-08-14 12:40:58.158'),
(113, '2026-08-14 12:47:46.975', 200, 0, 'SALES Receipt - INV-1786711346469', NULL, 14, 1, '2026-08-14 12:42:26.520', '2026-08-14 12:47:47.036'),
(114, '2026-08-14 12:49:33.621', 100, 0, 'SALES Receipt - INV-1786711773424', NULL, 14, 1, '2026-08-14 12:49:33.623', '2026-08-14 12:49:33.623'),
(115, '2026-08-15 11:23:02.075', 840, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1786792982031-768', 14, NULL, 1, '2026-08-15 11:23:02.086', '2026-08-15 11:23:02.086'),
(116, '2026-08-15 11:34:06.017', 2240, 0, 'Cash POS Sale - POS-20260815-1786793645962', NULL, 14, 1, '2026-08-15 11:34:06.025', '2026-08-15 11:34:06.025'),
(117, '2026-08-15 11:39:50.593', 2240, 0, 'Cash POS Sale - POS-20260815-1786793990586', NULL, 14, 1, '2026-08-15 11:39:50.594', '2026-08-15 11:39:50.594'),
(118, '2026-08-15 11:49:23.762', 2240, 0, 'Cash POS Sale - POS-20260815-1786794563743', NULL, 14, 1, '2026-08-15 11:49:23.763', '2026-08-15 11:49:23.763'),
(119, '2026-08-18 11:45:41.428', 802, 0, 'PURCHASE Payment - PUR-1787053541365', 14, NULL, 1, '2026-08-18 11:45:41.439', '2026-08-18 11:45:41.439'),
(120, '2026-08-18 11:56:14.220', 503, 0, 'SALES Receipt - INV-1787054174148', NULL, 16, 1, '2026-08-18 11:56:14.221', '2026-08-18 11:56:14.221'),
(121, '2026-08-18 12:06:27.971', 819, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787054787950-776', 16, NULL, 1, '2026-08-18 12:06:27.973', '2026-08-18 12:06:27.973'),
(122, '2026-08-18 12:25:28.693', 193, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787055928673-524', 16, NULL, 1, '2026-08-18 12:25:28.694', '2026-08-18 12:25:28.694'),
(123, '2026-08-18 12:27:10.728', 358, 0, 'SALES Receipt - INV-1787056030694', NULL, 16, 1, '2026-08-18 12:27:10.730', '2026-08-18 12:27:10.730'),
(124, '2026-08-18 12:28:30.682', 526, 0, 'SALES Receipt - INV-1787056110637', NULL, 16, 1, '2026-08-18 12:28:30.684', '2026-08-18 12:28:30.684'),
(125, '2026-08-18 12:37:48.541', 10296, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787056668511-841', 14, NULL, 1, '2026-08-18 12:37:48.542', '2026-08-18 12:37:48.542'),
(126, '2026-08-18 12:42:59.061', 640, 0, 'PURCHASE Payment - PUR-1787056979026', 16, NULL, 1, '2026-08-18 12:42:59.075', '2026-08-18 12:42:59.075'),
(127, '2026-08-18 12:59:18.568', 800, 0, 'PURCHASE_RETURN Receipt - PUR-1787057958511', NULL, 16, 1, '2026-08-18 12:59:18.582', '2026-08-18 12:59:18.582'),
(128, '2026-08-18 13:09:11.044', 134, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787058551024-365', 16, NULL, 1, '2026-08-18 13:09:11.052', '2026-08-18 13:09:11.052'),
(129, '2026-08-18 13:09:49.909', 8240, 0, 'Cash POS Sale - POS-20260818-1787058589885', NULL, 14, 1, '2026-08-18 13:09:49.917', '2026-08-18 13:09:49.917'),
(130, '2026-08-19 06:26:56.468', 840, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787120815750-593', 16, NULL, 1, '2026-08-19 06:26:56.478', '2026-08-19 06:26:56.478'),
(131, '2026-08-19 06:27:36.735', 3360, 0, 'PURCHASE_ORDER Payment - PURCHASE_ORDER-1787120856695-950', 16, NULL, 1, '2026-08-19 06:27:36.746', '2026-08-19 06:27:36.746'),
(132, '2026-08-19 06:30:03.121', 800, 0, 'SALES_RETURN Payment - INV-1787121003045', 16, NULL, 1, '2026-08-19 06:30:03.130', '2026-08-19 06:30:03.130'),
(133, '2026-08-19 11:05:09.053', 4800, 0, 'PURCHASE Payment - PUR-1787137508974', 16, NULL, 1, '2026-08-19 11:05:09.059', '2026-08-19 11:05:09.059');

-- --------------------------------------------------------

--
-- Table structure for table `barcodetemplate`
--

CREATE TABLE `barcodetemplate` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `companyId` int(11) NOT NULL,
  `pageWidth` varchar(191) NOT NULL DEFAULT '50mm',
  `pageHeight` varchar(191) NOT NULL DEFAULT '25mm',
  `labelsInRow` varchar(191) NOT NULL DEFAULT '2',
  `pageBreak` varchar(191) NOT NULL DEFAULT 'YES',
  `leftMargin` varchar(191) NOT NULL DEFAULT '0.5',
  `rightMargin` varchar(191) NOT NULL DEFAULT '0.5',
  `labelGap` varchar(191) NOT NULL DEFAULT '1mm',
  `heightGap` varchar(191) NOT NULL DEFAULT '1mm',
  `grnNumber` tinyint(1) NOT NULL DEFAULT 0,
  `showBrand` tinyint(1) NOT NULL DEFAULT 0,
  `showMRP` tinyint(1) NOT NULL DEFAULT 1,
  `showAdditionalInfo` tinyint(1) NOT NULL DEFAULT 0,
  `showSalePrice` tinyint(1) NOT NULL DEFAULT 1,
  `showWholeSalePrice` tinyint(1) NOT NULL DEFAULT 0,
  `doubleMRP` tinyint(1) NOT NULL DEFAULT 0,
  `crossMRP` tinyint(1) NOT NULL DEFAULT 0,
  `showBorder` tinyint(1) NOT NULL DEFAULT 1,
  `showCategory` tinyint(1) NOT NULL DEFAULT 0,
  `showLocation` tinyint(1) NOT NULL DEFAULT 0,
  `showUnit` tinyint(1) NOT NULL DEFAULT 1,
  `showMultiLine` tinyint(1) NOT NULL DEFAULT 0,
  `showSpecialCommission` tinyint(1) NOT NULL DEFAULT 0,
  `showHeading` tinyint(1) NOT NULL DEFAULT 1,
  `hideBarcode` tinyint(1) NOT NULL DEFAULT 0,
  `showDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `barcodeHeading` varchar(191) DEFAULT '',
  `headingFontSize` varchar(191) DEFAULT '15px',
  `productFontSize` varchar(191) DEFAULT '20px',
  `footerFontSize` varchar(191) DEFAULT '10px',
  `salePriceFontSize` varchar(191) DEFAULT '50px',
  `mrpFontSize` varchar(191) DEFAULT '12px',
  `discountFontSize` varchar(191) DEFAULT '10px',
  `barcodeWidth` varchar(191) DEFAULT '0',
  `barcodeHeight` varchar(191) DEFAULT '0',
  `marginTop` varchar(191) DEFAULT '0mm',
  `marginBottom` varchar(191) DEFAULT '0mm',
  `marginLeft` varchar(191) DEFAULT '0mm',
  `marginRight` varchar(191) DEFAULT '0mm',
  `registerOfficeAddress` varchar(191) DEFAULT 'Hint - Multiple Address Lines',
  `terms` varchar(191) DEFAULT 'Add Terms',
  `barcodeFormat` varchar(191) DEFAULT 'Format 4',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `elements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`elements`)),
  `showBatchNo` tinyint(1) NOT NULL DEFAULT 0,
  `showColor` tinyint(1) NOT NULL DEFAULT 0,
  `showImei` tinyint(1) NOT NULL DEFAULT 0,
  `showSize` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodetemplate`
--

INSERT INTO `barcodetemplate` (`id`, `name`, `companyId`, `pageWidth`, `pageHeight`, `labelsInRow`, `pageBreak`, `leftMargin`, `rightMargin`, `labelGap`, `heightGap`, `grnNumber`, `showBrand`, `showMRP`, `showAdditionalInfo`, `showSalePrice`, `showWholeSalePrice`, `doubleMRP`, `crossMRP`, `showBorder`, `showCategory`, `showLocation`, `showUnit`, `showMultiLine`, `showSpecialCommission`, `showHeading`, `hideBarcode`, `showDiscount`, `barcodeHeading`, `headingFontSize`, `productFontSize`, `footerFontSize`, `salePriceFontSize`, `mrpFontSize`, `discountFontSize`, `barcodeWidth`, `barcodeHeight`, `marginTop`, `marginBottom`, `marginLeft`, `marginRight`, `registerOfficeAddress`, `terms`, `barcodeFormat`, `createdAt`, `updatedAt`, `elements`, `showBatchNo`, `showColor`, `showImei`, `showSize`) VALUES
(1, '50mm X 25mm', 1, '50mm', '25mm', '2', 'YES', '0.5', '0.5', '1mm', '1mm', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 'SWAYAM BILL ', '15px', '20px', '10px', '50px', '12px', '10px', '2', '12', '0mm', '0mm', '0mm', '0mm', 'Hint - Multiple Address Lines', 'Add Terms', 'A4 Sheet', '2026-07-30 07:26:34.922', '2026-08-14 10:37:33.834', '[{\"id\":\"1\",\"type\":\"text\",\"x\":0,\"y\":10,\"width\":280,\"height\":20,\"text\":\"SWAYAM BILL\",\"fontSize\":12,\"field\":\"Company Name\"},{\"id\":\"2\",\"type\":\"text\",\"x\":0,\"y\":36,\"width\":280,\"height\":25,\"text\":\"Product Name\",\"fontSize\":16,\"field\":\"Product Name\"},{\"id\":\"3\",\"type\":\"text\",\"x\":0,\"y\":65,\"width\":140,\"height\":20,\"text\":\"MRP: ₹500\",\"fontSize\":12,\"field\":\"MRP\"},{\"id\":\"1786703779635\",\"type\":\"qrcode\",\"x\":108,\"y\":66,\"width\":60,\"height\":60,\"text\":\"https://google.com\",\"fontSize\":12}]', 0, 0, 0, 0),
(2, 'Custom QR Design', 1, '50mm', '25mm', '2', 'YES', '0.5', '0.5', '1mm', '1mm', 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, '', '15px', '20px', '10px', '50px', '12px', '10px', '0', '0', '0mm', '0mm', '0mm', '0mm', 'Hint - Multiple Address Lines', 'Add Terms', 'Format 4', '2026-08-01 05:47:08.327', '2026-08-03 11:27:39.850', '\"[]\"', 0, 0, 0, 0),
(3, '66mm*34mm', 1, '50mm', '25mm', '2', 'YES', '0.5', '0.5', '1mm', '1mm', 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, '', '15px', '20px', '10px', '50px', '12px', '10px', '0', '0', '0mm', '0mm', '0mm', '0mm', 'Hint - Multiple Address Lines', 'Add Terms', 'Format 4', '2026-08-05 12:40:47.145', '2026-08-05 12:40:47.145', NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE `bom` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bomitem`
--

CREATE TABLE `bomitem` (
  `id` int(11) NOT NULL,
  `bomId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `unit` varchar(191) NOT NULL DEFAULT 'Units',
  `salePrice` double NOT NULL DEFAULT 0,
  `mrp` double NOT NULL DEFAULT 0,
  `wholesale` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `gstin` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `code`, `contact`, `gstin`, `address`, `isActive`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'delhi', '234', '12345112345', 'e.G 1234312342', 'DELHI ', 1, 1, '2026-07-03 05:10:33.586', '2026-07-03 05:10:33.586');

-- --------------------------------------------------------

--
-- Table structure for table `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `voucherNo` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `particular` varchar(191) NOT NULL,
  `accountName` varchar(191) NOT NULL,
  `paymentType` varchar(191) NOT NULL DEFAULT 'Cash',
  `cashIn` double NOT NULL DEFAULT 0,
  `cashOut` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cashbook`
--

INSERT INTO `cashbook` (`id`, `date`, `voucherNo`, `type`, `particular`, `accountName`, `paymentType`, `cashIn`, `cashOut`, `companyId`, `createdAt`, `updatedAt`) VALUES
(2, '2026-08-11 00:00:00.000', 'PAY-5', 'Income', 'Customer Payment Received', 'amul', 'Cash', 65, 0, 1, '2026-08-11 06:21:48.399', '2026-08-11 06:21:48.399'),
(3, '2026-08-11 00:00:00.000', 'PAY-6', 'Expense', 'Customer Refund Paid', 'amul', 'Cash', 0, 65, 1, '2026-08-11 06:22:34.654', '2026-08-11 06:22:34.654'),
(4, '2026-08-11 00:00:00.000', 'PAY-7', 'Expense', 'Customer Refund Paid', 'amul', 'Cash', 0, 100, 1, '2026-08-11 06:23:38.803', '2026-08-11 06:23:38.803'),
(5, '2026-08-11 00:00:00.000', 'PAY-8', 'Expense', 'Customer Refund Paid', 'kiaan', 'Cash', 0, 20, 1, '2026-08-11 06:25:16.002', '2026-08-11 06:25:16.002'),
(6, '2026-08-11 00:00:00.000', 'PAY-9', 'Income', 'Customer Payment Received', 'kiaan', 'Cash', 40, 0, 1, '2026-08-11 06:25:34.154', '2026-08-11 06:25:34.154'),
(7, '2026-08-18 00:00:00.000', 'PAY-10', 'Expense', 'Customer Refund Paid', 'kiaan', 'Cash', 0, 676, 1, '2026-08-18 13:11:41.514', '2026-08-18 13:11:41.514');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `purchaseDiscount` double NOT NULL DEFAULT 0,
  `saleDiscount` double NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `purchaseDiscount`, `saleDiscount`, `isActive`, `companyId`, `createdAt`, `updatedAt`) VALUES
(6, 'Fashion', 0, 0, 1, 1, '2026-07-06 13:13:01.555', '2026-07-06 13:13:01.555'),
(7, 'Footwear', 0, 0, 1, 1, '2026-07-06 13:13:01.639', '2026-07-06 13:13:01.639'),
(8, 'Mobile', 0, 0, 1, 1, '2026-07-06 13:13:01.677', '2026-07-06 13:13:01.677'),
(9, 'Electronics', 0, 0, 1, 1, '2026-07-06 13:13:01.713', '2026-07-06 13:13:01.713'),
(10, 'Grocery', 0, 0, 1, 1, '2026-07-06 13:13:01.741', '2026-07-15 09:51:47.784'),
(11, 'Medical', 0, 0, 1, 1, '2026-07-06 13:13:01.761', '2026-07-06 13:13:01.761'),
(12, 'Cosmetics', 0, 0, 1, 1, '2026-07-06 13:13:01.788', '2026-07-15 09:51:44.103'),
(13, 'Furniture', 0, 0, 1, 1, '2026-07-06 13:13:01.812', '2026-07-06 13:13:01.812'),
(18, 'Books', 0, 0, 1, 1, '2026-07-15 09:51:43.723', '2026-07-15 09:51:43.723'),
(19, 'Datsun', 0, 0, 1, 1, '2026-07-15 09:51:44.987', '2026-07-15 09:51:44.987'),
(20, 'Spares', 0, 0, 1, 1, '2026-07-15 09:51:45.520', '2026-07-15 09:51:45.520'),
(21, 'Hardware', 0, 0, 1, 1, '2026-07-15 09:51:46.905', '2026-07-15 09:51:46.905'),
(23, 'Pestiside', 0, 0, 1, 1, '2026-07-15 09:51:48.790', '2026-07-15 09:51:48.790'),
(41, 'Boys', 0, 0, 1, 3, '2026-07-15 09:51:56.789', '2026-07-15 09:51:56.789'),
(42, 'Books', 0, 0, 1, 3, '2026-07-15 09:51:57.030', '2026-07-15 09:51:57.030'),
(43, 'Cosmetics', 0, 0, 1, 3, '2026-07-15 09:51:57.081', '2026-07-15 09:51:57.081'),
(44, 'Datsun', 0, 0, 1, 3, '2026-07-15 09:51:57.264', '2026-07-15 09:51:57.264'),
(45, 'Spares', 0, 0, 1, 3, '2026-07-15 09:51:57.314', '2026-07-15 09:51:57.314'),
(46, 'Hardware', 0, 0, 1, 3, '2026-07-15 09:51:57.594', '2026-07-15 09:51:57.594'),
(47, 'Pens', 0, 0, 1, 3, '2026-07-15 09:51:57.702', '2026-07-15 09:51:57.702'),
(48, 'Grocery', 0, 0, 1, 3, '2026-07-15 09:51:57.760', '2026-07-15 09:51:57.760'),
(49, 'Pestiside', 0, 0, 1, 3, '2026-07-15 09:51:57.903', '2026-07-15 09:51:57.903'),
(50, 'Womens', 0, 0, 1, 3, '2026-07-15 09:51:58.225', '2026-07-15 09:51:58.225'),
(51, 'Seeds', 0, 0, 1, 3, '2026-07-15 09:51:58.365', '2026-07-15 09:51:58.365'),
(52, 'Tab', 0, 0, 1, 3, '2026-07-15 09:51:58.732', '2026-07-15 09:51:58.732'),
(53, 'New', 10, 10, 1, 3, '2026-07-15 09:51:59.401', '2026-07-15 09:51:59.401'),
(54, 'girlss', 120, 20, 1, 1, '2026-07-29 07:19:20.137', '2026-07-29 07:26:27.584'),
(57, 'boyss', 20, 30, 1, 1, '2026-07-29 07:40:35.932', '2026-07-29 07:40:35.932'),
(59, 'mango', 10, 320, 1, 1, '2026-07-29 09:20:01.728', '2026-07-29 09:20:01.728');

-- --------------------------------------------------------

--
-- Table structure for table `categoryattribute`
--

CREATE TABLE `categoryattribute` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `isRequired` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categoryattribute`
--

INSERT INTO `categoryattribute` (`id`, `name`, `type`, `isRequired`, `order`, `categoryId`, `createdAt`, `updatedAt`, `options`) VALUES
(3, 'Size', 'Multi Select', 0, 1, 6, '2026-07-06 13:13:01.595', '2026-07-06 13:13:01.595', '[\"XS\",\"S\",\"M\",\"L\",\"XL\",\"XXL\"]'),
(4, 'Color', 'Multi Select', 0, 2, 6, '2026-07-06 13:13:01.603', '2026-07-06 13:13:01.603', '[\"Black\",\"White\",\"Blue\",\"Red\",\"Green\",\"Yellow\"]'),
(5, 'Fabric', 'Dropdown', 0, 3, 6, '2026-07-06 13:13:01.622', '2026-07-06 13:13:01.622', '[\"Cotton\",\"Linen\",\"Denim\",\"Silk\",\"Polyester\"]'),
(6, 'Brand', 'Text', 0, 4, 6, '2026-07-06 13:13:01.632', '2026-07-06 13:13:01.632', 'null'),
(7, 'Size', 'Multi Select', 0, 1, 7, '2026-07-06 13:13:01.655', '2026-07-06 13:13:01.655', '[\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\"]'),
(8, 'Color', 'Multi Select', 0, 2, 7, '2026-07-06 13:13:01.663', '2026-07-06 13:13:01.663', '[\"Black\",\"Brown\",\"White\",\"Blue\"]'),
(9, 'Material', 'Dropdown', 0, 3, 7, '2026-07-06 13:13:01.670', '2026-07-06 13:13:01.670', '[\"Leather\",\"Canvas\",\"Rubber\",\"Mesh\"]'),
(10, 'RAM', 'Dropdown', 0, 1, 8, '2026-07-06 13:13:01.685', '2026-07-06 13:13:01.685', '[\"4GB\",\"6GB\",\"8GB\",\"12GB\",\"16GB\"]'),
(11, 'Storage', 'Dropdown', 0, 2, 8, '2026-07-06 13:13:01.693', '2026-07-06 13:13:01.693', '[\"64GB\",\"128GB\",\"256GB\",\"512GB\",\"1TB\"]'),
(12, 'Color', 'Multi Select', 0, 3, 8, '2026-07-06 13:13:01.700', '2026-07-06 13:13:01.700', '[\"Black\",\"Blue\",\"Silver\",\"Gold\",\"Green\"]'),
(13, 'IMEI', 'Text', 0, 4, 8, '2026-07-06 13:13:01.707', '2026-07-06 13:13:01.707', 'null'),
(14, 'Voltage', 'Dropdown', 0, 1, 9, '2026-07-06 13:13:01.720', '2026-07-06 13:13:01.720', '[\"110V\",\"220V\"]'),
(15, 'Warranty', 'Dropdown', 0, 2, 9, '2026-07-06 13:13:01.726', '2026-07-06 13:13:01.726', '[\"6 Months\",\"1 Year\",\"2 Years\",\"3 Years\"]'),
(16, 'Brand', 'Text', 0, 3, 9, '2026-07-06 13:13:01.734', '2026-07-06 13:13:01.734', 'null'),
(17, 'Unit', 'Dropdown', 0, 1, 10, '2026-07-06 13:13:01.748', '2026-07-06 13:13:01.748', '[\"Kg\",\"Gram\",\"Litre\",\"ml\",\"Packet\",\"Piece\"]'),
(18, 'Weight', 'Text', 0, 2, 10, '2026-07-06 13:13:01.754', '2026-07-06 13:13:01.754', 'null'),
(19, 'Batch No', 'Text', 0, 1, 11, '2026-07-06 13:13:01.767', '2026-07-06 13:13:01.767', 'null'),
(20, 'Expiry Date', 'Text', 0, 2, 11, '2026-07-06 13:13:01.775', '2026-07-06 13:13:01.775', 'null'),
(21, 'Manufacturer', 'Text', 0, 3, 11, '2026-07-06 13:13:01.782', '2026-07-06 13:13:01.782', 'null'),
(22, 'Shade', 'Multi Select', 0, 1, 12, '2026-07-06 13:13:01.795', '2026-07-06 13:13:01.795', '[\"Light\",\"Medium\",\"Dark\"]'),
(23, 'Size', 'Dropdown', 0, 2, 12, '2026-07-06 13:13:01.802', '2026-07-06 13:13:01.802', '[\"50ml\",\"100ml\",\"200ml\"]'),
(24, 'Material', 'Dropdown', 0, 1, 13, '2026-07-06 13:13:01.822', '2026-07-06 13:13:01.822', '[\"Wood\",\"Steel\",\"Plastic\",\"Glass\"]'),
(25, 'Color', 'Multi Select', 0, 2, 13, '2026-07-06 13:13:01.830', '2026-07-06 13:13:01.830', '[\"Brown\",\"Black\",\"White\"]'),
(28, 'Composition / Salts (Generic Name)', 'Text', 0, 4, 11, '2026-07-15 09:00:26.442', '2026-07-15 09:00:26.442', 'null'),
(29, 'Potency / Strength (Dose)', 'Text', 0, 5, 11, '2026-07-15 09:00:26.456', '2026-07-15 09:00:26.456', 'null'),
(30, 'Drug Schedule Type', 'Dropdown', 0, 6, 11, '2026-07-15 09:00:26.466', '2026-07-15 09:00:26.466', '[\"Schedule H\",\"Schedule H1\",\"Schedule X\",\"OTC\",\"None\"]'),
(33, 'Part No', 'Text', 0, 1, 20, '2026-07-15 09:51:46.101', '2026-07-15 09:51:46.101', 'null'),
(34, 'Model/Vehicle', 'Text', 0, 2, 20, '2026-07-15 09:51:46.628', '2026-07-15 09:51:46.628', 'null'),
(35, 'Batch No', 'Text', 0, 1, 23, '2026-07-15 09:51:49.230', '2026-07-15 09:51:49.230', 'null'),
(36, 'Expiry Date', 'Text', 0, 2, 23, '2026-07-15 09:51:49.821', '2026-07-15 09:51:49.821', 'null'),
(37, 'Manufacturer', 'Text', 0, 3, 23, '2026-07-15 09:51:50.195', '2026-07-15 09:51:50.195', 'null'),
(71, 'Size', 'Multi Select', 0, 1, 41, '2026-07-15 09:51:56.843', '2026-07-15 09:51:56.843', '[\"XS\",\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"3XL\"]'),
(72, 'Color', 'Multi Select', 0, 2, 41, '2026-07-15 09:51:56.938', '2026-07-15 09:51:56.938', '[\"Black\",\"White\",\"Blue\",\"Red\",\"Green\",\"Yellow\",\"Pink\"]'),
(73, 'Shade', 'Multi Select', 0, 1, 43, '2026-07-15 09:51:57.134', '2026-07-15 09:51:57.134', '[\"Light\",\"Medium\",\"Dark\"]'),
(74, 'Size', 'Dropdown', 0, 2, 43, '2026-07-15 09:51:57.205', '2026-07-15 09:51:57.205', '[\"50ml\",\"100ml\",\"200ml\"]'),
(75, 'Part No', 'Text', 0, 1, 45, '2026-07-15 09:51:57.365', '2026-07-15 09:51:57.365', 'null'),
(76, 'Model/Vehicle', 'Text', 0, 2, 45, '2026-07-15 09:51:57.427', '2026-07-15 09:51:57.427', 'null'),
(77, 'Unit', 'Dropdown', 0, 1, 48, '2026-07-15 09:51:57.809', '2026-07-15 09:51:57.809', '[\"Kg\",\"Gram\",\"Litre\",\"ml\",\"Packet\",\"Piece\"]'),
(78, 'Weight', 'Text', 0, 2, 48, '2026-07-15 09:51:57.856', '2026-07-15 09:51:57.856', 'null'),
(79, 'Batch No', 'Text', 0, 1, 49, '2026-07-15 09:51:58.028', '2026-07-15 09:51:58.028', 'null'),
(80, 'Expiry Date', 'Text', 0, 2, 49, '2026-07-15 09:51:58.125', '2026-07-15 09:51:58.125', 'null'),
(81, 'Manufacturer', 'Text', 0, 3, 49, '2026-07-15 09:51:58.174', '2026-07-15 09:51:58.174', 'null'),
(82, 'Size', 'Multi Select', 0, 1, 50, '2026-07-15 09:51:58.273', '2026-07-15 09:51:58.273', '[\"XS\",\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"3XL\"]'),
(83, 'Color', 'Multi Select', 0, 2, 50, '2026-07-15 09:51:58.320', '2026-07-15 09:51:58.320', '[\"Black\",\"White\",\"Blue\",\"Red\",\"Green\",\"Yellow\",\"Pink\"]'),
(84, 'Batch No', 'Text', 0, 1, 51, '2026-07-15 09:51:58.426', '2026-07-15 09:51:58.426', 'null'),
(85, 'Expiry Date', 'Text', 0, 2, 51, '2026-07-15 09:51:58.551', '2026-07-15 09:51:58.551', 'null'),
(86, 'Manufacturer', 'Text', 0, 3, 51, '2026-07-15 09:51:58.673', '2026-07-15 09:51:58.673', 'null'),
(87, 'Batch No', 'Text', 0, 1, 52, '2026-07-15 09:51:58.780', '2026-07-15 09:51:58.780', 'null'),
(88, 'Expiry Date', 'Text', 0, 2, 52, '2026-07-15 09:51:58.830', '2026-07-15 09:51:58.830', 'null'),
(89, 'Manufacturer', 'Text', 0, 3, 52, '2026-07-15 09:51:58.876', '2026-07-15 09:51:58.876', 'null'),
(90, 'Composition / Salts (Generic Name)', 'Text', 0, 4, 52, '2026-07-15 09:51:58.926', '2026-07-15 09:51:58.926', 'null'),
(91, 'Potency / Strength (Dose)', 'Text', 0, 5, 52, '2026-07-15 09:51:58.985', '2026-07-15 09:51:58.985', 'null'),
(92, 'Drug Schedule Type', 'Dropdown', 0, 6, 52, '2026-07-15 09:51:59.268', '2026-07-15 09:51:59.268', '[\"Schedule H\",\"Schedule H1\",\"Schedule X\",\"OTC\",\"None\"]');

-- --------------------------------------------------------

--
-- Table structure for table `categoryunit`
--

CREATE TABLE `categoryunit` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `unitId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissiontype`
--

CREATE TABLE `commissiontype` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissiontype`
--

INSERT INTO `commissiontype` (`id`, `name`, `isActive`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, '2', 1, 1, '2026-07-04 09:44:16.853', '2026-07-04 09:44:16.853'),
(2, '5', 1, 1, '2026-07-11 06:13:45.226', '2026-07-11 06:13:45.226');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `ownerName` varchar(191) NOT NULL,
  `ownerEmail` varchar(191) NOT NULL,
  `status` enum('ACTIVE','TRIAL','EXPIRED','SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
  `planId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `expireDate` datetime(3) DEFAULT NULL,
  `logo` longtext DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `planType` varchar(191) DEFAULT NULL,
  `startDate` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `ownerName`, `ownerEmail`, `status`, `planId`, `createdAt`, `updatedAt`, `address`, `expireDate`, `logo`, `phone`, `planType`, `startDate`) VALUES
(1, 'kiaan 5', 'Admin', 'admin@gmail.com', 'ACTIVE', 3, '2026-07-02 11:12:05.934', '2026-08-11 09:43:41.231', 'jabalpur', '2030-12-31 00:00:00.000', '', '12345678978', 'Lifetime', '2026-08-11 00:00:00.000'),
(3, 'Demo', 'Demo', 'demo@gmail.com', 'ACTIVE', 1, '2026-07-08 07:01:44.564', '2026-08-11 09:50:22.848', 'Address', '2026-08-27 00:00:00.000', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGB0XGBgXGBgdHxcYGBgYFx8YFxgYHSggGBolHRoVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGC0dHyUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAPsAyQMBIgACEQEDEQH/xAAcAAABBAMBAAAAAAAAAAAAAAADAQIEBQAGBwj/xABEEAABAwEFBQYFAgUCAwgDAAABAAIRAwQSITFBBQZRYXETIoGRofAHMrHB0VLhFCNCYvFygkOSojNTVIOywtLiCBUX/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAEDAgQF/8QAJREAAgMAAgEEAgMBAAAAAAAAAAECAxEhMRIEE0FRIjJSYZEj/9oADAMBAAIRAxEAPwDYw7lCcH8k+EvgsjoGXqBaq+ODSTM4CffirWFgGChSFSrVI/7MjlI/KIL5Hyx4qWAnAJg0iU2Eaa8UcNKICJhLKpAQT2tTtc09pQDQEkIl7ksKAE5hjND7LxUh2CdChQYYshFjJNbmqQY1hzTuzTwViAH2IWdiOCdKcUAJ9BpzQmWIAXWm6OQHGVJSyoCL/Cx/UeGn4T32ac0eE4BXBpQbZ2NWqXRTrFrMnNmMNTLcXYaFVH/86b/4mr/zVP8A5rd4SwphdK6cU5qDTcTBIg6jgeCNTCpBQErmp0LJylAZdTg1JCxpM4oBYWObz5Il2ZhObTzPsIAIAnLxhEa1EDIGGY4lEEIAFxP7PJKarccRAzxCe105RlOB+iAEWLGgqSGyluICM4IYzUiq1CaO8hRISPCIQsuoQG104+/FZCc7A+9VhbkgGFKD5JXNnJYaeYmNPNCiaJ4TDTy9EUhCCAJ0rLv5SwgK2BnMa+Pv6JbmePRKG6Ee/c+SeG4YIURgw99U67glu4zqcE+6CgG9mjBieGJ8ayhBjGjzTyABJwGpWp7z792WyXmhwq1hgKbDkf7jk368lyXbm99ttZN6o9rMxTYbrQOBuwXYcSqkDq28XxCslBxptcKtQaNyBP6nZeC0W2fES1F3cfTY2crwP/qAJHTBaQaz2/MG9CJnzkIzqrKzpLLuQNyBgOAOquAtrZvPaazu9aC3+numAQdCRAHmsobTt9ACoyrUAGvzN6EGQVTvphvykOAOoggn9XEaT9FP2e2bwumm8DiYd4PlsShUbtsX4tObDbTSvaXqZx6w4466rp2wdv2e1sv0Xg6EZEEaFpxBXnmtQFSj2gawOE3g3A4EzLOMQZCjbG2xVs1XtaJgiZbOBBwx4phD07VZqo7Wd7w/Cqd2t7aFsZDHd8Zg81esb3sOC5AxzUoYi3U0jkgBVAhk5Y8dEYj36poHEfdADuYlZURYTSxANBTg1IG4eKczSfeH7oBWpYSka6psOUBAu4D37xRA1NDffvoiRyVKZTpnGfY/KxzDkPfFKySfeKk0wgMY3Bc9+KW9v8KwWai4drUGJ/7thwk/3HGPNbTvfvELFZXVoF6brAdXGYy6SvOVutz61R1Wo4uqPMuJ1/HCFUiMFexkmTxlZfdnieuX4RRUwlxnQCfwhS3h6rshgqH/AApljswqEtdDXaGD9JA9NFBePJXuw4qt7O6C8YtdMGBjAOkZz9lGVDqAIDqdQC9TGZxvM66gYHljzS0iGtY8EwJE/pk/KeOROKFaLQ5rw8gyMHDjpJjIkTlhyIwQRVDDeaL1J3zN4eGhHkVCj7RV7zjhi27GBnUOkdB4FVYMGVOqWcucA0yDiOnj4qLaaME4gxwj/CJoNMmbH2q6g8lhLSRHQyDPovQu6W36drZeYcQACMvc4LzMHEGRh0ldR+D202MqhhMOdgASNQMY54CeQ4JJER2ghDcxSSENzVyABCHCO5qGAgBmE2q8AEnIcEbs8ZSOpoAIH2Rg1BFI8UVkjA+ChTAzJO8UoPPFZcPuUBCjyTmt4Zpo5HxRGPHFUgraeCIWYQPBM7QLGvxnLrqUKct+OtpcG2WlPdJe8jiW3Wg/9TvNcihdW+OtnN+zVJEFr2eIId5YrljmxHn5rtdHLGqTQsjnCQJEx0P2Q6TRPv1xWybLsYDZJaDpdIOusyTlkEbKkQrJZWju1GkAziDHoRE+IUmlYXUTeZFRuYaZa7DJzHDFrh66INpYb17AH+0gT1aQZ8ipOydkVbQ8U2d0TjBdGOt3IeQXDkkuTtRb6IFutIqkuxDsjOfRw/Hootnpvm6JIOBiThzXWNnfDIGLzp56+a2yxbh2dgEsaY5LB+o+kb+x9s5Vsjd2q8BoB7wwfBwGoHnwQt7tznWdl9hJbrPhj74LuNDZlOnIa2P2Vbtuwiox7SJBBXm9+Slp6PZi44ea3Aq73K2n/D2um+MLw0GeQzEjGMufFM2ts4sc9sZOcBxMH8BV1nJY6QMRiPwvoqSkj50ouLPW9Jwc0HiJWEKl3Pr9pZKLy6ZaNSZV1dHRQmDCxNLE5xWSgGFqQtTjUCQu4IBoaluJDVEogUKCFMcEsckRJeCAqnUQePmeicbO08fMolwEY9URXCAhRnCSOmfnonGzC9eM4CBifoiMRiOKA518aNmX7C2o3/hVA4/6XSz0JC4ccYXpXfyz9ps61Nu3j2TiBzb3sPJeayukGSLD2c9+eRAkeImVc2e1VHgMF27w/BzHmq6nZhdB4q12FTF8DmsrJ4tRtXDXjLrZuwy+MMzif8ZroGxNkMogQMdULZVIQIwwVw0GcSvA7HLs+gq1HotbDXxVrfWuUakFWdO0EqpnEokioVArDFEe9Rn1gspGkUc53/2O28XDXHzwK57Us8TAyz6SNeOviu0b2bOdWpzTi83JcitlZ0ljmw4SDpHv7Be3009WHk9RD5O4/Cp07OoiZgEepyw94rbiFpnwju//AK8AT8788pkiRHTzlbo4L0nkYIsSFqfH2Cy7zQgMsHBZdTo9+KwoAZprGsg4IgCWEYBkIfZ8lKazFLKhSpYnNCSJT2+SpDKQz6qQ0IIGPLVHaUAK02IPY5h+VwII5EQvLm8mzHWa1VqLgRceQJGbZwPlC9WdqBnxXLvjru3epMtrGyWG5ViPkdk53R0D/cqnyDlFkfNOOCl7Leb4IUKw0/5c9fRZZtptpzAvE5LGcW9SPRCSWada3fteS2mQRguObO3qcyJouA5fuFumyt7qboBMdfBeN1uPZ7lZGXRs4din2/eCz2ZodWqBojKcT0GZTLGztmlzVpu99PsXXiwF3F2OWg4KLEdPkn1fiDUrkiy2So7g5wgY/RTrNZtpuAe7sWf2uBy6g5wtDqbXt9Hs3sb/AC3GCGNvOA6YgEiYw/C3PZ9baYZSe518Pm8x7WtNMXjdywdLYJE+K1lH8dxGEZflms2CytqXe+ADymPVc3+ItguVm1Gj5xH+4YesjFdgslIlsuEGMgtH+ItgLrPeGdN14cufTJY1vxmmaWLyg0XuzbC+wWUFnavDAXQCAP1GRgHa81udktIqU2vbk4B3n/lUOzNqCtSDajbocAWwSZa8XmnxBCmbo2U07OKZ/wCG97BP6WugegC9FE355pl6muPt7mNP/Uy1GZ8PulITyPfRJdXrPngnMyWQJRQNUwjJUDYSEonv6Jj2qMIfqlTaNOBGPHFP7JAVDU4NTAUZqAxjUVrfRNCeCgDMZoqzfKtTbYbS6qwvp9k681ubgREDgcc9M1aUxihbWol9GqwDFzHNAPNpH3UKeXrHTmgW6yRj1n6IlirMs5F1gc85Too9hLg2qxwIcMSDmCDdIPPAIdBzrwIz0/ZcSW9m8eOjaNk2202i0djWYYJAlrO61sguc44T3JiDnHQ0+9eyX2SrAcC04tIwkTwkkaea27YLat3vEDDTE+ZWtb5uvVBwHHUrKFicsSw3nW1Hd06d8K9pF9IA53VfbybHFoYWkYjEGMitD+DtrxczgfqutVXjVeaSxs2T6f8ARznZ+7FVjhNTIzi2Vt1ioNEXnFzvTyU+2FqFYqbbyn9HberWT6TMMlQbesoc1zTiCMR1W1ubgqDbJEEnRLI4ZVy1lVsCkalKyhp7lFrqbiZxLXQ1g4wPwtysNOGnm4nzWmfDioS+1Use7UDuXeGnDJb61kdPfvxXporfk5mHqLdj4DHgDFY0J7gkYDh7xXrPGNKwBKRwSwgBXcEtxPKUDBRhGNCclAWQgKAIzEBpRqSoCtRWhDYMUdqAfRanVAnUgsqBQHAfiZsP+F2oXARTtLS9vC87B463xe/8wKi2OWl1x7RgV3f4lbCbarBUBH8ykO1pu1a5mJjqJEdF5/s1bvB41zWVq1HoplydSsFiaWA8lzjfgRUgcVvdg2oOy8FzzeaterB2cEkjrgvJSvzPbc/wNn+GgNN0+JXZnU2lgc5wAiV5v2VvFUo1f5bAWnCHYeMiYXQHb30BRYy1htUuF67EtA0EH5itJVvefk5jOLisfR0OtSaRDXB3Q5KK0vpnHLitNsW/1koC7Toim04w1oAxzIAUuz/EWk50EYdPryXDqZ37ketN6pW+QqHeK2/y3Dh+cklDalJ1LtqZEYYfZaTvvtm+40mnWcPL8rhJyfJy8S1Ft8JbbG0K9OSQ+neHVjgI8nE+C6/C4X8ERf2g9xnu0XefaNHqF3eF9KKxHzZvZaMurAE9ISujgGGrIRISEIBhCRmqIQsayJ5qMogCHJ5eqLCW6mA1lpR6RQWDijUmjBTRhJYEVp4ITICM0jPBCh6aVzZTWuCMyEIBtNMOpua4YEEHoRj6Ly3tmzustrrUXaPOka5xoF6tAXEPjpusWVG21gJa6Gv5OyBPUR5K5pU8Zp9HaUMz0VHbrWDiMScv396qJTtGBGiNs+zucS4QA0R5QdfFYxqUdbN5WykkkE2RZHudePUA665cMFvNSy2KpTDajHmqxpxJgScZ7v0Wm7Ls7i+XG91MDphmunbKfTbTbhSYNTgFxZLns9npq4eOsh7P2EHMvNoAti6HVBAxBEAHHXgolu+Hdpe01qXZgt+VgBF6MdcOmC3rY+06VYhjDfgkQMgfotpPdZJ0Cy82ujq1QazDjGwXOZYnh8tioMDpdOQ4LU61qJLnOxLjIn7cslsO+9vuVn0m4NcS4jQySfHEnzWq2GyVLTXFKmDfcbvQZFx6AT+61hHuTPLZPMijrX/4/bLJbaLWRAJ7Jn9wwc4+Bj/mcuwrXdyNmsstAWdnysA8ZmT1n6rYl6ISUlqPJOLi8YixLCWF2cjYWeCcshAMJShOWQoBISXU5YgNXaEem37oAnRSqQXJ0Gb0RWhMYMEducIB7AjtCGwIrGqog4BRtrbNp2ii+jVbeY9pafyDoQcQeIUpqp95t6rJYGF9pqtaYJbTGL38mMGJ65DUhUh5p373OrbNr3Hi9Td8lQZPH/tdyVNZLTHiPMStz35+KFfaLewFKnRoTMQHvMcXuwb/ALQDzK0OpSjLEZhGk+GdRbXJsNiaScNVsVl3eD2SSYwJH+feC1DZtuu5znr4Y+pw0ACvLNvS6Loyy/fkvJOuafB7K7INcnV91LJZ6DAQRlM+hU7efeSlSpwHC8R9Zy45eq41V3sqBpDTpoMc/wDCqdo7adWwvExjMjyxjDElI1N9lndEFtW2mrUvOxcCOJJGXn+F074YbGfRDnPbD3EYuBPdwMN464la/uPuTUrkWioC1odLARnB+YzkJjyXZaFkAjP3y0S+xZ4o5pg98mHp2s0jfu3hEEZYcR5K2s20qTxIeBxDsCPP6qrrMkKI6xAjLX91jC6UOO0dzqjPnpm1sxEjEHGUoXH97dlNsd202WaFUvuO7IloeCCe81pAmRn1Ujdb4l1GAstbXVQHR2jQA4CCe8Ih2XI9V9Gr/rDyieCyPtyxnVwlhV+xtt2e1NvUKrag1AzH+ppxHkrJXMORqyE5YgGrITliA1Zh+v19lSaajtjA+Phj+6lWdpyMeHPkuDsPTZlyUhrU1gVbtzeayWNt60Vms4NmXO5Bje8fKEIXTWqo3k3tsdhbNprNa4iW0x3nu/0sGMczA5rkO93xnrVAadhYaDcjVfBqH/SMWs64nouV1Kr6ji97nPc4yXOJJceLicT4rRRI2dT3r+NNoqgssbP4dhye666qRhjqymM/1HgQuVWu1PqvdUqPc97zLnOJcT1JxOnkhuxKwhdYQSlmpYMwogwKlUQs5mkBzrIYJHD7hC7B3Agq5sNKVNrbLeReAkLH3s4NvZ3krtibvurvANVrfXDkuqbr/DyzUnNqu77gBHC8NQNMVr+6Vjpgy4Q7muobMqANwxWM7ZM2jVFLcJtCiGgBogDAf4UtgQGPUpgXnNGOEDPp4nD6wi0qWfvRDq0LzS3iPI8fBaRvfvYadA2drv5pltVwnugGLo4ud+VtVU7HiMLLFFaUnxF3kFV4o0cWtdgRjLsWyOQmBxJ6LT6vduwAAMXEf1EakjHNEpAmXnPSdBx6pagkHCdF92qqNcfGJ8uyxzesdZKzmPFSk9zH6EGPVvvot+2J8S6zIbaGiqNSO68fZ3p1XOATxRKVYDrGXHw1XUoKXZypNHoTYm8lmtQHZVQXfodg4f7Tn1EhXC8003Oa4OaeciZ9MvNbvsP4iWiiQ2sO2p8Se8P92vjK88qGv1NY2fZ1+Fi17Ze+1irwBVuOOTaguz0ce6fAq/7Zv6h5hYNNdnemvU6a1zfffels5rRHa13QW0g6Ibq95g3RgQMMT4kJvxveywUxAD67x/LYdI/rfH9A4Zk4cSOFWm1vqvfWquL6tR0uc7mNByiIyAwVrr8uWWc8L7bfxE2jac6xosOTKALMOb/n9R0WrOpEy52uJJ16nU8yrChZ9Xe+SBaGl5/tC9KrSRj56VZpycMk6o26FZWez+Sr9oDGFzKOLSqWvCNSGZS0wpLaEN8ElmpS1cqLOvIitapdgIDgH4NOvDryWUKMmFPpWXl55fsnteSL7niza9kbIiCcRx4rbKNgDmxC55sralWgYYZaM6bsW4/pObfotx2LvjQyqtfTOuF4eYx9F4LfSWRerk99Xqq2sfBZ2bZF12SvLK67gh2fbljcJFdniSPqm2nbNkbj/EU/B0/TNYe1P+L/AMNvch9oubC+SrlpgSVzt2/Nnp/9mHVToYut8zj5BUO2N6rRau6TDD/QyQIH6jm5a1eisl2sRhb6mC65Nx3p33awOpWYy7J1XRv+niea5pXJcZcZxnqeJ4+9cnOIjHE6cOvP30QiJ/xwX1qaY1LEfNssc3rCB2BmfRHpAXcvcKE8afRWLWw2Dp5LYzIIbOOKivcQVOpET798ELaFCGEhUBbO68AnPZjjPUffioNgrkePvBWb4ifsgEYQRBII04hO/h28PVAkjpz8ckvb9PM/hMBru2dqVLTWfWqGXPMngBoxo0AGA/MoFjZqeI8MCg08ipdlb80cJ9R+VjBHUmEdLj/b9UtfINGqPVAEDwUaytvVOTc1ocEwUgG5qiFPtK0cFdbStN1pOSDu/ZsL5zOK5ktaR1F4tCW2xXWIGyaALDhMKZtV+CHsZsUSV1nJPgh0WQ7DRSm0kBgx9PVWVOiIlECEWx165eiIwjUJ72wE1p/ZAGDeZjwWBo1J9EpZCxjJ48fuhRad0aTxnFS2VCfxHDw6qCTHFTrE0ESVQNqyNQm05hDtkiBrKLENQhmoz8VZt+QqopE3vfRW9J0tjp4oCs/qjxCsLTRlg5qsthLXyRhP3V5ZwH08FQazabM5mLZgY+qn7NtweIClPpyeOipLXT7CqHgdx3kD9lOil3b6YIygRift4qu/j2fpcptbvU4B+YtHmQ36Eq17Afob5/8A1VbIc5vXYdpqrrZ9LONWn6T9lSvE0XcsVd7BMtYdDgs4dll0RrU+A48ETZbYp3j/AFS49JULagJcKQ/qdB8FM2pWDGhug09AF1vLf0T4IdpJq1G0xjOLugWwhtxoAyA4FQdjWIsaaj/mdny5J1WtMxr9kj9sP6Ie1qvd55KdZqV2gBxVXbGEwOauzhT0wEBF2PggdnJ5Aq0DTEe5VfZRLjh74q1pjrj1VBX1Bx9/lMs4xgI1paZPkk2YzOUAtQAaoraSSq3EhPpuGGKFK2s7vQr+hTApha9UM1ABqfei2K04MjlCgKaZqdFJtNTIKJZRMnifeqfaX4xwVAeztE4hT7K8Y/SFDpsF374/hGsBEjE++qEHbSst4GBjGCbsi0XSBllgpjvnHCFW123K/IoC4tVKDeHylV21LOH0nCMc8NYx/CtRaLhh2LDyy8slloswuyDLYwIKA17YNeW0xnDwIxxgE/ZbL2ruB9Fqm7jP58aCoR/0vWz/AMQOXoiRWc8qgC9HyuBkcDx6Kdu1UmnGrT+6ggQ4jQhH3Xzf1+yyj+yK/wBWEqY2wnRrb3mJ+6yw0TWqGo75GnuzrzQtqHv1Tr2bR5ugqwf3WANwAGnRdLsnwFtdql10ZDPqg08x09lRKGRKm0vm8fsV1pBrqcvGGsqwtB7sDQSZ481Gpceae52B6FUhmzxifvwVgRAUSw69B9SpdZuA6oUi2hmMyk2c3PoiV8gh7PdiUBlaZOJ9EE1DBGqLXOfvVRJ7vmgE2a0utE6CMuStdr1P6feKh7tt7z/eqJbz/MjkoisjUBGY98E1/wA0zqjAY++SZGI98VQTwBA9+SJY8CMfeKBOPvknWY4++SAnMi/65IVvpgkGcipFI4n3wRLQ0QhA7WB7BI8VU1bU6zVGzjRqG6Z/pccvurSxnuqr3sYDZahI0B8QUfWhdjNm2bs7TVyibw6Fjvfgiy3igbJrudZ2OJl1w49GOha3fP6neZTfkH//2Q==', '9876553321', 'Monthly', '2026-07-08 00:00:00.000'),
(4, 'kiaan', 'lalit', 'lalit@gmail.com', 'SUSPENDED', 2, '2026-07-17 07:27:42.461', '2026-07-17 07:39:47.109', '', '2026-09-17 00:00:00.000', '', '234567898', 'Monthly', '2026-07-17 00:00:00.000'),
(5, 'kiann', 'demo ', 'demo1@gmail.com', 'SUSPENDED', 1, '2026-07-17 07:41:21.069', '2026-07-17 11:54:44.992', '', NULL, '', '', '', NULL),
(6, 'kiann', 'jma', 'jma@gmail.com', 'ACTIVE', NULL, '2026-08-11 09:51:47.201', '2026-08-11 09:51:47.201', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'kiaam', 'jmaq', 'jamq@gmail.com', 'ACTIVE', NULL, '2026-08-11 09:53:30.379', '2026-08-11 09:53:30.379', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'kiann', 'satayama ', 'satayma@gmail.com', 'ACTIVE', NULL, '2026-08-11 10:01:56.537', '2026-08-11 10:01:56.537', NULL, NULL, NULL, '1234512345', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companysetting`
--

CREATE TABLE `companysetting` (
  `id` int(11) NOT NULL,
  `quickProduct` tinyint(1) NOT NULL DEFAULT 0,
  `partyFirst` tinyint(1) NOT NULL DEFAULT 0,
  `showShippingParty` tinyint(1) NOT NULL DEFAULT 0,
  `showCompany` tinyint(1) NOT NULL DEFAULT 0,
  `showProductCode` tinyint(1) NOT NULL DEFAULT 0,
  `showBatchNo` tinyint(1) NOT NULL DEFAULT 0,
  `compulsoryBatchNo` tinyint(1) NOT NULL DEFAULT 0,
  `showGST` tinyint(1) NOT NULL DEFAULT 0,
  `showHSN` tinyint(1) NOT NULL DEFAULT 0,
  `showMRP` tinyint(1) NOT NULL DEFAULT 0,
  `showListPrice` tinyint(1) NOT NULL DEFAULT 0,
  `showPurchasePrice` tinyint(1) NOT NULL DEFAULT 0,
  `showDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `hideTotalDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `hideFreightCharge` tinyint(1) NOT NULL DEFAULT 0,
  `showPriceFirst` tinyint(1) NOT NULL DEFAULT 0,
  `showUnit` tinyint(1) NOT NULL DEFAULT 0,
  `showWarning` tinyint(1) NOT NULL DEFAULT 0,
  `negativeStockLock` tinyint(1) NOT NULL DEFAULT 0,
  `useProductCode` tinyint(1) NOT NULL DEFAULT 0,
  `useBarcode` tinyint(1) NOT NULL DEFAULT 0,
  `usePoints` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp` tinyint(1) NOT NULL DEFAULT 0,
  `sendWhatsapp` tinyint(1) NOT NULL DEFAULT 0,
  `sendSms` tinyint(1) NOT NULL DEFAULT 0,
  `mergePartyLedger` tinyint(1) NOT NULL DEFAULT 0,
  `partyTypeBoth` tinyint(1) NOT NULL DEFAULT 0,
  `interestOnInvoices` tinyint(1) NOT NULL DEFAULT 0,
  `voucherHead` varchar(191) DEFAULT NULL,
  `showCustomerChallan` tinyint(1) NOT NULL DEFAULT 1,
  `showCustomerInvoice` tinyint(1) NOT NULL DEFAULT 0,
  `showPurchaseOrder` tinyint(1) NOT NULL DEFAULT 1,
  `showSalesOrder` tinyint(1) NOT NULL DEFAULT 0,
  `currency` varchar(191) DEFAULT NULL,
  `whatsappHost` varchar(191) DEFAULT NULL,
  `lowStockQty` int(11) NOT NULL DEFAULT 5,
  `languagePreference` varchar(191) NOT NULL DEFAULT 'en',
  `invoiceLayout` varchar(191) NOT NULL DEFAULT 'default',
  `taxDisplayOption` varchar(191) NOT NULL DEFAULT 'EXCLUSIVE',
  `barcodeMode` varchar(191) NOT NULL DEFAULT 'MANUAL',
  `defaultQuantity` int(11) NOT NULL DEFAULT 1,
  `defaultWarehouseId` int(11) DEFAULT NULL,
  `defaultTerms` text DEFAULT NULL,
  `remarkSettings` text DEFAULT NULL,
  `extraColumnsName` varchar(191) DEFAULT '',
  `extraColumnsDefault` varchar(191) DEFAULT '',
  `defaultCommission` varchar(191) DEFAULT 'Normal',
  `barcodeHeads` varchar(191) DEFAULT '* M',
  `showSubInventory` tinyint(1) NOT NULL DEFAULT 0,
  `showProductCodeField` tinyint(1) NOT NULL DEFAULT 0,
  `showBrandField` tinyint(1) NOT NULL DEFAULT 0,
  `showCategoryField` tinyint(1) NOT NULL DEFAULT 1,
  `showGstApplicableField` tinyint(1) NOT NULL DEFAULT 1,
  `showHsnField` tinyint(1) NOT NULL DEFAULT 1,
  `showCreditSalePrice` tinyint(1) NOT NULL DEFAULT 0,
  `showWholesalePrice` tinyint(1) NOT NULL DEFAULT 0,
  `showSpecialPrice` tinyint(1) NOT NULL DEFAULT 0,
  `showSuperSpecialPrice` tinyint(1) NOT NULL DEFAULT 0,
  `showOpeningStock` tinyint(1) NOT NULL DEFAULT 0,
  `showMinimumQuantity` tinyint(1) NOT NULL DEFAULT 0,
  `showReorderQuantity` tinyint(1) NOT NULL DEFAULT 0,
  `showAutoQuantity` tinyint(1) NOT NULL DEFAULT 0,
  `showMultiLocation` tinyint(1) NOT NULL DEFAULT 0,
  `showUnitSection` tinyint(1) NOT NULL DEFAULT 1,
  `showBarcodeField` tinyint(1) NOT NULL DEFAULT 1,
  `showPurchasePriceCode` tinyint(1) NOT NULL DEFAULT 1,
  `purchasePriceMarkup` double NOT NULL DEFAULT 0,
  `purchasePriceCodeMap` varchar(191) DEFAULT 'OABCDEFGHI',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `accountingFormat` tinyint(1) NOT NULL DEFAULT 0,
  `autoCreditInvoice` tinyint(1) NOT NULL DEFAULT 0,
  `batchDateInputType` varchar(191) DEFAULT 'Month',
  `billWisePayment` tinyint(1) NOT NULL DEFAULT 0,
  `categoryWiseDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `customerWiseRate` tinyint(1) NOT NULL DEFAULT 0,
  `customerWiseRateType` varchar(191) DEFAULT 'Both',
  `defaultCashPayment` tinyint(1) NOT NULL DEFAULT 0,
  `defaultProductType` varchar(191) DEFAULT 'Product',
  `defaultUnit` varchar(191) DEFAULT 'pcs',
  `discountType` varchar(191) DEFAULT 'Both',
  `filterMethod` varchar(191) DEFAULT 'Default',
  `gstUqc` varchar(191) DEFAULT 'PCS-PIECES',
  `hideExpiryDate` tinyint(1) NOT NULL DEFAULT 0,
  `hideManufactureDate` tinyint(1) NOT NULL DEFAULT 0,
  `invoiceRoundUp` double NOT NULL DEFAULT 0,
  `manualQty` tinyint(1) NOT NULL DEFAULT 0,
  `manufacture` tinyint(1) NOT NULL DEFAULT 0,
  `pointsValue` double NOT NULL DEFAULT 0,
  `qtyWiseRate` tinyint(1) NOT NULL DEFAULT 0,
  `roundUpTo` int(11) NOT NULL DEFAULT 2,
  `saleByCommission` tinyint(1) NOT NULL DEFAULT 0,
  `salePrice` tinyint(1) NOT NULL DEFAULT 0,
  `saleProfit` double NOT NULL DEFAULT 0,
  `setReminderDate` tinyint(1) NOT NULL DEFAULT 0,
  `showBankDetails` tinyint(1) NOT NULL DEFAULT 0,
  `showBranches` tinyint(1) NOT NULL DEFAULT 0,
  `showBrandName` tinyint(1) NOT NULL DEFAULT 0,
  `showCashSalePrice` tinyint(1) NOT NULL DEFAULT 0,
  `showCategory` tinyint(1) NOT NULL DEFAULT 0,
  `showDueDays` tinyint(1) NOT NULL DEFAULT 0,
  `showStockQty` tinyint(1) NOT NULL DEFAULT 0,
  `singlePaymentMode` tinyint(1) NOT NULL DEFAULT 0,
  `tcs` double NOT NULL DEFAULT 0,
  `useStore` tinyint(1) NOT NULL DEFAULT 0,
  `voucherHeads` varchar(191) DEFAULT NULL,
  `wholeSalePrice` tinyint(1) NOT NULL DEFAULT 0,
  `wholeSaleProfit` double NOT NULL DEFAULT 0,
  `paymentReminderEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `complainExtraColumn` text DEFAULT NULL,
  `showTechnician` tinyint(1) NOT NULL DEFAULT 1,
  `printSettings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`printSettings`)),
  `showDiscount2` tinyint(1) NOT NULL DEFAULT 0,
  `primaryOpeningQty` tinyint(1) NOT NULL DEFAULT 0,
  `secOpeningQty` tinyint(1) NOT NULL DEFAULT 0,
  `pUnit` tinyint(1) NOT NULL DEFAULT 0,
  `sUnit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companysetting`
--

INSERT INTO `companysetting` (`id`, `quickProduct`, `partyFirst`, `showShippingParty`, `showCompany`, `showProductCode`, `showBatchNo`, `compulsoryBatchNo`, `showGST`, `showHSN`, `showMRP`, `showListPrice`, `showPurchasePrice`, `showDiscount`, `hideTotalDiscount`, `hideFreightCharge`, `showPriceFirst`, `showUnit`, `showWarning`, `negativeStockLock`, `useProductCode`, `useBarcode`, `usePoints`, `whatsapp`, `sendWhatsapp`, `sendSms`, `mergePartyLedger`, `partyTypeBoth`, `interestOnInvoices`, `voucherHead`, `showCustomerChallan`, `showCustomerInvoice`, `showPurchaseOrder`, `showSalesOrder`, `currency`, `whatsappHost`, `lowStockQty`, `languagePreference`, `invoiceLayout`, `taxDisplayOption`, `barcodeMode`, `defaultQuantity`, `defaultWarehouseId`, `defaultTerms`, `remarkSettings`, `extraColumnsName`, `extraColumnsDefault`, `defaultCommission`, `barcodeHeads`, `showSubInventory`, `showProductCodeField`, `showBrandField`, `showCategoryField`, `showGstApplicableField`, `showHsnField`, `showCreditSalePrice`, `showWholesalePrice`, `showSpecialPrice`, `showSuperSpecialPrice`, `showOpeningStock`, `showMinimumQuantity`, `showReorderQuantity`, `showAutoQuantity`, `showMultiLocation`, `showUnitSection`, `showBarcodeField`, `showPurchasePriceCode`, `purchasePriceMarkup`, `purchasePriceCodeMap`, `companyId`, `createdAt`, `updatedAt`, `accountingFormat`, `autoCreditInvoice`, `batchDateInputType`, `billWisePayment`, `categoryWiseDiscount`, `customerWiseRate`, `customerWiseRateType`, `defaultCashPayment`, `defaultProductType`, `defaultUnit`, `discountType`, `filterMethod`, `gstUqc`, `hideExpiryDate`, `hideManufactureDate`, `invoiceRoundUp`, `manualQty`, `manufacture`, `pointsValue`, `qtyWiseRate`, `roundUpTo`, `saleByCommission`, `salePrice`, `saleProfit`, `setReminderDate`, `showBankDetails`, `showBranches`, `showBrandName`, `showCashSalePrice`, `showCategory`, `showDueDays`, `showStockQty`, `singlePaymentMode`, `tcs`, `useStore`, `voucherHeads`, `wholeSalePrice`, `wholeSaleProfit`, `paymentReminderEnabled`, `complainExtraColumn`, `showTechnician`, `printSettings`, `showDiscount2`, `primaryOpeningQty`, `secOpeningQty`, `pUnit`, `sUnit`) VALUES
(15, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 'INR', NULL, 5, 'en', 'default', 'EXCLUSIVE', 'MANUAL', 1, NULL, NULL, NULL, '', '', 'Normal', '* M', 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 3, 'OABCDEFGHI', 1, '2026-07-02 11:12:05.945', '2026-08-19 11:08:35.111', 0, 0, 'Date', 0, 0, 0, 'Percentage', 0, 'Product', 'pcs', 'Both', 'Default', 'PCS-PIECES', 0, 0, 0, 1, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, NULL, 1, '{\"Income Transaction\":{\"pageSize\":\"4inch\",\"transactionType\":\"General Template\",\"pdfFormat\":\"A4\",\"footerSettings\":{\"showQrCode\":true,\"showHsnSummary\":false,\"showCurrentOutstanding\":false,\"outstandingPosition\":\"After this Transaction\",\"showPaymentDetails\":true,\"labelTermsAndConditions\":\"Terms And Conditions\",\"labelThankYouNote\":\"Thank You Note\"},\"tableSettings\":{\"thItemName\":\"\",\"thHsnSac\":\"\",\"showThHsnSac\":true,\"thGst\":\"\",\"showThGst\":true,\"thQty\":\"\",\"showThQty\":true,\"thRate\":\"\",\"showThRate\":true,\"thDiscount\":\"\",\"showThDiscount\":true,\"thTaxableValue\":\"\",\"showThTaxableValue\":true,\"thTotalAmount\":\"\",\"showThTotalAmount\":true,\"tlIgst\":\"\",\"showTlIgst\":true,\"tlCgst\":\"\",\"showTlCgst\":true,\"tlSgst\":\"\",\"showTlSgst\":true,\"tlCess\":\"\",\"showTlCess\":true,\"tlTcs\":\"\",\"showTlTcs\":true,\"tlRoundOff\":\"\",\"showTlRoundOff\":true},\"headerSettings\":{\"showLogo\":false,\"showMobileNumber\":true,\"showEmail\":true,\"showQrCode\":true,\"labelGstin\":\"GSTIN\",\"labelInvoiceNumber\":\"Invoice Number\",\"labelDate\":\"Date\",\"labelCustomer\":\"Customer\",\"labelAddress\":\"Address\",\"labelPartyContact\":\"Contact Number\",\"labelPartyPan\":\"Pan Number\",\"labelPartyGstin\":\"GSTIN\",\"partyContactNumber\":true,\"partyPanNumber\":true,\"partyGstin\":true,\"customFields\":[{\"name\":\"pass BILL3\",\"value\":\"1\"}],\"showMrp\":true,\"showPrimaryQty\":true,\"showSecondaryQty\":true,\"showDiscount1\":false,\"showDiscount2\":false,\"showDiscount\":true,\"showUnit\":true,\"showCompanyProductCode\":true,\"showBatchNo\":true,\"showHsn\":true,\"showPurchasePrice\":true},\"customization\":{\"thermalMarginRight\":\"0\",\"thermalNumPrint\":\"1\",\"thermalFontWeight\":\"400\",\"headerCompanyNameB\":true,\"headerCompanyNameU\":true,\"headerCompanyNameFontSize\":\"24\",\"headerCompanyAddressFontSize\":\"13\",\"headerLabelsFontSize\":\"11\",\"headerContentsFontSize\":\"11\",\"tableHeadingsFontSize\":\"11\",\"tableContentsFontSize\":\"11\",\"tableDescriptionFontSize\":\"9\",\"tableTotalFontSize\":\"13\",\"footerHeadingsFontSize\":\"11\",\"footerContentsFontSize\":\"11\",\"footerTermsFontSize\":\"12\",\"footerNoteFontSize\":\"12\"}},\"bankDetails\":{\"bankName\":\"sbi bank of india\",\"bankAccountName\":\"1213243543454\",\"bankBranch\":\"karanatak\",\"bankIfsc\":\"acb4657574232\",\"bankAccountNo\":\"5346757\",\"upiId\":\"4254\"},\"Estimate / Quote\":{\"pageSize\":\"2inch\",\"transactionType\":\"General Template\",\"pdfFormat\":\"A4\",\"footerSettings\":{\"showQrCode\":true,\"showHsnSummary\":false,\"showCurrentOutstanding\":false,\"outstandingPosition\":\"After this Transaction\",\"showPaymentDetails\":true,\"labelTermsAndConditions\":\"Terms And Conditions\",\"labelThankYouNote\":\"Thank You Note\"},\"tableSettings\":{\"thItemName\":\"\",\"thHsnSac\":\"\",\"showThHsnSac\":true,\"thGst\":\"\",\"showThGst\":true,\"thQty\":\"\",\"showThQty\":true,\"thRate\":\"\",\"showThRate\":true,\"thDiscount\":\"\",\"showThDiscount\":true,\"thTaxableValue\":\"\",\"showThTaxableValue\":true,\"thTotalAmount\":\"\",\"showThTotalAmount\":true,\"tlIgst\":\"\",\"showTlIgst\":true,\"tlCgst\":\"\",\"showTlCgst\":true,\"tlSgst\":\"\",\"showTlSgst\":true,\"tlCess\":\"\",\"showTlCess\":true,\"tlTcs\":\"\",\"showTlTcs\":true,\"tlRoundOff\":\"\",\"showTlRoundOff\":true},\"headerSettings\":{\"showLogo\":false,\"showMobileNumber\":true,\"showEmail\":true,\"showQrCode\":true,\"labelGstin\":\"GSTIN\",\"labelInvoiceNumber\":\"Invoice Number\",\"labelDate\":\"Date\",\"labelCustomer\":\"Customer\",\"labelAddress\":\"Address\",\"labelPartyContact\":\"Contact Number\",\"labelPartyPan\":\"Pan Number\",\"labelPartyGstin\":\"GSTIN\",\"partyContactNumber\":true,\"partyPanNumber\":true,\"partyGstin\":true,\"customFields\":[{\"name\":\"pass BILL3\",\"value\":\"1\"}],\"showMrp\":false,\"showPrimaryQty\":false,\"showSecondaryQty\":false,\"showDiscount1\":false,\"showDiscount2\":false,\"showDiscount\":false,\"showUnit\":false,\"showCompanyProductCode\":true,\"showBatchNo\":false,\"showHsn\":true,\"showPurchasePrice\":true},\"customization\":{\"thermalMarginRight\":\"0\",\"thermalNumPrint\":\"1\",\"thermalFontWeight\":\"400\",\"headerCompanyNameB\":true,\"headerCompanyNameU\":true,\"headerCompanyNameFontSize\":\"24\",\"headerCompanyAddressFontSize\":\"13\",\"headerLabelsFontSize\":\"11\",\"headerContentsFontSize\":\"11\",\"tableHeadingsFontSize\":\"11\",\"tableContentsFontSize\":\"11\",\"tableDescriptionFontSize\":\"9\",\"tableTotalFontSize\":\"13\",\"footerHeadingsFontSize\":\"11\",\"footerContentsFontSize\":\"11\",\"footerTermsFontSize\":\"12\",\"footerNoteFontSize\":\"12\"}},\"Delivery Challan\":{\"pageSize\":\"2inch\",\"transactionType\":\"General Template\",\"pdfFormat\":\"A5\",\"footerSettings\":{\"showQrCode\":true,\"showHsnSummary\":false,\"showCurrentOutstanding\":false,\"outstandingPosition\":\"After this Transaction\",\"showPaymentDetails\":true,\"labelTermsAndConditions\":\"Terms And Conditions\",\"labelThankYouNote\":\"Thank You Note\"},\"tableSettings\":{\"thItemName\":\"\",\"thHsnSac\":\"\",\"showThHsnSac\":true,\"thGst\":\"\",\"showThGst\":true,\"thQty\":\"\",\"showThQty\":true,\"thRate\":\"\",\"showThRate\":true,\"thDiscount\":\"\",\"showThDiscount\":true,\"thTaxableValue\":\"\",\"showThTaxableValue\":true,\"thTotalAmount\":\"\",\"showThTotalAmount\":true,\"tlIgst\":\"\",\"showTlIgst\":true,\"tlCgst\":\"\",\"showTlCgst\":true,\"tlSgst\":\"\",\"showTlSgst\":true,\"tlCess\":\"\",\"showTlCess\":true,\"tlTcs\":\"\",\"showTlTcs\":true,\"tlRoundOff\":\"\",\"showTlRoundOff\":true},\"headerSettings\":{\"showLogo\":false,\"showMobileNumber\":true,\"showEmail\":true,\"showQrCode\":true,\"labelGstin\":\"GSTIN\",\"labelInvoiceNumber\":\"Invoice Number\",\"labelDate\":\"Date\",\"labelCustomer\":\"Customer\",\"labelAddress\":\"Address\",\"labelPartyContact\":\"Contact Number\",\"labelPartyPan\":\"Pan Number\",\"labelPartyGstin\":\"GSTIN\",\"partyContactNumber\":true,\"partyPanNumber\":true,\"partyGstin\":true,\"customFields\":[{\"name\":\"pass BILL3\",\"value\":\"1\"}],\"showMrp\":false,\"showPrimaryQty\":false,\"showSecondaryQty\":true,\"showDiscount1\":false,\"showDiscount2\":false,\"showDiscount\":false,\"showUnit\":false,\"showCompanyProductCode\":false,\"showBatchNo\":false,\"showHsn\":true,\"showPurchasePrice\":true},\"customization\":{\"thermalMarginRight\":\"0\",\"thermalNumPrint\":\"1\",\"thermalFontWeight\":\"400\",\"headerCompanyNameB\":true,\"headerCompanyNameU\":true,\"headerCompanyNameFontSize\":\"24\",\"headerCompanyAddressFontSize\":\"13\",\"headerLabelsFontSize\":\"11\",\"headerContentsFontSize\":\"11\",\"tableHeadingsFontSize\":\"11\",\"tableContentsFontSize\":\"11\",\"tableDescriptionFontSize\":\"9\",\"tableTotalFontSize\":\"13\",\"footerHeadingsFontSize\":\"11\",\"footerContentsFontSize\":\"11\",\"footerTermsFontSize\":\"12\",\"footerNoteFontSize\":\"12\"}}}', 0, 1, 1, 1, 1),
(16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, NULL, NULL, 5, 'en', 'default', 'EXCLUSIVE', 'MANUAL', 1, NULL, NULL, NULL, '', '', 'Normal', '* M', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 'OABCDEFGHI', 5, '2026-07-17 07:41:21.083', '2026-07-17 07:41:21.083', 0, 0, 'Month', 0, 0, 0, 'Both', 0, 'Product', 'pcs', 'Both', 'Default', 'PCS-PIECES', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, NULL, NULL, 5, 'en', 'default', 'EXCLUSIVE', 'MANUAL', 1, NULL, NULL, NULL, '', '', 'Normal', '* M', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 'OABCDEFGHI', 6, '2026-08-11 09:51:47.246', '2026-08-11 09:51:47.246', 0, 0, 'Month', 0, 0, 0, 'Both', 0, 'Product', 'pcs', 'Both', 'Default', 'PCS-PIECES', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, NULL, NULL, 5, 'en', 'default', 'EXCLUSIVE', 'MANUAL', 1, NULL, NULL, NULL, '', '', 'Normal', '* M', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 'OABCDEFGHI', 7, '2026-08-11 09:53:30.488', '2026-08-11 09:53:30.488', 0, 0, 'Month', 0, 0, 0, 'Both', 0, 'Product', 'pcs', 'Both', 'Default', 'PCS-PIECES', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, NULL, NULL, 5, 'en', 'default', 'EXCLUSIVE', 'MANUAL', 1, NULL, NULL, NULL, '', '', 'Normal', '* M', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 'OABCDEFGHI', 8, '2026-08-11 10:01:56.590', '2026-08-11 10:01:56.590', 0, 0, 'Month', 0, 0, 0, 'Both', 0, 'Product', 'pcs', 'Both', 'Default', 'PCS-PIECES', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `complainDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `partyName` varchar(191) DEFAULT NULL,
  `productName` varchar(191) DEFAULT NULL,
  `technicianName` varchar(191) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `serviceAmount` double NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `complainDate`, `partyName`, `productName`, `technicianName`, `details`, `serviceAmount`, `remark`, `location`, `status`, `companyId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, '2026-07-11 00:00:00.000', 'Rahul Traders1', 'amul milk', 'demo ', 'fdsdf', 320, 'fsd', 'indore', 'Pending', 1, '2026-07-10 10:34:02.332', '2026-07-10 10:34:02.332', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `gstin` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `partyTags` varchar(191) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `type` varchar(191) NOT NULL DEFAULT 'CUSTOMER',
  `dueDays` int(11) DEFAULT 7,
  `drugLicense` varchar(191) DEFAULT NULL,
  `pinCode` varchar(191) DEFAULT NULL,
  `gstApplicable` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `partyType` varchar(191) DEFAULT NULL,
  `otherMobileNo` varchar(191) DEFAULT NULL,
  `partyLimit` double DEFAULT 0,
  `interestRate` double DEFAULT 0,
  `loyaltyPoints` int(11) DEFAULT 0,
  `joiningDate` varchar(191) DEFAULT NULL,
  `wholeParty` tinyint(1) DEFAULT 0,
  `sezParty` tinyint(1) DEFAULT 0,
  `focParty` tinyint(1) DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `phone`, `address`, `city`, `gstin`, `mobile`, `partyTags`, `balance`, `status`, `type`, `dueDays`, `drugLicense`, `pinCode`, `gstApplicable`, `state`, `email`, `partyType`, `otherMobileNo`, `partyLimit`, `interestRate`, `loyaltyPoints`, `joiningDate`, `wholeParty`, `sezParty`, `focParty`, `companyId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(21, 'kiaan', '12345689776', '', 'indore', '', '12345689776', 'ftjg', 47648, 'Active', 'COMPANY', 2, '', '', 'GST', 'Karnataka', NULL, 'company', '', 0, 0, 4429, '2026-06-04', 0, 0, 0, 1, '2026-08-06 10:43:21.335', '2026-08-19 11:05:09.050', NULL),
(22, 'amul', '1234512345', '', 'ibdore', '', '1234512345', 'refger', 28037, 'Active', 'CUSTOMER', 2, '', '', 'GST', 'Karnataka', NULL, 'customer', '', 0, 0, 1300, '2026-06-04', 0, 0, 0, 1, '2026-08-06 10:48:45.358', '2026-08-19 06:30:03.114', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customerpayment`
--

CREATE TABLE `customerpayment` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `amount` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `paymentType` varchar(191) NOT NULL DEFAULT 'IN',
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash',
  `remark` varchar(191) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customerpayment`
--

INSERT INTO `customerpayment` (`id`, `date`, `amount`, `discount`, `paymentType`, `paymentMode`, `remark`, `customerId`, `companyId`, `createdAt`, `updatedAt`) VALUES
(5, '2026-08-11 00:00:00.000', 65, 0, 'IN', 'Cash', NULL, 22, 1, '2026-08-11 06:21:48.361', '2026-08-11 06:21:48.361'),
(6, '2026-08-11 00:00:00.000', 65, 0, 'OUT', 'Cash', NULL, 22, 1, '2026-08-11 06:22:34.639', '2026-08-11 06:22:34.639'),
(7, '2026-08-11 00:00:00.000', 100, 0, 'OUT', 'Cash', NULL, 22, 1, '2026-08-11 06:23:38.798', '2026-08-11 06:23:38.798'),
(8, '2026-08-11 00:00:00.000', 20, 0, 'OUT', 'Cash', NULL, 21, 1, '2026-08-11 06:25:15.982', '2026-08-11 06:25:15.982'),
(9, '2026-08-11 00:00:00.000', 40, 0, 'IN', 'Cash', NULL, 21, 1, '2026-08-11 06:25:34.149', '2026-08-11 06:25:34.149'),
(10, '2026-08-18 00:00:00.000', 676, 767, 'OUT', 'Cash', NULL, 21, 1, '2026-08-18 13:11:41.481', '2026-08-18 13:11:41.481');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `joiningDate` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `paidHoliday` int(11) NOT NULL DEFAULT 0,
  `commission` double NOT NULL DEFAULT 0,
  `specialCommission` double NOT NULL DEFAULT 0,
  `totalSaleCommission` double NOT NULL DEFAULT 0,
  `commissionOnManufacturing` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employeetransaction`
--

CREATE TABLE `employeetransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `amount` double NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `remark` varchar(191) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `employeeId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `head` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `name`, `head`, `type`, `isActive`, `companyId`, `createdAt`, `updatedAt`, `balance`) VALUES
(7, 'sdfsdfgds', 'fgrdg', 'Operating Expenses', 1, 1, '2026-08-07 08:48:24.042', '2026-08-14 06:39:27.018', -9918);

-- --------------------------------------------------------

--
-- Table structure for table `expensetransaction`
--

CREATE TABLE `expensetransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expenseAmount` double NOT NULL DEFAULT 0,
  `paidAmount` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `remark` varchar(191) DEFAULT NULL,
  `expenseId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expensetransaction`
--

INSERT INTO `expensetransaction` (`id`, `date`, `expenseAmount`, `paidAmount`, `discount`, `remark`, `expenseId`, `companyId`, `createdAt`, `updatedAt`, `paymentMode`) VALUES
(3, '2026-08-14 00:00:00.000', 0, 787, 788, 'wd', 7, 1, '2026-08-14 06:39:20.818', '2026-08-14 06:39:20.818', 'Cash'),
(4, '2026-08-14 00:00:00.000', 0, 676, 7667, '', 7, 1, '2026-08-14 06:39:27.014', '2026-08-14 06:39:27.014', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `followup`
--

CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `reminderDate` varchar(191) NOT NULL,
  `customerId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `head` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incometransaction`
--

CREATE TABLE `incometransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `incomeAmount` double NOT NULL DEFAULT 0,
  `paidAmount` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `remark` varchar(191) DEFAULT NULL,
  `incomeId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoiceNo` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `type` enum('PURCHASE_ORDER','PURCHASE','PURCHASE_RETURN','SALES','SALES_RETURN','CHALLAN','STOCK_TRANSFER','QUOTATION','ADJUSTMENT') NOT NULL DEFAULT 'SALES',
  `subTotal` double NOT NULL DEFAULT 0,
  `totalDiscount` double NOT NULL DEFAULT 0,
  `freightCharges` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL DEFAULT 0,
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash',
  `remark` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'PAID',
  `companyId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `toWarehouseId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `totalCgst` double NOT NULL DEFAULT 0,
  `totalIgst` double NOT NULL DEFAULT 0,
  `totalSgst` double NOT NULL DEFAULT 0,
  `totalGstAmount` double NOT NULL DEFAULT 0,
  `tcsAmount` double NOT NULL DEFAULT 0,
  `deletedAt` datetime(3) DEFAULT NULL,
  `commission` double DEFAULT 0,
  `salesperson` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoiceNo`, `date`, `type`, `subTotal`, `totalDiscount`, `freightCharges`, `totalAmount`, `paymentMode`, `remark`, `status`, `companyId`, `customerId`, `warehouseId`, `toWarehouseId`, `createdAt`, `updatedAt`, `totalCgst`, `totalIgst`, `totalSgst`, `totalGstAmount`, `tcsAmount`, `deletedAt`, `commission`, `salesperson`) VALUES
(251, 'PUR-1786013135983', '2026-08-06 00:00:00.000', 'PURCHASE', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-06 10:45:36.028', '2026-08-06 10:45:36.028', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, NULL, 0, NULL),
(252, 'INV-1786013351756', '2026-08-06 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-06 10:49:11.788', '2026-08-08 06:50:28.831', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, '2026-08-08 06:50:28.830', 0, NULL),
(253, 'POS-20260806-1786015184283', '2026-08-06 11:19:44.283', 'SALES', 0, 0, 0, 2740, 'Cash:2740', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:19:44.301', '2026-08-11 07:55:33.778', 0, 0, 0, 0, 0, '2026-08-11 07:55:33.777', 0, NULL),
(254, 'POS-20260806-1786015459255', '2026-08-06 11:24:19.255', 'SALES', 0, 0, 0, 780, 'Cash:780', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:24:19.256', '2026-08-11 07:55:31.883', 0, 0, 0, 0, 0, '2026-08-11 07:55:31.881', 0, NULL),
(255, 'POS-20260806-1786015470457', '2026-08-06 11:24:30.457', 'SALES', 0, 35, 0, 665, 'Cash:665', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:24:30.458', '2026-08-11 07:55:29.915', 0, 0, 0, 0, 0, '2026-08-11 07:55:29.913', 0, NULL),
(256, 'POS-20260806-1786015482697', '2026-08-06 11:24:42.697', 'SALES', 0, 35, 0, 665, 'Cash:665', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:24:42.698', '2026-08-11 07:55:28.043', 0, 0, 0, 0, 0, '2026-08-11 07:55:28.042', 0, NULL),
(257, 'POS-20260806-1786015500458', '2026-08-06 11:25:00.458', 'SALES', 0, 35, 0, 665, 'Cash:665', NULL, 'PAID', 1, 22, NULL, NULL, '2026-08-06 11:25:00.459', '2026-08-11 07:55:22.651', 0, 0, 0, 0, 0, '2026-08-11 07:55:22.649', 0, NULL),
(258, 'POS-20260806-1786015873098', '2026-08-06 11:31:13.098', 'SALES', 0, 35, 0, 665, 'Cash:665', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:31:13.100', '2026-08-11 07:55:20.748', 0, 0, 0, 0, 0, '2026-08-11 07:55:20.746', 0, NULL),
(259, 'POS-20260806-1786015957621', '2026-08-06 11:32:37.621', 'SALES', 0, 7, 0, 693, 'Cash:693', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-06 11:32:37.623', '2026-08-11 07:55:19.083', 0, 0, 0, 0, 0, '2026-08-11 07:55:19.081', 0, NULL),
(260, 'POS-20260806-1786017597065', '2026-08-06 11:59:57.065', 'SALES', 0, 0, 0, 1480, 'Cash:1480', NULL, 'PAID', 1, 22, NULL, NULL, '2026-08-06 11:59:57.067', '2026-08-07 07:49:50.755', 0, 0, 0, 0, 0, '2026-08-07 07:49:50.741', 0, NULL),
(262, 'PUR-1786089116340', '2026-08-07 00:00:00.000', 'PURCHASE', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-07 07:51:56.419', '2026-08-08 05:28:20.699', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, '2026-08-08 05:28:20.698', 0, NULL),
(263, 'PURCHASE_ORDER-1786089152855-663', '2026-08-07 00:00:00.000', 'PURCHASE_ORDER', 3360, 0, 0, 3360, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-07 07:52:32.862', '2026-08-07 07:52:32.862', 0, 0, 0, 0, 0, NULL, 0, NULL),
(264, 'PUR-1786089275098', '2026-08-07 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-07 07:54:35.122', '2026-08-07 07:54:35.122', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(265, 'POS-20260807-1786089297348', '2026-08-07 07:54:57.348', 'SALES', 0, 0, 0, 2740, 'UPI:2740', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-07 07:54:57.350', '2026-08-08 05:20:56.482', 0, 0, 0, 0, 0, '2026-08-08 05:20:56.478', 0, NULL),
(266, 'PUR-1786089323586', '2026-08-07 00:00:00.000', 'PURCHASE_RETURN', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-07 07:55:23.609', '2026-08-08 05:26:01.948', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(267, 'INV-1786089361490', '2026-08-07 00:00:00.000', 'SALES_RETURN', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-07 07:56:01.516', '2026-08-08 06:12:26.162', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, '2026-08-08 06:12:26.160', 0, NULL),
(268, 'PUR-1786091677827', '2026-08-07 00:00:00.000', 'PURCHASE_RETURN', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-07 08:34:37.907', '2026-08-08 06:12:13.966', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, '2026-08-08 06:12:13.963', 0, NULL),
(269, 'PUR-1786170198490', '2026-08-08 00:00:00.000', 'PURCHASE_RETURN', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 06:23:18.570', '2026-08-08 06:23:18.570', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, NULL, 0, NULL),
(270, 'PUR-1786188111476', '2026-08-08 00:00:00.000', 'PURCHASE', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:21:51.506', '2026-08-08 11:21:51.506', 31.81818181818187, 0, 31.81818181818187, 63.63636363636374, 0, NULL, 0, NULL),
(271, 'PUR-1786188751644', '2026-08-08 00:00:00.000', 'PURCHASE', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:32:31.665', '2026-08-08 11:32:31.665', 31.81818181818187, 0, 31.81818181818187, 63.63636363636374, 0, NULL, 0, NULL),
(272, 'PUR-1786189003497', '2026-08-08 00:00:00.000', 'PURCHASE', 747.3684210526317, 0, 0, 747.3684210526317, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:36:43.519', '2026-08-08 11:36:43.519', 33.97129186602876, 0, 33.97129186602876, 67.94258373205753, 0, NULL, 0, NULL),
(273, 'PUR-1786189101919', '2026-08-08 00:00:00.000', 'PURCHASE', 720, 0, 0, 720, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:38:21.940', '2026-08-08 11:38:21.940', 32.72727272727275, 0, 32.72727272727275, 65.4545454545455, 0, NULL, 0, NULL),
(274, 'PUR-1786189264613', '2026-08-08 00:00:00.000', 'PURCHASE', 3684.21052631579, 0, 0, 3684.21052631579, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:41:04.653', '2026-08-08 11:41:04.653', 167.4641148325361, 0, 167.4641148325361, 334.9282296650722, 0, NULL, 0, NULL),
(275, 'PUR-1786189343348', '2026-08-08 00:00:00.000', 'PURCHASE', 3789.473684210526, 0, 0, 3789.473684210526, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:42:23.368', '2026-08-08 11:42:23.368', 172.2488038277513, 0, 172.2488038277513, 344.4976076555026, 0, NULL, 0, NULL),
(276, 'PUR-1786189641377', '2026-08-08 00:00:00.000', 'PURCHASE', 3684.21052631579, 0, 0, 3684.21052631579, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-08 11:47:21.397', '2026-08-08 11:47:21.397', 167.4641148325361, 0, 167.4641148325361, 334.9282296650722, 0, NULL, 0, NULL),
(277, 'PUR-1786426910008', '2026-08-11 00:00:00.000', 'PURCHASE', 3684.21052631579, 0, 0, 3684.21052631579, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 05:41:50.100', '2026-08-11 05:41:50.100', 167.4641148325361, 0, 167.4641148325361, 334.9282296650722, 0, NULL, 0, NULL),
(278, 'PUR-1786427039191', '2026-08-11 00:00:00.000', 'PURCHASE', 3610.526315789474, 0, 0, 3610.526315789474, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 05:43:59.213', '2026-08-11 05:43:59.213', 164.1148325358854, 0, 164.1148325358854, 328.2296650717708, 0, NULL, 0, NULL),
(279, 'PUR-1786427850017', '2026-08-11 00:00:00.000', 'PURCHASE', 4400, 0, 0, 4400, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 05:57:30.044', '2026-08-11 05:57:30.044', 104.761904761905, 0, 104.761904761905, 209.5238095238101, 0, NULL, 0, NULL),
(280, 'INV-1786433574263', '2026-08-11 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 07:32:54.342', '2026-08-11 07:53:06.587', 0, 0, 0, 0, 0, '2026-08-11 07:53:06.584', 0, NULL),
(281, 'INV-1786433967900', '2026-08-11 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 07:39:27.931', '2026-08-11 07:55:15.180', 0, 0, 0, 0, 0, '2026-08-11 07:55:15.179', 0, NULL),
(282, 'INV-1786434870053', '2026-08-11 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 07:54:30.079', '2026-08-11 07:55:17.243', 0, 0, 0, 0, 0, '2026-08-11 07:55:17.241', 0, NULL),
(283, 'INV-1786434978060', '2026-08-11 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 07:56:18.086', '2026-08-14 07:57:25.168', 0, 0, 0, 0, 0, '2026-08-14 07:57:25.167', 0, NULL),
(284, 'PURCHASE_ORDER-1786437311076-366', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 560, 0, 0, 560, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 08:35:11.086', '2026-08-11 08:35:11.086', 0, 0, 0, 0, 0, NULL, 0, NULL),
(285, 'PUR-1786437422829', '2026-08-11 00:00:00.000', 'PURCHASE', 560, 0, 0, 560, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 08:37:02.851', '2026-08-11 08:37:02.851', 0, 0, 0, 0, 0, NULL, 0, NULL),
(286, 'PUR-1786445859269', '2026-08-11 00:00:00.000', 'PURCHASE', 550, 0, 0, 550, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 10:57:39.357', '2026-08-11 10:57:39.357', 0, 0, 0, 0, 0, NULL, 0, NULL),
(287, 'PUR-1786446295050', '2026-08-11 00:00:00.000', 'PURCHASE', 110, 0, 0, 110, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:04:55.127', '2026-08-11 11:04:55.127', 0, 0, 0, 0, 0, NULL, 0, NULL),
(288, 'PUR-1786447475225', '2026-08-11 00:00:00.000', 'PURCHASE', 550, 0, 0, 550, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:24:35.296', '2026-08-11 11:24:35.296', 0, 0, 0, 0, 0, NULL, 0, NULL),
(289, 'PUR-1786448100285', '2026-08-11 00:00:00.000', 'PURCHASE', 1200, 0, 0, 1200, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:35:00.400', '2026-08-11 11:35:00.400', 0, 0, 0, 0, 0, NULL, 0, NULL),
(290, 'PUR-1786448309571', '2026-08-11 00:00:00.000', 'PURCHASE', 210, 0, 0, 210, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:38:29.665', '2026-08-11 11:38:29.665', 0, 0, 0, 0, 0, NULL, 0, NULL),
(291, 'PUR-1786448371047', '2026-08-11 00:00:00.000', 'PURCHASE', 300, 0, 0, 300, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:39:31.071', '2026-08-11 11:39:31.071', 8.490566037735846, 0, 8.490566037735846, 16.98113207547169, 0, NULL, 0, NULL),
(292, 'PUR-1786448503489', '2026-08-11 00:00:00.000', 'PURCHASE', 120, 0, 0, 120, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 11:41:43.519', '2026-08-11 11:41:43.519', 3.39622641509434, 0, 3.39622641509434, 6.79245283018868, 0, NULL, 0, NULL),
(293, 'PURCHASE_ORDER-1786448834348-187', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 3500, 0, 0, 3500, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 11:47:14.363', '2026-08-11 11:47:14.363', 0, 0, 0, 0, 0, NULL, 0, NULL),
(294, 'PUR-1786450291156', '2026-08-11 00:00:00.000', 'PURCHASE_RETURN', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 12:11:31.230', '2026-08-11 12:11:31.230', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(295, 'INV-1786450373435', '2026-08-11 00:00:00.000', 'SALES_RETURN', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 12:12:53.471', '2026-08-11 12:12:53.471', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(296, 'PURCHASE_ORDER-1786453104177-437', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 12:58:24.201', '2026-08-11 12:58:24.201', 0, 0, 0, 0, 0, NULL, 0, NULL),
(297, 'PURCHASE_ORDER-1786453428784-805', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 13:03:48.812', '2026-08-11 13:03:48.812', 0, 0, 0, 0, 0, NULL, 0, NULL),
(298, 'PURCHASE_ORDER-1786453838900-746', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 13:10:38.925', '2026-08-11 13:10:38.925', 0, 0, 0, 0, 0, NULL, 0, NULL),
(299, 'PURCHASE_ORDER-1786453959169-500', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 13:12:39.196', '2026-08-11 13:12:39.196', 0, 0, 0, 0, 0, NULL, 0, NULL),
(300, 'PURCHASE_ORDER-1786454350197-258', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 13:19:10.201', '2026-08-11 13:19:10.201', 0, 0, 0, 0, 0, NULL, 0, NULL),
(301, 'PUR-1786454385733', '2026-08-11 00:00:00.000', 'PURCHASE', 60, 0, 0, 60, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:19:45.831', '2026-08-11 13:19:45.831', 1.69811320754717, 0, 1.69811320754717, 3.39622641509434, 0, NULL, 0, NULL),
(302, 'PUR-1786454403357', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:20:03.380', '2026-08-11 13:20:03.380', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(303, 'PUR-1786454416933', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:20:16.955', '2026-08-11 13:20:16.955', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(304, 'PUR-1786454437084', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:20:37.134', '2026-08-11 13:20:37.134', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(305, 'PURCHASE_ORDER-1786454613127-978', '2026-08-11 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-11 13:23:33.154', '2026-08-11 13:23:33.154', 0, 0, 0, 0, 0, NULL, 0, NULL),
(306, 'PUR-1786454627955', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:23:48.041', '2026-08-11 13:23:48.041', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(307, 'PUR-1786454637867', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:23:57.907', '2026-08-11 13:23:57.907', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(308, 'PUR-1786454652027', '2026-08-11 00:00:00.000', 'PURCHASE_RETURN', 60, 0, 0, 60, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:24:12.048', '2026-08-11 13:24:12.048', 1.69811320754717, 0, 1.69811320754717, 3.39622641509434, 0, NULL, 0, NULL),
(309, 'INV-1786454678179', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:24:38.207', '2026-08-14 07:57:30.525', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, '2026-08-14 07:57:30.524', 0, NULL),
(310, 'INV-1786454709539', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:25:09.563', '2026-08-18 13:07:07.285', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, '2026-08-18 13:07:07.283', 0, NULL),
(311, 'INV-1786454738235', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:25:38.261', '2026-08-18 13:07:15.074', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, '2026-08-18 13:07:15.072', 0, NULL),
(312, 'INV-1786454822162', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:27:02.187', '2026-08-11 13:27:02.187', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(313, 'INV-1786455084298', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:31:24.554', '2026-08-11 13:31:24.554', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(314, 'PUR-1786455151784', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:32:31.815', '2026-08-11 13:32:31.815', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(315, 'PUR-1786455157783', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:32:37.808', '2026-08-11 13:32:37.808', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(316, 'PUR-1786455204607', '2026-08-11 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-11 13:33:24.629', '2026-08-11 13:33:24.629', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(317, 'INV-1786455219815', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:33:39.895', '2026-08-11 13:33:39.895', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(318, 'INV-1786455235415', '2026-08-11 00:00:00.000', 'SALES', 0, 0, 0, 0, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:33:55.460', '2026-08-11 13:33:55.460', 0, 0, 0, 0, 0, NULL, 0, NULL),
(319, 'INV-1786455248750', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:34:08.850', '2026-08-11 13:34:08.850', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(320, 'INV-1786455264054', '2026-08-11 00:00:00.000', 'SALES_RETURN', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:34:24.077', '2026-08-11 13:34:24.077', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(321, 'INV-1786455347902', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:35:48.140', '2026-08-11 13:35:48.140', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(322, 'INV-1786455351230', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:35:51.253', '2026-08-11 13:35:51.253', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(323, 'INV-1786455361014', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:36:01.039', '2026-08-11 13:36:01.039', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(324, 'INV-1786455374445', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:36:14.471', '2026-08-11 13:36:14.471', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(325, 'INV-1786455544589', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'HOLD', 1, 22, NULL, NULL, '2026-08-11 13:39:04.599', '2026-08-11 13:39:04.599', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(326, 'INV-1786455556204', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'HOLD', 1, 22, NULL, NULL, '2026-08-11 13:39:16.212', '2026-08-11 13:39:16.212', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(327, 'INV-1786455568484', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'HOLD', 1, 22, NULL, NULL, '2026-08-11 13:39:28.492', '2026-08-11 13:39:28.492', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(328, 'INV-1786455606716', '2026-08-11 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'UNHOLD', 1, 22, NULL, NULL, '2026-08-11 13:40:06.725', '2026-08-12 05:59:20.176', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(329, 'INV-1786455615628', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'UNHOLD', 1, NULL, NULL, NULL, '2026-08-11 13:40:15.636', '2026-08-12 05:59:19.257', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(330, 'INV-1786455623428', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'UNHOLD', 1, 22, NULL, NULL, '2026-08-11 13:40:23.458', '2026-08-12 05:59:18.108', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(331, 'POS-1786455872626', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', 'POS Hold', 'HOLD', 1, 22, NULL, NULL, '2026-08-11 13:44:32.688', '2026-08-11 13:44:58.323', 0, 0, 0, 0, 0, '2026-08-11 13:44:58.319', 0, NULL),
(332, 'POS-1786455882066', '2026-08-11 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', 'POS Hold', 'HOLD', 1, 22, NULL, NULL, '2026-08-11 13:44:42.077', '2026-08-11 13:44:59.434', 0, 0, 0, 0, 0, '2026-08-11 13:44:59.433', 0, NULL),
(333, 'POS-20260811-1786456388959', '2026-08-11 13:53:08.959', 'SALES', 0, 0, 0, 560, 'Cash:560', NULL, 'PAID', 1, 22, NULL, NULL, '2026-08-11 13:53:08.964', '2026-08-11 13:53:08.964', 0, 0, 0, 0, 0, NULL, 0, NULL),
(334, 'POS-20260811-1786456399593', '2026-08-11 13:53:19.593', 'SALES', 0, 0, 0, 700, 'Cash:700', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-11 13:53:19.595', '2026-08-11 13:53:19.595', 0, 0, 0, 0, 0, NULL, 0, NULL),
(335, 'POS-20260812-1786512317824', '2026-08-12 05:25:17.824', 'SALES', 0, 0, 0, 12, 'Credit:12', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-12 05:25:17.827', '2026-08-12 05:25:17.827', 0, 0, 0, 0, 0, NULL, 0, NULL),
(336, 'POS-20260812-1786512808595', '2026-08-12 05:33:28.595', 'SALES', 0, 0, 0, 780, 'Cash:780', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-12 05:33:28.596', '2026-08-12 05:33:28.596', 0, 0, 0, 0, 0, NULL, 0, NULL),
(337, 'POS-20260812-1786513048854', '2026-08-12 05:37:28.854', 'SALES', 0, 0, 0, 780, 'Cash:780', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-12 05:37:28.855', '2026-08-12 05:37:28.855', 0, 0, 0, 0, 0, NULL, 0, NULL),
(338, 'POS-20260812-1786513190645', '2026-08-12 05:39:50.645', 'SALES', 0, 0, 0, 6000, 'Cash:6000', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-12 05:39:50.647', '2026-08-12 05:39:50.647', 0, 0, 0, 0, 0, NULL, 0, NULL),
(339, 'INV-1786529257485', '2026-08-12 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:07:38.221', '2026-08-12 10:07:38.221', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(340, 'INV-1786529976509', '2026-08-12 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:19:36.665', '2026-08-12 10:19:36.665', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(341, 'PUR-1786530004733', '2026-08-12 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-12 10:20:04.753', '2026-08-12 10:20:04.753', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(342, 'INV-1786530155115', '2026-08-12 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:22:35.141', '2026-08-14 07:57:17.806', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, '2026-08-14 07:57:17.805', 0, NULL),
(343, 'PUR-1786530179123', '2026-08-12 00:00:00.000', 'PURCHASE', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-12 10:22:59.151', '2026-08-12 10:22:59.151', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(344, 'INV-1786530204922', '2026-08-12 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:23:24.947', '2026-08-12 10:23:24.947', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(345, 'INV-1786530249209', '2026-08-12 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:24:09.239', '2026-08-12 10:24:09.239', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(346, 'PURCHASE_ORDER-1786530293582-404', '2026-08-12 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 800, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-12 10:24:53.585', '2026-08-12 10:24:53.585', 0, 0, 0, 0, 0, NULL, 0, NULL),
(347, 'PUR-1786530316985', '2026-08-12 00:00:00.000', 'PURCHASE', 60, 0, 0, 60, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-12 10:25:17.006', '2026-08-12 10:25:17.006', 1.69811320754717, 0, 1.69811320754717, 3.39622641509434, 0, NULL, 0, NULL),
(348, 'PUR-1786530349376', '2026-08-12 00:00:00.000', 'PURCHASE_RETURN', 0, 0, 0, 0, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-12 10:25:49.397', '2026-08-12 10:25:49.397', 0, 0, 0, 0, 0, NULL, 0, NULL),
(349, 'INV-1786530365952', '2026-08-12 00:00:00.000', 'SALES', 0, 0, 0, 0, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-12 10:26:05.974', '2026-08-12 10:26:05.974', 0, 0, 0, 0, 0, NULL, 0, NULL),
(350, 'INV-1786530428071', '2026-08-12 00:00:00.000', 'SALES_RETURN', 6000, 0, 0, 6000, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:27:08.096', '2026-08-12 10:27:08.096', 115.3846153846157, 0, 115.3846153846157, 230.7692307692314, 0, NULL, 0, NULL),
(351, 'INV-1786530452391', '2026-08-12 00:00:00.000', 'SALES_RETURN', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-12 10:27:32.415', '2026-08-12 10:27:32.415', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(352, 'PUR-1786688828189', '2026-08-14 00:00:00.000', 'PURCHASE_RETURN', 400, 0, 0, 400, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 06:27:08.254', '2026-08-14 06:27:08.254', 7.692307692307708, 0, 7.692307692307708, 15.38461538461542, 0, NULL, 0, NULL),
(353, 'PUR-1786688883659', '2026-08-14 00:00:00.000', 'PURCHASE', 700, 0, 0, 700, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 06:28:03.680', '2026-08-14 06:28:03.680', 16.66666666666669, 0, 16.66666666666669, 33.33333333333337, 0, NULL, 0, NULL),
(354, 'POS-20260814-1786688941547', '2026-08-14 06:29:01.547', 'SALES', 0, 0, 0, 7960, 'Cash:60:7960', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 06:29:01.549', '2026-08-14 06:52:48.754', 0, 0, 0, 0, 0, '2026-08-14 06:52:48.752', 0, NULL),
(355, 'INV-1786688977995', '2026-08-14 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 06:29:38.019', '2026-08-14 06:29:38.019', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(356, 'POS-1786690368643', '2026-08-14 00:00:00.000', 'SALES', 7960, 0, 0, 7960, 'Cash:60:7960', 'POS Hold', 'HOLD', 1, NULL, NULL, NULL, '2026-08-14 06:52:48.693', '2026-08-14 06:52:48.693', 0, 0, 0, 0, 0, NULL, 0, NULL),
(357, 'INV-1786693674086', '2026-08-14 00:00:00.000', 'SALES', 6000, 0, 0, 6000, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 07:47:54.124', '2026-08-14 07:47:54.124', 115.3846153846157, 0, 115.3846153846157, 230.7692307692314, 0, NULL, 0, NULL),
(358, 'INV-1786696905377', '2026-08-14 00:00:00.000', 'CHALLAN', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 08:41:45.405', '2026-08-14 08:41:45.405', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(359, 'INV-1786697783415', '2026-08-14 00:00:00.000', 'CHALLAN', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 08:56:23.443', '2026-08-14 08:56:23.443', 0, 0, 0, 0, 0, NULL, 0, NULL),
(360, 'INV-1786698314929', '2026-08-14 00:00:00.000', 'CHALLAN', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 09:05:14.959', '2026-08-14 09:05:14.959', 0, 0, 0, 0, 0, NULL, 0, NULL),
(361, 'INV-1786698826979', '2026-08-14 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 09:13:47.006', '2026-08-14 09:13:47.006', 4.761904761904759, 0, 4.761904761904759, 9.523809523809518, 0, NULL, 0, NULL),
(362, 'INV-1786699288758', '2026-08-14 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 09:21:28.812', '2026-08-14 09:21:28.812', 4.761904761904759, 0, 4.761904761904759, 9.523809523809518, 0, NULL, 0, NULL),
(363, 'INV-1786699380765', '2026-08-14 00:00:00.000', 'SALES', 40, 0, 0, 40, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:23:00.798', '2026-08-14 09:23:00.798', 0.9523809523809526, 0, 0.9523809523809526, 1.904761904761905, 0, NULL, 0, NULL),
(364, 'INV-1786699429892', '2026-08-14 00:00:00.000', 'SALES', 100, 0, 0, 100, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:23:49.914', '2026-08-14 09:23:49.914', 2.38095238095238, 0, 2.38095238095238, 4.761904761904759, 0, NULL, 0, NULL),
(365, 'INV-1786699821784', '2026-08-14 00:00:00.000', 'SALES', 100, 0, 0, 100, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:30:21.875', '2026-08-14 09:30:21.875', 2.38095238095238, 0, 2.38095238095238, 4.761904761904759, 0, NULL, 0, NULL),
(366, 'INV-1786699873359', '2026-08-14 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 09:31:13.410', '2026-08-14 09:31:13.410', 4.761904761904759, 0, 4.761904761904759, 9.523809523809518, 0, NULL, 0, NULL),
(367, 'INV-1786699917191', '2026-08-14 00:00:00.000', 'SALES', 40, 0, 0, 40, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:31:57.214', '2026-08-14 09:31:57.214', 0.9523809523809526, 0, 0.9523809523809526, 1.904761904761905, 0, NULL, 0, NULL),
(368, 'INV-1786700010325', '2026-08-14 00:00:00.000', 'SALES', 180, 0, 0, 180, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:33:30.350', '2026-08-14 09:33:30.350', 4.285714285714292, 0, 4.285714285714292, 8.571428571428584, 0, NULL, 0, NULL),
(369, 'INV-1786700224723', '2026-08-14 00:00:00.000', 'SALES', 40, 0, 0, 40, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-14 09:37:04.749', '2026-08-14 09:37:04.749', 0.9523809523809526, 0, 0.9523809523809526, 1.904761904761905, 0, NULL, 0, NULL),
(370, 'PUR-1786700299042', '2026-08-14 00:00:00.000', 'PURCHASE', 80, 0, 0, 80, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 09:38:19.065', '2026-08-14 09:38:19.065', 1.904761904761905, 0, 1.904761904761905, 3.80952380952381, 0, NULL, 0, NULL),
(371, 'PUR-1786700531384', '2026-08-14 00:00:00.000', 'PURCHASE', 15, 0, 0, 15, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 09:42:11.406', '2026-08-14 09:42:11.406', 0.3571428571428577, 0, 0.3571428571428577, 0.7142857142857153, 0, NULL, 0, NULL),
(372, 'PUR-1786700709918', '2026-08-14 00:00:00.000', 'PURCHASE', 30, 0, 0, 30, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 09:45:09.938', '2026-08-14 09:45:09.938', 0.7142857142857153, 0, 0.7142857142857153, 1.428571428571431, 0, NULL, 0, NULL),
(373, 'PURCHASE_ORDER-1786700817623-655', '2026-08-14 00:00:00.000', 'PURCHASE_ORDER', 15, 0, 0, 15, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-14 09:46:57.627', '2026-08-14 09:46:57.627', 0, 0, 0, 0, 0, NULL, 0, NULL),
(374, 'PUR-1786700880243', '2026-08-14 00:00:00.000', 'PURCHASE_RETURN', 30, 0, 0, 30, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-14 09:48:00.265', '2026-08-14 09:48:00.265', 0.7142857142857153, 0, 0.7142857142857153, 1.428571428571431, 0, NULL, 0, NULL),
(375, 'PURCHASE_ORDER-1786700912044-196', '2026-08-14 00:00:00.000', 'PURCHASE_ORDER', 30, 0, 0, 30, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-14 09:48:32.047', '2026-08-14 09:48:32.047', 0, 0, 0, 0, 0, NULL, 0, NULL),
(376, 'INV-1786701654347', '2026-08-14 00:00:00.000', 'SALES', 728, 0, 0, 728, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 10:00:54.513', '2026-08-14 10:00:54.513', 17.33333333333337, 0, 17.33333333333337, 34.66666666666674, 0, NULL, 0, NULL),
(377, 'INV-1786701730042', '2026-08-14 00:00:00.000', 'SALES', 112, 0, 0, 112, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 10:02:10.086', '2026-08-14 10:02:10.086', 2.666666666666671, 0, 2.666666666666671, 5.333333333333343, 0, NULL, 0, NULL),
(378, 'POS-20260814-1786703419412', '2026-08-14 10:30:19.412', 'SALES', 0, 0, 0, 6560, 'Cash:60:7960:6560', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 10:30:19.413', '2026-08-14 10:30:19.413', 0, 0, 0, 0, 0, NULL, 0, NULL),
(379, 'POS-20260814-1786703528530', '2026-08-14 10:32:08.530', 'SALES', 0, 0, 0, 560, 'Cash:560', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 10:32:08.532', '2026-08-14 10:32:08.532', 0, 0, 0, 0, 0, NULL, 0, NULL),
(380, 'INV-1786705409728', '2026-08-14 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:03:30.181', '2026-08-14 11:03:30.181', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(381, 'INV-1786706544308', '2026-08-14 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:22:24.391', '2026-08-14 11:22:24.391', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(382, 'POS-20260814-1786707017818', '2026-08-14 11:30:17.819', 'SALES', 0, 0, 0, 560, 'Cash:460,Credit:100', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 11:30:17.820', '2026-08-14 11:30:17.820', 0, 0, 0, 0, 0, NULL, 0, NULL),
(383, 'POS-20260814-1786707087460', '2026-08-14 11:31:27.460', 'SALES', 0, 0, 0, 6000, 'Cash:5000,Credit:1000', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 11:31:27.462', '2026-08-14 11:31:27.462', 0, 0, 0, 0, 0, NULL, 0, NULL),
(384, 'POS-20260814-1786707165505', '2026-08-14 11:32:45.505', 'SALES', 0, 0, 0, 6000, 'Cash:5000,Credit:1000', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 11:32:45.507', '2026-08-14 11:32:45.507', 0, 0, 0, 0, 0, NULL, 0, NULL),
(385, 'POS-20260814-1786707539418', '2026-08-14 11:38:59.418', 'SALES', 0, 0, 0, 700, 'Cash:600,Credit:100', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 11:38:59.419', '2026-08-14 11:38:59.419', 0, 0, 0, 0, 0, NULL, 0, NULL),
(386, 'INV-1786707591480', '2026-08-14 00:00:00.000', 'SALES', 780, 0, 0, 780, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:39:51.527', '2026-08-14 11:39:51.527', 18.57142857142861, 0, 18.57142857142861, 37.14285714285722, 0, NULL, 0, NULL),
(387, 'POS-20260814-1786708115988', '2026-08-14 11:48:35.988', 'SALES', 0, 0, 0, 6000, 'Cash:1000,Credit:5000', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-14 11:48:35.990', '2026-08-14 11:48:35.990', 0, 0, 0, 0, 0, NULL, 0, NULL),
(388, 'INV-1786708194665', '2026-08-14 00:00:00.000', 'SALES', 780, 0, 0, 780, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:49:54.707', '2026-08-14 11:49:54.707', 18.57142857142861, 0, 18.57142857142861, 37.14285714285722, 0, NULL, 0, NULL),
(389, 'INV-1786708354231', '2026-08-14 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:52:34.256', '2026-08-14 11:52:34.256', 4.761904761904759, 0, 4.761904761904759, 9.523809523809518, 0, NULL, 0, NULL),
(390, 'INV-1786708399198', '2026-08-14 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Credit', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 11:53:19.258', '2026-08-14 11:53:19.258', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(391, 'INV-1786710002621', '2026-08-14 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:20:02.725', '2026-08-14 12:20:02.725', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(392, 'INV-1786710093659', '2026-08-14 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Credit', '', 'UNHOLD', 1, 22, NULL, NULL, '2026-08-14 12:21:33.692', '2026-08-14 12:31:54.413', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, '2026-08-14 12:31:54.412', 0, NULL),
(393, 'INV-1786710714260', '2026-08-14 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Credit', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:31:54.493', '2026-08-14 12:31:54.493', 0, 0, 0, 0, 0, NULL, 0, NULL),
(394, 'INV-1786711198991', '2026-08-14 00:00:00.000', 'SALES_RETURN', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:39:59.082', '2026-08-14 12:39:59.082', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(395, 'INV-1786711258110', '2026-08-14 00:00:00.000', 'SALES', 700, 0, 0, 700, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:40:58.135', '2026-08-14 12:40:58.135', 19.81132075471697, 0, 19.81132075471697, 39.62264150943395, 0, NULL, 0, NULL),
(396, 'INV-1786711346469', '2026-08-14 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Credit', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:42:26.498', '2026-08-14 12:42:26.498', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(397, 'INV-1786711773424', '2026-08-14 00:00:00.000', 'SALES', 200, 0, 0, 200, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-14 12:49:33.538', '2026-08-14 12:49:33.538', 0, 0, 0, 0, 0, NULL, 0, NULL),
(398, 'PURCHASE_ORDER-1786792982031-768', '2026-08-15 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 840, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-15 11:23:02.054', '2026-08-15 11:23:02.054', 0, 0, 0, 0, 0, NULL, 0, NULL),
(399, 'POS-20260815-1786793645962', '2026-08-15 11:34:05.962', 'SALES', 0, 0, 0, 2240, 'Cash:2240', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-15 11:34:05.971', '2026-08-15 11:34:05.971', 0, 0, 0, 0, 0, NULL, 0, NULL),
(400, 'POS-20260815-1786793990586', '2026-08-15 11:39:50.586', 'SALES', 0, 0, 0, 2240, 'Cash:2240', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-15 11:39:50.588', '2026-08-15 11:39:50.588', 0, 0, 0, 0, 0, NULL, 0, NULL),
(401, 'POS-20260815-1786794563743', '2026-08-15 11:49:23.743', 'SALES', 0, 0, 0, 2240, 'Cash:2240', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-15 11:49:23.744', '2026-08-15 11:49:23.744', 0, 0, 0, 0, 0, NULL, 0, NULL),
(402, 'PUR-1787053541365', '2026-08-18 00:00:00.000', 'PURCHASE', 800, 0, 2, 802, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-18 11:45:41.397', '2026-08-18 11:45:41.397', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(403, 'INV-1787054174148', '2026-08-18 00:00:00.000', 'SALES', 560, 0, 0, 560, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-18 11:56:14.183', '2026-08-18 11:56:14.183', 13.33333333333337, 0, 13.33333333333337, 26.66666666666674, 0, NULL, 0, NULL),
(404, 'PURCHASE_ORDER-1787054787950-776', '2026-08-18 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 840, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-18 12:06:27.955', '2026-08-18 12:06:27.955', 0, 0, 0, 0, 0, NULL, 0, NULL),
(405, 'PURCHASE_ORDER-1787055928673-524', '2026-08-18 00:00:00.000', 'PURCHASE_ORDER', 18400, 0, 0, 19320, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-18 12:25:28.677', '2026-08-18 12:25:28.677', 0, 0, 0, 0, 0, NULL, 0, NULL),
(406, 'INV-1787056030694', '2026-08-18 00:00:00.000', 'SALES', 35840, 0, 0, 35840, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-18 12:27:10.715', '2026-08-18 12:27:10.715', 853.3333333333358, 0, 853.3333333333358, 1706.666666666672, 0, NULL, 0, NULL),
(407, 'INV-1787056110637', '2026-08-18 00:00:00.000', 'SALES', 52612, 0, 0, 52612, 'Cash', '', 'PAID', 1, NULL, NULL, NULL, '2026-08-18 12:28:30.661', '2026-08-18 12:28:30.661', 1326.251572327045, 0, 1326.251572327045, 2652.503144654091, 0, NULL, 0, NULL),
(408, 'PURCHASE_ORDER-1787056668511-841', '2026-08-18 00:00:00.000', 'PURCHASE_ORDER', 9800, 0, 0, 10296, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-18 12:37:48.517', '2026-08-18 12:37:48.517', 0, 0, 0, 0, 0, NULL, 0, NULL),
(409, 'PUR-1787056979026', '2026-08-18 00:00:00.000', 'PURCHASE', 6400, 0, 0, 6400, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-18 12:42:59.051', '2026-08-18 12:42:59.051', 123.0769230769233, 0, 123.0769230769233, 246.1538461538466, 0, NULL, 0, NULL),
(410, 'PUR-1787057958511', '2026-08-18 00:00:00.000', 'PURCHASE_RETURN', 800, 0, 0, 800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-18 12:59:18.559', '2026-08-18 12:59:18.559', 19.04761904761904, 0, 19.04761904761904, 38.09523809523807, 0, NULL, 0, NULL),
(411, 'PURCHASE_ORDER-1787058551024-365', '2026-08-18 00:00:00.000', 'PURCHASE_ORDER', 12800, 0, 0, 13440, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-18 13:09:11.036', '2026-08-18 13:09:11.036', 0, 0, 0, 0, 0, NULL, 0, NULL),
(412, 'POS-20260818-1787058589885', '2026-08-18 13:09:49.885', 'SALES', 0, 0, 0, 8240, 'Cash:8240', NULL, 'PAID', 1, NULL, NULL, NULL, '2026-08-18 13:09:49.893', '2026-08-18 13:09:49.893', 0, 0, 0, 0, 0, NULL, 0, NULL),
(413, 'PURCHASE_ORDER-1787120815750-593', '2026-08-19 00:00:00.000', 'PURCHASE_ORDER', 800, 0, 0, 840, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-19 06:26:55.788', '2026-08-19 06:26:55.788', 0, 0, 0, 0, 0, NULL, 0, NULL),
(414, 'PURCHASE_ORDER-1787120856695-950', '2026-08-19 00:00:00.000', 'PURCHASE_ORDER', 3200, 0, 0, 3360, 'Credit', 'Purchase Order', 'PAID', 1, 21, NULL, NULL, '2026-08-19 06:27:36.726', '2026-08-19 06:27:36.726', 0, 0, 0, 0, 0, NULL, 0, NULL),
(415, 'INV-1787121003045', '2026-08-19 00:00:00.000', 'SALES_RETURN', 800, 0, 0, 800, 'Cash', '', 'PAID', 1, 22, NULL, NULL, '2026-08-19 06:30:03.092', '2026-08-19 06:30:03.092', 0, 0, 0, 0, 0, NULL, 0, NULL),
(416, 'PUR-1787137508974', '2026-08-19 00:00:00.000', 'PURCHASE', 4800, 0, 0, 4800, 'Credit', '', 'DUE', 1, 21, NULL, NULL, '2026-08-19 11:05:09.014', '2026-08-19 11:05:09.014', 114.2857142857142, 0, 114.2857142857142, 228.5714285714284, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitem`
--

CREATE TABLE `invoiceitem` (
  `id` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `freeQty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `discount1` double NOT NULL DEFAULT 0,
  `discount2` double NOT NULL DEFAULT 0,
  `imei` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `gstRate` double NOT NULL DEFAULT 0,
  `cgst` double NOT NULL DEFAULT 0,
  `gstAmount` double NOT NULL DEFAULT 0,
  `igst` double NOT NULL DEFAULT 0,
  `sgst` double NOT NULL DEFAULT 0,
  `batchNo` varchar(191) DEFAULT NULL,
  `expDate` varchar(191) DEFAULT NULL,
  `mfgDate` varchar(191) DEFAULT NULL,
  `primaryOpeningQty` double DEFAULT 0,
  `secOpeningQty` double DEFAULT 0,
  `color` varchar(191) DEFAULT NULL,
  `ram` varchar(191) DEFAULT NULL,
  `storage` varchar(191) DEFAULT NULL,
  `isGstInclusive` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoiceitem`
--

INSERT INTO `invoiceitem` (`id`, `invoiceId`, `productId`, `quantity`, `freeQty`, `price`, `discount1`, `discount2`, `imei`, `amount`, `gstRate`, `cgst`, `gstAmount`, `igst`, `sgst`, `batchNo`, `expDate`, `mfgDate`, `primaryOpeningQty`, `secOpeningQty`, `color`, `ram`, `storage`, `isGstInclusive`, `description`) VALUES
(366, 251, 83, 19, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 0, 0, '', '', '', 0, NULL),
(367, 252, 83, 19, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 0, 0, '', '', '', 0, NULL),
(368, 253, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(369, 253, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(370, 253, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(371, 253, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(372, 254, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(373, 255, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(374, 256, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(375, 257, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(376, 258, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(377, 259, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(378, 260, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(379, 260, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(381, 262, 83, 19, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 0, 0, '', '', '', 0, NULL),
(382, 263, 84, 42, 0, 800, 0, 0, '', 3360, 0, 0, 0, 0, 0, '', '', '', 0, 0, NULL, NULL, NULL, 0, NULL),
(383, 264, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 0, 0, '', '', '', 0, NULL),
(384, 265, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(385, 265, 83, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(386, 265, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(387, 265, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(388, 266, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 0, 0, '', '', '', 0, NULL),
(389, 267, 83, 19, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 0, 0, '', '', '', 0, NULL),
(390, 268, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 0, 0, '', '', '', 0, NULL),
(391, 269, 83, 19, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 0, 0, '', '', '', 0, NULL),
(392, 270, 83, 19, 0, 700, 0, 0, '', 700, 10, 31.81818181818187, 63.63636363636374, 0, 31.81818181818187, '', '', '', 0, 0, '', '', '', 0, NULL),
(393, 271, 83, 19, 0, 700, 0, 0, '', 700, 10, 31.81818181818187, 63.63636363636374, 0, 31.81818181818187, '', '', '', 0, 0, '', '', '', 0, NULL),
(394, 272, 83, 20, 0, 710, 0, 0, '', 747.3684210526317, 10, 33.97129186602876, 67.94258373205753, 0, 33.97129186602876, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(395, 273, 83, 19, 0, 720, 0, 0, '', 720, 10, 32.72727272727275, 65.4545454545455, 0, 32.72727272727275, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(396, 274, 83, 100, 0, 700, 0, 0, '', 3684.21052631579, 10, 167.4641148325361, 334.9282296650722, 0, 167.4641148325361, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(397, 275, 83, 100, 0, 720, 0, 0, '', 3789.473684210526, 10, 172.2488038277513, 344.4976076555026, 0, 172.2488038277513, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(398, 276, 83, 100, 0, 700, 0, 0, '', 3684.21052631579, 10, 167.4641148325361, 334.9282296650722, 0, 167.4641148325361, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(399, 277, 83, 100, 0, 700, 0, 0, '', 3684.21052631579, 10, 167.4641148325361, 334.9282296650722, 0, 167.4641148325361, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(400, 278, 83, 98, 0, 700, 0, 0, '', 3610.526315789474, 10, 164.1148325358854, 328.2296650717708, 0, 164.1148325358854, 'ok', '2026-08-22', '2026-08-08', 0, 0, '', '', '', 0, NULL),
(401, 279, 84, 55, 0, 800, 0, 0, '', 4400, 5, 104.761904761905, 209.5238095238101, 0, 104.761904761905, '', '', '', 5, 5, '', '', '', 0, NULL),
(402, 280, 88, 10, 1, 200, 0, 0, '', 200, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(403, 281, 88, 10, 1, 200, 0, 0, '', 200, 0, 0, 0, 0, 0, '', '', '', 0, 0, '', '', '', 0, NULL),
(404, 282, 88, 10, 2, 200, 0, 0, '', 200, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(405, 283, 88, 10, 0, 200, 0, 0, '', 200, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(406, 284, 88, 56, 0, 100, 0, 0, '', 560, 0, 0, 0, 0, 0, '', '', '', 5, 6, NULL, NULL, NULL, 0, NULL),
(407, 285, 88, 56, 0, 100, 0, 0, '', 560, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 5, 6, '', '', '', 0, NULL),
(408, 286, 88, 11, 0, 500, 0, 0, '', 550, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 1, 1, '', '', '', 0, NULL),
(409, 287, 88, 10, 0, 110, 0, 0, '', 110, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 1, 0, '', '', '', 0, NULL),
(410, 288, 88, 110, 0, 50, 0, 0, '', 550, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 11, 0, '', '', '', 0, NULL),
(411, 289, 88, 120, 0, 100, 0, 0, '', 1200, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 12, 0, '', '', '', 0, NULL),
(412, 290, 88, 21, 0, 100, 0, 0, '', 210, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 2, 1, '', '', '', 0, NULL),
(413, 291, 85, 50, 0, 60, 0, 0, '', 300, 6, 8.490566037735846, 16.98113207547169, 0, 8.490566037735846, '', '', '', 5, 0, '', '', '', 0, NULL),
(414, 292, 85, 20, 0, 60, 0, 0, '', 120, 6, 3.39622641509434, 6.79245283018868, 0, 3.39622641509434, '', '', '', 2, 0, '', '', '', 0, NULL),
(415, 293, 83, 95, 0, 700, 0, 0, '', 3500, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 5, 0, NULL, NULL, NULL, 0, NULL),
(416, 294, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(417, 295, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(418, 296, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(419, 297, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(420, 298, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(421, 299, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(422, 300, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(423, 301, 85, 10, 0, 60, 0, 0, '', 60, 6, 1.69811320754717, 3.39622641509434, 0, 1.69811320754717, '', '', '', 1, 0, '', '', '', 0, NULL),
(424, 302, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(425, 303, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(426, 304, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(427, 305, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, '', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(428, 306, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(429, 307, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(430, 308, 85, 10, 0, 60, 0, 0, '', 60, 6, 1.69811320754717, 3.39622641509434, 0, 1.69811320754717, '', '', '', 1, 0, '', '', '', 0, NULL),
(431, 309, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(432, 310, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(433, 311, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(434, 312, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(435, 313, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(436, 314, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(437, 315, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(438, 316, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, '', '', '', 1, 0, '', '', '', 0, NULL),
(439, 317, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, '', '', '', 1, 0, '', '', '', 0, NULL),
(440, 318, 87, 12, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(441, 319, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(442, 320, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, '', '', '', 1, 0, '', '', '', 0, NULL),
(443, 321, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(444, 322, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(445, 323, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(446, 324, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(447, 325, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(448, 326, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(449, 327, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(450, 328, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(451, 329, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(452, 330, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, NULL, NULL, NULL, 1, 0, '', '', '', 0, NULL),
(453, 331, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(454, 332, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(455, 333, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(456, 334, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(457, 335, 85, 1, 0, 1, 0, 0, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(458, 335, 88, 1, 0, 10, 0, 0, NULL, 10, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(459, 335, 86, 1, 0, 1, 0, 0, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(460, 336, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(461, 337, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(462, 338, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(463, 339, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(464, 340, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(465, 341, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(466, 342, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(467, 343, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(468, 344, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, '', '', '', 1, 0, '', '', '', 0, NULL),
(469, 345, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, '', '', '', 1, 0, '', '', '', 0, NULL),
(470, 346, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, NULL, NULL, NULL, 0, NULL),
(471, 347, 85, 10, 0, 60, 0, 0, '', 60, 6, 1.69811320754717, 3.39622641509434, 0, 1.69811320754717, '', '', '', 1, 0, '', '', '', 0, NULL),
(472, 348, 87, 12, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(473, 349, 87, 12, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(474, 350, 89, 10, 0, 6000, 0, 0, '', 6000, 4, 115.3846153846157, 230.7692307692314, 0, 115.3846153846157, '', '', '', 1, 0, '', '', '', 0, NULL),
(475, 351, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, '', '', '', 1, 0, '', '', '', 0, NULL),
(476, 352, 89, 10, 0, 400, 0, 0, '', 400, 4, 7.692307692307708, 15.38461538461542, 0, 7.692307692307708, '', '', '', 1, 0, '', '', '', 0, NULL),
(477, 353, 86, 20, 0, 700, 0, 0, '', 700, 5, 16.66666666666669, 33.33333333333337, 0, 16.66666666666669, '', '', '', 1, 0, '', '', '', 0, NULL),
(478, 354, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(479, 354, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(480, 354, 87, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(481, 354, 85, 2, 0, 700, 0, 0, NULL, 1400, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(482, 355, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(483, 356, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(484, 356, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(485, 356, 87, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(486, 356, 85, 2, 0, 700, 0, 0, NULL, 1400, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(487, 357, 89, 10, 0, 6000, 0, 0, '', 6000, 4, 115.3846153846157, 230.7692307692314, 0, 115.3846153846157, '', '', '', 1, 0, '', '', '', 0, NULL),
(488, 358, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(489, 359, 84, 10, 0, 560, 0, 0, '', 560, 0, 0, 0, 0, 0, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(490, 360, 85, 10, 0, 700, 0, 0, '', 700, 0, 0, 0, 0, 0, '', '', '', 1, 0, '', '', '', 0, NULL),
(491, 361, 90, 10, 0, 200, 0, 0, '', 200, 5, 4.761904761904759, 9.523809523809518, 0, 4.761904761904759, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(492, 362, 90, 10, 0, 200, 0, 0, '', 200, 5, 4.761904761904759, 9.523809523809518, 0, 4.761904761904759, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(493, 363, 90, 2, 0, 200, 0, 0, '', 40, 5, 0.9523809523809526, 1.904761904761905, 0, 0.9523809523809526, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(494, 364, 90, 5, 0, 200, 0, 0, '', 100, 5, 2.38095238095238, 4.761904761904759, 0, 2.38095238095238, 'wdwer', '2026-08-22', '2026-08-10', 0, 5, '', '', '', 0, NULL),
(495, 365, 90, 5, 0, 200, 0, 0, '', 100, 5, 2.38095238095238, 4.761904761904759, 0, 2.38095238095238, 'wdwer', '2026-08-22', '2026-08-10', 0, 5, '', '', '', 0, NULL),
(496, 366, 90, 10, 0, 200, 0, 0, '', 200, 5, 4.761904761904759, 9.523809523809518, 0, 4.761904761904759, 'wdwer', '2026-08-22', '2026-08-10', 0, 10, '', '', '', 0, NULL),
(497, 367, 90, 2, 0, 200, 0, 0, '', 40, 5, 0.9523809523809526, 1.904761904761905, 0, 0.9523809523809526, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(498, 368, 90, 9, 0, 200, 0, 0, '', 180, 5, 4.285714285714292, 8.571428571428584, 0, 4.285714285714292, 'wdwer', '2026-08-22', '2026-08-10', 0, 9, '', '', '', 0, NULL),
(499, 369, 90, 2, 0, 200, 0, 0, '', 40, 5, 0.9523809523809526, 1.904761904761905, 0, 0.9523809523809526, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(500, 370, 84, 1, 0, 800, 0, 0, '', 80, 5, 1.904761904761905, 3.80952380952381, 0, 1.904761904761905, 'wdwer', '2026-08-22', '2026-08-10', 0, 1, '', '', '', 0, NULL),
(501, 371, 90, 1, 0, 150, 0, 0, '', 15, 5, 0.3571428571428577, 0.7142857142857153, 0, 0.3571428571428577, 'wdwer', '2026-08-22', '2026-08-10', 0, 1, '', '', '', 0, NULL),
(502, 372, 90, 2, 0, 150, 0, 0, '', 30, 5, 0.7142857142857153, 1.428571428571431, 0, 0.7142857142857153, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(503, 373, 90, 1, 0, 150, 0, 0, '', 15, 0, 0, 0, 0, 0, 'wdwer', '2026-08-22', '2026-08-10', 0, 1, NULL, NULL, NULL, 0, NULL),
(504, 374, 90, 2, 0, 150, 0, 0, '', 30, 5, 0.7142857142857153, 1.428571428571431, 0, 0.7142857142857153, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(505, 375, 90, 2, 0, 150, 0, 0, '', 30, 0, 0, 0, 0, 0, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, NULL, NULL, NULL, 0, NULL),
(506, 376, 84, 13, 0, 560, 0, 0, '', 728, 5, 17.33333333333337, 34.66666666666674, 0, 17.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 3, '', '', '', 0, NULL),
(507, 377, 84, 2, 0, 560, 0, 0, '', 112, 5, 2.666666666666671, 5.333333333333343, 0, 2.666666666666671, 'wdwer', '2026-08-22', '2026-08-10', 0, 2, '', '', '', 0, NULL),
(508, 378, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(509, 378, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(510, 379, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(511, 380, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(512, 381, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(513, 382, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(514, 383, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(515, 384, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(516, 385, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(517, 386, 86, 20, 0, 780, 0, 0, '', 780, 5, 18.57142857142861, 37.14285714285722, 0, 18.57142857142861, '', '', '', 1, 0, '', '', '', 0, NULL),
(518, 387, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(519, 388, 86, 20, 0, 780, 0, 0, '', 780, 5, 18.57142857142861, 37.14285714285722, 0, 18.57142857142861, '', '', '', 1, 0, '', '', '', 0, NULL),
(520, 389, 90, 10, 0, 200, 0, 0, '', 200, 5, 4.761904761904759, 9.523809523809518, 0, 4.761904761904759, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(521, 390, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(522, 391, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(523, 392, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(524, 393, 85, 10, 0, 700, 0, 0, '', 700, 0, 0, 0, 0, 0, 'wdwer', '', '', 1, 0, '', '', '', 0, NULL),
(525, 394, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '2026-08-22', '2026-08-10', 1, 0, '', '', '', 0, NULL),
(526, 395, 85, 10, 0, 700, 0, 0, '', 700, 6, 19.81132075471697, 39.62264150943395, 0, 19.81132075471697, 'wdwer', '', '', 1, 0, '', '', '', 0, NULL),
(527, 396, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '', '', 1, 0, '', '', '', 0, NULL),
(528, 397, 88, 10, 0, 200, 0, 0, '', 200, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 1, 0, '', '', '', 0, NULL),
(529, 398, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, 'wdwer', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(530, 399, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(531, 399, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(532, 399, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(533, 399, 88, 1, 0, 200, 0, 0, NULL, 200, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(534, 400, 88, 1, 0, 200, 0, 0, NULL, 200, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(535, 400, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(536, 400, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(537, 400, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(538, 401, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(539, 401, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(540, 401, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(541, 401, 88, 1, 0, 200, 0, 0, NULL, 200, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(542, 402, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, 'wdwer', '', '', 1, 0, '', '', '', 0, NULL),
(543, 403, 84, 10, 0, 560, 0, 0, '', 560, 5, 13.33333333333337, 26.66666666666674, 0, 13.33333333333337, 'wdwer', '', '', 1, 0, '', '', '', 0, NULL),
(544, 404, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, 'wdwer', '', '', 1, 0, NULL, NULL, NULL, 0, NULL),
(545, 405, 84, 230, 0, 800, 0, 0, '', 18400, 0, 0, 0, 0, 0, 'wdwer', '', '', 23, 0, NULL, NULL, NULL, 0, 'Roll Qty: 1 | Meter/Roll: 23'),
(546, 406, 84, 640, 0, 560, 0, 0, '', 35840, 5, 853.3333333333358, 1706.666666666672, 0, 853.3333333333358, 'wdwer', '', '', 64, 0, '', '', '', 0, 'Roll Qty: 2 | Meter/Roll: 32'),
(547, 407, 84, 647, 0, 560, 0, 0, '', 36232, 5, 862.6666666666679, 1725.333333333336, 0, 862.6666666666679, 'wdwer', '', '', 64, 7, '', '', '', 0, 'Roll Qty: 2 | Meter/Roll: 32'),
(548, 407, 85, 234, 0, 700, 0, 0, '', 16380, 6, 463.5849056603774, 927.1698113207549, 0, 463.5849056603774, 'wdwer', '', '', 23, 4, '', '', '', 0, 'Roll Qty: 1 | Meter/Roll: 23'),
(549, 408, 84, 100, 0, 800, 240, 0, '', 7760, 0, 0, 0, 0, 0, 'wdwer', '', '', 10, 0, NULL, NULL, NULL, 0, 'Roll Qty: 3 | Meter/Roll: 3'),
(550, 408, 85, 300, 0, 60, 0, 0, '', 1800, 0, 0, 0, 0, 0, 'wdwer', '', '', 30, 0, NULL, NULL, NULL, 0, 'Roll Qty: 6 | Meter/Roll: 5'),
(551, 409, 89, 160, 0, 400, 0, 0, '', 6400, 4, 123.0769230769233, 246.1538461538466, 0, 123.0769230769233, '', '', '', 16, 0, '', '', '', 0, '4 X 4'),
(552, 410, 84, 10, 0, 800, 0, 0, '', 800, 5, 19.04761904761904, 38.09523809523807, 0, 19.04761904761904, 'wdwer', '', '', 1, 0, '', '', '', 0, '1 X 1'),
(553, 411, 84, 160, 0, 800, 0, 0, '', 12800, 0, 0, 0, 0, 0, 'wdwer', '', '', 16, 0, NULL, NULL, NULL, 0, '4 X 4'),
(554, 412, 84, 1, 0, 560, 0, 0, NULL, 560, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(555, 412, 89, 1, 0, 6000, 0, 0, NULL, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(556, 412, 85, 1, 0, 700, 0, 0, NULL, 700, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(557, 412, 88, 1, 0, 200, 0, 0, NULL, 200, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(558, 412, 86, 1, 0, 780, 0, 0, NULL, 780, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(559, 412, 87, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL),
(560, 413, 84, 10, 0, 800, 0, 0, '', 800, 0, 0, 0, 0, 0, 'wdwer', '', '', 1, 0, NULL, NULL, NULL, 0, ''),
(561, 414, 84, 40, 0, 800, 0, 0, '', 3200, 0, 0, 0, 0, 0, 'wdwer', '', '', 4, 0, NULL, NULL, NULL, 0, '2 X 2'),
(562, 415, 88, 40, 0, 200, 0, 0, '', 800, 0, 0, 0, 0, 0, 'ok', '2026-08-22', '2026-08-08', 4, 0, '', '', '', 0, '2 X 2'),
(563, 416, 84, 60, 0, 800, 0, 0, '', 4800, 5, 114.2857142857142, 228.5714285714284, 0, 114.2857142857142, 'wdwer', '', '', 6, 0, '', '', '', 0, '3 X 2');

-- --------------------------------------------------------

--
-- Table structure for table `loadingsheet`
--

CREATE TABLE `loadingsheet` (
  `id` int(11) NOT NULL,
  `sheetNo` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `status` varchar(191) NOT NULL DEFAULT 'GENERATED',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loadingsheetitem`
--

CREATE TABLE `loadingsheetitem` (
  `id` int(11) NOT NULL,
  `loadingSheetId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `branchId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `code`, `address`, `isActive`, `branchId`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'New Delhi', '12345', 'Address 123 Delhi', 1, 1, 1, '2026-07-07 11:04:00.413', '2026-07-07 11:04:15.011');

-- --------------------------------------------------------

--
-- Table structure for table `messagetemplate`
--

CREATE TABLE `messagetemplate` (
  `id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `offerType` varchar(191) NOT NULL,
  `productSelection` varchar(191) NOT NULL,
  `discountType` varchar(191) DEFAULT NULL,
  `discountValue` varchar(191) DEFAULT NULL,
  `buyQty` int(11) DEFAULT NULL,
  `getQty` int(11) DEFAULT NULL,
  `startDate` varchar(191) DEFAULT NULL,
  `endDate` varchar(191) DEFAULT NULL,
  `schedule` varchar(191) DEFAULT NULL,
  `offerDescription` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'ACTIVE',
  `minCart` varchar(191) DEFAULT '-',
  `target` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `offerValue` varchar(191) DEFAULT NULL,
  `scheduleIcon` varchar(191) DEFAULT NULL,
  `usage` int(11) NOT NULL DEFAULT 0,
  `priority` varchar(191) DEFAULT 'P3',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`id`, `name`, `offerType`, `productSelection`, `discountType`, `discountValue`, `buyQty`, `getQty`, `startDate`, `endDate`, `schedule`, `offerDescription`, `status`, `minCart`, `target`, `type`, `offerValue`, `scheduleIcon`, `usage`, `priority`, `companyId`, `createdAt`, `updatedAt`) VALUES
(3, 'diwali', 'Flat Discount', 'Select Specific Category', 'Flat', '234', NULL, NULL, '2026-07-06', '2026-07-15', '2026-07-06 to 2026-07-15', 'e', 'ACTIVE', '-', 'CATEGORY: Mobile', 'FLAT', '₹234 OFF', 'CalendarClock', 0, 'P3', 1, '2026-07-07 09:02:54.359', '2026-07-31 07:25:21.807'),
(4, 'Tshirts', 'Percentage Discount', 'Select Specific Item', 'Percentage', '10', NULL, NULL, '2026-07-27', '2026-07-31', '2026-07-27 to 2026-07-31', 'Testing', 'ACTIVE', '20', 'ITEM: Ttshirt', 'PERCENTAGE', '10% OFF', 'CalendarClock', 2, '2', 1, '2026-07-27 11:20:14.522', '2026-07-31 07:25:09.433'),
(5, 'holi ', 'Percentage Discount', 'Select Specific Item', 'Percentage', '12', NULL, NULL, '2026-07-29', '2026-07-31', '2026-07-29 to 2026-07-31', 'wed', 'ACTIVE', '23', 'ITEM: pizza', 'PERCENTAGE', '12% OFF', 'CalendarClock', 0, '3', 1, '2026-07-30 10:54:52.240', '2026-07-30 10:54:52.240');

-- --------------------------------------------------------

--
-- Table structure for table `partysetting`
--

CREATE TABLE `partysetting` (
  `id` int(11) NOT NULL,
  `defaultDueDays` int(11) NOT NULL DEFAULT 7,
  `showPartyTags` tinyint(1) NOT NULL DEFAULT 1,
  `showDueDate` tinyint(1) NOT NULL DEFAULT 1,
  `extraColumns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extraColumns`)),
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partysetting`
--

INSERT INTO `partysetting` (`id`, `defaultDueDays`, `showPartyTags`, `showDueDate`, `extraColumns`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, 0, '[{\"name\":\"ok\",\"defaultValue\":\"\"},{\"name\":\"tyr\",\"defaultValue\":\"\"}]', 1, '2026-07-02 13:17:30.859', '2026-07-15 05:50:27.878');

-- --------------------------------------------------------

--
-- Table structure for table `partytag`
--

CREATE TABLE `partytag` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentbook`
--

CREATE TABLE `paymentbook` (
  `id` int(11) NOT NULL,
  `partyName` varchar(191) NOT NULL,
  `mobileNumber` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentbooktransaction`
--

CREATE TABLE `paymentbooktransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `paymentIn` double NOT NULL DEFAULT 0,
  `paymentOut` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `remark` varchar(191) DEFAULT NULL,
  `paymentBookId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `paymentMode` varchar(191) NOT NULL DEFAULT 'Cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `mrp` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `category` varchar(191) DEFAULT NULL,
  `brand` varchar(191) DEFAULT NULL,
  `colorVariant` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `stock` int(11) NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `hsnCode` varchar(191) DEFAULT NULL,
  `purchasePrice` double NOT NULL DEFAULT 0,
  `wholesalePrice` double NOT NULL DEFAULT 0,
  `creditSalePrice` double NOT NULL DEFAULT 0,
  `baseUnit` varchar(191) DEFAULT NULL,
  `purchaseUnit` varchar(191) DEFAULT NULL,
  `salesUnit` varchar(191) DEFAULT NULL,
  `lowStockAlert` int(11) NOT NULL DEFAULT 0,
  `reorderLevel` int(11) NOT NULL DEFAULT 0,
  `enableBatch` tinyint(1) NOT NULL DEFAULT 0,
  `enableExpiry` tinyint(1) NOT NULL DEFAULT 0,
  `enableImei` tinyint(1) DEFAULT 0,
  `hasBom` tinyint(1) DEFAULT 0,
  `qtySlabs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`qtySlabs`)),
  `openingStockRate` double DEFAULT 0,
  `warehouse` varchar(191) DEFAULT NULL,
  `bomName` varchar(191) DEFAULT NULL,
  `isMultiLevel` tinyint(1) DEFAULT 0,
  `bomRecipe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bomRecipe`)),
  `syncOnline` tinyint(1) DEFAULT 0,
  `onlineProductName` varchar(191) DEFAULT NULL,
  `onlineProductDesc` text DEFAULT NULL,
  `onlineSalePrice` double DEFAULT 0,
  `ecommerceCategory` varchar(191) DEFAULT NULL,
  `productImage` longtext DEFAULT NULL,
  `commissionType` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `colour` varchar(191) DEFAULT NULL,
  `expiryMonth` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `hindiName` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `termsCondition` text DEFAULT NULL,
  `productTags` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `extraCharges` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extraCharges`)),
  `rawMaterials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rawMaterials`)),
  `subInventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`subInventory`)),
  `subItems` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`subItems`)),
  `deletedAt` datetime(3) DEFAULT NULL,
  `asOfDate` varchar(191) DEFAULT NULL,
  `secOpeningQty` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `sku`, `barcode`, `mrp`, `price`, `category`, `brand`, `colorVariant`, `status`, `stock`, `tax`, `hsnCode`, `purchasePrice`, `wholesalePrice`, `creditSalePrice`, `baseUnit`, `purchaseUnit`, `salesUnit`, `lowStockAlert`, `reorderLevel`, `enableBatch`, `enableExpiry`, `enableImei`, `hasBom`, `qtySlabs`, `openingStockRate`, `warehouse`, `bomName`, `isMultiLevel`, `bomRecipe`, `syncOnline`, `onlineProductName`, `onlineProductDesc`, `onlineSalePrice`, `ecommerceCategory`, `productImage`, `commissionType`, `size`, `colour`, `expiryMonth`, `location`, `hindiName`, `description`, `termsCondition`, `productTags`, `companyId`, `createdAt`, `updatedAt`, `extraCharges`, `rawMaterials`, `subInventory`, `subItems`, `deletedAt`, `asOfDate`, `secOpeningQty`) VALUES
(83, 'butter', '6546', '434700672', 500, 700, 'Footwear', 'nokia', '', 'Deleted', 208, 10, '45654', 700, 400, 1, 'PKT', 'bag ', 'bag ', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, 'dfgd', NULL, NULL, 1, '2026-08-06 10:42:49.806', '2026-08-11 11:48:04.024', NULL, NULL, NULL, '[]', '2026-08-11 11:48:04.022', '2026-08-11', 5),
(84, 'Ttshirt', 'MOB001', '15718262', 700, 560, 'Fashion', 'nokia', '', 'Active', -71, 5, '54646', 800, 600, 1, 'box', 'PKT', 'PKT', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, 'wewqe', NULL, NULL, 1, '2026-08-06 11:01:29.471', '2026-08-19 11:05:09.032', NULL, NULL, NULL, '[]', NULL, '2026-08-14', 9),
(85, 'pizza', 'SKU1786015061103-6113', '579868055', 50, 700, 'Grocery', '565', '', 'Active', 1, 6, '56757', 60, 600, 1, 'box', 'PCS', 'PCS', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, 'retret', NULL, NULL, 1, '2026-08-06 11:17:41.173', '2026-08-18 13:09:49.871', NULL, NULL, NULL, '[]', NULL, '2026-08-08', 3),
(86, 'table', '456', '985946291', 200, 780, 'Furniture', 'amazon', '', 'Active', 1, 5, '3435', 700, 800, 1, 'bag ', 'Pack', 'Pack', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, 'fhf', NULL, NULL, 1, '2026-08-06 11:18:46.596', '2026-08-18 13:09:49.883', NULL, NULL, NULL, '[]', NULL, '2026-08-08', 7),
(87, 'pizzaq12', 'SKU1786187462644-8298', '627212470', 0, 0, 'Mobile', '', '', 'Active', 224, 0, '', 0, 0, 0, 'packet', 'box', 'box', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, 1, '2026-08-08 11:11:02.695', '2026-08-18 13:09:49.888', NULL, NULL, NULL, '[]', NULL, '2026-08-08', 30),
(88, 'Ttshirt full', '21313424', '959027973', 200, 200, 'Fashion', 'amazon', '', 'Active', 34, 0, '21344', 100, 100, 10, 'Pack', 'PCS', 'PCS', 0, 0, 0, 0, 0, 0, '[{\"minQty\":\"10\",\"maxQty\":\"50\",\"price\":\"50\"}]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, 1, '2026-08-11 06:30:52.315', '2026-08-19 06:30:03.106', NULL, NULL, NULL, '[{\"size\":\"S\",\"color\":\"Black\",\"qty\":5,\"barcode\":\"234325435\",\"mrp\":100,\"price\":120,\"name\":\"S Black\"},{\"size\":\"M\",\"color\":\"Black\",\"qty\":5,\"barcode\":\"5754757\",\"mrp\":150,\"price\":150,\"name\":\"M Black\"},{\"size\":\"L\",\"color\":\"Black\",\"qty\":5,\"barcode\":\"345435\",\"mrp\":200,\"price\":200,\"name\":\"L Black\"}]', NULL, '2026-08-11', 3),
(89, 'colgate', '5435', '615184472', 500, 6000, 'Grocery', 'nokia', '', 'Active', 16, 4, '4564', 400, 700, 1, 'bag ', 'packet', 'packet', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, 1, '2026-08-12 05:38:57.305', '2026-08-18 13:09:49.866', NULL, NULL, NULL, '[]', NULL, '2026-08-14', 0),
(90, 'tablet', '45456', '985946292', 180, 200, 'Cosmetics', 'hospital', '', 'Inactive', 4, 5, '4546', 150, 200, 10, 'box', 'PCS', 'PCS', 0, 0, 0, 0, 0, 0, '[]', 0, '', '', 0, '[]', 0, '', '', 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, 'medicine', NULL, NULL, 1, '2026-08-14 09:13:24.955', '2026-08-14 11:52:34.277', NULL, NULL, NULL, '[]', NULL, '2026-08-14', 8);

-- --------------------------------------------------------

--
-- Table structure for table `productattributevalue`
--

CREATE TABLE `productattributevalue` (
  `id` int(11) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`value`)),
  `productId` int(11) NOT NULL,
  `attributeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producttag`
--

CREATE TABLE `producttag` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicereminder`
--

CREATE TABLE `servicereminder` (
  `id` int(11) NOT NULL,
  `partyName` varchar(191) NOT NULL,
  `productName` varchar(191) DEFAULT NULL,
  `contactPerson` varchar(191) DEFAULT NULL,
  `mobileNo` varchar(191) DEFAULT NULL,
  `serviceDate` datetime(3) NOT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servicereminder`
--

INSERT INTO `servicereminder` (`id`, `partyName`, `productName`, `contactPerson`, `mobileNo`, `serviceDate`, `note`, `status`, `companyId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Customer Name', 'Service Type', NULL, NULL, '2026-07-10 10:53:08.235', 'New reminder added', 'Pending', 1, '2026-07-10 10:53:08.286', '2026-07-10 11:02:38.484', '2026-07-10 11:02:38.482'),
(2, 'eqw3', '1q1', NULL, NULL, '2026-07-19 00:00:00.000', '12324', 'Pending', 1, '2026-07-10 11:07:58.069', '2026-07-10 11:07:58.069', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stockadjustmentlog`
--

CREATE TABLE `stockadjustmentlog` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `oldStock` int(11) NOT NULL,
  `newStock` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionplan`
--

CREATE TABLE `subscriptionplan` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`features`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptionplan`
--

INSERT INTO `subscriptionplan` (`id`, `name`, `price`, `features`) VALUES
(1, 'Basic', 499, '{\"invoices\":100,\"users\":2,\"storage\":\"1GB\",\"userLimit\":\"10\",\"storageCapacity\":\"5GB\",\"planType\":\"Monthly\"}'),
(2, 'Pro', 1499, '{\"invoices\":1000,\"users\":10,\"storage\":\"10GB\",\"userLimit\":\"20\",\"planType\":\"Yearly\"}'),
(3, 'Enterprise', 4999, '{\"invoices\":\"Unlimited\",\"users\":\"Unlimited\",\"storage\":\"100GB\",\"planType\":\"Lifetime\"}');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `uqc` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `compareTo` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `uqc`, `value`, `compareTo`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'PCS', 'PCS-PIECES', '1', '—', 1, '2026-07-02 13:28:32.171', '2026-07-02 13:28:32.171'),
(2, 'box', 'KGS-KILOGRAMS', '5', '5', 1, '2026-07-02 13:29:43.234', '2026-07-02 13:29:43.234'),
(3, 'packet', 'PCS-PIECES', '1', '—', 1, '2026-07-07 09:04:31.064', '2026-07-07 09:04:31.064'),
(4, 'Pack', 'PCS-PIECES', '1', '—', 1, '2026-07-07 09:04:50.631', '2026-07-07 09:04:50.631'),
(6, 'bag ', 'ba', '1', '—', 1, '2026-07-11 10:04:14.996', '2026-07-11 10:04:14.996'),
(7, 'PKT', 'pk', '1', '—', 1, '2026-07-11 10:06:14.002', '2026-07-11 10:06:14.002'),
(8, 'bottle ', 'litre', '1', '—', 1, '2026-07-11 10:34:11.151', '2026-07-11 10:34:11.151'),
(9, 'Millilitre', 'mill', '1', '—', 1, '2026-07-11 11:12:37.624', '2026-07-11 11:12:37.624');

-- --------------------------------------------------------

--
-- Table structure for table `unitconversion`
--

CREATE TABLE `unitconversion` (
  `id` int(11) NOT NULL,
  `baseUnit` varchar(191) NOT NULL,
  `baseQty` double NOT NULL,
  `targetUnit` varchar(191) NOT NULL,
  `targetQty` double NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unitconversion`
--

INSERT INTO `unitconversion` (`id`, `baseUnit`, `baseQty`, `targetUnit`, `targetQty`, `isActive`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'PCS', 1, 'PCS', 4, 1, 1, '2026-07-07 05:30:59.189', '2026-07-07 05:30:59.189'),
(2, 'bag ', 1, 'Pack', 20, 1, 1, '2026-07-11 10:04:39.437', '2026-07-11 10:04:39.437'),
(3, 'PKT', 1, 'Pack', 12, 1, 1, '2026-07-11 10:06:23.004', '2026-07-11 10:06:23.004'),
(4, 'PKT', 1, 'Pack', 12, 1, 1, '2026-07-11 10:13:00.571', '2026-07-11 10:13:00.571'),
(5, 'bottle ', 1, 'bottle ', 10, 1, 1, '2026-07-11 10:34:24.981', '2026-07-11 10:34:24.981'),
(6, 'Millilitre', 1, 'box', 14, 1, 1, '2026-07-11 11:13:00.298', '2026-07-11 11:13:00.298'),
(7, 'bottle ', 1, 'PKT', 12, 1, 1, '2026-07-13 11:21:08.596', '2026-07-13 11:21:08.596'),
(8, 'packet', 1, 'box', 12, 1, 1, '2026-07-14 07:29:44.732', '2026-07-14 07:29:44.732'),
(9, 'Pack', 1, 'box', 12, 1, 1, '2026-07-14 07:33:01.305', '2026-07-14 07:33:01.305'),
(10, 'Pack', 1, 'box1', 10, 1, 1, '2026-07-16 10:11:13.972', '2026-07-16 10:11:13.972'),
(11, 'Pack', 1, 'box1', 10, 1, 1, '2026-07-16 10:11:45.801', '2026-07-16 10:11:45.801'),
(12, 'bottle ', 1, 'Millilitre', 13, 1, 1, '2026-07-16 10:24:48.587', '2026-07-16 10:24:48.587'),
(13, 'bottle ', 1, 'Millilitre', 12, 1, 1, '2026-07-16 10:29:03.488', '2026-07-16 10:29:03.488'),
(14, 'packet', 1, 'box', 12, 1, 1, '2026-07-16 10:33:32.555', '2026-07-16 10:33:32.555'),
(15, 'box', 1, 'PCS', 10, 1, 1, '2026-07-16 10:52:26.662', '2026-07-16 10:52:26.662'),
(16, 'Pack', 1, 'PCS', 10, 1, 1, '2026-07-16 11:07:31.440', '2026-07-16 11:07:31.440'),
(17, 'Pack', 1, 'PCS', 10, 1, 1, '2026-07-16 11:09:48.244', '2026-07-16 11:09:48.244'),
(18, 'Pack', 1, 'PCS', 12, 1, 1, '2026-07-16 12:01:00.099', '2026-07-16 12:01:00.099'),
(19, 'Pack', 1, 'PCS', 10, 1, 1, '2026-07-16 12:05:25.270', '2026-07-16 12:05:25.270'),
(20, 'Pack', 1, 'PCS', 23, 1, 1, '2026-07-16 12:08:09.395', '2026-07-16 12:08:09.395'),
(21, 'Pack', 1, 'packet', 10, 1, 1, '2026-07-16 12:23:32.650', '2026-07-16 12:23:32.650'),
(22, 'box', 1, 'PCS', 10, 1, 1, '2026-07-16 13:02:49.946', '2026-07-16 13:02:49.946'),
(23, 'box', 1, 'box', 10, 1, 1, '2026-07-16 13:16:46.405', '2026-07-16 13:16:46.405'),
(24, 'PKT', 1, 'box', 10, 1, 1, '2026-07-21 06:23:45.562', '2026-07-21 06:23:45.562'),
(25, 'box', 1, 'PCS', 10, 1, 1, '2026-07-21 07:35:25.461', '2026-07-21 07:35:25.461'),
(26, 'box', 1, 'Pack', 10, 1, 1, '2026-07-23 05:05:42.931', '2026-07-23 05:05:42.931'),
(27, 'box', 1, 'PCS', 10, 1, 1, '2026-07-24 13:17:22.670', '2026-07-24 13:17:22.670'),
(28, 'box', 1, 'PCS', 10, 1, 1, '2026-07-24 13:18:23.317', '2026-07-24 13:18:23.317'),
(29, 'box', 1, 'PCS', 10, 1, 1, '2026-07-30 06:59:12.891', '2026-07-30 06:59:12.891'),
(30, 'box', 1, 'PCS', 2, 1, 1, '2026-07-30 07:00:17.220', '2026-07-30 07:00:17.220'),
(31, 'box', 1, 'PCS', 10, 1, 1, '2026-07-30 07:03:23.033', '2026-07-30 07:03:23.033'),
(32, 'box', 1, 'Pack', 10, 1, 1, '2026-07-31 06:27:11.447', '2026-07-31 06:27:11.447'),
(33, 'box', 1, 'PCS', 10, 1, 1, '2026-07-31 11:30:19.795', '2026-07-31 11:30:19.795'),
(34, 'box', 1, 'PCS', 10, 1, 1, '2026-07-31 11:30:21.883', '2026-07-31 11:30:21.883'),
(35, 'PKT', 1, 'Pack', 10, 1, 1, '2026-08-04 05:31:14.538', '2026-08-04 05:31:14.538'),
(36, 'bottle ', 1, 'PKT', 10, 1, 1, '2026-08-06 07:52:28.735', '2026-08-06 07:52:28.735'),
(37, 'PKT', 1, 'Pack', 10, 1, 1, '2026-08-06 08:36:09.780', '2026-08-06 08:36:09.780'),
(38, 'Pack', 1, 'packet', 10, 1, 1, '2026-08-06 08:55:12.405', '2026-08-06 08:55:12.405'),
(39, 'packet', 1, 'PCS', 10, 1, 1, '2026-08-06 09:06:35.188', '2026-08-06 09:06:35.188'),
(40, 'PKT', 1, 'bag ', 19, 1, 1, '2026-08-06 10:42:29.953', '2026-08-06 10:42:29.953'),
(41, 'box', 1, 'PCS', 10, 1, 1, '2026-08-06 10:52:01.599', '2026-08-06 10:52:01.599'),
(42, 'box', 1, 'PCS', 10, 1, 1, '2026-08-06 10:53:16.300', '2026-08-06 10:53:16.300'),
(43, 'box', 1, 'PKT', 10, 1, 1, '2026-08-06 11:01:15.672', '2026-08-06 11:01:15.672'),
(44, 'box', 1, 'PCS', 10, 1, 1, '2026-08-06 11:17:21.914', '2026-08-06 11:17:21.914'),
(45, 'bag ', 1, 'Pack', 10, 1, 1, '2026-08-06 11:18:43.869', '2026-08-06 11:18:43.869'),
(46, 'box', 1, 'packet', 10, 1, 1, '2026-08-08 11:09:48.865', '2026-08-08 11:09:48.865'),
(47, 'packet', 1, 'box', 10, 1, 1, '2026-08-08 11:10:50.238', '2026-08-08 11:10:50.238'),
(48, 'Pack', 1, 'PCS', 10, 1, 1, '2026-08-11 06:30:10.153', '2026-08-11 06:30:10.153'),
(49, 'bag ', 1, 'packet', 10, 1, 1, '2026-08-12 05:38:43.885', '2026-08-12 05:38:43.885'),
(50, 'box', 1, 'PCS', 10, 1, 1, '2026-08-14 09:12:56.378', '2026-08-14 09:12:56.378');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` enum('SUPERADMIN','COMPANY_ADMIN','STAFF') NOT NULL DEFAULT 'STAFF',
  `companyId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `notificationPermissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notificationPermissions`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `companyId`, `createdAt`, `updatedAt`, `notificationPermissions`) VALUES
(2, 'Admin', 'admin@gmail.com', '$2b$10$6xkL2gLgjUTlCvJlgLqR6uQMfz9OlLIRTCM1.0bX16xiZ1HlCJfe.', 'COMPANY_ADMIN', 1, '2026-07-02 11:12:05.958', '2026-08-11 09:43:41.476', NULL),
(4, 'Company Admin', 'companyadmin@osbooks.com', '$2b$10$bRcWIes1ayusSuJC7b6It.pHxQ/fx7x6cEsBVGfM5lj4dzs.a8HvK', 'COMPANY_ADMIN', 1, '2026-07-07 11:59:46.158', '2026-07-20 11:08:06.292', NULL),
(5, 'Demo', 'demo@gmail.com', '$2b$10$v57Ku5IaWpflbDtE6wsQb.Ky/cs3lemXqJu0G6DmRGX4kXE9BFAyG', 'COMPANY_ADMIN', 3, '2026-07-08 07:01:44.576', '2026-08-11 09:50:23.001', NULL),
(6, 'lalit', 'lalit@gmail.com', '$2b$10$f9QuDkTZWPbe7u6aoJZ00e8HdU/HUalmwJwW.omBKp4FrOF/pZU/W', 'COMPANY_ADMIN', 4, '2026-07-17 07:27:42.483', '2026-07-17 07:29:00.635', NULL),
(7, 'demo ', 'demo1@gmail.com', '$2b$10$.i1icXujksggnlHMiZgASe2yc67q6f8LvWxLyMmSXGVyVibZfk3n.', 'COMPANY_ADMIN', 5, '2026-07-17 07:41:21.091', '2026-07-17 11:54:45.148', NULL),
(8, 'DEMO ', 'user_1784364117169@1.local', '$2b$10$fw6leumY5i9eYmEUP4EHLenZ2VVCCnRUXz7P26dvpXXpbU0Lhd/9G', 'COMPANY_ADMIN', 1, '2026-07-18 08:41:57.340', '2026-07-18 08:41:57.340', '{\"allowFirms\":[\"swayam billing software\"],\"stores\":[\"Branch 1\"],\"books\":[\"Cash Book\"]}'),
(9, 'DEMO ', 'user_1784364119244@1.local', '$2b$10$A0BGb//.DAEoc.fswZhHZ.y7Mg.cnrr6rX6xi2Vx8ULU.Wlop.JcO', 'COMPANY_ADMIN', 1, '2026-07-18 08:41:59.414', '2026-07-18 08:41:59.414', '{\"allowFirms\":[\"swayam billing software\"],\"stores\":[\"Branch 1\"],\"books\":[\"Cash Book\"]}'),
(10, 'Super Admin', 'billbook@gmail.com', '$2b$10$H0Gp9/nU1hy3Irvamjou2uxbPtBDFxw0C1a8Cg/qKyjRlnIV5PYD.', 'SUPERADMIN', NULL, '2026-07-28 06:53:22.667', '2026-07-28 06:53:22.736', NULL),
(11, 'jma', 'jma@gmail.com', '$2b$10$.G./4PS5g3yz1sIUIUXCm.9IZLm2t6eGqCPW/tDnXk8x3yzmsIB0e', 'COMPANY_ADMIN', 6, '2026-08-11 09:51:47.271', '2026-08-11 09:51:47.271', NULL),
(12, 'jmaq', 'jamq@gmail.com', '$2b$10$1ZoalAT8SKZPdLR0oWL/fOjIhxn2TacImGVpcDRGbO77lVwQgGG7a', 'COMPANY_ADMIN', 7, '2026-08-11 09:53:30.508', '2026-08-11 09:53:30.508', NULL),
(13, 'satayama ', 'satayma@gmail.com', '$2b$10$dOs35zU4m68WufJpIxLIUepFkTmv3OXJxNojPEAlNi1lQY1iDb3Ri', 'COMPANY_ADMIN', 8, '2026-08-11 10:01:56.600', '2026-08-11 10:01:56.600', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `voucherId` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `head` varchar(191) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `voucherId`, `type`, `head`, `companyId`, `createdAt`, `updatedAt`) VALUES
(14, '45', 'Company Purchase', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(15, '134', 'Customer Sale', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(16, '1', 'Customer Sale Return', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(17, '6', 'Bank Ledger', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(18, '2', 'Customer Challan Invoice', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(19, '1', 'Complain Booking', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(20, '4', 'Customer Quotation', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(21, '8', 'Customer Payment', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(22, '1', 'Stock Adjustment', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(23, '3', 'Customer Sale Order', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(24, '2', 'Company Payment', '', 3, '2026-07-31 12:12:17.368', '2026-07-31 12:12:17.368'),
(25, '45', 'Company Purchase', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(26, '134', 'Customer Sale', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(27, '1', 'Customer Sale Return', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(28, '6', 'Bank Ledger', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(29, '2', 'Customer Challan Invoice', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(30, '1', 'Complain Booking', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(31, '4', 'Customer Quotation', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(32, '8', 'Customer Payment', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(33, '1', 'Stock Adjustment', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(34, '3', 'Customer Sale Order', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(35, '2', 'Company Payment', '', 4, '2026-07-31 12:12:17.377', '2026-07-31 12:12:17.377'),
(36, '45', 'Company Purchase', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(37, '134', 'Customer Sale', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(38, '1', 'Customer Sale Return', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(39, '6', 'Bank Ledger', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(40, '2', 'Customer Challan Invoice', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(41, '1', 'Complain Booking', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(42, '4', 'Customer Quotation', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(43, '8', 'Customer Payment', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(44, '1', 'Stock Adjustment', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(45, '3', 'Customer Sale Order', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(46, '2', 'Company Payment', '', 5, '2026-07-31 12:12:17.388', '2026-07-31 12:12:17.388'),
(48, '1', 'Company Purchase', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(49, '1', 'Customer Sale', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(50, '1', 'Customer Sale Return', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(51, '1', 'Bank Ledger', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(52, '1', 'Customer Challan Invoice', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(53, '1', 'Complain Booking', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(54, '1', 'Customer Quotation', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(55, '1', 'Customer Payment', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(56, '1', 'Stock Adjustment', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(57, '1', 'Customer Sale Order', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(58, '1', 'Company Payment', '', 6, '2026-08-11 09:51:47.301', '2026-08-11 09:51:47.301'),
(59, '1', 'Company Purchase', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(60, '1', 'Customer Sale', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(61, '1', 'Customer Sale Return', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(62, '1', 'Bank Ledger', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(63, '1', 'Customer Challan Invoice', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(64, '1', 'Complain Booking', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(65, '1', 'Customer Quotation', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(66, '1', 'Customer Payment', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(67, '1', 'Stock Adjustment', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(68, '1', 'Customer Sale Order', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(69, '1', 'Company Payment', '', 7, '2026-08-11 09:53:30.511', '2026-08-11 09:53:30.511'),
(70, '1', 'Company Purchase', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(71, '1', 'Customer Sale', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(72, '1', 'Customer Sale Return', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(73, '1', 'Bank Ledger', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(74, '1', 'Customer Challan Invoice', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(75, '1', 'Complain Booking', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(76, '1', 'Customer Quotation', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(77, '1', 'Customer Payment', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(78, '1', 'Stock Adjustment', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(79, '1', 'Customer Sale Order', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604'),
(80, '1', 'Company Payment', '', 8, '2026-08-11 10:01:56.604', '2026-08-11 10:01:56.604');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `branchId` int(11) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehousestock`
--

CREATE TABLE `warehousestock` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Attendance_employeeId_date_key` (`employeeId`,`date`),
  ADD KEY `attendance_companyId_fkey` (`companyId`);

--
-- Indexes for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditlog_companyId_fkey` (`companyId`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_companyId_fkey` (`companyId`);

--
-- Indexes for table `bankstatement`
--
ALTER TABLE `bankstatement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bankstatement_bankId_fkey` (`bankId`),
  ADD KEY `bankstatement_companyId_fkey` (`companyId`);

--
-- Indexes for table `bankstatementrecord`
--
ALTER TABLE `bankstatementrecord`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bankstatementrecord_statementId_fkey` (`statementId`),
  ADD KEY `bankstatementrecord_companyId_fkey` (`companyId`);

--
-- Indexes for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banktransaction_fromBankId_fkey` (`fromBankId`),
  ADD KEY `banktransaction_toBankId_fkey` (`toBankId`),
  ADD KEY `banktransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `barcodetemplate`
--
ALTER TABLE `barcodetemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodetemplate_companyId_fkey` (`companyId`);

--
-- Indexes for table `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bom_companyId_fkey` (`companyId`);

--
-- Indexes for table `bomitem`
--
ALTER TABLE `bomitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bomitem_bomId_fkey` (`bomId`),
  ADD KEY `bomitem_productId_fkey` (`productId`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_companyId_fkey` (`companyId`);

--
-- Indexes for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashbook_companyId_fkey` (`companyId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_companyId_fkey` (`companyId`);

--
-- Indexes for table `categoryattribute`
--
ALTER TABLE `categoryattribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryattribute_categoryId_fkey` (`categoryId`);

--
-- Indexes for table `categoryunit`
--
ALTER TABLE `categoryunit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CategoryUnit_categoryId_unitId_key` (`categoryId`,`unitId`),
  ADD KEY `categoryunit_unitId_fkey` (`unitId`);

--
-- Indexes for table `commissiontype`
--
ALTER TABLE `commissiontype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commissiontype_companyId_fkey` (`companyId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Company_ownerEmail_key` (`ownerEmail`),
  ADD KEY `company_planId_fkey` (`planId`);

--
-- Indexes for table `companysetting`
--
ALTER TABLE `companysetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CompanySetting_companyId_key` (`companyId`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_companyId_fkey` (`companyId`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Currency_code_key` (`code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_companyId_fkey` (`companyId`);

--
-- Indexes for table `customerpayment`
--
ALTER TABLE `customerpayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerpayment_customerId_fkey` (`customerId`),
  ADD KEY `customerpayment_companyId_fkey` (`companyId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_companyId_fkey` (`companyId`);

--
-- Indexes for table `employeetransaction`
--
ALTER TABLE `employeetransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeetransaction_employeeId_fkey` (`employeeId`),
  ADD KEY `employeetransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_companyId_fkey` (`companyId`);

--
-- Indexes for table `expensetransaction`
--
ALTER TABLE `expensetransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expensetransaction_expenseId_fkey` (`expenseId`),
  ADD KEY `expensetransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `followup`
--
ALTER TABLE `followup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followup_customerId_fkey` (`customerId`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_companyId_fkey` (`companyId`);

--
-- Indexes for table `incometransaction`
--
ALTER TABLE `incometransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incometransaction_incomeId_fkey` (`incomeId`),
  ADD KEY `incometransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_customerId_fkey` (`customerId`),
  ADD KEY `invoice_companyId_fkey` (`companyId`);

--
-- Indexes for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceitem_invoiceId_fkey` (`invoiceId`),
  ADD KEY `invoiceitem_productId_fkey` (`productId`);

--
-- Indexes for table `loadingsheet`
--
ALTER TABLE `loadingsheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loadingsheet_companyId_fkey` (`companyId`);

--
-- Indexes for table `loadingsheetitem`
--
ALTER TABLE `loadingsheetitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loadingsheetitem_loadingSheetId_fkey` (`loadingSheetId`),
  ADD KEY `loadingsheetitem_invoiceId_fkey` (`invoiceId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_branchId_fkey` (`branchId`),
  ADD KEY `location_companyId_fkey` (`companyId`);

--
-- Indexes for table `messagetemplate`
--
ALTER TABLE `messagetemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messagetemplate_companyId_fkey` (`companyId`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_companyId_fkey` (`companyId`);

--
-- Indexes for table `partysetting`
--
ALTER TABLE `partysetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PartySetting_companyId_key` (`companyId`);

--
-- Indexes for table `partytag`
--
ALTER TABLE `partytag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partytag_companyId_fkey` (`companyId`);

--
-- Indexes for table `paymentbook`
--
ALTER TABLE `paymentbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentbook_companyId_fkey` (`companyId`);

--
-- Indexes for table `paymentbooktransaction`
--
ALTER TABLE `paymentbooktransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentbooktransaction_paymentBookId_fkey` (`paymentBookId`),
  ADD KEY `paymentbooktransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Product_sku_companyId_key` (`sku`,`companyId`),
  ADD KEY `product_companyId_fkey` (`companyId`);

--
-- Indexes for table `productattributevalue`
--
ALTER TABLE `productattributevalue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProductAttributeValue_productId_attributeId_key` (`productId`,`attributeId`),
  ADD KEY `productattributevalue_attributeId_fkey` (`attributeId`);

--
-- Indexes for table `producttag`
--
ALTER TABLE `producttag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producttag_companyId_fkey` (`companyId`);

--
-- Indexes for table `servicereminder`
--
ALTER TABLE `servicereminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicereminder_companyId_fkey` (`companyId`);

--
-- Indexes for table `stockadjustmentlog`
--
ALTER TABLE `stockadjustmentlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stockadjustmentlog_productId_fkey` (`productId`),
  ADD KEY `stockadjustmentlog_companyId_fkey` (`companyId`);

--
-- Indexes for table `subscriptionplan`
--
ALTER TABLE `subscriptionplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_companyId_fkey` (`companyId`);

--
-- Indexes for table `unitconversion`
--
ALTER TABLE `unitconversion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unitconversion_companyId_fkey` (`companyId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`),
  ADD KEY `user_companyId_fkey` (`companyId`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_companyId_fkey` (`companyId`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_branchId_fkey` (`branchId`),
  ADD KEY `warehouse_locationId_fkey` (`locationId`),
  ADD KEY `warehouse_companyId_fkey` (`companyId`);

--
-- Indexes for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehousestock_productId_warehouseId_key` (`productId`,`warehouseId`),
  ADD KEY `warehousestock_warehouseId_fkey` (`warehouseId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auditlog`
--
ALTER TABLE `auditlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bankstatement`
--
ALTER TABLE `bankstatement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bankstatementrecord`
--
ALTER TABLE `bankstatementrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banktransaction`
--
ALTER TABLE `banktransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `barcodetemplate`
--
ALTER TABLE `barcodetemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bom`
--
ALTER TABLE `bom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bomitem`
--
ALTER TABLE `bomitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `categoryattribute`
--
ALTER TABLE `categoryattribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `categoryunit`
--
ALTER TABLE `categoryunit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissiontype`
--
ALTER TABLE `commissiontype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `companysetting`
--
ALTER TABLE `companysetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `customerpayment`
--
ALTER TABLE `customerpayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employeetransaction`
--
ALTER TABLE `employeetransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expensetransaction`
--
ALTER TABLE `expensetransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `followup`
--
ALTER TABLE `followup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `incometransaction`
--
ALTER TABLE `incometransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;

--
-- AUTO_INCREMENT for table `loadingsheet`
--
ALTER TABLE `loadingsheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loadingsheetitem`
--
ALTER TABLE `loadingsheetitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messagetemplate`
--
ALTER TABLE `messagetemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partysetting`
--
ALTER TABLE `partysetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partytag`
--
ALTER TABLE `partytag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentbook`
--
ALTER TABLE `paymentbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paymentbooktransaction`
--
ALTER TABLE `paymentbooktransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `productattributevalue`
--
ALTER TABLE `productattributevalue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `producttag`
--
ALTER TABLE `producttag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicereminder`
--
ALTER TABLE `servicereminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stockadjustmentlog`
--
ALTER TABLE `stockadjustmentlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptionplan`
--
ALTER TABLE `subscriptionplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `unitconversion`
--
ALTER TABLE `unitconversion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehousestock`
--
ALTER TABLE `warehousestock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD CONSTRAINT `auditlog_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bankstatement`
--
ALTER TABLE `bankstatement`
  ADD CONSTRAINT `bankstatement_bankId_fkey` FOREIGN KEY (`bankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bankstatement_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bankstatementrecord`
--
ALTER TABLE `bankstatementrecord`
  ADD CONSTRAINT `bankstatementrecord_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bankstatementrecord_statementId_fkey` FOREIGN KEY (`statementId`) REFERENCES `bankstatement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD CONSTRAINT `banktransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banktransaction_fromBankId_fkey` FOREIGN KEY (`fromBankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banktransaction_toBankId_fkey` FOREIGN KEY (`toBankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barcodetemplate`
--
ALTER TABLE `barcodetemplate`
  ADD CONSTRAINT `barcodetemplate_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `bom_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bomitem`
--
ALTER TABLE `bomitem`
  ADD CONSTRAINT `bomitem_bomId_fkey` FOREIGN KEY (`bomId`) REFERENCES `bom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bomitem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cashbook`
--
ALTER TABLE `cashbook`
  ADD CONSTRAINT `cashbook_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categoryattribute`
--
ALTER TABLE `categoryattribute`
  ADD CONSTRAINT `categoryattribute_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categoryunit`
--
ALTER TABLE `categoryunit`
  ADD CONSTRAINT `categoryunit_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categoryunit_unitId_fkey` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commissiontype`
--
ALTER TABLE `commissiontype`
  ADD CONSTRAINT `commissiontype_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `subscriptionplan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `companysetting`
--
ALTER TABLE `companysetting`
  ADD CONSTRAINT `companysetting_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customerpayment`
--
ALTER TABLE `customerpayment`
  ADD CONSTRAINT `customerpayment_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customerpayment_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeetransaction`
--
ALTER TABLE `employeetransaction`
  ADD CONSTRAINT `employeetransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employeetransaction_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expensetransaction`
--
ALTER TABLE `expensetransaction`
  ADD CONSTRAINT `expensetransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expensetransaction_expenseId_fkey` FOREIGN KEY (`expenseId`) REFERENCES `expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `followup`
--
ALTER TABLE `followup`
  ADD CONSTRAINT `followup_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incometransaction`
--
ALTER TABLE `incometransaction`
  ADD CONSTRAINT `incometransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incometransaction_incomeId_fkey` FOREIGN KEY (`incomeId`) REFERENCES `income` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD CONSTRAINT `invoiceitem_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoiceitem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `loadingsheet`
--
ALTER TABLE `loadingsheet`
  ADD CONSTRAINT `loadingsheet_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loadingsheetitem`
--
ALTER TABLE `loadingsheetitem`
  ADD CONSTRAINT `loadingsheetitem_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loadingsheetitem_loadingSheetId_fkey` FOREIGN KEY (`loadingSheetId`) REFERENCES `loadingsheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messagetemplate`
--
ALTER TABLE `messagetemplate`
  ADD CONSTRAINT `messagetemplate_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partysetting`
--
ALTER TABLE `partysetting`
  ADD CONSTRAINT `partysetting_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partytag`
--
ALTER TABLE `partytag`
  ADD CONSTRAINT `partytag_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paymentbook`
--
ALTER TABLE `paymentbook`
  ADD CONSTRAINT `paymentbook_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paymentbooktransaction`
--
ALTER TABLE `paymentbooktransaction`
  ADD CONSTRAINT `paymentbooktransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paymentbooktransaction_paymentBookId_fkey` FOREIGN KEY (`paymentBookId`) REFERENCES `paymentbook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productattributevalue`
--
ALTER TABLE `productattributevalue`
  ADD CONSTRAINT `productattributevalue_attributeId_fkey` FOREIGN KEY (`attributeId`) REFERENCES `categoryattribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productattributevalue_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producttag`
--
ALTER TABLE `producttag`
  ADD CONSTRAINT `producttag_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `servicereminder`
--
ALTER TABLE `servicereminder`
  ADD CONSTRAINT `servicereminder_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stockadjustmentlog`
--
ALTER TABLE `stockadjustmentlog`
  ADD CONSTRAINT `stockadjustmentlog_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stockadjustmentlog_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unitconversion`
--
ALTER TABLE `unitconversion`
  ADD CONSTRAINT `unitconversion_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_locationId_fkey` FOREIGN KEY (`locationId`) REFERENCES `location` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD CONSTRAINT `warehousestock_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehousestock_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
