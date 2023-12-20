CREATE DATABASE  IF NOT EXISTS `formativaHogwarts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `formativaHogwarts`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: formativaHogwarts
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
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_tarefa` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `prazo` datetime NOT NULL,
  `data_abertura` datetime NOT NULL,
  `data_fechamento` datetime NOT NULL,
  `fk_solicitante` bigint NOT NULL,
  `fk_local` bigint NOT NULL,
  `fk_status` bigint NOT NULL,
  `fk_foto` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foto` (`fk_foto`),
  KEY `fk_local` (`fk_local`),
  KEY `fk_solicitante` (`fk_solicitante`),
  KEY `fk_status` (`fk_status`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`fk_foto`) REFERENCES `foto_tarefas` (`id`),
  CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`fk_local`) REFERENCES `locais` (`id`),
  CONSTRAINT `tarefas_ibfk_3` FOREIGN KEY (`fk_solicitante`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefas_ibfk_4` FOREIGN KEY (`fk_status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'primeira','a primeira só pra preencher','2023-06-02 00:00:00','2023-05-02 20:00:00','2023-06-09 00:00:00',2,3,1,2),(2,'segunda','a segunda só pra preencher','2023-07-05 00:00:00','2023-05-02 22:00:00','2023-07-19 12:00:00',1,2,1,3);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01 22:48:53
