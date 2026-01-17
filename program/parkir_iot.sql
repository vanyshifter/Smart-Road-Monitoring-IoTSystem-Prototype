-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2025 at 06:07 PM
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
-- Database: `parkir_iot`
--

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_parkir`
--

CREATE TABLE `riwayat_parkir` (
  `id` int(11) NOT NULL,
  `slot_id` int(11) DEFAULT 1,
  `tanggal` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `durasi_menit` int(11) DEFAULT 0,
  `pendapatan` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_parkir`
--

INSERT INTO `riwayat_parkir` (`id`, `slot_id`, `tanggal`, `start_time`, `end_time`, `durasi_menit`, `pendapatan`, `created_at`) VALUES
(1, 1, '2025-12-22', '2025-12-22 20:35:49', '2025-12-22 20:35:50', 1, 1000, '2025-12-22 13:35:50'),
(2, 1, '2025-12-22', '2025-12-22 20:41:09', '2025-12-22 20:41:12', 1, 1000, '2025-12-22 13:41:12'),
(3, 1, '2025-12-22', '2025-12-22 20:54:46', '2025-12-22 20:54:46', 0, 0, '2025-12-22 13:54:46'),
(4, 1, '2025-12-22', '2025-12-22 20:54:47', '2025-12-22 20:54:48', 1, 1000, '2025-12-22 13:54:48'),
(5, 1, '2025-12-22', '2025-12-22 20:54:50', '2025-12-22 20:54:51', 1, 1000, '2025-12-22 13:54:51'),
(6, 1, '2025-12-22', '2025-12-22 20:54:52', '2025-12-22 20:54:53', 1, 1000, '2025-12-22 13:54:53'),
(7, 1, '2025-12-22', '2025-12-22 20:55:12', '2025-12-22 20:55:14', 1, 1000, '2025-12-22 13:55:14'),
(8, 1, '2025-12-22', '2025-12-22 20:55:31', '2025-12-22 20:55:39', 1, 1000, '2025-12-22 13:55:39'),
(9, 1, '2025-12-22', '2025-12-22 20:58:08', '2025-12-22 20:58:10', 1, 1000, '2025-12-22 13:58:10'),
(10, 1, '2025-12-22', '2025-12-22 20:58:13', '2025-12-22 20:58:15', 1, 1000, '2025-12-22 13:58:15'),
(11, 1, '2025-12-22', '2025-12-22 21:05:09', '2025-12-22 21:05:12', 1, 1000, '2025-12-22 14:05:12'),
(12, 1, '2025-12-22', '2025-12-22 21:05:15', '2025-12-22 21:05:16', 1, 1000, '2025-12-22 14:05:16'),
(13, 1, '2025-12-22', '2025-12-22 21:05:17', '2025-12-22 21:05:17', 0, 0, '2025-12-22 14:05:17'),
(14, 1, '2025-12-22', '2025-12-22 21:06:45', '2025-12-22 21:06:50', 1, 1000, '2025-12-22 14:06:50'),
(15, 1, '2025-12-22', '2025-12-22 21:14:52', '2025-12-22 21:14:52', 0, 0, '2025-12-22 14:14:52'),
(16, 1, '2025-12-22', '2025-12-22 21:14:53', '2025-12-22 21:14:56', 1, 1000, '2025-12-22 14:14:56'),
(17, 1, '2025-12-22', '2025-12-22 21:14:56', '2025-12-22 21:14:58', 1, 1000, '2025-12-22 14:14:58'),
(18, 1, '2025-12-22', '2025-12-22 21:15:01', '2025-12-22 21:15:01', 0, 0, '2025-12-22 14:15:01'),
(19, 1, '2025-12-22', '2025-12-22 21:15:01', '2025-12-22 21:15:01', 0, 0, '2025-12-22 14:15:01'),
(20, 1, '2025-12-22', '2025-12-22 21:15:03', '2025-12-22 21:15:09', 1, 1000, '2025-12-22 14:15:09'),
(21, 1, '2025-12-22', '2025-12-22 21:17:24', '2025-12-22 21:17:31', 1, 1000, '2025-12-22 14:17:31'),
(22, 1, '2025-12-22', '2025-12-22 21:22:21', '2025-12-22 21:22:29', 1, 1000, '2025-12-22 14:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `status_parkir`
--

CREATE TABLE `status_parkir` (
  `id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL DEFAULT 1,
  `is_occupied` tinyint(1) DEFAULT 0,
  `vehicle_type` varchar(20) DEFAULT 'mobil',
  `start_time` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_parkir`
--

INSERT INTO `status_parkir` (`id`, `slot_id`, `is_occupied`, `vehicle_type`, `start_time`, `updated_at`) VALUES
(1, 1, 0, 'mobil', NULL, '2025-12-22 14:22:29'),
(2, 1, 0, 'mobil', NULL, '2025-12-22 14:22:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `riwayat_parkir`
--
ALTER TABLE `riwayat_parkir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_parkir`
--
ALTER TABLE `status_parkir`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `riwayat_parkir`
--
ALTER TABLE `riwayat_parkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `status_parkir`
--
ALTER TABLE `status_parkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
