-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2023 at 06:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

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
  `table_type` varchar(20) NOT NULL,
  `table_quantitiy` int(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `human_per_table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `table_type`, `table_quantitiy`, `location`, `human_per_table`) VALUES
(1, 'Budi Santoso', 'Family', 2, 'Bali', 7),
(2, 'Dewi Wahyu', 'Romantic', 1, 'Bandung', 2),
(3, 'Aditya Pratama', 'General', 3, 'Jakarta', 4),
(4, 'Siti Rahmawati', 'Family', 1, 'Padang', 5),
(5, 'Iwan Setiawan', 'Romantic', 1, 'Samarinda', 1),
(6, 'Dian Pratiwi', 'Family', 1, 'Surabaya', 10);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `location`) VALUES
(1, 'Jack', 'Bandung'),
(2, 'Reynaldi', 'Jakarta'),
(3, 'Ellen', 'Bali'),
(4, 'Andi Kurniawan', 'Padang'),
(5, 'Anisa Fitriani', 'Samarinda'),
(6, 'Rizki Permana', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location`) VALUES
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
  `origin` varchar(20) NOT NULL,
  `narasi` varchar(50) NOT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `nama_makanan`, `price`, `origin`, `narasi`, `location`) VALUES
(1, 'Gado gado', 15000, '', 'Salad dengan saus kacang', 'Jakarta'),
(4, 'Nasi goreng', 20000, '', '', NULL),
(5, 'Indomie', 13000, '', '', NULL),
(6, 'Batagor', 20000, '', ' Bakso dan tahu goreng dengan saus kacang', 'Bandung'),
(8, 'nasi', 5000, '', '', NULL),
(9, 'kerupuk', 5000, '', '', NULL),
(11, 'nasi', 20000, '', 'enak', 'Bandung'),
(13, 'mie kuah', 13000, '', 'mie dengan kuah', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantitiy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `transaction_id`, `menu_id`, `quantitiy`) VALUES
(1, 2, 5, 3),
(2, 2, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_type` varchar(20) NOT NULL,
  `maximum_people` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_type`, `maximum_people`) VALUES
('Family', 10),
('General', 4),
('Romantic', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `employee_id`, `customer_id`, `status`) VALUES
(1, 3, 1, 'reserve'),
(2, 1, 2, 'in_order'),
(3, 2, 3, 'reserve'),
(4, 4, 4, 'reserve'),
(5, 5, 5, 'reserve'),
(6, 6, 6, 'reserve');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `table_pk` (`table_type`),
  ADD KEY `location_pk` (`location`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `location_pk` (`location`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `transaction_id_2` (`transaction_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_type`);

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
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`location`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`table_type`) REFERENCES `tables` (`table_type`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `location_fk` FOREIGN KEY (`location`) REFERENCES `locations` (`location`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`location`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`);

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
