-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema core_project
--

CREATE DATABASE IF NOT EXISTS core_project;
USE core_project;

--
-- Definition of table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `uom_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `photo` varchar(345) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`,`name`,`uom_id`,`category_id`,`type_id`,`manufacturer`,`barcode`,`photo`,`description`) VALUES 
 (1,'Monitor',1,1,1,'Sony','1001','1.jpg','na'),
 (2,'RAM',1,2,1,'Sony','1002','','Na');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


--
-- Definition of table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_category`
--

/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` (`id`,`name`) VALUES 
 (1,'None'),
 (2,'Category1'),
 (3,'Category2');
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;


--
-- Definition of table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
CREATE TABLE `item_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`id`,`name`) VALUES 
 (1,'Raw Material'),
 (2,'Consumable Item'),
 (3,'Manufactured Item'),
 (4,'Service');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;


--
-- Definition of table `item_uom`
--

DROP TABLE IF EXISTS `item_uom`;
CREATE TABLE `item_uom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_uom`
--

/*!40000 ALTER TABLE `item_uom` DISABLE KEYS */;
INSERT INTO `item_uom` (`id`,`name`) VALUES 
 (1,'piece'),
 (2,'kg'),
 (3,'gm'),
 (4,'li'),
 (5,'m'),
 (6,'sft');
/*!40000 ALTER TABLE `item_uom` ENABLE KEYS */;


--
-- Definition of table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`,`order_id`,`item_id`,`qty`,`price`) VALUES 
 (1,1,1,1,10),
 (2,1,4,1,6),
 (3,2,1,1,10),
 (4,2,2,1,5),
 (5,2,4,4,6),
 (6,2,5,2,2),
 (7,3,2,4,5),
 (8,3,5,3,2),
 (9,3,1,5,10),
 (10,4,2,2,5),
 (11,4,4,2,6);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;


--
-- Definition of table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `shipping_address` text,
  `remark` text,
  `order_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_master`
--

/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` (`id`,`customer_name`,`shipping_address`,`remark`,`order_datetime`,`payment_method`,`email`) VALUES 
 (1,'Samiha Islam','Australia','test','2017-12-11 15:42:04','VISA Card',NULL),
 (2,'Jahidul Islam','Rampura','test','2017-12-11 15:44:42','Master Card',NULL),
 (3,'Ruhul Amin','Mohammadpur','test','2017-12-11 16:12:37','Cupon',NULL),
 (4,'Mizanur Rahman','Dhanmondi','Test','2017-12-11 16:30:55','Master Card',NULL);
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`name`) VALUES 
 (2,'Admin'),
 (3,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`username`,`password`,`inactive`,`role_id`) VALUES 
 (5,'rony','21232f297a57a5a743894a0e4a801fc3',0,2),
 (10,'Jahid','96e79218965eb72c92a549dd5a330112',0,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
