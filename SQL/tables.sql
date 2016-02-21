-- Created by dropchopdrop (non-commercial use)
-- Credited to Jorani
-- @license      http://opensource.org/licenses/AGPL-3.0 AGPL-3.0
-- @copyright  Copyright (c) 2014-2016 Benjamin BALET

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Structure of table `users`
--
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `login` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `role` int(11) DEFAULT NULL,  
  `manager` int(11) DEFAULT NULL COMMENT 'Supervisor id',
  `organization` int(11) DEFAULT NULL COMMENT 'Department',
  `position` int(11) NOT NULL COMMENT 'Title',
  `datehired` date DEFAULT NULL COMMENT 'Date hired / Started',
  `active` bool DEFAULT TRUE COMMENT 'Is user active',
  PRIMARY KEY (`id`),
  KEY `manager` (`manager`),
  KEY `organization` (`organization`),
  KEY `position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Content of table `users`
--
INSERT INTO `users` (`id`, `firstname`, `lastname`, `login`, `email`, `password`, `role`, `manager`, `organization`, `position`, `datehired`) VALUES
(1, 'Admin', 'Admin', 'root', 'donotreply@gmail.com', 'root1234', 8,  NULL, NULL, 1, '2016-01-01');

--
-- Structure of table `roles`
--
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Content of table `roles`
--
INSERT INTO `roles` (`id`, `name`) VALUES
(2, 'user'),
(6, 'supervisor'),
(8, 'HR admin - Superadmin');

--
-- Structure of table `types`
--
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Content of table `types`
--
INSERT INTO `types` (`id`, `name`) VALUES
(0, 'compensate'),
(1, 'paid leave'),
(2, 'maternity leave'),
(3, 'paternity leave'),
(4, 'special leave'),
(5, 'Sick leave');

--
-- Structure of table `time`
--
CREATE TABLE IF NOT EXISTS `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier of the time declaration',
  `datetime` datetime NOT NULL COMMENT 'date start',
  `duration` int(11) NOT NULL COMMENT 'duration in minutes',
  `activity` int(11) NOT NULL COMMENT 'activity identifier',
  `employee` int(11) NOT NULL COMMENT 'employee identifier',
  PRIMARY KEY (`id`),
  KEY `activity` (`activity`,`employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Time spent by employees' AUTO_INCREMENT=1 ;

--
-- Structure of table `status`
--
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Content of table `status`
--
INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Planned'),
(2, 'Requested'),
(3, 'Accepted'),
(4, 'Rejected');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
