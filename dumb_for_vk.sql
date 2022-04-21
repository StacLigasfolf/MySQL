-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_19
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `media_id` (`media_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `Comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_post` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `Posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `Posts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `community_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'voluptates',16),(2,'ut',17),(3,'atque',18),(4,'perferendis',19),(5,'iusto',20),(6,'qui',21),(7,'dolore',22),(8,'doloremque',23),(9,'harum',24),(10,'voluptas',25),(11,'assumenda',26),(12,'sit',28),(13,'qui',29),(14,'enim',30),(15,'iste',16);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frends_requests`
--

DROP TABLE IF EXISTS `frends_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frends_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `frends_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `frends_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frends_requests`
--

LOCK TABLES `frends_requests` WRITE;
/*!40000 ALTER TABLE `frends_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `frends_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,16,1,'1973-07-23 06:13:23'),(2,17,2,'1987-11-29 22:27:02'),(3,18,3,'2003-09-23 00:32:57'),(4,19,4,'2010-05-18 16:07:20'),(5,20,1,'2008-09-24 07:44:25'),(6,21,2,'1974-04-26 11:51:49'),(7,22,3,'1982-03-01 10:35:39'),(8,23,4,'2019-06-05 13:18:25'),(9,24,1,'1981-04-17 00:55:00'),(10,25,2,'1990-07-10 22:15:47'),(11,26,3,'2007-09-30 22:22:37'),(12,28,4,'2001-12-03 21:37:28'),(13,29,1,'1979-12-07 19:25:34'),(14,30,2,'1971-01-25 20:59:25'),(15,16,3,'1974-04-03 09:50:29');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,16,'Dolore corporis omnis qui sit. Et et nemo commodi dolores. Animi ut eum ratione mollitia. Similique eaque odit iusto laborum neque quo.','omnis',541,NULL,'2016-03-25 13:34:11','1980-03-31 07:50:10'),(2,2,17,'Explicabo sapiente at sapiente non aperiam provident adipisci sed. Ratione dolor quod nihil culpa rerum error. Eius dignissimos delectus aut corporis. Ut dignissimos veritatis aspernatur omnis repudiandae aliquam modi.','tenetur',30991101,NULL,'2009-11-17 21:57:14','2008-02-16 03:09:40'),(3,3,18,'Dolor distinctio maxime possimus non. Quae suscipit id dolor quod. Corporis corporis nulla alias architecto qui minus vitae. Dolorum ea qui qui ut accusamus quia.','possimus',257321000,NULL,'1999-08-14 15:44:57','2009-03-19 16:08:31'),(4,4,19,'Doloribus delectus quis praesentium a cum voluptas esse. Commodi dolores voluptatem illum non voluptate consequatur consequatur. Nostrum ipsa et libero voluptatem.','consequatur',55986643,NULL,'1973-01-19 02:45:40','1984-02-23 11:34:47');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `namme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,NULL,'1982-10-02 00:22:40','2005-09-24 05:09:54'),(2,NULL,'1995-10-06 02:02:55','2020-06-27 07:01:17'),(3,NULL,'1971-02-05 11:43:58','2018-01-03 02:57:03'),(4,NULL,'1980-06-01 07:21:43','2008-07-08 01:46:08');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,16,16,'Accusantium quia autem voluptas omnis est. Eaque et placeat quo nulla enim. Odit sint ut libero consequatur. Exercitationem nisi sint pariatur magnam eum repellendus.','1981-10-23 13:21:16'),(2,17,17,'Quam unde fugiat non assumenda nulla ullam. Unde et rerum earum architecto fuga aut. Repudiandae consequuntur culpa soluta consequuntur. Rerum excepturi omnis eum tempora.','2006-07-05 09:54:55'),(3,18,18,'Qui est est sequi in. Iusto nulla possimus provident suscipit. Laborum voluptatem velit et non.','1973-09-25 17:02:14'),(4,19,19,'Earum in alias repudiandae quaerat voluptatem. Voluptate veritatis nesciunt impedit excepturi similique at dolores. Nisi fuga rerum culpa. Enim dignissimos et quaerat reiciendis aut.','1981-07-14 22:40:07'),(5,20,20,'Recusandae quod sit dolorem quam eius. Aliquid est illum deserunt repellat est pariatur. Et iste itaque beatae culpa fugiat consequatur blanditiis sapiente.','2002-06-13 16:32:52'),(6,21,21,'Atque quam quia aliquid quo eveniet aperiam. Vel blanditiis voluptates optio cupiditate similique iste id. Rerum quibusdam vel quo ea delectus nesciunt.','1980-10-07 06:55:56'),(7,22,22,'Molestiae aut qui mollitia iste. Architecto labore vero optio voluptatibus. Non laudantium ut quibusdam voluptate debitis ut. Voluptatem nobis dolor vitae.','1970-01-05 11:46:27'),(8,23,23,'Saepe ut et ullam et laborum atque. Inventore praesentium atque ipsum fugit ipsa eos asperiores. Iusto nobis et aliquam.','1977-07-23 13:21:33'),(9,24,24,'Consequatur ut iure rerum enim sit. Suscipit sit qui ratione voluptas et enim. Omnis in quia dolorum ut omnis porro. Fugit optio nulla voluptatem dolor.','1988-06-07 09:01:49'),(10,25,25,'Dolorem laboriosam ut ullam et excepturi. Pariatur quod quisquam voluptatem accusamus. Praesentium dolorum minus ut nemo rerum consequatur temporibus nesciunt. At soluta tempore facilis magnam accusamus consequuntur aut.','1979-10-07 03:36:11'),(11,26,26,'Corrupti aliquam consectetur veniam. Quisquam nobis beatae asperiores nulla deleniti.','1996-09-13 03:29:18'),(12,28,28,'Provident totam ipsam quia ducimus voluptatem recusandae. Vel alias aut ut doloribus ut. Magni eum deserunt quia illum velit perferendis quis.','1981-03-25 18:45:35'),(13,29,29,'Modi eius et eos quam ea maiores sit. Voluptas ipsa est quo exercitationem rerum. Eum et molestiae ut eveniet harum sapiente. Sapiente quisquam porro possimus.','1980-01-01 16:09:48'),(14,30,30,'Tempora iste sit doloremque voluptatem voluptas. Dolores iusto pariatur rerum necessitatibus voluptates. Quia sed enim labore.','2013-06-30 10:26:52'),(15,16,16,'Nisi quisquam voluptas qui qui neque in sapiente qui. Iusto perferendis deserunt earum qui omnis qui et.','1980-01-12 21:04:30');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'sit',16),(2,'voluptate',17),(3,'iure',18),(4,'qui',19),(5,'porro',20),(6,'cumque',21),(7,'sed',22),(8,'distinctio',23),(9,'et',24),(10,'dolore',25),(11,'iusto',26),(12,'dolorem',28),(13,'quia',29),(14,'exercitationem',30),(15,'qui',16);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stikers`
--

DROP TABLE IF EXISTS `stikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stikers` (
  `id_stikers` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stikers_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin` int(11) DEFAULT NULL,
  `creator_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_tab` bigint(20) unsigned DEFAULT NULL,
  `comment_tab` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_stikers`),
  KEY `message_tab` (`message_tab`),
  KEY `comment_tab` (`comment_tab`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `stikers_ibfk_1` FOREIGN KEY (`message_tab`) REFERENCES `messages` (`id`),
  CONSTRAINT `stikers_ibfk_2` FOREIGN KEY (`comment_tab`) REFERENCES `Comments` (`comment_id`),
  CONSTRAINT `stikers_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stikers`
--

LOCK TABLES `stikers` WRITE;
/*!40000 ALTER TABLE `stikers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_communities`
--

DROP TABLE IF EXISTS `user_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `user_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_communities`
--

LOCK TABLES `user_communities` WRITE;
/*!40000 ALTER TABLE `user_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'Audreanne','Lindgren','joaquin.fahey@example.com',501455,'89743955653'),(17,'Hanna','Ziemann','dustin.mcglynn@example.org',40647,'89669069193'),(18,'Cyrus','Barton','nlindgren@example.org',6,'89465275825'),(19,'Christa','Treutel','chadrick.mraz@example.com',1,'89384195308'),(20,'Chelsie','Beier','winston32@example.org',0,'89399593388'),(21,'Alana','Legros','jprice@example.com',311926,'89955656975'),(22,'Boyd','Wuckert','kiel.kub@example.net',306,'89383456014'),(23,'Rylee','Howell','mauricio.daniel@example.org',758,'89412128408'),(24,'Mallory','Runolfsson','mason.gerhold@example.org',771642,'89757220699'),(25,'Linnie','Zieme','ursula91@example.org',927855,'89098764896'),(26,'Walker','Harris','donna01@example.net',21,'89814078982'),(28,'Jason','Gulgowski','pwilliamson@example.net',533,'89831592081'),(29,'Emmitt','Pfeffer','cornelius62@example.net',85,'89399091490'),(30,'Mattie','Denesik','tamara34@example.net',989,'89609115146');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-02 12:30:31
