-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 juil. 2020 à 11:11
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Structure de la table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_ID` int(11) NOT NULL,
  `doctor_name` varchar(55) DEFAULT NULL,
  `speciality` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
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
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`social_ID`, `age`, `date_of_submission`, `last_name`, `fisrt_name`, `e_card`) VALUES
(1, 3, '0000-00-00', 'Beniamin', 'Huryta', 'true'),
(2, 4, '0000-00-00', 'Bruno', 'M', 'true'),
(3, 4, '0000-00-00', 'Anna', 'L', ''),
(4, 5, '0000-00-00', 'Paulina', 'B', 'true');

-- --------------------------------------------------------

--
-- Structure de la table `therapy`
--

CREATE TABLE `therapy` (
  `interventions` varchar(55) DEFAULT NULL,
  `date_intervention` date DEFAULT NULL,
  `observed_symptom` varchar(55) DEFAULT NULL,
  `prescribed_treatment` varchar(55) DEFAULT NULL,
  `fk_doctor` int(11) DEFAULT NULL,
  `fk_social` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `unit`
--

CREATE TABLE `unit` (
  `Unit_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `floor_interventions` int(1) DEFAULT NULL,
  `fk_doctor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `unit`
--

INSERT INTO `unit` (`Unit_ID`, `name`, `floor_interventions`, `fk_doctor`) VALUES
(1, '\r\n                         psycheatric', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `visit`
--

CREATE TABLE `visit` (
  `fk_unit` int(11) DEFAULT NULL,
  `fk_social` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_ID`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`social_ID`);

--
-- Index pour la table `therapy`
--
ALTER TABLE `therapy`
  ADD KEY `fk_doctor` (`fk_doctor`),
  ADD KEY `fk_social` (`fk_social`);

--
-- Index pour la table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD KEY `fk_doctor` (`fk_doctor`);

--
-- Index pour la table `visit`
--
ALTER TABLE `visit`
  ADD KEY `fk_unit` (`fk_unit`),
  ADD KEY `fk_social` (`fk_social`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `social_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `unit`
--
ALTER TABLE `unit`
  MODIFY `Unit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `therapy`
--
ALTER TABLE `therapy`
  ADD CONSTRAINT `therapy_ibfk_1` FOREIGN KEY (`fk_doctor`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `therapy_ibfk_2` FOREIGN KEY (`fk_social`) REFERENCES `patient` (`social_ID`);

--
-- Contraintes pour la table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_doctor`) REFERENCES `doctor` (`doctor_ID`);

--
-- Contraintes pour la table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`fk_unit`) REFERENCES `unit` (`Unit_ID`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`fk_social`) REFERENCES `patient` (`social_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
