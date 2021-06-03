-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mobile_catalog
CREATE DATABASE IF NOT EXISTS `mobile_catalog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mobile_catalog`;

-- Dumping structure for table mobile_catalog.administrator
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mobile_catalog.administrator: ~2 rows (approximately)
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password`) VALUES
	(1, 'admin1', '123'),
	(2, 'marko', 'markobg');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

-- Dumping structure for table mobile_catalog.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mobile_catalog.category: ~2 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`) VALUES
	(1, 'Smart phone'),
	(2, 'Standard phone');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table mobile_catalog.comunication_standard
CREATE TABLE IF NOT EXISTS `comunication_standard` (
  `comunication_standard_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`comunication_standard_id`) USING BTREE,
  UNIQUE KEY `uq_comunication_standard_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mobile_catalog.comunication_standard: ~4 rows (approximately)
/*!40000 ALTER TABLE `comunication_standard` DISABLE KEYS */;
INSERT INTO `comunication_standard` (`comunication_standard_id`, `name`) VALUES
	(1, '3G'),
	(2, '4G'),
	(3, 'GSM'),
	(4, 'LTE');
/*!40000 ALTER TABLE `comunication_standard` ENABLE KEYS */;

-- Dumping structure for table mobile_catalog.mobile
CREATE TABLE IF NOT EXISTS `mobile` (
  `mobile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `image_path` varchar(50) NOT NULL,
  `price` int(50) unsigned NOT NULL,
  `operating_system` varchar(50) NOT NULL,
  `ram` int(50) unsigned NOT NULL,
  `internal_memory` int(50) unsigned NOT NULL,
  `screen_diagonal` decimal(5,1) unsigned NOT NULL,
  `battery` int(10) unsigned NOT NULL,
  `resolution` varchar(50) NOT NULL,
  `have_front_camera` tinyint(1) unsigned NOT NULL,
  `have_back_camera` tinyint(1) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mobile_id`),
  UNIQUE KEY `uq_mobile_model_name` (`model_name`),
  UNIQUE KEY `uq_mobile_image_path` (`image_path`),
  KEY `fk_mobile_category_id` (`category_id`),
  CONSTRAINT `fk_mobile_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mobile_catalog.mobile: ~6 rows (approximately)
/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
INSERT INTO `mobile` (`mobile_id`, `brand`, `model_name`, `image_path`, `price`, `operating_system`, `ram`, `internal_memory`, `screen_diagonal`, `battery`, `resolution`, `have_front_camera`, `have_back_camera`, `category_id`) VALUES
	(5, 'Lenovo', 'K12', 'img/lenovo-k12.png', 119, 'Android', 4, 64, 6.5, 5000, '720x1600', 1, 1, 1),
	(32, 'Xiaomi', 'Redme Note 7', 'img/xaomi-redmi-note-7.png', 299, 'Android', 6, 64, 6.3, 4000, '2340x1080', 1, 1, 1),
	(36, 'Huawei', 'P50', 'img/huawei-p50.png', 699, 'Android', 8, 256, 6.3, 4000, '1080x2340', 1, 1, 1),
	(40, 'Samsung', 'Galaxy A51', 'img/samsung-galaxy-a51.png', 245, 'Android', 4, 64, 6.5, 4000, '2400x1080', 1, 1, 1),
	(41, 'HTC', 'Wildfire E3', 'img/htc-wild-fire-e3.png', 129, 'Android', 4, 64, 6.5, 4000, '720x1560', 1, 1, 1),
	(42, 'Apple', 'Iphone X', 'img/iphone-x.jpg', 529, 'IOS', 3, 64, 5.8, 2716, '2436x1125', 1, 1, 1);
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;

-- Dumping structure for table mobile_catalog.mobile_comunication_standard
CREATE TABLE IF NOT EXISTS `mobile_comunication_standard` (
  `mobile_comunication_standard_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile_id` int(10) unsigned NOT NULL,
  `comunication_standard_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mobile_comunication_standard_id`),
  KEY `fk_mobile_comunication_standard_mobile_id` (`mobile_id`),
  KEY `fk_mobile_comunication_standard_comunication_standard_id` (`comunication_standard_id`),
  CONSTRAINT `fk_mobile_comunication_standard_comunication_standard_id` FOREIGN KEY (`comunication_standard_id`) REFERENCES `comunication_standard` (`comunication_standard_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mobile_comunication_standard_mobile_id` FOREIGN KEY (`mobile_id`) REFERENCES `mobile` (`mobile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mobile_catalog.mobile_comunication_standard: ~23 rows (approximately)
/*!40000 ALTER TABLE `mobile_comunication_standard` DISABLE KEYS */;
INSERT INTO `mobile_comunication_standard` (`mobile_comunication_standard_id`, `mobile_id`, `comunication_standard_id`) VALUES
	(97, 5, 1),
	(98, 5, 3),
	(99, 5, 4),
	(100, 41, 1),
	(101, 41, 2),
	(102, 41, 3),
	(103, 41, 4),
	(104, 40, 1),
	(105, 40, 2),
	(106, 40, 3),
	(107, 40, 4),
	(108, 32, 1),
	(109, 32, 2),
	(110, 32, 3),
	(111, 32, 4),
	(112, 42, 1),
	(113, 42, 2),
	(114, 42, 3),
	(115, 42, 4),
	(116, 36, 1),
	(117, 36, 2),
	(118, 36, 3),
	(119, 36, 4);
/*!40000 ALTER TABLE `mobile_comunication_standard` ENABLE KEYS */;

-- Dumping structure for view mobile_catalog.view__combined
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view__combined` (
	`mobile_id` INT(10) UNSIGNED NOT NULL,
	`comunication_standard_id` INT(10) UNSIGNED NOT NULL,
	`model_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view mobile_catalog.view__combined
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view__combined`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view__combined` AS SELECT
    mobile.mobile_id,
    comunication_standard.comunication_standard_id,
    mobile.model_name,
    comunication_standard.name
FROM mobile
JOIN mobile_comunication_standard ON mobile.mobile_id = mobile_comunication_standard.mobile_id
JOIN comunication_standard ON comunication_standard.comunication_standard_id = mobile_comunication_standard.comunication_standard_id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
