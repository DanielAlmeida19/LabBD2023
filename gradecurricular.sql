-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: gradecurricular
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `afastamento`
--

DROP TABLE IF EXISTS `afastamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `afastamento` (
  `id_afastamento` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicial` date DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `pessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_afastamento`),
  KEY `pessoa` (`pessoa`),
  CONSTRAINT `afastamento_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afastamento`
--

LOCK TABLES `afastamento` WRITE;
/*!40000 ALTER TABLE `afastamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `afastamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordenador`
--

DROP TABLE IF EXISTS `coordenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coordenador` (
  `id_coord` int(11) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `curso` int(11) DEFAULT NULL,
  `professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_coord`),
  KEY `professor` (`professor`),
  KEY `curso` (`curso`),
  CONSTRAINT `coordenador_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `coordenador_ibfk_2` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id_curso`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordenador`
--

LOCK TABLES `coordenador` WRITE;
/*!40000 ALTER TABLE `coordenador` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disc`
--

DROP TABLE IF EXISTS `curso_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `curso_disc` (
  `curso` int(11) NOT NULL,
  `disciplina` int(11) NOT NULL,
  PRIMARY KEY (`curso`,`disciplina`),
  KEY `disciplina` (`disciplina`),
  CONSTRAINT `curso_disc_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id_curso`) ON UPDATE CASCADE,
  CONSTRAINT `curso_disc_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disc`
--

LOCK TABLES `curso_disc` WRITE;
/*!40000 ALTER TABLE `curso_disc` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `duracao` int(11) DEFAULT NULL,
  `periodo` enum('INTEGRAL','NOTURNO','MATUTINO','VESPERTINO') DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL,
  `instituto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `depto` (`depto`),
  KEY `instituto` (`instituto`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`id_depto`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`instituto`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departamento` (
  `id_depto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `chefe` int(11) DEFAULT NULL,
  `pessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_depto`),
  KEY `chefe` (`chefe`),
  KEY `pessoa` (`pessoa`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`chefe`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `departamento_ibfk_2` FOREIGN KEY (`pessoa`) REFERENCES `instituto` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'DEMAC',1,2);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_sala`
--

DROP TABLE IF EXISTS `disc_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disc_sala` (
  `disc` int(11) DEFAULT NULL,
  `sala` int(11) DEFAULT NULL,
  KEY `disc` (`disc`),
  KEY `sala` (`sala`),
  CONSTRAINT `disc_sala_ibfk_1` FOREIGN KEY (`disc`) REFERENCES `disciplinas` (`id_disciplina`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `disc_sala_ibfk_2` FOREIGN KEY (`sala`) REFERENCES `sala` (`id_sala`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_sala`
--

LOCK TABLES `disc_sala` WRITE;
/*!40000 ALTER TABLE `disc_sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disciplinas` (
  `id_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL,
  `prof` int(11) DEFAULT NULL,
  `sala` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_disciplina`),
  KEY `depto` (`depto`),
  KEY `prof` (`prof`),
  KEY `sala` (`sala`),
  CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`depto`) REFERENCES `departamento` (`id_depto`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `disciplinas_ibfk_2` FOREIGN KEY (`prof`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `disciplinas_ibfk_3` FOREIGN KEY (`sala`) REFERENCES `sala` (`id_sala`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` VALUES (1,'BDII',120,NULL,NULL,NULL),(2,'EBDII',120,NULL,NULL,NULL),(3,'BDI',120,NULL,NULL,NULL);
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equivalencia`
--

DROP TABLE IF EXISTS `equivalencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equivalencia` (
  `disciplina` int(11) NOT NULL,
  `equivalencia` int(11) NOT NULL,
  PRIMARY KEY (`disciplina`,`equivalencia`),
  KEY `equivalencia` (`equivalencia`),
  CONSTRAINT `equivalencia_ibfk_1` FOREIGN KEY (`disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE,
  CONSTRAINT `equivalencia_ibfk_2` FOREIGN KEY (`equivalencia`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equivalencia`
--

LOCK TABLES `equivalencia` WRITE;
/*!40000 ALTER TABLE `equivalencia` DISABLE KEYS */;
INSERT INTO `equivalencia` VALUES (1,2);
/*!40000 ALTER TABLE `equivalencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especialidade` (
  `pessoa` int(11) NOT NULL,
  `disciplina` int(11) NOT NULL,
  PRIMARY KEY (`pessoa`,`disciplina`),
  KEY `disciplina` (`disciplina`),
  CONSTRAINT `especialidade_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `professores` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `especialidade_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,1);
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixa_horaria`
--

DROP TABLE IF EXISTS `faixa_horaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faixa_horaria` (
  `id_faixahoraria` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa` int(11) DEFAULT NULL,
  `dia_semana` int(11) DEFAULT NULL,
  `inicio` time DEFAULT NULL,
  `fim` time DEFAULT NULL,
  PRIMARY KEY (`id_faixahoraria`),
  KEY `pessoa` (`pessoa`),
  CONSTRAINT `faixa_horaria_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `professores` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixa_horaria`
--

LOCK TABLES `faixa_horaria` WRITE;
/*!40000 ALTER TABLE `faixa_horaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `faixa_horaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feriados`
--

DROP TABLE IF EXISTS `feriados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feriados` (
  `id_feriado` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  PRIMARY KEY (`id_feriado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriados`
--

LOCK TABLES `feriados` WRITE;
/*!40000 ALTER TABLE `feriados` DISABLE KEYS */;
/*!40000 ALTER TABLE `feriados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituto`
--

DROP TABLE IF EXISTS `instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `instituto` (
  `id_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`),
  CONSTRAINT `instituto_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa_juridica` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituto`
--

LOCK TABLES `instituto` WRITE;
/*!40000 ALTER TABLE `instituto` DISABLE KEYS */;
INSERT INTO `instituto` VALUES (2);
/*!40000 ALTER TABLE `instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ministram`
--

DROP TABLE IF EXISTS `ministram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ministram` (
  `pessoa` int(11) NOT NULL,
  `disciplina` int(11) NOT NULL,
  PRIMARY KEY (`pessoa`,`disciplina`),
  KEY `disciplina` (`disciplina`),
  CONSTRAINT `ministram_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `professores` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `ministram_ibfk_2` FOREIGN KEY (`disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministram`
--

LOCK TABLES `ministram` WRITE;
/*!40000 ALTER TABLE `ministram` DISABLE KEYS */;
INSERT INTO `ministram` VALUES (1,1);
/*!40000 ALTER TABLE `ministram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pessoa` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `nome_social` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Leandro','Avenida 46A','Leandro'),(2,'UNESP','AVENIDA 24A','UNESP');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pessoa_fisica` (
  `id_pessoa` int(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `cpf` (`cpf`),
  CONSTRAINT `pessoa_fisica_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
INSERT INTO `pessoa_fisica` VALUES (1,'46128312312');
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pessoa_juridica` (
  `id_pessoa` int(11) NOT NULL,
  `cnpj` char(14) NOT NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `cnpj` (`cnpj`),
  CONSTRAINT `pessoa_juridica_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_juridica`
--

LOCK TABLES `pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `pessoa_juridica` DISABLE KEYS */;
INSERT INTO `pessoa_juridica` VALUES (2,'31231242145212');
/*!40000 ALTER TABLE `pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisito`
--

DROP TABLE IF EXISTS `pre_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pre_requisito` (
  `disciplina` int(11) NOT NULL,
  `pre_requisito` int(11) NOT NULL,
  PRIMARY KEY (`disciplina`,`pre_requisito`),
  KEY `pre_requisito` (`pre_requisito`),
  CONSTRAINT `pre_requisito_ibfk_1` FOREIGN KEY (`disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE,
  CONSTRAINT `pre_requisito_ibfk_2` FOREIGN KEY (`pre_requisito`) REFERENCES `disciplinas` (`id_disciplina`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisito`
--

LOCK TABLES `pre_requisito` WRITE;
/*!40000 ALTER TABLE `pre_requisito` DISABLE KEYS */;
INSERT INTO `pre_requisito` VALUES (1,3);
/*!40000 ALTER TABLE `pre_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_departamento`
--

DROP TABLE IF EXISTS `professor_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professor_departamento` (
  `pessoa` int(11) NOT NULL,
  `depto` int(11) NOT NULL,
  PRIMARY KEY (`pessoa`,`depto`),
  KEY `depto` (`depto`),
  CONSTRAINT `professor_departamento_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `professores` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `professor_departamento_ibfk_2` FOREIGN KEY (`depto`) REFERENCES `departamento` (`id_depto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_departamento`
--

LOCK TABLES `professor_departamento` WRITE;
/*!40000 ALTER TABLE `professor_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professores` (
  `id_pessoa` int(11) NOT NULL,
  `formacao` enum('especialista','mestre','doutor','titular') DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa_fisica` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'mestre');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL AUTO_INCREMENT,
  `bloco` varchar(25) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `capacidade_alunos` int(11) DEFAULT NULL,
  `tipo_sala` enum('LAB','AULA') DEFAULT NULL,
  `instituto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `instituto` (`instituto`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`instituto`) REFERENCES `instituto` (`id_pessoa`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretario`
--

DROP TABLE IF EXISTS `secretario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secretario` (
  `id_pessoa` int(11) NOT NULL,
  `horario_entrada` time DEFAULT NULL,
  `horario_saida` time DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  CONSTRAINT `secretario_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa_fisica` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretario`
--

LOCK TABLES `secretario` WRITE;
/*!40000 ALTER TABLE `secretario` DISABLE KEYS */;
/*!40000 ALTER TABLE `secretario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gradecurricular'
--
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_CURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_CURSO`(IN idcurso INT, IN nome_curso VARCHAR(30), IN area_curso VARCHAR(30), IN duracao_curso INT, IN periodo_curso enum('INTEGRAL','NOTURNO','MATUTINO','VESPERTINO'), IN ch_curso INT, IN depto INT, IN inst INT)
BEGIN
	IF(idcurso IS NULL) THEN 
		INSERT INTO cursos(id_curso, nome, area, duracao, periodo, carga_horaria, depto, instituto) VALUES (idcurso, nome_curso, area_curso, duracao_curso, periodo_curso, ch_curso, depto, inst);
    ELSEIF(idcurso > 0 && nome IS NULL) THEN 
		DELETE FROM cursos WHERE id_curso = idcurso;
	ELSE 
		UPDATE cursos SET nome = nome_curso, area = area_curso, duracao = duracao_curso, periodo = periodo_curso, carga_horaria = ch_curso, depto = depto, instituto = inst WHERE id_curso = idcurso;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_DEPTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_DEPTO`(IN iddepto INT, IN nomedepto VARCHAR(45), IN chefedepto INT, IN pj INT)
BEGIN
	IF(iddepto IS NULL) THEN
		SELECT id_pessoa INTO chefedepto FROM professores WHERE professores.id_pessoa = chefedepto;
        SELECT id_pessoa INTO pj FROM instituto WHERE instituto.id_pessoa = pj;
		INSERT INTO departamento(id_depto, nome, chefe, pessoa) VALUES (iddepto, nomedepto, chefedepto, pj);
	ELSEIF(iddepto > 0 && nomedepto IS NULL) THEN
		DELETE FROM departamentos WHERE id_depto = iddepto;
	ELSE
		SELECT id_pessoa INTO chefedepto FROM professores WHERE professores.id_pessoa = chefedepto;
        SELECT id_pessoa INTO pj FROM instituto WHERE instituto.id_pessoa = pj;
        UPDATE departamentos SET nome = nomedepto, chefe = chefedepto, pessoa = pj WHERE id_depto = iddepto;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_DISC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_DISC`(IN cod INT, IN nome VARCHAR(50),IN ch INT)
BEGIN
	IF(cod IS NULL) THEN
		INSERT INTO Disciplinas(id_disciplina,nome,carga_horaria) VALUES (cod,nome,ch);
	ELSEIF(cod > 0 && nome IS NULL) THEN
        DELETE FROM Disciplinas WHERE cod = id_disciplina;
	ELSE
		UPDATE Disciplinas SET  nome = nome, carga_horaria = ch  WHERE  id_disciplina = cod;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_DISC_SALA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_DISC_SALA`(IN nome_d VARCHAR(50), IN cod_s VARCHAR(50))
BEGIN
    DECLARE cod_d INT DEFAULT 0;
    
    SELECT disciplinas.id_disciplina INTO cod_d FROM Disciplinas 
    WHERE nome_d = nome;
    SELECT id_sala INTO cod_s FROM Sala WHERE id_sala = cod_s;
    
    INSERT INTO Ministram(pessoa,disciplina) VALUES (cod_p,cod_d);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_EQUIVALENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_EQUIVALENCIA`(IN nome_d VARCHAR(50),IN nome_eq VARCHAR(50))
BEGIN
	DECLARE cod_d INT DEFAULT 0;
	DECLARE cod_eq INT DEFAULT 0;
    
    SELECT id_disciplina INTO cod_d FROM Disciplinas WHERE Disciplinas.nome = nome_d;
    SELECT id_disciplina INTO cod_eq FROM Disciplinas WHERE Disciplinas.nome = nome_eq;
    
    INSERT INTO Equivalencia(disciplina,equivalencia) VALUES (cod_d,cod_eq);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_ESPECIALIDADE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_ESPECIALIDADE`(IN nome_p VARCHAR(50), IN nome_d VARCHAR(50))
BEGIN
	DECLARE cod_p INT DEFAULT 0;
    DECLARE cod_d INT DEFAULT 0;
    
    SELECT pro.id_pessoa INTO cod_p FROM Professores pro,Pessoa_fisica pf, Pessoa p
		WHERE Pro.id_pessoa = pf.id_pessoa AND pf.id_pessoa = p.id_pessoa AND p.nome = nome_p;
    SELECT id_disciplina INTO cod_d FROM Disciplinas WHERE Disciplinas.nome = nome_d;
    
    INSERT INTO Especialidade(pessoa,disciplina) VALUES (cod_p,cod_d);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_INST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_INST`(IN idpessoa INT)
BEGIN
	IF(id_pessoa IS NULL) THEN
		INSERT INTO instituto(id_pessoa) VALUES (idpessoa);
	ELSE
		DELETE FROM instituto WHERE id_pessoa = idpessoa;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_INSTITUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_INSTITUTO`(IN cod_i INT)
BEGIN
    
	SELECT id_pessoa INTO cod_i FROM Pessoa_Juridica WHERE Pessoa_Juridica.id_pessoa = cod_i;
    
	INSERT INTO Instituto(id_pessoa) VALUES (cod_i);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_MINISTRAM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_MINISTRAM`(IN nome_p VARCHAR(50), IN nome_d VARCHAR(50))
BEGIN
	DECLARE cod_p INT DEFAULT 0;
    DECLARE cod_d INT DEFAULT 0;
    
    SELECT pro.id_pessoa INTO cod_p FROM Professores pro,Pessoa_fisica pf, Pessoa p
		WHERE Pro.id_pessoa = pf.id_pessoa AND pf.id_pessoa = p.id_pessoa AND p.nome = nome_p;
    SELECT id_disciplina INTO cod_d FROM Disciplinas WHERE Disciplinas.nome = nome_d;
    
    INSERT INTO Ministram(pessoa,disciplina) VALUES (cod_p,cod_d);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PESSOA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PESSOA`(IN cod INT,IN nome VARCHAR(50), IN endereco VARCHAR(80), IN nome_s VARCHAR (50))
BEGIN
	IF(cod IS NULL) THEN
		INSERT INTO Pessoa(id_pessoa,nome,endereco,nome_social) VALUES (cod,nome,endereco,nome_s);
	ELSEIF(cod > 0 && nome IS NULL) THEN
        DELETE FROM Pessoa WHERE cod = id_pessoa;
	ELSE
		UPDATE Pessoa SET  nome = nome, endereco = endereco  WHERE  nome_social = nome_s;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PESSOA_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PESSOA_F`(IN nome_p VARCHAR(50), IN cpf VARCHAR(11))
BEGIN
	DECLARE cod_p INT DEFAULT 0;
    
    SELECT id_pessoa INTO cod_p FROM Pessoa WHERE Pessoa.nome = nome_p;
    
    INSERT INTO Pessoa_fisica(id_pessoa,cpf) VALUES (cod_p,cpf);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PESSOA_J` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PESSOA_J`(IN nome_p VARCHAR(50), IN cnpj VARCHAR(14))
BEGIN
	DECLARE cod_p INT DEFAULT 0;
    
    SELECT id_pessoa INTO cod_p FROM Pessoa WHERE Pessoa.nome = nome_p;
    
    INSERT INTO Pessoa_Juridica(id_pessoa,cnpj) VALUES (cod_p,cnpj);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PREREQUISITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PREREQUISITO`(IN nome_d VARCHAR(50),IN nome_pr VARCHAR(50))
BEGIN
	DECLARE cod_d INT DEFAULT 0;
	DECLARE cod_pr INT DEFAULT 0;
    
    SELECT id_disciplina INTO cod_d FROM Disciplinas WHERE Disciplinas.nome = nome_d;
    SELECT id_disciplina INTO cod_pr FROM Disciplinas WHERE Disciplinas.nome = nome_pr;
    
    INSERT INTO Pre_requisito(disciplina,pre_requisito) VALUES (cod_d,cod_pr);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PROF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PROF`(IN idpessoa INT, IN forma enum('especialista','mestre','doutor','titular'))
BEGIN
	IF(idpessoa IS NULL) THEN
		INSERT INTO professores(id_pessoa, formacao) VALUES (idpessoa, forma);
	ELSEIF(idpessoa > 0 && forma IS NULL) THEN
        DELETE FROM professores WHERE idpessoa = id_pessoa;
	ELSE
		UPDATE professores SET formacao = forma  WHERE  id_pessoa = idpessoa;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_PROFESSOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_PROFESSOR`(IN cod_p INT, IN formacao INT)
BEGIN
    IF(cod_p IS NULL) THEN
		SELECT id_pessoa INTO cod_p FROM Pessoa_Fisica WHERE Pessoa_Fisica.id_pessoa = cod_p;
		INSERT INTO Professores(id_pessoa,formacao) VALUES (cod_p,formacao);
	ELSEIF(cod_p > 0 && formacao IS NULL) THEN
		DELETE FROM professores WHERE id_pessoa = cod_p;
	ELSE
		UPDATE Professores SET formacao = formacao  WHERE  cod_p = id_pessoa;
	END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_SALA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_SALA`(IN idsala INT, IN blocosala VARCHAR(25), IN numerosala INT, capacidadesala INT, IN tiposala INT, IN institutoid INT)
BEGIN
	IF(idsala IS NULL) THEN
		SELECT id_pessoa INTO institutoid FROM instituto WHERE instituto.id_pessoa = institutoid;
		INSERT INTO sala(id_sala, bloco, numero, capacidade_alunos, tipo_sala, instituto) VALUES (idsala, blocosala, numerosala, capacidadesala, tiposala, institutoid);
	ELSEIF(idsala > 0 && blocosala IS NULL ) THEN 
		DELETE FROM sala WHERE id_sala = idsala;
	ELSE
		SELECT id_pessoa INTO institutoid FROM instituto WHERE instituto.id_pessoa = institutoid;
        UPDATE sala SET bloco = blocosala, numero = numerosala, capacidadesala = capacidade_alunos, tiposala = tipo_sala, instituto = institutoid WHERE id_sala = idsala;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANUT_TIPOSALA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANUT_TIPOSALA`(IN idtiposala INT, IN nometiposala VARCHAR(30))
BEGIN
	IF(idtiposala IS NULL) THEN
		INSERT INTO tipo_sala(id_tiposala, nome) VALUES (idtiposala, nometiposala);
	ELSEIF(idtiposala > 0 && nome IS NULL) THEN 
		DELETE FROM tipo_sala WHERE id_tiposala = idtiposala;
	ELSE
		UPDATE tipo_sala SET nome = nometiposala WHERE id_tiposala = idtiposala;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-10 16:10:25
