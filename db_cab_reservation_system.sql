-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 01:50 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cab_reservation_system`
--
CREATE DATABASE IF NOT EXISTS `db_cab_reservation_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_cab_reservation_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_detail`
--

DROP TABLE IF EXISTS `tbl_booking_detail`;
CREATE TABLE IF NOT EXISTS `tbl_booking_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `SOURCE` int(11) DEFAULT NULL,
  `DESTINATION` int(11) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_booking_detail`
--

INSERT INTO `tbl_booking_detail` (`ID`, `UserID`, `SOURCE`, `DESTINATION`, `Status`) VALUES
(1, 1, 2, 1, 'Pending'),
(2, 1, 3, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cab_det`
--

DROP TABLE IF EXISTS `tbl_cab_det`;
CREATE TABLE IF NOT EXISTS `tbl_cab_det` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ImagePath` varchar(200) DEFAULT NULL,
  `VehicleName` varchar(100) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cab_det`
--

INSERT INTO `tbl_cab_det` (`ID`, `ImagePath`, `VehicleName`, `Description`) VALUES
(1, '/Images/Vehicle/ic_auto.png', 'Auto', 'Get an auto at your doorstep'),
(2, '/Images/Vehicle/ic_mini.png', 'Mini', 'Comfy hatchbacks at pocket-friendly fares'),
(3, '/Images/Vehicle/ic_prime.png', 'Prime Sedan', 'Sedans with free wifi and top drivers'),
(4, '/Images/Vehicle/ic_suv.png', 'Prime SUV', 'SUVs with free wifi and top drivers');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE IF NOT EXISTS `tbl_city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`ID`, `CITY`) VALUES
(1, 'Alexander'),
(2, 'Andalusia'),
(3, 'Anniston');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_distance`
--

DROP TABLE IF EXISTS `tbl_distance`;
CREATE TABLE IF NOT EXISTS `tbl_distance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOURCE` int(11) DEFAULT NULL,
  `DESTINATION` int(11) DEFAULT NULL,
  `DISTANCE` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_distance`
--

INSERT INTO `tbl_distance` (`ID`, `SOURCE`, `DESTINATION`, `DISTANCE`) VALUES
(1, 1, 2, '1000.00'),
(2, 1, 3, '1500.00'),
(3, 2, 1, '700.00'),
(4, 2, 3, '1200.00'),
(5, 3, 1, '1000.00'),
(6, 3, 2, '500.00'),
(7, 1, 2, '800.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_registration`
--

DROP TABLE IF EXISTS `tbl_user_registration`;
CREATE TABLE IF NOT EXISTS `tbl_user_registration` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UName` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `PhoneNO` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `UserRoles` varchar(100) DEFAULT NULL,
  `VehicleType` varchar(150) DEFAULT NULL,
  `VehicleNo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
