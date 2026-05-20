-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2026 at 07:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price_per_day` decimal(10,2) DEFAULT NULL,
  `status` enum('Available','Not Available') DEFAULT 'Available',
  `transmission` varchar(50) DEFAULT NULL,
  `fuel` varchar(50) DEFAULT NULL,
  `image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `model`, `price_per_day`, `status`, `transmission`, `fuel`, `image_url`) VALUES
(2, 'Vios', 'Toyota', '2022', 500.00, 'Available', NULL, NULL, ''),
(3, 'vios', 'toyota', '2002', 1000.00, 'Available', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `car_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `payment_method` enum('Cash','Online') DEFAULT 'Cash',
  `reference_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `car_name`, `start_date`, `end_date`, `total_price`, `status`, `created_at`, `user_id`, `payment_method`, `reference_number`) VALUES
(24, 'Toyota Vios', '2026-03-30', '2026-04-07', 4000, 'Completed', '2026-03-29 18:22:21', 7, '', 'N/A'),
(25, 'Toyota Vios', '2026-03-31', '2026-04-11', 5500, 'Completed', '2026-03-29 18:30:13', 7, '', 'N/A'),
(26, 'Toyota Vios', '2026-03-30', '2026-04-11', 6000, 'Paid', '2026-03-29 19:00:44', 7, '', 'N/A'),
(27, 'toyota vios', '2026-03-30', '2026-04-11', 12000, 'Paid', '2026-03-30 00:33:12', 7, '', 'N/A'),
(28, 'Toyota Vios', '2026-03-30', '2026-04-11', 6000, 'Pending', '2026-03-30 00:41:10', 8, '', 'N/A'),
(29, 'toyota vios', '2026-03-30', '2026-04-11', 12000, 'Paid', '2026-03-30 00:42:03', 7, '', 'N/A'),
(30, 'Toyota Vios', '2026-03-31', '2026-04-11', 5500, 'Pending', '2026-03-30 00:59:22', 8, '', 'N/A'),
(31, 'Toyota Vios', '2026-03-30', '2026-04-11', 6000, 'Paid', '2026-03-30 00:59:58', 7, '', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(7, 'Erik Batumbakal', 'Erik@gmail.com', '$2b$10$XyJKkE4FgXGaA7wno1q1s.EE8kZWdlms.R4z/SQ262XQoDULglwrO', 'user'),
(8, 'John Michael Moises', 'jmbriones355@gmail.com', '$2b$10$FlGTJ6TzzfVNyfsMtlkZr.bhgT1a2/xRd/xvoZuPr9gBYmwO8KwvK', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
