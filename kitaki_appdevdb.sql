-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2015 at 07:14 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kitaki_appdevdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE IF NOT EXISTS `invoice_details` (
  `invoice_id` int(11) NOT NULL,
  `user_category_id` int(11) DEFAULT NULL,
  `invoice_desc` varchar(200) DEFAULT NULL,
  `ship_to_date` date NOT NULL,
  `ship_to_id` int(11) NOT NULL,
  `invoice_to_id` varchar(100) NOT NULL,
  `invoice_amount` float DEFAULT NULL,
  `invoice_qty` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_track_id` int(21) NOT NULL,
  `insur_status` varchar(100) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `uid_buyer` int(11) NOT NULL,
  `txn_updated_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_create_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `invoice_details`:
--   `user_category_id`
--       `user_category` -> `user_category_id`
--   `order_id`
--       `order_detail` -> `order_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_validations`
--

CREATE TABLE IF NOT EXISTS `login_validations` (
  `id` int(15) NOT NULL,
  `pin_num` varchar(4) NOT NULL,
  `uid` int(11) NOT NULL,
  `role_id` int(5) NOT NULL,
  `regd_status_id` int(5) NOT NULL,
  `imie_id` varchar(50) DEFAULT NULL,
  `phone_num` int(15) DEFAULT NULL,
  `user_create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `login_validations`:
--   `uid`
--       `user_detail` -> `uid`
--   `role_id`
--       `user_roles` -> `role_id`
--   `regd_status_id`
--       `regd_status` -> `regd_id`
--

--
-- Dumping data for table `login_validations`
--

INSERT INTO `login_validations` (`id`, `pin_num`, `uid`, `role_id`, `regd_status_id`, `imie_id`, `phone_num`, `user_create_ts`, `user_update_ts`) VALUES
(1, '1234', 101, 1, 503, '12awe12', 2147483647, '2015-06-20 06:31:03', '2015-06-20 06:31:03'),
(2, '1456', 102, 1, 503, '113423', 2147483647, '2015-06-20 06:30:58', '2015-06-20 06:30:58'),
(3, '1123', 103, 1, 503, '123453', 2147483647, '2015-06-09 05:31:09', '2015-06-09 05:31:09'),
(4, '1876', 104, 1, 503, '125432', 2147483647, '2015-06-20 06:31:03', '2015-06-20 06:31:03'),
(6, '9876', 201, 2, 503, '675376', 2147483647, '2015-06-08 19:40:25', '2015-06-08 19:40:25'),
(7, '7654', 202, 2, 503, '453212', 2147483647, '2015-06-08 19:40:45', '2015-06-08 19:40:45'),
(8, '9843', 203, 2, 503, '127865', 2147483647, '2015-06-08 19:40:49', '2015-06-08 19:40:49'),
(9, '8796', 204, 2, 503, '132143', 2147483647, '2015-06-08 19:40:51', '2015-06-08 19:40:51'),
(10, '9', 205, 2, 503, '091234', 890714521, '2015-06-08 19:40:51', '2015-06-08 19:40:52'),
(11, '987', 206, 2, 503, '129087', 2147483647, '2015-06-08 19:40:59', '2015-06-08 19:40:59'),
(12, '98', 207, 2, 503, '112298', 2147483647, '2015-06-08 19:41:25', '2015-06-08 19:41:25'),
(13, '1098', 208, 2, 503, '121232', 2147483647, '2015-06-08 19:41:30', '2015-06-08 19:41:30'),
(14, '1178', 209, 2, 503, '119876', 2147483647, '2015-06-08 19:41:32', '2015-06-08 19:41:32'),
(15, '1054', 215, 2, 503, '116532', 2147483647, '2015-06-08 19:41:38', '2015-06-08 19:41:38'),
(16, '1423', 210, 2, 503, '120956', 2147483647, '2015-06-08 19:41:45', '2015-06-08 19:41:45'),
(17, '7654', 211, 2, 503, '231124', 2147483647, '2015-06-08 19:41:49', '2015-06-08 19:41:49'),
(18, '1908', 212, 2, 503, '125612', 2147483647, '2015-06-08 19:42:25', '2015-06-08 19:42:25'),
(19, '2234', 213, 3, 503, '110987', 887774521, '2015-06-08 19:44:25', '2015-06-08 19:44:25'),
(20, '2256', 214, 3, 503, '187654', 2147483647, '2015-06-08 19:45:25', '2015-06-08 19:45:25'),
(99, '1010', 100, 1, 503, '11qwa12', 2147483647, '2015-07-24 20:39:00', '2015-07-24 20:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `uid_buyer` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_price` int(11) NOT NULL,
  `order_tot_amount` int(11) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `order_dispatch_date` date NOT NULL,
  `order_track_num` int(21) NOT NULL,
  `order_qty_type` varchar(50) DEFAULT NULL,
  `order_fulfil_status` varchar(50) DEFAULT NULL,
  `order_receive_date` date NOT NULL,
  `order_ref_id` varchar(100) DEFAULT NULL,
  `txn_username` int(11) NOT NULL,
  `txn_create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `orders`:
--   `uid_buyer`
--       `user_detail` -> `uid`
--

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `uid_buyer`, `order_qty`, `order_date`, `order_price`, `order_tot_amount`, `order_status`, `order_dispatch_date`, `order_track_num`, `order_qty_type`, `order_fulfil_status`, `order_receive_date`, `order_ref_id`, `txn_username`, `txn_create_ts`) VALUES
(2706001, 201, 10, '0000-00-00', 2000, 2000, 'new', '0000-00-00', 9888881, 'single', 'fulfilled', '0000-00-00', '2706001', 0, '0000-00-00 00:00:00'),
(2706002, 201, 100, '0000-00-00', 10000, 20000, 'new', '0000-00-00', 9888882, 'half', 'partial', '0000-00-00', '2706002', 0, '0000-00-00 00:00:00'),
(2706003, 201, 100, '0000-00-00', 10000, 20000, 'partial', '0000-00-00', 9888882, 'half', 'fulfilled', '0000-00-00', '2706002', 0, '0000-00-00 00:00:00'),
(2706004, 201, 200, '0000-00-00', 20000, 40000, 'new', '0000-00-00', 9888883, '100', 'partial', '0000-00-00', '2706004', 0, '0000-00-00 00:00:00'),
(2706005, 201, 100, '0000-00-00', 20000, 40000, 'partial', '0000-00-00', 9888883, '100', 'fulfilled', '0000-00-00', '2706004', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `uid_buyer` int(11) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price_id` int(11) NOT NULL,
  `txn_updated_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_create_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `order_detail`:
--   `product_id`
--       `product_details` -> `product_id`
--   `price_id`
--       `price_details` -> `price_id`
--   `uid_seller`
--       `user_detail` -> `uid`
--   `order_id`
--       `orders` -> `order_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail_temp`
--

CREATE TABLE IF NOT EXISTS `order_detail_temp` (
  `order_id` int(11) NOT NULL,
  `uid_buyer` int(11) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `role_id` int(5) DEFAULT '2',
  `product_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_price` float NOT NULL,
  `order_tot_amount` float NOT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT 'NEW',
  `txn_created_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `order_detail_temp`:
--   `uid_buyer`
--       `user_detail` -> `uid`
--   `role_id`
--       `user_roles` -> `role_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `price_details`
--

CREATE TABLE IF NOT EXISTS `price_details` (
  `price_id` int(11) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `user_category_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_price` float NOT NULL,
  `txn_create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_username` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `price_details`:
--   `uid_seller`
--       `user_detail` -> `uid`
--   `user_category_id`
--       `user_category` -> `user_category_id`
--

--
-- Dumping data for table `price_details`
--

INSERT INTO `price_details` (`price_id`, `uid_seller`, `user_category_id`, `product_id`, `product_price`, `txn_create_ts`, `txn_update_ts`, `txn_username`) VALUES
(103, 100, 20, 406, 650, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(104, 101, 30, 40413, 325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(109, 100, 10, 400, 1500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(110, 100, 10, 399, 1500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(111, 100, 20, 410, 1650, '2015-07-26 04:09:08', '0000-00-00 00:00:00', 0),
(112, 100, 30, 419, 1800, '2015-07-26 04:09:39', '0000-00-00 00:00:00', 0),
(113, 100, 10, 401, 1500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(114, 100, 20, 411, 1650, '2015-07-26 04:10:06', '0000-00-00 00:00:00', 0),
(115, 100, 30, 420, 1800, '2015-07-26 04:10:55', '0000-00-00 00:00:00', 0),
(116, 100, 10, 402, 1500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(117, 100, 20, 412, 1650, '2015-07-26 04:11:20', '0000-00-00 00:00:00', 0),
(118, 100, 30, 421, 1800, '2015-07-26 04:12:14', '0000-00-00 00:00:00', 0),
(119, 100, 10, 403, 2500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(120, 100, 20, 409, 1650, '2015-07-26 04:20:00', '0000-00-00 00:00:00', 0),
(121, 100, 20, 413, 2650, '2015-07-26 04:15:57', '0000-00-00 00:00:00', 0),
(122, 100, 30, 422, 2800, '2015-07-26 04:15:57', '0000-00-00 00:00:00', 0),
(123, 100, 10, 404, 2500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(124, 100, 20, 414, 2650, '2015-07-26 04:15:57', '0000-00-00 00:00:00', 0),
(125, 100, 30, 423, 2800, '2015-07-26 04:15:57', '0000-00-00 00:00:00', 0),
(126, 100, 10, 405, 2500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(127, 100, 20, 415, 2650, '2015-07-26 04:15:57', '0000-00-00 00:00:00', 0),
(128, 100, 30, 424, 2800, '2015-07-26 04:22:49', '0000-00-00 00:00:00', 0),
(129, 100, 10, 406, 500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(130, 100, 30, 399, 1800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(131, 100, 30, 425, 800, '2015-07-26 04:24:15', '0000-00-00 00:00:00', 0),
(132, 100, 10, 407, 800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(133, 100, 20, 417, 950, '2015-07-26 04:26:02', '0000-00-00 00:00:00', 0),
(134, 100, 30, 426, 1200, '2015-07-26 04:26:42', '0000-00-00 00:00:00', 0),
(135, 100, 10, 408, 750, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(136, 100, 20, 418, 950, '2015-07-26 04:27:07', '0000-00-00 00:00:00', 0),
(137, 100, 30, 427, 1100, '2015-07-26 04:28:11', '0000-00-00 00:00:00', 0),
(138, 101, 10, 40411, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(139, 101, 20, 40412, 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(141, 101, 10, 40414, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(142, 101, 20, 40415, 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(143, 101, 30, 40416, 325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(144, 101, 10, 40417, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(145, 101, 20, 40418, 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(146, 101, 30, 40419, 325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(147, 101, 10, 404110, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(148, 101, 20, 404111, 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(149, 101, 30, 404112, 325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(150, 101, 10, 40421, 800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(151, 101, 20, 40422, 900, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(152, 101, 30, 40423, 1200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(153, 101, 10, 40424, 1850, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(154, 101, 20, 40425, 1975, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(155, 101, 30, 40426, 2250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(156, 101, 10, 40427, 1900, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(157, 101, 20, 40428, 2050, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(158, 101, 30, 40429, 2500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(159, 101, 10, 40431, 1000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(160, 101, 20, 40432, 1800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(161, 101, 30, 40433, 2800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(162, 101, 10, 40434, 2200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(163, 101, 20, 40435, 2500, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(164, 101, 30, 40436, 2800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(165, 101, 10, 40437, 2000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(166, 101, 20, 40438, 2250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(167, 101, 30, 40439, 2539, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(168, 101, 10, 40441, 450, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(169, 101, 20, 40442, 600, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(170, 101, 30, 40443, 750, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `role_id` int(5) NOT NULL,
  `product_sub_catg_id` varchar(100) NOT NULL,
  `price_id` int(11) NOT NULL,
  `product_catg_id` varchar(100) DEFAULT NULL,
  `product_img_id1` blob,
  `product_img_id2` blob,
  `product_price` float DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `product_ideal_for` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_desc` varchar(200) DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `product`:
--   `product_id`
--       `product_details` -> `product_id`
--

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `uid_seller`, `shop_name`, `category_id`, `role_id`, `product_sub_catg_id`, `price_id`, `product_catg_id`, `product_img_id1`, `product_img_id2`, `product_price`, `product_qty`, `product_ideal_for`, `product_name`, `product_desc`, `product_size`) VALUES
(398, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 130, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1800, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(399, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 110, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1500, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy'),
(400, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 109, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1500, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy'),
(401, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 113, 'D0032', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', 1500, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy'),
(402, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 116, 'D0033', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033335f7a70736a6c70776a6975792e6a7067, '', 1500, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy'),
(403, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 119, 'A0118', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', 2500, 1, 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla, made with perfection using good quality material.', '1 Stuffed Toy'),
(404, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 123, 'A0119', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', 2500, 1, 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow, made with perfection using good quality material.', '1 Stuffed Toy'),
(406, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 129, 'A0200', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', 500, 1, 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer, made with perfection using fine quality material.', '1 Stuffed Toy'),
(407, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 132, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', 800, 1, 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1\r\nStuffed Toy'),
(408, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 135, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', 750, 1, 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(409, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 120, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1650, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy'),
(410, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 111, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1650, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(411, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 114, 'D0032', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', 1650, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(413, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 121, 'A0118', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', 2650, 1, 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla made with perfection using good quality material.', '1 Stuffed Toy'),
(414, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 124, 'A0119', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', 2650, 1, 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow made with perfection using good quality material.', '1 Stuffed Toy'),
(415, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 127, 'A0200', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', 2650, 1, 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer made with perfection using fine quality material.', '1 Stuffed Toy'),
(416, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 103, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', 650, 1, 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1\r\nStuffed Toy'),
(417, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 133, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', 950, 1, 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(418, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 136, 'A0201/3', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', 950, 1, 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(419, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 112, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', 1800, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(420, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 115, 'D0032', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', 1800, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(421, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 118, 'D0033', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033335f7a70736a6c70776a6975792e6a7067, '', 1800, 1, 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll made with perfection using fine quality material.', '1 Stuffed Toy'),
(422, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 122, 'A0118', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', 2800, 1, 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla made with perfection using good quality material.', '1 Stuffed Toy'),
(423, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 125, 'A0119', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', 2800, 1, 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow, made with perfection using good quality material.', '1 Stuffed Toy'),
(424, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 128, 'A0200', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', 800, 1, 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer made with perfection using fine quality material.', '1 Stuffed Toy'),
(425, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 131, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', 1200, 1, 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(426, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 134, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', 1200, 1, 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(427, 100, 'Mahalakshmi Traders', 1000, 1, '4001', 137, 'A0201/3', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', 1100, 1, 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere made with perfection using fine quality material.', '1 \r\nStuffed Toy'),
(504, 101, 'YHAZ shops', 10, 1, '4041', 210, '1001', '', '', 200, 1, 'infants', 'baby rattle blue', 'funskool toys', '51*152mm'),
(604, 101, 'YH shops', 1001, 1, '6041', 310, '60411', '', '', 200, 1, 'infants', 'baby rattle green', 'funskool toys', '51*152mm');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `seller_skuid` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `product_catg_id` varchar(100) NOT NULL,
  `product_sub_catg_id` varchar(100) DEFAULT NULL,
  `product_catg_name` varchar(100) DEFAULT NULL,
  `product_sub_catg_name` varchar(100) DEFAULT NULL,
  `txn_create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_username` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `product_category`:
--   `uid_seller`
--       `user_detail` -> `uid`
--

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`seller_skuid`, `shop_name`, `uid_seller`, `product_catg_id`, `product_sub_catg_id`, `product_catg_name`, `product_sub_catg_name`, `txn_create_ts`, `txn_update_ts`, `txn_username`) VALUES
(1, 'Mahalakshmi traders', 100, 'D0030', '4001', 'Toys', 'Stuffed toys', '2015-07-26 13:20:03', '2015-07-24 20:39:00', 0),
(2, 'Mahalakshmi traders', 100, 'D0030', '4002', 'Toys', 'Stuffed toys', '2015-07-26 13:20:57', '2015-07-24 20:39:00', 0),
(3, 'Mahalakshmi traders', 100, 'D0030', '4003', 'Toys', 'Stuffed toys', '2015-07-26 13:20:57', '2015-07-24 20:39:00', 0),
(4, 'Mahalakshmi traders', 100, 'D0030', '4004', 'Toys', 'Stuffed toys', '2015-07-26 13:20:57', '2015-07-24 20:39:00', 0),
(5, 'Mahalakshmi traders', 100, 'D0031', '4005', 'Toys', 'Soft toys', '2015-07-26 13:37:47', '2015-07-24 20:39:00', 0),
(6, 'Mahalakshmi traders', 100, 'D0031', '4006', 'Toys', 'Soft toys', '2015-07-26 13:37:47', '2015-07-24 20:39:00', 0),
(7, 'Mahalakshmi traders', 100, 'D0031', '4007', 'Toys', 'Soft toys', '2015-07-26 13:37:47', '2015-07-24 20:39:00', 0),
(8, 'Mahalakshmi traders', 100, 'A0201/1', '4008', 'Toys', 'softToys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(9, 'Mahalakshmi traders', 100, 'A0201/2', '4009', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(10, 'Mahalakshmi traders', 100, 'A0201/3', '4010', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(11, 'Mahalakshmi traders', 100, 'T0256/1', '40011', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(12, 'Mahalakshmi traders', 100, 'T0256/2', '40012', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(13, 'Mahalakshmi traders', 100, 'T0257/1', '40013', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(14, 'Mahalakshmi traders', 100, 'T0257/2', '40014', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(15, 'Mahalakshmi traders', 100, 'T0258/1', '40015', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(16, 'Mahalakshmi traders', 100, 'T0258/2', '40016', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(17, 'Mahalakshmi traders', 100, 'T0259/1', '40017', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(18, 'Mahalakshmi traders', 100, 'T0259/2', '40018', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(19, 'Mahalakshmi traders', 100, 'T0260/1', '40019', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(20, 'Mahalakshmi traders', 100, 'T0260/2', '40020', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(21, 'Mahalakshmi traders', 100, 'T0261/3', '40021', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(22, 'Mahalakshmi traders', 100, 'T0262/3', '40022', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(23, 'Mahalakshmi traders', 100, 'T0263/3', '40023', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(24, 'Mahalakshmi traders', 100, 'T0264/2', '40024', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(25, 'Mahalakshmi traders', 100, 'T0264/3', '40025', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(26, 'Mahalakshmi traders', 100, 'T0265/2', '40026', 'Toys', 'Teddy bears', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(1000, 'Mahalakshmi traders', 100, '400', '4001', 'Toys', 'Toys', '2015-07-24 20:39:00', '2015-07-24 20:39:00', 0),
(1001, 'YH shops', 101, '401', '4011', 'electronics', 'computers', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1002, 'YH shops', 101, '402', '4021', 'electronics', 'home and kitchen', '0000-00-00 00:00:00', '2015-06-20 06:31:03', 0),
(1003, 'YH shops', 101, '403', '4031', 'electronics', 'mobile phones', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1004, 'YH shops', 101, '404', '4041', 'toys', 'baby rattle', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1005, 'YH shops', 101, '404', '4042', 'toys', 'art craft figure', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1006, 'YH shops', 101, '404', '4043', 'toys', 'musical toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1007, 'YH shops', 101, '404', '4044', 'toys', 'learning toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1008, 'YH shops', 101, '404', '4045', 'toys', 'puzzles', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1009, 'YH shops', 101, '404', '4046', 'toys', 'remote control toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1010, 'YH shops', 101, '404', '4047', 'toys', 'stuffed toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1011, 'YH shops', 101, '404', '4048', 'toys', 'pogo toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1012, 'testa', 102, '411', '4111', 'toys', 'stacking stuffed toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1013, 'testa', 102, '411', '4112', 'toys', 'action figure', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1014, 'testa', 102, '411', '4113', 'toys', 'role play toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1015, 'testa', 102, '411', '4114', 'toys', 'toy sports', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1016, 'testa', 102, '411', '4115', 'toys', 'electric ride ons', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1017, 'testa', 102, '411', '4116', 'toys', 'dolls n doll houses', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1018, 'testa', 102, '411', '4117', 'toys', 'baby rattle', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1019, 'testa', 102, '411', '4042', 'toys', 'art craft figure', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1020, 'testa', 102, '411', '4043', 'toys', 'musical toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1021, 'testa', 102, '411', '4044', 'toys', 'learning toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1022, 'testa', 102, '411', '4045', 'toys', 'puzzles', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1023, 'testa', 102, '411', '4046', 'toys', 'remote control_toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1024, 'testa', 102, '411', '4047', 'toys', 'stuffed toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1025, 'testa', 102, '411', '4048', 'toys', 'pogo toys', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1026, 'testa', 102, '411', '4049', 'toys', 'magic kit', '2015-06-20 06:31:03', '2015-06-20 06:31:03', 0),
(1027, 'SK Shops', 103, '405', '4051', 'spinpresslaunch toys', 'wind spinner toy', '2015-06-24 06:31:03', '2015-06-24 06:31:03', 0),
(1028, 'SK Shops', 103, '405', '4052', 'spinpresslaunch toys', 'toy weapon', '2015-06-24 06:40:03', '2015-06-24 06:40:03', 0),
(1029, 'SK Shops', 103, '405', '4053', 'spinpresslaunch toys', 'toy puppet', '2015-06-24 06:51:03', '2015-06-24 06:51:03', 0),
(1030, 'SK Shops', 103, '405', '4054', 'spinpresslaunch toys', 'toy tricycle', '2015-06-24 06:51:05', '2015-06-24 06:51:05', 0),
(1031, 'SK Shops', 103, '406', '4061', 'puzzles', 'jungle and animal figures', '2015-06-24 06:51:05', '2015-06-24 06:51:05', 0),
(1032, 'SK Shops', 103, '406', '4062', 'puzzles', 'cartoon figures', '2015-06-24 06:51:55', '2015-06-24 06:51:55', 0),
(1033, 'SK Shops', 103, '406', '4063', 'puzzles', 'farm animals', '2015-06-24 06:51:55', '2015-06-24 06:51:55', 0),
(1034, 'SK Shops', 103, '406', '4064', 'puzzles', 'educational', '2015-06-24 06:51:55', '2015-06-24 06:51:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` int(21) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `shop_id` varchar(100) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `role_id` int(5) NOT NULL DEFAULT '1',
  `category_id` int(11) DEFAULT NULL,
  `product_sub_catg_id` varchar(100) NOT NULL,
  `price_id` int(11) NOT NULL,
  `product_min_qty` int(11) DEFAULT NULL,
  `product_catg_id` varchar(100) DEFAULT NULL,
  `product_img_id1` blob,
  `product_img_id2` blob,
  `product_img_id3` blob,
  `product_min_age_usage` varchar(100) DEFAULT NULL,
  `product_max_age_usage` varchar(100) DEFAULT NULL,
  `product_ideal_for` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_desc` varchar(200) DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL,
  `product_exp_date` date DEFAULT NULL,
  `product_mfc_name` varchar(100) DEFAULT NULL,
  `product_mfc_country` varchar(100) DEFAULT NULL,
  `product_user_age_grp` varchar(100) DEFAULT NULL,
  `product_dom_warranty` varchar(200) DEFAULT NULL,
  `product_intl_warranty` varchar(100) DEFAULT NULL,
  `product_warranty_summary` varchar(200) DEFAULT NULL,
  `product_color` varchar(100) DEFAULT NULL,
  `product_style` varchar(100) DEFAULT NULL,
  `product_form_factor` varchar(100) DEFAULT NULL,
  `product_display_status` varchar(100) DEFAULT NULL,
  `product_enroll_date` date DEFAULT NULL,
  `product_assembly_reqd` varchar(100) DEFAULT NULL,
  `product_width` int(11) DEFAULT NULL,
  `product_height` int(11) DEFAULT NULL,
  `product_depth` int(11) DEFAULT NULL,
  `product_weight` int(11) DEFAULT NULL,
  `product_othr_feature` varchar(200) DEFAULT NULL,
  `product_video_url` varchar(100) DEFAULT NULL,
  `product_key_feature` varchar(200) DEFAULT NULL,
  `product_pack_size` varchar(100) DEFAULT NULL,
  `product_battery_type` varchar(100) DEFAULT NULL,
  `product_no_of_battery` varchar(100) DEFAULT NULL,
  `product_hazard_status` varchar(100) DEFAULT NULL,
  `product_hazard_detail` varchar(200) DEFAULT NULL,
  `txn_create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_username` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `product_details`:
--   `uid_seller`
--       `user_detail` -> `uid`
--   `price_id`
--       `price_details` -> `price_id`
--   `category_id`
--       `product_category` -> `seller_skuid`
--

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `uid_seller`, `shop_id`, `shop_name`, `role_id`, `category_id`, `product_sub_catg_id`, `price_id`, `product_min_qty`, `product_catg_id`, `product_img_id1`, `product_img_id2`, `product_img_id3`, `product_min_age_usage`, `product_max_age_usage`, `product_ideal_for`, `product_name`, `product_desc`, `product_size`, `product_exp_date`, `product_mfc_name`, `product_mfc_country`, `product_user_age_grp`, `product_dom_warranty`, `product_intl_warranty`, `product_warranty_summary`, `product_color`, `product_style`, `product_form_factor`, `product_display_status`, `product_enroll_date`, `product_assembly_reqd`, `product_width`, `product_height`, `product_depth`, `product_weight`, `product_othr_feature`, `product_video_url`, `product_key_feature`, `product_pack_size`, `product_battery_type`, `product_no_of_battery`, `product_hazard_status`, `product_hazard_detail`, `txn_create_ts`, `txn_update_ts`, `txn_username`) VALUES
(398, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 130, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:53:01', '0000-00-00 00:00:00', 0),
(399, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 109, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(400, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 109, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 13:05:02', '0000-00-00 00:00:00', 0),
(401, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 113, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Purple', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 13:07:55', '0000-00-00 00:00:00', 0),
(402, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 116, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033335f7a70736a6c70776a6975792e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 13:07:55', '0000-00-00 00:00:00', 0),
(403, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 119, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', '', '', '', 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'black', '', '', '', '0000-00-00', '', 15, 14, 12, 800, '', '', '', '', '', '', '', '', '2015-07-26 13:07:55', '0000-00-00 00:00:00', 0),
(404, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 123, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', '', '', '', 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 7, 15, 17, 600, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(405, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 126, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230305f7a707363746b77647075372e6a7067, '', '', '', '', 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 5, 8, 12, 400, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(406, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 129, 0, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 8, 14, 4, 250, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(407, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 132, 0, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 22, 7, 600, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(408, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 135, 0, 'A0201/3', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit L', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 18, 34, 10, 950, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(409, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 120, 0, 'D0030', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(410, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 111, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(411, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 114, 0, 'D0032', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Purple', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(412, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 117, 0, 'D0033', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033335f7a70736a6c70776a6975792e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(413, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 121, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', '', '', '', 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 7, 15, 17, 600, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(414, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 124, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230305f7a707363746b77647075372e6a7067, '', '', '', '', 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 5, 8, 12, 400, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(415, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 127, 0, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 8, 14, 4, 250, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(416, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 103, 0, 'A0118', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', '', '', '', 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'black', '', '', '', '0000-00-00', '', 15, 14, 12, 800, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(417, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 133, 0, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 22, 7, 600, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(418, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 136, 0, 'A0201/3', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit L', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 18, 34, 10, 950, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(419, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 112, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033315f7a7073697363726e7a706d2e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Blue', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(420, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 115, 0, 'D0032', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033325f7a707365643576663667782e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Purple', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(421, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 118, 0, 'D0033', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f44303033335f7a70736a6c70776a6975792e6a7067, '', '', '', '', 'Boys::Girls', 'Sofy Candy  Doll OC', 'Cute and soft  candu doll, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 25, 6, 450, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(422, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 122, 0, 'A0118', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303131385f7a707364716663327764762e6a7067, '', '', '', '', 'Boys::Girls', 'Fat Gorilla', 'Cute and soft sitting Gorilla, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'black', '', '', '', '0000-00-00', '', 15, 14, 12, 800, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(423, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 125, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f4130313139615f7a7073786a326a746369662e6a7067, '', '', '', '', 'Boys::Girls', 'Soft Cow', 'Cute and Soft cow, made with perfection using good quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 7, 15, 17, 600, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(424, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 128, 0, 'D0031', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230305f7a707363746b77647075372e6a7067, '', '', '', '', 'Boys::Girls', 'Golden Deer', 'Cute and soft Deer, made with perfection using fine quality material.', '1 Stuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Multicolor', '', '', '', '0000-00-00', '', 5, 8, 12, 400, '', '', '', '', '', '', '', '', '2015-07-26 13:31:22', '0000-00-00 00:00:00', 0),
(425, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 131, 0, 'A0201/1', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f7a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit S', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 8, 14, 4, 250, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(426, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 134, 0, 'A0201/2', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f327a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit M', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 12, 22, 7, 600, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(427, 100, '', 'Mahalakshmi Traders', 1, 1, '4001', 137, 0, 'A0201/3', 0x687474703a2f2f6934382e70686f746f6275636b65742e636f6d2f616c62756d732f663234322f6d6168616c616b736d69667572746f79732f41303230315f337a707376667168686676642e6a7067, '', '', '', '', 'Boys::Girls', 'Fancy Soft Rabbit L', 'Good looking soft standing rabbit which can be hanged anywhere, made with perfection using fine quality material.', '1 \r\nStuffed Toy', '0000-00-00', 'MFT', 'India', '', '', '', '', 'Pink', '', '', '', '0000-00-00', '', 18, 34, 10, 950, '', '', '', '', '', '', '', '', '2015-07-26 12:58:17', '0000-00-00 00:00:00', 0),
(504, 101, '', 'YHAZ shops', 1, 1001, '4041', 139, 1, '40412', '', '', '', '1', '7', 'infants', 'baby rattle green', 'green rattle', '55*162mm', '2017-06-24', 'funskool toys', 'china', '0-3months', 'Yes', 'Yes', 'Its under warranty', 'blue', 'cold', 'xxxx', 'displayed', '2015-06-24', 'yes', 20, 20, 20, 30, 'its cold', 'videos.com', 'CNBC', '3', 'AA', '2', 'None', 'None', '2015-06-24 06:51:53', '2015-06-24 06:51:53', 0),
(604, 102, '', 'YH shops', 1, 1001, '6041', 138, 1, '60411', '', '', '', '1', '6', 'infants', 'baby rattle blue', 'rattle', '51*152mm', '2016-06-24', 'funskool toys', 'china', '0-3months', 'Yes', 'Yes', 'It is under warranty', 'blue', 'cool', 'xxx', 'displayed', '2015-06-24', 'yes', 10, 10, 10, 5, 'its cool', 'www.video.com', 'abc', '3', 'AA', '2', 'None', 'NONE', '2015-06-24 06:51:55', '2015-06-24 06:51:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `regd_status`
--

CREATE TABLE IF NOT EXISTS `regd_status` (
  `regd_id` int(5) NOT NULL,
  `regd_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `regd_status`:
--

--
-- Dumping data for table `regd_status`
--

INSERT INTO `regd_status` (`regd_id`, `regd_name`) VALUES
(501, 'new'),
(502, 'pending'),
(503, 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_detail`
--

CREATE TABLE IF NOT EXISTS `shipping_detail` (
  `shipping_id` int(11) NOT NULL,
  `ship_mode` varchar(100) DEFAULT NULL,
  `invoice_id` int(21) NOT NULL,
  `order_track_id` int(21) NOT NULL,
  `shipping_address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `shipping_detail`:
--   `invoice_id`
--       `invoice_details` -> `invoice_id`
--   `order_track_id`
--       `order_detail` -> `order_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `taxation`
--

CREATE TABLE IF NOT EXISTS `taxation` (
  `id` int(11) NOT NULL,
  `salestax` float DEFAULT NULL,
  `servicetax` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `excise_duty` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `taxation`:
--

-- --------------------------------------------------------

--
-- Table structure for table `trans_connect`
--

CREATE TABLE IF NOT EXISTS `trans_connect` (
  `trans_con_id` int(11) NOT NULL,
  `uid_seller` int(11) NOT NULL,
  `user_category_id` int(11) NOT NULL,
  `uid_buyer` int(11) NOT NULL,
  `val_key` varchar(30) NOT NULL,
  `trans_con_pin` int(11) NOT NULL,
  `role_id` int(5) NOT NULL,
  `user_updated_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_updated_by` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `trans_connect`:
--   `uid_buyer`
--       `user_detail` -> `uid`
--   `role_id`
--       `user_roles` -> `role_id`
--   `user_category_id`
--       `user_category` -> `user_category_id`
--

--
-- Dumping data for table `trans_connect`
--

INSERT INTO `trans_connect` (`trans_con_id`, `uid_seller`, `user_category_id`, `uid_buyer`, `val_key`, `trans_con_pin`, `role_id`, `user_updated_ts`, `user_updated_by`) VALUES
(1, 101, 10, 201, 'yes', 9876, 2, '2015-06-08 19:40:25', 0),
(2, 101, 20, 202, 'yes', 7654, 2, '2015-06-08 19:40:45', 0),
(3, 101, 30, 203, 'yes', 9843, 2, '2015-06-08 19:40:49', 0),
(4, 101, 40, 204, 'yes', 8796, 2, '2015-06-08 19:40:51', 0),
(5, 102, 10, 205, 'yes', 9, 2, '2015-06-08 19:40:51', 0),
(6, 102, 20, 206, 'yes', 987, 2, '2015-06-08 19:40:59', 0),
(7, 102, 30, 207, 'yes', 98, 2, '2015-06-08 19:41:25', 0),
(8, 102, 40, 208, 'yes', 1178, 2, '2015-06-08 19:41:32', 0),
(9, 103, 10, 209, 'yes', 1054, 2, '2015-06-08 19:41:38', 0),
(10, 103, 20, 210, 'yes', 1423, 2, '2015-06-08 19:41:45', 0),
(11, 103, 30, 211, 'yes', 7654, 2, '2015-06-08 19:41:49', 0),
(12, 103, 40, 212, 'yes', 1908, 2, '2015-06-08 19:42:25', 0),
(13, 104, 10, 213, 'yes', 2234, 3, '2015-06-08 19:44:25', 0),
(14, 104, 20, 214, 'yes', 2256, 3, '2015-06-08 19:45:25', 0),
(15, 102, 10, 203, 'yes', 8876, 2, '2015-06-14 19:45:30', 0),
(16, 102, 20, 208, 'yes', 3241, 2, '2015-06-14 19:45:30', 0),
(17, 213, 10, 204, 'yes', 1289, 2, '2015-06-17 21:45:30', 0),
(18, 213, 20, 207, 'yes', 3213, 2, '2015-06-18 21:45:30', 0),
(19, 214, 10, 212, 'yes', 1121, 2, '2015-06-18 21:45:35', 0),
(99, 100, 10, 201, 'yes', 1010, 1, '2015-07-24 20:39:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `txn_user`
--

CREATE TABLE IF NOT EXISTS `txn_user` (
  `txn_user_id` int(11) NOT NULL,
  `txn_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txn_created_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_updated_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_updated_by` int(11) NOT NULL,
  `val_key` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `txn_regd_status_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `txn_user`:
--   `uid`
--       `user_detail` -> `uid`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE IF NOT EXISTS `user_category` (
  `user_category_id` int(11) NOT NULL,
  `user_category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_category`:
--

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`user_category_id`, `user_category`) VALUES
(10, 'platinum'),
(20, 'gold'),
(30, 'silver'),
(40, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE IF NOT EXISTS `user_detail` (
  `uid` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `alternate_phone_num` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `email_id` varchar(100) NOT NULL,
  `manufacture_name` varchar(100) DEFAULT NULL,
  `shop_name` varchar(100) NOT NULL,
  `shipping_address` varchar(200) NOT NULL,
  `permanent_address` varchar(200) DEFAULT NULL,
  `user_type_id` int(5) NOT NULL,
  `tin_num` varchar(40) DEFAULT NULL,
  `st_num` varchar(40) DEFAULT NULL,
  `cst_num` varchar(40) DEFAULT NULL,
  `regd_status_id` int(5) NOT NULL,
  `user_img` blob,
  `shop_img` blob,
  `pan_num` varchar(100) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_detail`:
--   `regd_status_id`
--       `regd_status` -> `regd_id`
--   `user_type_id`
--       `user_roles` -> `role_id`
--

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`uid`, `first_name`, `last_name`, `phone_num`, `alternate_phone_num`, `date_of_birth`, `gender`, `email_id`, `manufacture_name`, `shop_name`, `shipping_address`, `permanent_address`, `user_type_id`, `tin_num`, `st_num`, `cst_num`, `regd_status_id`, `user_img`, `shop_img`, `pan_num`, `create_ts`) VALUES
(100, 'Babu', 'Babu', '9342121234', '9342121234', '1978-05-05', 'M', 'babu@gmail.com', 'Mahalakshmi traders', 'Mahalakshmi traders', '1 chickpet bangalore', NULL, 1, '554564', 'bb112', NULL, 502, NULL, NULL, 'ADOQN142B', '2015-07-24 20:39:00'),
(101, 'bhatt', 'subramanya', '8886550641', '8886550641', '1978-06-04', 'M', 'sb@gmail.com', 'Subbu and daughters', 'SB shops', '321 kalyan nagar bangalore', NULL, 1, '5554565', 'sb123', NULL, 503, NULL, NULL, 'ACOPN455N', '2015-07-06 06:31:03'),
(102, 'Yogesh', 'Nanda', '89889898989', '', '2015-06-01', 'M', 'asda@jj.com', 'Saddle brothers', 'Nail Shop', '111 HRBR Layout', NULL, 1, NULL, NULL, NULL, 503, NULL, NULL, '', '2015-06-20 06:30:58'),
(103, 'kumar', 'sainath', '8877721421', '8097121421', '1995-06-09', 'M', 'saik@gmail.com', 'sainath collections', 'SK shops', '308 kalyan nagar bangalore', NULL, 1, '5554567', 'AC123', NULL, 503, NULL, NULL, 'ASRPD192D', '2015-06-09 06:31:01'),
(104, 'sri', 'guru', '8097121451', '8096567809', '1978-12-11', 'M', 'sg@gmail.com', 'Sri guru pvt ltd', 'sg pvt ltd', '1278 HBR layout bangalore', NULL, 1, '6754345', 'AS876', NULL, 503, NULL, NULL, 'QAWTR7890T', '2015-06-09 05:31:09'),
(201, 'N', 'ganesh', '8907114521', '8764121014', '1992-05-02', 'M', 'ng@gmail.com', 'Ganesh and sons', ' GS shops', '10 palace road bangalore', NULL, 2, '998546', 'qe191', NULL, 503, NULL, NULL, 'QBWUY1987A', '2015-06-08 19:40:25'),
(202, 'N', 'eshwari', '8897014521', '8964101014', '1990-05-02', 'F', 'ne@gmail.com', 'Eshwari manufacturing', ' Eshwari electronics ', '19 MM road chennai', NULL, 2, '932546', 'we191', NULL, 503, NULL, NULL, 'QBJUY1900t', '2015-06-08 19:40:45'),
(203, 'kumari', 'Anitha', '8977114521', '8864121014', '1991-08-02', 'F', 'akumari@gmail.com', 'vaaso furnishings', ' vaaso', '12 GVK ROAD bangalore', NULL, 2, '998596', 'VV191', NULL, 503, NULL, NULL, 'ARWUY1137A', '2015-06-08 19:40:49'),
(204, 'chandra', 'vivek', '8107414111', '8064198714', '1986-05-02', 'M', 'vchandra@gmail.com', 'Viveks', ' viveks', '112 kalyan nagar bangalore', NULL, 2, '998546', 'qe191', NULL, 503, NULL, NULL, 'QBWUY1987A', '2015-06-08 19:40:51'),
(205, 'pai', 'ganesh', '890714521', '8764121014', '1992-05-02', 'M', 'gpai@gmail.com', 'Pai stores', ' pai group', '987 KG ROAD bangalore', NULL, 2, '872115', 'wz191', NULL, 503, NULL, NULL, 'WSWUY1917A', '2015-06-08 19:40:52'),
(206, 'rao', 'pn', '7891114521', '8911231909', '1989-09-01', 'M', 'nrao@gmail.com', 'pnrao collections', ' pnrao collections', '63 M.G.Road bangalore', NULL, 2, '998546', 'ZAe191', NULL, 503, NULL, NULL, 'DEQW1987E', '2015-06-08 19:40:59'),
(207, 'kumar', 'aditya', '76537114587', '9964121044', '1992-05-02', 'M', 'kaditya@gmail.com', 'Aditya and brothers', ' AB shops', '86 wheelers road bangalore', NULL, 2, '108596', 'NB191', NULL, 503, NULL, NULL, 'SEWQ1965A', '2015-06-08 19:41:25'),
(208, 'narayan', 'arjun', '9907145599', '8877141014', '1991-05-05', 'M', 'anarayan@gmail.com', 'Narayan manufacturers', 'Narayan group', '15 temple street bangalore', NULL, 2, '998546', 'AZ121', NULL, 503, NULL, NULL, 'QLTUY1945A', '2015-06-08 19:41:30'),
(209, 'Khurana', 'suresh', '8907114521', '8764121014', '1992-05-02', 'M', 'ng@gmail.com', 'Ganesh and sons', ' GS shops', '10 palace road bangalore', NULL, 2, '912134', 'ce191', NULL, 503, NULL, NULL, 'QBWUY1987A', '2015-06-08 19:41:32'),
(210, 'nambiar', 'vikas', '9881142879', '8764121015', '1992-07-01', 'M', 'nv@gmail.com', 'vikas and sons', ' vs centre', '87 jaya nagar bangalore', NULL, 2, '568546', 've191', NULL, 503, NULL, NULL, 'ADUY1905A', '2015-06-08 19:41:45'),
(211, 'jain', 'rakesh', '9876711451', '8764112365', '1993-01-31', 'M', 'rjain@gmail.com', 'jain marketing co', 'jain group ', '56 NR mARKET bangalore', NULL, 2, '943456', 'RG191', NULL, 503, NULL, NULL, 'BWUAY1999A', '2015-06-08 19:41:49'),
(212, 'NATHAN', 'LATHA', '9886907114', '9764121919', '1992-06-09', 'M', 'NATHANL@gmail.com', 'NATHAN manufacturing co', ' nathan and sons', '23 NR market \r\n\r\nbangalore', NULL, 2, '9765432', 'AA100', NULL, 503, NULL, NULL, 'AZSDR1221A', '2015-06-08 19:42:25'),
(213, 'xavier', 'charles', '887774521', '8764210145', '1989-05-20', 'M', 'cxavier@gmail.com', 'xavier enterprises', 'xavier enterprises', '112 Richards town bangalore', NULL, 3, '998546', 'qw911', NULL, 503, NULL, NULL, 'AQWTY1786A', '2015-06-08 19:44:25'),
(214, 'goel', 'satish', '8907114521', '8922212121', '1982-06-10', 'M', 'sgoel@gmail.com', 'Goel traders', ' goel traders', '10 gjhghgjhgMG road \r\n\r\nbangalore', NULL, 3, '998546', 'qe191', NULL, 503, NULL, NULL, 'QZQA1234T', '2015-06-08 19:45:25'),
(215, 'anand', 'Ranjith', '9987114521', '9916121878', '1987-07-15', 'M', 'ranand@gmail.com', 'anand and sons', 'My stores', '15 Kalyan nagar bangalore', NULL, 2, '952921', 'za009', NULL, 503, NULL, NULL, 'AASD7123Q', '2015-06-08 19:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE IF NOT EXISTS `user_messages` (
  `msg_id` int(11) NOT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_messages`:
--

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` int(5) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_roles`:
--

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`) VALUES
(1, 'seller'),
(2, 'buyer'),
(3, 'both'),
(4, 'normal'),
(5, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`invoice_id`), ADD KEY `user_category_id` (`user_category_id`), ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `login_validations`
--
ALTER TABLE `login_validations`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uid` (`uid`), ADD KEY `role_id` (`role_id`), ADD KEY `regd_status_id` (`regd_status_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`), ADD KEY `uid_buyer` (`uid_buyer`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`), ADD KEY `price_id` (`price_id`), ADD KEY `uid_seller` (`uid_seller`), ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_detail_temp`
--
ALTER TABLE `order_detail_temp`
  ADD PRIMARY KEY (`order_id`), ADD KEY `uid_buyer` (`uid_buyer`), ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `price_details`
--
ALTER TABLE `price_details`
  ADD PRIMARY KEY (`price_id`), ADD KEY `uid_seller` (`uid_seller`), ADD KEY `user_category_id` (`user_category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`seller_skuid`), ADD KEY `uid_seller` (`uid_seller`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`), ADD KEY `uid_seller` (`uid_seller`), ADD KEY `price_id` (`price_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `regd_status`
--
ALTER TABLE `regd_status`
  ADD PRIMARY KEY (`regd_id`);

--
-- Indexes for table `shipping_detail`
--
ALTER TABLE `shipping_detail`
  ADD PRIMARY KEY (`shipping_id`), ADD KEY `invoice_id` (`invoice_id`), ADD KEY `order_track_id` (`order_track_id`);

--
-- Indexes for table `taxation`
--
ALTER TABLE `taxation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_connect`
--
ALTER TABLE `trans_connect`
  ADD PRIMARY KEY (`trans_con_id`), ADD KEY `uid_buyer` (`uid_buyer`), ADD KEY `role_id` (`role_id`), ADD KEY `user_category_id` (`user_category_id`);

--
-- Indexes for table `txn_user`
--
ALTER TABLE `txn_user`
  ADD PRIMARY KEY (`txn_user_id`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `user_category`
--
ALTER TABLE `user_category`
  ADD PRIMARY KEY (`user_category_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`uid`), ADD KEY `regd_status_id` (`regd_status_id`), ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_validations`
--
ALTER TABLE `login_validations`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `order_detail_temp`
--
ALTER TABLE `order_detail_temp`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trans_connect`
--
ALTER TABLE `trans_connect`
  MODIFY `trans_con_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`user_category_id`) REFERENCES `user_category` (`user_category_id`),
ADD CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`order_id`);

--
-- Constraints for table `login_validations`
--
ALTER TABLE `login_validations`
ADD CONSTRAINT `login_validations_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `login_validations_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`),
ADD CONSTRAINT `login_validations_ibfk_3` FOREIGN KEY (`regd_status_id`) REFERENCES `regd_status` (`regd_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid_buyer`) REFERENCES `user_detail` (`uid`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`),
ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price_details` (`price_id`),
ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`uid_seller`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `order_detail_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `order_detail_temp`
--
ALTER TABLE `order_detail_temp`
ADD CONSTRAINT `order_detail_temp_ibfk_1` FOREIGN KEY (`uid_buyer`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `order_detail_temp_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`);

--
-- Constraints for table `price_details`
--
ALTER TABLE `price_details`
ADD CONSTRAINT `price_details_ibfk_1` FOREIGN KEY (`uid_seller`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `price_details_ibfk_2` FOREIGN KEY (`user_category_id`) REFERENCES `user_category` (`user_category_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`uid_seller`) REFERENCES `user_detail` (`uid`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`uid_seller`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price_details` (`price_id`),
ADD CONSTRAINT `product_details_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`seller_skuid`);

--
-- Constraints for table `shipping_detail`
--
ALTER TABLE `shipping_detail`
ADD CONSTRAINT `shipping_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`),
ADD CONSTRAINT `shipping_detail_ibfk_2` FOREIGN KEY (`order_track_id`) REFERENCES `order_detail` (`order_id`);

--
-- Constraints for table `trans_connect`
--
ALTER TABLE `trans_connect`
ADD CONSTRAINT `trans_connect_ibfk_1` FOREIGN KEY (`uid_buyer`) REFERENCES `user_detail` (`uid`),
ADD CONSTRAINT `trans_connect_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`),
ADD CONSTRAINT `trans_connect_ibfk_3` FOREIGN KEY (`user_category_id`) REFERENCES `user_category` (`user_category_id`);

--
-- Constraints for table `txn_user`
--
ALTER TABLE `txn_user`
ADD CONSTRAINT `txn_user_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_detail` (`uid`);

--
-- Constraints for table `user_detail`
--
ALTER TABLE `user_detail`
ADD CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`regd_status_id`) REFERENCES `regd_status` (`regd_id`),
ADD CONSTRAINT `user_detail_ibfk_2` FOREIGN KEY (`user_type_id`) REFERENCES `user_roles` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
