-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 04:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `location`) VALUES
(2, 'Budi Santoso', 'Bali'),
(3, 'Dewi Wahyu', 'Bandung'),
(4, 'Aditya Pratama', 'Jakarta'),
(22, 'Niki', 'Jakarta'),
(23, 'Jojo', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `location`) VALUES
(2, 'Jack', 'Bandung'),
(3, 'Ellen', 'Jakarta'),
(4, 'Rey', 'Surabaya'),
(5, 'Lili', 'Samarinda'),
(6, 'Didi', 'Padang'),
(8, 'Lala', 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location`) VALUES
('All locations'),
('Bali'),
('Bandung'),
('Jakarta'),
('Padang'),
('Samarinda'),
('Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `nama_makanan` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `nama_makanan`, `price`, `location`) VALUES
(1, 'gado gado', 20000, 'Jakarta'),
(2, 'Nasi goreng', 20000, 'All locations'),
(3, 'Indomie goreng', 10000, 'All locations'),
(6, 'Batagor', 20000, 'Bandung'),
(9, 'kerupuk', 5000, 'All locations'),
(11, 'nasi', 20000, 'Bandung'),
(13, 'mie kuah', 13000, 'Bandung'),
(18, 'ayam goreng Jakarta', 15000, 'Jakarta'),
(22, 'Rujak Cingur', 8000, 'Surabaya'),
(23, 'Nasi uduk', 5000, 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `menu_local`
--

CREATE TABLE `menu_local` (
  `menu_id` int(11) NOT NULL,
  `narasi` varchar(255) DEFAULT NULL,
  `origin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_local`
--

INSERT INTO `menu_local` (`menu_id`, `narasi`, `origin`) VALUES
(22, 'Terbuat dari moncong sapi/cingur, dicampur dengan sayur dan buah', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `menu_special`
--

CREATE TABLE `menu_special` (
  `menu_id` int(11) NOT NULL,
  `narasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_special`
--

INSERT INTO `menu_special` (`menu_id`, `narasi`) VALUES
(1, 'Salad dengan saus kacang'),
(6, 'Bakso dan tahu goreng dengan saus kacang'),
(11, 'enak'),
(13, 'mie dengsn kuah'),
(18, 'ayam goreng spesial yang sangat enak di Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `transaction_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`transaction_id`, `menu_id`, `quantity`) VALUES
(15, 1, 3),
(15, 3, 1),
(15, 9, 5),
(15, 18, 9),
(16, 1, 3),
(16, 2, 10),
(16, 18, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_type` varchar(20) NOT NULL,
  `maximum_people` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_type`, `maximum_people`) VALUES
('Family', 10),
('General', 4),
('Romantic', 2);

-- --------------------------------------------------------

--
-- Table structure for table `table_info`
--

CREATE TABLE `table_info` (
  `transaction_id` int(11) NOT NULL,
  `table_type` varchar(20) NOT NULL,
  `human_per_table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_info`
--

INSERT INTO `table_info` (`transaction_id`, `table_type`, `human_per_table`) VALUES
(4, 'General', 4),
(15, 'General', 4),
(16, 'Family', 8),
(17, 'General', 4);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `employee_id`, `customer_id`, `status`) VALUES
(4, 8, 2, 'in_reserve'),
(15, 3, 22, 'in_order'),
(16, 3, 23, 'in_order'),
(17, 3, 23, 'in_reserve');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `menu_local`
--
ALTER TABLE `menu_local`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_special`
--
ALTER TABLE `menu_special`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`transaction_id`,`menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_type`);

--
-- Indexes for table `table_info`
--
ALTER TABLE `table_info`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `table_type` (`table_type`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`location`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`location`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`location`);

--
-- Constraints for table `menu_local`
--
ALTER TABLE `menu_local`
  ADD CONSTRAINT `menu_local_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

--
-- Constraints for table `menu_special`
--
ALTER TABLE `menu_special`
  ADD CONSTRAINT `menu_special_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

--
-- Constraints for table `table_info`
--
ALTER TABLE `table_info`
  ADD CONSTRAINT `table_info_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `table_info_ibfk_2` FOREIGN KEY (`table_type`) REFERENCES `tables` (`table_type`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
