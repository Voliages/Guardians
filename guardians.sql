-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 20, 2022 at 09:20 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guardians`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(6) NOT NULL,
  `NIP` varchar(4) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `passwords` varchar(50) DEFAULT NULL,
  `signature_registered` int(11) DEFAULT NULL,
  `signature_comparison` int(11) DEFAULT NULL,
  `document_verified` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `NIP`, `username`, `passwords`, `signature_registered`, `signature_comparison`, `document_verified`, `is_admin`) VALUES
('TI0334', '0334', 'Alexandro Alvin', 'xandroganteng', 10, 5, 2, 1),
('TI0335', '0335', 'Alleycia Syananda', 'alleyxixi', 20, 3, 1, 0),
('TI0343', '0343', 'Diva Amanda', 'divaputput', 15, 6, 3, NULL),
('TI0348', '0348', 'Julius Salim', 'julius123', 25, 7, 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
