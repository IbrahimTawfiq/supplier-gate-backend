-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: shareddb-m.hosting.stackcp.net
-- Generation Time: Oct 16, 2021 at 10:58 AM
-- Server version: 10.2.33-MariaDB-log
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supply-313031e5e9`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_name`, `password`, `token`, `created_at`) VALUES
(1, 'admin', '123456', '864b54a86e1beddb0fde1eabecd696dd8be6c959', NULL),
(2, 'admin2', '123456', '5fe591a4815cc5d6f75dba5b81f3160f24787542', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `area` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area`) VALUES
(1, 'Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `badge` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `badge`, `created_at`) VALUES
(1, 'BOSCH', 'uploads/brand_badges/350c15bfde2d7d472ec6d84763c87839.jpeg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brand_systems`
--

CREATE TABLE `brand_systems` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `system_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_systems`
--

INSERT INTO `brand_systems` (`id`, `brand_id`, `system_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `field`) VALUES
(1, 'MEP');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `part_number` int(11) NOT NULL,
  `image` varchar(70) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `supplier_system_id` int(10) UNSIGNED DEFAULT NULL,
  `pdf_link` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

CREATE TABLE `main_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`id`, `name`, `image`, `created_at`) VALUES
(1, 'Construction', 'uploads/mainCategories_images/ffde2c5546ee457a1809b7bc552ec143.jpeg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `request` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_premium`
--

CREATE TABLE `request_premium` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_premium`
--

INSERT INTO `request_premium` (`id`, `user_id`) VALUES
(1, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `main_category_id`, `name`, `created_at`) VALUES
(1, 1, 'Electrical', NULL),
(2, 1, 'Mechanical', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_category`
--

CREATE TABLE `sub_sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_sub_category`
--

INSERT INTO `sub_sub_category` (`id`, `sub_category_id`, `name`, `created_at`) VALUES
(1, 1, 'Light Current', NULL),
(2, 2, 'HVAC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_name` varchar(80) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(150) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `area_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `pdf_link` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `banner` varchar(200) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `first_name`, `last_name`, `companyName`, `user_name`, `password`, `email`, `phone`, `logo`, `description`, `address`, `fax`, `area_id`, `field_id`, `pdf_link`, `banner`, `token`, `created_at`, `deleted_at`) VALUES
(1, 'Demo1', 'LC1', 'Demo LC', 'Demo1', '0123456789', 'sgdemolc@gmail.com', '01000000000', 'uploads/suppliers_logos/71a1ca22bffa0e00396459fd0df83aa2.png', 'description', 'address', '0200000000', 1, 1, 'uploads/suppliers_pdfs/b65ea349ad63ef7f0a6000228431a668.pdf', 'uploads/suppliers_banners/bdcb45eb754dac5cec2828c35bc106ba.jpeg', '4723bb20360f66ee9a8efeee19b74d448a90993f', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_system`
--

CREATE TABLE `supplier_system` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `brand_system_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_system`
--

INSERT INTO `supplier_system` (`id`, `supplier_id`, `brand_system_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `catalog` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sub_sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `name`, `description`, `catalog`, `sub_sub_category_id`, `created_at`) VALUES
(1, 'CCTV', 'surveillance and security cameras', 'uploads/system_catalog/d29d593baae9ee2369d20ad554e12634.pdf', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_messages`
--

CREATE TABLE `system_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_messages`
--

INSERT INTO `system_messages` (`id`, `code`, `message`, `msg`, `created_at`, `updated_at`) VALUES
(1, 200, 'Success !!', 'SUCCESS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 102, 'We\'re sorry but you\'re not allowed in this section', 'UNAUTHORIZEDREQUEST', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 103, 'Required field is empty', 'MISSINGPARAMETER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 104, 'Wrong username or password', 'WRONGCREDENTIALS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 105, 'Connection lost... please login again', 'NOTOKEN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 106, 'Session expired... please login again', 'TOKENEXPIRED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 107, 'No data available', 'NORECORDS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 108, 'something went wrong! please restart and try again', 'INVALIDPARAMETER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 109, 'Something wrong happened while sending mail.. please try again', 'SENDINGERROR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 110, 'Sorry , but this action is not allowed for the current case', 'DISALLOWEDACTION', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 111, 'Invalid email', 'INVALIDEMAIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 112, 'Email already registered..please choose different email', 'DUPLICATEDEMAIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 113, 'Sorry..But you need to Check In first to proceed', 'UNCHECKED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 114, 'Sorry This email isn\'t registered with us', 'UNREGISTEREDEMAIL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 119, 'This email address is exist!', 'EMAILADDRESSEXSIT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 217, 'Old password is incorrect', 'WRONGOLDPASSWORD', '2018-08-13 08:20:04', '2018-08-13 08:20:04'),
(22, 120, 'this user is deactivated as per admin action', 'INACTIVEUSER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 121, 'you already request to be premium waiting for the admin to confirm or ignore', 'ALREADYREQUEST', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `area_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Pending','Active','Deactivate','') NOT NULL,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`, `firstName`, `lastName`, `email`, `phone`, `fax`, `companyName`, `area_id`, `field_id`, `status`, `premium`, `token`, `created_at`) VALUES
(1, 'amrfoda', '123456', 'amr', 'foda', 'fodaamr8@gmail.com', '01110049691', '345345', 'Foda company', 1, 1, 'Active', 0, '0192c177a2a9bb8eb18a81641606aae0d221b6dc', '2019-08-24 15:42:29'),
(2, 'Ibrahim Tawfik', 'Leeds@2017', 'Ibrahim', 'Tawfik', 'ibrahim.tawfiq88@gmail.com', '01000053542', '0123456789', 'SG', 1, 1, 'Active', 1, 'fc7c5502d6da5d4c36f2551516d8a4f907f910c5', '2019-09-22 19:31:36'),
(3, 'Menna ElKholy', 'Menna@2050', 'Menna', 'El-Kholy', 'Menna.m.elkholy@gmail.com ', '01004194066', '', 'Menna', 1, 1, 'Active', 1, '7b796f2fda3613102a64d08ca67cdc7695870145', '2019-09-23 21:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_systems`
--
ALTER TABLE `brand_systems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_id` (`brand_id`,`system_id`),
  ADD KEY `brand_systems_ibfk_2` (`system_id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_ibfk_4` (`supplier_system_id`);

--
-- Indexes for table `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_premium`
--
ALTER TABLE `request_premium`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_ibfk_1` (`main_category_id`);

--
-- Indexes for table `sub_sub_category`
--
ALTER TABLE `sub_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_sub_category_ibfk_1` (`sub_category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `suppliers_ibfk_1` (`area_id`),
  ADD KEY `suppliers_ibfk_2` (`field_id`);

--
-- Indexes for table `supplier_system`
--
ALTER TABLE `supplier_system`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_id` (`supplier_id`,`brand_system_id`),
  ADD KEY `supplier_system_ibfk_2` (`brand_system_id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `systems_ibfk_1` (`sub_sub_category_id`);

--
-- Indexes for table `system_messages`
--
ALTER TABLE `system_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `field_id` (`field_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand_systems`
--
ALTER TABLE `brand_systems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_premium`
--
ALTER TABLE `request_premium`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_sub_category`
--
ALTER TABLE `sub_sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_system`
--
ALTER TABLE `supplier_system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_messages`
--
ALTER TABLE `system_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand_systems`
--
ALTER TABLE `brand_systems`
  ADD CONSTRAINT `brand_systems_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brand_systems_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`supplier_system_id`) REFERENCES `supplier_system` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_premium`
--
ALTER TABLE `request_premium`
  ADD CONSTRAINT `request_premium_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`main_category_id`) REFERENCES `main_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_sub_category`
--
ALTER TABLE `sub_sub_category`
  ADD CONSTRAINT `sub_sub_category_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `supplier_system`
--
ALTER TABLE `supplier_system`
  ADD CONSTRAINT `supplier_system_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_system_ibfk_2` FOREIGN KEY (`brand_system_id`) REFERENCES `brand_systems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `systems`
--
ALTER TABLE `systems`
  ADD CONSTRAINT `systems_ibfk_1` FOREIGN KEY (`sub_sub_category_id`) REFERENCES `sub_sub_category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
