-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 02:01 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_ID` int(11) NOT NULL,
  `speciality` varchar(55) DEFAULT NULL,
  `doctor_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_ID`, `speciality`, `doctor_name`) VALUES
(1, 'Psycheatry', 'John'),
(2, 'Psycheatry', 'Jean'),
(3, 'Psycheatry', 'Jack'),
(4, 'ambulenz', 'Pierre'),
(5, 'ambulenz', 'Paul'),
(6, 'ambulenz', 'Peter'),
(7, 'geriatry', 'Julia'),
(8, 'geriatry', 'Jule'),
(9, 'geriatry', 'Jerry'),
(10, 'cardiology', 'Acilio'),
(11, 'cardiology', 'Antonio'),
(12, 'cardiology', 'Amelia');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `social_ID` int(11) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `date_of_submission` date DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fisrt_name` varchar(55) DEFAULT NULL,
  `e_card` enum('true','false') DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`social_ID`, `age`, `date_of_submission`, `last_name`, `fisrt_name`, `e_card`) VALUES
(1, 3, '0000-00-00', 'Beniamin', 'Huryta', 'true'),
(2, 4, '0000-00-00', 'Bruno', 'M', 'true'),
(3, 4, '0000-00-00', 'Anna', 'L', ''),
(4, 5, '0000-00-00', 'Paulina', 'B', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

CREATE TABLE `therapy` (
  `therapy_id` int(11) NOT NULL,
  `fk_doctor` int(11) DEFAULT NULL,
  `fk_social` int(11) DEFAULT NULL,
  `interventions` varchar(55) DEFAULT NULL,
  `date_intervention` date DEFAULT NULL,
  `observed_symptom` varchar(55) DEFAULT NULL,
  `prescribed_treatment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `therapy`
--

INSERT INTO `therapy` (`therapy_id`, `fk_doctor`, `fk_social`, `interventions`, `date_intervention`, `observed_symptom`, `prescribed_treatment`) VALUES
(1, 1, 2, 'interventions1', '2019-08-07', 'symptoms1', 'treatment1'),
(2, 5, 3, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2'),
(3, 11, 4, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2'),
(4, 12, 1, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2'),
(5, 10, 2, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2'),
(6, 3, 2, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2'),
(7, 8, 3, 'interventions2', '2019-08-07', 'symptoms2', 'treatment2');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `Unit_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `floor_interventions` int(1) DEFAULT NULL,
  `fk_doctor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`Unit_ID`, `name`, `floor_interventions`, `fk_doctor`) VALUES
(6, ' psycheatric', 1, 2),
(7, 'ambulenz', 0, 6),
(8, 'geriatry', 5, 9),
(9, 'cardiology', 2, 11),
(10, 'cardiology', 2, 10),
(11, 'cardiology', 2, 12),
(12, ' psycheatric', 1, 1),
(13, ' psycheatric', 1, 3),
(14, 'geriatry', 5, 7),
(15, 'geriatry', 5, 8),
(16, 'ambulenz', 0, 4),
(17, 'ambulenz', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `fk_unit` int(11) DEFAULT NULL,
  `fk_social` int(11) DEFAULT NULL,
  `visit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`fk_unit`, `fk_social`, `visit_id`) VALUES
(9, 1, 1),
(10, 3, 2),
(6, 2, 3),
(17, 4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`social_ID`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`therapy_id`),
  ADD KEY `fk_doctor` (`fk_doctor`),
  ADD KEY `fk_social` (`fk_social`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD KEY `fk_doctor` (`fk_doctor`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `fk_unit` (`fk_unit`),
  ADD KEY `fk_social` (`fk_social`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `social_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `therapy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `Unit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `therapy`
--
ALTER TABLE `therapy`
  ADD CONSTRAINT `therapy_ibfk_1` FOREIGN KEY (`fk_doctor`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `therapy_ibfk_2` FOREIGN KEY (`fk_social`) REFERENCES `patient` (`social_ID`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_doctor`) REFERENCES `doctor` (`doctor_ID`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`fk_unit`) REFERENCES `unit` (`Unit_ID`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`fk_social`) REFERENCES `patient` (`social_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
