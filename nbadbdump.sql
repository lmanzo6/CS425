CREATE DATABASE  IF NOT EXISTS `nbadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nbadb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: nbadb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `CoachID` int NOT NULL,
  `TeamID` int DEFAULT NULL,
  `FIRST_NAME` varchar(60) DEFAULT NULL,
  `LAST_NAME` varchar(60) DEFAULT NULL,
  `START_YEAR` date DEFAULT NULL,
  PRIMARY KEY (`CoachID`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,1,'Tom','Thibodeau','2020-07-30'),(2,1,'Jacque','Vaughn','2023-06-01'),(3,2,'Nick','Nurse','2023-06-01'),(4,2,'Darko','RajakoviÄ‡','2008-11-29'),(5,10,'Billy','Donovan','2019-06-24'),(6,16,'J.B.','Bickerstaff','2016-11-16'),(7,10,'Monty','Williams','2008-09-15'),(8,15,'Rick','Carlisle','2020-07-20'),(9,3,'Quin','Snyder','2019-03-11'),(10,17,'Erik','Spoelstra','2014-04-14'),(11,14,'Jamal','Mosley','2021-03-18'),(12,21,'Wes','Unseld Jr.','2018-09-14'),(13,19,'Michael','Malone','2019-12-30'),(14,4,'Chris','Finch','2018-09-21'),(15,5,'Mark','Daigneault','2018-02-11'),(16,10,'Chauncey','Billups','2015-07-12'),(17,24,'Steve','Kerr','2018-07-04'),(18,15,'Tyronn','Lue','2020-05-04'),(19,9,'Darvin','Ham','2015-03-17'),(20,2,'Frank','Vogel','2020-01-15'),(21,1,'Jason','Kidd','2021-05-25'),(22,22,'Ime','Udoka','2019-07-12'),(23,18,'Taylor','Jenkins','2020-03-20'),(24,7,'Willie','Green','2020-08-09'),(25,5,'Gregg','Popovich','2022-10-04'),(26,26,'Adrian','Griffin','2023-06-05'),(27,27,'Steve','Clifford','2022-06-24'),(28,28,'Joe','Mazzulla','2022-07-04'),(29,29,'Will','Hardy','2022-06-29'),(30,30,'Mike','Brown','2022-05-04');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compete`
--

DROP TABLE IF EXISTS `compete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compete` (
  `CompeteID` int NOT NULL,
  `TeamID` int DEFAULT NULL,
  `SeasonID` int DEFAULT NULL,
  `WIN` int DEFAULT NULL,
  `LOSS` int DEFAULT NULL,
  PRIMARY KEY (`CompeteID`),
  KEY `TeamID` (`TeamID`),
  KEY `SeasonID` (`SeasonID`),
  CONSTRAINT `compete_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`),
  CONSTRAINT `compete_ibfk_2` FOREIGN KEY (`SeasonID`) REFERENCES `season` (`SeasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compete`
--

LOCK TABLES `compete` WRITE;
/*!40000 ALTER TABLE `compete` DISABLE KEYS */;
INSERT INTO `compete` VALUES (1,1,1,47,35),(2,2,1,45,37),(3,3,1,54,28),(4,4,1,41,41),(5,5,1,40,42),(6,6,1,51,31),(7,7,1,17,65),(8,8,1,35,47),(9,9,1,41,41),(10,10,1,44,38),(11,11,1,34,48),(12,12,1,35,47),(13,13,1,53,29),(14,14,1,42,40),(15,15,1,40,42),(16,16,1,33,49),(17,17,1,44,38),(18,18,1,44,38),(19,19,1,43,39),(20,20,1,45,37),(21,21,1,38,44),(22,22,1,22,60),(23,23,1,51,31),(24,24,1,42,40),(25,25,1,22,60),(26,26,1,58,24),(27,27,1,27,55),(28,28,1,57,25),(29,29,1,37,45),(30,30,1,48,34);
/*!40000 ALTER TABLE `compete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `ConfID` int NOT NULL,
  `CONF_NAME` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ConfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (1,'East'),(2,'East'),(3,'East'),(4,'East'),(5,'East'),(6,'East'),(7,'East'),(8,'East'),(9,'East'),(10,'East'),(11,'East'),(12,'East'),(13,'West'),(14,'West'),(15,'West'),(16,'West'),(17,'West'),(18,'West'),(19,'West'),(20,'West'),(21,'West'),(22,'West'),(23,'West'),(24,'West'),(25,'West'),(26,'East'),(27,'East'),(28,'East'),(29,'West'),(30,'West');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_division`
--

DROP TABLE IF EXISTS `conference_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference_division` (
  `CDID` int NOT NULL,
  `ConfID` int DEFAULT NULL,
  `DivID` int DEFAULT NULL,
  PRIMARY KEY (`CDID`),
  KEY `ConfID` (`ConfID`),
  KEY `DivID` (`DivID`),
  CONSTRAINT `conference_division_ibfk_1` FOREIGN KEY (`ConfID`) REFERENCES `conference` (`ConfID`),
  CONSTRAINT `conference_division_ibfk_2` FOREIGN KEY (`DivID`) REFERENCES `division` (`DivID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference_division`
--

LOCK TABLES `conference_division` WRITE;
/*!40000 ALTER TABLE `conference_division` DISABLE KEYS */;
INSERT INTO `conference_division` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,21),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);
/*!40000 ALTER TABLE `conference_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `DivID` int NOT NULL,
  `DIV_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DivID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Atlantic'),(2,'Atlantic'),(3,'Atlantic'),(4,'Atlantic'),(5,'Central'),(6,'Central'),(7,'Central'),(8,'Central'),(9,'Southeast'),(10,'Southeast'),(11,'Southeast'),(12,'Southeast'),(13,'Northwest'),(14,'Northwest'),(15,'Northwest'),(16,'Northwest'),(17,'Pacific'),(18,'Pacific'),(19,'Pacific'),(20,'Pacific'),(21,'Southwest'),(22,'Southwest'),(23,'Southwest'),(24,'Southwest'),(25,'Southwest'),(26,'Central'),(27,'Southeast'),(28,'Atlantic'),(29,'Northwest'),(30,'Pacific');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `PersonID` int DEFAULT NULL,
  `CoachID` int DEFAULT NULL,
  `PlayerID` int DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  KEY `CoachID` (`CoachID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,1,NULL,'Tom Thibodeau','1958-01-17'),(2,2,NULL,'Jacque Vaughn','1975-02-11'),(3,3,NULL,'Nick Nurse','1967-07-24'),(4,4,NULL,'Darko RajakoviÄ‡','1979-02-22'),(5,5,NULL,'Billy Donovan','1965-05-30'),(6,6,NULL,'J.B. Bickerstaff','1979-03-10'),(7,7,NULL,'Monty Williams','1971-10-08'),(8,8,NULL,'Rick Carlisle','1959-10-27'),(9,9,NULL,'Quin Snyder','1966-10-30'),(10,10,NULL,'Erik Spoelstra','1970-11-01'),(11,11,NULL,'Jamal Mosley','1979-10-25'),(12,12,NULL,'Wes Unseld Jr.','1976-03-03'),(13,13,NULL,'Michael Malone','1971-09-15'),(14,14,NULL,'Chris Finch','1969-11-06'),(15,15,NULL,'Mark Daigneault','1985-11-15'),(16,16,NULL,'Chauncey Billups','1976-09-25'),(17,17,NULL,'Steve Kerr','1965-09-27'),(18,18,NULL,'Tyronn Lue','1977-05-03'),(19,19,NULL,'Darvin Ham','1973-07-23'),(20,20,NULL,'Frank Vogel','1973-06-21'),(21,21,NULL,'Jason Kidd','1973-03-23'),(22,22,NULL,'Ime Udoka','1977-08-09'),(23,23,NULL,'Taylor Jenkins','1984-05-19'),(24,24,NULL,'Willie Green','1981-07-28'),(25,25,NULL,'Gregg Popovich','1949-01-28'),(26,NULL,1,'Arron Afflalo','1985-10-15'),(27,NULL,2,'Lou Amundson','1982-12-07'),(28,NULL,3,'Bojan Bogdanovic','1989-04-18'),(29,NULL,4,'Wayne Ellington','1987-11-29'),(30,NULL,5,'Chris Bosh','1984-03-24'),(31,NULL,6,'Cliff Alexander','1995-11-16'),(32,NULL,7,'Josh Richardson','1993-09-15'),(33,NULL,8,'Steven Adams','1993-07-20'),(34,NULL,9,'Elton Brand','1979-03-11'),(35,NULL,10,'Stephen Curry','1988-03-14'),(36,NULL,11,'Gorgui Dieng','1990-01-18'),(37,NULL,12,'Wesley Matthews','1986-10-14'),(38,NULL,13,'LeBron James','1984-12-30'),(39,NULL,14,'Bruno Caboclo','1995-09-21'),(40,NULL,15,'Nikola Mirotic','1991-02-11'),(41,NULL,16,'Hassan Whiteside','1989-06-13'),(42,NULL,17,'Omer Asik','1986-07-04'),(43,NULL,18,'Kyle Singler','1988-05-04'),(44,NULL,19,'Kyle Korver','1981-03-17'),(45,NULL,20,'Donald Sloan','1988-01-15'),(46,NULL,21,'Derrick Williams','1991-05-25'),(47,NULL,22,'Patrick Beverley','1988-07-12'),(48,NULL,23,'Jamal Crawford','1980-03-20'),(49,NULL,24,'Joel Anthony','1982-08-09'),(50,NULL,25,'Derrick Rose','1988-10-04'),(51,NULL,26,'Giannis Antetokounmpo','1994-12-06'),(52,NULL,27,'Nicolas Batum','1988-12-14'),(53,NULL,28,'Amir Johnson','1987-05-01'),(54,NULL,29,'Trevor Booker','1987-11-25'),(55,NULL,30,'Quincy Acy','1990-08-06'),(56,26,NULL,'Adrian Griffin','1974-06-04'),(57,27,NULL,'Steve Clifford','1961-09-17'),(58,28,NULL,'Joe Mazzulla','1988-06-30'),(59,29,NULL,'Will Hardy','1988-01-21'),(60,30,NULL,'Mike Brown','1970-03-05');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL,
  `TeamID` int DEFAULT NULL,
  `FIRSTNAME` varchar(64) DEFAULT NULL,
  `LASTNAME` varchar(64) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,'Arron','Afflalo','1985-10-15'),(2,1,'Lou','Amundson','1982-12-07'),(3,2,'Bojan','Bogdanovic','1989-04-18'),(4,2,'Wayne','Ellington','1987-11-29'),(5,10,'Chris','Bosh','1984-03-24'),(6,16,'Cliff','Alexander','1995-11-16'),(7,10,'Josh','Richardson','1993-09-15'),(8,15,'Steven','Adams','1993-07-20'),(9,3,'Elton','Brand','1979-03-11'),(10,17,'Stephen','Curry','1988-03-14'),(11,14,'Gorgui','Dieng','1990-01-18'),(12,21,'Wesley','Matthews','1986-10-14'),(13,19,'LeBron','James','1984-12-30'),(14,4,'Bruno','Caboclo','1995-09-21'),(15,5,'Nikola','Mirotic','1991-02-11'),(16,10,'Hassan','Whiteside','1989-06-13'),(17,24,'Omer','Asik','1986-07-04'),(18,15,'Kyle','Singler','1988-05-04'),(19,9,'Kyle','Korver','1981-03-17'),(20,2,'Donald','Sloan','1988-01-15'),(21,1,'Derrick','Williams','1991-05-25'),(22,22,'Patrick','Beverley','1988-07-12'),(23,18,'Jamal','Crawford','1980-03-20'),(24,7,'Joel','Anthony','1982-08-09'),(25,5,'Derrick','Rose','1988-10-04'),(26,26,'Giannis','Antetokounmpo','1994-12-06'),(27,27,'Nicolas','Batum','1988-12-14'),(28,28,'Amir','Johnson','1987-05-01'),(29,29,'Trevor','Booker','1987-11-25'),(30,30,'Quincy','Acy','1990-08-06');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_college`
--

DROP TABLE IF EXISTS `player_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_college` (
  `PlayerID` int NOT NULL,
  `College` varchar(64) NOT NULL,
  PRIMARY KEY (`PlayerID`,`College`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_college`
--

LOCK TABLES `player_college` WRITE;
/*!40000 ALTER TABLE `player_college` DISABLE KEYS */;
INSERT INTO `player_college` VALUES (1,'UCLA'),(2,'UNLV'),(3,'Croatia'),(4,'UNC'),(5,'Georgia Tech'),(6,'Kansas'),(7,'Tennessee'),(8,'Pittsburgh'),(9,'Duke'),(10,'Davidson'),(11,'Louisville'),(12,'Marquette'),(13,'St. Vincent-St.'),(14,'Pinheiros'),(15,'Montenegro'),(16,'Marshall'),(17,'Turkey'),(18,'Duke'),(19,'Creighton'),(20,'Texas A&M'),(21,'Arizona'),(22,'Arkansas'),(23,'Michigan'),(24,'UNLV'),(25,'Memphis'),(26,'N/A'),(27,'N/A'),(28,'UofL'),(29,'Clemson'),(30,'Baylor');
/*!40000 ALTER TABLE `player_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_position`
--

DROP TABLE IF EXISTS `player_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_position` (
  `PositionID` int NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_position`
--

LOCK TABLES `player_position` WRITE;
/*!40000 ALTER TABLE `player_position` DISABLE KEYS */;
INSERT INTO `player_position` VALUES (1,'Shooting Guard'),(2,'Power Forward'),(3,'Small Forward'),(4,'Shooting Guard'),(5,'Power Forward'),(6,'Power Forward'),(7,'Shooting Guard'),(8,'Center'),(9,'Power Forward'),(10,'Point Guard'),(11,'Center'),(12,'Shooting Guard'),(13,'Small Forward'),(14,'Power Forward'),(15,'Power Forward'),(16,'Center'),(17,'Center'),(18,'Small Forward'),(19,'Shooting Guard'),(20,'Point Guard'),(21,'Small Forward'),(22,'Point Guard'),(23,'Shooting Guard'),(24,'Center'),(25,'Point Guard'),(26,'Power Forward'),(27,'Small Forward'),(28,'Center'),(29,'Power Forward'),(30,'Power Forward');
/*!40000 ALTER TABLE `player_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays`
--

DROP TABLE IF EXISTS `plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plays` (
  `PlayID` int NOT NULL,
  `PlayerID` int DEFAULT NULL,
  `PositionID` int DEFAULT NULL,
  `WEIGHT` varchar(16) DEFAULT NULL,
  `HEIGHT` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`PlayID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `plays_ibfk_2` FOREIGN KEY (`PositionID`) REFERENCES `player_position` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays`
--

LOCK TABLES `plays` WRITE;
/*!40000 ALTER TABLE `plays` DISABLE KEYS */;
INSERT INTO `plays` VALUES (1,1,1,'210','6\' 5\"'),(2,2,2,'220','6\' 9\"'),(3,3,3,'216','6\' 7\"'),(4,4,4,'200','6\' 5\"'),(5,5,5,'235','6\' 11\"'),(6,6,6,'240','6 \'9\"'),(7,7,7,'200','6 \'6\"'),(8,8,8,'265','7 \'0\"'),(9,9,9,'254','6 \'9\"'),(10,10,10,'185','6 \'2\"'),(11,11,11,'240','6\' 11\"'),(12,12,12,'220','6\' 5\"'),(13,13,13,'250','6\' 9\"'),(14,14,14,'218','6\' 9\"'),(15,15,15,'250','6\' 10\"'),(16,16,16,'265','7\' 0\"'),(17,17,17,'255','7\' 0\"'),(18,18,18,'228','6\' 8\"'),(19,19,19,'212','6\' 7\"'),(20,20,20,'205','6\' 3\"'),(21,21,21,'235','6\' 7\"'),(22,22,22,'185','6\' 1\"'),(23,23,23,'200','6\' 5\"'),(24,24,24,'245','6\' 9\"'),(25,25,25,'200','6\' 3\"'),(26,26,26,'222','6\' 11\"'),(27,27,27,'200','6\' 8\"'),(28,28,28,'240','6\' 9\"'),(29,29,29,'228','6\' 8\"'),(30,30,30,'240','6\' 7\"');
/*!40000 ALTER TABLE `plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `SeasonID` int NOT NULL,
  `REG_GAMES` int DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `YEAR` int DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `PLAYOFF_GAMES` int DEFAULT NULL,
  PRIMARY KEY (`SeasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,82,'2023-04-09',2023,'2022-10-18',11),(2,82,'2023-04-09',2023,'2022-10-18',11),(3,82,'2023-04-09',2023,'2022-10-18',0),(4,82,'2023-04-09',2023,'2022-10-18',0),(5,82,'2023-04-09',2023,'2022-10-18',6),(6,82,'2023-04-09',2023,'2022-10-18',0),(7,82,'2023-04-09',2023,'2022-10-18',20),(8,82,'2023-04-09',2023,'2022-10-18',0),(9,82,'2023-04-09',2023,'2022-10-18',13),(10,82,'2023-04-09',2023,'2022-10-18',16),(11,82,'2023-04-09',2023,'2022-10-18',0),(12,82,'2023-04-09',2023,'2022-10-18',6),(13,82,'2023-04-09',2023,'2022-10-18',0),(14,82,'2023-04-09',2023,'2022-10-18',4),(15,82,'2023-04-09',2023,'2022-10-18',0),(16,82,'2023-04-09',2023,'2022-10-18',5),(17,82,'2023-04-09',2023,'2022-10-18',0),(18,82,'2023-04-09',2023,'2022-10-18',23),(19,82,'2023-04-09',2023,'2022-10-18',0),(20,82,'2023-04-09',2023,'2022-10-18',5),(21,82,'2023-04-09',2023,'2022-10-18',0),(22,82,'2023-04-09',2023,'2022-10-18',5),(23,82,'2023-04-09',2023,'2022-10-18',11),(24,82,'2023-04-09',2023,'2022-10-18',0),(25,82,'2023-04-09',2023,'2022-10-18',0),(26,82,'2023-04-09',2023,'2022-10-18',5),(27,82,'2023-04-09',2023,'2022-10-18',0),(28,82,'2023-04-09',2023,'2022-10-18',20),(29,82,'2023-04-09',2023,'2022-10-18',0),(30,82,'2023-04-09',2023,'2022-10-18',7);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat`
--

DROP TABLE IF EXISTS `stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat` (
  `StatID` int NOT NULL,
  `PlayerID` int NOT NULL,
  `GP` int DEFAULT NULL,
  `FG` double DEFAULT NULL,
  `GS` int DEFAULT NULL,
  `BLK` int DEFAULT NULL,
  `PTS` int DEFAULT NULL,
  `Turnover` int DEFAULT NULL,
  `AST` int DEFAULT NULL,
  `STL` int DEFAULT NULL,
  `REB` int DEFAULT NULL,
  `PF` int DEFAULT NULL,
  PRIMARY KEY (`StatID`,`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat`
--

LOCK TABLES `stat` WRITE;
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
INSERT INTO `stat` VALUES (1,1,75,0.46,60,12,1100,70,200,50,280,90),(2,2,67,0.39,15,12,220,10,30,20,150,60),(3,3,82,0.5,82,30,1500,80,300,90,400,100),(4,4,72,0.44,70,8,800,50,100,30,180,70),(5,5,55,0.52,55,20,1300,40,120,40,300,60),(6,6,25,0.48,10,5,180,15,30,15,70,30),(7,7,80,0.43,80,35,1000,60,160,70,220,80),(8,8,78,0.58,78,100,900,40,90,25,650,120),(9,9,20,0.4,10,10,120,10,20,5,60,30),(10,10,78,0.5,78,5,2200,120,500,150,250,90),(11,11,65,0.47,50,35,800,50,100,60,320,100),(12,12,62,0.42,62,20,700,30,80,40,180,80),(13,13,80,0.56,80,60,2500,100,700,120,700,90),(14,14,15,0.36,5,2,60,5,10,5,30,10),(15,15,75,0.49,75,25,1200,60,150,40,380,80),(16,16,68,0.61,68,180,900,30,50,10,500,150),(17,17,40,0.37,20,10,180,15,20,5,120,40),(18,18,30,0.41,10,5,120,5,10,5,60,30),(19,19,65,0.48,35,10,400,15,40,20,120,50),(20,20,50,0.39,20,5,90,10,25,15,60,20),(21,21,40,0.42,5,2,40,5,10,5,30,10),(22,22,72,0.41,70,45,700,80,150,70,250,80),(23,23,60,0.45,20,8,300,20,50,20,80,30),(24,24,10,0.3,2,1,10,3,2,1,5,4),(25,25,82,0.49,82,15,1700,90,350,100,180,80),(26,26,20,0.43,10,5,150,10,25,5,60,20),(27,27,78,0.52,78,30,1800,100,250,80,320,90),(28,28,65,0.48,65,15,1100,60,180,40,210,70),(29,29,55,0.39,25,10,600,30,70,30,90,40),(30,30,72,0.44,60,8,900,50,100,20,140,50);
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `TeamID` int NOT NULL,
  `ConfID` int DEFAULT NULL,
  `TEAM_NAME` varchar(60) DEFAULT NULL,
  `ARENA_LOCATION` varchar(60) DEFAULT NULL,
  `ARENA_NAME` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `ConfID` (`ConfID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`ConfID`) REFERENCES `conference` (`ConfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,'New York Knicks','New York','Madison Square Garden'),(2,2,'Brooklyn Nets','New York','Barclays Center'),(3,3,'Philadelphia 76ers','Pennsylvania','Wells Fargo Center'),(4,4,'Toronto Raptors','Ontario','Scotiabank Arena'),(5,5,'Chicago Bulls','Illinois','United Center'),(6,6,'Cleveland Cavaliers','Ohio','Rocket Mortgage FieldHouse'),(7,7,'Detroit Pistons','Michigan','Little Caesars Arena'),(8,8,'Indiana Pacers','Indiana','Bankers Life Fieldhouse'),(9,9,'Atlanta Hawks','Georgia','State Farm Arena'),(10,10,'Miami Heat','Florida','AmericanAirlines Arena'),(11,11,'Orlando Magic','Florida','Amway Center'),(12,12,'Washington Wizards','Washington D.C.','Capital One Arena'),(13,13,'Denver Nuggets','Colorado','Ball Arena'),(14,14,'Minnesota Timberwolves','Minnesota','Target Center'),(15,15,'Oklahoma City Thunder','Oklahoma','Paycom Center'),(16,16,'Portland Trail Blazers','Oregon','Moda Center'),(17,17,'Golden State Warriors','California','Chase Center'),(18,18,'Los Angeles Clippers','California','Staples Center'),(19,19,'Los Angeles Lakers','California','Staples Center'),(20,20,'Phoenix Suns','Arizona','Footprint Center'),(21,21,'Dallas Mavericks','Texas','American Airlines Center'),(22,22,'Houston Rockets','Texas','Toyota Center'),(23,23,'Memphis Grizzlies','Tennessee','FedExForum'),(24,24,'New Orleans Pelicans','Louisiana','Smoothie King Center'),(25,25,'San Antonio Spurs','Texas','AT&T Center'),(26,26,'Milwaukee Bucks',' Wisconsin',' Fiserv Forum'),(27,27,'Charlotte Hornets','North Carolina','Spectrum Center'),(28,28,'Boston Celtics','Massachusetts','TD Garden'),(29,29,'Utah Jazz','Utah','Vivint Arena'),(30,30,'Sacramento Kings','California','Golden 1 Center');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 11:50:32
