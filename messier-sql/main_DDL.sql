--
-- Table structure for table `constellation`
--
CREATE TABLE `constellation` (
  `c_id` char(3) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB;

--
-- Table structure for table `objtype`
--
CREATE TABLE `objtype` (
  `t_id` varchar(10) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB;


--
-- Table structure for table `constname`
--
CREATE TABLE `constname` (
  `lang` char(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `c_id` char(3) NOT NULL,
  PRIMARY KEY (`lang`,`name`),
  KEY `fk_constname_id` (`c_id`),
  CONSTRAINT `fk_constname_id` FOREIGN KEY (`c_id`) REFERENCES `constellation` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;

--
-- Table structure for table `typename`
--
CREATE TABLE `typename` (
  `lang` char(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `t_id` varchar(10) NOT NULL,
  PRIMARY KEY (`lang`,`name`),
  KEY `fk_typename_type` (`t_id`),
  CONSTRAINT `fk_typename_type` FOREIGN KEY (`t_id`) REFERENCES `objtype` (`t_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;

--
-- Table structure for table `object`
--
CREATE TABLE `object` (
  `o_id` tinyint(4) NOT NULL,
  `RA` time NOT NULL,
  `DECL` time NOT NULL,
  `c_id` char(3) NOT NULL,
  `magnitude` decimal(3,1) NOT NULL,
  `t_id` varchar(10) NOT NULL,
  `diam` time NOT NULL,
  PRIMARY KEY (`o_id`),
  KEY `fk_object_const` (`c_id`),
  KEY `fk_object_type` (`t_id`),
  CONSTRAINT `fk_object_const` FOREIGN KEY (`c_id`) REFERENCES `constellation` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_object_type` FOREIGN KEY (`t_id`) REFERENCES `objtype` (`t_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;

--
-- Table structure for table `objname`
--
CREATE TABLE `objname` (
  `lang` char(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `o_id` tinyint(4) NOT NULL,
  `is_alias` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang`,`name`),
  KEY `fk_objname_object` (`o_id`),
  CONSTRAINT `fk_objname_object` FOREIGN KEY (`o_id`) REFERENCES `object` (`o_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;

