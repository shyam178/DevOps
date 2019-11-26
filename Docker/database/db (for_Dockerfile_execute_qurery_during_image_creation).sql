GRANT ALL PRIVILEGES ON *.* TO 'hexwave'@'%';
FLUSH PRIVILEGES;

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `hexwave`;
CREATE DATABASE `hexwave` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hexwave`;

DROP TABLE IF EXISTS `threat_configuration`;
CREATE TABLE `threat_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anomaly` bit(1) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `no_objects` bit(1) DEFAULT NULL,
  `no_threat_config` varchar(255) DEFAULT NULL,
  `non_threat_cellphone` varchar(255) DEFAULT NULL,
  `non_threat_keys` varchar(255) DEFAULT NULL,
  `threat_handgun` varchar(255) DEFAULT NULL,
  `threat_pipe_bomb` varchar(255) DEFAULT NULL,
  `threat_rifle` varchar(255) DEFAULT NULL,
  `threat_status` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP DATABASE IF EXISTS `hexwave_device_setting`;
CREATE DATABASE `hexwave_device_setting` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hexwave_device_setting`;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_timestamp` datetime(6) DEFAULT NULL,
  `update_timestamp` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `customer`;
INSERT INTO `customer` (`id`, `creation_timestamp`, `update_timestamp`, `email`, `name`) VALUES
(1,	'2019-09-05 13:48:00.000000',	'2019-09-05 13:48:00.000000',	'Test.Hexwave@example.com',	'Hexwave');

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_timestamp` datetime(6) DEFAULT NULL,
  `update_timestamp` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrmcl7u2ulopsr8he496bvu07f` (`customer_id`),
  CONSTRAINT `FKrmcl7u2ulopsr8he496bvu07f` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `location`;
INSERT INTO `location` (`id`, `creation_timestamp`, `update_timestamp`, `name`, `customer_id`) VALUES
(1,	'2019-09-05 13:48:24.000000',	'2019-09-05 13:48:24.000000',	'Hexwave',	1);

DROP TABLE IF EXISTS `entrance`;
CREATE TABLE `entrance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_timestamp` datetime(6) DEFAULT NULL,
  `update_timestamp` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe1qmu7o15qgqtdo4ews4ygc3m` (`location_id`),
  CONSTRAINT `FKe1qmu7o15qgqtdo4ews4ygc3m` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `entrance`;
INSERT INTO `entrance` (`id`, `creation_timestamp`, `update_timestamp`, `name`, `location_id`) VALUES
(1,	'2019-09-05 13:48:46.000000',	'2019-09-05 13:48:46.000000',	'Gate A',	1),
(2,	'2019-09-05 13:48:52.000000',	'2019-09-05 13:48:52.000000',	'Gate B',	1),
(3,	'2019-09-05 13:48:55.000000',	'2019-09-05 13:48:55.000000',	'Gate C',	1),
(4,	'2019-09-05 13:48:59.000000',	'2019-09-05 13:48:59.000000',	'Gate D',	1);

DROP DATABASE IF EXISTS `hexwave_oauth`;
CREATE DATABASE `hexwave_oauth` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hexwave_oauth`;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `role`;
INSERT INTO `role` (`id`, `creation_date`, `update_date`, `name`) VALUES
(1,	'2019-09-05 13:49:55.000000',	'2019-09-05 13:49:55.000000',	'Basic'),
(2,	'2019-09-05 13:50:00.000000',	'2019-09-05 13:50:00.000000',	'Advance');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiry_timestamp` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `logged_in` bit(1) DEFAULT NULL,
  `logged_in_device` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `user`;
INSERT INTO `user` (`id`, `creation_date`, `update_date`, `email`, `expiry_timestamp`, `first_name`, `last_name`, `logged_in`, `logged_in_device`, `password`, `role_id`) VALUES
(3,	'2019-09-05 13:51:10.000000',	'2019-09-19 05:03:51.000000',	'basic.user@example.com',	1567777870480,	'Basic',	'User',	CONV('0', 2, 10) + 0,	null,	'MTIzNA==',	1),
(4,	'2019-09-05 13:52:16.000000',	'2019-09-20 09:20:46.000000',	'advance.user@example.com',	1570456336992,	'Advance',	'User',	CONV('0', 2, 10) + 0,	null,	'MTIzNA==',	2);



