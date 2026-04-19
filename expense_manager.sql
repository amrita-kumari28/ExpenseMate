-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2026 at 11:31 AM
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
-- Database: `expense_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `monthly_limit` decimal(10,2) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `user_id`, `category`, `percentage`, `monthly_limit`, `month`, `year`) VALUES
(1, 1, 'Food', 50.00, 2500.00, 3, 2026),
(2, 1, 'Transport', 20.00, 1000.00, 3, 2026),
(3, 1, 'Study', 15.00, 750.00, 3, 2026),
(4, 1, 'Entertainment', 10.00, 500.00, 3, 2026),
(5, 1, 'Other', 5.00, 250.00, 3, 2026),
(6, 2, 'Food', 50.00, 2500.00, 3, 2026),
(7, 2, 'Transport', 20.00, 1000.00, 3, 2026),
(8, 2, 'Study', 15.00, 750.00, 3, 2026),
(9, 2, 'Entertainment', 10.00, 500.00, 3, 2026),
(10, 2, 'Other', 5.00, 250.00, 3, 2026),
(11, 3, 'Food', 50.00, 2500.00, 3, 2026),
(12, 3, 'Transport', 20.00, 1000.00, 3, 2026),
(13, 3, 'Entertainment', 10.00, 500.00, 3, 2026),
(14, 3, 'Study', 15.00, 750.00, 3, 2026),
(15, 3, 'Other', 5.00, 250.00, 3, 2026);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `category`, `amount`, `note`, `created_at`) VALUES
(1, 1, 'Study', 200.00, '', '2026-03-24 09:18:01'),
(2, 1, 'Study', 200.00, '', '2026-03-24 09:18:27'),
(3, 1, 'Food', 200.00, '', '2026-03-24 09:18:42'),
(4, 1, 'Food', 100.00, '', '2026-03-24 09:19:02'),
(5, 1, 'Food', 10.00, '', '2026-03-24 09:20:28'),
(6, 1, 'Entertainment', 20.00, '', '2026-03-24 09:29:06'),
(7, 1, 'Food', 23.00, '', '2026-03-24 09:48:47'),
(8, 1, 'Transport', 20.00, 'auto', '2026-03-24 10:01:42'),
(9, 2, 'Study', 18.00, 'chips', '2026-03-24 10:06:43'),
(10, 2, 'Study', 15.00, 'copy', '2026-03-24 10:06:51'),
(11, 3, 'Food', 200.00, 'waffle', '2026-03-24 10:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Vidhi', 'v@v.com', '$2y$10$C5fvDg1XjZacogkXKGaPV.MtzYKmrfjFLEmAVnSAxJI6dXwlbhU8.', '2026-03-24 09:15:03'),
(2, 'sneha', 'sneha@gmail.com', '$2y$10$jfNmzQH9jXdRrezXZMKgVuHY.FPcToIPR5aNsou2fT.UHDdRPEGPi', '2026-03-24 10:06:05'),
(3, 'adarsh', 'adarsh@gmail.com', '$2y$10$rMwvJfyKZHYNhh7TbXw2ROvkCCvGSM7y37/Gydfhw5ztVPGIM4yeG', '2026-03-24 10:26:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
