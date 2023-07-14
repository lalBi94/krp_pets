-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 04 juil. 2023 à 03:09
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `esxlegacy_984b87`
--

-- --------------------------------------------------------

--
-- Structure de la table `krp_pets`
--

DROP TABLE IF EXISTS `krp_pets`;
CREATE TABLE IF NOT EXISTS `krp_pets` (
  `identifier` text NOT NULL,
  `pet` text NOT NULL,
  `name` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `krp_pets`
--

INSERT INTO `krp_pets` (`identifier`, `pet`, `name`) VALUES
('char1:2527f6b091061f639113ecbdbb4c0e590290a2d4', 'cat', 'Onde'),
('char1:2527f6b091061f639113ecbdbb4c0e590290a2d4', 'cat', 'Bilou'),
('char1:2527f6b091061f639113ecbdbb4c0e590290a2d4', 'westy', 'Slik_OFF');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
