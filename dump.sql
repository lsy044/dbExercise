-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db2017160339
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(15) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (10,'라이언 고슬링'),(11,'엠마스톤'),(13,'앤 해서웨이'),(14,'공유'),(15,'정유미'),(16,'마동석'),(27,'김태리'),(30,'aaa');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!50001 DROP VIEW IF EXISTS `acts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `acts` (
  `m_id` tinyint NOT NULL,
  `m_title` tinyint NOT NULL,
  `g_id` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `a_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `acts_in`
--

DROP TABLE IF EXISTS `acts_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acts_in` (
  `a_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`a_id`,`m_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `acts_in_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `movie` (`m_id`),
  CONSTRAINT `acts_in_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `actors` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts_in`
--

LOCK TABLES `acts_in` WRITE;
/*!40000 ALTER TABLE `acts_in` DISABLE KEYS */;
INSERT INTO `acts_in` VALUES (10,151),(11,151),(13,37),(14,40),(14,41),(15,41);
/*!40000 ALTER TABLE `acts_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`s_ID`),
  KEY `i_ID` (`i_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`),
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES ('12345','10101'),('44553','22222'),('45678','22222'),('00128','45565'),('76543','45565'),('23121','76543'),('98988','76766'),('76653','98345'),('98765','98345');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles`
--

DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles` (
  `b_name` varchar(15) NOT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` VALUES ('가가',1502),('나나',1602),('노량',2018),('다다다',1702),('라라라라',1802),('마마마',1945);
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `guest_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_id` int(3) NOT NULL,
  `date_from` int(6) NOT NULL,
  `date_to` int(6) NOT NULL,
  PRIMARY KEY (`guest_id`,`hotel_id`,`room_id`,`date_from`,`date_to`),
  KEY `hotel_id` (`hotel_id`,`room_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`hotel_id`, `room_id`) REFERENCES `room` (`hotel_id`, `room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (11,4,301,190301,190331),(22,3,101,190505,190509),(33,1,102,190302,190309),(33,5,202,190404,190411),(44,2,101,190909,190910),(44,6,101,190909,190910),(55,1,101,190708,190711),(55,2,101,190715,190722);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `isbn` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `authors` varchar(20) DEFAULT NULL,
  `publisher` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (111,'book1','nayana','uu'),(222,'hihi2','a','p'),(333,'lee3','aaa','ppp'),(444,'hi4','a4','p'),(555,'le5','a','pp'),(666,'h22i4','a14','p'),(777,'h22i4','a14','pytry');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowed` (
  `memb_no` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`memb_no`,`isbn`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`),
  CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`memb_no`) REFERENCES `member` (`memb_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES (1,111,NULL),(1,222,NULL),(1,444,NULL),(2,111,190322),(2,222,NULL),(2,333,NULL),(2,555,NULL),(3,333,NULL);
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class` varchar(10) NOT NULL,
  `type` varchar(3) DEFAULT NULL,
  `num_guns` int(11) DEFAULT NULL,
  `displacement` int(11) DEFAULT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('광개토대왕함급','AA',1000,5500),('나주배함급','CC',500,3300),('미세미세함급','DDD',300,2500),('세종대왕함급','AAA',2000,7500),('제주감귤함급','BB',700,5100);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('Packard','101',500),('Painter','514',10),('Taylor','3128',70),('Watson','100',30),('Watson','120',50);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) NOT NULL,
  `credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BIO-101','Intro. to Biology','Biology',4),('BIO-301','Genetics','Biology',4),('BIO-399','Computational Biology','Biology',3),('CS-101','Intro. to Computer Science','Comp. Sci.',4),('CS-190','Game Design','Comp. Sci.',4),('CS-315','Robotics','Comp. Sci.',3),('CS-319','Image Processing','Comp. Sci.',3),('CS-347','Database System Concepts','Comp. Sci.',3),('EE-181','Intro. to Digital Systems','Elec. Eng.',3),('FIN-201','Investment Banking','Finance',3),('HIS-351','World History','History',3),('MU-199','Music Video Production','Music',3),('PHY-101','Physical Principles','Physics',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Biology','Watson',90000.00),('Comp. Sci.','Taylor',100000.00),('Elec. Eng.','Taylor',85000.00),('Finance','Painter',120000.00),('History','Painter',50000.00),('Music','Packard',80000.00),('Physics','Watson',70000.00);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!50001 DROP VIEW IF EXISTS `enrollment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `enrollment` (
  `course_id` tinyint NOT NULL,
  `sec_id` tinyint NOT NULL,
  `enrollment` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_type` varchar(10) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'코미디'),(2,'로맨스'),(3,'다큐멘터리'),(4,'공포'),(5,'판타지'),(6,'SF'),(7,'액션'),(8,'드라마'),(9,'애니메이션'),(10,'뮤지컬');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_name` varchar(8) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `guest_city` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (11,'홍길동',54,'인천'),(22,'김철수',41,'하노이'),(33,'이영희',26,'서울'),(44,'박사람',60,'오사카'),(55,'최고야',33,'호놀룰루');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(7) DEFAULT NULL,
  `city` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'한국호텔','서울'),(2,'영국호텔','런던'),(3,'일본호텔','삿포로'),(4,'제주호텔','제주'),(5,'미국호텔','캘리포니아'),(6,'테스츠호텔','런던');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `ID` char(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('10101','Srinivasan','Comp. Sci.',65000.00),('12121','Wu','Finance',90000.00),('15151','Mozart','Music',40000.00),('22222','Einstein','Physics',95000.00),('32343','El Said','History',60000.00),('33456','Gold','Physics',87000.00),('45565','Katz','Comp. Sci.',75000.00),('58583','Califieri','History',62000.00),('76543','Singh','Finance',80000.00),('76766','Crick','Biology',72000.00),('83821','Brandt','Comp. Sci.',92000.00),('98345','Kim','Elec. Eng.',80000.00);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `memb_no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`memb_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'sooyooung'),(2,'jinnie'),(3,'lee');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_title` varchar(30) NOT NULL,
  `g_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `g_id` (`g_id`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `genre` (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (37,'인터스텔라',6,2014,'미국','.jpg'),(38,'라라랜드',10,2017,'미국','LALA.jpg'),(40,'김종욱 찾기',2,2010,'한국','movie_image (1).jpg'),(41,'부산행',7,2016,'한국','attachImage_1977258130.jpeg'),(139,'타이타닉',8,0,'',NULL),(151,'명예의 전당 테스트',3,1989,'대한민국',NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcomes`
--

DROP TABLE IF EXISTS `outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcomes` (
  `s_name` varchar(10) NOT NULL,
  `b_name` varchar(15) NOT NULL,
  `result` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`s_name`,`b_name`),
  KEY `b_name` (`b_name`),
  CONSTRAINT `outcomes_ibfk_1` FOREIGN KEY (`s_name`) REFERENCES `ships` (`s_name`),
  CONSTRAINT `outcomes_ibfk_2` FOREIGN KEY (`b_name`) REFERENCES `battles` (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcomes`
--

LOCK TABLES `outcomes` WRITE;
/*!40000 ALTER TABLE `outcomes` DISABLE KEYS */;
INSERT INTO `outcomes` VALUES ('미세미세함','노량','침몰'),('세종대왕함','가가','ok'),('세종대왕함','나나','ok'),('세종대왕함','다다다','ok'),('세종대왕함','라라라라','ok'),('세종대왕함','마마마','손상'),('제주감귤함','노량','손상');
/*!40000 ALTER TABLE `outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('BIO-301','BIO-101'),('BIO-399','BIO-101'),('CS-190','CS-101'),('CS-315','CS-101'),('CS-319','CS-101'),('CS-347','CS-101'),('EE-181','PHY-101');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_password` varchar(10) NOT NULL,
  `content` text NOT NULL,
  `score` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`r_id`,`m_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `movie` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (24,'2f37b9c6c4','재밌어요! ',5,37),(26,'2f37b9c6c4','잼씀',5,37);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `hotel_id` int(11) NOT NULL,
  `room_id` int(3) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`,`room_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,101,'single_room',100),(1,102,'double_room',200),(2,101,'single_room',200),(2,201,'single_room',300),(3,101,'double_room',400),(4,301,'premium_room',600),(5,202,'double_room',550),(6,101,'single_room',100);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` int(11) NOT NULL,
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `time_slot_id` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `building` (`building`,`room_number`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`),
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('BIO-101','1','Summer',2009,'Painter','514','B'),('BIO-301','1','Summer',2010,'Painter','514','A'),('CS-101','1','Fall',2009,'Packard','101','H'),('CS-101','1','Spring',2010,'Packard','101','F'),('CS-190','1','Spring',2009,'Taylor','3128','E'),('CS-190','2','Spring',2009,'Taylor','3128','A'),('CS-315','1','Spring',2010,'Watson','120','D'),('CS-319','1','Spring',2010,'Watson','100','B'),('CS-319','2','Spring',2010,'Taylor','3128','C'),('CS-347','1','Fall',2009,'Taylor','3128','A'),('EE-181','1','Spring',2009,'Taylor','3128','C'),('FIN-201','1','Spring',2010,'Packard','101','B'),('HIS-351','1','Spring',2010,'Painter','514','C'),('MU-199','1','Spring',2010,'Packard','101','D'),('PHY-101','1','Fall',2009,'Watson','100','A');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ships` (
  `s_name` varchar(10) NOT NULL,
  `class` varchar(10) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `launched` int(4) DEFAULT NULL,
  PRIMARY KEY (`s_name`),
  KEY `class` (`class`),
  CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES ('광개토대왕함','광개토대왕함급','대한민국',1601),('나주배함','나주배함급','중국',1801),('미세미세함','미세미세함급','중국',2018),('세종대왕함','세종대왕함급','대한민국',1501),('제주감귤함','제주감귤함급','대한민국',2018),('테스트함','세종대왕함급','중국',2009),('훈민정음함','세종대왕함급','대한민국',2002);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('00000','ShinHwan Kang','Comp. Sci.',100),('00001','HoeHoon Jung','Comp. Sci.',100),('00128','Zhang','Comp. Sci.',102),('12345','Shankar','Comp. Sci.',32),('19991','Brandt','History',80),('23121','Chavez','Finance',110),('44553','Peltier','Physics',56),('45678','Levy','Physics',46),('54321','Williams','Comp. Sci.',54),('55739','Sanchez','Music',38),('70557','Snow','Physics',0),('76543','Brown','Comp. Sci.',58),('76653','Aoi','Elec. Eng.',60),('98765','Bourikas','Elec. Eng.',98),('98988','Tanaka','Biology',120);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` int(11) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`),
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('00000','CS-347','1','Fall',2009,'A+'),('00001','CS-347','1','Fall',2009,'A+'),('00128','CS-101','1','Fall',2009,'A'),('00128','CS-347','1','Fall',2009,'A-'),('12345','CS-101','1','Fall',2009,'C'),('12345','CS-190','2','Spring',2009,'A'),('12345','CS-315','1','Spring',2010,'A'),('12345','CS-347','1','Fall',2009,'A'),('19991','HIS-351','1','Spring',2010,'B'),('23121','FIN-201','1','Spring',2010,'C+'),('44553','PHY-101','1','Fall',2009,'B-'),('45678','CS-101','1','Fall',2009,'F'),('45678','CS-101','1','Spring',2010,'B+'),('45678','CS-319','1','Spring',2010,'B'),('54321','CS-101','1','Fall',2009,'A-'),('54321','CS-190','2','Spring',2009,'B+'),('55739','MU-199','1','Spring',2010,'A-'),('76543','CS-101','1','Fall',2009,'A'),('76543','CS-319','2','Spring',2010,'A'),('76653','EE-181','1','Spring',2009,'C'),('98765','CS-101','1','Fall',2009,'C-'),('98765','CS-315','1','Spring',2010,'B'),('98988','BIO-101','1','Summer',2009,'A'),('98988','BIO-301','1','Summer',2010,NULL);
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`),
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('10101','CS-101','1','Fall',2009),('10101','CS-315','1','Spring',2010),('10101','CS-347','1','Fall',2009),('12121','FIN-201','1','Spring',2010),('15151','MU-199','1','Spring',2010),('22222','PHY-101','1','Fall',2009),('32343','HIS-351','1','Spring',2010),('45565','CS-101','1','Spring',2010),('45565','CS-319','1','Spring',2010),('76766','BIO-101','1','Summer',2009),('76766','BIO-301','1','Summer',2010),('83821','CS-190','1','Spring',2009),('83821','CS-190','2','Spring',2009),('83821','CS-319','2','Spring',2010),('98345','EE-181','1','Spring',2009);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `test`
--

DROP TABLE IF EXISTS `test`;
/*!50001 DROP VIEW IF EXISTS `test`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `test` (
  `course_id` tinyint NOT NULL,
  `sec_id` tinyint NOT NULL,
  `enrollment` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) NOT NULL,
  `end_min` decimal(2,0) NOT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('A','F',8,0,8,50),('A','M',8,0,8,50),('A','W',8,0,8,50),('B','F',9,0,9,50),('B','M',9,0,9,50),('B','W',9,0,9,50),('C','F',11,0,11,50),('C','M',11,0,11,50),('C','W',11,0,11,50),('D','F',13,0,13,50),('D','M',13,0,13,50),('D','W',13,0,13,50),('E','R',10,30,11,45),('E','T',10,30,11,45),('F','R',14,30,15,45),('F','T',14,30,15,45),('G','F',16,0,16,50),('G','M',16,0,16,50),('G','W',16,0,16,50),('H','W',10,0,12,30);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `acts`
--

/*!50001 DROP TABLE IF EXISTS `acts`*/;
/*!50001 DROP VIEW IF EXISTS `acts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`db2017160339`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acts` AS select `movie`.`m_id` AS `m_id`,`movie`.`m_title` AS `m_title`,`movie`.`g_id` AS `g_id`,`movie`.`year` AS `year`,`movie`.`country` AS `country`,`movie`.`image` AS `image`,`acts_in`.`a_id` AS `a_id` from (`movie` join `acts_in` on((`movie`.`m_id` = `acts_in`.`m_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `enrollment`
--

/*!50001 DROP TABLE IF EXISTS `enrollment`*/;
/*!50001 DROP VIEW IF EXISTS `enrollment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`db2017160339`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enrollment` AS select `takes`.`course_id` AS `course_id`,`takes`.`sec_id` AS `sec_id`,count(distinct `takes`.`ID`) AS `enrollment` from `takes` where ((`takes`.`semester` = 'fall') and (`takes`.`year` = 2009)) group by `takes`.`course_id`,`takes`.`sec_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test`
--

/*!50001 DROP TABLE IF EXISTS `test`*/;
/*!50001 DROP VIEW IF EXISTS `test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`db2017160339`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test` AS (select `takes`.`course_id` AS `course_id`,`takes`.`sec_id` AS `sec_id`,count(`takes`.`ID`) AS `enrollment` from `takes` where ((`takes`.`year` = 2009) and (`takes`.`semester` = 'fall')) group by `takes`.`course_id`,`takes`.`sec_id`) */;
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

-- Dump completed on 2020-02-10 15:40:59
