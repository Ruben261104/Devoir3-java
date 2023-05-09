-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 22 Avril 2015 à 13:20
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `pizzeria`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `numCli` int(3) NOT NULL,
  `nomCli` varchar(20) NOT NULL,
  PRIMARY KEY (`numCli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`numCli`, `nomCli`) VALUES
(1, 'GALMIER'),
(2, 'GAND'),
(3, 'MAUPAS'),
(4, 'NEYRAC'),
(5, 'MULLER');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `numCde` int(3) NOT NULL,
  `numCli` int(3) NOT NULL,
  `numLiv` int(3) NOT NULL,
  PRIMARY KEY (`numCde`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`numCde`, `numCli`, `numLiv`) VALUES
(1, 2, 2),
(2, 3, 3),
(3, 5, 3),
(4, 2, 3),
(5, 4, 1),
(6, 3, 2),
(7, 5, 4),
(8, 3, 2),
(9, 1, 1),
(10, 3, 2),
(11, 5, 3),
(12, 5, 3),
(13, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `lignescommandes`
--

CREATE TABLE IF NOT EXISTS `lignescommandes` (
  `refCde` int(3) NOT NULL,
  `refPizza` varchar(4) NOT NULL,
  `qte` int(5) NOT NULL,
  PRIMARY KEY (`refCde`,`refPizza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignescommandes`
--

INSERT INTO `lignescommandes` (`refCde`, `refPizza`, `qte`) VALUES
(1, 'CAL1', 123),
(1, 'ISA2', 1),
(1, 'PAY2', 1),
(2, 'CAL3', 1),
(3, 'NAP1', 2),
(3, 'PAY2', 1),
(4, 'CAL2', 1),
(4, 'FRU2', 1),
(5, 'FRU1', 1),
(5, 'PAY1', 2),
(5, 'PAY2', 1),
(6, 'CAL1', 1),
(6, 'ISA1', 3),
(7, 'FRU1', 2),
(7, 'NAP1', 3),
(8, 'PAY2', 2),
(9, 'ISA1', 6),
(10, 'CAL1', 4),
(10, 'CAL2', 1),
(10, 'CAL3', 3),
(10, 'FRU2', 5),
(10, 'NAP2', 2),
(11, 'CAL1', 4),
(11, 'CAL3', 3),
(11, 'ISA1', 1),
(11, 'NAP1', 5),
(12, 'CAL1', 4),
(12, 'CAL3', 2),
(12, 'FRU2', 5),
(12, 'ISA2', 2);

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

CREATE TABLE IF NOT EXISTS `livreurs` (
  `numLiv` int(3) NOT NULL,
  `nomLiv` varchar(20) NOT NULL,
  PRIMARY KEY (`numLiv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livreurs`
--

INSERT INTO `livreurs` (`numLiv`, `nomLiv`) VALUES
(1, 'AURADE'),
(2, 'CHAMPEX'),
(3, 'COMBIN'),
(4, 'MERVILLE');

-- --------------------------------------------------------

--
-- Structure de la table `pizzas`
--

CREATE TABLE IF NOT EXISTS `pizzas` (
  `numPiz` varchar(4) NOT NULL,
  `nomPiz` varchar(20) NOT NULL,
  `nbPers` int(3) NOT NULL,
  `prix` int(5) NOT NULL,
  PRIMARY KEY (`numPiz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pizzas`
--

INSERT INTO `pizzas` (`numPiz`, `nomPiz`, `nbPers`, `prix`) VALUES
('CAL1', 'CALZONE', 1, 7),
('CAL2', 'CALZONE', 2, 13),
('CAL3', 'CALZONE', 4, 23),
('FRU1', 'FRUIT DE MER', 1, 8),
('FRU2', 'FRUIT DE MER', 2, 13),
('ISA1', 'ISABELLA', 1, 7),
('ISA2', 'ISABELLA', 2, 12),
('NAP1', 'NAPOLITAINE', 1, 7),
('NAP2', 'NAPOLITAINE', 2, 13),
('PAY1', 'PAYSANNE', 1, 6),
('PAY2', 'PAYSANNE', 2, 11),
('Test', 'Test SIO', 4, 11);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
