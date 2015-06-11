--
-- Table structure for table `constellation`
--

DROP TABLE IF EXISTS `constellation`;
CREATE TABLE `constellation` (
  `con_id` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `nomen` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `messier`
--

DROP TABLE IF EXISTS `messier`;
CREATE TABLE `messier` (
  `id` tinyint(4) NOT NULL,
  `nom` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RA` time NOT NULL,
  `DECL` time NOT NULL,
  `con_id` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `magnitude` decimal(4,2) NOT NULL,
  `type_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `diam` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messier_const` (`con_id`),
  KEY `fk_messier_type` (`type_id`),
  CONSTRAINT `fk_messier_const` FOREIGN KEY (`con_id`) REFERENCES `constellation` (`con_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_messier_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

