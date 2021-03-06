-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: mer
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `Feedbacks`
--

USE mer;

DROP TABLE IF EXISTS `Feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedbacks` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `feedback` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userFK` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `musicFK` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Feedbacks_userFK_foreign_idx` (`userFK`),
  KEY `Feedbacks_musicFK_foreign_idx` (`musicFK`),
  CONSTRAINT `Feedbacks_musicFK_foreign_idx` FOREIGN KEY (`musicFK`) REFERENCES `Music` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Feedbacks_userFK_foreign_idx` FOREIGN KEY (`userFK`) REFERENCES `Users` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedbacks`
--

LOCK TABLES `Feedbacks` WRITE;
/*!40000 ALTER TABLE `Feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListaMusicas`
--

DROP TABLE IF EXISTS `ListaMusicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListaMusicas` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `listaFK` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `musicFk` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`,`listaFK`,`musicFk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListaMusicas`
--

LOCK TABLES `ListaMusicas` WRITE;
/*!40000 ALTER TABLE `ListaMusicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ListaMusicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListaRepros`
--

DROP TABLE IF EXISTS `ListaRepros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListaRepros` (
  `listaID` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nomeLista` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userFK` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`listaID`),
  KEY `ListaRepros_userFK_foreign_idx` (`userFK`),
  CONSTRAINT `ListaRepros_userFK_foreign_idx` FOREIGN KEY (`userFK`) REFERENCES `Users` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListaRepros`
--

LOCK TABLES `ListaRepros` WRITE;
/*!40000 ALTER TABLE `ListaRepros` DISABLE KEYS */;
/*!40000 ALTER TABLE `ListaRepros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Music`
--

DROP TABLE IF EXISTS `Music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Music` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `idVideo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `emocao` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userFK` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Music_userFK_foreign_idx` (`userFK`),
  CONSTRAINT `Music_userFK_foreign_idx` FOREIGN KEY (`userFK`) REFERENCES `Users` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Music`
--

LOCK TABLES `Music` WRITE;
/*!40000 ALTER TABLE `Music` DISABLE KEYS */;
INSERT INTO `Music` VALUES ('24bd710a-bc01-4ab2-8269-c6a509ef159f','ALZHF5UqnU4','Marshmello - Alone (Official Music Video)','https://www.youtube.com/watch?v=ALZHF5UqnU4','feliz','2020-10-13 22:12:03','2020-10-13 22:12:03',NULL),('3c29c998-6e06-427f-90b1-9e05cdb1e4af','tCUJbaI6g8c','HI-LO - Kronos','https://www.youtube.com/watch?v=tCUJbaI6g8c','Calma','2020-10-13 22:12:13','2020-10-13 22:12:49',NULL);
/*!40000 ALTER TABLE `Music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20200929155418-create-user.js'),('20200929184844-create-music.js'),('20200929185327-create-feedback.js'),('20200929185515-create-lista-repro.js'),('20200929200042-feedbackAssociations.js'),('20200929201100-feedbackMusic.js'),('20200929203957-listaMusicas.js'),('20200929205141-userMusic.js'),('20200929205755-ListaUser.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `userID` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `hashPassword` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('6d06b196-b3c7-4129-b43f-8daa53962e45','admin@mail.pt','admin','$2a$08$GGRFI2qUvo5PoPK8zmGPxeRkmAGOZVbd.M8qVpkjDqXAO5LWp0GAq','admin',1,'2020-10-13 22:12:03','2020-10-13 22:12:03');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-26 20:00:00