-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gdbcxfhueitmeexitcmngpncdyywsyrowvhy` (`primaryOwnerId`),
  CONSTRAINT `fk_gdbcxfhueitmeexitcmngpncdyywsyrowvhy` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nolqhdjrjkbjlfoynjlwetlhmrcwbhydyjfy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enbnzhsktgttmbmurlqnnvpwaagetxdonvyt` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_gmnmcnpianlqreohkmkpwqnxrtmspvsgiydw` (`dateRead`),
  KEY `fk_jdvlmubxjvmwibuntwsvifvgljfgrztaudmo` (`pluginId`),
  CONSTRAINT `fk_jdvlmubxjvmwibuntwsvifvgljfgrztaudmo` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxluxubqtjakivcfhpacbiznxogmrzwouejw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_beppqviwxqzaqrrnwdpwxdnorkwdbhxzluxs` (`sessionId`,`volumeId`),
  KEY `idx_qzkzhwykdretckcblkdyvfjtmqhjklkqeuma` (`volumeId`),
  CONSTRAINT `fk_svgsvmpbozwoxbwiltndwuqmmseerbjcuvnv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xesduxermobwnstbnsjiydifqdfanonmsrxe` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cupcoylzcrmnqepnxgamlnfeupfalfmlobcs` (`filename`,`folderId`),
  KEY `idx_brtqomovbkjiqgfvreoyqzftduofthzpzavb` (`folderId`),
  KEY `idx_tlijyjtpjtgmvesgmxwraufbhnceliptrria` (`volumeId`),
  KEY `fk_nhsfxlidrgbrgxbofhvqhhwmyrgfshiowwzk` (`uploaderId`),
  CONSTRAINT `fk_jxbwiuilsebegjnsgyyseeqffybqytmwttrx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhsfxlidrgbrgxbofhvqhhwmyrgfshiowwzk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nogxkzkdtkjkjzmjstfxwuheqycqewdtpnmo` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txvfxcskdmabfuohttokxualsdvryvfuygsd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_ghqccootlrywfvcdotehqitqrnljqjnqevnq` (`siteId`),
  CONSTRAINT `fk_ghqccootlrywfvcdotehqitqrnljqjnqevnq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prvvzczcoequadkckezexobocvkjjyjepijb` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jeqxnjrcprsrlrsrdoymwlxcecsvthacxirw` (`userId`),
  CONSTRAINT `fk_jeqxnjrcprsrlrsrdoymwlxcecsvthacxirw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nfvnjnvsemydwqapoxdxjxnyuiurgmxmbrex` (`groupId`),
  KEY `fk_biqgnkbfwxibixineytybrcovxpgtxuylucd` (`parentId`),
  CONSTRAINT `fk_biqgnkbfwxibixineytybrcovxpgtxuylucd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_blvuxgcqusfublbbijsdwmceowsmpapcgbaw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vpzpvqhhfcdvjvirttojwwsupkrjnnhqootv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qrrdntqujjpwsfkhtbnuowjfyqltxxxhwudq` (`name`),
  KEY `idx_hvvumesxkveuwswjkjgaxwwsrelzzffxdtwz` (`handle`),
  KEY `idx_eqoetjqvrcccqdrueeqamwkaplatoteplzdl` (`structureId`),
  KEY `idx_vmxposzoobwvzkvadbgmroculjujtcmdncjn` (`fieldLayoutId`),
  KEY `idx_zicmvdjngnrsjsiwjdjepnsqxhjztcefklzg` (`dateDeleted`),
  CONSTRAINT `fk_szopvpnpuiarrbumdlpdrzajsprjvvjatxea` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ysikxlvqhrcmrvuwhqxdaiwwuljfwdhdgxor` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bqwdqfbtitkgzckdosxfpxjkvinxwjxizbay` (`groupId`,`siteId`),
  KEY `idx_ambclfyrhoftmkokvozlvupezdewplvlhmap` (`siteId`),
  CONSTRAINT `fk_weucvfmiytynixsnungmfkylzkwnnuthxlnd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xgfmdmhuntreylqficubrujpsriecbgeripv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_vtufoczbmfayefdarzazwgmasvriseqmsgim` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_oplxadmcbuxrjhthbidbajkgorxmmwadfvju` (`siteId`),
  KEY `fk_udtyvaocukzmlndrjjgrmemrshfkhcpxfxvc` (`userId`),
  CONSTRAINT `fk_npaffbuibcovxbpnbourcvcznbkhjlpseojh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oplxadmcbuxrjhthbidbajkgorxmmwadfvju` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_udtyvaocukzmlndrjjgrmemrshfkhcpxfxvc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_kpsgnsiyjirevqiyebgatqcxgtaoqsnhdrnx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_shkjsfjigmkbveeumvejnpmefawqetpacnuu` (`siteId`),
  KEY `fk_qnozslnfksydshkqlyrmjqtsyjqsktgwfpjs` (`fieldId`),
  KEY `fk_ovpqidccyiluvvsklwvnfayrwywgotticvyk` (`userId`),
  CONSTRAINT `fk_escgifjbcoqywnnxnewugaooodffzswgldri` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ovpqidccyiluvvsklwvnfayrwywgotticvyk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qnozslnfksydshkqlyrmjqtsyjqsktgwfpjs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shkjsfjigmkbveeumvejnpmefawqetpacnuu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_zxafbfrfnmuhhglgtmzhhuhaxymxcqbwppif` (`userId`),
  CONSTRAINT `fk_zxafbfrfnmuhhglgtmzhhuhaxymxcqbwppif` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gzgsonasapgyacdwzwmqmamjzmjjoycitcuw` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_orxocehycwvlkkwfxtcqirkclbjpwlqktutb` (`creatorId`,`provisional`),
  KEY `idx_fascpghddoehyhwztgmozedczdpegwacfwnf` (`saved`),
  KEY `fk_jhobgnptguwrvsxzmmakoszmazjylvvnhltk` (`canonicalId`),
  CONSTRAINT `fk_hbntweapqwncstanuuvavjzxubykzttdjatu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jhobgnptguwrvsxzmmakoszmazjylvvnhltk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_qqyziwemmaqidfyazpwckeplmdsfqkhprwqk` (`elementId`,`timestamp`,`userId`),
  KEY `fk_bwyhefenqxlxwppviqpjkzlxvugygnmvjkqo` (`userId`),
  KEY `fk_aotrpefxruymgagwidnvrtxeeegrcmufxlap` (`siteId`),
  KEY `fk_gyrdkmzvzogooupdrlwfeofqjfhhxfbiswue` (`draftId`),
  CONSTRAINT `fk_aotrpefxruymgagwidnvrtxeeegrcmufxlap` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bwyhefenqxlxwppviqpjkzlxvugygnmvjkqo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gyrdkmzvzogooupdrlwfeofqjfhhxfbiswue` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwkkfhwcaxwajylicjbodgromcfmwjlotksc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kenqnrrnjbgfjxabssnmdzrwlhjmgfznbwbf` (`dateDeleted`),
  KEY `idx_dpyxlugvrykbllkumixnepstsyfhxhwatwnw` (`fieldLayoutId`),
  KEY `idx_crugydmakwkhlzsojksqxxkxaqewegutytjt` (`type`),
  KEY `idx_wucqnbbrbwsfzkfunhtyxwypwlvkwcyxbtkj` (`enabled`),
  KEY `idx_vmympnrmoiqpnzivyhxuidlpamdqvummvuas` (`canonicalId`),
  KEY `idx_npbqafwgzeswvokqtrkuicrxghsyrcenwtfc` (`archived`,`dateCreated`),
  KEY `idx_qyddvyudvjmphvembaoakhfmxnhuvenajnbr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_hwhuainqedcihimtoizbwfhtbxzlrtjsjbku` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_afkynjfobsnouxurjphdwfygwgyzguezsjcw` (`draftId`),
  KEY `fk_zzgkbfpedayszozqyalrqqtptsqwogngvxzk` (`revisionId`),
  CONSTRAINT `fk_afkynjfobsnouxurjphdwfygwgyzguezsjcw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_btzeephjnrotxlqhrktnmuqrvttdbmeachjf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupfytvubbmjzlzkozsyahywffkgqymqwizq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zzgkbfpedayszozqyalrqqtptsqwogngvxzk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_hevqzxdbwihmxghpyzujffqpepjgkaxfnxmo` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_jvxbiorexncafoybvsvxzswjvutlmfwoejcn` (`ownerId`),
  CONSTRAINT `fk_avaaiayszlecggcaextitncfdiqhnkdyzhku` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvxbiorexncafoybvsvxzswjvutlmfwoejcn` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cvxywignclyzrclcnkwylqoyfsrppegfyodp` (`elementId`,`siteId`),
  KEY `idx_jqxbfxamngfloblhxpnidrbxotynmsmszbkk` (`siteId`),
  KEY `idx_dyjwsyzlabplbikdnlqgztsjptfrtpcybsed` (`title`,`siteId`),
  KEY `idx_hwvnrvhwhrzsdtdwxkkcxabbirjzkoacixwa` (`slug`,`siteId`),
  KEY `idx_zcxqbuqjisfymevalpdndzkghwfzlvtoomkt` (`enabled`),
  KEY `idx_rujjcajaiffhwicqnnnfaqoypaaxkxeesvlj` (`uri`,`siteId`),
  CONSTRAINT `fk_bkmztushzxshboehyojwzbrwutsszokcfprw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jyczimyboiwkrwrmudmesykzhtdsjrptbdol` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gjdwkhcalogbwcogmnpoezrdmbrjavtdfstv` (`postDate`),
  KEY `idx_zajssfckqmtmgehkyjtzrunzjymagtnjnmpy` (`expiryDate`),
  KEY `idx_miuhirpjbaofedlujmmlgksghdixzeubwkmj` (`sectionId`),
  KEY `idx_dpknlbjfnftnujcftmfpkvrhfpqehlfkfpmz` (`typeId`),
  KEY `idx_opmpnamxksjainejzfwgghppfeswfrgtcxin` (`primaryOwnerId`),
  KEY `idx_nnajuacoqtcibpmeugmmvsartdwlzpzaafjm` (`fieldId`),
  KEY `fk_wdwxmmrryegfniiryswvvhioicdsqtbjqcos` (`parentId`),
  CONSTRAINT `fk_fmtnvklfbzpmrdiispypsuzsfrmrupllmwhz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_isfsxvwtdjelmxcuejhohdahnutqjuhsbojz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lfetkchzriscnwkmdenlswzkrrarypuynabc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ltimtcuaerahqaglbkrzgdxyjqnsnuqjwlpr` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ohspaldcztdbjhmljwfosfoxbdhionrisfvs` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wdwxmmrryegfniiryswvvhioicdsqtbjqcos` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_aorvgqmesvihizqwnmxexptjwbptkuftrztg` (`authorId`),
  KEY `idx_kasbxdukjrufituowvjrtwbbezknawwlyxly` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ebyvolsacgfjvltmlhdjnbavwcfffojqucfq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uhrcgfjjzaavauhnxhpbdfjuosydobddaxag` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uelpfhgyxuebiiyzrveqyzhnipuepczmajsa` (`fieldLayoutId`),
  KEY `idx_mckqkdbjcfamiocirsfafdpqtrzkolatumgn` (`dateDeleted`),
  CONSTRAINT `fk_lzemmugqieljaxtqicidvgqexnkfjymmtonl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ujxukjynzfqwkmyikqpcdxdmgvhzldjknfen` (`dateDeleted`),
  KEY `idx_rblegqkejkowwcrcgzginfhtbdxhvjyuufon` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rxwkebtikdlmlivkqmfkqfnidohojujyorag` (`handle`,`context`),
  KEY `idx_tjeibgsqucfqxfusukdosbyghegfredgbppg` (`context`),
  KEY `idx_arwyczqqtwynbdbpajrbvwukvyhbowvzwldz` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qdzranypkxelghdqxnmwnudkmhsmzodmmsdj` (`name`),
  KEY `idx_okdhjzprbstsehpchtocgxebjsovizagewyf` (`handle`),
  KEY `idx_upzuyvrfpgrwjmxxwxxsbzhzpldixvbvfuib` (`fieldLayoutId`),
  KEY `idx_fzzhusbcaaddxwluydjjppfptijfykebicit` (`sortOrder`),
  CONSTRAINT `fk_fiyiqeutwrkbhmzwngyuiydvmmbzpcjccutd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ljuecvlainlvyihevxqsiwuqonjljdexzcwa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pxqinjcmwrqmtjxavzdwmhswbsayminggupl` (`accessToken`),
  UNIQUE KEY `idx_mltpueqavfxpwfnwzzuidopksnkdqzrfkoqq` (`name`),
  KEY `fk_ichqjnzdkltjmpnsntbnacrngfimwypkckfg` (`schemaId`),
  CONSTRAINT `fk_ichqjnzdkltjmpnsntbnacrngfimwypkckfg` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_alcpbybnneipjbyfgbnuvypeopfkeuyibgdw` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jisazcuczlaeanyqdosyroxwmpdtalzhblrg` (`name`),
  KEY `idx_mfzrzitdeobwiblohqsmgexrcjpowljbhhhd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rxpqmpfvrntkkfugwejygseblrwrbuoiezqs` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_svaezmdgsaabuqpfddnwyqqyjsessuqfwzho` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_ovzxlmhitdtgsknflpivxyatgncuesybbbah` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_yfrlyggdswgqnfrwaulxslxokypnytzbgisa` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wrvswerrbgatpiygfshcrvxposrgddsjyevx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_rkcuajfusmegvzxwhedspkkfshtdbsjclynf` (`sourceId`),
  KEY `idx_qppmtpqcxrjfukdiybyqybpymofxdkimoeox` (`targetId`),
  KEY `idx_kkvjhhcqvsntpsvulbgdnrnjwqesjnphubpu` (`sourceSiteId`),
  CONSTRAINT `fk_fnepcveatzllgdwppyyvlhohpmcyyynfapni` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rfhnrmoixrqqbhiucjalvfsyrjnfafriwhsr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkvluywercsgcwrfaysworpoajswdrqibpdn` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sbnhvjahexxuthaziqmhdvzyhqszqdneijie` (`canonicalId`,`num`),
  KEY `fk_jybehumvuizlsstbaqqesqtbbpnicupwuizg` (`creatorId`),
  CONSTRAINT `fk_fwqsepvnapghniugremgidnxhjsmfbyvnqyr` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jybehumvuizlsstbaqqesqtbbpnicupwuizg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_jtyyinqjxcxugxfucizwwzqemzwzpwajtbay` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ryaeponyildlbbsiaqgajpcaxtyutprhxsqq` (`handle`),
  KEY `idx_dbfqmazrflynpggxhcdvknymqmgdvwimoltn` (`name`),
  KEY `idx_nvoozcgirertekbizfqjowvdigjcwoodjznm` (`structureId`),
  KEY `idx_lkkrzfbozdibezccnevxcjfkfqihqjvfyvhj` (`dateDeleted`),
  CONSTRAINT `fk_jbdlydvhkoiexdkvoinxwurashidnyilwprd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_pdndyxprqfdecbuemixebmxmqyrbglatqham` (`typeId`),
  CONSTRAINT `fk_btcsqvgklimgkpfoguasbcoyygvtccgteeqr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pdndyxprqfdecbuemixebmxmqyrbglatqham` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cxihbajkrsksbesprhotmnwxdhqdakidmqmd` (`sectionId`,`siteId`),
  KEY `idx_cmqkhnqzondbuikealsbhvnmqhieeypdkkcu` (`siteId`),
  CONSTRAINT `fk_chwhxdecytiybkgaykbafagalsivvvnemswv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sofkwmktjraxbjitchtgytagtferdwywyvom` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sbdeucyahvabnfxmtujuwpgvtqtvghihwrld` (`uid`),
  KEY `idx_cbsrmzjvjhnlyeqhqklapyfeiuzvllwkktee` (`token`),
  KEY `idx_lzfuhrxwrbuwdgjetmfkbbotdgmhcgtqmsux` (`dateUpdated`),
  KEY `idx_nbejrvynsqjpbzzbkquelqbmvlnsnpsuyzlx` (`userId`),
  CONSTRAINT `fk_tmpxhbemkyvfsoxizwnckdaejaenekkwxqxh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tqihpnrevrcbbsucrsnpvxwmszkeqeiyitrc` (`userId`,`message`),
  CONSTRAINT `fk_txtaffrroetqavrjosasopxfgyvbbdjffgmk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rfsqqbkphjhhbqamqupfxtvvgfoddqtkokda` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_badknsdzoiccojhrxkybeuuegqlvazkowazh` (`dateDeleted`),
  KEY `idx_rboouordxkbekdwshualkagqxdijjrlthaly` (`handle`),
  KEY `idx_yhhbuyelwhcqskfktulsjsfatluatqofccla` (`sortOrder`),
  KEY `fk_eyngquabafuahjmmwxmbuzkxgvwmrlynklsk` (`groupId`),
  CONSTRAINT `fk_eyngquabafuahjmmwxmbuzkxgvwmrlynklsk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_dkckkswgvqmxmpunztvgtfbztwcpmabmpksh` (`userId`),
  CONSTRAINT `fk_dkckkswgvqmxmpunztvgtfbztwcpmabmpksh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qbvxyifbxsqvbmekytvisqzivnaevolzospz` (`structureId`,`elementId`),
  KEY `idx_plthnotjmlscsqjvxydblhiamptxqbshpabr` (`root`),
  KEY `idx_tozvqprikaigjuqytjzzpvdjcwsioftpqafn` (`lft`),
  KEY `idx_vyefsucsmnrzczdysriambhkfzhsnkgsulfg` (`rgt`),
  KEY `idx_rgtbmfwfjpiroirluukijitgcqzbetoogeum` (`level`),
  KEY `idx_yfhlyksslnucikamnjfsxwfmgbruvswiojds` (`elementId`),
  CONSTRAINT `fk_efferayhhayfuudmcfuwrsyqphlkoirwrdob` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_urwyhbtimsmezbxwfmzvgyjryitwzfmkeics` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpzqhrjiuyjpkqzhmjtnmdbmbdmxzcpjonxd` (`key`,`language`),
  KEY `idx_fqafkatcgbhpvmxodslterdhazelltpirheu` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_naixtkipzeyifhgsgxqvghsupzfakcsqeoop` (`name`),
  KEY `idx_cxgyyghhqjqcegabqyiihacienlffflckiqy` (`handle`),
  KEY `idx_aqakagbgbwzfyzgzcqzjalftsrjuzziokjwt` (`dateDeleted`),
  KEY `fk_pippmbrijorfjhfuzadjzsifykiovhnxijax` (`fieldLayoutId`),
  CONSTRAINT `fk_pippmbrijorfjhfuzadjzsifykiovhnxijax` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qqmccvpeiifjadvovobnryapjuwpabaljgpn` (`groupId`),
  CONSTRAINT `fk_lufhykmbgullyfezpfhylbnwrjchutliqlxu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rxwxhjydommtxnoscvtghqsdvvpslgcbdccw` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_geqhxavyrpmvzwwozbjxmqoqqzdvtqcfaozf` (`token`),
  KEY `idx_pmrecywozouqjsdxdngrlghpvzmeujqywsug` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wlcyvlmbcjlslicayhesfjwhazvyhyfpdwgg` (`handle`),
  KEY `idx_whvdncfuuyxnhleuevfoxudnjsstrskxbmnv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kvheivaejsiyowyqvlqojrwanoywnyvrhhrc` (`groupId`,`userId`),
  KEY `idx_mitvnpekxtloxywobfdidyjnxlfeqbdtuvjy` (`userId`),
  CONSTRAINT `fk_kfxhmoagkviwigidnkvenutbttwnhoxrqomm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oymdjgddjgkltulykgceqnwurbmsvbylrnuu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hlxodoiokrcrcgvidrceacqxdzhvgmlgecfq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cyhyvtcoeckxkkegzcmewkmflnyuobeuigrb` (`permissionId`,`groupId`),
  KEY `idx_aecvhgxaxsladuhyccgcisnlfypxslntoaou` (`groupId`),
  CONSTRAINT `fk_eywoamxottbdtxbmfnronxxovacdxvumhkpa` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubcjmkfbsnsfvbalpwoboakzxgdlgpodxpqk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mblvxbinylbsszoktlpjqjajytoxeldwksmg` (`permissionId`,`userId`),
  KEY `idx_dnhacldripxrypfttyefcofekdyjjixfwpsy` (`userId`),
  CONSTRAINT `fk_dtqkzongdbjicrewfbikhvsjpmxvpxlbgmvy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qngblyjigsmhqqhpoblzqtfngzdpnatdoojj` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_zlmcxcqqyvqxllqpetojwymcfygwqldtdcnz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zqfjwdrtyetjdagjwfjrddqgmmercqxzwkcr` (`active`),
  KEY `idx_bghqicxltdgohziyvnscrjmdxbqmaqohyvje` (`locked`),
  KEY `idx_wqouqvvdwlcltxoxocxbdvczxjyfxnhtvupg` (`pending`),
  KEY `idx_lvrnfueupsqqmcsmbuuvkrxgukiaeuuzxbjw` (`suspended`),
  KEY `idx_qtwqfsgqqdnicoyoddwnihmexizmcjtrucsh` (`verificationCode`),
  KEY `idx_ykewcwpkwxfhysxfnrhckhlokedrzlrfcxht` (`email`),
  KEY `idx_fkbnqwhcuwtqjhvotvdjbiritmopjtonfvrl` (`username`),
  KEY `fk_bvhixegkhcxfikwimcczdrmofprfckbmylvb` (`photoId`),
  CONSTRAINT `fk_ayxxijnjftmvgnbaqrfzovvoxxigbxfijxhs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bvhixegkhcxfikwimcczdrmofprfckbmylvb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kgvmxtuuxwinevpzkwlrbyksztklykgwxocn` (`name`,`parentId`,`volumeId`),
  KEY `idx_khllgtzvduhygbdaxbsdoerbvcihukytdidq` (`parentId`),
  KEY `idx_ctxofpgdphggqcliowoahmnodgeoanqhvcxn` (`volumeId`),
  CONSTRAINT `fk_ljshtlysolpyvtfvsngspmmafqelknfwddqj` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mrdlwmsswtbvdpzjssdcvabyofopwbybdesi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hiieqrltpcmthmryoaenraboguqclvhiahdu` (`name`),
  KEY `idx_btqxnfoabttssusdxgtdiuhkwqhnnhcexpsm` (`handle`),
  KEY `idx_iskotqhigapafyxziicasyimgwprmpptkzze` (`fieldLayoutId`),
  KEY `idx_ursyvbnfhkhszcgurtwhbwauijmhisdtkhng` (`dateDeleted`),
  CONSTRAINT `fk_etnyvwkokltvkrxlgpbfkejdbkhjpgsfwblt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gpekmcouzavypcosovjslswofpnolsrijsmm` (`userId`),
  CONSTRAINT `fk_gpekmcouzavypcosovjslswofpnolsrijsmm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cbthbsicjiesbcsdadzsuntlhceqjzqogljw` (`userId`),
  CONSTRAINT `fk_rdzxzrqyjwfwwmoojpqiolbvxklfmqdduwmr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 15:53:14
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (18,1,1,1,'drill.jpg','image','This is an image of a drill',640,853,39869,NULL,0,0,'2024-11-12 11:50:54','2024-11-12 11:50:54','2024-11-12 11:53:28'),(21,1,1,1,'book.jpg','image','this is an image of a book',639,379,35359,NULL,0,0,'2024-11-12 11:51:05','2024-11-12 11:51:05','2024-11-12 11:53:16'),(24,1,1,1,'drill.jpg','image',NULL,640,853,39869,NULL,NULL,NULL,'2024-11-12 12:39:34','2024-11-12 12:39:34','2024-11-12 12:39:34'),(27,1,1,1,'book.jpg','image',NULL,639,379,35359,NULL,NULL,NULL,'2024-11-12 12:39:44','2024-11-12 12:39:44','2024-11-12 12:39:44'),(42,1,1,1,'ps5.jpg','image',NULL,640,960,57647,NULL,NULL,NULL,'2024-11-12 14:59:22','2024-11-12 14:59:22','2024-11-12 14:59:22'),(46,1,1,1,'xbox.jpg','image',NULL,640,427,10864,NULL,NULL,NULL,'2024-11-12 15:13:05','2024-11-12 15:13:05','2024-11-12 15:13:05'),(50,1,1,1,'shovle.jpg','image',NULL,640,427,42884,NULL,NULL,NULL,'2024-11-12 15:16:53','2024-11-12 15:16:53','2024-11-12 15:16:53');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (18,1,'This is an image of a drill'),(21,1,'this is an image of a book'),(24,1,NULL),(27,1,NULL),(42,1,NULL),(46,1,NULL),(50,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'lastPasswordChangeDate','2024-11-12 15:52:03',0,1),(1,1,'password','2024-11-12 15:52:03',0,1),(2,1,'postDate','2024-11-12 08:20:09',0,1),(2,1,'slug','2024-11-12 08:20:04',0,1),(2,1,'title','2024-11-12 08:20:04',0,1),(2,1,'uri','2024-11-12 08:20:04',0,1),(4,1,'postDate','2024-11-12 08:22:13',0,1),(4,1,'slug','2024-11-12 08:22:13',0,1),(4,1,'title','2024-11-12 08:22:13',0,1),(4,1,'uri','2024-11-12 08:22:13',0,1),(6,1,'postDate','2024-11-12 08:40:00',0,1),(6,1,'slug','2024-11-12 08:39:52',0,1),(6,1,'title','2024-11-12 08:39:52',0,1),(6,1,'uri','2024-11-12 08:39:52',0,1),(8,1,'postDate','2024-11-12 08:40:16',0,1),(8,1,'slug','2024-11-12 08:40:13',0,1),(8,1,'title','2024-11-12 08:40:13',0,1),(8,1,'uri','2024-11-12 08:40:13',0,1),(10,1,'postDate','2024-11-12 08:40:39',0,1),(10,1,'slug','2024-11-12 08:40:39',0,1),(10,1,'title','2024-11-12 08:40:39',0,1),(10,1,'uri','2024-11-12 08:40:39',0,1),(12,1,'postDate','2024-11-12 08:41:21',0,1),(12,1,'slug','2024-11-12 08:41:21',0,1),(12,1,'title','2024-11-12 08:41:21',0,1),(12,1,'uri','2024-11-12 08:41:21',0,1),(31,1,'postDate','2024-11-12 13:03:58',0,1),(31,1,'slug','2024-11-12 13:16:53',0,1),(31,1,'title','2024-11-12 13:16:53',0,1),(31,1,'uri','2024-11-12 13:03:58',0,1),(40,1,'postDate','2024-11-12 13:56:12',0,1),(40,1,'slug','2024-11-12 13:55:38',0,1),(40,1,'title','2024-11-12 13:55:38',0,1),(40,1,'uri','2024-11-12 13:55:38',0,1),(45,1,'postDate','2024-11-12 15:13:06',0,1),(45,1,'slug','2024-11-12 15:11:50',0,1),(45,1,'title','2024-11-12 15:11:50',0,1),(45,1,'uri','2024-11-12 15:11:50',0,1),(48,1,'postDate','2024-11-12 15:13:44',0,1),(48,1,'slug','2024-11-12 15:13:14',0,1),(48,1,'title','2024-11-12 15:13:14',0,1),(48,1,'uri','2024-11-12 15:13:14',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,5,'ea1c6600-baab-4265-81a6-7d959c7691a0','2024-11-12 08:20:09',0,1),(2,1,9,'8fd4218f-b4dc-429d-b826-7035fd1a0dbe','2024-11-12 08:42:16',0,1),(2,1,10,'e20c0c5d-5c7b-4190-bdbd-268904912f47','2024-11-12 12:39:46',0,1),(2,1,13,'9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5','2024-11-12 13:21:36',0,1),(4,1,5,'ea1c6600-baab-4265-81a6-7d959c7691a0','2024-11-12 08:22:13',0,1),(4,1,9,'8fd4218f-b4dc-429d-b826-7035fd1a0dbe','2024-11-12 08:42:06',0,1),(4,1,10,'e20c0c5d-5c7b-4190-bdbd-268904912f47','2024-11-12 12:39:36',0,1),(4,1,13,'9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5','2024-11-12 13:21:30',0,1),(6,1,5,'8c7fdcd5-c15f-4244-adbd-ffebf67b08da','2024-11-12 08:40:00',0,1),(8,1,5,'8c7fdcd5-c15f-4244-adbd-ffebf67b08da','2024-11-12 08:40:16',0,1),(10,1,5,'8c7fdcd5-c15f-4244-adbd-ffebf67b08da','2024-11-12 08:40:39',0,1),(12,1,5,'8c7fdcd5-c15f-4244-adbd-ffebf67b08da','2024-11-12 08:41:21',0,1),(31,1,6,'0d3ba192-fb84-400e-8b0d-efb3b4250a5c','2024-11-12 13:03:58',0,1),(31,1,7,'104f1069-2d23-4b90-96ec-1e31a51a7ff5','2024-11-12 13:03:58',0,1),(31,1,8,'478be9bc-6432-4a9f-b21a-5e6acaca08ea','2024-11-12 13:03:58',0,1),(40,1,5,'ea1c6600-baab-4265-81a6-7d959c7691a0','2024-11-12 13:56:12',0,1),(40,1,9,'8fd4218f-b4dc-429d-b826-7035fd1a0dbe','2024-11-12 13:56:12',0,1),(40,1,10,'e20c0c5d-5c7b-4190-bdbd-268904912f47','2024-11-12 14:59:24',0,1),(40,1,13,'9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5','2024-11-12 13:56:12',0,1),(45,1,5,'ea1c6600-baab-4265-81a6-7d959c7691a0','2024-11-12 15:13:06',0,1),(45,1,9,'8fd4218f-b4dc-429d-b826-7035fd1a0dbe','2024-11-12 15:13:06',0,1),(45,1,10,'e20c0c5d-5c7b-4190-bdbd-268904912f47','2024-11-12 15:13:06',0,1),(45,1,13,'9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5','2024-11-12 15:13:06',0,1),(48,1,5,'ea1c6600-baab-4265-81a6-7d959c7691a0','2024-11-12 15:13:44',0,1),(48,1,9,'8fd4218f-b4dc-429d-b826-7035fd1a0dbe','2024-11-12 15:13:44',0,1),(48,1,10,'e20c0c5d-5c7b-4190-bdbd-268904912f47','2024-11-12 15:16:56',0,1),(48,1,13,'9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5','2024-11-12 15:13:44',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (15,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-11-12 13:21:36'),(2,1,1,NULL,'save','2024-11-12 13:21:36'),(4,1,1,NULL,'edit','2024-11-12 13:21:29'),(4,1,1,NULL,'save','2024-11-12 13:21:30'),(6,1,1,NULL,'save','2024-11-12 08:40:00'),(8,1,1,NULL,'save','2024-11-12 08:40:16'),(10,1,1,NULL,'save','2024-11-12 08:40:39'),(12,1,1,NULL,'save','2024-11-12 08:41:21'),(18,1,1,NULL,'save','2024-11-12 11:53:28'),(21,1,1,NULL,'save','2024-11-12 11:53:16'),(31,1,1,NULL,'edit','2024-11-12 13:16:50'),(31,1,1,NULL,'save','2024-11-12 13:16:53'),(40,1,1,NULL,'edit','2024-11-12 14:59:23'),(40,1,1,NULL,'save','2024-11-12 14:59:24'),(45,1,1,NULL,'save','2024-11-12 15:13:06'),(48,1,1,NULL,'edit','2024-11-12 15:16:53'),(48,1,1,NULL,'save','2024-11-12 15:16:56');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-11-11 17:58:47','2024-11-12 15:52:02',NULL,NULL,NULL,'00b8dbf6-ee93-48e6-8d5c-fa0ec5966a7d'),(2,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:19:54','2024-11-12 13:21:36',NULL,NULL,NULL,'28831b9b-8ce8-4dd4-94ef-f98bb0511aae'),(3,2,NULL,1,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:20:09','2024-11-12 08:20:10',NULL,NULL,NULL,'6dd13c3f-4588-46ce-9dba-191dd3d341f1'),(4,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:22:02','2024-11-12 13:21:30',NULL,NULL,NULL,'88ee0d85-01c4-4244-a37c-2c0b45fc2d38'),(5,4,NULL,2,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:22:13','2024-11-12 08:22:13',NULL,NULL,NULL,'90ae5b02-14c6-4f8d-a331-629889af16ea'),(6,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:39:42','2024-11-12 08:40:00',NULL,NULL,NULL,'e7a62eef-21b3-4ac6-b740-354e70104f23'),(7,6,NULL,3,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:40:00','2024-11-12 08:40:00',NULL,NULL,NULL,'afcc87d9-bdbd-46f7-a313-1ff2d1761bb2'),(8,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:40:02','2024-11-12 08:40:16',NULL,NULL,NULL,'44556d66-85e7-46f0-9f6d-aef6c60f6e7e'),(9,8,NULL,4,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:40:16','2024-11-12 08:40:16',NULL,NULL,NULL,'2ddce3c3-c1c5-44e1-a581-1ee861356f5f'),(10,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:40:17','2024-11-12 08:40:39',NULL,NULL,NULL,'76c64d3f-f773-41cc-aac8-5c6fe05f193c'),(11,10,NULL,5,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:40:39','2024-11-12 08:40:39',NULL,NULL,NULL,'66f4edfb-f348-4136-b7d4-1abd36d3f23b'),(12,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:41:14','2024-11-12 08:41:21',NULL,NULL,NULL,'445dca3e-e9a6-408a-8558-23bc0f0a83ea'),(13,12,NULL,6,5,'craft\\elements\\Entry',1,0,'2024-11-12 08:41:21','2024-11-12 08:41:21',NULL,NULL,NULL,'3bb2d9b2-510e-4622-a6dc-5415e41160c8'),(15,4,NULL,7,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:42:06','2024-11-12 08:42:06',NULL,NULL,NULL,'1ad0a6b0-1c40-4e2a-9432-5695439b381f'),(17,2,NULL,8,4,'craft\\elements\\Entry',1,0,'2024-11-12 08:42:16','2024-11-12 08:42:16',NULL,NULL,NULL,'3eba42f5-7107-47bc-b4df-b263a5451423'),(18,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 11:50:54','2024-11-12 12:39:06',NULL,'2024-11-12 12:39:06',NULL,'983517d3-f1b6-4bbf-b9e8-7312ff99acff'),(20,4,NULL,9,4,'craft\\elements\\Entry',1,0,'2024-11-12 11:50:57','2024-11-12 11:50:57',NULL,NULL,NULL,'e455f8f3-60b9-4768-9700-7cf15fecca5c'),(21,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 11:51:05','2024-11-12 12:39:06',NULL,'2024-11-12 12:39:06',NULL,'62381dbb-6cf4-4392-a086-c14b286dbc6d'),(23,2,NULL,10,4,'craft\\elements\\Entry',1,0,'2024-11-12 11:51:07','2024-11-12 11:51:07',NULL,NULL,NULL,'ab2831f1-135f-4f45-a7a8-5d061c816b43'),(24,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 12:39:34','2024-11-12 12:39:34',NULL,NULL,NULL,'6461d101-d4e4-4321-87c9-c25c697e2d5b'),(26,4,NULL,11,4,'craft\\elements\\Entry',1,0,'2024-11-12 12:39:36','2024-11-12 12:39:36',NULL,NULL,NULL,'016ae9b2-5151-4920-9147-d553514f770d'),(27,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 12:39:44','2024-11-12 12:39:44',NULL,NULL,NULL,'1e138d5f-67a3-4957-a62c-885a0d95e31e'),(29,2,NULL,12,4,'craft\\elements\\Entry',1,0,'2024-11-12 12:39:45','2024-11-12 12:39:45',NULL,NULL,NULL,'6bd8e440-f53d-4c4d-a66f-16328be9d6bc'),(30,2,NULL,13,4,'craft\\elements\\Entry',1,0,'2024-11-12 12:39:51','2024-11-12 12:39:52',NULL,NULL,NULL,'66e0b3bf-21d9-4e8d-a988-4f9b29cd1893'),(31,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-11-12 13:03:44','2024-11-12 13:18:41',NULL,'2024-11-12 13:18:41',NULL,'944b2c95-3849-43a0-b856-034b4eba9298'),(32,31,NULL,14,7,'craft\\elements\\Entry',1,0,'2024-11-12 13:03:58','2024-11-12 13:03:58',NULL,'2024-11-12 13:18:41',NULL,'7b98e53c-712f-4df2-8ccd-4a7981a2e4ea'),(34,31,NULL,15,7,'craft\\elements\\Entry',1,0,'2024-11-12 13:16:53','2024-11-12 13:16:53',NULL,'2024-11-12 13:18:41',NULL,'8468265b-b155-4442-9171-2dd16d305cd1'),(35,NULL,15,NULL,7,'craft\\elements\\Entry',1,0,'2024-11-12 13:18:42','2024-11-12 13:18:42',NULL,'2024-11-12 13:19:52',NULL,'d6ab621b-1380-40de-9431-8e8f4f964543'),(37,4,NULL,16,4,'craft\\elements\\Entry',1,0,'2024-11-12 13:21:30','2024-11-12 13:21:30',NULL,NULL,NULL,'78fefefb-f09a-4fc4-864d-fafc18c858a0'),(39,2,NULL,17,4,'craft\\elements\\Entry',1,0,'2024-11-12 13:21:36','2024-11-12 13:21:36',NULL,NULL,NULL,'e6a8a323-3536-4843-b141-5dbea7110272'),(40,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-12 13:55:33','2024-11-12 14:59:24',NULL,NULL,NULL,'c50cfaef-9552-490a-b11a-34fe3d5a11e2'),(41,40,NULL,18,4,'craft\\elements\\Entry',1,0,'2024-11-12 13:56:12','2024-11-12 13:56:12',NULL,NULL,NULL,'b1964b5d-0c6a-4cac-99d1-c870c556e1a1'),(42,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 14:59:22','2024-11-12 14:59:22',NULL,NULL,NULL,'4a709b8c-1298-4e4a-9427-f0d629fd830c'),(44,40,NULL,19,4,'craft\\elements\\Entry',1,0,'2024-11-12 14:59:24','2024-11-12 14:59:24',NULL,NULL,NULL,'9c4ce77a-2cb0-41a5-9ba7-ddd094a4e91f'),(45,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-12 15:11:41','2024-11-12 15:13:06',NULL,NULL,NULL,'17cf3835-e02c-4231-a88d-f34b6cc9b579'),(46,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 15:13:05','2024-11-12 15:13:05',NULL,NULL,NULL,'9f2d4675-3810-4759-b96b-cd6964497863'),(47,45,NULL,20,4,'craft\\elements\\Entry',1,0,'2024-11-12 15:13:06','2024-11-12 15:13:06',NULL,NULL,NULL,'068d4343-6234-40dd-baba-4a80c4fba433'),(48,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-12 15:13:08','2024-11-12 15:16:56',NULL,NULL,NULL,'97983412-2a60-437c-94cc-9f2f36bc2396'),(49,48,NULL,21,4,'craft\\elements\\Entry',1,0,'2024-11-12 15:13:45','2024-11-12 15:13:45',NULL,NULL,NULL,'d7400092-8ee3-4c86-8528-1b6e372065c3'),(50,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-11-12 15:16:53','2024-11-12 15:16:53',NULL,NULL,NULL,'e0ebb98a-9e96-42fd-9399-5c31d814b938'),(52,48,NULL,22,4,'craft\\elements\\Entry',1,0,'2024-11-12 15:16:56','2024-11-12 15:16:56',NULL,NULL,NULL,'36056749-adfd-4d2b-999b-0b39f811d6af');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2024-11-11 17:58:47','2024-11-11 17:58:47','1b53e7c1-126b-468d-a9cc-521898e19019'),(2,2,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"500\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [27], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 08:19:54','2024-11-12 13:21:36','2342669b-b974-4a1c-b92e-e4d0d8da801a'),(3,3,1,'Book','book','items/book','{\"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 08:20:10','2024-11-12 08:20:10','33e4291f-94b4-4b2c-8bfe-fb6d4d50515a'),(4,4,1,'Drill','drill','items/drill','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"1000\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [24], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 08:22:02','2024-11-12 13:21:30','4a088869-d464-41ce-8274-6f25e3f617ad'),(5,5,1,'Drill','drill','items/drill','{\"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 08:22:13','2024-11-12 08:22:13','04fd9e4f-b3bb-4d05-b5d3-663bbe22425c'),(6,6,1,'Household','household','categories/household','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Household items\"}',1,'2024-11-12 08:39:42','2024-11-12 08:39:58','5200ae8c-3913-4262-84b3-222f1e992b39'),(7,7,1,'Household','household','categories/household','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Household items\"}',1,'2024-11-12 08:40:00','2024-11-12 08:40:00','27cc3a01-6d8a-4fef-bf71-510caa3f5b2a'),(8,8,1,'Technology','technology','categories/technology','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Technology items\"}',1,'2024-11-12 08:40:02','2024-11-12 08:40:15','432589c3-32d0-47d5-9aef-e79b00373e4c'),(9,9,1,'Technology','technology','categories/technology','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Technology items\"}',1,'2024-11-12 08:40:16','2024-11-12 08:40:16','af240947-8b54-4a0f-ab84-a6baef5f9e4e'),(10,10,1,'Books','books','categories/books','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Book items\"}',1,'2024-11-12 08:40:17','2024-11-12 08:40:39','149c8a38-d2ad-49db-b48c-4ce44431d1b7'),(11,11,1,'Books','books','categories/books','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Book items\"}',1,'2024-11-12 08:40:39','2024-11-12 08:40:39','d8de7433-f492-4ea0-a2e7-76906af57d01'),(12,12,1,'Garden','garden','categories/garden','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Garden items\"}',1,'2024-11-12 08:41:14','2024-11-12 08:41:21','f50ccea6-3df8-43d7-853d-cc1a6aa69e16'),(13,13,1,'Garden','garden','categories/garden','{\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\": \"Garden items\"}',1,'2024-11-12 08:41:21','2024-11-12 08:41:21','97a6f64f-6a3d-4faf-bf54-63968ce34577'),(15,15,1,'Drill','drill','items/drill','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 8], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 08:42:06','2024-11-12 08:42:06','bd1b2746-a28d-48c1-8656-e9a99e3d3e4d'),(17,17,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 08:42:16','2024-11-12 08:42:16','4441a81b-e8c9-4e72-9bb3-41dc760ea6fb'),(18,18,1,'Drill',NULL,NULL,NULL,1,'2024-11-12 11:50:54','2024-11-12 11:50:54','e50665db-6e61-4bc1-861e-123e68be6d2a'),(20,20,1,'Drill','drill','items/drill','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 8], \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [18], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 11:50:57','2024-11-12 11:50:57','c27686f3-eef1-4848-a33b-7266acb3bf9a'),(21,21,1,'Book',NULL,NULL,NULL,1,'2024-11-12 11:51:05','2024-11-12 11:51:05','bcc639af-5aeb-4157-ba03-b76ec081d56f'),(23,23,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [21], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 11:51:07','2024-11-12 11:51:07','5587eaaf-7f2a-4329-ab3a-ad7408a199d0'),(24,24,1,'Drill',NULL,NULL,NULL,1,'2024-11-12 12:39:34','2024-11-12 12:39:34','b30b9bc9-2382-4799-bf4b-cac3b9075eef'),(26,26,1,'Drill','drill','items/drill','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 8], \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [24], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 12:39:36','2024-11-12 12:39:36','13634f28-e4ee-466e-819b-4f335b4a65f0'),(27,27,1,'Book',NULL,NULL,NULL,1,'2024-11-12 12:39:44','2024-11-12 12:39:44','77238792-40c6-4f9e-96f2-8345b2933a2c'),(29,29,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [27], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 12:39:45','2024-11-12 12:39:45','b7212464-97a2-4099-b404-5dc0418f0b4c'),(30,30,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [27], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 12:39:52','2024-11-12 12:39:52','10d1c246-a6fb-4aa0-a3ff-7dd3ab65c355'),(31,31,1,'user','user','users/user','{\"0d3ba192-fb84-400e-8b0d-efb3b4250a5c\": \"Colin\", \"104f1069-2d23-4b90-96ec-1e31a51a7ff5\": \"Willems\", \"478be9bc-6432-4a9f-b21a-5e6acaca08ea\": \"cwillems1903@gmail.com\", \"4b538c4b-fd15-47b1-af12-c5104d136858\": []}',1,'2024-11-12 13:03:44','2024-11-12 13:16:53','5b3a20b7-347a-4b31-92b9-596797b09b67'),(32,32,1,NULL,'__temp_jpueftoymuqjlvjanxpdhacxnqzndkfjqoub','users/__temp_jpueftoymuqjlvjanxpdhacxnqzndkfjqoub','{\"0d3ba192-fb84-400e-8b0d-efb3b4250a5c\": \"Colin\", \"104f1069-2d23-4b90-96ec-1e31a51a7ff5\": \"Willems\", \"478be9bc-6432-4a9f-b21a-5e6acaca08ea\": \"cwillems1903@gmail.com\", \"4b538c4b-fd15-47b1-af12-c5104d136858\": []}',1,'2024-11-12 13:03:58','2024-11-12 13:03:58','168c268c-29ac-400b-9fdf-f2ef4f19d11b'),(34,34,1,'user','user','users/user','{\"0d3ba192-fb84-400e-8b0d-efb3b4250a5c\": \"Colin\", \"104f1069-2d23-4b90-96ec-1e31a51a7ff5\": \"Willems\", \"478be9bc-6432-4a9f-b21a-5e6acaca08ea\": \"cwillems1903@gmail.com\", \"4b538c4b-fd15-47b1-af12-c5104d136858\": []}',1,'2024-11-12 13:16:53','2024-11-12 13:16:53','d1996af7-2685-4bbb-a456-dbc04eebeee4'),(35,35,1,NULL,'__temp_kqdapuhmiaaczzubsfyzuwoznkrbtppeeiat','users/__temp_kqdapuhmiaaczzubsfyzuwoznkrbtppeeiat','{\"4800cc3e-69a0-455e-9e56-9e4f23d0e259\": [], \"4b538c4b-fd15-47b1-af12-c5104d136858\": []}',1,'2024-11-12 13:18:42','2024-11-12 13:18:42','296e3a3a-2f1f-4e89-948a-033275066bd0'),(37,37,1,'Drill','drill','items/drill','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"1000\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [24], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a drill\"}',1,'2024-11-12 13:21:30','2024-11-12 13:21:30','d9cde383-8254-4a77-83aa-1bce94cf5191'),(39,39,1,'Book','book','items/book','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [6, 10], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"500\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [27], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a book\"}',1,'2024-11-12 13:21:36','2024-11-12 13:21:36','a9a5db74-dce2-41ce-99c2-8ab16a64950c'),(40,40,1,'PS5','ps5','items/ps5','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"2099\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [42], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"this is a ps5\"}',1,'2024-11-12 13:55:33','2024-11-12 14:59:24','2021814e-6dd4-49c0-8501-5f9aa8952e7a'),(41,41,1,'PS5','ps5','items/ps5','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"2099\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"this is a ps5\"}',1,'2024-11-12 13:56:12','2024-11-12 13:56:12','6149a2bc-a19c-44f3-8902-902b575e0870'),(42,42,1,'Ps5',NULL,NULL,NULL,1,'2024-11-12 14:59:22','2024-11-12 14:59:22','96805cca-e51a-4699-91bf-4ff4009ade97'),(44,44,1,'PS5','ps5','items/ps5','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"2099\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [42], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"this is a ps5\"}',1,'2024-11-12 14:59:24','2024-11-12 14:59:24','e5ed5c83-2e28-458b-aba3-80d6666c9b14'),(45,45,1,'XBOX','xbox','items/xbox','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"1899\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [46], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is an XBOX\"}',1,'2024-11-12 15:11:41','2024-11-12 15:13:05','ceb6cb03-3fd9-46ba-aec6-612f2a8fccaf'),(46,46,1,'Xbox',NULL,NULL,NULL,1,'2024-11-12 15:13:05','2024-11-12 15:13:05','17ed4bce-adb3-4e90-b0aa-600fa8ac0c8a'),(47,47,1,'XBOX','xbox','items/xbox','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [8], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"1899\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [46], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is an XBOX\"}',1,'2024-11-12 15:13:06','2024-11-12 15:13:06','eb7c9c6e-35bb-4db6-baaf-99e82600ab9b'),(48,48,1,'Shovle','shovle','items/shovle','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [12, 6], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"875\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [50], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a shovle\"}',1,'2024-11-12 15:13:08','2024-11-12 15:16:56','5edd01a0-e97b-4bbd-889b-31fda1ecca02'),(49,49,1,'Shovle','shovle','items/shovle','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [12, 6], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"875\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a shovle\"}',1,'2024-11-12 15:13:45','2024-11-12 15:13:45','2ecfb9c4-29ab-432f-8a7a-69f32e0b88ba'),(50,50,1,'Shovle',NULL,NULL,NULL,1,'2024-11-12 15:16:53','2024-11-12 15:16:53','3d4f8ab4-1088-4260-b5f3-32428fec45ab'),(52,52,1,'Shovle','shovle','items/shovle','{\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\": [12, 6], \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\": \"875\", \"e20c0c5d-5c7b-4190-bdbd-268904912f47\": [50], \"ea1c6600-baab-4265-81a6-7d959c7691a0\": \"This is a shovle\"}',1,'2024-11-12 15:16:56','2024-11-12 15:16:56','1236c30d-3ad7-4385-9f8a-18a0c8f6e99b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 08:19:54','2024-11-12 08:20:09'),(3,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 08:20:10','2024-11-12 08:20:10'),(4,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 08:22:02','2024-11-12 08:22:13'),(5,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 08:22:13','2024-11-12 08:22:13'),(6,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:39:42','2024-11-12 08:40:00'),(7,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:40:00','2024-11-12 08:40:00'),(8,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:40:02','2024-11-12 08:40:16'),(9,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:40:16','2024-11-12 08:40:16'),(10,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:40:17','2024-11-12 08:40:39'),(11,4,NULL,NULL,NULL,5,'2024-11-12 08:40:00',NULL,NULL,'2024-11-12 08:40:39','2024-11-12 08:40:39'),(12,4,NULL,NULL,NULL,5,'2024-11-12 08:41:00',NULL,NULL,'2024-11-12 08:41:14','2024-11-12 08:41:21'),(13,4,NULL,NULL,NULL,5,'2024-11-12 08:41:00',NULL,NULL,'2024-11-12 08:41:21','2024-11-12 08:41:21'),(15,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 08:42:06','2024-11-12 08:42:06'),(17,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 08:42:16','2024-11-12 08:42:16'),(20,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 11:50:57','2024-11-12 11:50:57'),(23,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 11:51:07','2024-11-12 11:51:07'),(26,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 12:39:36','2024-11-12 12:39:36'),(29,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 12:39:45','2024-11-12 12:39:45'),(30,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 12:39:52','2024-11-12 12:39:52'),(31,5,NULL,NULL,NULL,6,'2024-11-12 13:03:00',NULL,0,'2024-11-12 13:03:44','2024-11-12 13:03:58'),(32,5,NULL,NULL,NULL,6,'2024-11-12 13:03:00',NULL,NULL,'2024-11-12 13:03:58','2024-11-12 13:03:58'),(34,5,NULL,NULL,NULL,6,'2024-11-12 13:03:00',NULL,NULL,'2024-11-12 13:16:53','2024-11-12 13:16:53'),(35,5,NULL,NULL,NULL,6,'2024-11-12 13:18:42',NULL,NULL,'2024-11-12 13:18:42','2024-11-12 13:18:42'),(37,3,NULL,NULL,NULL,4,'2024-11-12 08:22:00',NULL,NULL,'2024-11-12 13:21:30','2024-11-12 13:21:30'),(39,3,NULL,NULL,NULL,4,'2024-11-12 08:20:00',NULL,NULL,'2024-11-12 13:21:36','2024-11-12 13:21:36'),(40,3,NULL,NULL,NULL,4,'2024-11-12 13:56:00',NULL,NULL,'2024-11-12 13:55:33','2024-11-12 13:56:12'),(41,3,NULL,NULL,NULL,4,'2024-11-12 13:56:00',NULL,NULL,'2024-11-12 13:56:12','2024-11-12 13:56:12'),(44,3,NULL,NULL,NULL,4,'2024-11-12 13:56:00',NULL,NULL,'2024-11-12 14:59:24','2024-11-12 14:59:24'),(45,3,NULL,NULL,NULL,4,'2024-11-12 15:13:00',NULL,NULL,'2024-11-12 15:11:41','2024-11-12 15:13:06'),(47,3,NULL,NULL,NULL,4,'2024-11-12 15:13:00',NULL,NULL,'2024-11-12 15:13:06','2024-11-12 15:13:06'),(48,3,NULL,NULL,NULL,4,'2024-11-12 15:13:00',NULL,NULL,'2024-11-12 15:13:08','2024-11-12 15:13:44'),(49,3,NULL,NULL,NULL,4,'2024-11-12 15:13:00',NULL,NULL,'2024-11-12 15:13:45','2024-11-12 15:13:45'),(52,3,NULL,NULL,NULL,4,'2024-11-12 15:13:00',NULL,NULL,'2024-11-12 15:16:56','2024-11-12 15:16:56');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(15,1,1),(17,1,1),(20,1,1),(23,1,1),(26,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(34,1,1),(35,1,1),(37,1,1),(39,1,1),(40,1,1),(41,1,1),(44,1,1),(45,1,1),(47,1,1),(48,1,1),(49,1,1),(52,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Products','products','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-11 19:18:13','2024-11-11 19:18:13','2024-11-12 08:07:21','52a23078-8c2a-4c40-a527-187fe3c98f4c'),(2,2,'Brands','brands','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-11 19:20:22','2024-11-11 19:20:22','2024-11-12 08:07:20','222a25c3-4a56-4dc4-bfb3-36adc43d48b4'),(3,3,'Users','users','',NULL,0,'site',NULL,'',1,'site',NULL,1,'2024-11-12 08:14:22','2024-11-12 08:14:22','2024-11-12 08:18:23','75414276-f46c-491c-95c9-239e2d8277cd'),(4,4,'Items','items','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-12 08:19:02','2024-11-12 08:19:02',NULL,'fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb'),(5,5,'Categories','categories','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-12 08:35:36','2024-11-12 08:35:36',NULL,'a96a970f-c491-425f-b402-25ce2b451181'),(6,7,'Users','users','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-12 13:00:27','2024-11-12 13:16:39','2024-11-12 13:19:58','855b80f0-37b2-4e31-a12d-7960a9d629ce');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"65b21edc-0dad-4d84-9fb8-f81c359614ea\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a71d07af-afb2-4308-a7f8-f53fe7331af3\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-11T19:13:46+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"26ece12f-1aa0-432c-88c4-aee323219c0f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"8f2ecf20-13f9-4610-b281-c6f7e5555f0c\", \"required\": false, \"dateAdded\": \"2024-11-11T19:18:13+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"27a4bbbc-353d-4499-8a94-d1ecf7a23d19\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3a31cb52-ec9e-4b8a-8dba-66ea75413f2c\", \"required\": false, \"dateAdded\": \"2024-11-11T19:18:13+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5ca15853-5487-441d-a807-594f9e92eac6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ebc3e8e8-cff3-45b6-bf98-597221761a33\", \"required\": false, \"dateAdded\": \"2024-11-11T19:18:13+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-11 19:18:13','2024-11-11 19:18:13','2024-11-12 08:07:21','3566f93a-cdd6-4867-9f5b-7473b84513e4'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"07b80863-fbf4-4dc5-9009-1a5d51326a9f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4847a2d3-507c-4f3c-80d3-bc84f087d510\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-11T19:18:32+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"001b308f-3069-4193-82eb-82e7fa3a94ba\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3a31cb52-ec9e-4b8a-8dba-66ea75413f2c\", \"required\": false, \"dateAdded\": \"2024-11-11T19:20:22+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-11 19:20:22','2024-11-11 19:20:22','2024-11-12 08:07:20','236e2dbe-2276-4e62-b4d2-e8f32ad70a88'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"7b24b0d7-b9e8-43be-a252-1025cc9ff929\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"265772cf-71c3-48fa-9937-4514f6f3344a\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T08:11:54+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"b2e6fc36-dbc6-4a20-ada3-56a6d5d2abad\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d949645-afc0-4906-af03-570571c6b6f6\", \"required\": false, \"dateAdded\": \"2024-11-12T08:14:22+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"97a443b5-1a53-4247-994f-a5313fc75be4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"68c18dda-4fc7-44ac-8aa9-3525bd1cbdfd\", \"required\": false, \"dateAdded\": \"2024-11-12T08:14:22+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b9fc9853-f6bf-47d9-9d70-54d68a7a3ed9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"da5fe7da-6d8f-4897-8c89-a07ea987ffe1\", \"required\": false, \"dateAdded\": \"2024-11-12T08:14:22+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 08:14:22','2024-11-12 08:14:22','2024-11-12 08:18:23','2ebe5d69-b974-4690-a067-ce20bd6bb90a'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"bfdda906-aa03-4d97-8793-9c02c50e8de5\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"8085ec2a-2bb1-4b93-9c80-a4c2a7ee1f70\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T08:17:33+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ea1c6600-baab-4265-81a6-7d959c7691a0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7fcc62cd-904f-4738-abb5-739cfe278b1f\", \"required\": false, \"dateAdded\": \"2024-11-12T08:19:02+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46cc2cc9-1ebe-41ef-af40-899882c127ef\", \"required\": false, \"dateAdded\": \"2024-11-12T08:39:34+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d3635528-b99a-4945-85a7-304b466fd1e3\", \"required\": false, \"dateAdded\": \"2024-11-12T13:21:11+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e20c0c5d-5c7b-4190-bdbd-268904912f47\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a98f3176-e215-4b47-acff-001465fdfc8a\", \"required\": false, \"dateAdded\": \"2024-11-12T11:48:57+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 08:19:02','2024-11-12 13:21:11',NULL,'bb2bc613-6733-4e17-90b3-7dfa3eacd1fc'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"5ed2a330-df8e-4365-816e-e70e28822244\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"89d3e84c-710a-4876-82b4-3f3c31419950\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T08:33:59+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7fcc62cd-904f-4738-abb5-739cfe278b1f\", \"required\": false, \"dateAdded\": \"2024-11-12T08:35:36+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 08:35:36','2024-11-12 08:35:36',NULL,'e3b8db67-891c-4bc9-8081-005fbe799a1a'),(6,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"e06eca56-a5a5-4271-b9ae-d7b7fae0f217\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"10feb8c6-82a3-4884-a9bc-2d0db6909d48\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T11:44:30+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"e39a74a8-e8c2-48e0-98fb-8524e6bb6cdd\", \"cols\": null, \"name\": null, \"rows\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"alt\", \"dateAdded\": \"2024-11-12T11:52:54+00:00\", \"requirable\": true, \"orientation\": null, \"placeholder\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 11:46:42','2024-11-12 11:52:54',NULL,'e934184a-dc02-4728-aecc-cb9e39f265ef'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"c47f8f4d-827c-4d0a-b89c-2780b326abd8\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0e18c60a-5953-4cb9-ba6d-ced416fb1bec\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T12:58:57+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4800cc3e-69a0-455e-9e56-9e4f23d0e259\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"32f19991-c7e7-472c-811b-63a34ed08ee0\", \"required\": false, \"dateAdded\": \"2024-11-12T13:18:30+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4b538c4b-fd15-47b1-af12-c5104d136858\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a98f3176-e215-4b47-acff-001465fdfc8a\", \"required\": false, \"dateAdded\": \"2024-11-12T13:00:27+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 13:00:27','2024-11-12 13:18:30','2024-11-12 13:19:58','51ef6928-628a-4981-93d3-c19f42306d74'),(8,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"927cce61-d15c-43de-9fb7-4965a938ca10\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"9754ad56-208a-4aed-a1ac-7dbb4a778207\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-12T13:03:14+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"18884f03-afb1-4042-9efc-1ee3cc8dd14d\", \"cols\": null, \"name\": null, \"rows\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"alt\", \"dateAdded\": \"2024-11-12T13:04:49+00:00\", \"requirable\": true, \"orientation\": null, \"placeholder\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-12 13:04:49','2024-11-12 13:04:49',NULL,'e8556bb8-0259-41e2-a205-d56b9d266fc0');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Brand','brand','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-11 19:15:50','2024-11-11 19:15:50','2024-11-11 19:22:05','8f2ecf20-13f9-4610-b281-c6f7e5555f0c'),(2,'Description','description','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-11 19:16:05','2024-11-11 19:16:05','2024-11-12 08:07:10','3a31cb52-ec9e-4b8a-8dba-66ea75413f2c'),(3,'Price','price','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":2,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2024-11-11 19:16:36','2024-11-11 19:16:36','2024-11-12 08:07:12','ebc3e8e8-cff3-45b6-bf98-597221761a33'),(4,'Brand','brand','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:6eb6179b-52ab-41b0-b123-d5e425acec02\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-11 19:23:12','2024-11-11 19:23:12','2024-11-12 08:07:08','92823086-a52d-4860-9283-fd8500f83263'),(5,'Description','description','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"enlarged\"}','2024-11-12 08:12:01','2024-11-12 08:12:01',NULL,'7fcc62cd-904f-4738-abb5-739cfe278b1f'),(6,'First_name','firstName','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-12 08:13:45','2024-11-12 08:13:45','2024-11-12 13:20:11','9d949645-afc0-4906-af03-570571c6b6f6'),(7,'Last_name','lastName','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-12 08:13:57','2024-11-12 08:13:57','2024-11-12 13:20:03','68c18dda-4fc7-44ac-8aa9-3525bd1cbdfd'),(8,'Email','email','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-12 08:14:14','2024-11-12 08:14:14','2024-11-12 13:20:13','da5fe7da-6d8f-4897-8c89-a07ea987ffe1'),(9,'Categories','categories','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:bc3e1997-f1fb-409f-b75d-c1089e3365a1\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-12 08:39:25','2024-11-12 08:39:25',NULL,'46cc2cc9-1ebe-41ef-af40-899882c127ef'),(10,'ItemImage','itemImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-12 11:47:58','2024-11-12 13:07:02',NULL,'a98f3176-e215-4b47-acff-001465fdfc8a'),(11,'User','user','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:757bef3d-04f8-4818-978e-8a25567480b0\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-12 13:02:55','2024-11-12 13:02:55',NULL,'cb7139fb-d6e2-4529-9781-80b3fc31c7f7'),(12,'Userinfo','userinfo','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Users','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-12 13:18:26','2024-11-12 13:18:26','2024-11-12 13:20:05','32f19991-c7e7-472c-811b-63a34ed08ee0'),(13,'Price','price','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Money','{\"currency\":\"EUR\",\"defaultValue\":null,\"max\":null,\"min\":0,\"showCurrency\":true,\"size\":null}','2024-11-12 13:20:51','2024-11-12 13:20:51',NULL,'d3635528-b99a-4945-85a7-304b466fd1e3');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2024-11-12 13:15:49','2024-11-12 13:15:49','28e8f6e9-3415-4f68-8cd5-37d875c78e52');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'Small','small','fit','center-center',400,NULL,NULL,80,'none',NULL,0,'2024-11-12 12:46:27','2024-11-12 12:46:27','2024-11-12 12:46:27','4bbe6fda-f17a-4969-8f87-154934410708');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.4.10.1','5.3.0.2',0,'koasljxubwkr','3@abhdaxniav','2024-11-11 17:58:47','2024-11-12 13:21:11','c18af5a6-2d20-4bc2-adbf-47f5e5a74b05');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','3b731dd6-2ff8-4e12-86c0-28bc912404af'),(2,'craft','m221101_115859_create_entries_authors_table','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','0b918c38-6388-46d5-8a84-048497575d09'),(3,'craft','m221107_112121_add_max_authors_to_sections','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','a9c10ed9-4b4a-45e7-acad-1dbada76d748'),(4,'craft','m221205_082005_translatable_asset_alt_text','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','bb482d9b-e68f-4eaf-8a5d-bc0cc7980517'),(5,'craft','m230314_110309_add_authenticator_table','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','2bc42a17-da54-41e4-9b20-c655c1f3584d'),(6,'craft','m230314_111234_add_webauthn_table','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','942ebb9a-63fb-4fc0-9047-3a093c7875da'),(7,'craft','m230503_120303_add_recoverycodes_table','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','17747d88-bcc2-4e4f-9bf4-03aae3f0e6ce'),(8,'craft','m230511_000000_field_layout_configs','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','4d457ed9-c94a-4273-be36-320dd888f549'),(9,'craft','m230511_215903_content_refactor','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','e6d6fe68-0f03-48a8-af1b-fac96a9c9e56'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','88e3bd9e-27e6-4dd0-84da-084d714e5437'),(11,'craft','m230524_000001_entry_type_icons','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','a7f72465-2aea-4c35-afd7-0def9c0caea5'),(12,'craft','m230524_000002_entry_type_colors','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','2a5f552d-90b1-4b83-b0b4-08718890eb56'),(13,'craft','m230524_220029_global_entry_types','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','e29e1745-ae18-4f6b-88b3-8ec9a753e17d'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','50939759-4765-4d83-9c40-7a10933eb9ca'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','e9b0ad6e-2e3e-4a0c-88bb-1dde96155306'),(16,'craft','m230616_173810_kill_field_groups','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','5b4c95bb-47b2-405a-b2f3-7cea1a4f0a83'),(17,'craft','m230616_183820_remove_field_name_limit','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','4cca75a4-8a25-4018-9fcc-8a17639e75f2'),(18,'craft','m230617_070415_entrify_matrix_blocks','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','4c453ed7-3fca-4d58-8a6d-415d183704f0'),(19,'craft','m230710_162700_element_activity','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','ff8d865e-d84d-4df5-8e90-a0d140130eb0'),(20,'craft','m230820_162023_fix_cache_id_type','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','8bbe2e51-b1d0-41a0-9ef4-f3d8fac86c84'),(21,'craft','m230826_094050_fix_session_id_type','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','ab322b3a-674e-4807-868e-98e2dc08dc66'),(22,'craft','m230904_190356_address_fields','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','947c396f-a860-4222-9c87-b359a94ecef3'),(23,'craft','m230928_144045_add_subpath_to_volumes','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','2f11c13c-32b9-4136-a70e-75b9b16976c4'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','e8e132ca-fe86-4015-9c00-fa3473a016ca'),(25,'craft','m231213_030600_element_bulk_ops','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','9ede3a9e-3e16-4420-a562-cf22e929a893'),(26,'craft','m240129_150719_sites_language_amend_length','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','d2d8be71-30a4-4809-8b89-a0e2195c6fe3'),(27,'craft','m240206_035135_convert_json_columns','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','c889e263-53ed-4c7b-9da7-c11cb84bf2f4'),(28,'craft','m240207_182452_address_line_3','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','3657d0bc-ffae-4ff3-9980-3806c697bfe8'),(29,'craft','m240302_212719_solo_preview_targets','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','60c3cd45-a09d-4fd4-84fc-dbaa0ea5a30e'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','5ea184a0-6622-4441-adc9-4a95b701943b'),(31,'craft','m240723_214330_drop_bulkop_fk','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','b7cd8a85-d291-4cdd-a430-105d4eb20c4f'),(32,'craft','m240731_053543_soft_delete_fields','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','d7d6fe5b-1413-4fde-a0c3-1290d9881602'),(33,'craft','m240805_154041_sso_identities','2024-11-11 17:58:48','2024-11-11 17:58:48','2024-11-11 17:58:48','323f029e-b99d-46c3-af91-06977ed8d358');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1731417671'),('email.fromEmail','\"cwillems1903@gmail.com\"'),('email.fromName','\"craft-eindproject\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.color','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elementCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.autocomplete','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.autocorrect','true'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.class','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.dateAdded','\"2024-11-12T08:33:59+00:00\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.disabled','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.elementCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.id','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.includeInCards','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.inputType','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.instructions','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.label','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.max','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.min','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.name','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.orientation','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.placeholder','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.readonly','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.requirable','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.size','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.step','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.tip','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.title','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.uid','\"89d3e84c-710a-4876-82b4-3f3c31419950\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.userCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.warning','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.0.width','100'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.dateAdded','\"2024-11-12T08:35:36+00:00\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.elementCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.fieldUid','\"7fcc62cd-904f-4738-abb5-739cfe278b1f\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.handle','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.includeInCards','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.instructions','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.label','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.providesThumbs','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.required','false'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.tip','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.uid','\"8c7fdcd5-c15f-4244-adbd-ffebf67b08da\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.userCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.warning','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.elements.1.width','100'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.name','\"Content\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.uid','\"5ed2a330-df8e-4365-816e-e70e28822244\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.fieldLayouts.e3b8db67-891c-4bc9-8081-005fbe799a1a.tabs.0.userCondition','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.handle','\"categories\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.hasTitleField','true'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.icon','\"\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.name','\"Categories\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.showSlugField','true'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.showStatusField','true'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.slugTranslationKeyFormat','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.slugTranslationMethod','\"site\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.titleFormat','\"\"'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.titleTranslationKeyFormat','null'),('entryTypes.a96a970f-c491-425f-b402-25ce2b451181.titleTranslationMethod','\"site\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.color','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.autocomplete','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.autocorrect','true'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.class','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.dateAdded','\"2024-11-12T08:17:33+00:00\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.disabled','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.id','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.includeInCards','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.inputType','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.instructions','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.label','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.max','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.min','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.name','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.orientation','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.placeholder','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.providesThumbs','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.readonly','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.requirable','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.size','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.step','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.tip','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.title','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.uid','\"8085ec2a-2bb1-4b93-9c80-a4c2a7ee1f70\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.warning','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.0.width','100'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.dateAdded','\"2024-11-12T08:19:02+00:00\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.fieldUid','\"7fcc62cd-904f-4738-abb5-739cfe278b1f\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.handle','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.includeInCards','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.instructions','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.label','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.providesThumbs','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.required','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.tip','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.uid','\"ea1c6600-baab-4265-81a6-7d959c7691a0\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.warning','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.1.width','100'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.dateAdded','\"2024-11-12T08:39:34+00:00\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.fieldUid','\"46cc2cc9-1ebe-41ef-af40-899882c127ef\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.handle','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.includeInCards','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.instructions','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.label','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.providesThumbs','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.required','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.tip','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.uid','\"8fd4218f-b4dc-429d-b826-7035fd1a0dbe\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.warning','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.2.width','100'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.dateAdded','\"2024-11-12T13:21:11+00:00\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.fieldUid','\"d3635528-b99a-4945-85a7-304b466fd1e3\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.handle','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.includeInCards','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.instructions','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.label','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.providesThumbs','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.required','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.tip','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.uid','\"9e4a7f16-3cdd-40f9-9d51-251a7cfc3af5\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.warning','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.3.width','100'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.dateAdded','\"2024-11-12T11:48:57+00:00\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.elementCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.fieldUid','\"a98f3176-e215-4b47-acff-001465fdfc8a\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.handle','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.includeInCards','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.instructions','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.label','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.providesThumbs','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.required','false'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.tip','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.uid','\"e20c0c5d-5c7b-4190-bdbd-268904912f47\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.warning','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.elements.4.width','100'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.name','\"Content\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.uid','\"bfdda906-aa03-4d97-8793-9c02c50e8de5\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.fieldLayouts.bb2bc613-6733-4e17-90b3-7dfa3eacd1fc.tabs.0.userCondition','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.handle','\"items\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.hasTitleField','true'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.icon','\"\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.name','\"Items\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.showSlugField','true'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.showStatusField','true'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.slugTranslationKeyFormat','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.slugTranslationMethod','\"site\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.titleFormat','\"\"'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.titleTranslationKeyFormat','null'),('entryTypes.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb.titleTranslationMethod','\"site\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.columnSuffix','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.handle','\"categories\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.instructions','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.name','\"Categories\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.searchable','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.allowSelfRelations','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.branchLimit','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.maintainHierarchy','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.maxRelations','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.minRelations','1'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.selectionLabel','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.showCardsInGrid','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.showSiteMenu','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.sources.0','\"section:bc3e1997-f1fb-409f-b75d-c1089e3365a1\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.targetSiteId','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.validateRelatedElements','false'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.settings.viewMode','\"list\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.translationKeyFormat','null'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.translationMethod','\"none\"'),('fields.46cc2cc9-1ebe-41ef-af40-899882c127ef.type','\"craft\\\\fields\\\\Entries\"'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.columnSuffix','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.handle','\"description\"'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.instructions','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.name','\"Description\"'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.searchable','false'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.byteLimit','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.charLimit','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.code','false'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.initialRows','4'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.multiline','true'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.placeholder','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.settings.uiMode','\"enlarged\"'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.translationKeyFormat','null'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.translationMethod','\"none\"'),('fields.7fcc62cd-904f-4738-abb5-739cfe278b1f.type','\"craft\\\\fields\\\\PlainText\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.columnSuffix','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.handle','\"itemImage\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.instructions','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.name','\"ItemImage\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.searchable','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.allowedKinds','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.allowSelfRelations','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.allowSubfolders','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.allowUploads','true'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.branchLimit','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.defaultUploadLocationSource','\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.defaultUploadLocationSubpath','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.maintainHierarchy','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.maxRelations','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.minRelations','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.previewMode','\"full\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.restrictedDefaultUploadSubpath','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.restrictedLocationSource','\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.restrictedLocationSubpath','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.restrictFiles','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.restrictLocation','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.selectionLabel','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.showCardsInGrid','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.showSiteMenu','true'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.showUnpermittedFiles','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.showUnpermittedVolumes','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.sources.0','\"volume:a6581f07-e70e-4213-9257-f7dd8c36a8c1\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.targetSiteId','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.validateRelatedElements','false'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.settings.viewMode','\"list\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.translationKeyFormat','null'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.translationMethod','\"none\"'),('fields.a98f3176-e215-4b47-acff-001465fdfc8a.type','\"craft\\\\fields\\\\Assets\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.columnSuffix','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.handle','\"user\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.instructions','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.name','\"User\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.searchable','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.allowSelfRelations','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.branchLimit','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.maintainHierarchy','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.maxRelations','1'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.minRelations','1'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.selectionLabel','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.showCardsInGrid','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.showSiteMenu','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.sources.0','\"section:757bef3d-04f8-4818-978e-8a25567480b0\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.targetSiteId','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.validateRelatedElements','false'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.settings.viewMode','\"list\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.translationKeyFormat','null'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.translationMethod','\"none\"'),('fields.cb7139fb-d6e2-4529-9781-80b3fc31c7f7.type','\"craft\\\\fields\\\\Entries\"'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.columnSuffix','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.handle','\"price\"'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.instructions','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.name','\"Price\"'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.searchable','false'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.currency','\"EUR\"'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.defaultValue','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.max','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.min','0'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.showCurrency','true'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.settings.size','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.translationKeyFormat','null'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.translationMethod','\"none\"'),('fields.d3635528-b99a-4945-85a7-304b466fd1e3.type','\"craft\\\\fields\\\\Money\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"/images\"'),('graphql.schemas.28e8f6e9-3415-4f68-8cd5-37d875c78e52.isPublic','true'),('graphql.schemas.28e8f6e9-3415-4f68-8cd5-37d875c78e52.name','\"Public Schema\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.fill','null'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.format','null'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.handle','\"small\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.height','null'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.interlace','\"none\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.mode','\"fit\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.name','\"Small\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.position','\"center-center\"'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.quality','80'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.upscale','false'),('imageTransforms.4bbe6fda-f17a-4969-8f87-154934410708.width','400'),('meta.__names__.264cfef0-2d06-4198-ab33-71f3b0f593bc','\"craft-eindproject\"'),('meta.__names__.28e8f6e9-3415-4f68-8cd5-37d875c78e52','\"Public Schema\"'),('meta.__names__.46cc2cc9-1ebe-41ef-af40-899882c127ef','\"Categories\"'),('meta.__names__.4a8c4327-102a-43c3-ab0e-c527e5095c2b','\"craft-eindproject\"'),('meta.__names__.4bbe6fda-f17a-4969-8f87-154934410708','\"Small\"'),('meta.__names__.7fcc62cd-904f-4738-abb5-739cfe278b1f','\"Description\"'),('meta.__names__.a34954f8-ee15-4413-af04-d685e95a0c6e','\"Items\"'),('meta.__names__.a4146483-3976-438d-bb82-920e02ad5ed3','\"Users\"'),('meta.__names__.a6581f07-e70e-4213-9257-f7dd8c36a8c1','\"Items\"'),('meta.__names__.a96a970f-c491-425f-b402-25ce2b451181','\"Categories\"'),('meta.__names__.a98f3176-e215-4b47-acff-001465fdfc8a','\"ItemImage\"'),('meta.__names__.bc3e1997-f1fb-409f-b75d-c1089e3365a1','\"Categories\"'),('meta.__names__.cb7139fb-d6e2-4529-9781-80b3fc31c7f7','\"User\"'),('meta.__names__.d3635528-b99a-4945-85a7-304b466fd1e3','\"Price\"'),('meta.__names__.fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb','\"Items\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.defaultPlacement','\"end\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.enableVersioning','true'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.entryTypes.0','\"fba44cc8-9a61-40bc-ad3e-a7eb278bbcdb\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.handle','\"items\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.maxAuthors','1'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.name','\"Items\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.propagationMethod','\"all\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.enabledByDefault','true'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.hasUrls','true'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.template','\"items/_entry.twig\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.uriFormat','\"items/{slug}\"'),('sections.a34954f8-ee15-4413-af04-d685e95a0c6e.type','\"channel\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.defaultPlacement','\"end\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.enableVersioning','true'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.entryTypes.0','\"a96a970f-c491-425f-b402-25ce2b451181\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.handle','\"categories\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.maxAuthors','1'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.name','\"Categories\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.propagationMethod','\"all\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.enabledByDefault','true'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.hasUrls','true'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.template','\"categories/_entry.twig\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.siteSettings.264cfef0-2d06-4198-ab33-71f3b0f593bc.uriFormat','\"categories/{slug}\"'),('sections.bc3e1997-f1fb-409f-b75d-c1089e3365a1.type','\"channel\"'),('siteGroups.4a8c4327-102a-43c3-ab0e-c527e5095c2b.name','\"craft-eindproject\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.handle','\"default\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.hasUrls','true'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.language','\"en-US\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.name','\"craft-eindproject\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.primary','true'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.siteGroup','\"4a8c4327-102a-43c3-ab0e-c527e5095c2b\"'),('sites.264cfef0-2d06-4198-ab33-71f3b0f593bc.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"craft-eindproject\"'),('system.schemaVersion','\"5.3.0.2\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.altTranslationKeyFormat','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.altTranslationMethod','\"none\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elementCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.autocapitalize','true'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.autocomplete','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.autocorrect','true'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.class','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.dateAdded','\"2024-11-12T13:03:14+00:00\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.disabled','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.elementCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.id','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.includeInCards','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.inputType','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.instructions','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.label','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.max','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.min','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.name','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.orientation','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.placeholder','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.providesThumbs','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.readonly','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.requirable','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.size','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.step','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.tip','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.title','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.uid','\"9754ad56-208a-4aed-a1ac-7dbb4a778207\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.userCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.warning','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.0.width','100'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.attribute','\"alt\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.class','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.cols','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.dateAdded','\"2024-11-12T13:04:49+00:00\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.disabled','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.elementCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.id','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.includeInCards','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.instructions','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.label','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.name','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.orientation','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.placeholder','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.providesThumbs','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.readonly','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.requirable','true'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.required','false'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.rows','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.tip','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.title','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.uid','\"18884f03-afb1-4042-9efc-1ee3cc8dd14d\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.userCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.warning','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.elements.1.width','100'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.name','\"Content\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.uid','\"927cce61-d15c-43de-9fb7-4965a938ca10\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fieldLayouts.e8556bb8-0259-41e2-a205-d56b9d266fc0.tabs.0.userCondition','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.fs','\"images\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.handle','\"users\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.name','\"Users\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.sortOrder','2'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.subpath','\"users\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.titleTranslationKeyFormat','null'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.titleTranslationMethod','\"site\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.transformFs','\"\"'),('volumes.a4146483-3976-438d-bb82-920e02ad5ed3.transformSubpath','\"\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.altTranslationKeyFormat','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.altTranslationMethod','\"none\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elementCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.autocapitalize','true'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.autocomplete','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.autocorrect','true'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.class','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.dateAdded','\"2024-11-12T11:44:30+00:00\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.disabled','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.elementCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.id','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.includeInCards','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.inputType','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.instructions','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.label','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.max','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.min','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.name','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.orientation','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.placeholder','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.providesThumbs','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.readonly','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.requirable','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.size','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.step','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.tip','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.title','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.uid','\"10feb8c6-82a3-4884-a9bc-2d0db6909d48\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.userCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.warning','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.0.width','100'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.attribute','\"alt\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.class','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.cols','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.dateAdded','\"2024-11-12T11:52:54+00:00\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.disabled','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.elementCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.id','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.includeInCards','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.instructions','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.label','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.name','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.orientation','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.placeholder','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.providesThumbs','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.readonly','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.requirable','true'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.required','false'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.rows','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.tip','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.title','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.uid','\"e39a74a8-e8c2-48e0-98fb-8524e6bb6cdd\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.userCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.warning','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.elements.1.width','100'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.name','\"Content\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.uid','\"e06eca56-a5a5-4271-b9ae-d7b7fae0f217\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fieldLayouts.e934184a-dc02-4728-aecc-cb9e39f265ef.tabs.0.userCondition','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.fs','\"images\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.handle','\"items\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.name','\"Items\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.sortOrder','1'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.subpath','\"items\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.titleTranslationKeyFormat','null'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.titleTranslationMethod','\"site\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.transformFs','\"\"'),('volumes.a6581f07-e70e-4213-9257-f7dd8c36a8c1.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,9,4,NULL,6,1,'2024-11-12 08:42:06','2024-11-12 08:42:06','6b65b042-652d-4b81-831d-6859244692ad'),(4,9,4,NULL,8,2,'2024-11-12 08:42:06','2024-11-12 08:42:06','98b40216-4eef-489d-be37-167a0c7009a6'),(5,9,15,NULL,6,1,'2024-11-12 08:42:06','2024-11-12 08:42:06','e2fc4957-6d4a-47c9-81a6-48bc1149a741'),(6,9,15,NULL,8,2,'2024-11-12 08:42:06','2024-11-12 08:42:06','1551baf8-816c-4f8f-950f-0d5910c6bb53'),(9,9,2,NULL,6,1,'2024-11-12 08:42:16','2024-11-12 08:42:16','54f7d14b-62a3-4a41-b01b-5516efd53fea'),(10,9,2,NULL,10,2,'2024-11-12 08:42:16','2024-11-12 08:42:16','1785f382-0fa1-43ff-8b0d-4fe990ff2eb2'),(11,9,17,NULL,6,1,'2024-11-12 08:42:16','2024-11-12 08:42:16','2d172dab-9a34-4487-971f-b231b5cd026c'),(12,9,17,NULL,10,2,'2024-11-12 08:42:16','2024-11-12 08:42:16','9e168972-66f7-48de-bbfc-c3eab7dbac09'),(17,9,20,NULL,6,1,'2024-11-12 11:50:57','2024-11-12 11:50:57','4d37f62d-7b5f-4d70-8e8a-f4aec07683f7'),(18,9,20,NULL,8,2,'2024-11-12 11:50:57','2024-11-12 11:50:57','e1063a46-e095-4228-88d5-4a5dacde8fd2'),(19,10,20,NULL,18,1,'2024-11-12 11:50:57','2024-11-12 11:50:57','22e28f1e-e36a-405c-b62f-cc998b026cd8'),(24,9,23,NULL,6,1,'2024-11-12 11:51:07','2024-11-12 11:51:07','def7c47c-2a84-4aca-8374-1eba22884939'),(25,9,23,NULL,10,2,'2024-11-12 11:51:07','2024-11-12 11:51:07','63fdd9ac-8909-4cb3-b1a9-d305b9aa9f8c'),(26,10,23,NULL,21,1,'2024-11-12 11:51:07','2024-11-12 11:51:07','5bac8f46-c341-4af3-950a-4a7a6cb363a0'),(31,10,4,NULL,24,1,'2024-11-12 12:39:36','2024-11-12 12:39:36','c98f8f25-fd8a-463a-ba59-52b89eef509a'),(32,9,26,NULL,6,1,'2024-11-12 12:39:36','2024-11-12 12:39:36','8b3cc172-7971-492d-8abc-eb7d3381dd3a'),(33,9,26,NULL,8,2,'2024-11-12 12:39:36','2024-11-12 12:39:36','e7aad08f-944e-49fc-bf9e-3718f0bdf4f6'),(34,10,26,NULL,24,1,'2024-11-12 12:39:36','2024-11-12 12:39:36','9824d555-1601-4d98-bb60-0d4d8c7a80f4'),(39,10,2,NULL,27,1,'2024-11-12 12:39:45','2024-11-12 12:39:45','931948e1-bb01-45f8-8db3-b0dd211fe1da'),(40,9,29,NULL,6,1,'2024-11-12 12:39:45','2024-11-12 12:39:45','1e2c61cf-a902-4f9f-879d-adfbd2b4a34a'),(41,9,29,NULL,10,2,'2024-11-12 12:39:45','2024-11-12 12:39:45','4211f502-49a5-472b-a7b4-bdaff3868de1'),(42,10,29,NULL,27,1,'2024-11-12 12:39:45','2024-11-12 12:39:45','30e90c01-04d3-4ad6-bd9d-8e04ff248066'),(43,9,30,NULL,6,1,'2024-11-12 12:39:52','2024-11-12 12:39:52','9554f784-58e5-4bcf-8a22-424152f95313'),(44,9,30,NULL,10,2,'2024-11-12 12:39:52','2024-11-12 12:39:52','84931207-1b8b-459c-9295-cc10739c7cf0'),(45,10,30,NULL,27,1,'2024-11-12 12:39:52','2024-11-12 12:39:52','594f07c3-32fa-4258-8c81-393efe34a87b'),(49,9,37,NULL,6,1,'2024-11-12 13:21:30','2024-11-12 13:21:30','9f923a3a-9448-4113-a2b5-1942d73df60b'),(50,9,37,NULL,8,2,'2024-11-12 13:21:30','2024-11-12 13:21:30','4e401fc1-e315-4593-bee7-fb1c2b64b088'),(51,10,37,NULL,24,1,'2024-11-12 13:21:30','2024-11-12 13:21:30','9fd96bbe-2967-4db0-892f-a5ced58f88ca'),(55,9,39,NULL,6,1,'2024-11-12 13:21:36','2024-11-12 13:21:36','968e485d-9f37-464b-8a87-03207da22010'),(56,9,39,NULL,10,2,'2024-11-12 13:21:36','2024-11-12 13:21:36','3efc4e98-3c5b-4fb8-95d5-f696a51c6506'),(57,10,39,NULL,27,1,'2024-11-12 13:21:36','2024-11-12 13:21:36','9dbd1a51-a577-4a61-9a42-452af1d42c0a'),(58,9,40,NULL,8,1,'2024-11-12 13:55:51','2024-11-12 13:55:51','c6bf850a-eb39-4ec6-82ef-10ff0763c99f'),(59,9,41,NULL,8,1,'2024-11-12 13:56:12','2024-11-12 13:56:12','3603c3aa-17f1-4129-a726-aeda71ce3959'),(62,10,40,NULL,42,1,'2024-11-12 14:59:24','2024-11-12 14:59:24','0e4926b1-9d0f-405f-a5e7-2045152631f9'),(63,9,44,NULL,8,1,'2024-11-12 14:59:24','2024-11-12 14:59:24','a7ab8da6-aefc-4756-840f-93468651a425'),(64,10,44,NULL,42,1,'2024-11-12 14:59:24','2024-11-12 14:59:24','6489766f-cbc8-4ec1-b463-55d6e533ef4d'),(65,9,45,NULL,8,1,'2024-11-12 15:11:55','2024-11-12 15:11:55','bf86c75c-4d33-4af2-baa9-ec536fcf371d'),(66,10,45,NULL,46,1,'2024-11-12 15:13:05','2024-11-12 15:13:05','d03e4480-1159-4435-8a88-6cf3217ecf21'),(67,9,47,NULL,8,1,'2024-11-12 15:13:06','2024-11-12 15:13:06','44eca93a-5d34-46ea-a75d-f8ad0691f247'),(68,10,47,NULL,46,1,'2024-11-12 15:13:06','2024-11-12 15:13:06','a9664133-d7ba-4fd3-9f94-914065ca410b'),(69,9,48,NULL,12,1,'2024-11-12 15:13:33','2024-11-12 15:13:33','fc07fbd2-a8dd-4631-a6bf-ae35858a422a'),(70,9,48,NULL,6,2,'2024-11-12 15:13:33','2024-11-12 15:13:33','327c7576-503d-4991-a808-d01c88207fe7'),(71,9,49,NULL,12,1,'2024-11-12 15:13:45','2024-11-12 15:13:45','74817707-7594-48a5-bb4e-45a9ebb66fc2'),(72,9,49,NULL,6,2,'2024-11-12 15:13:45','2024-11-12 15:13:45','5924761b-fc2f-4c81-9c12-625c49357191'),(76,10,48,NULL,50,1,'2024-11-12 15:16:56','2024-11-12 15:16:56','b962be06-c1a9-42d3-b890-ad0ce9814eea'),(77,9,52,NULL,12,1,'2024-11-12 15:16:56','2024-11-12 15:16:56','06dfe6c0-7197-421f-be97-4874141da221'),(78,9,52,NULL,6,2,'2024-11-12 15:16:56','2024-11-12 15:16:56','f406ee47-8924-4e3d-aa8b-c3c81946e9c6'),(79,10,52,NULL,50,1,'2024-11-12 15:16:56','2024-11-12 15:16:56','07e3c367-0847-48a9-ac60-2537d2d10eb5');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,4,1,1,''),(3,6,1,1,''),(4,8,1,1,''),(5,10,1,1,''),(6,12,1,1,''),(7,4,1,2,'Applied “Draft 1”'),(8,2,1,2,'Applied “Draft 1”'),(9,4,1,3,'Applied “Draft 1”'),(10,2,1,3,'Applied “Draft 1”'),(11,4,1,4,'Applied “Draft 1”'),(12,2,1,4,'Applied “Draft 1”'),(13,2,1,5,''),(14,31,1,1,''),(15,31,1,2,'Applied “Draft 1”'),(16,4,1,5,'Applied “Draft 1”'),(17,2,1,6,'Applied “Draft 1”'),(18,40,1,1,''),(19,40,1,2,'Applied “Draft 1”'),(20,45,1,1,''),(21,48,1,1,''),(22,48,1,2,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' cwillems1903 gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' book '),(2,'title',0,1,' book '),(4,'slug',0,1,' drill '),(4,'title',0,1,' drill '),(6,'slug',0,1,' household '),(6,'title',0,1,' household '),(8,'slug',0,1,' technology '),(8,'title',0,1,' technology '),(10,'slug',0,1,' books '),(10,'title',0,1,' books '),(12,'slug',0,1,' garden '),(12,'title',0,1,' garden '),(18,'alt',0,1,' this is an image of a drill '),(18,'extension',0,1,' jpg '),(18,'filename',0,1,' drill jpg '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' drill '),(21,'alt',0,1,' this is an image of a book '),(21,'extension',0,1,' jpg '),(21,'filename',0,1,' book jpg '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' book '),(24,'alt',0,1,''),(24,'extension',0,1,' jpg '),(24,'filename',0,1,' drill jpg '),(24,'kind',0,1,' image '),(24,'slug',0,1,''),(24,'title',0,1,' drill '),(27,'alt',0,1,''),(27,'extension',0,1,' jpg '),(27,'filename',0,1,' book jpg '),(27,'kind',0,1,' image '),(27,'slug',0,1,''),(27,'title',0,1,' book '),(31,'slug',0,1,' user '),(31,'title',0,1,' user '),(35,'slug',0,1,' temp kqdapuhmiaaczzubsfyzuwoznkrbtppeeiat '),(35,'title',0,1,''),(40,'slug',0,1,' ps5 '),(40,'title',0,1,' ps5 '),(42,'alt',0,1,''),(42,'extension',0,1,' jpg '),(42,'filename',0,1,' ps5 jpg '),(42,'kind',0,1,' image '),(42,'slug',0,1,''),(42,'title',0,1,' ps5 '),(45,'slug',0,1,' xbox '),(45,'title',0,1,' xbox '),(46,'alt',0,1,''),(46,'extension',0,1,' jpg '),(46,'filename',0,1,' xbox jpg '),(46,'kind',0,1,' image '),(46,'slug',0,1,''),(46,'title',0,1,' xbox '),(48,'slug',0,1,' shovle '),(48,'title',0,1,' shovle '),(50,'alt',0,1,''),(50,'extension',0,1,' jpg '),(50,'filename',0,1,' shovle jpg '),(50,'kind',0,1,' image '),(50,'slug',0,1,''),(50,'title',0,1,' shovle ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Products','products','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-11 19:18:21','2024-11-11 19:18:21','2024-11-12 08:07:28','b510f7c9-2e2e-46f6-b40d-9403fda0dfe4'),(2,NULL,'Brands','brands','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-11 19:20:29','2024-11-11 19:20:29','2024-11-12 08:07:26','6eb6179b-52ab-41b0-b123-d5e425acec02'),(3,NULL,'Items','items','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-12 08:19:49','2024-11-12 08:19:49',NULL,'a34954f8-ee15-4413-af04-d685e95a0c6e'),(4,NULL,'Categories','categories','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-12 08:35:52','2024-11-12 08:35:52',NULL,'bc3e1997-f1fb-409f-b75d-c1089e3365a1'),(5,NULL,'Users','users','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-12 13:01:59','2024-11-12 13:01:59','2024-11-12 13:19:52','757bef3d-04f8-4818-978e-8a25567480b0');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1),(2,2,1),(3,4,1),(4,5,1),(5,6,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'products/{slug}','products/_entry.twig',1,'2024-11-11 19:18:21','2024-11-11 19:18:21','2a42de6e-449e-41b0-999d-df38c814af01'),(2,2,1,1,'brands/{slug}','brands/_entry.twig',1,'2024-11-11 19:20:29','2024-11-11 19:20:29','336e1559-efcf-4bfb-8e4c-416fa3e307d3'),(3,3,1,1,'items/{slug}','items/_entry.twig',1,'2024-11-12 08:19:49','2024-11-12 08:19:49','53ab65ef-3c79-4e2b-96da-3a32f3b3d3bb'),(4,4,1,1,'categories/{slug}','categories/_entry.twig',1,'2024-11-12 08:35:52','2024-11-12 08:35:52','9ee95e4b-011f-4599-a992-67674ee12bb0'),(5,5,1,1,'users/{slug}','users/_entry.twig',1,'2024-11-12 13:01:59','2024-11-12 13:01:59','76a3f275-3d47-4cd3-8310-05d5052a5e3c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'craft-eindproject','2024-11-11 17:58:47','2024-11-11 17:58:47',NULL,'4a8c4327-102a-43c3-ab0e-c527e5095c2b');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','craft-eindproject','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-11-11 17:58:47','2024-11-11 17:58:47',NULL,'264cfef0-2d06-4198-ab33-71f3b0f593bc');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'cwillems1903@gmail.com','$2y$13$mNhTs2qzNcMJxUhqtZ3Lje22wyEQJiIdPLd/Mevjec7yqB2MsTg0G','2024-11-12 15:52:15',NULL,NULL,NULL,'2024-11-12 15:51:43',NULL,1,NULL,NULL,NULL,0,'2024-11-12 15:52:03','2024-11-11 17:58:48','2024-11-12 15:52:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Items',NULL,'2024-11-12 11:46:42','2024-11-12 11:52:54','8f96c911-eb69-4a10-a40b-136f4f82107d'),(2,NULL,NULL,'Temporary Uploads',NULL,'2024-11-12 11:48:11','2024-11-12 11:48:11','0e7ac077-cc7c-4bbb-93ef-24b06baaf30b'),(3,2,NULL,'user_1','user_1/','2024-11-12 11:48:11','2024-11-12 11:48:11','da5df970-8435-45c5-af69-d091f7351dc2'),(4,NULL,2,'Users','','2024-11-12 13:04:49','2024-11-12 13:04:49','6d2347b4-058e-45b7-a2d6-0f7595e4c65d');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,6,'Items','items','images','items','','','site',NULL,'none',NULL,1,'2024-11-12 11:46:42','2024-11-12 12:38:53',NULL,'a6581f07-e70e-4213-9257-f7dd8c36a8c1'),(2,8,'Users','users','images','users','','','site',NULL,'none',NULL,2,'2024-11-12 13:04:49','2024-11-12 13:04:49',NULL,'a4146483-3976-438d-bb82-920e02ad5ed3');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-11-11 18:00:50','2024-11-11 18:00:50','83482144-d45f-49f6-8087-6e463ddbd378'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-11-11 18:00:50','2024-11-11 18:00:50','9e2e8337-6760-48bd-895a-edab984b0bd9'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-11-11 18:00:50','2024-11-11 18:00:50','aaeb4832-b7c0-4af7-8c99-4041ff536eea'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-11-11 18:00:50','2024-11-11 18:00:50','93029ee2-349b-41d3-8f12-f091e228a13e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 15:53:14
