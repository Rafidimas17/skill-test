-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: olympic-test-db
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `mar_mas_customer`
--

DROP TABLE IF EXISTS `mar_mas_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_mas_customer` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_mas_customer`
--

LOCK TABLES `mar_mas_customer` WRITE;
/*!40000 ALTER TABLE `mar_mas_customer` DISABLE KEYS */;
INSERT INTO `mar_mas_customer` VALUES ('CUS0001','Dara Arafah','SUMATERA SELATAN','PALEMBANG','Jl. Bahagia No 12'),('CUS0002','Raditya Dika','DKI JAKARTA','JAKARTA PUSAT','Jl. Kemerdekaan No 45'),('CUS0003','Jhonathan Cristie','JAWA TENGAH','SEMARANG','Jl. Tengah No 99'),('CUS0004','Desta Mahendra','JAWA TIMUR','MALANG','Jl. Ditempat No 105B'),('CUS0005','Irfan Hakim','JAWA TIMUR','KEDIRI','Jl. Sapu-Sapu No 67');
/*!40000 ALTER TABLE `mar_mas_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mar_mas_expedition`
--

DROP TABLE IF EXISTS `mar_mas_expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_mas_expedition` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_mas_expedition`
--

LOCK TABLES `mar_mas_expedition` WRITE;
/*!40000 ALTER TABLE `mar_mas_expedition` DISABLE KEYS */;
INSERT INTO `mar_mas_expedition` VALUES ('EKS0001','ABC EXPRESS'),('EKS0002','ITU CARGO');
/*!40000 ALTER TABLE `mar_mas_expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mar_mas_item`
--

DROP TABLE IF EXISTS `mar_mas_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_mas_item` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_mas_item`
--

LOCK TABLES `mar_mas_item` WRITE;
/*!40000 ALTER TABLE `mar_mas_item` DISABLE KEYS */;
INSERT INTO `mar_mas_item` VALUES ('ITM0001','Lemari 2 Pintu','OLYMPIC',2000.00),('ITM0002','Meja Tulis','OLYMPIC',800.00),('ITM0003','Rak Plastik','OLYMPLAST',500.00),('ITM0004','Kursi Anak','OLYMPLAST',400.00);
/*!40000 ALTER TABLE `mar_mas_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mar_mas_marketplace`
--

DROP TABLE IF EXISTS `mar_mas_marketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_mas_marketplace` (
  `id` varchar(10) NOT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_mas_marketplace`
--

LOCK TABLES `mar_mas_marketplace` WRITE;
/*!40000 ALTER TABLE `mar_mas_marketplace` DISABLE KEYS */;
INSERT INTO `mar_mas_marketplace` VALUES ('MP00001','SHOPEE','OLYMPIC','SHOPEE - OLYMPIC'),('MP00002','SHOPEE','OLYMPLAST','SHOPEE - OLYMPLAST');
/*!40000 ALTER TABLE `mar_mas_marketplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mar_tra_order`
--

DROP TABLE IF EXISTS `mar_tra_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_tra_order` (
  `id` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `marketplace_id` varchar(10) DEFAULT NULL,
  `expedition_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `marketplace_id` (`marketplace_id`),
  KEY `expedition_id` (`expedition_id`),
  CONSTRAINT `mar_tra_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `mar_mas_customer` (`id`),
  CONSTRAINT `mar_tra_order_ibfk_2` FOREIGN KEY (`marketplace_id`) REFERENCES `mar_mas_marketplace` (`id`),
  CONSTRAINT `mar_tra_order_ibfk_3` FOREIGN KEY (`expedition_id`) REFERENCES `mar_mas_expedition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_tra_order`
--

LOCK TABLES `mar_tra_order` WRITE;
/*!40000 ALTER TABLE `mar_tra_order` DISABLE KEYS */;
INSERT INTO `mar_tra_order` VALUES ('SO20090001','2020-09-25','CUS0001','MP00002','EKS0001'),('SO20090002','2020-09-26','CUS0002','MP00001','EKS0001'),('SO20090003','2020-09-27','CUS0003','MP00002','EKS0001'),('SO20090004','2020-09-28','CUS0003','MP00002','EKS0002'),('SO20100001','2020-10-02','CUS0004','MP00001','EKS0002'),('SO20100002','2020-10-03','CUS0001','MP00002','EKS0002'),('SO20100003','2020-10-04','CUS0005','MP00002','EKS0001'),('SO20100004','2020-10-05','CUS0001','MP00002','EKS0001'),('SO20100005','2020-10-06','CUS0005','MP00002','EKS0002'),('SO20100006','2020-10-07','CUS0001','MP00002','EKS0002');
/*!40000 ALTER TABLE `mar_tra_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mar_tra_order_detail`
--

DROP TABLE IF EXISTS `mar_tra_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mar_tra_order_detail` (
  `id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `order_id` varchar(20) DEFAULT NULL,
  `item_id` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `mar_tra_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `mar_tra_order` (`id`),
  CONSTRAINT `mar_tra_order_detail_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `mar_mas_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mar_tra_order_detail`
--

LOCK TABLES `mar_tra_order_detail` WRITE;
/*!40000 ALTER TABLE `mar_tra_order_detail` DISABLE KEYS */;
INSERT INTO `mar_tra_order_detail` VALUES (1001,'2020-09-25','SO20090001','ITM0003',4),(1002,'2020-09-26','SO20090002','ITM0001',1),(1003,'2020-09-27','SO20090002','ITM0002',1),(1004,'2020-09-28','SO20090003','ITM0003',8),(1005,'2020-09-29','SO20090004','ITM0004',1),(1006,'2020-10-02','SO20100001','ITM0001',1),(1007,'2020-10-02','SO20100001','ITM0002',2),(1008,'2020-10-02','SO20100001','ITM0003',2),(1009,'2020-10-02','SO20100001','ITM0004',4),(1010,'2020-10-03','SO20100002','ITM0004',1),(1011,'2020-10-04','SO20100003','ITM0004',1),(1012,'2020-10-05','SO20100004','ITM0003',1),(1013,'2020-10-06','SO20100005','ITM0004',3),(1014,'2020-10-07','SO20100006','ITM0003',2),(1015,'2020-10-07','SO20100006','ITM0004',2);
/*!40000 ALTER TABLE `mar_tra_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'olympic-test-db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19  0:04:49
