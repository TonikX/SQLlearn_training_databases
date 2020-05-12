-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_project
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id_garage` int NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `brand` varchar(20) NOT NULL,
  `id_employee` varchar(20) DEFAULT NULL,
  `id_car` int NOT NULL,
  PRIMARY KEY (`id_car`),
  KEY `R_2` (`id_garage`),
  KEY `R_32` (`id_employee`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`id_garage`) REFERENCES `garage` (`id_garage`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'M387AP','Volvo','2',1),(3,'T256AZ','Kamaz','1',2),(1,'O067PO','MAZ',NULL,3),(1,'M559ET','Kamaz','1',4),(3,'A987XY','GAZ','5',5),(1,'T654AK','Hyundai','4',6),(3,'B024EC','Volvo','6',7),(1,'B999AE','Volkswagen','4',8),(2,'K907PO','GAZ','8',9),(2,NULL,'UAZ',NULL,10),(13,'Z675OZ','Scania','17',19),(12,'O506Z0','MAZ','20',22),(11,'P333OP','MAZ','21',23),(10,'M649PM','MAZ','22',24),(9,'T295MT','Mercedes Benz','23',25),(8,'A353TA','Man','24',26),(7,'Z198AZ','Renault','25',27),(6,'O294OZ','Datsun','26',28),(5,'P937OP','Scania','27',29),(4,'M209MM','MAZ','28',30),(3,'T253TT','MAZ','27',31),(2,'A299AA','MAZ','26',32),(1,'Z969ZZ','Mercedes Benz','25',33),(5,'O292OO','Man','24',34),(6,'P486PP','Renault','23',35),(7,'M975OT','Scania','22',36),(8,'T267PA','MAZ','21',37),(9,'A100MZ','Datsun','20',38),(10,'Z228ZM','KRONE','19',39),(11,'O395AP','SCHMITZ','18',40),(12,'P957TO','SCHMITZ','17',41);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `qualification` int DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('1','Vasiliy','driver',2,'Perov'),('10','Misha','driver',2,'Antonov'),('11','Ctepan','driver',3,'Kolovanov'),('12','Vova','driver',3,'Bereza'),('13','Maksim','driver',2,'Gordienko'),('14','Anton','driver',3,'Dmitriev'),('15','Dima','driver',3,'Maksimov'),('16','Egor','driver',3,'Oreshnikov'),('17','Stepan','driver',2,'Saal'),('18','Petr','driver',2,'Samoletov'),('19','Roman','driver',2,'Safin'),('2','Dmitriy','driver',3,'Merkin'),('20','Ivan','driver',2,'Serov'),('21','Egor','driver',2,'Taranov'),('22','Daniil','driver',1,'Tarten'),('23','Aleksandr','driver',1,'Fomichev'),('24','Daniil','driver',1,'Xarchenko'),('25','Anton','driver',2,'Shinyavskiy'),('26','Dima','driver',2,'Yalovoi'),('27','Casha','driver',3,'Kovalenko'),('28','Danya','driver',2,'Demin'),('3','Konstantin','refueler',NULL,'Ryabov'),('4','Maxim','driver',1,'Kirov'),('5','Alexandr','driver',1,'Pushkin'),('6','Alexandr','driver',3,'Dubov'),('7','Pavel','refueler',NULL,'Kuznecov'),('8','Leonid','driver',2,'Kuzmin'),('9','Mihail','refueler',NULL,'Titov');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel`
--

DROP TABLE IF EXISTS `fuel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuel` (
  `fuel_brand` varchar(20) DEFAULT NULL,
  `kind` varchar(20) NOT NULL,
  `id_fuel` int NOT NULL,
  PRIMARY KEY (`id_fuel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel`
--

LOCK TABLES `fuel` WRITE;
/*!40000 ALTER TABLE `fuel` DISABLE KEYS */;
INSERT INTO `fuel` VALUES ('AI-92','petrol',1),('AI-95','petrol',2),('AI-98','petrol',3),('L','diesel',4),('Z','diesel',5),('A','diesel',6),('natural gas','gas',7),('electricity','electricity',8),('propane','gas',9),('methane','gas',10),('biodiesel','biodiesel',11);
/*!40000 ALTER TABLE `fuel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage`
--

DROP TABLE IF EXISTS `garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage` (
  `id_depot` int NOT NULL,
  `id_garage` int NOT NULL,
  `garage_address` varchar(20) NOT NULL,
  `num_garage` int DEFAULT NULL,
  PRIMARY KEY (`id_garage`),
  KEY `R_1` (`id_depot`),
  CONSTRAINT `garage_ibfk_1` FOREIGN KEY (`id_depot`) REFERENCES `motor_depot` (`id_depot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage`
--

LOCK TABLES `garage` WRITE;
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` VALUES (1,1,'Pulkovskaya av. 14',1),(1,2,'Narodnogo op.av. 159',2),(2,3,'Obukhovskii av. 120',3),(2,4,'Savushkina,8-1',21),(3,5,'Savushkina,8-2',22),(4,6,'Savushkina,12',23),(5,7,'Savushkina,13',4),(6,8,'Stachek,12',5),(7,9,'Stachek,14',6),(8,10,'Babushkina,11',7),(9,11,'Babushkina,9',8),(10,12,'Iasnaya,9',9),(11,13,'Iasnaya,10',10),(12,14,'Iasnaya,1-A',11),(13,15,'Iasnaya,1-B',12),(13,16,'Babushkina,12',13),(12,17,'Babushkina,14',14),(11,18,'Savushkina,13-1',15),(10,19,'Savushkina,13-1',16),(9,20,'Iasnaya,14-3',17),(8,21,'Iasnaya,16-1',18),(7,22,'Stachek,11',19),(6,23,'Stachek,13',20);
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor_depot`
--

DROP TABLE IF EXISTS `motor_depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor_depot` (
  `name_depot` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `id_depot` int NOT NULL,
  PRIMARY KEY (`id_depot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_depot`
--

LOCK TABLES `motor_depot` WRITE;
/*!40000 ALTER TABLE `motor_depot` DISABLE KEYS */;
INSERT INTO `motor_depot` VALUES ('Pulkovskaya','Pulkovskoye av. 12',1),('Grazhdanskaya','prospect Kultury 50',2),('Obukhovskaya','Obukhovskii av. 120',3),('KP-1','Obukhovskaya-1',4),('KP-2','Obukhovskaya-2',5),('KP-3','Obukhovskaya-3',6),('KP-4','Obukhovskaya-4',7),('KP-5','Obukhovskaya-5',8),('KP-6','Obukhovskaya-6',9),('KP-7','Obukhovskaya-7',10),('KP-8','Obukhovskaya-8',11),('KP-9','Obukhovskaya-9',12),('KP-10','Obukhovskaya-10',13);
/*!40000 ALTER TABLE `motor_depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refueling`
--

DROP TABLE IF EXISTS `refueling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refueling` (
  `fuel_qty` int NOT NULL,
  `id_refuel` int NOT NULL,
  `id_fuel` int DEFAULT NULL,
  `id_statement` int DEFAULT NULL,
  `id_waybill` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id_refuel`),
  KEY `R_38` (`id_waybill`),
  CONSTRAINT `refueling_ibfk_1` FOREIGN KEY (`id_waybill`) REFERENCES `waybill` (`id_waybill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refueling`
--

LOCK TABLES `refueling` WRITE;
/*!40000 ALTER TABLE `refueling` DISABLE KEYS */;
INSERT INTO `refueling` VALUES (50,1,2,1,'1'),(40,2,2,1,'2'),(40,3,1,1,'3'),(50,4,1,1,'4'),(40,5,1,1,'5'),(10,6,11,2,'6'),(75,7,5,2,'6'),(100,8,5,2,'7'),(125,9,5,2,'7'),(125,10,5,2,'9'),(15,11,7,3,'11'),(55,12,2,3,'11'),(40,13,2,3,'11'),(36,14,5,3,'13'),(138,15,5,3,'14'),(39,16,2,4,'15'),(15,17,9,4,'15'),(54,18,2,4,'16'),(45,19,5,4,'17'),(10,20,11,4,'18'),(44,21,5,4,'18'),(40,22,2,5,'19'),(10,23,7,5,'19'),(60,24,5,5,'20'),(26,25,11,5,'20'),(10,26,11,5,'22'),(112,27,5,5,'22'),(100,28,5,6,'23'),(5,29,11,6,'24'),(20,30,5,6,'24'),(79,31,5,6,'25'),(145,32,11,7,'26'),(43,33,3,7,'27'),(67,34,5,8,'28'),(75,35,11,13,'39'),(44,36,5,14,'40'),(10,37,2,14,'41'),(138,38,5,15,'42'),(39,39,11,15,'43'),(60,40,2,16,'44'),(100,41,3,16,'45'),(50,42,5,16,'46'),(40,43,11,17,'47'),(40,44,2,17,'48'),(50,45,3,18,'49');
/*!40000 ALTER TABLE `refueling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statement`
--

DROP TABLE IF EXISTS `statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statement` (
  `id_employee` varchar(20) NOT NULL,
  `date_st` date NOT NULL,
  `num_statement` int DEFAULT NULL,
  `id_statement` int NOT NULL,
  PRIMARY KEY (`id_statement`),
  KEY `R_10` (`id_employee`),
  CONSTRAINT `statement_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
INSERT INTO `statement` VALUES ('3','2020-02-20',1,1),('7','2020-02-21',2,2),('3','2020-02-22',3,3),('7','2020-02-23',4,4),('3','2020-02-24',5,5),('7','2020-02-25',6,6),('8','2020-02-25',7,7),('9','2020-02-26',8,8),('10','2020-02-27',9,9),('11','2020-02-28',10,10),('12','2020-02-29',11,11),('14','2020-03-21',13,13),('15','2020-03-22',14,14),('16','2020-03-23',15,15),('17','2020-03-24',16,16),('18','2020-03-25',17,17),('19','2020-03-25',18,18);
/*!40000 ALTER TABLE `statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waybill`
--

DROP TABLE IF EXISTS `waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waybill` (
  `num_waybill` int DEFAULT NULL,
  `loading_point` varchar(20) NOT NULL,
  `discharge_point` varchar(20) NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `total_mileage` int NOT NULL,
  `mileage_with_cargo` int DEFAULT NULL,
  `consignor` varchar(20) DEFAULT NULL,
  `id_car` int NOT NULL,
  `id_waybill` varchar(18) NOT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_waybill`),
  KEY `R_3` (`id_car`),
  CONSTRAINT `waybill_ibfk_1` FOREIGN KEY (`id_car`) REFERENCES `car` (`id_car`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waybill`
--

LOCK TABLES `waybill` WRITE;
/*!40000 ALTER TABLE `waybill` DISABLE KEYS */;
INSERT INTO `waybill` VALUES (1,'Pulkovskaya av. 12','Komsomola st. 1','OOO \"PPP\"',250,110,'OOO \"Flowers\"',6,'1','2020-02-20','2020-02-20'),(5,'Semenova st. 54','Sedova st. 7','OAO \"PETR\"',73,26,'OOO \"Sun\"',5,'10','2020-02-21','2020-02-21'),(6,'Serova st. 5','Dibenko st. 19','OAO \"Klein\"',318,68,'IP \"Kirov V.V.\"',1,'11','2020-02-22','2020-02-22'),(6,'Dibenko st.19','Mebelnaya st. 5','IP \"Kirov V.V.\"',77,54,'OAO \"Mebelnaya\"',1,'12','2020-02-22','2020-02-22'),(7,'Ivanovskaya st. 54','Bolshevikov av. 44','IP \"Lugovec S.M.\"',67,42,'OOO \"Fire\"',2,'13','2020-02-22','2020-02-22'),(7,'Shkolnaya st. 10','Komendantskii av. 69','ZAO \"Pryza\"',448,269,'OAO \"Rukodeliye\"',2,'14','2020-02-22','2020-02-23'),(8,'Prof. Popova st. 39','Shaumyana av. 128','OOO \"GAS\"',57,40,'OOO \"LEO\"',6,'15','2020-02-23','2020-02-23'),(8,'Gorokhovaya st. 44','Sedova st. 45','OOO \"Banki\"',287,158,'OOO \"Palki\"',6,'16','2020-02-23','2020-02-24'),(9,'Sovetskiy per. 1','Sverdlova st. 68','OOO \"Batman Ltd\"',130,103,'OOO \"Circle K\"',4,'17','2020-02-23','2020-02-23'),(9,'Transportnii per. 5','Obukhovskii av. 65','OOO \"Lev\"',217,164,'OOO \"Mir\"',4,'18','2020-02-23','2020-02-24'),(10,'Fontanki nab. 60','Kompositorov st. 16','ZAO \"STO\"',57,32,'OOO \"Bellow\"',1,'19','2020-02-24','2020-02-24'),(1,'Engelsa av. 33','Moskovskaya av. 56','OOO \"Zvetovic\"',500,200,'OOO \"Prazdnic\"',6,'2','2020-02-20','2020-02-21'),(11,'Urkhov per. 7','Shevchenko st. 39','OAO \"Meracle\"',642,521,'IP \"Mihailov S.V.\"',5,'20','2020-02-24','2020-02-25'),(10,'Makarova nab. 60','11-ya liniya VO, 64','OOO \"Orident\"',153,65,'OOO \"UMI\"',1,'21','2020-02-24','2020-02-24'),(12,'14-ya liniya VO, 67','Maly prospekt VO, 37','OOO\"Salat Lounge\"',472,249,'OOO\"Magnit\"',4,'22','2020-02-24','2020-02-24'),(13,'Gorokhovaya st. 51','Levashova av. 84','OOO\"Oh, My Bowl! \"',89,45,'OOO\"Adi\"',9,'23','2020-02-25','2020-02-25'),(13,'Apraksin per. 8','Turistskaya st. 59','OOO\"Rusfinans Bank\"',452,201,'OOO\"Western Union\"',9,'24','2020-02-25','2020-02-26'),(14,'Dumskaya st. 1','Parashutnaya st. 37','OOO\"Bushe\"',698,458,'OOO\"Sberbank\"',5,'25','2020-02-25','2020-02-26'),(15,'Engelsa av. 33','Moskovskaya av. 56','OOO \"Zvetovic\"',526,226,'OOO \"Prazdnic\"',33,'26','2020-03-10','2020-03-11'),(15,'Narodnaya st. 31','Ligovskii av. 89','OOO \"Brand\"',101,77,'OAO \"Zarya\"',34,'27','2020-03-10','2020-03-10'),(16,'Uralskaya st. 12','Ligovskii av. 79','OOO \"Bingo\"',124,74,'OAO \"Svet\"',22,'28','2020-03-10','2020-03-20'),(16,'Grota st. 3','Rubinshteina st. 65','ZAO \"Krot\"',85,59,'OOO \"Milya\"',23,'29','2020-03-10','2020-03-10'),(2,'Narodnaya st. 31','Ligovskii av. 89','OOO \"Brand\"',74,50,'OAO \"Zarya\"',7,'3','2020-02-20','2020-02-20'),(17,'Pestelya st. 23','Komsomola st.1','OAO \"Baloons\"',517,355,'OOO \"PPP\"',24,'30','2020-03-11','2020-03-12'),(17,'Moskovskaya av. 47','Dibenko st. 19','OOO \"San\"',157,96,'IP \"Kirov V.V.\"',25,'31','2020-03-11','2020-03-11'),(17,'Liteinii av. 127','Shkapina st. 43','IP \"Lugova A.K.\"',579,330,'OAO \"Shkapina\"',26,'32','2020-03-11','2020-03-12'),(18,'Kirova st. 87','Mira st. 3','OOO \"IKEA\"',131,87,'IP \"Pushkin A.S.\"',27,'33','2020-03-11','2020-03-11'),(18,'Semenova st. 54','Sedova st. 7','OAO \"PETR\"',107,60,'OOO \"Sun\"',28,'34','2020-03-11','2020-03-11'),(19,'Serova st. 5','Dibenko st. 19','OAO \"Klein\"',353,103,'IP \"Kirov V.V.\"',29,'35','2020-03-12','2020-03-12'),(19,'Dibenko st.19','Mebelnaya st. 5','IP \"Kirov V.V.\"',113,80,'OAO \"Mebelnaya\"',30,'36','2020-03-12','2020-03-12'),(20,'Ivanovskaya st. 54','Bolshevikov av. 44','IP \"Lugovec S.M.\"',104,79,'OOO \"Fire\"',31,'37','2020-03-12','2020-03-12'),(20,'Shkolnaya st. 10','Komendantskii av. 69','ZAO \"Pryza\"',486,307,'OAO \"Rukodeliye\"',32,'38','2020-03-12','2020-03-13'),(21,'Prof. Popova st. 39','Shaumyana av. 128','OOO \"GAS\"',96,79,'OOO \"LEO\"',33,'39','2020-03-13','2020-03-13'),(2,'Uralskaya st. 12','Ligovskii av. 79','OOO \"Bingo\"',96,46,'OAO \"Svet\"',7,'4','2020-02-20','2020-02-20'),(21,'Gorokhovaya st. 44','Sedova st. 45','OOO \"Banki\"',327,198,'OOO \"Palki\"',34,'40','2020-03-13','2020-03-14'),(22,'Sovetskiy per. 1','Sverdlova st. 68','OOO \"Batman Ltd\"',171,144,'OOO \"Circle K\"',35,'41','2020-03-13','2020-03-13'),(22,'Transportnii per. 5','Obukhovskii av. 65','OOO \"Lev\"',259,206,'OOO \"Mir\"',36,'42','2020-03-13','2020-03-14'),(23,'Fontanki nab. 60','Kompositorov st. 16','ZAO \"STO\"',100,75,'OOO \"Bellow\"',37,'43','2020-03-14','2020-03-14'),(24,'Urkhov per. 7','Shevchenko st. 39','OAO \"Meracle\"',686,565,'IP \"Mihailov S.V.\"',38,'44','2020-03-14','2020-03-15'),(23,'Makarova nab. 60','11-ya liniya VO, 64','OOO \"Orident\"',198,110,'OOO \"UMI\"',39,'45','2020-03-14','2020-03-14'),(25,'14-ya liniya VO, 67','Maly prospekt VO, 37','OOO\"Salat Lounge\"',618,295,'OOO\"Magnit\"',40,'46','2020-03-14','2020-03-14'),(26,'Gorokhovaya st. 51','Levashova av. 84','OOO\"Oh, My Bowl! \"',136,92,'OOO\"Adi\"',41,'47','2020-03-15','2020-03-15'),(26,'Apraksin per. 8','Turistskaya st. 59','OOO\"Rusfinans Bank\"',500,249,'OOO\"Western Union\"',35,'48','2020-03-15','2020-03-16'),(27,'Dumskaya st. 1','Parashutnaya st. 37','OOO\"Bushe\"',747,507,'OOO\"Sberbank\"',36,'49','2020-03-15','2020-03-16'),(2,'Grota st. 3','Rubinshteina st. 65','ZAO \"Krot\"',56,30,'OOO \"Milya\"',7,'5','2020-02-20','2020-02-20'),(3,'Pestelya st. 23','Komsomola st.1','OAO \"Baloons\"',487,325,'OOO \"PPP\"',4,'6','2020-02-21','2020-02-22'),(4,'Moskovskaya av. 47','Dibenko st. 19','OOO \"San\"',126,65,'IP \"Kirov V.V.\"',9,'7','2020-02-21','2020-02-21'),(4,'Liteinii av. 127','Shkapina st. 43','IP \"Lugova A.K.\"',547,298,'OAO \"Shkapina\"',9,'8','2020-02-21','2020-02-22'),(5,'Kirova st. 87','Mira st. 3','OOO \"IKEA\"',98,54,'IP \"Pushkin A.S.\"',5,'9','2020-02-21','2020-02-21');
/*!40000 ALTER TABLE `waybill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-28 20:29:57
