-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2017 at 11:48 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackathondenbosch`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `user_ID` int(11) NOT NULL,
  `house_ID` int(11) NOT NULL,
  `level_ID` int(11) NOT NULL,
  `setting_ID` int(11) NOT NULL,
  `h_occupants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`user_ID`, `house_ID`, `level_ID`, `setting_ID`, `h_occupants`) VALUES
(0, 0, 10, 0, 4),
(1, 0, 10, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `house_ID` int(11) NOT NULL,
  `h_city` varchar(45) DEFAULT NULL,
  `h_zipcode` varchar(45) DEFAULT NULL,
  `h_address` varchar(45) DEFAULT NULL,
  `h_rent_buy` varchar(45) DEFAULT NULL,
  `h_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`house_ID`, `h_city`, `h_zipcode`, `h_address`, `h_rent_buy`, `h_type`) VALUES
(0, 'DEFAULT', 'DEFAULT', 'DEFAULT', 'DEFAULT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `house_types`
--

CREATE TABLE `house_types` (
  `house_type_ID` int(11) NOT NULL,
  `house_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `house_types`
--

INSERT INTO `house_types` (`house_type_ID`, `house_name`) VALUES
(0, 'DEFAULT'),
(1, 'HOUSE');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `level_ID` int(11) NOT NULL,
  `l_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level_ID`, `l_name`) VALUES
(0, 'guest'),
(10, 'customer'),
(20, 'employee'),
(30, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `p_type` varchar(45) DEFAULT NULL,
  `p_brand` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `insert_date` varchar(45) NOT NULL,
  `p_energylabel` varchar(255) NOT NULL,
  `p_condition` varchar(255) NOT NULL,
  `p_viewcount` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_ID`, `user_ID`, `p_type`, `p_brand`, `p_name`, `insert_date`, `p_energylabel`, `p_condition`, `p_viewcount`) VALUES
(0, 1, 'Solarlader Goal Zero Boulder 90 32405 Laadst ', 'Goal Zero', 'Boulder', '2017-12-09 11:13:18', 'B', 'Zeer Goed', 25),
(1, 1, 'zonnepaneel', 'Percium', 'JA-SOLAR 300WP', '2017-12-09 11:13:18', 'A', 'Gebruikt', 11),
(2, 1, 'zonnepaneel', 'CSUN', '275 WP', '2017-12-09 11:22:00', 'B', 'Gebruikt', 56),
(3, 1, 'cv-ketel', 'E-TECH', 'W36 36 kW', '2017-12-09 11:23:38', 'A', 'Z.G.A.N.', 7),
(4, 1, 'cv-ketel', 'Remeha Tzerra', 'plus M 28c CW4', '2017-12-09 11:24:04', 'C', 'Gebruikt', 37),
(67, 7, ' Zoom Vaillant ecoTEC plus VHR 30-34 CW5', 'Vaillant', ' Zoom VHR 30-34 CW5', '2017-12-09 11:13:18', 'A', 'Gebruikt', 14);

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `product_ID` int(11) NOT NULL,
  `specification_ID` int(11) NOT NULL,
  `s_label` varchar(45) DEFAULT NULL,
  `s_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`product_ID`, `specification_ID`, `s_label`, `s_content`) VALUES
(1, 1, 'Jaarlijks gebruik', '3330 kWh'),
(1, 2, 'Dakoppervlak', '+/- 21 m2'),
(2, 3, 'Paneel cellen', '60');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_ID` int(11) NOT NULL,
  `p_show_email` varchar(45) DEFAULT NULL,
  `p_show_name` varchar(45) DEFAULT NULL,
  `p_show_location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_ID`, `p_show_email`, `p_show_name`, `p_show_location`) VALUES
(0, '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL,
  `u_mail` varchar(45) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_salt` varchar(255) DEFAULT NULL,
  `u_firstname` varchar(45) DEFAULT NULL,
  `u_lastname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_ID`, `u_mail`, `u_password`, `u_salt`, `u_firstname`, `u_lastname`) VALUES
(0, 'creator@gmail.com', '6110a20725c76422b303c9afd8528998b0eb40c49ba04', '720e42d2f61ee650a68df8bd5e3528c4c5ed2b9e2deac', 'creator', 'lastname'),
(1, 'stijnklomp1@hotmail.com', '810b7e55db4974812113d5d86bbd953e2cd8579603ea61a344425c38d39176ef6d08b86d91cdd986dfa97fac132ab02beb63735f12132a98cd94b58db386ce74', '1b10ea70d81d57c2f4f76e7d182c1f107f37d3d743aa43db2f6fc39da6a5ee4b1a6d8ddbf788a674ae8118bdd09a6c8158dc7ae131030e753859ed5ff3d481de', 'Stijn', 'Klomp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `house_id_idx` (`house_ID`),
  ADD KEY `level_id_idx` (`level_ID`),
  ADD KEY `setting_id_idx` (`setting_ID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`house_ID`),
  ADD KEY `house_type_idx` (`h_type`);

--
-- Indexes for table `house_types`
--
ALTER TABLE `house_types`
  ADD PRIMARY KEY (`house_type_ID`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`product_ID`,`specification_ID`),
  ADD KEY `product_id_idx` (`product_ID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `house_id` FOREIGN KEY (`house_ID`) REFERENCES `houses` (`house_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `level_id` FOREIGN KEY (`level_ID`) REFERENCES `levels` (`level_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_id` FOREIGN KEY (`setting_ID`) REFERENCES `settings` (`setting_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `house_type` FOREIGN KEY (`h_type`) REFERENCES `house_types` (`house_type_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_ID`) REFERENCES `products` (`product_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
