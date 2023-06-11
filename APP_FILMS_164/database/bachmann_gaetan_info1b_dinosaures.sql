-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.11 - MySQL Community Server (GPL)
-- SE du serveur:                Win32
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour gb_dinosaures_info1b
DROP DATABASE IF EXISTS `gb_dinosaures_info1b`;
CREATE DATABASE IF NOT EXISTS `gb_dinosaures_info1b` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gb_dinosaures_info1b`;

-- Listage de la structure de table gb_dinosaures_info1b. t_dinosaure
DROP TABLE IF EXISTS `t_dinosaure`;
CREATE TABLE IF NOT EXISTS `t_dinosaure` (
  `id_dinosaure` int(11) NOT NULL AUTO_INCREMENT,
  `nom_dinosaure` varchar(25) DEFAULT NULL,
  `type_apprivoisement_dinosaure` varchar(50) DEFAULT NULL,
  `image_dinosaure` blob,
  PRIMARY KEY (`id_dinosaure`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_dinosaure : ~6 rows (environ)
INSERT INTO `t_dinosaure` (`id_dinosaure`, `nom_dinosaure`, `type_apprivoisement_dinosaure`, `image_dinosaure`) VALUES
	(1, 'Dodo', 'KO', NULL),
	(2, 'Moschops', 'passif', NULL),
	(3, 'Triceratops', 'KO', NULL),
	(4, 'Pteranodon', 'KO', NULL),
	(5, 'Basilosaure', 'passif', NULL),
	(6, 'Raptor', 'KO', NULL);

-- Listage de la structure de table gb_dinosaures_info1b. t_dinosaure_mange_nourriture
DROP TABLE IF EXISTS `t_dinosaure_mange_nourriture`;
CREATE TABLE IF NOT EXISTS `t_dinosaure_mange_nourriture` (
  `id_dinosaure_mange_nourriture` int(11) NOT NULL AUTO_INCREMENT,
  `fk_dinosaure` int(11) NOT NULL DEFAULT '0',
  `fk_nourriture` int(11) NOT NULL DEFAULT '0',
  `efficacite_nourriture` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dinosaure_mange_nourriture`),
  KEY `fk_dinosaure` (`fk_dinosaure`),
  KEY `fk_nourriture` (`fk_nourriture`),
  CONSTRAINT `fk_dinosaure_nourriture` FOREIGN KEY (`fk_dinosaure`) REFERENCES `t_dinosaure` (`id_dinosaure`),
  CONSTRAINT `fk_nourriture_dinosaure` FOREIGN KEY (`fk_nourriture`) REFERENCES `t_nourriture` (`id_nourriture`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_dinosaure_mange_nourriture : ~6 rows (environ)
INSERT INTO `t_dinosaure_mange_nourriture` (`id_dinosaure_mange_nourriture`, `fk_dinosaure`, `fk_nourriture`, `efficacite_nourriture`) VALUES
	(1, 1, 4, 3),
	(2, 1, 2, 1),
	(3, 4, 1, 3),
	(4, 2, 2, 2),
	(5, 5, 7, 5),
	(6, 6, 1, 4);

-- Listage de la structure de table gb_dinosaures_info1b. t_mail
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id_mail` int(11) NOT NULL AUTO_INCREMENT,
  `nom_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_mail : ~3 rows (environ)
INSERT INTO `t_mail` (`id_mail`, `nom_mail`) VALUES
	(1, 'gaetan.bachmann@gmail.com'),
	(2, 'quentin.bachmann@gmail.com'),
	(3, 'nael.monnet@eduvaud.ch');

-- Listage de la structure de table gb_dinosaures_info1b. t_nourriture
DROP TABLE IF EXISTS `t_nourriture`;
CREATE TABLE IF NOT EXISTS `t_nourriture` (
  `id_nourriture` int(11) NOT NULL AUTO_INCREMENT,
  `nom_nourriture` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nourriture`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_nourriture : ~7 rows (environ)
INSERT INTO `t_nourriture` (`id_nourriture`, `nom_nourriture`) VALUES
	(1, 'viande crue'),
	(2, 'mejoberry'),
	(3, 'tintoberry'),
	(4, 'amarberry'),
	(5, 'azulberry'),
	(6, 'fleure rare'),
	(7, 'viande de poisson');

-- Listage de la structure de table gb_dinosaures_info1b. t_personne
DROP TABLE IF EXISTS `t_personne`;
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(50) DEFAULT NULL,
  `prenom_personne` varchar(50) DEFAULT NULL,
  `date_naissance_personne` date DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_personne : ~5 rows (environ)
INSERT INTO `t_personne` (`id_personne`, `nom_personne`, `prenom_personne`, `date_naissance_personne`) VALUES
	(1, 'Bachmann', 'Gaetan', '2004-11-08'),
	(2, 'Bachmann', 'Quentin', '2007-08-25'),
	(3, 'Monnet', 'Nael', '2006-02-28'),
	(4, 'Bonzon', 'Keziah', '2007-04-28'),
	(5, 'Casillas', 'Iker', '1999-06-14');

-- Listage de la structure de table gb_dinosaures_info1b. t_personne_apprivoise_dinosaure
DROP TABLE IF EXISTS `t_personne_apprivoise_dinosaure`;
CREATE TABLE IF NOT EXISTS `t_personne_apprivoise_dinosaure` (
  `id_personne_apprivoise_dinosaure` int(11) NOT NULL AUTO_INCREMENT,
  `fk_personne` int(11) DEFAULT NULL,
  `fk_dinosaure` int(11) DEFAULT NULL,
  `date_apprivoisement` datetime DEFAULT NULL,
  PRIMARY KEY (`id_personne_apprivoise_dinosaure`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_dinosaure` (`fk_dinosaure`),
  CONSTRAINT `fk_dinosaure_personne` FOREIGN KEY (`fk_dinosaure`) REFERENCES `t_dinosaure` (`id_dinosaure`),
  CONSTRAINT `fk_personne_dinosaure` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_personne_apprivoise_dinosaure : ~6 rows (environ)
INSERT INTO `t_personne_apprivoise_dinosaure` (`id_personne_apprivoise_dinosaure`, `fk_personne`, `fk_dinosaure`, `date_apprivoisement`) VALUES
	(1, 1, 1, '2023-03-16 08:48:49'),
	(2, 2, 1, '2023-03-15 08:49:18'),
	(3, 3, 2, '2023-02-16 08:49:36'),
	(4, 5, 3, '2023-06-11 21:35:19'),
	(5, 4, 6, '2023-06-03 11:35:34'),
	(6, 1, 5, '2023-02-21 21:36:16');

-- Listage de la structure de table gb_dinosaures_info1b. t_personne_avoir_mail
DROP TABLE IF EXISTS `t_personne_avoir_mail`;
CREATE TABLE IF NOT EXISTS `t_personne_avoir_mail` (
  `id_personne_avoir_mail` int(11) NOT NULL AUTO_INCREMENT,
  `fk_personne` int(11) DEFAULT NULL,
  `fk_mail` int(11) DEFAULT NULL,
  `date_mail` datetime DEFAULT NULL,
  PRIMARY KEY (`id_personne_avoir_mail`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_mail` (`fk_mail`),
  CONSTRAINT `fk_mail_personne` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`),
  CONSTRAINT `fk_personne_mail` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table gb_dinosaures_info1b.t_personne_avoir_mail : ~3 rows (environ)
INSERT INTO `t_personne_avoir_mail` (`id_personne_avoir_mail`, `fk_personne`, `fk_mail`, `date_mail`) VALUES
	(1, 1, 1, '2017-09-12 08:52:52'),
	(2, 2, 2, '2021-06-14 08:53:09'),
	(3, 3, 3, '2022-08-30 08:53:27');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
