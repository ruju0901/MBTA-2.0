CREATE DATABASE  IF NOT EXISTS `mbta_2.0` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mbta_2.0`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mbta_2.0
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `Amenity_ID` int NOT NULL,
  `Amenity_Name` varchar(255) DEFAULT NULL,
  `Amenity_Description` text,
  PRIMARY KEY (`Amenity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,'Restroom','Public restroom facilities'),(2,'Elevator','ADA-compliant elevator'),(3,'Ticket Kiosk','Self-service ticket kiosk'),(4,'Bike Rack','Bicycle parking facilities'),(5,'Wi-Fi','Free Wi-Fi access'),(6,'Information Desk','Staffed information desk for assistance'),(7,'Bench','Seating for passengers'),(8,'Escalator','Moving staircases for vertical transportation'),(9,'ATM','Automated teller machine for financial transactions'),(10,'Coffee Shop','On-site coffee shop for passengers');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_station`
--

DROP TABLE IF EXISTS `amenity_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity_station` (
  `Amenity_ID` int NOT NULL,
  `Station_ID` int NOT NULL,
  PRIMARY KEY (`Amenity_ID`,`Station_ID`),
  KEY `fk_amenity_station_station` (`Station_ID`),
  CONSTRAINT `fk_amenity_station_amenity` FOREIGN KEY (`Amenity_ID`) REFERENCES `amenities` (`Amenity_ID`),
  CONSTRAINT `fk_amenity_station_station` FOREIGN KEY (`Station_ID`) REFERENCES `stations` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_station`
--

LOCK TABLES `amenity_station` WRITE;
/*!40000 ALTER TABLE `amenity_station` DISABLE KEYS */;
INSERT INTO `amenity_station` VALUES (9,1),(6,2),(1,3),(2,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,4),(1,5),(7,5),(7,6),(3,7),(5,8),(9,8),(1,9),(2,10),(4,10),(4,11),(6,12),(8,12),(9,13),(1,14),(2,14),(5,14),(6,14),(7,14),(8,14),(9,14),(1,15),(3,15),(5,15),(8,15),(9,15),(10,15),(1,16),(2,16),(3,16),(4,16),(5,16),(6,16),(7,16),(8,16),(9,16),(10,16),(1,17),(7,18),(8,19),(5,20),(8,21),(10,21),(2,22),(1,23),(2,23),(3,23),(4,23),(5,23),(6,23),(10,23);
/*!40000 ALTER TABLE `amenity_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charliecard`
--

DROP TABLE IF EXISTS `charliecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charliecard` (
  `CC_ID` int NOT NULL,
  `Traveler_ID` int DEFAULT NULL,
  `AvailableBalance` decimal(10,2) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  PRIMARY KEY (`CC_ID`),
  KEY `fk_charliecard_traveler` (`Traveler_ID`),
  CONSTRAINT `fk_charliecard_traveler` FOREIGN KEY (`Traveler_ID`) REFERENCES `travelers` (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charliecard`
--

LOCK TABLES `charliecard` WRITE;
/*!40000 ALTER TABLE `charliecard` DISABLE KEYS */;
INSERT INTO `charliecard` VALUES (1,1,50.00,'2023-12-31'),(2,1,30.50,'2024-06-15'),(3,2,75.20,'2023-11-30'),(4,3,20.00,'2024-02-28'),(5,3,40.75,'2024-04-30'),(6,4,15.00,'2023-10-31'),(7,28,62.30,'2024-03-15'),(8,6,18.50,'2023-12-15'),(9,6,45.00,'2024-01-31'),(10,6,38.25,'2024-05-15'),(11,6,22.80,'2024-06-30'),(12,6,55.50,'2024-02-01'),(13,7,30.00,'2024-02-15'),(14,8,48.75,'2024-04-15'),(15,9,25.50,'2023-11-15'),(16,10,40.20,'2024-01-15'),(17,11,37.60,'2023-10-15'),(18,28,60.00,'2024-03-31'),(19,13,35.25,'2023-12-01'),(20,14,22.30,'2024-02-15'),(21,15,50.00,'2023-09-15'),(22,16,16.80,'2024-05-01'),(23,17,33.00,'2024-06-30'),(24,18,28.75,'2023-11-01'),(25,19,40.20,'2024-02-01'),(26,20,18.00,'2023-12-31'),(27,21,55.50,'2024-04-15'),(28,22,27.30,'2023-10-01'),(29,23,45.00,'2024-01-31'),(30,24,42.25,'2023-09-30'),(31,25,20.80,'2024-03-01'),(32,26,38.80,'2024-05-15'),(33,27,30.40,'2023-11-15'),(34,28,50.75,'2024-02-28'),(35,29,14.20,'2023-10-15'),(36,30,45.60,'2024-04-30'),(37,31,38.00,'2023-09-30'),(38,32,58.25,'2024-01-15'),(39,33,24.30,'2023-12-01'),(40,34,40.50,'2024-06-15'),(41,35,32.80,'2023-11-01'),(42,36,50.75,'2024-03-01'),(43,37,18.20,'2023-10-01'),(44,51,63.90,'2024-01-31'),(45,39,35.25,'2023-11-15'),(46,7,47.80,'2024-04-15'),(47,7,22.00,'2023-10-15'),(48,7,68.30,'2024-01-01'),(49,7,26.50,'2023-11-30'),(50,44,55.75,'2024-04-30'),(51,45,33.20,'2023-10-31'),(52,46,45.00,'2024-03-15'),(53,47,29.40,'2023-12-15'),(54,48,70.20,'2024-01-31'),(55,49,42.60,'2023-10-31'),(56,50,63.00,'2024-06-15'),(57,51,18.50,'2023-11-30'),(58,52,48.75,'2024-04-15'),(59,51,10.00,'2023-10-15'),(60,54,75.30,'2024-03-01'),(61,55,22.80,'2023-12-01'),(62,56,68.00,'2024-06-30'),(63,57,35.20,'2023-11-01'),(64,58,50.50,'2024-02-01'),(65,59,15.00,'2023-12-31'),(66,60,42.30,'2024-04-15'),(67,61,26.50,'2023-10-01'),(68,62,60.80,'2024-01-31'),(69,8,32.00,'2023-09-30'),(70,64,70.50,'2024-03-01'),(71,65,18.20,'2023-10-15'),(72,66,48.75,'2024-01-15'),(73,67,12.00,'2023-12-01'),(74,68,75.50,'2024-06-15'),(75,69,37.30,'2023-11-01'),(76,70,58.00,'2024-02-01'),(77,71,23.50,'2023-12-31'),(78,72,65.80,'2024-04-15'),(79,73,28.20,'2023-10-01'),(80,74,72.00,'2024-01-31'),(81,75,38.40,'2023-09-30'),(82,9,50.75,'2024-03-01'),(83,77,16.20,'2023-10-15'),(84,78,62.90,'2024-01-15'),(85,79,35.00,'2023-11-01'),(86,80,48.50,'2024-04-15'),(87,81,20.00,'2023-10-15'),(88,51,70.30,'2024-01-01'),(89,83,25.50,'2023-11-30'),(90,84,45.75,'2024-04-30'),(91,9,33.20,'2023-10-31'),(92,86,55.00,'2024-03-15'),(93,87,28.40,'2023-12-15'),(94,28,68.20,'2024-01-31'),(95,89,42.60,'2023-10-31'),(96,90,60.00,'2024-06-15'),(97,28,15.50,'2023-11-30'),(98,92,48.75,'2024-04-15'),(99,9,11.20,'2023-10-15'),(100,9,75.30,'2024-03-01');
/*!40000 ALTER TABLE `charliecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare`
--

DROP TABLE IF EXISTS `fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare` (
  `Fare_ID` int NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Fare_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare`
--

LOCK TABLES `fare` WRITE;
/*!40000 ALTER TABLE `fare` DISABLE KEYS */;
INSERT INTO `fare` VALUES (1,0.25),(2,0.50),(3,1.00),(4,1.25),(5,1.50),(6,1.75),(7,2.00),(8,2.25),(9,2.50),(10,3.00),(11,4.00),(12,5.00),(13,6.00),(14,7.00),(15,2.75),(16,3.25),(17,3.50),(18,3.75),(19,4.50),(20,5.50),(21,6.50),(22,7.50),(23,8.00),(24,8.25),(25,8.50),(26,9.00),(27,9.25),(28,9.50),(29,10.00),(30,10.25),(31,10.50),(32,11.00),(33,11.25),(34,11.50),(35,12.00),(36,12.25),(37,12.50),(38,13.00),(39,13.25),(40,13.50),(41,14.00),(42,15.00),(43,16.00),(44,17.00);
/*!40000 ALTER TABLE `fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Feedback_ID` int NOT NULL,
  `Feedback_Reason` varchar(500) DEFAULT NULL,
  `FeedbackCategory_ID` int DEFAULT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `fk_feedback_feedbackcategory` (`FeedbackCategory_ID`),
  CONSTRAINT `fk_feedback_feedbackcategory` FOREIGN KEY (`FeedbackCategory_ID`) REFERENCES `feedbackcategory` (`FeedbackCategory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'The station was exceptionally clean and well-maintained.',1),(2,'I faced challenges due to limited accessibility options for wheelchair users.',2),(3,'The information desk was helpful in providing details about train schedules.',3),(4,'I felt secure as there was visible security personnel around the station.',4),(5,'The ticketing services were quick, and the staff was helpful.',5),(6,'The platform was crowded during rush hours, making it difficult to navigate.',6),(7,'Station staff demonstrated excellent courtesy and assistance.',7),(8,'Amenities like seating and restrooms were well-maintained and easily accessible.',8),(9,'Parking facilities were convenient and well-managed.',9),(10,'I experienced delays, impacting the punctuality of the train service.',10),(11,'The station had a clean and welcoming atmosphere.',1),(12,'Improved accessibility features are needed for individuals with mobility challenges.',2),(13,'Information services were clear and easy to understand.',3),(14,'I appreciated the visible presence of security personnel.',4),(15,'The ticketing services were efficient, and the staff was knowledgeable.',5),(16,'Platform crowding was manageable during non-peak hours.',6),(17,'Staff courtesy made my journey more pleasant.',7),(18,'Amenities like seating and Wi-Fi were available and well-maintained.',8),(19,'Parking facilities were convenient and had ample space.',9),(20,'Train punctuality was consistent, and I didnt experience any delays.',10),(21,'The station environment was neat and tidy.',1),(22,'Additional accessibility ramps would improve the station for wheelchair users.',2),(23,'Information services were helpful in navigating the station.',3),(24,'Security measures provided a sense of safety.',4),(25,'Smooth ticketing process and friendly staff.',5),(26,'Platform crowding was well-managed even during peak hours.',6),(27,'Staff demonstrated courtesy and assisted with directions.',7),(28,'Amenities like restrooms and seating were comfortable and clean.',8),(29,'Parking facilities were easily accessible and well-lit.',9),(30,'Excellent train punctuality, no delays observed.',10),(31,'The station was clean, but there were limited seating options.',1),(32,'Accessibility for wheelchair users needs improvement.',2),(33,'Information services were helpful, but the displays were not updated.',3),(34,'While there was visible security, I witnessed a security concern.',4),(35,'The ticketing process was smooth, but the staff seemed unresponsive.',5),(36,'Platform crowding was challenging during rush hours.',6),(37,'Staff courtesy was excellent, but there were delays in train schedules.',7),(38,'Amenities like restrooms were well-maintained, but Wi-Fi was unreliable.',8),(39,'Parking facilities were convenient, but the spaces were limited.',9),(40,'Train punctuality was good, but there were delays during peak hours.',10),(41,'The station was dirty, and maintenance is needed urgently.',1),(42,'Accessibility is severely lacking, making it difficult for disabled individuals.',2),(43,'Information services were confusing, and I struggled to find my way.',3),(44,'Security measures were insufficient, and I felt unsafe.',4),(45,'The ticketing process was slow, and staff were unhelpful.',5),(46,'Platform crowding was overwhelming, causing discomfort.',6),(47,'Staff were rude and unhelpful, negatively impacting my experience.',7),(48,'Amenities were poorly maintained, and there was a lack of seating.',8),(49,'Parking facilities were inconvenient, and finding a spot was a hassle.',9),(50,'Train punctuality was terrible, with frequent and unexplained delays.',10);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackcategory`
--

DROP TABLE IF EXISTS `feedbackcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbackcategory` (
  `FeedbackCategory_ID` int NOT NULL,
  `Category_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FeedbackCategory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackcategory`
--

LOCK TABLES `feedbackcategory` WRITE;
/*!40000 ALTER TABLE `feedbackcategory` DISABLE KEYS */;
INSERT INTO `feedbackcategory` VALUES (1,'Cleanliness'),(2,'Accessibility'),(3,'Information Services'),(4,'Security'),(5,'Ticketing Services'),(6,'Platform Crowding'),(7,'Staff Courtesy'),(8,'Amenities'),(9,'Parking Facilities'),(10,'Train Punctuality');
/*!40000 ALTER TABLE `feedbackcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_charliecard`
--

DROP TABLE IF EXISTS `general_charliecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_charliecard` (
  `CC_ID` int NOT NULL,
  `Traveler_ID` int DEFAULT NULL,
  PRIMARY KEY (`CC_ID`),
  KEY `fk_general_charliecard_traveler` (`Traveler_ID`),
  CONSTRAINT `fk_general_charliecard_traveler` FOREIGN KEY (`Traveler_ID`) REFERENCES `travelers` (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_charliecard`
--

LOCK TABLES `general_charliecard` WRITE;
/*!40000 ALTER TABLE `general_charliecard` DISABLE KEYS */;
INSERT INTO `general_charliecard` VALUES (61,3),(44,7),(5,12),(26,15),(23,18),(78,22),(7,23),(48,28),(96,29),(15,33),(55,35),(72,38),(21,42),(90,43),(33,48),(77,50),(60,53),(84,58),(94,58),(42,63),(12,64),(19,68),(35,71),(67,73),(92,78),(31,83),(50,88),(79,93),(10,98);
/*!40000 ALTER TABLE `general_charliecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junction_station`
--

DROP TABLE IF EXISTS `junction_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `junction_station` (
  `Junction_ID` int NOT NULL,
  `Station_ID` int DEFAULT NULL,
  `Route_ID` int DEFAULT NULL,
  PRIMARY KEY (`Junction_ID`),
  KEY `Station_ID` (`Station_ID`),
  KEY `Route_ID` (`Route_ID`),
  CONSTRAINT `junction_station_ibfk_1` FOREIGN KEY (`Station_ID`) REFERENCES `stations` (`Station_ID`),
  CONSTRAINT `junction_station_ibfk_2` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junction_station`
--

LOCK TABLES `junction_station` WRITE;
/*!40000 ALTER TABLE `junction_station` DISABLE KEYS */;
INSERT INTO `junction_station` VALUES (1,6,1),(2,6,4),(3,7,1),(4,7,3),(5,15,2),(6,15,4),(7,16,3),(8,16,2);
/*!40000 ALTER TABLE `junction_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_charliecard`
--

DROP TABLE IF EXISTS `monthly_charliecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_charliecard` (
  `CC_ID` int NOT NULL,
  `Traveler_ID` int DEFAULT NULL,
  PRIMARY KEY (`CC_ID`),
  KEY `fk_monthly_charliecard_traveler` (`Traveler_ID`),
  CONSTRAINT `fk_monthly_charliecard_traveler` FOREIGN KEY (`Traveler_ID`) REFERENCES `travelers` (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_charliecard`
--

LOCK TABLES `monthly_charliecard` WRITE;
/*!40000 ALTER TABLE `monthly_charliecard` DISABLE KEYS */;
INSERT INTO `monthly_charliecard` VALUES (9,2),(7,3),(36,6),(66,13),(58,16),(80,21),(3,24),(24,27),(59,34),(16,36),(91,41),(18,45),(31,49),(72,54),(87,62),(94,65),(25,69),(47,72),(38,74),(64,77),(93,81),(86,86),(53,91),(15,95),(20,100);
/*!40000 ALTER TABLE `monthly_charliecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `Route_ID` int NOT NULL,
  `Origin` text,
  `Destination` text,
  `RouteType_ID` int DEFAULT NULL,
  PRIMARY KEY (`Route_ID`),
  KEY `fk_route_routeType` (`RouteType_ID`),
  CONSTRAINT `fk_route_routeType` FOREIGN KEY (`RouteType_ID`) REFERENCES `route_type` (`RouteType_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Kenmore','Unique Square',1),(2,'Black Bay','Community College',3),(3,'Gov Center','Maverick',4),(4,'South Station','Charles',2);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_type`
--

DROP TABLE IF EXISTS `route_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_type` (
  `RouteType_ID` int NOT NULL,
  `RouteType_Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RouteType_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_type`
--

LOCK TABLES `route_type` WRITE;
/*!40000 ALTER TABLE `route_type` DISABLE KEYS */;
INSERT INTO `route_type` VALUES (1,'Green'),(2,'Red'),(3,'Yellow'),(4,'Blue');
/*!40000 ALTER TABLE `route_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestops`
--

DROP TABLE IF EXISTS `routestops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routestops` (
  `RouteStop_ID` int NOT NULL,
  `Sequence` int DEFAULT NULL,
  `Station_ID` int DEFAULT NULL,
  `Route_ID` int DEFAULT NULL,
  PRIMARY KEY (`RouteStop_ID`),
  KEY `fk_routestops_station` (`Station_ID`),
  KEY `fk_routestops_route` (`Route_ID`),
  CONSTRAINT `fk_routestops_route` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`),
  CONSTRAINT `fk_routestops_station` FOREIGN KEY (`Station_ID`) REFERENCES `stations` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestops`
--

LOCK TABLES `routestops` WRITE;
/*!40000 ALTER TABLE `routestops` DISABLE KEYS */;
INSERT INTO `routestops` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(10,10,10,1),(11,11,11,1),(12,1,12,2),(13,2,13,2),(14,3,14,2),(15,4,15,2),(16,5,16,2),(17,6,17,2),(18,7,18,2),(19,1,7,3),(20,2,16,3),(21,3,19,3),(22,4,20,3),(23,1,22,4),(24,2,15,4),(25,3,6,4),(26,4,23,4);
/*!40000 ALTER TABLE `routestops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `Schedule_ID` int NOT NULL,
  `Departure_Time` time DEFAULT NULL,
  `Arrival_Time` time DEFAULT NULL,
  `Delay` int DEFAULT NULL,
  `Route_ID` int DEFAULT NULL,
  `Train_ID` int DEFAULT NULL,
  PRIMARY KEY (`Schedule_ID`),
  KEY `fk_schedules_route` (`Route_ID`),
  KEY `fk_schedules_train` (`Train_ID`),
  CONSTRAINT `fk_schedules_route` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`),
  CONSTRAINT `fk_schedules_train` FOREIGN KEY (`Train_ID`) REFERENCES `trains` (`Train_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'08:30:00','11:00:00',3,1,1),(2,'10:15:00','13:00:00',6,2,2),(3,'12:00:00','14:45:00',9,3,3),(4,'14:30:00','17:15:00',12,4,4),(5,'16:15:00','18:45:00',2,1,1),(6,'18:00:00','20:30:00',8,2,2),(7,'19:45:00','22:15:00',4,3,3),(8,'21:30:00','00:00:00',11,4,4),(9,'23:15:00','02:45:00',7,1,1),(10,'00:45:00','03:30:00',10,2,2),(11,'02:30:00','05:00:00',1,3,3),(12,'04:15:00','06:45:00',5,4,4),(13,'06:00:00','08:30:00',13,1,1),(14,'07:45:00','10:15:00',3,2,2),(15,'09:30:00','12:00:00',6,3,3),(16,'11:00:00','13:45:00',9,4,4),(17,'13:45:00','16:30:00',12,1,1),(18,'15:30:00','18:00:00',2,2,2),(19,'17:15:00','19:45:00',8,3,3),(20,'19:00:00','21:30:00',4,4,4),(21,'08:00:00','10:00:00',5,1,1),(22,'10:30:00','13:15:00',1,2,2),(23,'12:15:00','14:45:00',5,3,3),(24,'14:45:00','17:30:00',8,4,4),(25,'16:30:00','19:00:00',3,1,1),(26,'18:15:00','20:45:00',7,2,2),(27,'20:00:00','22:30:00',11,3,3),(28,'21:45:00','00:15:00',4,4,4),(29,'23:30:00','02:00:00',9,1,1),(30,'01:15:00','03:45:00',2,2,2),(31,'03:00:00','05:30:00',6,3,3),(32,'04:45:00','07:15:00',10,4,4),(33,'06:30:00','09:00:00',13,1,1),(34,'08:15:00','10:45:00',3,2,2),(35,'10:00:00','12:30:00',6,3,3),(36,'11:30:00','14:15:00',9,4,4),(37,'13:15:00','16:00:00',12,1,1),(38,'15:00:00','17:30:00',2,2,2),(39,'16:45:00','19:15:00',8,3,3),(40,'18:30:00','21:00:00',4,4,4),(41,'20:15:00','22:45:00',11,1,1),(42,'22:00:00','00:30:00',7,2,2),(43,'23:45:00','02:15:00',10,3,3),(44,'01:30:00','04:00:00',1,4,4),(45,'03:15:00','05:45:00',5,1,1),(46,'04:45:00','07:15:00',8,2,2),(47,'06:30:00','09:00:00',3,3,3),(48,'08:15:00','10:45:00',9,4,4),(49,'10:00:00','12:30:00',12,1,1),(50,'11:30:00','14:15:00',2,2,2),(51,'13:15:00','16:00:00',6,3,3),(52,'15:00:00','17:30:00',10,4,4),(53,'16:45:00','19:15:00',13,1,1),(54,'18:30:00','21:00:00',4,2,2),(55,'20:15:00','22:45:00',7,3,3),(56,'22:00:00','00:30:00',11,4,4),(57,'23:45:00','02:15:00',2,1,1),(58,'01:30:00','04:00:00',8,2,2),(59,'03:15:00','05:45:00',1,3,3),(60,'04:45:00','07:15:00',5,4,4),(61,'06:30:00','09:00:00',10,1,1),(62,'08:15:00','10:45:00',3,2,2),(63,'10:00:00','12:30:00',6,3,3),(64,'11:30:00','14:15:00',9,4,4),(65,'13:15:00','16:00:00',12,1,1),(66,'15:00:00','17:30:00',2,2,2),(67,'16:45:00','19:15:00',8,3,3),(68,'18:30:00','21:00:00',4,4,4),(69,'20:15:00','22:45:00',11,1,1),(70,'22:00:00','00:30:00',7,2,2),(71,'23:45:00','02:15:00',10,3,3),(72,'01:30:00','04:00:00',1,4,4),(73,'03:15:00','05:45:00',5,1,1),(74,'04:45:00','07:15:00',8,2,2),(75,'06:30:00','09:00:00',3,3,3),(76,'08:15:00','10:45:00',9,4,4),(77,'10:00:00','12:30:00',12,1,1),(78,'11:30:00','14:15:00',2,2,2),(79,'13:15:00','16:00:00',6,3,3),(80,'15:00:00','17:30:00',10,4,4),(81,'16:45:00','19:15:00',13,1,1),(82,'18:30:00','21:00:00',4,2,2),(83,'20:15:00','22:45:00',7,3,3),(84,'22:00:00','00:30:00',11,4,4),(85,'23:45:00','02:15:00',2,1,1),(86,'01:30:00','04:00:00',8,2,2),(87,'03:15:00','05:45:00',1,3,3),(88,'04:45:00','07:15:00',5,4,4),(89,'06:30:00','09:00:00',10,1,1),(90,'08:15:00','10:45:00',13,2,2),(91,'10:00:00','12:30:00',3,3,3),(92,'11:30:00','14:15:00',6,4,4),(93,'13:15:00','16:00:00',9,1,1),(94,'15:00:00','17:30:00',12,2,2),(95,'16:45:00','19:15:00',2,3,3),(96,'18:30:00','21:00:00',8,4,4),(97,'20:15:00','22:45:00',4,1,1),(98,'22:00:00','00:30:00',7,2,2),(99,'23:45:00','02:15:00',10,3,3),(100,'01:30:00','04:00:00',1,4,4),(101,'03:15:00','05:45:00',5,1,1);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `Station_ID` int NOT NULL,
  `Station_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Kenmore'),(2,'Hynes'),(3,'Copley'),(4,'Arlington'),(5,'Bolyston'),(6,'Park Street: RG'),(7,'Government Center: GB'),(8,'North Station'),(9,'West End'),(10,'Lechmere'),(11,'Unique Square'),(12,'Black Bay'),(13,'Tufts Medical Center'),(14,'Chinatown'),(15,'Downtown Crossing: YR'),(16,'State: YB'),(17,'Haymarket'),(18,'Community College'),(19,'Aquarium'),(20,'Maverick: B'),(21,'Broadway'),(22,'South Station'),(23,'Charles: R'),(24,'mission park');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `Train_ID` int NOT NULL,
  `Train_Code` varchar(20) DEFAULT NULL,
  `Train_Description` text,
  PRIMARY KEY (`Train_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (1,'MBTA002-ORANGE','Orange Line - Subway service connecting Oak Grove to Forest Hills'),(2,'MBTA003-BLUE','Blue Line - Subway service connecting Wonderland to Bowdoin'),(3,'MBTA0001-GREEN','Green Line - Light rail service with multiple branches (B, C, D, E)'),(4,'MBTA004-RED','Red Line - Subway service connecting Alewife to Ashmont/Braintree');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelers`
--

DROP TABLE IF EXISTS `travelers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelers` (
  `Traveler_ID` int NOT NULL,
  `Traveler_Name` varchar(255) DEFAULT NULL,
  `Traveler_Type` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelers`
--

LOCK TABLES `travelers` WRITE;
/*!40000 ALTER TABLE `travelers` DISABLE KEYS */;
INSERT INTO `travelers` VALUES (1,'Emily Johnson','Regular','1989-07-15'),(2,'Michael Smith','Regular','1980-03-22'),(3,'Olivia Davis','Regular','1995-12-05'),(4,'Ethan Taylor','Child','2013-08-10'),(5,'Sophia Brown','Senior Citizen','1942-04-18'),(6,'Liam Miller','Regular','1976-09-30'),(7,'Ava Wilson','Child','2011-02-25'),(8,'Noah Anderson','Regular','1990-11-08'),(9,'Isabella Thomas','Regular','1985-06-12'),(10,'Mason White','Regular','1992-01-28'),(11,'Emma Jackson','Senior Citizen','1950-10-15'),(12,'Liam Harris','Regular','1983-05-20'),(13,'Ava Martinez','Regular','1996-03-08'),(14,'Ethan Martinez','Child','2015-09-03'),(15,'Olivia Smith','Regular','1988-07-12'),(16,'Mason Turner','Child','2012-12-01'),(17,'Sophia Allen','Regular','1992-08-22'),(18,'Logan Taylor','Regular','1981-11-15'),(19,'Avery Williams','Senior Citizen','1948-02-10'),(20,'Ella Wilson','Child','2010-05-18'),(21,'Liam Anderson','Regular','1984-09-06'),(22,'Ava Walker','Regular','1998-06-20'),(23,'Noah Davis','Child','2013-03-25'),(24,'Sophia Thomas','Senior Citizen','1945-07-03'),(25,'Jackson Martinez','Regular','1981-01-28'),(26,'Emma Martin','Child','2014-09-10'),(27,'Aiden Turner','Regular','1985-07-15'),(28,'Mia Harris','Senior Citizen','1940-11-28'),(29,'Liam Allen','Child','2011-01-22'),(30,'Olivia Turner','Regular','1986-07-08'),(31,'Lucas Martin','Regular','1991-12-18'),(32,'Ava Allen','Child','2012-05-20'),(33,'Liam Walker','Senior Citizen','1947-10-15'),(34,'Emma Turner','Regular','1996-03-30'),(35,'Jackson Harris','Child','2012-07-15'),(36,'Mia Turner','Regular','1984-11-28'),(37,'Aiden Wilson','Regular','1992-05-20'),(38,'Sophia Taylor','Child','2011-07-12'),(39,'Ella Walker','Regular','1980-02-10'),(40,'Liam Harris','Child','2015-05-18'),(41,'Ava Jackson','Senior Citizen','1945-11-28'),(42,'Jackson Taylor','Regular','1983-05-20'),(43,'Emma Harris','Child','2010-01-22'),(44,'Mia Walker','Regular','1986-10-15'),(45,'Lucas Taylor','Regular','1991-03-30'),(46,'Olivia Allen','Child','2012-07-15'),(47,'Noah Turner','Senior Citizen','1942-11-28'),(48,'Sophia Walker','Regular','1989-05-20'),(49,'Jackson Allen','Child','2010-09-05'),(50,'Emma Turner','Regular','1984-12-18'),(51,'Aiden Harris','Child','2012-03-30'),(52,'Mia Martin','Senior Citizen','1940-07-03'),(53,'Liam Walker','Child','2015-01-28'),(54,'Ava Harris','Regular','1981-06-22'),(55,'Lucas Taylor','Child','2015-09-05'),(56,'Emma Allen','Regular','1984-12-18'),(57,'Aiden Jackson','Child','2012-07-15'),(58,'Sophia Walker','Senior Citizen','1945-11-28'),(59,'Jackson Turner','Regular','1983-05-20'),(60,'Olivia Harris','Child','2010-01-22'),(61,'Aarav Patel','Regular','1988-07-15'),(62,'Zhang Wei','Regular','1985-03-22'),(63,'Priya Sharma','Regular','1992-12-05'),(64,'Liu Jie','Child','2015-08-10'),(65,'Rahul Kapoor','Senior Citizen','1945-04-18'),(66,'Li Mei','Regular','1978-09-30'),(67,'Ishaan Verma','Child','2010-02-25'),(68,'Wang Chen','Regular','1990-11-08'),(69,'Aishwarya Singh','Regular','1982-06-12'),(70,'Xiao Jing','Regular','1987-01-28'),(71,'Arjun Kumar','Senior Citizen','1950-10-15'),(72,'Lin Mei','Regular','1989-05-20'),(73,'Neha Gupta','Regular','1991-03-08'),(74,'Chen Wei','Child','2014-09-03'),(75,'Suresh Patel','Regular','1983-07-12'),(76,'Zhang Ying','Child','2012-12-01'),(77,'Ananya Singh','Regular','1986-08-22'),(78,'Wu Lei','Regular','1994-04-28'),(79,'Rohan Kumar','Regular','1980-11-15'),(80,'Xu Mei','Senior Citizen','1948-02-10'),(81,'Akshay Patel','Regular','1986-07-15'),(82,'Li Chen','Child','2011-09-05'),(83,'Sneha Kapoor','Regular','1989-12-18'),(84,'Wang Mei','Regular','1995-03-30'),(85,'Raj Kumar','Child','2012-07-15'),(86,'Xiao Wang','Senior Citizen','1945-11-28'),(87,'Neha Singh','Regular','1983-05-20'),(88,'Chen Xia','Child','2010-01-22'),(89,'Rohit Gupta','Regular','1986-10-15'),(90,'Zhang Tao','Regular','1992-03-30'),(91,'Sanya Singh','Child','2011-07-12'),(92,'Li Xin','Regular','1980-02-10'),(93,'Aisha Patel','Child','2015-05-18'),(94,'Wu Xin','Regular','1989-09-06'),(95,'Kabir Gupta','Regular','1991-06-20'),(96,'Xiao Chen','Senior Citizen','1948-03-25'),(97,'Ishan Sharma','Regular','1996-07-03'),(98,'Zhang Xiu','Child','2014-01-28'),(99,'Ananya Kumar','Regular','1981-06-22'),(100,'Mei Hui','Child','2015-09-05');
/*!40000 ALTER TABLE `travelers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelers_trackinglogs`
--

DROP TABLE IF EXISTS `travelers_trackinglogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelers_trackinglogs` (
  `Tracking_ID` int NOT NULL,
  `TimeOfEntry` datetime DEFAULT NULL,
  `TimeOfExit` datetime DEFAULT NULL,
  `FARE_ID` int DEFAULT NULL,
  `Station_ID` int DEFAULT NULL,
  `FeedbackCategory_ID` int DEFAULT NULL,
  `Traveler_ID` int DEFAULT NULL,
  PRIMARY KEY (`Tracking_ID`),
  KEY `fk_travelers_trackinglogs_station` (`Station_ID`),
  KEY `fk_travelers_trackinglogs_feedbackcategory` (`FeedbackCategory_ID`),
  KEY `fk_travelers_trackinglogs_traveler` (`Traveler_ID`),
  KEY `fk_FARE_id` (`FARE_ID`),
  CONSTRAINT `fk_FARE_id` FOREIGN KEY (`FARE_ID`) REFERENCES `fare` (`Fare_ID`),
  CONSTRAINT `fk_travelers_trackinglogs_feedbackcategory` FOREIGN KEY (`FeedbackCategory_ID`) REFERENCES `feedbackcategory` (`FeedbackCategory_ID`),
  CONSTRAINT `fk_travelers_trackinglogs_station` FOREIGN KEY (`Station_ID`) REFERENCES `stations` (`Station_ID`),
  CONSTRAINT `fk_travelers_trackinglogs_traveler` FOREIGN KEY (`Traveler_ID`) REFERENCES `travelers` (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelers_trackinglogs`
--

LOCK TABLES `travelers_trackinglogs` WRITE;
/*!40000 ALTER TABLE `travelers_trackinglogs` DISABLE KEYS */;
INSERT INTO `travelers_trackinglogs` VALUES (1,'2023-12-01 08:30:00','2023-12-01 11:00:00',21,5,2,10),(2,'2023-12-02 10:15:00','2023-12-02 13:00:00',16,12,3,25),(3,'2023-12-03 12:00:00','2023-12-03 14:45:00',30,18,1,7),(4,'2023-12-04 14:30:00','2023-12-04 17:15:00',25,9,4,50),(5,'2023-12-05 16:15:00','2023-12-05 18:45:00',19,15,2,15),(6,'2023-12-06 18:00:00','2023-12-06 20:30:00',23,20,3,33),(7,'2023-12-07 19:45:00','2023-12-07 22:15:00',14,6,1,81),(8,'2023-12-08 21:30:00','2023-12-08 00:00:00',28,11,4,44),(9,'2023-12-09 23:15:00','2023-12-10 02:45:00',19,3,2,99),(10,'2023-12-10 00:45:00','2023-12-10 03:30:00',16,22,3,21),(11,'2023-12-11 02:30:00','2023-12-11 05:00:00',24,8,1,62),(12,'2023-12-12 04:15:00','2023-12-12 06:45:00',22,16,4,37),(13,'2023-12-13 06:00:00','2023-12-13 08:30:00',15,7,2,14),(14,'2023-12-14 07:45:00','2023-12-14 10:15:00',29,14,3,55),(15,'2023-12-15 09:30:00','2023-12-15 12:00:00',17,19,1,29),(16,'2023-12-16 11:00:00','2023-12-16 13:45:00',26,10,4,73),(17,'2023-12-17 13:45:00','2023-12-17 16:30:00',19,4,2,92),(18,'2023-12-18 15:30:00','2023-12-18 18:00:00',22,21,3,68),(19,'2023-12-19 17:15:00','2023-12-19 19:45:00',15,1,1,5),(20,'2023-12-20 19:00:00','2023-12-20 21:30:00',27,17,4,88),(21,'2023-12-21 08:00:00','2023-12-21 10:00:00',21,23,2,12),(22,'2023-12-22 10:30:00','2023-12-22 13:15:00',16,13,3,43),(23,'2023-12-23 12:15:00','2023-12-23 14:45:00',30,5,1,75),(24,'2023-12-24 14:45:00','2023-12-24 17:30:00',25,9,4,19),(25,'2023-12-25 16:30:00','2023-12-25 19:00:00',19,15,2,63),(26,'2023-12-26 18:15:00','2023-12-26 20:45:00',23,20,3,89),(27,'2023-12-27 20:00:00','2023-12-27 22:30:00',14,6,1,27),(28,'2023-12-28 21:45:00','2023-12-28 00:15:00',28,11,4,58),(29,'2023-12-29 23:30:00','2023-12-30 02:00:00',19,3,2,95),(30,'2023-12-30 01:15:00','2023-12-30 03:45:00',16,22,3,34),(31,'2024-01-01 08:30:00','2024-01-01 11:00:00',21,8,2,16),(32,'2024-01-02 10:15:00','2024-01-02 13:00:00',16,17,3,42),(33,'2024-01-03 12:00:00','2024-01-03 14:45:00',30,10,1,77),(34,'2024-01-04 14:30:00','2024-01-04 17:15:00',25,4,4,3),(35,'2024-01-05 16:15:00','2024-01-05 18:45:00',19,21,2,28),(36,'2024-01-06 18:00:00','2024-01-06 20:30:00',23,15,3,61),(37,'2024-01-07 19:45:00','2024-01-07 22:15:00',14,6,1,93),(38,'2024-01-08 21:30:00','2024-01-08 00:00:00',28,12,4,23),(39,'2024-01-09 23:15:00','2024-01-10 02:45:00',19,7,2,84),(40,'2024-01-10 00:45:00','2024-01-10 03:30:00',16,22,3,49),(41,'2024-01-11 02:30:00','2024-01-11 05:00:00',24,9,1,11),(42,'2024-01-12 04:15:00','2024-01-12 06:45:00',22,19,4,36),(43,'2024-01-13 06:00:00','2024-01-13 08:30:00',15,1,2,72),(44,'2024-01-14 07:45:00','2024-01-14 10:15:00',29,13,3,98),(45,'2024-01-15 09:30:00','2024-01-15 12:00:00',17,20,1,31),(46,'2024-01-16 11:00:00','2024-01-16 13:45:00',26,5,4,67),(47,'2024-01-17 13:45:00','2024-01-17 16:30:00',19,18,2,14),(48,'2024-01-18 15:30:00','2024-01-18 18:00:00',22,11,3,55),(49,'2024-01-19 17:15:00','2024-01-19 19:45:00',15,3,1,80),(50,'2024-01-20 19:00:00','2024-01-20 21:30:00',27,14,4,17);
/*!40000 ALTER TABLE `travelers_trackinglogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekly_charliecard`
--

DROP TABLE IF EXISTS `weekly_charliecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekly_charliecard` (
  `CC_ID` int NOT NULL,
  `Traveler_ID` int DEFAULT NULL,
  PRIMARY KEY (`CC_ID`),
  KEY `fk_weekly_charliecard_traveler` (`Traveler_ID`),
  CONSTRAINT `fk_weekly_charliecard_traveler` FOREIGN KEY (`Traveler_ID`) REFERENCES `travelers` (`Traveler_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekly_charliecard`
--

LOCK TABLES `weekly_charliecard` WRITE;
/*!40000 ALTER TABLE `weekly_charliecard` DISABLE KEYS */;
INSERT INTO `weekly_charliecard` VALUES (30,4),(2,8),(75,11),(17,14),(54,18),(37,20),(22,25),(89,26),(11,31),(74,32),(56,37),(99,40),(83,44),(14,47),(27,51),(71,53),(63,57),(49,59),(88,65),(46,70),(28,76),(76,82),(95,87),(45,93),(68,99);
/*!40000 ALTER TABLE `weekly_charliecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mbta_2.0'
--

--
-- Dumping routines for database 'mbta_2.0'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 17:04:54
