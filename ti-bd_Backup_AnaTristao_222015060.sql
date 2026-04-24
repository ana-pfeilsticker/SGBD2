-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: bike_share_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `long` decimal(10,6) NOT NULL,
  `dock_count` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `installation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `station_id` int NOT NULL,
  `time` datetime NOT NULL,
  `bikes_available` int NOT NULL,
  `docks_available` int NOT NULL,
  PRIMARY KEY (`station_id`,`time`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL,
  `duration` int NOT NULL,
  `start_date` datetime NOT NULL,
  `start_station_name` varchar(100) NOT NULL,
  `end_date` datetime NOT NULL,
  `end_station_name` varchar(100) NOT NULL,
  `bike_id` int NOT NULL,
  `subscription_type` varchar(50) NOT NULL,
  `start_station_id` int NOT NULL,
  `end_station_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_station_id` (`start_station_id`),
  KEY `end_station_id` (`end_station_id`),
  KEY `date` (`date`,`zip_code`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`start_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`end_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `trip_ibfk_3` FOREIGN KEY (`date`, `zip_code`) REFERENCES `weather` (`date`, `zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `date` date NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `max_temperature_f` int DEFAULT NULL,
  `mean_temperature_f` int DEFAULT NULL,
  `min_temperature_f` int DEFAULT NULL,
  `max_dew_point_f` int DEFAULT NULL,
  `mean_dew_point_f` int DEFAULT NULL,
  `min_dew_point_f` int DEFAULT NULL,
  `max_humidity` int DEFAULT NULL,
  `mean_humidity` int DEFAULT NULL,
  `min_humidity` int DEFAULT NULL,
  `max_sea_level_pressure` decimal(6,2) DEFAULT NULL,
  `mean_sea_level_pressure` decimal(6,2) DEFAULT NULL,
  `min_sea_level_pressure` decimal(6,2) DEFAULT NULL,
  `max_visibility_miles` int DEFAULT NULL,
  `mean_visibility_miles` int DEFAULT NULL,
  `min_visibility_miles` int DEFAULT NULL,
  `max_wind_Speed_mph` int DEFAULT NULL,
  `mean_wind_speed_mph` int DEFAULT NULL,
  `max_gust_speed_mph` int DEFAULT NULL,
  `precipitation_inches` decimal(6,2) DEFAULT NULL,
  `cloud_cover` int DEFAULT NULL,
  `events` varchar(100) DEFAULT NULL,
  `wind_dir_degrees` int DEFAULT NULL,
  PRIMARY KEY (`date`,`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 22:40:14
