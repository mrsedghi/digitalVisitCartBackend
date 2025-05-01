-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 08:30 AM
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
-- Database: `digitalcards`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `aboutTitle` varchar(20) NOT NULL,
  `des` varchar(250) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ProfileVisible` tinyint(1) NOT NULL,
  `logoVisible` tinyint(1) NOT NULL,
  `aboutVisible` tinyint(1) NOT NULL,
  `contactVisible` tinyint(1) NOT NULL,
  `template` int(20) NOT NULL,
  `profileFile` varchar(250) DEFAULT NULL,
  `logoFile` varchar(250) DEFAULT NULL,
  `showName` varchar(20) DEFAULT NULL,
  `showTitle` varchar(20) DEFAULT NULL,
  `showLogo` varchar(200) DEFAULT NULL,
  `showProfile` varchar(200) DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `title`, `company`, `phone`, `email`, `aboutTitle`, `des`, `address`, `ProfileVisible`, `logoVisible`, `aboutVisible`, `contactVisible`, `template`, `profileFile`, `logoFile`, `showName`, `showTitle`, `showLogo`, `showProfile`, `profile`, `logo`) VALUES
(0, '', '', 'شرکت', '09xxxxxxxx', 'test@example.com', 'درباره من', 'بیوگرافی من', 'آدرس', 1, 1, 1, 1, 1, '/uploads/logo.webp', '/uploads/profile.webp', 'نام و نام خانوادگی', 'عنوان', '', '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
