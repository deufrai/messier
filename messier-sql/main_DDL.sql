--
-- Table structure for table `constellation`
--
CREATE TABLE `constellation` (
  `c_id` char(3) NOT NULL,
  `c_nomen` varchar(45) NOT NULL,
  `c_nom` varchar(45) NOT NULL,
  `c_name` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `objtype`
--
CREATE TABLE `objtype` (
  `t_id` varchar(10) NOT NULL,
  `t_name` varchar(45) NOT NULL,
  `t_nom` varchar(45) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `messier`
--
CREATE TABLE `messier` (
  `id` tinyint(4) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `RA` time NOT NULL,
  `DECL` time NOT NULL,
  `c_id` char(3) NOT NULL,
  `magnitude` decimal(3,1) NOT NULL,
  `t_id` varchar(10) NOT NULL,
  `diam` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messier_const` (`c_id`),
  KEY `fk_messier_type` (`t_id`),
  CONSTRAINT `fk_messier_const` FOREIGN KEY (`c_id`) REFERENCES `constellation` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_messier_type` FOREIGN KEY (`t_id`) REFERENCES `objtype` (`t_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

