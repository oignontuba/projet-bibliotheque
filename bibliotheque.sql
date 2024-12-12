-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 11:07 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bibliotheque`
--

-- --------------------------------------------------------

--
-- Table structure for table `adherents`
--

CREATE TABLE IF NOT EXISTS `adherents` (
  `ID_Adherent` varchar(11) NOT NULL,
  `Nom` varchar(64) NOT NULL,
  `Prenom` varchar(64) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Date_adhesion` date NOT NULL,
  `Adresse` varchar(64) NOT NULL,
  `Num_tel` int(11) NOT NULL,
  `mail` varchar(64) NOT NULL,
  PRIMARY KEY (`ID_Adherent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adherents`
--

INSERT INTO `adherents` (`ID_Adherent`, `Nom`, `Prenom`, `Date_naissance`, `Date_adhesion`, `Adresse`, `Num_tel`, `mail`) VALUES
('1', 'Dupont', 'Marie', '1990-05-12', '2023-03-15', '123 Rue Lafayette Paris', 612345678, 'marie.dupont@example.com'),
('2', 'Bernard', 'Thomas', '1985-09-28', '2022-06-10', '45 Avenue des Champs Lyon', 698765432, 'thomas.bernard@example.com'),
('3', 'Martin', 'Sophie', '1992-11-03', '2021-08-20', '78 Boulevard Haussmann Marseille', 745678912, 'sophie.martin@example.com'),
('4', 'Leroy', 'Julien', '2000-02-14', '2023-01-05', '9 Place de la République Lille', 677889911, 'julien.leroy@example.com'),
('5', 'Petit', 'Claire', '1995-07-22', '2020-11-25', '56 Rue de la Paix Bordeaux', 711223344, 'claire.petit@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `ID_Auteur` varchar(11) NOT NULL,
  `Nom` varchar(64) NOT NULL,
  `Prenom` varchar(64) NOT NULL,
  `Date_naissance` date NOT NULL,
  PRIMARY KEY (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`ID_Auteur`, `Nom`, `Prenom`, `Date_naissance`) VALUES
('1', 'JK', 'Rowling', '1965-07-31'),
('2', 'George RR', 'Martin', '1948-09-20'),
('3', 'Sir Arthur', 'Conan Doyle', '1859-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `emprunts`
--

CREATE TABLE IF NOT EXISTS `emprunts` (
  `ID_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `Date_emprunt` date NOT NULL,
  `Duree` int(11) NOT NULL,
  `ID_Adherent` varchar(11) NOT NULL,
  `Reference_livre` varchar(120) NOT NULL,
  PRIMARY KEY (`ID_emprunt`),
  KEY `ID_Adherent` (`ID_Adherent`,`Reference_livre`),
  KEY `ID_Adherent_2` (`ID_Adherent`),
  KEY `ID_Adherent_3` (`ID_Adherent`),
  KEY `ID_Adherent_4` (`ID_Adherent`),
  KEY `Reference_livre` (`Reference_livre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `emprunts`
--

INSERT INTO `emprunts` (`ID_emprunt`, `Date_emprunt`, `Duree`, `ID_Adherent`, `Reference_livre`) VALUES
(1, '2024-01-05', 14, '1', 'Harry Potter et l''Ordre du Phénix'),
(2, '2024-02-10', 7, '2', 'Le Chien des Baskerville'),
(3, '2024-02-15', 21, '3', 'La Bataille des Rois'),
(4, '2024-03-01', 14, '4', 'Harry Potter et les Reliques de la Mort');

-- --------------------------------------------------------

--
-- Table structure for table `livres`
--

CREATE TABLE IF NOT EXISTS `livres` (
  `Reference_livre` varchar(120) NOT NULL,
  `Nbre_pages` int(4) NOT NULL,
  `ID_Auteur` varchar(11) NOT NULL,
  `Date_publication` date NOT NULL,
  `Genre` varchar(11) NOT NULL,
  `Disponibilite` tinyint(1) NOT NULL,
  `Nbre_emprunts` int(11) NOT NULL,
  `Etat` varchar(11) NOT NULL,
  `Nbre_exemplaire` int(10) NOT NULL,
  PRIMARY KEY (`Reference_livre`),
  KEY `ID_Auteur` (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livres`
--

INSERT INTO `livres` (`Reference_livre`, `Nbre_pages`, `ID_Auteur`, `Date_publication`, `Genre`, `Disponibilite`, `Nbre_emprunts`, `Etat`, `Nbre_exemplaire`) VALUES
('Harry Potter à l''école des sorciers', 309, '1', '1997-06-26', 'Fantastique', 1, 120, 'Bon', 10),
('Harry Potter et l''Ordre du Phénix', 870, '1', '2003-06-21', 'Fantastique', 0, 80, 'Bon', 4),
('Harry Potter et la Chambre des secrets', 341, '1', '1998-07-02', 'Fantastique', 1, 110, 'Bon', 8),
('Harry Potter et la Coupe de feu', 734, '1', '2000-07-08', 'Fantastique', 1, 90, 'Bon', 5),
('Harry Potter et le Prince de Sang-Mêlé', 652, '1', '2005-07-16', 'Fantastique', 1, 70, 'Bon', 6),
('Harry Potter et le Prisonnier d Azkaban', 435, '1', '1999-07-08', 'Fantastique', 1, 100, 'Bon', 7),
('Harry Potter et les Reliques de la Mort', 759, '1', '2007-07-21', 'Fantastique', 0, 65, 'Bon', 5),
('L''Ombre Maléfique', 753, '3', '2005-10-17', 'Fantastique', 1, 120, 'Bon', 6),
('La Bataille des Rois', 973, '3', '2000-08-08', 'Fantastique', 0, 130, 'Bon', 6),
('La VallÃ©e de la Peur', 320, '2', '1915-02-27', 'Policier', 1, 25, 'Bon', 3),
('Le Chien des Baskerville', 256, '2', '1902-04-01', 'Policier', 0, 45, 'Bon', 3),
('Le Donjon Rouge', 768, '3', '1998-11-16', 'Fantastique', 1, 140, 'Bon', 7),
('Le Retour de Sherlock Holmes', 320, '2', '1905-03-01', 'Policier', 1, 30, 'Bon', 5),
('Le Signe des Quatre', 209, '2', '1890-02-14', 'Policier', 1, 35, 'Bon', 4),
('Le Trône de Fer', 694, '3', '1996-08-06', 'Fantastique', 1, 150, 'Bon', 8),
('Les Aventures de Sherlock Holmes', 307, '2', '1892-10-14', 'Policier', 1, 50, 'Bon', 6),
('Les Dragons de Meereen', 450, '3', '2014-10-15', 'Fantastique', 1, 50, 'Bon', 4),
('Une Danse avec les Dragons', 1056, '3', '2011-07-12', 'Fantastique', 1, 110, 'Bon', 5),
('Une Étude en Rouge', 188, '2', '1887-11-01', 'Policier', 1, 40, 'Bon', 5),
('Une Place à Prendre', 503, '1', '2012-09-27', 'Drame', 1, 20, 'Moyen', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`ID_Adherent`) REFERENCES `adherents` (`ID_Adherent`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`Reference_livre`) REFERENCES `livres` (`Reference_livre`);

--
-- Constraints for table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteur` (`ID_Auteur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
