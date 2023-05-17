CREATE DATABASE  IF NOT EXISTS `adp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `adp`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: adp
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adp_busqueda`
--

DROP TABLE IF EXISTS `adp_busqueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adp_busqueda` (
  `buqueda_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `marca` int(11) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `color` varchar(60) DEFAULT NULL,
  `damageid` int(11) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `busqueda_estado` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`buqueda_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adp_busqueda`
--

LOCK TABLES `adp_busqueda` WRITE;
/*!40000 ALTER TABLE `adp_busqueda` DISABLE KEYS */;
INSERT INTO `adp_busqueda` VALUES (1,2,4,2022,'negro',2,'IN',0,1,1,1),(2,2,3,2021,'azul',2,'DE',0,1,1,1),(3,1,7,2022,'negro',3,'KS',0,1,1,1),(4,2,2,2022,'negro',1,'IA',0,1,1,1),(5,1,7,2022,'negro',2,'KS',0,1,1,1),(6,1,7,2022,'negro',0,'0',0,1,1,1),(7,2,6,2022,'negro',1,'FL',0,1,1,1),(8,2,1,2022,'blanco',1,'FL',0,1,1,1),(9,1,6,2022,'blanco',1,'FL',0,1,1,1),(10,1,6,2022,'negro',2,'FL',0,1,1,1);
/*!40000 ALTER TABLE `adp_busqueda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adp_user`
--

DROP TABLE IF EXISTS `adp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adp_user` (
  `user_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `upassword` varchar(50) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adp_user`
--

LOCK TABLES `adp_user` WRITE;
/*!40000 ALTER TABLE `adp_user` DISABLE KEYS */;
INSERT INTO `adp_user` VALUES (1,'test','123',1,1);
/*!40000 ALTER TABLE `adp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amarca`
--

DROP TABLE IF EXISTS `amarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amarca` (
  `marcaid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amarca`
--

LOCK TABLES `amarca` WRITE;
/*!40000 ALTER TABLE `amarca` DISABLE KEYS */;
INSERT INTO `amarca` VALUES (1,'Toyota',1),(2,'Mazda',1);
/*!40000 ALTER TABLE `amarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amodelo`
--

DROP TABLE IF EXISTS `amodelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amodelo` (
  `modeloid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `marcaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`modeloid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amodelo`
--

LOCK TABLES `amodelo` WRITE;
/*!40000 ALTER TABLE `amodelo` DISABLE KEYS */;
INSERT INTO `amodelo` VALUES (1,'Mazda 2',1,2),(2,'Mazda 6',1,2),(3,'CX-5',1,2),(4,'MX-5',1,2),(5,'CX-9',1,2),(6,'Yaris',1,1),(7,'Verso',1,1),(8,'Hilux',1,1);
/*!40000 ALTER TABLE `amodelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_city`
--

DROP TABLE IF EXISTS `country_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `citycode` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `stateid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_city`
--

LOCK TABLES `country_city` WRITE;
/*!40000 ALTER TABLE `country_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state`
--

DROP TABLE IF EXISTS `country_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state` (
  `stateid` int(11) NOT NULL AUTO_INCREMENT,
  `statecode` varchar(150) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state`
--

LOCK TABLES `country_state` WRITE;
/*!40000 ALTER TABLE `country_state` DISABLE KEYS */;
INSERT INTO `country_state` VALUES (1,'AL','Alabama',1),(2,'AK','Alaska',1),(3,'AZ','Arizona',1),(4,'AR','Arkansas',1),(5,'CA','California',1),(6,'CO','Colorado',1),(7,'CT','Connecticut',1),(8,'DE','Delaware',1),(9,'FL','Florida',1),(10,'GA','Georgia',1),(11,'HI','Hawaii',1),(12,'ID','Idaho',1),(13,'IL','Illinois',1),(14,'IN','Indiana',1),(15,'IA','Iowa',1),(16,'KS','Kansas',1),(17,'KY','Kentucky',1),(18,'LA','Louisiana',1),(19,'ME','Maine',1),(20,'MD','Maryland',1),(21,'MA','Massachusetts',1),(22,'MI','Michigan',1),(23,'MN','Minnesota',1),(24,'MS','Mississippi',1),(25,'MO','Missouri',1),(26,'MT','Montana',1),(27,'NE','Nebraska',1),(28,'NV','Nevada',1),(29,'NH','New Hampshire',1),(30,'NJ','New Jersey',1),(31,'NM','New Mexico',1),(32,'NY','New York',1),(33,'NC','North Carolina',1),(34,'ND','North Dakota',1),(35,'OH','Ohio',1),(36,'OK','Oklahoma',1),(37,'OR','Oregon',1),(38,'PA','Pennsylvania',1),(39,'RI','Rhode Island',1),(40,'SC','South Carolina',1),(41,'SD','South Dakota',1),(42,'TN','Tennessee',1),(43,'TX','Texas',1),(44,'UT','Utah',1),(45,'VT','Vermont',1),(46,'VA','Virginia',1),(47,'WA','Washington',1),(48,'WV','West Virginia',1),(49,'WI','Wisconsin',1),(50,'WY','Wyoming',1);
/*!40000 ALTER TABLE `country_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage`
--

DROP TABLE IF EXISTS `damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damage` (
  `damageid` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `descripcion_us` varchar(150) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`damageid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage`
--

LOCK TABLES `damage` WRITE;
/*!40000 ALTER TABLE `damage` DISABLE KEYS */;
INSERT INTO `damage` VALUES (1,'Daños menores por abolladuras','',1),(2,'Daños en la parte delantera','',1),(3,'Daños en todo el vehiculo','',1),(4,'Daños en la parte trasera','',1);
/*!40000 ALTER TABLE `damage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-17  2:34:23
