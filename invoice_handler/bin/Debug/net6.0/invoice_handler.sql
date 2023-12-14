-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 26. 13:26
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `invoice_handler`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `invoicedetails_id` int(11) NOT NULL,
  `invoiceCategory` varchar(50) DEFAULT NULL COMMENT 'NORMAL\nSIMPLIFIED\nAGGREGATE',
  `invoiceDeliveryDate` date DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL COMMENT 'TRANSFER\nCASH\nCARD\nVOUCHER\nOTHER',
  `currencyCode` varchar(3) DEFAULT 'HUF',
  `exchangeRate` decimal(14,6) DEFAULT 1.000000,
  `smallBusinessIndicator` tinyint(4) DEFAULT 0,
  `invoiceNetAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `invoiceVatAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `invoiceGrossAmount` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `invoicedetails`
--

INSERT INTO `invoicedetails` (`invoicedetails_id`, `invoiceCategory`, `invoiceDeliveryDate`, `paymentDate`, `paymentMethod`, `currencyCode`, `exchangeRate`, `smallBusinessIndicator`, `invoiceNetAmount`, `invoiceVatAmount`, `invoiceGrossAmount`) VALUES
(1, 'NORMAL', '2022-01-07', '2022-01-07', 'CASH', 'HUF', 1.000000, 0, 12069.00, 603.00, 12672.00),
(2, 'NORMAL', '2022-01-27', '2022-01-27', 'CASH', 'HUF', 1.000000, 0, 22396.00, 1119.00, 23515.00),
(3, 'NORMAL', '2022-01-28', '2022-01-28', 'CASH', 'HUF', 1.000000, 0, 20309.00, 1015.00, 21324.00),
(4, 'NORMAL', '2022-02-06', '2022-02-06', 'CARD', 'HUF', 1.000000, 0, 9092.00, 454.00, 9546.00),
(5, 'NORMAL', '2022-02-08', '2022-02-08', 'CARD', 'HUF', 1.000000, 0, 26232.00, 1311.00, 27543.00),
(6, 'NORMAL', '2022-02-20', '2022-02-20', 'CARD', 'HUF', 1.000000, 0, 25372.00, 1268.00, 26640.00),
(7, 'NORMAL', '2022-03-24', '2022-03-24', 'CARD', 'HUF', 1.000000, 0, 20842.00, 1042.00, 21884.00),
(8, 'NORMAL', '2022-03-28', '2022-03-28', 'CARD', 'HUF', 1.000000, 0, 24608.00, 1230.00, 25838.00),
(9, 'NORMAL', '2022-04-02', '2022-04-02', 'CARD', 'HUF', 1.000000, 0, 20387.00, 1019.00, 21406.00),
(10, 'NORMAL', '2022-04-16', '2022-04-16', 'CARD', 'HUF', 1.000000, 0, 25372.00, 1268.00, 26640.00),
(11, 'NORMAL', '2022-04-18', '2022-04-18', 'CASH', 'HUF', 1.000000, 0, 22614.00, 1130.00, 23744.00),
(12, 'NORMAL', '2022-04-25', '2022-04-25', 'CARD', 'HUF', 1.000000, 0, 27303.00, 1365.00, 28668.00),
(13, 'NORMAL', '2022-04-25', '2022-04-25', 'CARD', 'HUF', 1.000000, 0, 17544.00, 877.00, 18421.00),
(14, 'NORMAL', '2022-05-02', '2022-05-02', 'CARD', 'HUF', 1.000000, 0, 31238.00, 1561.00, 32799.00),
(15, 'NORMAL', '2022-05-08', '2022-05-08', 'CASH', 'HUF', 1.000000, 0, 12296.00, 614.00, 12910.00),
(16, 'NORMAL', '2022-05-20', '2022-05-20', 'CASH', 'HUF', 1.000000, 0, 36667.00, 1833.00, 38500.00),
(17, 'NORMAL', '2022-05-29', '2022-05-29', 'CASH', 'HUF', 1.000000, 0, 13707.00, 685.00, 14392.00),
(18, 'NORMAL', '2022-06-02', '2022-06-02', 'CASH', 'HUF', 1.000000, 0, 7844.00, 392.00, 8236.00),
(19, 'NORMAL', '2022-06-06', '2022-06-06', 'CASH', 'HUF', 1.000000, 0, 23591.00, 1179.00, 24770.00),
(20, 'NORMAL', '2022-06-10', '2022-06-10', 'CASH', 'HUF', 1.000000, 0, 17544.00, 877.00, 18421.00),
(21, 'NORMAL', '2022-06-14', '2022-06-14', 'CASH', 'HUF', 1.000000, 0, 12443.00, 622.00, 13065.00),
(22, 'NORMAL', '2022-06-18', '2022-06-18', 'CASH', 'HUF', 1.000000, 0, 16674.00, 833.00, 17507.00),
(23, 'NORMAL', '2022-06-20', '2022-06-20', 'CASH', 'HUF', 1.000000, 0, 9092.00, 454.00, 9546.00),
(24, 'NORMAL', '2022-06-23', '2022-06-23', 'CASH', 'HUF', 1.000000, 0, 9956.00, 497.00, 10453.00),
(25, 'NORMAL', '2022-07-21', '2022-07-21', 'CASH', 'HUF', 1.000000, 0, 19719.00, 985.00, 20704.00),
(26, 'NORMAL', '2022-08-21', '2022-08-21', 'CASH', 'HUF', 1.000000, 0, 13707.00, 685.00, 14392.00),
(27, 'NORMAL', '2022-09-02', '2022-09-02', 'CASH', 'HUF', 1.000000, 0, 14499.00, 724.00, 15223.00),
(28, 'NORMAL', '2022-09-03', '2022-09-03', 'CASH', 'HUF', 1.000000, 0, 19123.00, 956.00, 20079.00),
(29, 'NORMAL', '2022-09-03', '2022-09-03', 'CASH', 'HUF', 1.000000, 0, 19095.00, 954.00, 20049.00),
(30, 'NORMAL', '2022-09-04', '2022-09-04', 'CASH', 'HUF', 1.000000, 0, 7606.00, 380.00, 7986.00),
(31, 'NORMAL', '2022-09-16', '2022-09-16', 'CASH', 'HUF', 1.000000, 0, 22135.00, 1106.00, 23241.00),
(32, 'NORMAL', '2022-09-22', '2022-09-22', 'CARD', 'HUF', 1.000000, 0, 12296.00, 614.00, 12910.00),
(33, 'NORMAL', '2022-09-24', '2022-09-24', 'CARD', 'HUF', 1.000000, 0, 25458.00, 1272.00, 26730.00),
(34, 'NORMAL', '2022-09-30', '2022-09-30', 'CARD', 'HUF', 1.000000, 0, 11319.00, 565.00, 11884.00),
(35, 'NORMAL', '2022-10-03', '2022-10-03', 'CARD', 'HUF', 1.000000, 0, 24310.00, 1215.00, 25525.00),
(36, 'NORMAL', '2022-10-12', '2022-10-12', 'CARD', 'HUF', 1.000000, 0, 3204.00, 160.00, 3364.00),
(37, 'NORMAL', '2022-10-13', '2022-10-13', 'CARD', 'HUF', 1.000000, 0, 2227.00, 111.00, 2338.00),
(38, 'NORMAL', '2022-10-21', '2022-10-21', 'CASH', 'HUF', 1.000000, 0, 19095.00, 954.00, 20049.00),
(39, 'NORMAL', '2022-10-22', '2022-10-22', 'CARD', 'HUF', 1.000000, 0, 15882.00, 794.00, 16676.00),
(40, 'NORMAL', '2022-11-08', '2022-11-08', 'CARD', 'HUF', 1.000000, 0, 19747.00, 987.00, 20734.00),
(41, 'NORMAL', '2022-11-08', '2022-11-08', 'CASH', 'HUF', 1.000000, 0, 3204.00, 160.00, 3364.00),
(42, 'NORMAL', '2022-11-13', '2022-11-13', 'CASH', 'HUF', 1.000000, 0, 4563.00, 228.00, 4791.00),
(43, 'NORMAL', '2022-11-18', '2022-11-18', 'CARD', 'HUF', 1.000000, 0, 2227.00, 111.00, 2338.00),
(44, 'NORMAL', '2022-11-20', '2022-11-20', 'CASH', 'HUF', 1.000000, 0, 2388.00, 119.00, 2507.00),
(45, 'NORMAL', '2022-11-26', '2022-11-26', 'CARD', 'HUF', 1.000000, 0, 2175.00, 108.00, 2283.00),
(46, 'NORMAL', '2022-12-03', '2022-12-03', 'CASH', 'HUF', 1.000000, 0, 3204.00, 160.00, 3364.00),
(47, 'NORMAL', '2022-12-23', '2022-12-23', 'CASH', 'HUF', 1.000000, 0, 2227.00, 111.00, 2338.00),
(48, 'NORMAL', '2022-12-27', '2022-12-27', 'CASH', 'HUF', 1.000000, 0, 8452.00, 422.00, 8874.00),
(49, 'NORMAL', '2022-12-29', '2022-12-29', 'CASH', 'HUF', 1.000000, 0, 11267.00, 563.00, 11830.00);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoicehead`
--

CREATE TABLE `invoicehead` (
  `invoice_id` int(11) NOT NULL,
  `invoicedetails_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `invoiceIssueDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `invoicehead`
--

INSERT INTO `invoicehead` (`invoice_id`, `invoicedetails_id`, `supplier_id`, `customer_id`, `invoiceNumber`, `invoiceIssueDate`) VALUES
(1, 1, 1, 37, 'E-ABC-2022-1', '2022-01-07'),
(2, 2, 1, 37, 'E-ABC-2022-2', '2022-01-27'),
(3, 3, 1, 13, 'E-ABC-2022-3', '2022-01-28'),
(4, 4, 1, 25, 'E-ABC-2022-4', '2022-02-06'),
(5, 5, 1, 24, 'E-ABC-2022-5', '2022-02-08'),
(6, 6, 1, 43, 'E-ABC-2022-6', '2022-02-20'),
(7, 7, 1, 23, 'E-ABC-2022-7', '2022-03-24'),
(8, 8, 1, 4, 'E-ABC-2022-8', '2022-03-28'),
(9, 9, 1, 46, 'E-ABC-2022-9', '2022-04-02'),
(10, 10, 1, 15, 'E-ABC-2022-10', '2022-04-16'),
(11, 11, 1, 6, 'E-ABC-2022-11', '2022-04-18'),
(12, 12, 1, 46, 'E-ABC-2022-12', '2022-04-25'),
(13, 13, 1, 16, 'E-ABC-2022-13', '2022-04-25'),
(14, 14, 1, 17, 'E-ABC-2022-14', '2022-05-02'),
(15, 15, 1, 27, 'E-ABC-2022-15', '2022-05-08'),
(16, 16, 1, 34, 'E-ABC-2022-16', '2022-05-20'),
(17, 17, 1, 3, 'E-ABC-2022-17', '2022-05-29'),
(18, 18, 1, 32, 'E-ABC-2022-18', '2022-06-02'),
(19, 19, 1, 37, 'E-ABC-2022-19', '2022-06-06'),
(20, 20, 1, 45, 'E-ABC-2022-20', '2022-06-10'),
(21, 21, 1, 12, 'E-ABC-2022-21', '2022-06-14'),
(22, 22, 1, 21, 'E-ABC-2022-22', '2022-06-18'),
(23, 23, 1, 20, 'E-ABC-2022-23', '2022-06-20'),
(24, 24, 1, 31, 'E-ABC-2022-24', '2022-06-23'),
(25, 25, 1, 37, 'E-ABC-2022-25', '2022-07-21'),
(26, 26, 1, 23, 'E-ABC-2022-26', '2022-08-21'),
(27, 27, 1, 47, 'E-ABC-2022-27', '2022-09-02'),
(28, 28, 1, 20, 'E-ABC-2022-28', '2022-09-03'),
(29, 29, 1, 26, 'E-ABC-2022-29', '2022-09-03'),
(30, 30, 1, 20, 'E-ABC-2022-30', '2022-09-04'),
(31, 31, 1, 41, 'E-ABC-2022-31', '2022-09-16'),
(32, 32, 1, 9, 'E-ABC-2022-32', '2022-09-22'),
(33, 33, 1, 41, 'E-ABC-2022-33', '2022-09-24'),
(34, 34, 1, 9, 'E-ABC-2022-34', '2022-09-30'),
(35, 35, 1, 40, 'E-ABC-2022-35', '2022-10-03'),
(36, 36, 1, 20, 'E-ABC-2022-36', '2022-10-12'),
(37, 37, 1, 30, 'E-ABC-2022-37', '2022-10-13'),
(38, 38, 1, 6, 'E-ABC-2022-38', '2022-10-21'),
(39, 39, 1, 9, 'E-ABC-2022-39', '2022-10-22'),
(40, 40, 1, 21, 'E-ABC-2022-40', '2022-11-08'),
(41, 41, 1, 45, 'E-ABC-2022-41', '2022-11-08'),
(42, 42, 1, 44, 'E-ABC-2022-42', '2022-11-13'),
(43, 43, 1, 27, 'E-ABC-2022-43', '2022-11-18'),
(44, 44, 1, 10, 'E-ABC-2022-44', '2022-11-20'),
(45, 45, 1, 11, 'E-ABC-2022-45', '2022-11-26'),
(46, 46, 1, 43, 'E-ABC-2022-46', '2022-12-03'),
(47, 47, 1, 49, 'E-ABC-2022-47', '2022-12-23'),
(48, 48, 1, 34, 'E-ABC-2022-48', '2022-12-27'),
(49, 49, 1, 36, 'E-ABC-2022-49', '2022-12-29');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `invoicelines`
--

CREATE TABLE `invoicelines` (
  `line_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `lineNumber` int(11) NOT NULL,
  `lineDescription` varchar(512) DEFAULT NULL,
  `lineNatureIndicator` varchar(50) DEFAULT NULL COMMENT 'PRODUCT\nSERVICE\nOTHER',
  `quantity` decimal(22,6) DEFAULT NULL,
  `unitOfMeasure` varchar(50) DEFAULT NULL COMMENT 'PIECE\nKILOGRAM\nTON\nKWH\nDAY\nHOUR\nMINUTE\nMONTH\nLITER\nKILOMETER\nCUBIC_METER\nMETER\nLINEAR_METER\nCARTON\nPACK\nOWN',
  `unitPrice` decimal(22,6) NOT NULL,
  `lineNetAmount` decimal(18,2) NOT NULL,
  `vatPercentage` decimal(5,4) NOT NULL,
  `lineVatAmount` decimal(18,2) NOT NULL,
  `lineGrossAmount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `invoicelines`
--

INSERT INTO `invoicelines` (`line_id`, `invoice_id`, `lineNumber`, `lineDescription`, `lineNatureIndicator`, `quantity`, `unitOfMeasure`, `unitPrice`, `lineNetAmount`, `vatPercentage`, `lineVatAmount`, `lineGrossAmount`) VALUES
(1, 1, 1, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(2, 1, 2, 'Lasagna', 'PRODUCT', 1.000000, 'ADAG', 2014.000000, 2014.00, 0.0500, 100.00, 2114.00),
(3, 1, 3, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(4, 2, 1, 'Lasagna', 'PRODUCT', 2.000000, 'ADAG', 5016.000000, 10032.00, 0.0500, 501.00, 10533.00),
(5, 2, 2, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(6, 2, 3, 'Felesborsóleves sonkával', 'PRODUCT', 2.000000, 'ADAG', 2268.000000, 4536.00, 0.0500, 226.00, 4762.00),
(7, 3, 1, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(8, 3, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(9, 3, 3, 'Felesborsóleves sonkával', 'PRODUCT', 1.000000, 'ADAG', 1162.000000, 1162.00, 0.0500, 58.00, 1220.00),
(10, 3, 4, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(11, 4, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(12, 5, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(13, 5, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(15, 6, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(16, 6, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(17, 6, 3, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(18, 7, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(19, 7, 2, 'Pizza (pepperónival)', 'PRODUCT', 1.000000, 'ADAG', 1071.000000, 1071.00, 0.0500, 53.00, 1124.00),
(20, 7, 3, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(21, 7, 4, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(22, 8, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(23, 8, 2, 'Székelykáposzta', 'PRODUCT', 3.000000, 'ADAG', 5172.000000, 15516.00, 0.0500, 775.00, 16291.00),
(24, 9, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(25, 9, 2, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(26, 10, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(27, 10, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(28, 10, 3, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(29, 11, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(30, 11, 2, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(31, 11, 3, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(32, 12, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(33, 12, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(34, 12, 3, 'Sertéspörkölt', 'PRODUCT', 1.000000, 'ADAG', 1931.000000, 1931.00, 0.0500, 96.00, 2027.00),
(35, 12, 4, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(36, 13, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(37, 13, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(38, 14, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(39, 14, 2, 'Savanyú-csípős leves', 'PRODUCT', 2.000000, 'ADAG', 4312.000000, 8624.00, 0.0500, 431.00, 9055.00),
(40, 14, 3, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(41, 14, 5, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(42, 15, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(43, 15, 2, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(44, 16, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(45, 16, 2, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(46, 16, 3, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(47, 16, 4, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(48, 17, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(49, 17, 2, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(50, 17, 3, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(51, 18, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(52, 18, 2, 'Felesborsóleves sonkával', 'PRODUCT', 2.000000, 'ADAG', 2320.000000, 4640.00, 0.0500, 232.00, 4872.00),
(53, 19, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(54, 19, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(55, 19, 3, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(56, 20, 1, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(57, 20, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(58, 21, 1, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(59, 21, 2, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(60, 21, 3, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(61, 22, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(62, 22, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(63, 22, 3, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(64, 23, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(65, 24, 1, 'Kagyló raguleves', 'PRODUCT', 2.000000, 'ADAG', 4978.000000, 9956.00, 0.0500, 497.00, 10453.00),
(66, 25, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(67, 25, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(68, 25, 3, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(69, 26, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(70, 26, 2, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(71, 26, 3, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(72, 27, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(73, 27, 2, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(74, 28, 1, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(75, 28, 2, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(76, 29, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(77, 29, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(78, 29, 3, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(79, 30, 1, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(80, 30, 2, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(81, 30, 3, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(82, 31, 1, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(83, 31, 2, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(84, 31, 3, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(85, 32, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(86, 32, 2, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(87, 33, 1, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(88, 33, 2, 'Felesborsóleves sonkával', 'PRODUCT', 2.000000, 'ADAG', 1448.000000, 2896.00, 0.0500, 144.00, 3040.00),
(89, 33, 3, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(90, 33, 4, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(91, 34, 1, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(92, 34, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(93, 35, 1, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(94, 35, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(95, 35, 3, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(96, 35, 4, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(97, 36, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(98, 37, 1, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(99, 38, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(100, 38, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(101, 38, 3, 'Hagymaleves', 'PRODUCT', 2.000000, 'ADAG', 3914.000000, 7828.00, 0.0500, 391.00, 8219.00),
(102, 39, 1, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(103, 39, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(104, 39, 3, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(105, 39, 4, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(106, 40, 1, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(107, 40, 2, 'Burgonyakrém leves', 'PRODUCT', 3.000000, 'ADAG', 3765.000000, 11295.00, 0.0500, 564.00, 11859.00),
(108, 41, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(109, 42, 1, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(110, 42, 2, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(111, 43, 1, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00),
(112, 43, 2, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(113, 44, 1, 'Savanyú-csípős leves', 'PRODUCT', 1.000000, 'ADAG', 2388.000000, 2388.00, 0.0500, 119.00, 2507.00),
(114, 45, 1, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(115, 46, 1, 'Rántott halfilé', 'PRODUCT', 2.000000, 'ADAG', 1602.000000, 3204.00, 0.0500, 160.00, 3364.00),
(116, 47, 1, 'Sajtleves', 'PRODUCT', 1.000000, 'ADAG', 2227.000000, 2227.00, 0.0500, 111.00, 2338.00),
(117, 48, 1, 'Csibefalatok', 'PRODUCT', 2.000000, 'ADAG', 4226.000000, 8452.00, 0.0500, 422.00, 8874.00),
(118, 49, 1, 'Tojásos leves (kínai)', 'PRODUCT', 1.000000, 'ADAG', 2175.000000, 2175.00, 0.0500, 108.00, 2283.00),
(119, 49, 2, 'Kagyló (panírban sült)', 'PRODUCT', 2.000000, 'ADAG', 4546.000000, 9092.00, 0.0500, 454.00, 9546.00);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `taxnumber`
--

CREATE TABLE `taxnumber` (
  `taxnumber_id` int(11) NOT NULL,
  `taxpayerId` varchar(8) NOT NULL,
  `vatCode` varchar(1) DEFAULT NULL,
  `countyCode` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `taxnumber`
--

INSERT INTO `taxnumber` (`taxnumber_id`, `taxpayerId`, `vatCode`, `countyCode`) VALUES
(1, '62258164', '2', '33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `taxpayer`
--

CREATE TABLE `taxpayer` (
  `taxpayer_id` int(11) NOT NULL,
  `taxnumber_id` int(11) DEFAULT NULL,
  `groupmember_taxnumber_id` int(11) DEFAULT NULL,
  `communityVatNumber` varchar(20) DEFAULT NULL,
  `individualExemption` tinyint(4) DEFAULT 0,
  `incorporation` varchar(50) DEFAULT NULL COMMENT 'ORGANIZATION,SELF_EMPLOYED,TAXABLE_PERSON',
  `taxPayerrVatStatus` varchar(50) DEFAULT NULL COMMENT 'DOMESTIC,OTHER,PRIVATE_PERSON',
  `bankAccountNumber` varchar(255) DEFAULT NULL,
  `taxPayerName` varchar(512) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `publicPlaceCategory` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `additionalAddressDetail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `taxpayer`
--

INSERT INTO `taxpayer` (`taxpayer_id`, `taxnumber_id`, `groupmember_taxnumber_id`, `communityVatNumber`, `individualExemption`, `incorporation`, `taxPayerrVatStatus`, `bankAccountNumber`, `taxPayerName`, `postalCode`, `city`, `streetName`, `publicPlaceCategory`, `number`, `additionalAddressDetail`) VALUES
(1, 1, NULL, NULL, 0, 'SELF_EMPLOYED', 'DOMESTIC', '11773683-23289288-00000000', 'Bakó Péter', '2330', 'Dunaharaszti', 'Szent István', 'utca', '18', NULL),
(2, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743725-41724592-00000000', 'Gruber Elizabeth', '2645', 'Budapest', 'Jókai', 'utca', '68', NULL),
(3, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735368-51413749-00000000', 'Pichler Nolan', '7235', 'Budapest', 'Badacsony', 'utca', '40', NULL),
(4, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748667-82349294-00000000', 'Schmid Damon', '2556', 'Budapest', 'Baka', 'utca', '55', NULL),
(5, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11754876-16616444-00000000', 'Ebner Keegan', '4645', 'Budapest', 'Álmos', 'utca', '56', NULL),
(6, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727586-33457884-00000000', 'Fuchs Driscoll', '1355', 'Budapest', 'István', 'utca', '6', NULL),
(7, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733756-96286734-00000000', 'Leitner Tatum', '2872', 'Budapest', 'Páfránykert', 'utca', '9', NULL),
(8, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11769998-34383122-00000000', 'Wimmer Justina', '4633', 'Budapest', 'Keselyű', 'utca', '45', NULL),
(9, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11769615-33826444-00000000', 'Wallner Hop', '4658', 'Budapest', 'Kánya', 'utca', '58', NULL),
(10, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782494-75654234-00000000', 'Eder Colin', '9475', 'Budapest', 'Házmán', 'utca', '67', NULL),
(11, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777593-76334868-00000000', 'Leitner Kellie', '8928', 'Budapest', 'Apostol', 'utca', '42', NULL),
(12, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763771-67833744-00000000', 'Fischer Henry', '9161', 'Budapest', 'Petőfi', 'utca', '0', NULL),
(13, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737852-75853323-00000000', 'Koller Melyssa', '6104', 'Budapest', 'József', 'utca', '68', NULL),
(14, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11744744-55674583-00000000', 'Bauer Ulric', '1030', 'Budapest', 'Bátori', 'utca', '87', NULL),
(15, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755855-78581215-00000000', 'Wolf Pascale', '9376', 'Budapest', 'Miatyánk', 'utca', '15', NULL),
(16, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745656-26945542-00000000', 'Baumgartner Jolie', '2164', 'Budapest', 'Előd', 'utca', '14', NULL),
(17, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749386-21457687-00000000', 'Schmid Brock', '7451', 'Budapest', 'Csévi', 'utca', '41', NULL),
(18, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11746173-86253363-00000000', 'Wolf McKenzie', '3862', 'Budapest', 'Mély', 'utca', '83', NULL),
(19, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735664-13123382-00000000', 'Ebner James', '9277', 'Budapest', '', 'utca', '69', NULL),
(20, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755238-72531485-00000000', 'Wimmer Deirdre', '8316', 'Budapest', 'Kapor', 'utca', '80', NULL),
(21, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742314-92811717-00000000', 'Auer Caleb', '8643', 'Budapest', 'Apostol', 'utca', '49', NULL),
(22, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778229-87581633-00000000', 'Wagner Elliott', '6839', 'Budapest', 'Majális', 'utca', '91', NULL),
(23, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765412-86935577-00000000', 'Brunner Daria', '7563', 'Budapest', 'Lepke', 'utca', '90', NULL),
(24, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11715275-77233655-00000000', 'Moser Glenna', '7787', 'Budapest', 'Barlang', 'utca', '63', NULL),
(25, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767642-52526397-00000000', 'Berger Zorita', '5351', 'Budapest', 'Csibor', 'utca', '78', NULL),
(26, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11787277-62325366-00000000', 'Fuchs Guy', '6220', 'Budapest', 'Mátra', 'utca', '75', NULL),
(27, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742987-15268114-00000000', 'Wimmer Marah', '7532', 'Budapest', 'Bátori', 'utca', '34', NULL),
(28, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11713251-84367274-00000000', 'Steiner Lucas', '3312', 'Budapest', 'Rotta', 'utca', '59', NULL),
(29, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778342-33477825-00000000', 'Maier Hector', '6168', 'Budapest', 'Balogh', 'utca', '43', NULL),
(30, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11724727-29612446-00000000', 'Pichler Althea', '8416', 'Budapest', 'Hidász', 'utca', '90', NULL),
(31, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785863-44991617-00000000', 'Moser Alfreda', '3671', 'Budapest', 'Mátra', 'utca', '90', NULL),
(32, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782732-15993629-00000000', 'Koller Malik', '5353', 'Budapest', 'Mansfeld', 'utca', '27', NULL),
(33, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772453-97347149-00000000', 'Leitner Duncan', '2707', 'Budapest', 'Péch', 'utca', '86', NULL),
(34, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782484-34271453-00000000', 'Haas Kasimir', '5374', 'Budapest', 'Kerekhegyi', 'utca', '49', NULL),
(35, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11779113-52722539-00000000', 'Lehner Bell', '3827', 'Budapest', 'Endrődi', 'utca', '82', NULL),
(36, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725174-21281426-00000000', 'Lehner Tad', '2895', 'Budapest', 'Barlang', 'utca', '52', NULL),
(37, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765867-54932282-00000000', 'Berger Mariko', '3826', 'Budapest', 'Kolozsvár', 'utca', '31', NULL),
(38, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725635-75138863-00000000', 'Schmid Sandra', '3413', 'Budapest', 'Mandula', 'utca', '29', NULL),
(39, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733277-27766746-00000000', 'Weber Vivien', '1841', 'Budapest', 'Elvis', 'utca', '97', NULL),
(40, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764393-87776765-00000000', 'Winkler Eliana', '3115', 'Budapest', 'Balogh', 'utca', '21', NULL),
(41, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752653-78366391-00000000', 'Hofer September', '4818', 'Budapest', 'Kolozsvár', 'utca', '27', NULL),
(42, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743614-35916726-00000000', 'Schmid Hannah', '2466', 'Budapest', 'Emelkedő', 'utca', '79', NULL),
(43, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767488-92257568-00000000', 'Fuchs Rigel', '2498', 'Budapest', 'Kőfejtő', 'utca', '28', NULL),
(44, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793216-31332749-00000000', 'Fischer Nevada', '6255', 'Budapest', 'Fekete', 'utca', '46', NULL),
(45, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762617-75796289-00000000', 'Winkler Boris', '8362', 'Budapest', 'Kisfaludy', 'utca', '86', NULL),
(46, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788575-86836435-00000000', 'Winkler Reagan', '6741', 'Budapest', 'József', 'utca', '51', NULL),
(47, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743967-24336652-00000000', 'Schneider Zia', '4772', 'Budapest', 'Bég', 'utca', '53', NULL),
(48, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726474-44393482-00000000', 'Wolf Jarrod', '7242', 'Budapest', 'Kapor', 'utca', '59', NULL),
(49, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727776-93479464-00000000', 'Gruber Matthew', '6574', 'Budapest', 'Aranybulla', 'utca', '63', NULL),
(50, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11739167-24791258-00000000', 'Aigner Allistair', '2237', 'Budapest', 'Kolozsvári', 'utca', '65', NULL),
(51, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777343-63757576-00000000', 'Egger Rebekah', '8522', 'Budapest', 'Pázsit', 'utca', '14', NULL),
(52, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11781382-52323277-00000000', 'Schwarz Alexander', '2474', 'Budapest', 'Fáklyaliliom', 'utca', '63', NULL),
(53, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11797712-12782531-00000000', 'Weber Burke', '2861', 'Budapest', 'Paprikás', 'utca', '62', NULL),
(54, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756833-52836488-00000000', 'Winkler Ray', '6394', 'Budapest', 'Kolozsvári', 'utca', '19', NULL),
(55, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764445-15923364-00000000', 'Reiter Louis', '3005', 'Budapest', 'Járóka', 'utca', '82', NULL),
(56, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762943-49764258-00000000', 'Egger Nevada', '5546', 'Budapest', 'Kokárda', 'utca', '100', NULL),
(57, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11769261-69724344-00000000', 'Leitner Evan', '3520', 'Budapest', 'Máriahegy', 'utca', '51', NULL),
(58, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757789-68598738-00000000', 'Auer Wade', '3148', 'Budapest', 'Kokárda', 'utca', '13', NULL),
(59, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11754254-87544759-00000000', 'Wagner Roary', '3315', 'Budapest', 'Zöldmáli', 'utca', '61', NULL),
(60, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765349-63415239-00000000', 'Huber Thane', '3369', 'Budapest', 'Margit', 'utca', '78', NULL),
(61, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11799465-85213662-00000000', 'Moser Nasim', '4666', 'Budapest', 'Ábrányi', 'utca', '32', NULL),
(62, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775628-47923686-00000000', 'Aigner Adara', '5448', 'Budapest', 'Lupény', 'utca', '99', NULL),
(63, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755861-53492852-00000000', 'Wallner Sheila', '3229', 'Budapest', 'Kolozsvári', 'utca', '41', NULL),
(64, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11797132-67247621-00000000', 'Fischer Desiree', '7364', 'Budapest', 'Modori', 'utca', '22', NULL),
(65, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11768813-25273528-00000000', 'Maier Alisa', '3612', 'Budapest', 'Mák', 'utca', '91', NULL),
(66, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11734845-67835878-00000000', 'Schwarz Brianna', '8346', 'Budapest', 'Kárpát', 'utca', '51', NULL),
(67, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785373-14626894-00000000', 'Wagner Irma', '8423', 'Budapest', 'Herman', 'utca', '52', NULL),
(68, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749953-32784249-00000000', 'Maier Rahim', '8669', 'Budapest', 'Mátra', 'utca', '33', NULL),
(69, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762292-94723872-00000000', 'Haas Clayton', '5444', 'Budapest', 'Kisfaludy', 'utca', '91', NULL),
(70, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728413-67623851-00000000', 'Auer Todd', '8216', 'Budapest', 'Baba', 'utca', '8', NULL),
(71, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749359-44743116-00000000', 'Heilig Talon', '8382', 'Budapest', 'Mikes', 'utca', '29', NULL),
(72, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785578-68764285-00000000', 'Haas Armando', '3178', 'Budapest', 'Kőhegyi', 'utca', '51', NULL),
(73, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789866-47875684-00000000', 'Schmidt Ursula', '4656', 'Budapest', 'Arad', 'utca', '100', NULL),
(74, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785447-54385875-00000000', 'Wimmer Charde', '6718', 'Budapest', 'Pálos', 'utca', '7', NULL),
(75, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788395-18336878-00000000', 'Koller Zeph', '6866', 'Budapest', 'Majális', 'utca', '79', NULL),
(76, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767481-28883875-00000000', 'Lang Felix', '3873', 'Budapest', 'Alsó', 'utca', '76', NULL),
(77, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738567-28373572-00000000', 'Mayer Lee', '6087', 'Budapest', 'Kelemen', 'utca', '68', NULL),
(78, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777388-82837768-00000000', 'Schneider Chloe', '5240', 'Budapest', 'Ady', 'utca', '89', NULL),
(79, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784778-29283339-00000000', 'Gruber Julian', '2462', 'Budapest', 'Mecenzéf', 'utca', '94', NULL),
(80, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778344-43838373-00000000', 'Steiner Amity', '4666', 'Budapest', 'Hidász', 'utca', '9', NULL),
(81, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11771676-45534766-00000000', 'Wallner Beatrice', '4262', 'Budapest', 'Rókus', 'utca', '31', NULL),
(82, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733679-52728161-00000000', 'Koller Nolan', '8736', 'Budapest', 'Patakhegyi', 'utca', '83', NULL),
(83, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762681-44466352-00000000', 'Wolf Scarlet', '1322', 'Budapest', 'Baba', 'utca', '31', NULL),
(84, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733338-11755833-00000000', 'Maier Wilma', '8779', 'Budapest', 'Balogvár', 'utca', '27', NULL),
(85, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745884-69536112-00000000', 'Brunner Aretha', '5248', 'Budapest', 'Józsefhegyi', 'utca', '81', NULL),
(86, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774975-76276122-00000000', 'Lehner Dacey', '2653', 'Budapest', 'Kenyérmező', 'utca', '10', NULL),
(87, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766873-85672766-00000000', 'Koller Jennifer', '4866', 'Budapest', 'Feketefej', 'utca', '14', NULL),
(88, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11792354-88746562-00000000', 'Auer Raya', '7518', 'Budapest', 'Bég', 'utca', '9', NULL),
(89, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745355-95548722-00000000', 'Binder Allen', '6043', 'Budapest', 'Pázsit', 'utca', '28', NULL),
(90, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737747-74765557-00000000', 'Wallner Harrison', '5218', 'Budapest', 'Lipthay', 'utca', '74', NULL),
(91, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767657-79385758-00000000', 'Wimmer Beverly', '7312', 'Budapest', 'Hársfavirág', 'utca', '85', NULL),
(92, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751876-85538868-00000000', 'Fischer Kessie', '3567', 'Budapest', 'Lóczy', 'utca', '14', NULL),
(93, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11736687-29754584-00000000', 'Berger Orson', '1268', 'Budapest', 'Csalán', 'utca', '52', NULL),
(94, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788778-82752591-00000000', 'Lang Benedict', '2582', 'Budapest', 'Heinrich', 'utca', '54', NULL),
(95, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738263-39567744-00000000', 'Weber Jordan', '2438', 'Budapest', 'Apostol', 'utca', '55', NULL),
(96, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11744975-56341863-00000000', 'Berger Griffin', '6497', 'Budapest', 'Házmán', 'utca', '16', NULL),
(97, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11744925-84762845-00000000', 'Auer Keith', '7435', 'Budapest', 'Mák', 'utca', '30', NULL),
(98, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777982-85648869-00000000', 'Binder Elliott', '5794', 'Budapest', 'Máriahegy', 'utca', '24', NULL),
(99, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743936-85876515-00000000', 'Gruber Ishmael', '9440', 'Budapest', 'Határ', 'utca', '52', NULL),
(100, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727357-85645259-00000000', 'Schneider Mason', '3844', 'Budapest', 'Csibor', 'utca', '60', NULL),
(101, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758227-51888986-00000000', 'Schmid Adena', '6310', 'Budapest', 'Kölcsey', 'utca', '66', NULL),
(102, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782456-17726565-00000000', 'Wimmer Price', '9218', 'Budapest', 'Ábrányi', 'utca', '60', NULL),
(103, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777232-71236262-00000000', 'Binder Maya', '8865', 'Budapest', 'Bég', 'utca', '52', NULL),
(104, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748419-48887347-00000000', 'Hofer Wyoming', '7512', 'Budapest', 'Árpád', 'utca', '13', NULL),
(105, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767894-41127492-00000000', 'Mayr Walter', '1579', 'Budapest', 'Méh', 'utca', '13', NULL),
(106, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751553-72567544-00000000', 'Schuster Orlando', '8412', 'Budapest', 'Henger', 'utca', '74', NULL),
(107, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11724839-54735732-00000000', 'Heilig Fritz', '7889', 'Budapest', 'Páfrány', 'utca', '3', NULL),
(108, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11796825-42296692-00000000', 'Huber Finn', '7993', 'Budapest', 'Lupény', 'utca', '12', NULL),
(109, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775957-22195251-00000000', 'Wallner Cullen', '2783', 'Budapest', 'Kokárda', 'utca', '60', NULL),
(110, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788766-72747275-00000000', 'Winkler Blaze', '8132', 'Budapest', 'Kolozsvár', 'utca', '19', NULL),
(111, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752368-82467373-00000000', 'Mayr Lilah', '7391', 'Budapest', 'Keleti', 'utca', '97', NULL),
(112, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725233-65534475-00000000', 'Hofer Madison', '4610', 'Budapest', 'Baka', 'utca', '53', NULL),
(113, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753533-56278285-00000000', 'Reiter Simone', '3168', 'Budapest', 'Heinrich', 'utca', '90', NULL),
(114, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11794382-26477226-00000000', 'Eder Nerea', '5970', 'Budapest', 'Alvinci', 'utca', '95', NULL),
(115, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743268-31144263-00000000', 'Auer Nero', '3827', 'Budapest', 'Miatyánk', 'utca', '49', NULL),
(116, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11783544-44642532-00000000', 'Schmid Hasad', '5915', 'Budapest', 'Kaptató', 'utca', '91', NULL),
(117, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778851-88736195-00000000', 'Lechner Nadine', '6773', 'Budapest', 'Piszke', 'utca', '7', NULL),
(118, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743886-16774552-00000000', 'Reiter Richard', '9326', 'Budapest', 'Kálvária', 'utca', '95', NULL),
(119, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764784-94754665-00000000', 'Eder Shannon', '6739', 'Budapest', 'Hársalja', 'utca', '67', NULL),
(120, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757358-53325481-00000000', 'Weber Eliana', '9114', 'Budapest', 'Pázsit', 'utca', '40', NULL),
(121, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777792-64643352-00000000', 'Huber Hannah', '7178', 'Budapest', 'Bem', 'utca', '94', NULL),
(122, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767294-18355238-00000000', 'Ebner Martina', '3624', 'Budapest', 'Bajnok', 'utca', '41', NULL),
(123, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748862-12435767-00000000', 'Schneider Talon', '1327', 'Budapest', 'Karszt', 'utca', '97', NULL),
(124, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764782-72325387-00000000', 'Wagner Lareina', '3027', 'Budapest', 'Kerényi', 'utca', '84', NULL),
(125, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777262-65564774-00000000', 'Gruber Craig', '9108', 'Budapest', 'Lorántffy', 'utca', '59', NULL),
(126, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723747-15661691-00000000', 'Fuchs Jenna', '8579', 'Budapest', 'Jegesmedve', 'utca', '31', NULL),
(127, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763625-29569532-00000000', 'Mayer Gabriel', '3499', 'Budapest', 'Karabély', 'utca', '92', NULL),
(128, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11717242-65797442-00000000', 'Wimmer Bruce', '3293', 'Budapest', 'Labdarózsa', 'utca', '28', NULL),
(129, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11717437-27844236-00000000', 'Maier Oliver', '2360', 'Budapest', 'Sas', 'utca', '16', NULL),
(130, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11716385-15623573-00000000', 'Wimmer Minerva', '6452', 'Budapest', 'Mária', 'utca', '0', NULL),
(131, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737422-85689464-00000000', 'Berger Walter', '2075', 'Budapest', 'Karabély', 'utca', '43', NULL),
(132, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763848-86358738-00000000', 'Egger Meghan', '7622', 'Budapest', 'Páfránykert', 'utca', '58', NULL),
(133, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762742-13376838-00000000', 'Baumgartner Alice', '2822', 'Budapest', 'Alvinci', 'utca', '48', NULL),
(134, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763267-95717746-00000000', 'Fischer Xenos', '7431', 'Budapest', 'Pálvölgyi', 'utca', '60', NULL),
(135, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11739342-37262883-00000000', 'Auer Paula', '7194', 'Budapest', 'Keleti', 'utca', '58', NULL),
(136, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757235-61387867-00000000', 'Weber Perry', '2549', 'Budapest', 'Léc', 'utca', '69', NULL),
(137, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11795798-65665328-00000000', 'Schwarz Mariam', '7345', 'Budapest', 'Völgy', 'utca', '17', NULL),
(138, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11746452-55462371-00000000', 'Winkler Keefe', '7832', 'Budapest', 'Fény', 'utca', '31', NULL),
(139, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785485-44652833-00000000', 'Aigner Brooke', '8229', 'Budapest', 'Sas', 'utca', '100', NULL),
(140, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772633-27568742-00000000', 'Huber Jaden', '4660', 'Budapest', 'Apostol', 'utca', '8', NULL),
(141, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755133-82783941-00000000', 'Bauer Yoko', '3335', 'Budapest', 'Mély', 'utca', '58', NULL),
(142, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728253-15763459-00000000', 'Moser Mercedes', '1594', 'Budapest', 'Járóka', 'utca', '26', NULL),
(143, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11736755-47696886-00000000', 'Heilig Germane', '4888', 'Budapest', 'Kertváros', 'utca', '93', NULL),
(144, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11771853-89652927-00000000', 'Schmid Debra', '2552', 'Budapest', 'Lupény', 'utca', '27', NULL),
(145, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11731453-22934467-00000000', 'Schmid Rogan', '8547', 'Budapest', 'Harmatcsepp', 'utca', '64', NULL),
(146, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785285-13525344-00000000', 'Lehner Rafael', '6018', 'Budapest', 'Léc', 'utca', '85', NULL),
(147, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776213-21644862-00000000', 'Auer Ulric', '5277', 'Budapest', 'Líra', 'utca', '9', NULL),
(148, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776353-37557714-00000000', 'Berger Acton', '3989', 'Budapest', 'Mechwart', 'utca', '28', NULL),
(149, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11798682-89238633-00000000', 'Schmid Audrey', '6764', 'Budapest', 'Mandula', 'utca', '34', NULL),
(150, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733659-88576733-00000000', 'Wallner Candice', '5123', 'Budapest', 'Pálos', 'utca', '12', NULL),
(151, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11787362-55238221-00000000', 'Wagner McKenzie', '2282', 'Budapest', 'Kőhegyi', 'utca', '7', NULL),
(152, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756661-93264357-00000000', 'Fuchs Magee', '7346', 'Budapest', 'Máriahegy', 'utca', '31', NULL),
(153, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11754368-26964121-00000000', 'Steiner Shelly', '6417', 'Budapest', 'Apostol', 'utca', '15', NULL),
(154, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11721964-12857435-00000000', 'Schuster Laurel', '2205', 'Budapest', 'Líra', 'utca', '12', NULL),
(155, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753612-79784188-00000000', 'Schuster Emi', '4913', 'Budapest', 'Kálvária', 'utca', '58', NULL),
(156, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758133-77238222-00000000', 'Auer Simone', '5532', 'Budapest', 'Herman', 'utca', '94', NULL),
(157, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732423-86884427-00000000', 'Eder Nelle', '9857', 'Budapest', 'Hárshegyi', 'utca', '96', NULL),
(158, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741594-63871823-00000000', 'Koller Omar', '8118', 'Budapest', 'Arad', 'utca', '88', NULL),
(159, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733686-25656226-00000000', 'Steiner Sonya', '3823', 'Budapest', 'Kökény', 'utca', '88', NULL),
(160, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742413-42842458-00000000', 'Wolf Dominique', '5579', 'Budapest', 'János', 'utca', '30', NULL),
(161, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773384-27438428-00000000', 'Wagner Griffith', '8447', 'Budapest', 'Mandula', 'utca', '89', NULL),
(162, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784433-28994388-00000000', 'Schwarz Claudia', '8511', 'Budapest', 'Felső', 'utca', '30', NULL),
(163, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749277-19272716-00000000', 'Baumgartner Eagan', '2268', 'Budapest', 'Miatyánk', 'utca', '33', NULL),
(164, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718643-46767446-00000000', 'Wolf Vincent', '1165', 'Budapest', 'Kaptató', 'utca', '67', NULL),
(165, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11744863-55685643-00000000', 'Wagner Norman', '2791', 'Budapest', 'Páfrány', 'utca', '91', NULL),
(166, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752247-47193958-00000000', 'Binder Gage', '5363', 'Budapest', 'Csibor', 'utca', '55', NULL),
(167, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767663-15276786-00000000', 'Schuster Alden', '4676', 'Budapest', 'Pitypang', 'utca', '68', NULL),
(168, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778723-43365595-00000000', 'Brunner David', '8729', 'Budapest', 'Feketefenyő', 'utca', '71', NULL),
(169, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767574-84354294-00000000', 'Schmid Carly', '7312', 'Budapest', 'Batta', 'utca', '64', NULL),
(170, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11754248-69688856-00000000', 'Schmid Yen', '7688', 'Budapest', 'Apáca', 'utca', '89', NULL),
(171, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732556-72654257-00000000', 'Hofer Rafael', '7357', 'Budapest', 'Felső', 'utca', '49', NULL),
(172, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763746-35322425-00000000', 'Aigner Kareem', '5696', 'Budapest', 'Csibor', 'utca', '30', NULL),
(173, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737976-76524556-00000000', 'Wallner Nasim', '4662', 'Budapest', 'Kőhegyi', 'utca', '99', NULL),
(174, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725732-59426854-00000000', 'Moser Sydnee', '6847', 'Budapest', 'Péch', 'utca', '24', NULL),
(175, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11739594-14772527-00000000', 'Aigner Kameko', '8135', 'Budapest', 'Pentelei', 'utca', '64', NULL),
(176, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722773-46481886-00000000', 'Ebner Petra', '1710', 'Budapest', 'Kolozsvár', 'utca', '3', NULL),
(177, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743264-65484235-00000000', 'Reiter Myra', '2387', 'Budapest', 'Kassa', 'utca', '47', NULL),
(178, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738221-71669584-00000000', 'Bauer Octavia', '3285', 'Budapest', 'Lepke', 'utca', '60', NULL),
(179, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11783446-66347638-00000000', 'Schneider Colby', '3881', 'Budapest', 'Mechwart', 'utca', '24', NULL),
(180, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11798163-59876387-00000000', 'Heilig Jerry', '3125', 'Budapest', 'Mély', 'utca', '1', NULL),
(181, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11798334-96861243-00000000', 'Schmid Aphrodite', '8759', 'Budapest', 'Endrődi', 'utca', '69', NULL),
(182, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755812-19145452-00000000', 'Wimmer Marvin', '8816', 'Budapest', 'Barlang', 'utca', '63', NULL),
(183, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752925-66967669-00000000', 'Wagner Hiram', '2128', 'Budapest', 'Kardos', 'utca', '11', NULL),
(184, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748923-29598856-00000000', 'Schneider Buckminster', '8297', 'Budapest', 'Feketefej', 'utca', '21', NULL),
(185, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11734462-71423437-00000000', 'Lechner Brock', '6141', 'Budapest', 'Piszke', 'utca', '54', NULL),
(186, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742268-66367144-00000000', 'Winkler Asher', '4667', 'Budapest', 'Herman', 'utca', '43', NULL),
(187, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728246-55478395-00000000', 'Schwarz Donovan', '4484', 'Budapest', 'Líra', 'utca', '88', NULL),
(188, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737844-42347497-00000000', 'Koller Willow', '6482', 'Budapest', 'Baka', 'utca', '97', NULL),
(189, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11779893-47233715-00000000', 'Schuster Melinda', '5205', 'Budapest', 'Muflon', 'utca', '98', NULL),
(190, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728716-91264566-00000000', 'Hofer Orson', '9911', 'Budapest', 'Pinceszer', 'utca', '3', NULL),
(191, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11744242-22256449-00000000', 'Brunner Cody', '8131', 'Budapest', 'Fekete', 'utca', '71', NULL),
(192, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11783323-88378273-00000000', 'Schwarz May', '5765', 'Budapest', 'Kálvária', 'utca', '34', NULL),
(193, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733881-81667993-00000000', 'Haas Yvette', '9784', 'Budapest', 'Kökény', 'utca', '10', NULL),
(194, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777638-15655924-00000000', 'Eder Eaton', '6521', 'Budapest', 'Pázsit', 'utca', '0', NULL),
(195, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766159-24896538-00000000', 'Wimmer Elvis', '5732', 'Budapest', 'Rotta', 'utca', '37', NULL),
(196, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765368-33858326-00000000', 'Auer Leigh', '6288', 'Budapest', 'Alsó', 'utca', '29', NULL),
(197, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785975-46264587-00000000', 'Lang Jarrod', '6636', 'Budapest', 'Fény', 'utca', '23', NULL),
(198, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748825-16391574-00000000', 'Schmidt Serina', '8242', 'Budapest', 'Lövőház', 'utca', '95', NULL),
(199, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767328-44435368-00000000', 'Schneider Brittany', '1006', 'Budapest', 'Pengő', 'utca', '39', NULL),
(200, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756225-19248534-00000000', 'Huber Talon', '5535', 'Budapest', 'Pengő', 'utca', '96', NULL),
(201, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775482-92455672-00000000', 'Wolf August', '2693', 'Budapest', 'József', 'utca', '92', NULL),
(202, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11786878-81646452-00000000', 'Leitner Florence', '3603', 'Budapest', 'Apostol', 'utca', '48', NULL),
(203, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737834-22593428-00000000', 'Reiter Simon', '7655', 'Budapest', 'Csalán', 'utca', '67', NULL),
(204, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753736-94822693-00000000', 'Reiter Charissa', '8322', 'Budapest', 'Fény', 'utca', '32', NULL),
(205, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775546-54758431-00000000', 'Gruber Kellie', '9857', 'Budapest', 'Mecset', 'utca', '12', NULL),
(206, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762553-82415861-00000000', 'Wimmer Wendy', '6357', 'Budapest', 'Méh', 'utca', '38', NULL),
(207, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773165-95554578-00000000', 'Lang Thaddeus', '5778', 'Budapest', 'Feketefej', 'utca', '66', NULL),
(208, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738728-38785824-00000000', 'Weber Bruno', '2458', 'Budapest', 'Mikszáth', 'utca', '21', NULL),
(209, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742834-46949385-00000000', 'Wagner Herman', '8974', 'Budapest', 'Henger', 'utca', '69', NULL),
(210, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728147-87656573-00000000', 'Maier Jeremy', '6575', 'Budapest', 'Fekete', 'utca', '90', NULL),
(211, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11771936-18337377-00000000', 'Winkler Carla', '2107', 'Budapest', 'Házmán', 'utca', '88', NULL),
(212, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758243-26838662-00000000', 'Schuster Raven', '2529', 'Budapest', 'Liliom', 'utca', '0', NULL),
(213, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723429-28439365-00000000', 'Mayer Caldwell', '2330', 'Budapest', 'Hárshegyi', 'utca', '73', NULL),
(214, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725733-72562978-00000000', 'Steiner Levi', '5819', 'Budapest', 'Hidász', 'utca', '41', NULL),
(215, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737967-43628842-00000000', 'Eder Walker', '6159', 'Budapest', 'Méh', 'utca', '3', NULL),
(216, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788671-42479248-00000000', 'Weber Harlan', '3222', 'Budapest', 'Emese', 'utca', '32', NULL),
(217, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11713488-85562832-00000000', 'Moser Duncan', '7664', 'Budapest', 'Petrezselyem', 'utca', '88', NULL),
(218, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748475-76495585-00000000', 'Berger Desirae', '3762', 'Budapest', 'Aranka', 'utca', '33', NULL),
(219, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11714397-49535978-00000000', 'Berger Griffin', '7974', 'Budapest', 'Fáklyaliliom', 'utca', '33', NULL),
(220, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748899-73845178-00000000', 'Huber Aimee', '3223', 'Budapest', 'Csatárka', 'utca', '43', NULL),
(221, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764952-55672626-00000000', 'Brunner MacKensie', '8566', 'Budapest', 'Belső', 'utca', '55', NULL),
(222, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718478-53267337-00000000', 'Schmidt Zahir', '8502', 'Budapest', 'Badacsony', 'utca', '46', NULL),
(223, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11739838-62879252-00000000', 'Leitner Bryar', '2421', 'Budapest', 'Hárshegyi', 'utca', '15', NULL),
(224, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11759874-77865965-00000000', 'Mayr Judah', '4761', 'Budapest', 'Ady', 'utca', '21', NULL),
(225, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11715261-59337176-00000000', 'Schmid Charissa', '8106', 'Budapest', 'Patróna', 'utca', '53', NULL),
(226, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785661-85833792-00000000', 'Fischer Mark', '5045', 'Budapest', 'Heinrich', 'utca', '86', NULL),
(227, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788337-27478552-00000000', 'Koller Mikayla', '1677', 'Budapest', 'Mechwart', 'utca', '44', NULL),
(228, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755782-27727815-00000000', 'Ebner Driscoll', '2595', 'Budapest', 'Léc', 'utca', '55', NULL),
(229, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785659-25175553-00000000', 'Wallner Price', '2642', 'Budapest', 'Máriahegy', 'utca', '4', NULL),
(230, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732754-44495378-00000000', 'Schuster Kane', '7282', 'Budapest', 'Bajnok', 'utca', '43', NULL),
(231, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735565-87316789-00000000', 'Ebner Marny', '4993', 'Budapest', 'Hírnök', 'utca', '27', NULL),
(232, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737267-29294188-00000000', 'Schuster Eric', '8695', 'Budapest', 'Csalán', 'utca', '30', NULL),
(233, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753986-91747145-00000000', 'Hofer Azalia', '2585', 'Budapest', 'Mecset', 'utca', '90', NULL),
(234, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758591-27742278-00000000', 'Maier Orlando', '7170', 'Budapest', 'Frigyes', 'utca', '33', NULL),
(235, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766274-39722345-00000000', 'Mayr Nehru', '4908', 'Budapest', 'Pipi', 'utca', '29', NULL),
(236, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757499-21728574-00000000', 'Hofer Timothy', '6432', 'Budapest', 'Muflon', 'utca', '5', NULL),
(237, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11794369-46441822-00000000', 'Aigner Ayanna', '6371', 'Budapest', 'Kinizsi', 'utca', '94', NULL),
(238, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785161-82336585-00000000', 'Winkler Amelia', '7522', 'Budapest', 'Felső', 'utca', '59', NULL),
(239, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723728-51546545-00000000', 'Schmidt Zelda', '7714', 'Budapest', 'Elvis', 'utca', '86', NULL),
(240, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788614-36192767-00000000', 'Berger Regina', '4870', 'Budapest', 'János', 'utca', '72', NULL),
(241, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722548-13585177-00000000', 'Lechner Indigo', '7271', 'Budapest', 'Petrezselyem', 'utca', '89', NULL),
(242, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738224-65677838-00000000', 'Wolf Alec', '4810', 'Budapest', 'Sas', 'utca', '43', NULL),
(243, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11731234-72611282-00000000', 'Wallner Benjamin', '2573', 'Budapest', 'Hárshegyi', 'utca', '92', NULL),
(244, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757992-77553359-00000000', 'Binder Hall', '2204', 'Budapest', 'Barlang', 'utca', '4', NULL),
(245, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775568-43856424-00000000', 'Lechner Jenna', '4411', 'Budapest', 'Lehel', 'utca', '99', NULL),
(246, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11783459-43386352-00000000', 'Berger Zelenia', '7779', 'Budapest', 'Badacsony', 'utca', '28', NULL),
(247, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738124-39276365-00000000', 'Auer Simone', '8624', 'Budapest', 'Cserge', 'utca', '52', NULL),
(248, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11781337-61527842-00000000', 'Koller Elmo', '7884', 'Budapest', 'Jókai', 'utca', '63', NULL),
(249, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749273-25525766-00000000', 'Reiter Kaitlin', '5561', 'Budapest', 'Emese', 'utca', '15', NULL),
(250, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11736915-35386728-00000000', 'Wimmer Bryar', '2748', 'Budapest', 'Majális', 'utca', '27', NULL),
(251, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762728-43732556-00000000', 'Schmidt Neville', '3155', 'Budapest', 'Csévi', 'utca', '89', NULL),
(252, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748535-38546317-00000000', 'Lang Mufutau', '6261', 'Budapest', 'Batta', 'utca', '60', NULL),
(253, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767295-76584492-00000000', 'Brunner Imani', '7521', 'Budapest', 'Jegesmedve', 'utca', '41', NULL),
(254, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772124-53587433-00000000', 'Fuchs Dacey', '8446', 'Budapest', 'Batyu', 'utca', '27', NULL),
(255, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733626-17334424-00000000', 'Fischer Sage', '6228', 'Budapest', 'Len', 'utca', '97', NULL),
(256, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738671-66294858-00000000', 'Wallner Valentine', '5138', 'Budapest', 'Csalán', 'utca', '47', NULL),
(257, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743586-76885331-00000000', 'Fischer Shea', '4786', 'Budapest', 'Margit', 'utca', '52', NULL),
(258, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726725-27644257-00000000', 'Berger Macy', '8237', 'Budapest', 'Lövőház', 'utca', '57', NULL),
(259, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11713174-61336355-00000000', 'Brunner Harper', '6537', 'Budapest', 'Karszt', 'utca', '98', NULL),
(260, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774669-31369967-00000000', 'Heilig Cadman', '4171', 'Budapest', 'Mély', 'utca', '18', NULL),
(261, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782977-76365647-00000000', 'Lang Flynn', '4424', 'Budapest', 'Modori', 'utca', '28', NULL),
(262, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767732-41877792-00000000', 'Wolf Lavinia', '9563', 'Budapest', 'Léc', 'utca', '87', NULL),
(263, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755382-52367353-00000000', 'Mayr Nicholas', '2437', 'Budapest', 'Határ', 'utca', '91', NULL),
(264, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735862-83575787-00000000', 'Schmidt Ifeoma', '7432', 'Budapest', 'Ellák', 'utca', '96', NULL),
(265, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765335-55471547-00000000', 'Bauer Austin', '2433', 'Budapest', 'Len', 'utca', '27', NULL),
(266, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743482-85778771-00000000', 'Bauer Zorita', '3585', 'Budapest', 'Pipi', 'utca', '77', NULL),
(267, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11719265-48875874-00000000', 'Eder Abdul', '4832', 'Budapest', 'Frigyes', 'utca', '17', NULL),
(268, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777852-67545684-00000000', 'Reiter Martina', '2878', 'Budapest', 'Mária', 'utca', '65', NULL),
(269, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11768632-57312347-00000000', 'Binder Demetria', '4686', 'Budapest', 'Párás', 'utca', '46', NULL),
(270, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11729619-36937625-00000000', 'Lang Kelsie', '3756', 'Budapest', 'Lotz', 'utca', '63', NULL),
(271, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11781689-82873332-00000000', 'Schuster Lyle', '4508', 'Budapest', 'Előd', 'utca', '51', NULL),
(272, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789528-63476686-00000000', 'Eder Jamal', '7575', 'Budapest', 'Kolozsvári', 'utca', '67', NULL),
(273, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788715-82827793-00000000', 'Reiter Nigel', '7374', 'Budapest', 'Lívia', 'utca', '75', NULL),
(274, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757456-43964276-00000000', 'Gruber Montana', '9581', 'Budapest', 'Pasaréti', 'utca', '45', NULL),
(275, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752848-39594719-00000000', 'Wolf Chaim', '2616', 'Budapest', 'Pitypang', 'utca', '73', NULL),
(276, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785663-13454617-00000000', 'Auer Harper', '5080', 'Budapest', 'Kecskerágó', 'utca', '37', NULL),
(277, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722361-22423115-00000000', 'Brunner William', '8835', 'Budapest', 'Káplár', 'utca', '68', NULL),
(278, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788235-37286123-00000000', 'Lechner Demetrius', '1953', 'Budapest', 'Kolozsvár', 'utca', '31', NULL),
(279, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737878-66731178-00000000', 'Schneider Beatrice', '4656', 'Budapest', 'Alsó', 'utca', '98', NULL),
(280, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748327-74683962-00000000', 'Schmid Leroy', '6710', 'Budapest', 'Lepke', 'utca', '62', NULL),
(281, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773223-83319248-00000000', 'Egger Jaden', '7312', 'Budapest', 'Bég', 'utca', '66', NULL),
(282, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775385-82228364-00000000', 'Steiner Lucian', '3486', 'Budapest', 'Pálvölgyi', 'utca', '13', NULL),
(283, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742784-57817714-00000000', 'Reiter Nicholas', '8191', 'Budapest', 'Házmán', 'utca', '86', NULL),
(284, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758231-92467467-00000000', 'Hofer Holly', '8144', 'Budapest', 'Henger', 'utca', '17', NULL),
(285, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735832-38542968-00000000', 'Huber Prescott', '9953', 'Budapest', 'Balogh', 'utca', '14', NULL),
(286, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726766-33683541-00000000', 'Huber Naida', '4099', 'Budapest', 'Rotta', 'utca', '42', NULL),
(287, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777682-97776247-00000000', 'Pichler Ivor', '5365', 'Budapest', 'Csatárka', 'utca', '30', NULL),
(288, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757825-71832599-00000000', 'Wolf Venus', '6166', 'Budapest', 'Hímes', 'utca', '83', NULL),
(289, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774218-25578675-00000000', 'Schneider Rinah', '3258', 'Budapest', 'Alsó', 'utca', '46', NULL),
(290, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757344-58491676-00000000', 'Moser Hammett', '7344', 'Budapest', 'Kevélyhegyi', 'utca', '86', NULL),
(291, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727545-76261421-00000000', 'Hofer Haviva', '7704', 'Budapest', 'Máriahegy', 'utca', '4', NULL),
(292, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722428-52373342-00000000', 'Pichler Katelyn', '2025', 'Budapest', 'Fekete', 'utca', '8', NULL),
(293, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718387-45374844-00000000', 'Moser Tashya', '4834', 'Budapest', 'Aranybulla', 'utca', '52', NULL),
(294, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742681-24748823-00000000', 'Eder Kennan', '4480', 'Budapest', 'Endrődi', 'utca', '53', NULL),
(295, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11716256-46518315-00000000', 'Wallner Hop', '8283', 'Budapest', 'Kőhegyi', 'utca', '50', NULL),
(296, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745975-82511243-00000000', 'Moser Imelda', '6712', 'Budapest', 'Hársalja', 'utca', '73', NULL),
(297, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764967-89912786-00000000', 'Schneider Conan', '5837', 'Budapest', 'Lorántffy', 'utca', '35', NULL),
(298, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772514-74377489-00000000', 'Haas Grady', '5775', 'Budapest', 'Pengő', 'utca', '38', NULL),
(299, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777967-64735338-00000000', 'Reiter Oleg', '8451', 'Budapest', 'Csalán', 'utca', '16', NULL),
(300, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767584-98467474-00000000', 'Mayr Cameran', '3271', 'Budapest', 'Margit', 'utca', '19', NULL),
(301, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11735753-29566459-00000000', 'Pichler Charles', '4614', 'Budapest', 'Máriahegy', 'utca', '9', NULL),
(302, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782334-41864475-00000000', 'Wallner Lara', '2806', 'Budapest', 'Áchim', 'utca', '42', NULL),
(303, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757285-67329454-00000000', 'Schmid Felix', '8653', 'Budapest', 'Cirbolya', 'utca', '78', NULL),
(304, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751447-95642375-00000000', 'Lechner Cairo', '6173', 'Budapest', 'Hársfavirág', 'utca', '97', NULL),
(305, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11771638-74337553-00000000', 'Wallner Ezra', '5838', 'Budapest', 'Petrezselyem', 'utca', '11', NULL),
(306, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776888-67132629-00000000', 'Müller Tasha', '9951', 'Budapest', 'Jegesmedve', 'utca', '95', NULL),
(307, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732765-56222423-00000000', 'Mayr Gareth', '3134', 'Budapest', 'Kálvária', 'utca', '32', NULL),
(308, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751656-12653642-00000000', 'Schneider Zeus', '8972', 'Budapest', 'Káplár', 'utca', '91', NULL),
(309, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727351-83654196-00000000', 'Wallner Guinevere', '2124', 'Budapest', 'Aranka', 'utca', '83', NULL),
(310, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774682-24844282-00000000', 'Wallner Chancellor', '3729', 'Budapest', 'Pinceszer', 'utca', '74', NULL),
(311, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772318-77927772-00000000', 'Lang Sage', '2901', 'Budapest', 'Batyu', 'utca', '20', NULL),
(312, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11721198-73273342-00000000', 'Leitner Gabriel', '9143', 'Budapest', 'Apostol', 'utca', '95', NULL),
(313, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765645-71321686-00000000', 'Pichler Portia', '9324', 'Budapest', 'Csatlós', 'utca', '91', NULL),
(314, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11714634-48646748-00000000', 'Bauer Emma', '3214', 'Budapest', 'Léc', 'utca', '26', NULL),
(315, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11721165-56681643-00000000', 'Maier Phillip', '2531', 'Budapest', 'Kis', 'utca', '90', NULL),
(316, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756147-47558943-00000000', 'Schmid Kerry', '9878', 'Budapest', 'Frigyes', 'utca', '60', NULL),
(317, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752761-72374232-00000000', 'Gruber Thane', '5918', 'Budapest', 'Henger', 'utca', '24', NULL),
(318, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793477-38542153-00000000', 'Koller Logan', '2137', 'Budapest', 'Jegesmedve', 'utca', '38', NULL),
(319, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774233-62483834-00000000', 'Heilig Cadman', '5511', 'Budapest', 'Fekete', 'utca', '39', NULL),
(320, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742272-23886687-00000000', 'Wagner Colorado', '5887', 'Budapest', 'Pinceszer', 'utca', '83', NULL),
(321, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11759568-58775467-00000000', 'Reiter Kirk', '1434', 'Budapest', 'Kazinczy', 'utca', '30', NULL),
(322, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763636-88258687-00000000', 'Pichler Riley', '8854', 'Budapest', 'Mikes', 'utca', '33', NULL),
(323, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11717984-33246746-00000000', 'Berger Quynn', '3651', 'Budapest', 'Bátori', 'utca', '98', NULL),
(324, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11787277-13468514-00000000', 'Wallner Fritz', '3686', 'Budapest', 'Józsefhegyi', 'utca', '58', NULL),
(325, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745121-83624683-00000000', 'Berger Sydnee', '4451', 'Budapest', 'Hársalja', 'utca', '62', NULL),
(326, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11769645-28599173-00000000', 'Schuster Amos', '6525', 'Budapest', 'Máriaremetei', 'utca', '50', NULL),
(327, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11746894-87265656-00000000', 'Wolf Kyla', '4282', 'Budapest', 'Belső', 'utca', '3', NULL),
(328, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722287-69233427-00000000', 'Huber India', '7448', 'Budapest', 'Arany', 'utca', '41', NULL),
(329, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751757-44675262-00000000', 'Weber Devin', '8970', 'Budapest', 'Hegyi', 'utca', '43', NULL),
(330, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766794-34182432-00000000', 'Leitner Quentin', '8946', 'Budapest', 'Ady', 'utca', '97', NULL),
(331, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11736419-32135594-00000000', 'Schuster Victoria', '8968', 'Budapest', 'Líra', 'utca', '99', NULL),
(332, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793658-17285668-00000000', 'Berger Dominic', '7441', 'Budapest', 'József', 'utca', '12', NULL),
(333, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732472-47582689-00000000', 'Lechner Diana', '9557', 'Budapest', 'Hímes', 'utca', '61', NULL),
(334, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784429-24995846-00000000', 'Lang Orlando', '4712', 'Budapest', 'Paprikás', 'utca', '95', NULL),
(335, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763226-23663334-00000000', 'Wolf Ulric', '6634', 'Budapest', 'Páfránykert', 'utca', '59', NULL),
(336, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11771575-47253382-00000000', 'Wallner Haviva', '2774', 'Budapest', 'Margit', 'utca', '66', NULL),
(337, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756634-26281274-00000000', 'Lechner Alma', '3803', 'Budapest', 'Cimbalom', 'utca', '68', NULL),
(338, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748661-67537552-00000000', 'Pichler Neil', '3036', 'Budapest', 'Lehel', 'utca', '2', NULL);
INSERT INTO `taxpayer` (`taxpayer_id`, `taxnumber_id`, `groupmember_taxnumber_id`, `communityVatNumber`, `individualExemption`, `incorporation`, `taxPayerrVatStatus`, `bankAccountNumber`, `taxPayerName`, `postalCode`, `city`, `streetName`, `publicPlaceCategory`, `number`, `additionalAddressDetail`) VALUES
(339, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11763545-56588377-00000000', 'Reiter Zane', '6054', 'Budapest', 'Bátori', 'utca', '71', NULL),
(340, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777333-15678253-00000000', 'Wallner Christian', '2564', 'Budapest', 'Csatlós', 'utca', '5', NULL),
(341, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743485-68444328-00000000', 'Müller Imogene', '1886', 'Budapest', 'Apostol', 'utca', '41', NULL),
(342, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11791283-33321877-00000000', 'Aigner Priscilla', '6418', 'Budapest', 'Lorántffy', 'utca', '66', NULL),
(343, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737739-42823134-00000000', 'Huber Allen', '3545', 'Budapest', 'Csalit', 'utca', '70', NULL),
(344, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11792568-77735626-00000000', 'Müller Jerome', '5494', 'Budapest', 'Kelemen', 'utca', '86', NULL),
(345, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11739448-77788434-00000000', 'Fuchs Aristotle', '3834', 'Budapest', 'Kapor', 'utca', '1', NULL),
(346, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766884-81571728-00000000', 'Fuchs Kimberley', '9710', 'Budapest', 'Levél', 'utca', '15', NULL),
(347, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762772-98631721-00000000', 'Mayr Stone', '2544', 'Budapest', 'Karabély', 'utca', '16', NULL),
(348, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778943-53352399-00000000', 'Fuchs Keefe', '9764', 'Budapest', 'Kőfejtő', 'utca', '54', NULL),
(349, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723562-25697336-00000000', 'Mayr Ciaran', '7545', 'Budapest', 'Levél', 'utca', '9', NULL),
(350, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11759773-67478321-00000000', 'Reiter Penelope', '2615', 'Budapest', 'Páfrány', 'utca', '39', NULL),
(351, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11747765-27623773-00000000', 'Fischer Rhona', '2265', 'Budapest', 'Hidász', 'utca', '43', NULL),
(352, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733514-77339928-00000000', 'Lehner Reed', '7342', 'Budapest', 'Hársfavirág', 'utca', '71', NULL),
(353, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789646-34888345-00000000', 'Hofer Jolene', '5438', 'Budapest', 'Barlang', 'utca', '48', NULL),
(354, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11795697-54787387-00000000', 'Wallner Aimee', '2211', 'Budapest', 'Labdarózsa', 'utca', '98', NULL),
(355, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784455-57268432-00000000', 'Schwarz Beverly', '5253', 'Budapest', 'Párás', 'utca', '34', NULL),
(356, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789286-88835775-00000000', 'Müller Amal', '6413', 'Budapest', 'Pálvölgyi', 'utca', '85', NULL),
(357, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752223-57632356-00000000', 'Schwarz Erich', '8562', 'Budapest', 'Harmatcsepp', 'utca', '13', NULL),
(358, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11755716-82672624-00000000', 'Wimmer Rhonda', '4412', 'Budapest', 'Hímes', 'utca', '94', NULL),
(359, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741133-11227848-00000000', 'Huber Hedwig', '4362', 'Budapest', 'Hárshegyi', 'utca', '81', NULL),
(360, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718243-44889855-00000000', 'Schwarz Yael', '1388', 'Budapest', 'Káplár', 'utca', '22', NULL),
(361, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11787471-84561225-00000000', 'Wallner Kitra', '1522', 'Budapest', 'Henger', 'utca', '33', NULL),
(362, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11747295-46343248-00000000', 'Wimmer Jared', '5875', 'Budapest', 'Kardos', 'utca', '92', NULL),
(363, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11733347-67467634-00000000', 'Fischer Audra', '9133', 'Budapest', 'Lívia', 'utca', '96', NULL),
(364, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777346-69734783-00000000', 'Lechner Charles', '1551', 'Budapest', 'Ádám', 'utca', '14', NULL),
(365, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11761967-66154713-00000000', 'Auer Ariana', '2848', 'Budapest', 'Hímes', 'utca', '13', NULL),
(366, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753332-54285746-00000000', 'Auer Beau', '6952', 'Budapest', 'Hímes', 'utca', '42', NULL),
(367, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772242-41635172-00000000', 'Fuchs Sophia', '7205', 'Budapest', 'Labanc', 'utca', '90', NULL),
(368, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727553-55283437-00000000', 'Koller Gray', '5566', 'Budapest', 'Cirbolya', 'utca', '2', NULL),
(369, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773756-44526447-00000000', 'Ebner Veronica', '8789', 'Budapest', 'Párás', 'utca', '70', NULL),
(370, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753656-63566255-00000000', 'Steiner Addison', '4280', 'Budapest', 'Lívia', 'utca', '85', NULL),
(371, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757584-86281734-00000000', 'Egger Macey', '6621', 'Budapest', 'Emelkedő', 'utca', '64', NULL),
(372, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742125-26784354-00000000', 'Haas Melvin', '4463', 'Budapest', 'Áldás', 'utca', '58', NULL),
(373, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737967-71487556-00000000', 'Moser Linda', '4643', 'Budapest', 'Hárshegyi', 'utca', '65', NULL),
(374, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776721-98252623-00000000', 'Gruber Josephine', '2527', 'Budapest', 'Feketefej', 'utca', '9', NULL),
(375, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726281-68267328-00000000', 'Aigner Flynn', '2370', 'Budapest', 'Csalit', 'utca', '22', NULL),
(376, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751187-82555549-00000000', 'Mayr Vincent', '3652', 'Budapest', 'Kökény', 'utca', '85', NULL),
(377, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11777273-68477132-00000000', 'Koller Wayne', '6443', 'Budapest', 'Léc', 'utca', '36', NULL),
(378, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11714376-83535215-00000000', 'Egger Walter', '6439', 'Budapest', 'Házmán', 'utca', '89', NULL),
(379, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741846-36333347-00000000', 'Lechner Ray', '8369', 'Budapest', 'Palánta', 'utca', '54', NULL),
(380, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11762517-77481361-00000000', 'Lehner Aspen', '4231', 'Budapest', 'Máriaremetei', 'utca', '47', NULL),
(381, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784437-58673753-00000000', 'Koller Rhonda', '2688', 'Budapest', 'Kardos', 'utca', '26', NULL),
(382, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726782-68877853-00000000', 'Schuster Zephr', '1132', 'Budapest', 'Kaptató', 'utca', '50', NULL),
(383, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11724952-62539948-00000000', 'Schuster Cruz', '2753', 'Budapest', 'Mária', 'utca', '41', NULL),
(384, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11797546-34948415-00000000', 'Schuster Serena', '3842', 'Budapest', 'Piszke', 'utca', '89', NULL),
(385, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773477-72457618-00000000', 'Aigner McKenzie', '4784', 'Budapest', 'Pasaréti', 'utca', '62', NULL),
(386, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774166-24478331-00000000', 'Fuchs Cassandra', '5714', 'Budapest', 'Fényes', 'utca', '70', NULL),
(387, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718566-21649732-00000000', 'Steiner Elaine', '3823', 'Budapest', 'Hársalja', 'utca', '84', NULL),
(388, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782862-23975447-00000000', 'Egger Amity', '4523', 'Budapest', 'Modori', 'utca', '44', NULL),
(389, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775182-52446325-00000000', 'Schwarz Beverly', '5731', 'Budapest', 'Leshegy', 'utca', '4', NULL),
(390, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11712922-75246878-00000000', 'Wolf Ezra', '3774', 'Budapest', 'Felső', 'utca', '56', NULL),
(391, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752437-52862368-00000000', 'Eder Victor', '6268', 'Budapest', 'Arany', 'utca', '23', NULL),
(392, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752653-76232526-00000000', 'Koller Ezra', '9283', 'Budapest', 'Paprikás', 'utca', '34', NULL),
(393, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738648-83252675-00000000', 'Bauer Cynthia', '4766', 'Budapest', 'Kenyérmező', 'utca', '41', NULL),
(394, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723222-46437327-00000000', 'Maier Macon', '5772', 'Budapest', 'Baka', 'utca', '25', NULL),
(395, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776515-66555428-00000000', 'Mayer Brennan', '5777', 'Budapest', 'Fejsze', 'utca', '55', NULL),
(396, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753322-77725437-00000000', 'Schuster Palmer', '7478', 'Budapest', 'Kavics', 'utca', '31', NULL),
(397, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723187-75671153-00000000', 'Mayer Dale', '6835', 'Budapest', 'Batta', 'utca', '75', NULL),
(398, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757345-68477676-00000000', 'Wagner Hayden', '8684', 'Budapest', 'Mecenzéf', 'utca', '83', NULL),
(399, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784274-72779457-00000000', 'Auer Katell', '5631', 'Budapest', 'Belső', 'utca', '65', NULL),
(400, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773275-52367641-00000000', 'Haas Bertha', '9636', 'Budapest', 'Áfonya', 'utca', '40', NULL),
(401, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722154-14463796-00000000', 'Schneider Salvador', '2321', 'Budapest', 'Kokárda', 'utca', '79', NULL),
(402, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11798598-78299183-00000000', 'Weber Quinlan', '7171', 'Budapest', 'Csatár', 'utca', '37', NULL),
(403, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741263-65752286-00000000', 'Schneider Gannon', '3626', 'Budapest', 'Jókai', 'utca', '49', NULL),
(404, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11768279-37946219-00000000', 'Schmidt Octavius', '4511', 'Budapest', 'Len', 'utca', '7', NULL),
(405, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793728-57843541-00000000', 'Schwarz Blaze', '6117', 'Budapest', 'Csalán', 'utca', '78', NULL),
(406, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742227-67721559-00000000', 'Weber Amethyst', '4179', 'Budapest', 'Margit', 'utca', '63', NULL),
(407, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789926-76756261-00000000', 'Eder Herman', '6636', 'Budapest', 'Kolozsvár', 'utca', '59', NULL),
(408, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789517-62444629-00000000', 'Baumgartner Joseph', '1438', 'Budapest', 'Járóka', 'utca', '75', NULL),
(409, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756986-63926376-00000000', 'Aigner Michael', '5363', 'Budapest', 'Kisfaludy', 'utca', '7', NULL),
(410, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726418-14446395-00000000', 'Baumgartner Stephanie', '7912', 'Budapest', 'Hársalja', 'utca', '86', NULL),
(411, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741752-76758278-00000000', 'Schmidt Dustin', '9235', 'Budapest', 'Kassa', 'utca', '6', NULL),
(412, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11783841-26215564-00000000', 'Eder Brittany', '7523', 'Budapest', 'Rókus', 'utca', '45', NULL),
(413, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758816-35724546-00000000', 'Gruber Ella', '8928', 'Budapest', 'Csejte', 'utca', '30', NULL),
(414, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11798634-67827428-00000000', 'Egger Wayne', '8732', 'Budapest', 'Pengő', 'utca', '45', NULL),
(415, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11742669-19852547-00000000', 'Leitner Dorian', '8231', 'Budapest', 'Pitypang', 'utca', '30', NULL),
(416, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764539-33663626-00000000', 'Moser Lillith', '2584', 'Budapest', 'Keszi', 'utca', '3', NULL),
(417, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11778469-88646374-00000000', 'Eder Ocean', '6325', 'Budapest', 'Margit', 'utca', '35', NULL),
(418, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11789252-92494267-00000000', 'Moser Declan', '2418', 'Budapest', 'Cseppkő', 'utca', '3', NULL),
(419, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11753572-27634774-00000000', 'Wallner Leonard', '1466', 'Budapest', 'Mária', 'utca', '0', NULL),
(420, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11799284-36465772-00000000', 'Leitner Cheryl', '1822', 'Budapest', 'Jókai', 'utca', '86', NULL),
(421, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722472-84238752-00000000', 'Fuchs Jacqueline', '7891', 'Budapest', 'Hímes', 'utca', '93', NULL),
(422, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11729622-29325644-00000000', 'Gruber Burton', '6429', 'Budapest', 'Járóka', 'utca', '95', NULL),
(423, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11794725-18426646-00000000', 'Egger Karyn', '5853', 'Budapest', 'Mátra', 'utca', '19', NULL),
(424, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772312-23539645-00000000', 'Haas Karen', '6388', 'Budapest', 'Mecset', 'utca', '23', NULL),
(425, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757621-95643659-00000000', 'Mayer Frances', '3822', 'Budapest', 'Csatárka', 'utca', '25', NULL),
(426, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725698-85828265-00000000', 'Fischer Joelle', '6387', 'Budapest', 'Alvinci', 'utca', '10', NULL),
(427, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766443-58864578-00000000', 'Brunner Charles', '6627', 'Budapest', 'Margit', 'utca', '70', NULL),
(428, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757344-95476567-00000000', 'Egger Hiram', '1503', 'Budapest', 'Rókus', 'utca', '93', NULL),
(429, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764897-26635674-00000000', 'Fischer Yardley', '5754', 'Budapest', 'Petőfi', 'utca', '25', NULL),
(430, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793753-87545425-00000000', 'Lehner Risa', '4784', 'Budapest', 'Kapor', 'utca', '62', NULL),
(431, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756826-55687315-00000000', 'Egger Zane', '5851', 'Budapest', 'Barlang', 'utca', '46', NULL),
(432, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785633-56857396-00000000', 'Wimmer Dominic', '7167', 'Budapest', 'Pajzs', 'utca', '76', NULL),
(433, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749782-97791167-00000000', 'Berger Cameron', '3752', 'Budapest', 'Mátra', 'utca', '57', NULL),
(434, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11723377-28371284-00000000', 'Schuster Cora', '5378', 'Budapest', 'József', 'utca', '58', NULL),
(435, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11772744-94617731-00000000', 'Heilig Stone', '6833', 'Budapest', 'Kárpát', 'utca', '77', NULL),
(436, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11746488-74553588-00000000', 'Ebner Hanna', '7113', 'Budapest', 'Rotta', 'utca', '53', NULL),
(437, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11784667-52749817-00000000', 'Müller Margaret', '2508', 'Budapest', 'Árvácska', 'utca', '68', NULL),
(438, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11734673-73784215-00000000', 'Schneider Preston', '3845', 'Budapest', 'Cserje', 'utca', '47', NULL),
(439, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773457-67493389-00000000', 'Wallner Reese', '5635', 'Budapest', 'Petrezselyem', 'utca', '88', NULL),
(440, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752746-87964353-00000000', 'Lechner Clinton', '5136', 'Budapest', 'Arad', 'utca', '47', NULL),
(441, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11788727-75867892-00000000', 'Reiter Whitney', '8675', 'Budapest', 'Miatyánk', 'utca', '46', NULL),
(442, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743792-72694786-00000000', 'Koller Portia', '9438', 'Budapest', 'Feketefej', 'utca', '44', NULL),
(443, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782287-42295785-00000000', 'Maier Zahir', '2763', 'Budapest', 'Kis', 'utca', '37', NULL),
(444, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725556-25934683-00000000', 'Pichler Galvin', '8274', 'Budapest', 'Kecskerágó', 'utca', '89', NULL),
(445, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11767427-88487768-00000000', 'Hofer Finn', '4135', 'Budapest', 'Pajzs', 'utca', '77', NULL),
(446, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752364-88454764-00000000', 'Hofer Cullen', '7315', 'Budapest', 'Jegesmedve', 'utca', '77', NULL),
(447, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728345-93761371-00000000', 'Lang Blaze', '5448', 'Budapest', 'Piszke', 'utca', '44', NULL),
(448, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11726375-58242535-00000000', 'Fischer Cole', '6617', 'Budapest', 'Hársalja', 'utca', '37', NULL),
(449, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11782597-33856148-00000000', 'Wagner Tatyana', '6357', 'Budapest', 'Kálvária', 'utca', '51', NULL),
(450, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743268-38588359-00000000', 'Eder George', '2554', 'Budapest', 'Kerényi', 'utca', '2', NULL),
(451, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764496-11873781-00000000', 'Brunner Dennis', '2481', 'Budapest', 'Paprikás', 'utca', '80', NULL),
(452, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11738494-83138432-00000000', 'Reiter Aaron', '4669', 'Budapest', 'Bajnok', 'utca', '31', NULL),
(453, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11715522-31597554-00000000', 'Koller Ebony', '2534', 'Budapest', 'Hársfavirág', 'utca', '82', NULL),
(454, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11768178-16389167-00000000', 'Gruber Orlando', '7143', 'Budapest', 'Alsó', 'utca', '66', NULL),
(455, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11752775-45726636-00000000', 'Lechner Matthew', '4218', 'Budapest', 'Cserge', 'utca', '97', NULL),
(456, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11743864-15696436-00000000', 'Lechner Basia', '8164', 'Budapest', 'Jókai', 'utca', '17', NULL),
(457, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11737744-56266571-00000000', 'Fischer Kareem', '2262', 'Budapest', 'Balogvár', 'utca', '71', NULL),
(458, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774884-23428783-00000000', 'Auer Mara', '4241', 'Budapest', 'Cirbolya', 'utca', '64', NULL),
(459, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11757697-53853786-00000000', 'Gruber Shaeleigh', '6918', 'Budapest', 'Mikszáth', 'utca', '26', NULL),
(460, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765299-86667833-00000000', 'Maier Ocean', '7866', 'Budapest', 'Heinrich', 'utca', '17', NULL),
(461, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751293-35725478-00000000', 'Schuster Lilah', '3758', 'Budapest', 'Csatár', 'utca', '96', NULL),
(462, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11736757-14517252-00000000', 'Eder Lila', '4224', 'Budapest', 'Lívia', 'utca', '76', NULL),
(463, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11751846-75956646-00000000', 'Haas Zelda', '2594', 'Budapest', 'Arad', 'utca', '80', NULL),
(464, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11781429-25412543-00000000', 'Hofer Iona', '2546', 'Budapest', 'Baka', 'utca', '87', NULL),
(465, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11756427-63368831-00000000', 'Wolf Francesca', '5152', 'Budapest', 'Kőhegyi', 'utca', '50', NULL),
(466, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766881-14478267-00000000', 'Fischer Mary', '7831', 'Budapest', 'Mátra', 'utca', '45', NULL),
(467, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775726-78339445-00000000', 'Wallner Jerome', '5372', 'Budapest', 'Csévi', 'utca', '84', NULL),
(468, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773373-33922986-00000000', 'Binder Quyn', '1271', 'Budapest', 'Palatinus', 'utca', '5', NULL),
(469, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748553-73356586-00000000', 'Hofer Latifah', '2187', 'Budapest', 'Csejte', 'utca', '40', NULL),
(470, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11722828-98841866-00000000', 'Mayr Briar', '6813', 'Budapest', 'Ellák', 'utca', '56', NULL),
(471, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11745892-45722824-00000000', 'Wolf Quamar', '3211', 'Budapest', 'Csévi', 'utca', '82', NULL),
(472, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11759324-83362225-00000000', 'Gruber Cathleen', '6856', 'Budapest', 'Muflon', 'utca', '66', NULL),
(473, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11732884-44331779-00000000', 'Reiter Carissa', '6518', 'Budapest', 'Rotta', 'utca', '69', NULL),
(474, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11764854-53288284-00000000', 'Wolf Beverly', '4909', 'Budapest', 'Kerényi', 'utca', '34', NULL),
(475, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748712-28569235-00000000', 'Ebner Destiny', '4883', 'Budapest', 'Kassa', 'utca', '26', NULL),
(476, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774374-85779729-00000000', 'Maier Tatyana', '8883', 'Budapest', 'Rókus', 'utca', '67', NULL),
(477, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11725328-42477675-00000000', 'Eder Linus', '6418', 'Budapest', 'Labanc', 'utca', '22', NULL),
(478, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11765423-88264343-00000000', 'Auer Kirsten', '3878', 'Budapest', 'Józsefhegyi', 'utca', '30', NULL),
(479, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766354-34725416-00000000', 'Aigner Sydnee', '5145', 'Budapest', 'János', 'utca', '82', NULL),
(480, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11728556-25566513-00000000', 'Wimmer Richard', '7703', 'Budapest', 'Kárpát', 'utca', '84', NULL),
(481, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11721273-79548637-00000000', 'Brunner Cameron', '8887', 'Budapest', 'Áldás', 'utca', '90', NULL),
(482, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11749846-63737732-00000000', 'Fuchs John', '5840', 'Budapest', 'Csalán', 'utca', '83', NULL),
(483, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11747496-21783816-00000000', 'Lehner Ryan', '7088', 'Budapest', 'Hidász', 'utca', '67', NULL),
(484, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11741136-76118617-00000000', 'Lechner Xyla', '3348', 'Budapest', 'Hárshegyi', 'utca', '53', NULL),
(485, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11773951-56233473-00000000', 'Brunner Anastasia', '8363', 'Budapest', 'Rotta', 'utca', '79', NULL),
(486, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11714876-65873549-00000000', 'Müller Colt', '5978', 'Budapest', 'Lupény', 'utca', '46', NULL),
(487, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11727443-54388352-00000000', 'Auer Regan', '8706', 'Budapest', 'Pajzs', 'utca', '70', NULL),
(488, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11774392-43253913-00000000', 'Huber Ariana', '2986', 'Budapest', 'Mikes', 'utca', '62', NULL),
(489, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11776263-22626579-00000000', 'Berger Karyn', '7475', 'Budapest', 'Emese', 'utca', '82', NULL),
(490, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11775667-26444535-00000000', 'Mayr Nerea', '4592', 'Budapest', 'Aranka', 'utca', '77', NULL),
(491, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11748471-76986486-00000000', 'Wagner Carolyn', '1114', 'Budapest', 'Margit', 'utca', '47', NULL),
(492, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11787538-43352973-00000000', 'Schwarz Vielka', '7671', 'Budapest', 'Csatárka', 'utca', '23', NULL),
(493, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11793378-58837454-00000000', 'Eder Leroy', '3941', 'Budapest', 'Mária', 'utca', '26', NULL),
(494, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718287-33863859-00000000', 'Lehner Lael', '5876', 'Budapest', 'Ali', 'utca', '92', NULL),
(495, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11718293-88752449-00000000', 'Pichler Vivien', '6466', 'Budapest', 'Len', 'utca', '32', NULL),
(496, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11792296-99256736-00000000', 'Schwarz Ray', '7383', 'Budapest', 'Ádám', 'utca', '60', NULL),
(497, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11754426-17583555-00000000', 'Baumgartner Theodore', '4237', 'Budapest', 'Csejte', 'utca', '91', NULL),
(498, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11758258-21775488-00000000', 'Müller Kirsten', '3540', 'Budapest', 'Páfránykert', 'utca', '58', NULL),
(499, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11766347-42522524-00000000', 'Winkler Gretchen', '2868', 'Budapest', 'Patróna', 'utca', '39', NULL),
(500, NULL, NULL, NULL, 0, NULL, 'PRIVATE_PERSON', '11785258-65742966-00000000', 'Schuster Talon', '7415', 'Budapest', 'Miatyánk', 'utca', '33', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`invoicedetails_id`);

--
-- A tábla indexei `invoicehead`
--
ALTER TABLE `invoicehead`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`,`invoicedetails_id`,`supplier_id`,`customer_id`),
  ADD KEY `invoicedetails_id` (`invoicedetails_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- A tábla indexei `invoicelines`
--
ALTER TABLE `invoicelines`
  ADD PRIMARY KEY (`line_id`),
  ADD UNIQUE KEY `line_id` (`line_id`,`invoice_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- A tábla indexei `taxnumber`
--
ALTER TABLE `taxnumber`
  ADD PRIMARY KEY (`taxnumber_id`),
  ADD UNIQUE KEY `taxnumber_id` (`taxnumber_id`);

--
-- A tábla indexei `taxpayer`
--
ALTER TABLE `taxpayer`
  ADD PRIMARY KEY (`taxpayer_id`),
  ADD UNIQUE KEY `taxpayer_id` (`taxpayer_id`,`taxnumber_id`),
  ADD KEY `taxnumber_id` (`taxnumber_id`),
  ADD KEY `groupmember_taxpayer_id` (`groupmember_taxnumber_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `invoicedetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `invoicehead`
--
ALTER TABLE `invoicehead`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `invoicelines`
--
ALTER TABLE `invoicelines`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT a táblához `taxnumber`
--
ALTER TABLE `taxnumber`
  MODIFY `taxnumber_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `taxpayer`
--
ALTER TABLE `taxpayer`
  MODIFY `taxpayer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `invoicehead`
--
ALTER TABLE `invoicehead`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `taxpayer` (`taxpayer_id`),
  ADD CONSTRAINT `invoicedetails_id` FOREIGN KEY (`invoicedetails_id`) REFERENCES `invoicedetails` (`invoicedetails_id`),
  ADD CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `taxpayer` (`taxpayer_id`);

--
-- Megkötések a táblához `invoicelines`
--
ALTER TABLE `invoicelines`
  ADD CONSTRAINT `invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoicedetails` (`invoicedetails_id`);

--
-- Megkötések a táblához `taxpayer`
--
ALTER TABLE `taxpayer`
  ADD CONSTRAINT `groupmember_taxpayer_id` FOREIGN KEY (`groupmember_taxnumber_id`) REFERENCES `taxnumber` (`taxnumber_id`),
  ADD CONSTRAINT `taxnumber_id` FOREIGN KEY (`taxnumber_id`) REFERENCES `taxnumber` (`taxnumber_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
