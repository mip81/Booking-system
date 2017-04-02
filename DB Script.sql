CREATE DATABASE  IF NOT EXISTS `ypscs_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ypscs_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ypscs_db
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_artist`
--

DROP TABLE IF EXISTS `tb_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fname` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Firtsname of the artist',
  `lname` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Lastname of the artist',
  `locationid` int(11) DEFAULT NULL COMMENT 'ID of the location',
  `mobile` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Mobile phone''s number',
  `phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Number of landline',
  `salary` int(11) DEFAULT NULL COMMENT 'Salary of the Artist',
  `typecontractid` int(11) DEFAULT NULL COMMENT 'ID of the contract',
  `sdatecontract` datetime DEFAULT NULL COMMENT 'Date the contrat started',
  `edatecontract` datetime DEFAULT NULL COMMENT 'Date the contrat wil end.',
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Email of the ',
  PRIMARY KEY (`id`),
  KEY `locationid` (`locationid`),
  KEY `typecontractid` (`typecontractid`),
  CONSTRAINT `tb_artist_ibfk_1` FOREIGN KEY (`locationid`) REFERENCES `tb_location` (`id`),
  CONSTRAINT `tb_artist_ibfk_2` FOREIGN KEY (`typecontractid`) REFERENCES `tb_typecontract` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_artist`
--

LOCK TABLES `tb_artist` WRITE;
/*!40000 ALTER TABLE `tb_artist` DISABLE KEYS */;
INSERT INTO `tb_artist` VALUES (1,'Maria','Zelenko',1,'87021943330',NULL,0,3,NULL,NULL,NULL),(2,'Anastasiya','Vladimirova',1,'87771010101',NULL,NULL,3,NULL,NULL,NULL),(3,'Ekaterina','Ishmatova',1,'',NULL,NULL,3,NULL,NULL,NULL),(4,'Maxim','Pastushkov',2,'87772844040',NULL,NULL,3,NULL,NULL,NULL),(5,'Anastasiya','Bekbulatova',2,'',NULL,NULL,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_artistprice`
--

DROP TABLE IF EXISTS `tb_artistprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_artistprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `artistid` int(11) NOT NULL COMMENT 'ID of the Artist',
  `procid` int(11) NOT NULL COMMENT 'ID of the Procedure',
  `typeprocid` int(11) NOT NULL COMMENT 'ID  of the ProcType',
  `artprice` int(11) NOT NULL COMMENT 'Price of the artist or percent if the contract',
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'Time that procedure takes in minute',
  PRIMARY KEY (`id`),
  KEY `artistid` (`artistid`),
  KEY `procid` (`procid`),
  KEY `typeprocid` (`typeprocid`),
  CONSTRAINT `tb_artistprice_ibfk_1` FOREIGN KEY (`artistid`) REFERENCES `tb_artist` (`id`),
  CONSTRAINT `tb_artistprice_ibfk_2` FOREIGN KEY (`procid`) REFERENCES `tb_proc` (`id`),
  CONSTRAINT `tb_artistprice_ibfk_3` FOREIGN KEY (`typeprocid`) REFERENCES `tb_typeproc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COMMENT='The table keep information about the payments to Artist for procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_artistprice`
--

LOCK TABLES `tb_artistprice` WRITE;
/*!40000 ALTER TABLE `tb_artistprice` DISABLE KEYS */;
INSERT INTO `tb_artistprice` VALUES (1,1,1,1,50,22000,110),(2,1,2,2,50,11000,110),(3,1,3,1,50,25000,110),(4,1,3,2,50,13500,110),(5,1,4,1,50,25000,110),(6,1,4,2,50,13500,110),(7,1,5,1,48,8000,30),(8,1,5,2,48,5000,30),(9,1,1,2,50,11000,90),(10,1,2,1,50,22000,110),(11,2,1,1,40,20000,110),(12,2,1,2,48,11000,90),(13,2,2,1,40,20000,110),(14,2,2,2,48,11000,90),(15,2,3,1,40,25000,110),(16,2,3,2,48,13000,90),(17,2,4,1,40,25000,110),(18,2,4,2,48,13000,90),(19,2,5,1,48,8000,30),(20,2,5,2,48,5000,30),(30,3,5,1,48,8000,30),(31,3,5,2,48,5000,30),(32,3,1,1,40,20000,110),(33,3,1,2,48,11000,90),(34,3,2,1,40,20000,110),(35,3,2,2,48,11000,90),(36,3,3,1,40,25000,110),(37,3,3,2,48,13000,90),(38,3,4,1,40,25000,110),(39,3,4,2,48,13000,90),(40,4,1,1,50,15000,110),(41,4,1,2,50,10000,90),(42,4,2,1,50,15000,110),(43,4,2,2,50,10000,90),(44,4,3,1,50,15000,110),(45,4,3,2,50,10000,90),(46,4,4,1,50,15000,110),(47,4,4,2,50,10000,90),(48,4,5,1,50,8000,30),(49,5,5,2,50,5000,30),(50,5,1,1,40,15000,110),(51,5,1,2,40,10000,90),(52,5,2,1,40,15000,110),(53,5,2,2,40,10000,90),(54,5,3,1,40,15000,110),(55,5,3,2,40,10000,90),(56,5,4,1,40,15000,110),(57,5,4,2,40,10000,90);
/*!40000 ALTER TABLE `tb_artistprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_city`
--

DROP TABLE IF EXISTS `tb_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `city` varchar(20) NOT NULL COMMENT 'Name of city',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_city`
--

LOCK TABLES `tb_city` WRITE;
/*!40000 ALTER TABLE `tb_city` DISABLE KEYS */;
INSERT INTO `tb_city` VALUES (1,'Aktau'),(2,'Astana');
/*!40000 ALTER TABLE `tb_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_client`
--

DROP TABLE IF EXISTS `tb_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `locationid` int(11) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locationid` (`locationid`),
  CONSTRAINT `tb_client_ibfk_1` FOREIGN KEY (`locationid`) REFERENCES `tb_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COMMENT='The table keep the information about the clients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_client`
--

LOCK TABLES `tb_client` WRITE;
/*!40000 ALTER TABLE `tb_client` DISABLE KEYS */;
INSERT INTO `tb_client` VALUES (1,'Anast','Star',1,2147483647,NULL,NULL,NULL),(2,'Veronika','Super',1,788188711,NULL,NULL,NULL),(3,'Alla','Pugacheva',1,9090909,NULL,NULL,NULL),(4,'Update','Test',1,77777,NULL,NULL,NULL),(5,'Somename','SomeoneLastname',1,20010022,NULL,NULL,NULL),(6,'Someone','LikeYou',2,2147483647,NULL,NULL,NULL),(7,'NAME','LASTNAME',2,777,NULL,NULL,NULL),(8,'XXXX','Test',1,77777,NULL,NULL,NULL),(9,'Elena#','Nechaeva',1,21193221,NULL,NULL,NULL),(10,'Maria','Masycova',2,23221122,NULL,NULL,NULL),(11,'Alena','Apina',2,2211222,NULL,NULL,NULL),(12,'Maria','Solominka',2,21212121,NULL,NULL,NULL),(13,'Firtstname','Lastname',1,882771,NULL,NULL,NULL),(14,'Maria','Lopez',1,912553322,NULL,NULL,NULL),(15,'Mariana','Magdalena',2,211693223,NULL,NULL,NULL),(16,'SUPER@','WOMEN',1,2020202020,NULL,NULL,NULL),(17,'Helen','Withy',2,3030992,NULL,NULL,NULL),(18,'NEW','CLIENT',2,77777,NULL,NULL,NULL),(19,'Malika','Wity',1,2147483647,NULL,NULL,NULL),(20,'Malika','Wity',1,2147483647,NULL,NULL,NULL),(21,'Vera','Nikolaeva',1,76662553,NULL,NULL,NULL),(22,'NAME','LAST',1,2120121,NULL,NULL,NULL),(23,'AAAA','BBBB',1,2147483647,NULL,NULL,NULL),(24,'1ad','ddd',1,33333,NULL,NULL,NULL),(25,'AAAA','BBB',1,222211,NULL,NULL,NULL),(26,'hghg','jjkjkj',2,8988,NULL,NULL,NULL),(27,'AAAAA','XXXXX',1,87878787,NULL,NULL,NULL),(28,'AAA','SSAAA',1,0,NULL,NULL,NULL),(29,'FFFFFFF','LLLLLLL',1,21021021,NULL,NULL,NULL),(30,'AAA','ASAA',2,13221,NULL,NULL,NULL),(31,'FFFFFNNNNNN','LLLLLLLNNNNNN',1,777777777,NULL,NULL,NULL),(32,'!!!!!!','LLLLLLL',1,1212122,NULL,NULL,NULL),(33,'MY','SUPER',2,2120,NULL,NULL,NULL),(34,'Anni','MAX',1,777777,NULL,'mi@asa.as',NULL),(35,'WFNAME','WLNAME',1,878777,NULL,'email@client.kk',NULL),(36,'asas','zxzx',1,1212,NULL,'as@zx',NULL),(37,'ss','ss',1,22,NULL,'ss@ss',NULL),(38,'Veronika','May',1,2147483647,NULL,'vera@gmail.com',NULL),(39,'Vasilisa','Beauty',1,9999999,NULL,'vas@gmail.com',NULL),(40,'ddd','ffff',2,222,NULL,'mnmn@mnmn',NULL),(41,'XXX','YYY',2,7777,NULL,'xx@xx.xx',NULL),(42,'Sample','Test',2,2147483647,NULL,'sample@mail.nz',NULL),(43,'Name','Surname',2,2147483647,NULL,'mma@mm.la',NULL),(44,'SSSS','AAAA',2,877727771,NULL,'mikhail@sss.ss',NULL),(45,'MMM','LLL',1,878787,NULL,'mmm@mm',NULL),(46,'Ekaterina','Poroshina',1,2147483647,NULL,'ekaterina@gmail.com',NULL),(47,'Mikhail','Pastushkov',1,2147483647,NULL,'mikhail@gmail.com',NULL),(48,'Anna','Volochkova',2,2147483647,NULL,'anna@gmail.com',NULL),(49,'Britney','Spears',1,2147483647,NULL,'bs@gmail.com',NULL),(50,'Vasilisa','Super',1,87772661,NULL,'vas@gmail.com',NULL),(51,'Lada','Dance',1,111,NULL,'ld@gmail.com',NULL),(52,'Jenny','No',1,7775,NULL,'j@gmail.com',NULL),(53,'Anna','Semenovich',1,999,NULL,'an@gmail.com',NULL);
/*!40000 ALTER TABLE `tb_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_data`
--

DROP TABLE IF EXISTS `tb_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'ID of the Client',
  `procid` int(11) NOT NULL COMMENT 'ID of the Procedure',
  `typeprocid` int(11) NOT NULL COMMENT 'ID of the Type of Procedure',
  `price` int(11) NOT NULL COMMENT 'Price for thr current procedure',
  `artistprice` double NOT NULL COMMENT 'Price paid to Artist',
  `locationid` int(11) DEFAULT NULL COMMENT 'Location of the Studio',
  `dateproc` datetime NOT NULL COMMENT 'Date and time the procedure',
  `dateendproc` datetime DEFAULT NULL COMMENT 'Date and time of the end of procedure',
  `artistid` int(11) NOT NULL COMMENT 'ID of the Artist',
  `memo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `procid` (`procid`),
  KEY `typeprocid` (`typeprocid`),
  KEY `locationid` (`locationid`),
  KEY `artistid` (`artistid`),
  CONSTRAINT `tb_data_ibfk_2` FOREIGN KEY (`procid`) REFERENCES `tb_proc` (`id`),
  CONSTRAINT `tb_data_ibfk_3` FOREIGN KEY (`typeprocid`) REFERENCES `tb_typeproc` (`id`),
  CONSTRAINT `tb_data_ibfk_4` FOREIGN KEY (`locationid`) REFERENCES `tb_location` (`id`),
  CONSTRAINT `tb_data_ibfk_6` FOREIGN KEY (`artistid`) REFERENCES `tb_artist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1 COMMENT='The table keep the mail schedule of the Artists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_data`
--

LOCK TABLES `tb_data` WRITE;
/*!40000 ALTER TABLE `tb_data` DISABLE KEYS */;
INSERT INTO `tb_data` VALUES (5,1,2,2,11000,5280,1,'2017-10-20 18:00:00',NULL,2,' It was really good'),(16,8,2,2,11000,5500,1,'2017-02-01 15:10:00',NULL,1,'Updated'),(18,6,2,2,11000,5280,2,'2017-02-02 10:00:00',NULL,2,'  Memo info	just text'),(19,1,2,2,10000,5000,2,'2017-03-06 19:00:00',NULL,4,'NEW MEM'),(20,7,2,2,10000,5000,2,'2017-03-06 00:00:00',NULL,4,'NEW MEM'),(23,10,4,2,13000,6240,2,'2017-03-01 00:00:00',NULL,2,'The memo'),(27,14,2,2,11000,5500,1,'2017-02-25 00:00:00',NULL,1,' This is memo'),(31,18,2,2,11000,5280,2,'2017-02-10 14:30:00',NULL,2,'XXXXXX'),(32,29,2,2,11000,5280,1,'2017-02-09 00:00:00',NULL,2,'MEMEMEME'),(33,31,1,2,10000,5000,1,'2017-04-04 12:33:00',NULL,4,'MEMEMEM	'),(37,34,5,1,8000,3840,1,'2017-03-15 10:30:00',NULL,1,'WEB'),(42,38,1,1,22000,11000,1,'2017-03-13 13:00:00',NULL,1,'Booked from the WEB'),(43,39,1,1,22000,11000,1,'2017-03-13 15:00:00',NULL,1,'Booked from the WEB'),(44,39,1,1,20000,8000,1,'2017-03-13 09:00:00',NULL,3,'Booked from the WEB'),(45,39,1,1,20000,8000,1,'2017-03-13 11:00:00',NULL,3,'Booked from the WEB'),(46,39,1,1,20000,8000,1,'2017-03-13 13:00:00',NULL,3,'Booked from the WEB'),(49,41,1,1,15000,7500,2,'2017-03-13 09:00:00',NULL,4,'Booked from the WEB'),(51,42,1,1,15000,6000,2,'2017-03-13 15:00:00',NULL,5,'Booked from the WEB  zzz'),(52,43,1,1,15000,7500,2,'2017-03-13 13:00:00',NULL,4,'Booked from the WEB'),(53,44,1,1,15000,7500,2,'2017-03-13 17:00:00',NULL,4,'Booked from the WEB'),(55,46,1,1,22000,11000,1,'2017-03-14 09:00:00',NULL,1,'Booked from the WEB'),(56,47,3,1,25000,12500,1,'2017-03-15 09:00:00',NULL,1,'Booked from the WEBgfgf'),(57,48,1,1,20000,8000,2,'2017-03-16 11:00:00',NULL,3,'Something about'),(101,50,1,1,22000,11000,1,'2017-03-18 13:00:00',NULL,1,'Booked from the WEB'),(116,51,1,1,20000,8000,1,'2017-03-18 09:00:00',NULL,2,'Booked from the WEB'),(117,51,1,1,20000,8000,1,'2017-03-18 09:00:00',NULL,3,'Booked from the WEB'),(118,51,1,1,20000,8000,1,'2017-03-18 11:00:00',NULL,2,'Booked from the WEB'),(138,49,1,1,22000,11000,1,'2017-03-19 09:00:00',NULL,1,'Booked from the WEB'),(139,49,1,1,20000,8000,1,'2017-03-19 09:00:00',NULL,2,'Booked from the WEB'),(141,49,4,2,13000,6240,1,'2017-03-19 13:00:00',NULL,2,'Booked from the WEB'),(143,49,1,1,22000,11000,1,'2017-03-19 11:00:00',NULL,1,'Booked from the WEB');
/*!40000 ALTER TABLE `tb_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_location`
--

DROP TABLE IF EXISTS `tb_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(50) NOT NULL COMMENT 'Address',
  `cityid` int(11) NOT NULL COMMENT 'ID of City',
  PRIMARY KEY (`id`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `tb_location_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `tb_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_location`
--

LOCK TABLES `tb_location` WRITE;
/*!40000 ALTER TABLE `tb_location` DISABLE KEYS */;
INSERT INTO `tb_location` VALUES (1,'26 microregion, DOSTYK, 2 floor',1),(2,'Cialkovskogo street, 1/1, room 9',2);
/*!40000 ALTER TABLE `tb_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_picture`
--

DROP TABLE IF EXISTS `tb_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `clientid` int(11) DEFAULT NULL COMMENT 'ID of the Client',
  `artistid` int(11) NOT NULL COMMENT 'ID of the Artist',
  `dataid` int(11) NOT NULL COMMENT 'ID in the Data table',
  `photo` varchar(200) NOT NULL COMMENT 'Photo names',
  `comment` varchar(250) DEFAULT NULL COMMENT 'Comments',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `artistid` (`artistid`),
  KEY `dataid` (`dataid`),
  CONSTRAINT `tb_picture_ibfk_2` FOREIGN KEY (`artistid`) REFERENCES `tb_artist` (`id`),
  CONSTRAINT `tb_picture_ibfk_3` FOREIGN KEY (`dataid`) REFERENCES `tb_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_picture`
--

LOCK TABLES `tb_picture` WRITE;
/*!40000 ALTER TABLE `tb_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proc`
--

DROP TABLE IF EXISTS `tb_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_proc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `procname` varchar(30) NOT NULL COMMENT 'Name of procedure',
  `description` varchar(200) DEFAULT NULL COMMENT 'Description of procedure',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Library for existed procedures at studio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proc`
--

LOCK TABLES `tb_proc` WRITE;
/*!40000 ALTER TABLE `tb_proc` DISABLE KEYS */;
INSERT INTO `tb_proc` VALUES (1,'Hair Stroke Eyebrows',NULL),(2,'Powder Filled Eyebrows',NULL),(3,'Lips (lipstick effect)',NULL),(4,'Lips (aquarelle effect)',NULL),(5,'Laser tattoo removal',NULL);
/*!40000 ALTER TABLE `tb_proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT 'name of role',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'0'),(2,'administrator'),(3,'manager');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_typecontract`
--

DROP TABLE IF EXISTS `tb_typecontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_typecontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contract` varchar(20) NOT NULL COMMENT 'Name of the contract',
  `description` varchar(200) DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Library of contracts existed in the studio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_typecontract`
--

LOCK TABLES `tb_typecontract` WRITE;
/*!40000 ALTER TABLE `tb_typecontract` DISABLE KEYS */;
INSERT INTO `tb_typecontract` VALUES (1,'salary','The artist has fixed salary for a month'),(2,'percent','The artist recieve fixed percent from every procedure (exclude laser procedures)'),(3,'other','The artist has appropriate part from every procedure');
/*!40000 ALTER TABLE `tb_typecontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_typeproc`
--

DROP TABLE IF EXISTS `tb_typeproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_typeproc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typename` varchar(50) NOT NULL COMMENT 'Name of type of procedure',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Library of types for procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_typeproc`
--

LOCK TABLES `tb_typeproc` WRITE;
/*!40000 ALTER TABLE `tb_typeproc` DISABLE KEYS */;
INSERT INTO `tb_typeproc` VALUES (1,'First procedure'),(2,'Correction');
/*!40000 ALTER TABLE `tb_typeproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `tb_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','123',2);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_data`
--

DROP TABLE IF EXISTS `vw_data`;
/*!50001 DROP VIEW IF EXISTS `vw_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_data` AS SELECT 
 1 AS `id`,
 1 AS `clientid`,
 1 AS `procid`,
 1 AS `typeprocid`,
 1 AS `price`,
 1 AS `artistprice`,
 1 AS `locationid`,
 1 AS `dateproc`,
 1 AS `dateendproc`,
 1 AS `artistid`,
 1 AS `memo`,
 1 AS `procname`,
 1 AS `cfname`,
 1 AS `clname`,
 1 AS `mobile`,
 1 AS `typename`,
 1 AS `city`,
 1 AS `art_fullname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ypscs_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `usp_AddRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_AddRecord`(
IN dt VARCHAR(25),
IN fname_client VARCHAR(25),
IN lname_client VARCHAR(25),
IN mobile_client VARCHAR(25),
IN art_fullname varchar(50),
IN proc_name varchar(255),
IN typeproc_name varchar(255),
IN city_name varchar(50),
IN memo_ varchar(255),
 OUT res float(2))
BEGIN
declare record int;
declare dur int;
declare client_id int default 0;
declare artist_id int;
declare proc_id int;
declare typeproc_id int;
declare location_id int;
declare price_ int;
declare artprice_ double;
declare typecontract int(2);



SELECT id, typecontractid INTO artist_id, typecontract FROM tb_artist WHERE fname = substring_index(art_fullname," ",1) collate utf8_general_ci and lname = substring_index(art_fullname," ",-1) collate utf8_general_ci; 
SELECT id INTO typeproc_id FROM tb_typeproc where typename = typeproc_name;
SELECT id INTO proc_id FROM tb_proc WHERE procname = proc_name collate utf8_general_ci;


SELECT duration INTO dur FROM tb_artistprice where artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;

SELECT 
    COUNT(id) AS count
INTO record FROM tb_data
WHERE artistid = artist_id AND dateproc BETWEEN dt AND dt +interval dur minute;


 
IF record=0 THEN
	SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
	SELECT id into client_id FROM tb_client WHERE mobile = mobile_client; 
    
    if client_id = 0 THEN
		INSERT INTO tb_client (fname, lname, locationid, mobile) VALUES (fname_client, lname_client, location_id, mobile_client);
        SET client_id = LAST_INSERT_ID();
    end if;


SELECT id, typecontractid INTO artist_id, typecontract FROM tb_artist WHERE fname = substring_index(art_fullname," ",1) collate utf8_general_ci and lname = substring_index(art_fullname," ",-1) collate utf8_general_ci; 
SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
SELECT artprice, price INTO artprice_, price_ FROM tb_artistprice WHERE artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;
	
    IF typecontract = 3 THEN
		SET artprice_ = (price_/ 100)*artprice_;
     
    END IF;

INSERT INTO tb_data (clientid, procid, typeprocid, price, artistprice, locationid, dateproc, artistid, memo)
VALUES (client_id, proc_id, typeproc_id, price_, artprice_, location_id, dt, artist_id, memo_);

SET res = last_insert_id();
ELSE

set res = 0;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_BookTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_BookTime`(
IN dt VARCHAR(25),
IN fname_client VARCHAR(25),
IN lname_client VARCHAR(25),
IN mobile_client VARCHAR(25),
IN email_client VARCHAR(25),
IN artist_id int(10),
IN proc_id int(10),
IN typeproc_id int(10),
IN city_name varchar(50),
IN memo_ varchar(255),
 OUT res float(2))
BEGIN
declare record int;
declare dur int;
declare client_id int default 0;
declare location_id int;
declare price_ int;
declare artprice_ double;
declare typecontract int(2);



SELECT typecontractid INTO typecontract FROM tb_artist WHERE id = artist_id; 

SELECT duration INTO dur FROM tb_artistprice where artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;

SELECT 
    COUNT(id) AS count
INTO record FROM tb_data
WHERE artistid = artist_id AND dateproc BETWEEN dt AND dt +interval dur minute;


 
IF record=0 THEN
	SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
	SELECT id into client_id FROM tb_client WHERE mobile = mobile_client and email = email_client; 
    
    if client_id = 0 THEN
		INSERT INTO tb_client (fname, lname, locationid, mobile, email) VALUES (fname_client, lname_client, location_id, mobile_client, email_client);
        SET client_id = LAST_INSERT_ID();
    end if;


SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
SELECT artprice, price INTO artprice_, price_ FROM tb_artistprice WHERE artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;
	
    IF typecontract = 3 THEN
		SET artprice_ = (price_/ 100)*artprice_;
     
    END IF;

INSERT INTO tb_data (clientid, procid, typeprocid, price, artistprice, locationid, dateproc, artistid, memo)
VALUES (client_id, proc_id, typeproc_id, price_, artprice_, location_id, dt, artist_id, memo_);

SET res = last_insert_id();
ELSE

set res = 0;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetFullNameAndPriceByIds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GetFullNameAndPriceByIds`(
IN artist_id int(10),
IN proc_id int (10),
IN typeproc_id int(10)
)
BEGIN

SELECT a.id, concat(a.fname," ",lname) as fullname, p.price FROM tb_artist as a, tb_artistprice as p WHERE
a.id = p.artistid and a.id = artist_id and p.procid = proc_id and p.typeprocid = typeproc_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetShedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GetShedule`(
IN dt varchar(15),
IN artist_id int(10),
IN proc_id int(10),
IN typeproc_id int(10)
)
BEGIN

 SELECT dat.id, dat.dateproc, dat.art_fullname
 , (select ap.price from tb_artistprice as ap where ap.artistid = artist_id and ap.procid = proc_id and ap.typeprocid = typeproc_id) as price
  FROM vw_data as dat where dat.artistid = artist_id and dat.dateproc like dt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_UpdateRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_UpdateRecord`(
IN id_data int(10),
IN id_client int(10),
IN dt VARCHAR(25),
IN fname_client VARCHAR(25),
IN lname_client VARCHAR(25),
IN mobile_client VARCHAR(25),
IN art_fullname varchar(50),
IN proc_name varchar(255),
IN typeproc_name varchar(255),
IN city_name varchar(50),
IN memo_ varchar(255),
 OUT res int(10))
BEGIN
declare record int;
declare dur int;
declare artist_id int;
declare proc_id int;
declare typeproc_id int;
declare location_id int;
declare price_ int;
declare artprice_ double;
declare typecontract int(2);

UPDATE tb_data SET dateproc='' WHERE id = id_data;

SELECT id, typecontractid INTO artist_id, typecontract FROM tb_artist WHERE fname = substring_index(art_fullname," ",1) collate utf8_general_ci and lname = substring_index(art_fullname," ",-1) collate utf8_general_ci; 
SELECT id INTO typeproc_id FROM tb_typeproc where typename = typeproc_name;
SELECT id INTO proc_id FROM tb_proc WHERE procname = proc_name collate utf8_general_ci;


SELECT duration INTO dur FROM tb_artistprice where artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;

SELECT 
    COUNT(id) AS count
INTO record FROM tb_data
WHERE artistid = artist_id AND dateproc BETWEEN dt AND dt +interval dur minute;


 
IF record=0 THEN
	SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
	

SELECT id, typecontractid INTO artist_id, typecontract FROM tb_artist WHERE fname = substring_index(art_fullname," ",1) collate utf8_general_ci and lname = substring_index(art_fullname," ",-1) collate utf8_general_ci; 
SELECT id INTO location_id FROM tb_location where cityid = (SELECT id FROM tb_city WHERE city = city_name);
SELECT artprice, price INTO artprice_, price_ FROM tb_artistprice WHERE artistid = artist_id and procid = proc_id and typeprocid = typeproc_id;
	
    IF typecontract = 3 THEN
		SET artprice_ = (price_/ 100)*artprice_;
     
    END IF;
    
   
UPDATE tb_client SET fname=fname_client,
					 lname=lname_client,
					 locationid=location_id,
					 mobile=mobile_client
				  WHERE id = id_client;    
                  
UPDATE tb_data SET clientid=id_client,
					procid=proc_id,
                    typeprocid=typeproc_id,
                    price=price_,
                    artistprice=artprice_,
                    locationid=location_id,
                    dateproc=dt,
                    artistid=artist_id,
                    memo=memo_
				WHERE id = id_data;

SET res = id_data;

ELSE

set res = 0;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_data`
--

/*!50001 DROP VIEW IF EXISTS `vw_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_data` AS select `d`.`id` AS `id`,`d`.`clientid` AS `clientid`,`d`.`procid` AS `procid`,`d`.`typeprocid` AS `typeprocid`,`d`.`price` AS `price`,`d`.`artistprice` AS `artistprice`,`d`.`locationid` AS `locationid`,`d`.`dateproc` AS `dateproc`,`d`.`dateendproc` AS `dateendproc`,`d`.`artistid` AS `artistid`,`d`.`memo` AS `memo`,`p`.`procname` AS `procname`,`c`.`fname` AS `cfname`,`c`.`lname` AS `clname`,`c`.`mobile` AS `mobile`,`typep`.`typename` AS `typename`,(select `tb_city`.`city` from `tb_city` where (`tb_city`.`id` = `loc`.`cityid`)) AS `city`,concat(`a`.`fname`,' ',`a`.`lname`) AS `art_fullname` from (((((`tb_data` `d` join `tb_proc` `p`) join `tb_client` `c`) join `tb_typeproc` `typep`) join `tb_location` `loc`) join `tb_artist` `a`) where ((`p`.`id` = `d`.`procid`) and (`c`.`id` = `d`.`clientid`) and (`typep`.`id` = `d`.`typeprocid`) and (`loc`.`id` = `d`.`locationid`) and (`a`.`id` = `d`.`artistid`)) */;
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

-- Dump completed on 2017-03-24  9:30:36
