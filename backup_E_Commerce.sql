-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: E_Commerce
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Adresse_livraison`
--

DROP TABLE IF EXISTS `Adresse_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adresse_livraison` (
  `ID_adr` int(11) NOT NULL AUTO_INCREMENT,
  `Rue_adr` varchar(255) DEFAULT NULL,
  `Intitule_adr` varchar(255) DEFAULT NULL,
  `Ville_adr` varchar(255) DEFAULT NULL,
  `Pays_adr` varchar(255) DEFAULT NULL,
  `Complement_adr` varchar(255) DEFAULT NULL,
  `Cp_adr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_adr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresse_livraison`
--

LOCK TABLES `Adresse_livraison` WRITE;
/*!40000 ALTER TABLE `Adresse_livraison` DISABLE KEYS */;
INSERT INTO `Adresse_livraison` VALUES (1,'542','de Cardonnette','Caen','France','','14118'),(2,'236','Pierre Curie','Reims','France','Apt 45','51454'),(3,'45','Le Souflade','Valence','France','Bat Les Violettes','26362');
/*!40000 ALTER TABLE `Adresse_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adresse_paiement`
--

DROP TABLE IF EXISTS `Adresse_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adresse_paiement` (
  `ID_adr_paie` int(11) NOT NULL AUTO_INCREMENT,
  `Rue_adr_paie` varchar(255) DEFAULT NULL,
  `Intitule_adr_paie` varchar(255) DEFAULT NULL,
  `Ville_adr_paie` varchar(255) DEFAULT NULL,
  `Pays_adr_paie` varchar(255) DEFAULT NULL,
  `Complement_adr_paie` varchar(255) DEFAULT NULL,
  `Cp_adr_paie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_adr_paie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresse_paiement`
--

LOCK TABLES `Adresse_paiement` WRITE;
/*!40000 ALTER TABLE `Adresse_paiement` DISABLE KEYS */;
INSERT INTO `Adresse_paiement` VALUES (1,'84','Jean Moulin','Lyon','France','','69000'),(2,'236','Pierre Curie','Reims','France','Apt. 45','51454'),(3,'45','Le Souflade','Valence','France','Bat. Les Violettes','26362');
/*!40000 ALTER TABLE `Adresse_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appartient`
--

DROP TABLE IF EXISTS `Appartient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appartient` (
  `ID_prod_r` int(11) NOT NULL,
  `ID_rub_r` int(11) NOT NULL,
  PRIMARY KEY (`ID_prod_r`,`ID_rub_r`),
  KEY `ID_rub` (`ID_rub_r`),
  CONSTRAINT `Appartient_ibfk_1` FOREIGN KEY (`ID_prod_r`) REFERENCES `Produit` (`ID_prod`),
  CONSTRAINT `Appartient_ibfk_2` FOREIGN KEY (`ID_rub_r`) REFERENCES `Rubrique` (`ID_rub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appartient`
--

LOCK TABLES `Appartient` WRITE;
/*!40000 ALTER TABLE `Appartient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appartient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `ID_client` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_client` varchar(255) NOT NULL,
  `Cat_client` varchar(255) DEFAULT NULL,
  `Nom_client` varchar(255) DEFAULT NULL,
  `Prenom_client` varchar(255) DEFAULT NULL,
  `Mail_client` varchar(255) DEFAULT NULL,
  `Tel_client` varchar(255) DEFAULT NULL,
  `ID_com` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_client`),
  KEY `ID_com` (`ID_com`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`ID_com`) REFERENCES `Commercial` (`ID_com`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'987IHG','Particulier','Mine','Steve','Steve.Mine@mail.fr','06 57 31 31 12',NULL),(2,'654FED','Professionnel','Craft','Alex','Alex.Craft@mail.fr','07 82 45 96 37',NULL),(3,'321CBA','Particulier','Brine','Hero','Hero.Brine@mail.fr','06 01 10 00 11',NULL);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client_pro`
--

DROP TABLE IF EXISTS `Client_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client_pro` (
  `ID_client` int(11) NOT NULL,
  `Reduction` decimal(15,2) DEFAULT NULL,
  `ID_com` int(11) NOT NULL,
  PRIMARY KEY (`ID_client`),
  KEY `ID_com` (`ID_com`),
  CONSTRAINT `Client_pro_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `Client` (`ID_client`),
  CONSTRAINT `Client_pro_ibfk_2` FOREIGN KEY (`ID_com`) REFERENCES `Commercial` (`ID_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_pro`
--

LOCK TABLES `Client_pro` WRITE;
/*!40000 ALTER TABLE `Client_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `ID_com` int(11) NOT NULL AUTO_INCREMENT,
  `Moyen_paiement` varchar(255) DEFAULT NULL,
  `Num_commande` varchar(255) NOT NULL,
  `Date_com` date DEFAULT NULL,
  `Adr_livraison` varchar(255) DEFAULT NULL,
  `Ville_livr_com` varchar(255) DEFAULT NULL,
  `Pays_livr_com` varchar(255) DEFAULT NULL,
  `Cp_livr_com` varchar(255) DEFAULT NULL,
  `Adr_paiement` varchar(255) DEFAULT NULL,
  `Ville_paie_com` varchar(255) DEFAULT NULL,
  `Pays_paie_com` varchar(255) DEFAULT NULL,
  `Cp_paie_com` varchar(255) DEFAULT NULL,
  `ID_client` int(11) NOT NULL,
  PRIMARY KEY (`ID_com`),
  KEY `ID_client` (`ID_client`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `Client` (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO `Commande` VALUES (1,'Carte Bancaire','00001','2023-03-01','45 rue Le Souflade','Valence','France','26362','45 rue Le Souflade','Valence','France','26362',1),(2,'Carte Bancaire','00002','2023-02-27','542 rue de Cardonnette','Caen','France','14118','84 rue Jean Moulin','Lyon','France','69000',2);
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commercial`
--

DROP TABLE IF EXISTS `Commercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commercial` (
  `ID_com` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_com` varchar(255) DEFAULT NULL,
  `Prenom_com` varchar(255) DEFAULT NULL,
  `Mail_com` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_com`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commercial`
--

LOCK TABLES `Commercial` WRITE;
/*!40000 ALTER TABLE `Commercial` DISABLE KEYS */;
INSERT INTO `Commercial` VALUES (1,'One','Rim','Rim.One@mail.fr'),(2,'Two','Denis','Denis.Two@mail.fr'),(3,'Three','Maggie','Maggie.Three@mail.fr');
/*!40000 ALTER TABLE `Commercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Correspondent`
--

DROP TABLE IF EXISTS `Correspondent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Correspondent` (
  `ID_fourni` int(11) NOT NULL,
  `ID_resp` int(11) NOT NULL,
  PRIMARY KEY (`ID_fourni`,`ID_resp`),
  KEY `ID_resp` (`ID_resp`),
  CONSTRAINT `Correspondent_ibfk_1` FOREIGN KEY (`ID_fourni`) REFERENCES `Fournisseurs` (`ID_fourni`),
  CONSTRAINT `Correspondent_ibfk_2` FOREIGN KEY (`ID_resp`) REFERENCES `Responsables` (`ID_resp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Correspondent`
--

LOCK TABLES `Correspondent` WRITE;
/*!40000 ALTER TABLE `Correspondent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Correspondent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Est_acheté`
--

DROP TABLE IF EXISTS `Est_acheté`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Est_acheté` (
  `ID_prod` int(11) NOT NULL,
  `ID_com` int(11) NOT NULL,
  `P_quantite` varchar(255) DEFAULT NULL,
  `Prix_vendu` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`ID_prod`,`ID_com`),
  KEY `ID_com` (`ID_com`),
  CONSTRAINT `Est_acheté_ibfk_1` FOREIGN KEY (`ID_prod`) REFERENCES `Produit` (`ID_prod`),
  CONSTRAINT `Est_acheté_ibfk_2` FOREIGN KEY (`ID_com`) REFERENCES `Commande` (`ID_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Est_acheté`
--

LOCK TABLES `Est_acheté` WRITE;
/*!40000 ALTER TABLE `Est_acheté` DISABLE KEYS */;
INSERT INTO `Est_acheté` VALUES (2,1,'2',29.00),(2,2,'1',29.00),(3,2,'1',31.99);
/*!40000 ALTER TABLE `Est_acheté` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseurs`
--

DROP TABLE IF EXISTS `Fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournisseurs` (
  `ID_fourni` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_fourni` varchar(255) NOT NULL,
  `Nom_fourni` varchar(255) DEFAULT NULL,
  `Prenom_fourni` varchar(255) DEFAULT NULL,
  `Mail_fourni` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_fourni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseurs`
--

LOCK TABLES `Fournisseurs` WRITE;
/*!40000 ALTER TABLE `Fournisseurs` DISABLE KEYS */;
INSERT INTO `Fournisseurs` VALUES (1,'123ABC','Uno','Sabri','Sabri.Uno@mail.fr'),(2,'456DEF','Dos','Liam','Liam.Dos@mail.fr'),(3,'789GHI','Tres','Lucas','Lucas.Tres@mail.fr'),(4,'123ABC','Uno','Sabri','Sabri.Uno@mail.fr'),(5,'456DEF','Dos','Liam','Liam.Dos@mail.fr'),(6,'789GHI','Tres','Lucas','Lucas.Tres@mail.fr');
/*!40000 ALTER TABLE `Fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournit`
--

DROP TABLE IF EXISTS `Fournit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournit` (
  `ID_prod` int(11) NOT NULL,
  `ID_fourni` int(11) NOT NULL,
  PRIMARY KEY (`ID_prod`,`ID_fourni`),
  KEY `ID_fourni` (`ID_fourni`),
  CONSTRAINT `Fournit_ibfk_1` FOREIGN KEY (`ID_prod`) REFERENCES `Produit` (`ID_prod`),
  CONSTRAINT `Fournit_ibfk_2` FOREIGN KEY (`ID_fourni`) REFERENCES `Fournisseurs` (`ID_fourni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournit`
--

LOCK TABLES `Fournit` WRITE;
/*!40000 ALTER TABLE `Fournit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fournit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livraison`
--

DROP TABLE IF EXISTS `Livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Livraison` (
  `ID_livr` int(11) NOT NULL AUTO_INCREMENT,
  `Date_livr_finie` date DEFAULT NULL,
  `ID_com` int(11) NOT NULL,
  PRIMARY KEY (`ID_livr`),
  KEY `ID_com` (`ID_com`),
  CONSTRAINT `Livraison_ibfk_1` FOREIGN KEY (`ID_com`) REFERENCES `Commande` (`ID_com`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livraison`
--

LOCK TABLES `Livraison` WRITE;
/*!40000 ALTER TABLE `Livraison` DISABLE KEYS */;
INSERT INTO `Livraison` VALUES (1,'2023-03-02',1),(2,NULL,2);
/*!40000 ALTER TABLE `Livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Livre`
--

DROP TABLE IF EXISTS `Livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Livre` (
  `ID_prod` int(11) NOT NULL,
  `ID_livr` int(11) NOT NULL,
  `P_quantite_2` varchar(255) DEFAULT NULL,
  `Date_livr` date DEFAULT NULL,
  PRIMARY KEY (`ID_prod`,`ID_livr`),
  KEY `ID_livr` (`ID_livr`),
  CONSTRAINT `Livre_ibfk_1` FOREIGN KEY (`ID_prod`) REFERENCES `Produit` (`ID_prod`),
  CONSTRAINT `Livre_ibfk_2` FOREIGN KEY (`ID_livr`) REFERENCES `Livraison` (`ID_livr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Livre`
--

LOCK TABLES `Livre` WRITE;
/*!40000 ALTER TABLE `Livre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Possède`
--

DROP TABLE IF EXISTS `Possède`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Possède` (
  `ID_client` int(11) NOT NULL,
  `ID_adr_ex___famille` int(11) NOT NULL,
  PRIMARY KEY (`ID_client`,`ID_adr_ex___famille`),
  KEY `ID_adr_ex___famille` (`ID_adr_ex___famille`),
  CONSTRAINT `Possède_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `Client` (`ID_client`),
  CONSTRAINT `Possède_ibfk_2` FOREIGN KEY (`ID_adr_ex___famille`) REFERENCES `Adresse_livraison` (`ID_adr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Possède`
--

LOCK TABLES `Possède` WRITE;
/*!40000 ALTER TABLE `Possède` DISABLE KEYS */;
/*!40000 ALTER TABLE `Possède` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Possède_2`
--

DROP TABLE IF EXISTS `Possède_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Possède_2` (
  `ID_client` int(11) NOT NULL,
  `ID_adr_paie` int(11) NOT NULL,
  PRIMARY KEY (`ID_client`,`ID_adr_paie`),
  KEY `ID_adr_paie` (`ID_adr_paie`),
  CONSTRAINT `Possède_2_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `Client` (`ID_client`),
  CONSTRAINT `Possède_2_ibfk_2` FOREIGN KEY (`ID_adr_paie`) REFERENCES `Adresse_paiement` (`ID_adr_paie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Possède_2`
--

LOCK TABLES `Possède_2` WRITE;
/*!40000 ALTER TABLE `Possède_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `Possède_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `ID_prod` int(11) NOT NULL AUTO_INCREMENT,
  `P_lib_court` varchar(255) DEFAULT NULL,
  `P_lib_long` varchar(255) DEFAULT NULL,
  `P_prix_achat` decimal(15,2) DEFAULT NULL,
  `P_quantite_totale` int(11) DEFAULT NULL,
  `P_photo` varchar(255) DEFAULT NULL,
  `ID_fourni_prod` int(11) NOT NULL,
  PRIMARY KEY (`ID_prod`),
  KEY `ID_fourni` (`ID_fourni_prod`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`ID_fourni_prod`) REFERENCES `Fournisseurs` (`ID_fourni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES (1,'Rose rouge (10 tiges)','Un bouquet de 10 roses rouges',17.99,20,'',1),(2,'Rose rouge (20 tiges)','Un bouquet de 20 roses rouges',29.00,20,'',1),(3,'Brassée de pivoines','Un bouquet de 10 pivoines blanches ou roses',31.99,15,'',3),(4,'Pivoines & Roses','Un bouquet de 6 pivoines blanches et 10 roses rouges',38.00,10,'',2);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Responsables`
--

DROP TABLE IF EXISTS `Responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Responsables` (
  `ID_resp` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_resp` varchar(255) DEFAULT NULL,
  `Prenom_resp` varchar(255) DEFAULT NULL,
  `Mail_resp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_resp`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Responsables`
--

LOCK TABLES `Responsables` WRITE;
/*!40000 ALTER TABLE `Responsables` DISABLE KEYS */;
INSERT INTO `Responsables` VALUES (1,'Un','Hugo','Hugo.Un@mail.fr'),(2,'Deux','Ines','Ines.Deux@mail.fr'),(3,'Trois','Margot','Margot.Trois@mail.fr'),(4,'Un','Hugo','Hugo.Un@mail.fr'),(5,'Deux','Ines','Ines.Deux@mail.fr'),(6,'Trois','Margot','Margot.Trois@mail.fr');
/*!40000 ALTER TABLE `Responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rubrique`
--

DROP TABLE IF EXISTS `Rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rubrique` (
  `ID_rub` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_rub` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_rub`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rubrique`
--

LOCK TABLES `Rubrique` WRITE;
/*!40000 ALTER TABLE `Rubrique` DISABLE KEYS */;
INSERT INTO `Rubrique` VALUES (1,'Occasions'),(2,'Amour'),(3,'Deuil'),(4,'Mariage'),(5,'Anniversaire'),(6,'Bouquets'),(7,'Occasions'),(8,'Amour'),(9,'Deuil'),(10,'Mariage'),(11,'Anniversaire'),(12,'Bouquets');
/*!40000 ALTER TABLE `Rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sous_rubrique`
--

DROP TABLE IF EXISTS `Sous_rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sous_rubrique` (
  `ID_rub_est_une_sousR` int(11) NOT NULL,
  `ID_rub_possède_une_R` int(11) NOT NULL,
  PRIMARY KEY (`ID_rub_est_une_sousR`,`ID_rub_possède_une_R`),
  KEY `ID_rub_possède_une_R` (`ID_rub_possède_une_R`),
  CONSTRAINT `Sous_rubrique_ibfk_1` FOREIGN KEY (`ID_rub_est_une_sousR`) REFERENCES `Rubrique` (`ID_rub`),
  CONSTRAINT `Sous_rubrique_ibfk_2` FOREIGN KEY (`ID_rub_possède_une_R`) REFERENCES `Rubrique` (`ID_rub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sous_rubrique`
--

LOCK TABLES `Sous_rubrique` WRITE;
/*!40000 ALTER TABLE `Sous_rubrique` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sous_rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `V_Prod_Fourni`
--

DROP TABLE IF EXISTS `V_Prod_Fourni`;
/*!50001 DROP VIEW IF EXISTS `V_Prod_Fourni`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `V_Prod_Fourni` AS SELECT
 1 AS `ID_prod`,
  1 AS `P_lib_court`,
  1 AS `P_lib_long`,
  1 AS `P_prix_achat`,
  1 AS `P_quantite_totale`,
  1 AS `P_photo`,
  1 AS `ID_fourni_prod`,
  1 AS `ID_fourni`,
  1 AS `Ref_fourni`,
  1 AS `Nom_fourni`,
  1 AS `Prenom_fourni`,
  1 AS `Mail_fourni` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V_Prod_Rubrique`
--

DROP TABLE IF EXISTS `V_Prod_Rubrique`;
/*!50001 DROP VIEW IF EXISTS `V_Prod_Rubrique`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `V_Prod_Rubrique` AS SELECT
 1 AS `ID_prod`,
  1 AS `P_lib_court`,
  1 AS `P_lib_long`,
  1 AS `P_prix_achat`,
  1 AS `P_quantite_totale`,
  1 AS `P_photo`,
  1 AS `ID_fourni_prod`,
  1 AS `ID_prod_r`,
  1 AS `ID_rub_r`,
  1 AS `ID_rub`,
  1 AS `Nom_rub` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `V_Prod_Fourni`
--

/*!50001 DROP VIEW IF EXISTS `V_Prod_Fourni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_Prod_Fourni` AS select `Produit`.`ID_prod` AS `ID_prod`,`Produit`.`P_lib_court` AS `P_lib_court`,`Produit`.`P_lib_long` AS `P_lib_long`,`Produit`.`P_prix_achat` AS `P_prix_achat`,`Produit`.`P_quantite_totale` AS `P_quantite_totale`,`Produit`.`P_photo` AS `P_photo`,`Produit`.`ID_fourni_prod` AS `ID_fourni_prod`,`Fournisseurs`.`ID_fourni` AS `ID_fourni`,`Fournisseurs`.`Ref_fourni` AS `Ref_fourni`,`Fournisseurs`.`Nom_fourni` AS `Nom_fourni`,`Fournisseurs`.`Prenom_fourni` AS `Prenom_fourni`,`Fournisseurs`.`Mail_fourni` AS `Mail_fourni` from (`Produit` join `Fournisseurs` on(`Fournisseurs`.`ID_fourni` = `Produit`.`ID_fourni_prod`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V_Prod_Rubrique`
--

/*!50001 DROP VIEW IF EXISTS `V_Prod_Rubrique`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `V_Prod_Rubrique` AS select `Produit`.`ID_prod` AS `ID_prod`,`Produit`.`P_lib_court` AS `P_lib_court`,`Produit`.`P_lib_long` AS `P_lib_long`,`Produit`.`P_prix_achat` AS `P_prix_achat`,`Produit`.`P_quantite_totale` AS `P_quantite_totale`,`Produit`.`P_photo` AS `P_photo`,`Produit`.`ID_fourni_prod` AS `ID_fourni_prod`,`Appartient`.`ID_prod_r` AS `ID_prod_r`,`Appartient`.`ID_rub_r` AS `ID_rub_r`,`Rubrique`.`ID_rub` AS `ID_rub`,`Rubrique`.`Nom_rub` AS `Nom_rub` from ((`Produit` join `Appartient` on(`Appartient`.`ID_prod_r` = `Produit`.`ID_prod`)) join `Rubrique` on(`Appartient`.`ID_rub_r` = `Rubrique`.`ID_rub`)) */;
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

-- Dump completed on 2023-03-02 13:48:44
