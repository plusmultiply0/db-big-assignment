-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: banddb
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ablumfanst`
--

DROP TABLE IF EXISTS `ablumfanst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ablumfanst` (
  `fno` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  KEY `fno` (`fno`),
  KEY `ano` (`ano`),
  CONSTRAINT `ablumfanst_ibfk_1` FOREIGN KEY (`fno`) REFERENCES `fanst` (`fno`),
  CONSTRAINT `ablumfanst_ibfk_2` FOREIGN KEY (`ano`) REFERENCES `albumt` (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ablumfanst`
--

LOCK TABLES `ablumfanst` WRITE;
/*!40000 ALTER TABLE `ablumfanst` DISABLE KEYS */;
INSERT INTO `ablumfanst` VALUES (10,1),(9,2),(8,3),(7,4),(6,5),(5,5),(4,4),(3,2);
/*!40000 ALTER TABLE `ablumfanst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ablumfanstfor3`
--

DROP TABLE IF EXISTS `ablumfanstfor3`;
/*!50001 DROP VIEW IF EXISTS `ablumfanstfor3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ablumfanstfor3` AS SELECT 
 1 AS `fno`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `albumt`
--

DROP TABLE IF EXISTS `albumt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `albumt` (
  `ano` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) DEFAULT NULL,
  `apublishtime` date DEFAULT NULL,
  `aband` int(11) DEFAULT NULL,
  PRIMARY KEY (`ano`),
  KEY `aband` (`aband`),
  CONSTRAINT `albumt_ibfk_1` FOREIGN KEY (`aband`) REFERENCES `bandt` (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumt`
--

LOCK TABLES `albumt` WRITE;
/*!40000 ALTER TABLE `albumt` DISABLE KEYS */;
INSERT INTO `albumt` VALUES (2,'Euphoniummusic','2015-06-30',2),(3,'BanGmusic','2019-01-03',3),(4,'WHITEmusic','2013-10-05',4),(5,'Aprilmusic','2014-10-09',5),(6,'konmusic','2009-04-02',1);
/*!40000 ALTER TABLE `albumt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `albumtfor1`
--

DROP TABLE IF EXISTS `albumtfor1`;
/*!50001 DROP VIEW IF EXISTS `albumtfor1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `albumtfor1` AS SELECT 
 1 AS `ano`,
 1 AS `aname`,
 1 AS `apublishtime`,
 1 AS `aband`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bandfanst`
--

DROP TABLE IF EXISTS `bandfanst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bandfanst` (
  `fno` int(11) DEFAULT NULL,
  `bno` int(11) DEFAULT NULL,
  KEY `bno` (`bno`),
  KEY `fno` (`fno`),
  CONSTRAINT `bandfanst_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `bandt` (`bno`),
  CONSTRAINT `bandfanst_ibfk_2` FOREIGN KEY (`fno`) REFERENCES `fanst` (`fno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandfanst`
--

LOCK TABLES `bandfanst` WRITE;
/*!40000 ALTER TABLE `bandfanst` DISABLE KEYS */;
INSERT INTO `bandfanst` VALUES (1,5),(2,4),(3,3),(4,2),(5,1),(6,1),(7,2),(8,3);
/*!40000 ALTER TABLE `bandfanst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bandfanstfor1`
--

DROP TABLE IF EXISTS `bandfanstfor1`;
/*!50001 DROP VIEW IF EXISTS `bandfanstfor1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bandfanstfor1` AS SELECT 
 1 AS `fno`,
 1 AS `bno`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bandfanstfor3`
--

DROP TABLE IF EXISTS `bandfanstfor3`;
/*!50001 DROP VIEW IF EXISTS `bandfanstfor3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bandfanstfor3` AS SELECT 
 1 AS `fno`,
 1 AS `bno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bandmenbert`
--

DROP TABLE IF EXISTS `bandmenbert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bandmenbert` (
  `bno` int(11) DEFAULT NULL,
  `mno` int(11) DEFAULT NULL,
  UNIQUE KEY `mno` (`mno`),
  KEY `bno` (`bno`),
  CONSTRAINT `bandmenbert_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `bandt` (`bno`),
  CONSTRAINT `bandmenbert_ibfk_2` FOREIGN KEY (`mno`) REFERENCES `menbert` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandmenbert`
--

LOCK TABLES `bandmenbert` WRITE;
/*!40000 ALTER TABLE `bandmenbert` DISABLE KEYS */;
INSERT INTO `bandmenbert` VALUES (1,1),(1,2),(1,3),(1,4),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(4,15),(4,16),(4,17),(5,18),(5,19),(5,20),(5,21),(1,5);
/*!40000 ALTER TABLE `bandmenbert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_bandmember` AFTER INSERT ON `bandmenbert` FOR EACH ROW BEGIN
    UPDATE bandt set bsum=bsum+1 WHERE bno=new.bno;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reduce_bandmember` AFTER DELETE ON `bandmenbert` FOR EACH ROW BEGIN
    UPDATE bandt set bsum=bsum-1 WHERE bno=old.bno;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bandmenbertfor1`
--

DROP TABLE IF EXISTS `bandmenbertfor1`;
/*!50001 DROP VIEW IF EXISTS `bandmenbertfor1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bandmenbertfor1` AS SELECT 
 1 AS `bno`,
 1 AS `mno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bandt`
--

DROP TABLE IF EXISTS `bandt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bandt` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(30) DEFAULT NULL,
  `bfound` date DEFAULT NULL,
  `bleader` int(11) DEFAULT NULL,
  `bsum` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`bno`),
  UNIQUE KEY `bleader` (`bleader`),
  CONSTRAINT `bandt_ibfk_1` FOREIGN KEY (`bleader`) REFERENCES `menbert` (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandt`
--

LOCK TABLES `bandt` WRITE;
/*!40000 ALTER TABLE `bandt` DISABLE KEYS */;
INSERT INTO `bandt` VALUES (1,'kno','2009-04-02',1,5),(2,'Euphonium','2015-06-30',6,5),(3,'BanG','2019-01-03',11,4),(4,'WHITE','2013-10-05',17,3),(5,'April','2014-10-09',18,4);
/*!40000 ALTER TABLE `bandt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bandtfor1`
--

DROP TABLE IF EXISTS `bandtfor1`;
/*!50001 DROP VIEW IF EXISTS `bandtfor1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bandtfor1` AS SELECT 
 1 AS `bno`,
 1 AS `bname`,
 1 AS `bfound`,
 1 AS `bleader`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fanst`
--

DROP TABLE IF EXISTS `fanst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fanst` (
  `fno` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `fsex` char(10) DEFAULT NULL,
  `fage` int(11) DEFAULT NULL,
  PRIMARY KEY (`fno`),
  CONSTRAINT `fanst_chk_1` CHECK (((`fage` >= 0) and (`fage` <= 200)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fanst`
--

LOCK TABLES `fanst` WRITE;
/*!40000 ALTER TABLE `fanst` DISABLE KEYS */;
INSERT INTO `fanst` VALUES (1,'安德烈','male',28),(2,'武田绫乃','female',18),(3,'藤本树','male',9),(4,'白非立','male',20),(5,'陈睿','male',38),(6,'麻枝准','male',48),(7,'露娜','female',21),(8,'佩洛','male',57),(9,'纳什','male',15),(10,'金田一','male',37);
/*!40000 ALTER TABLE `fanst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fanstfor3`
--

DROP TABLE IF EXISTS `fanstfor3`;
/*!50001 DROP VIEW IF EXISTS `fanstfor3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `fanstfor3` AS SELECT 
 1 AS `fno`,
 1 AS `fname`,
 1 AS `fsex`,
 1 AS `fage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `memberfanst`
--

DROP TABLE IF EXISTS `memberfanst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `memberfanst` (
  `fno` int(11) DEFAULT NULL,
  `mno` int(11) DEFAULT NULL,
  KEY `fno` (`fno`),
  KEY `mno` (`mno`),
  CONSTRAINT `memberfanst_ibfk_1` FOREIGN KEY (`fno`) REFERENCES `fanst` (`fno`),
  CONSTRAINT `memberfanst_ibfk_2` FOREIGN KEY (`mno`) REFERENCES `menbert` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberfanst`
--

LOCK TABLES `memberfanst` WRITE;
/*!40000 ALTER TABLE `memberfanst` DISABLE KEYS */;
INSERT INTO `memberfanst` VALUES (1,1),(3,6),(5,11),(7,15),(9,18),(2,5),(4,8),(6,16),(8,17),(10,18),(3,7),(6,19),(9,21);
/*!40000 ALTER TABLE `memberfanst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `memberfanstfor3`
--

DROP TABLE IF EXISTS `memberfanstfor3`;
/*!50001 DROP VIEW IF EXISTS `memberfanstfor3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `memberfanstfor3` AS SELECT 
 1 AS `fno`,
 1 AS `mno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menbert`
--

DROP TABLE IF EXISTS `menbert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menbert` (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) DEFAULT NULL,
  `mjointime` date DEFAULT NULL,
  `mleavetime` date DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menbert`
--

LOCK TABLES `menbert` WRITE;
/*!40000 ALTER TABLE `menbert` DISABLE KEYS */;
INSERT INTO `menbert` VALUES (1,'平沢唯','2009-04-02',NULL),(2,'秋山澪','2009-04-02',NULL),(3,'田井中律','2009-04-02',NULL),(4,'琴吹䌷','2009-04-02',NULL),(5,'中野梓','2009-04-02',NULL),(6,'黄前久美子','2015-06-30',NULL),(7,'加藤叶月','2015-06-30',NULL),(8,'高坂丽奈','2015-06-30',NULL),(9,'田中明日香','2015-06-30',NULL),(10,'川岛绿辉','2015-06-30',NULL),(11,'户山香澄','2019-01-03',NULL),(12,'花园多惠','2019-01-03',NULL),(13,'牛迂里美','2019-01-03',NULL),(14,'山吹沙绫','2019-01-03',NULL),(15,'小木曾雪菜','2013-10-05',NULL),(16,'冬马和纱','2013-10-05',NULL),(17,'北原春希','2013-10-05',NULL),(18,'有马公生','2014-10-09',NULL),(19,'宫园薰','2014-10-09',NULL),(20,'泽部椿','2014-10-09',NULL),(21,'渡亮太','2014-10-09',NULL),(22,'工具人','2020-12-31',NULL);
/*!40000 ALTER TABLE `menbert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playst`
--

DROP TABLE IF EXISTS `playst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playst` (
  `bno` int(11) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  KEY `bno` (`bno`),
  KEY `sno` (`sno`),
  CONSTRAINT `playst_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `bandt` (`bno`),
  CONSTRAINT `playst_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `songst` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playst`
--

LOCK TABLES `playst` WRITE;
/*!40000 ALTER TABLE `playst` DISABLE KEYS */;
INSERT INTO `playst` VALUES (2,1),(3,2),(4,3),(5,4),(3,5),(4,2),(1,5),(1,4);
/*!40000 ALTER TABLE `playst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `playstfor1`
--

DROP TABLE IF EXISTS `playstfor1`;
/*!50001 DROP VIEW IF EXISTS `playstfor1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `playstfor1` AS SELECT 
 1 AS `bno`,
 1 AS `sno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `songfanst`
--

DROP TABLE IF EXISTS `songfanst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `songfanst` (
  `fno` int(11) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  KEY `fno` (`fno`),
  KEY `sno` (`sno`),
  CONSTRAINT `songfanst_ibfk_1` FOREIGN KEY (`fno`) REFERENCES `fanst` (`fno`),
  CONSTRAINT `songfanst_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `songst` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songfanst`
--

LOCK TABLES `songfanst` WRITE;
/*!40000 ALTER TABLE `songfanst` DISABLE KEYS */;
INSERT INTO `songfanst` VALUES (10,1),(9,2),(8,3),(7,4),(6,5),(5,5),(4,4),(3,3),(2,2),(1,1);
/*!40000 ALTER TABLE `songfanst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `songfanstfor3`
--

DROP TABLE IF EXISTS `songfanstfor3`;
/*!50001 DROP VIEW IF EXISTS `songfanstfor3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `songfanstfor3` AS SELECT 
 1 AS `fno`,
 1 AS `sno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `songst`
--

DROP TABLE IF EXISTS `songst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `songst` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(30) DEFAULT NULL,
  `sablum` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `sablum` (`sablum`),
  CONSTRAINT `songst_ibfk_1` FOREIGN KEY (`sablum`) REFERENCES `albumt` (`ano`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songst`
--

LOCK TABLES `songst` WRITE;
/*!40000 ALTER TABLE `songst` DISABLE KEYS */;
INSERT INTO `songst` VALUES (1,'song1',5),(2,'song2',4),(3,'song3',3),(4,'song4',2),(5,'song5',1);
/*!40000 ALTER TABLE `songst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ablumfanstfor3`
--

/*!50001 DROP VIEW IF EXISTS `ablumfanstfor3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ablumfanstfor3` AS select `ablumfanst`.`fno` AS `fno`,`ablumfanst`.`ano` AS `ano` from `ablumfanst` where (`ablumfanst`.`fno` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `albumtfor1`
--

/*!50001 DROP VIEW IF EXISTS `albumtfor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `albumtfor1` AS select `albumt`.`ano` AS `ano`,`albumt`.`aname` AS `aname`,`albumt`.`apublishtime` AS `apublishtime`,`albumt`.`aband` AS `aband` from `albumt` where (`albumt`.`aband` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bandfanstfor1`
--

/*!50001 DROP VIEW IF EXISTS `bandfanstfor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bandfanstfor1` AS select `bandfanst`.`fno` AS `fno`,`bandfanst`.`bno` AS `bno` from `bandfanst` where (`bandfanst`.`bno` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bandfanstfor3`
--

/*!50001 DROP VIEW IF EXISTS `bandfanstfor3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bandfanstfor3` AS select `bandfanst`.`fno` AS `fno`,`bandfanst`.`bno` AS `bno` from `bandfanst` where (`bandfanst`.`fno` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bandmenbertfor1`
--

/*!50001 DROP VIEW IF EXISTS `bandmenbertfor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bandmenbertfor1` AS select `bandmenbert`.`bno` AS `bno`,`bandmenbert`.`mno` AS `mno` from `bandmenbert` where (`bandmenbert`.`bno` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bandtfor1`
--

/*!50001 DROP VIEW IF EXISTS `bandtfor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bandtfor1` AS select `bandt`.`bno` AS `bno`,`bandt`.`bname` AS `bname`,`bandt`.`bfound` AS `bfound`,`bandt`.`bleader` AS `bleader` from `bandt` where (`bandt`.`bno` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fanstfor3`
--

/*!50001 DROP VIEW IF EXISTS `fanstfor3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fanstfor3` AS select `fanst`.`fno` AS `fno`,`fanst`.`fname` AS `fname`,`fanst`.`fsex` AS `fsex`,`fanst`.`fage` AS `fage` from `fanst` where (`fanst`.`fno` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memberfanstfor3`
--

/*!50001 DROP VIEW IF EXISTS `memberfanstfor3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `memberfanstfor3` AS select `memberfanst`.`fno` AS `fno`,`memberfanst`.`mno` AS `mno` from `memberfanst` where (`memberfanst`.`fno` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playstfor1`
--

/*!50001 DROP VIEW IF EXISTS `playstfor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playstfor1` AS select `playst`.`bno` AS `bno`,`playst`.`sno` AS `sno` from `playst` where (`playst`.`bno` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songfanstfor3`
--

/*!50001 DROP VIEW IF EXISTS `songfanstfor3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songfanstfor3` AS select `songfanst`.`fno` AS `fno`,`songfanst`.`sno` AS `sno` from `songfanst` where (`songfanst`.`fno` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-31 21:14:15
