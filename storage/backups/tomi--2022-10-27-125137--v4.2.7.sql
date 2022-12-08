-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
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
  KEY `fk_ngkmyumhvbrbqohrpqqlrgqbzpswhvcuypot` (`ownerId`),
  CONSTRAINT `fk_ngkmyumhvbrbqohrpqqlrgqbzpswhvcuypot` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qafitosdqhyifjjosmgbjyolxgdqofgvpjti` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rrdbibhlcasinfspsqnyfmlwbosxztnirpbn` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_vteitskxryvwnnlgnaptcwasunsslntkvqkd` (`dateRead`),
  KEY `fk_apkoijyvzhxhsgmugqqnbxauhoykdduhsqwr` (`pluginId`),
  CONSTRAINT `fk_apkoijyvzhxhsgmugqqnbxauhoykdduhsqwr` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hnncfjvnzamitgdvuoblbtedadkjgwtfznmv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mmeeycqmlxxtqjgdxerlnidjnjelmdkzccux` (`sessionId`,`volumeId`),
  KEY `idx_ggozwxfggjfvkyyvlvxzfiikbfjtrhtwrdjd` (`volumeId`),
  CONSTRAINT `fk_dnoovuluearfaeulukyuhxplkakmhsksjvbd` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yhnqtyrtfmyrlzhduyukitytloavzegqzhtt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gkrexatndvztoehdvmjlhtpvymeffnalykrx` (`filename`,`folderId`),
  KEY `idx_pukmbuxfgewuhbkssyjagjquhyzfgauldmmv` (`folderId`),
  KEY `idx_tgbxnyvuhqshlyfyporjdnrvasbapgaswqge` (`volumeId`),
  KEY `fk_zdtlqjazatwuuxyrtxbcemqkqoncwqrydwur` (`uploaderId`),
  CONSTRAINT `fk_baviowwlbqzqeecmuoxtxyfzjeungklpxdjm` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sahhbawbseobgxqfuknkmkcqtrlnatdgcmww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_twugcaekndirzhhcnikapzlqkqyxmqunbuxz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdtlqjazatwuuxyrtxbcemqkqoncwqrydwur` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_caches`
--

DROP TABLE IF EXISTS `blitz_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `paginate` int(11) DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xiguozrqzeewktzvekpobvratlhekydnbspg` (`siteId`,`uri`),
  KEY `idx_oqozqpmqhyfmljnvuyodjwjqteiqaoalhqjc` (`expiryDate`),
  CONSTRAINT `fk_mksdvfxacohrnxcvchzzlyawatrrrseglvxk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_cachetags`
--

DROP TABLE IF EXISTS `blitz_cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_cachetags` (
  `cacheId` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`cacheId`,`tag`),
  KEY `idx_qpaxicexhbhstlghrepaobjmwhgsyeyfnbzt` (`tag`),
  CONSTRAINT `fk_miiuafjfkgxrtecqhvcfncwvlpgffxnpniex` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_driverdata`
--

DROP TABLE IF EXISTS `blitz_driverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_driverdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) NOT NULL,
  `data` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementcaches`
--

DROP TABLE IF EXISTS `blitz_elementcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementcaches` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`elementId`),
  KEY `fk_izkhidesuwjddpmnjjsegqwpxcrshxrlfndr` (`elementId`),
  CONSTRAINT `fk_izkhidesuwjddpmnjjsegqwpxcrshxrlfndr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qqshizjtyrclcexuxykpfjmkgnqjmneuktvv` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementexpirydates`
--

DROP TABLE IF EXISTS `blitz_elementexpirydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementexpirydates` (
  `elementId` int(11) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`),
  UNIQUE KEY `idx_lquhmzmxfhcgzwlzksgvausnrczepoijykkc` (`elementId`),
  KEY `idx_mrwphufnpfughzdxdrnddlmbldvbgvqvymdi` (`expiryDate`),
  CONSTRAINT `fk_rbgqjkeodoxkdmecnmoqgttcaopxvycvmqvv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueries`
--

DROP TABLE IF EXISTS `blitz_elementqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementqueries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lbaottxsvlsosbeytvlrqscyeryshlozdpry` (`index`),
  KEY `idx_usnwdranfnjzjtbjtuxcdgmiqqrtjezlkxql` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerycaches`
--

DROP TABLE IF EXISTS `blitz_elementquerycaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementquerycaches` (
  `cacheId` int(11) NOT NULL,
  `queryId` int(11) NOT NULL,
  PRIMARY KEY (`cacheId`,`queryId`),
  UNIQUE KEY `idx_ogcwfkuzqtfnndjmvdbztpacbnaplgujimyk` (`cacheId`,`queryId`),
  KEY `fk_uypjvycdphsdbxoradapxjbaplofhimjvwjf` (`queryId`),
  CONSTRAINT `fk_uypjvycdphsdbxoradapxjbaplofhimjvwjf` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xdjoswsqyskkwlxdkypjyefkvhsfsxpdhfdc` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerysources`
--

DROP TABLE IF EXISTS `blitz_elementquerysources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_elementquerysources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `queryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dufujafbsxcwtvvfolivtodsmeaxdbnfjoop` (`sourceId`,`queryId`),
  KEY `fk_vsarzrxqmwttxnsugejdtzydpkscdqivaxqt` (`queryId`),
  CONSTRAINT `fk_vsarzrxqmwttxnsugejdtzydpkscdqivaxqt` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_hints`
--

DROP TABLE IF EXISTS `blitz_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blitz_hints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `routeVariable` varchar(255) NOT NULL,
  `line` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mxzhlsgouelmjtylwpgxciewlxyovoyqctyx` (`fieldId`,`template`,`routeVariable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uagwseofinutdwugbnounlksnnfsfwbbznfb` (`groupId`),
  KEY `fk_pfzxqyaokrmwlihydevjygejbmarjbmamptz` (`parentId`),
  CONSTRAINT `fk_gxgffmmvqkbrgczhpnzsvmbbzzzpkkqcfoig` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pfzxqyaokrmwlihydevjygejbmarjbmamptz` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sjlkawrzyqswolyrzhypgolleciqijtsrqvq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_urilkjlwwccojcgbbefwrcvqnzxjipklpczq` (`name`),
  KEY `idx_afyotmglapmsjdhwtkzmolikhxmaxycoxqlm` (`handle`),
  KEY `idx_tkzduuavimvacdesnhkdbvrnczuabdfedgsm` (`structureId`),
  KEY `idx_czjcrczcvzwpgslajskvhuzdlkmsnndrqhkb` (`fieldLayoutId`),
  KEY `idx_vyzsumfseyrklvbuunarnghzjhfhjzwdhddb` (`dateDeleted`),
  CONSTRAINT `fk_awydjglmhzlwcfnmsvvadncxmosfdzsrumad` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_skhnljpawfhfsmzrsvjzlvesgxobrqaztakb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbhxwsiucuuhfdhrmigfspsmugybjgwhyrmm` (`groupId`,`siteId`),
  KEY `idx_aqcrsylfqeyyfzmphruknrqmgwkzrhrjjzuz` (`siteId`),
  CONSTRAINT `fk_leeuurwchtiozmwdphplqgibvhoyhcssbxsg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_plfejqjumhsdbaarjxledwrxpvlkwignylxx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ukwyfiimwdgnghelsvbnukdxhmigcavmehlk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cmfoguuiydyyquncihqmznearwdfqwpcrspk` (`siteId`),
  KEY `fk_pdffddmeqiushvwmkvrnikirfbyvqzwicnkw` (`userId`),
  CONSTRAINT `fk_cmfoguuiydyyquncihqmznearwdfqwpcrspk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cyxemkptbgdhdzpvxfitfvnkingjexpiuvbp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pdffddmeqiushvwmkvrnikirfbyvqzwicnkw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_kxylvsyhxljcerbgdtpavqcjelcjicpwtgda` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_kckuyouemyxiatlbgnacrwrywrguweszxrni` (`siteId`),
  KEY `fk_ueppgctmmmxxmuglwirklqqfjodtphumhzok` (`fieldId`),
  KEY `fk_rfkgkmosztbowhbjupgezregkjguhppqzxmg` (`userId`),
  CONSTRAINT `fk_kckuyouemyxiatlbgnacrwrywrguweszxrni` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rfkgkmosztbowhbjupgezregkjguhppqzxmg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_txeaobsyuqcolyshjfojrzbqplljnspcryih` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ueppgctmmmxxmuglwirklqqfjodtphumhzok` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lcovkwlmtyfjfnbpxqshrpaynxhaixuffzxj` (`elementId`,`siteId`),
  KEY `idx_yecbwtdlcmnbbscddhwwleuwodlubcqpannv` (`siteId`),
  KEY `idx_nlqmvkdilckvjxqtbveeuomgfrslfkxkfzdt` (`title`),
  CONSTRAINT `fk_qufcubjkcbtpxzdluekbqxkqdfxfdtgobylo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zlwjpqcrtxvzurqjpehcrypftotzgnkpxsfe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dkfevcxprvtvlyajfhlmfdxajiajgllggukm` (`userId`),
  CONSTRAINT `fk_dkfevcxprvtvlyajfhlmfdxajiajgllggukm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tijakaaqenwixfkvypmqeryaqkbsnrgqshwb` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_uzzcrucjaejdfrjygxqxzntcryabgdquoezg` (`creatorId`,`provisional`),
  KEY `idx_qqashqcoajlygycgfttzjjekkqeejttlzfjf` (`saved`),
  KEY `fk_wnluffjrqnomtdqeueseusjylxxvmnotmuir` (`canonicalId`),
  CONSTRAINT `fk_mbixfaocsqlskwrsffjddpxrxvmtdyjjzxcu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wnluffjrqnomtdqeueseusjylxxvmnotmuir` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jgjknfvfbsjdqucqmzjdwqvcjeuccmxzpfdq` (`dateDeleted`),
  KEY `idx_ivtoysusawtrlmzlzwyjxxljdlwfiygvczzl` (`fieldLayoutId`),
  KEY `idx_ennfhkoynenglhfhpmbqnkgqwxeqejzojdhx` (`type`),
  KEY `idx_ckdswpvnlvteaztfxmwwxvebylbkxnfnkstm` (`enabled`),
  KEY `idx_qqugwviklnbgkftbgagpjyioqkvgiepkhmqk` (`archived`,`dateCreated`),
  KEY `idx_cgryijiqvbsoxfmapfkpjjcuwccviwglmtup` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_dxrcwnmwmsqfklwieaclwkopkyhrejvhymtl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_ntctemglwttwdndckmidiqgglgwvshifqypv` (`canonicalId`),
  KEY `fk_zhjwypvisanbfrhnsuaxwrlmlqbhmxzudnzx` (`draftId`),
  KEY `fk_ijkpfyvljewrbkidrdmveibveigpjqkofysy` (`revisionId`),
  CONSTRAINT `fk_ijkpfyvljewrbkidrdmveibveigpjqkofysy` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntctemglwttwdndckmidiqgglgwvshifqypv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qsibgrtiblkfibvchwdaakallkyrfbsrruum` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zhjwypvisanbfrhnsuaxwrlmlqbhmxzudnzx` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlanvdnojxddaccsucpvhbhukrunvnzorhbx` (`elementId`,`siteId`),
  KEY `idx_qpoggnwvmvdhntprinlhzxzephzivfdcgyqb` (`siteId`),
  KEY `idx_zmokqkvitiszzwbgwjstvzgcyvlngdlzqkwj` (`slug`,`siteId`),
  KEY `idx_pllhdbywvdmbquoxerexhymkjgiknajwtbrb` (`enabled`),
  KEY `idx_gcdgyvruuxvcwotshurclkwitcspwbpuvboj` (`uri`,`siteId`),
  CONSTRAINT `fk_dduxsudpmyzfwfqribqgsdwbofkggfaxajab` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwrczubibgbrdhhmptegwgefbwobwvxwdxac` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wvomqbozrcunnkrfdlebbrpbpaoyrtvsugxk` (`postDate`),
  KEY `idx_dqwufcuwijwhtnvaeulckhmghzfqzcsrqhaa` (`expiryDate`),
  KEY `idx_kxpatmlczvclmsbwpylcxephzcntnpdzmzou` (`authorId`),
  KEY `idx_oeedydjcmqeczrwijbcfncvaaeklucbgzyql` (`sectionId`),
  KEY `idx_clygbcragzikchzstbumhyexjxvvdjoexxbd` (`typeId`),
  KEY `fk_wvwqjftjmjxhdctpelxdwziibdmluutkguca` (`parentId`),
  CONSTRAINT `fk_bqkcvsrdpacjgtktzkjooegmkjjgdftsoolb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntqqtxpawydtqtzoyrbmmtmpbjswgkgidyng` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_toysyqallrussmqqxkhueuykzxecdxdztzgy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wvwqjftjmjxhdctpelxdwziibdmluutkguca` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yknmilipjtqhqqvshwqaeuqbvilopalgknmf` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ouyqwtgsbihridpvzfdsnnhlmibhzzqdctoj` (`name`,`sectionId`),
  KEY `idx_zfjcodchyvtysbeztyvotbfmhpuxzhrexgsq` (`handle`,`sectionId`),
  KEY `idx_ekcgmuattrvaedxbinskandypthblmplmrfw` (`sectionId`),
  KEY `idx_xuilkssluvypqbnkxhaakkariukxwobnufwy` (`fieldLayoutId`),
  KEY `idx_nzszlxrivhecudcjruwcmuhzmwnqyydszbim` (`dateDeleted`),
  CONSTRAINT `fk_mzvmyfarluhdkkafuklyefakmpemvayvpnsx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zpgsoduhkrzkhgpgszcuyknwzjdflgbnzgma` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bnfpnbqsblbucvfaytasytkqhxonvvgvjdjg` (`name`),
  KEY `idx_vlgyuvzwtuasjdfjdhlhytatjydayfvqsnnn` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xdfdrffxkjffvyxmvlywflompygnmnbjlecs` (`layoutId`,`fieldId`),
  KEY `idx_yjjesqgtjzdlbxccbkmkamsgkqubsusczwum` (`sortOrder`),
  KEY `idx_enxmerjmyafhywwdgzraioahwnohtswtkuem` (`tabId`),
  KEY `idx_lxbjuryfcgkqisrljckhswwdxuxzieuplhpg` (`fieldId`),
  CONSTRAINT `fk_gozlexvcdrkrsglpfqksnzfuzqunsxbiwgbf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kgevuakcupxgapabehmyizqtnoxnaxmvejli` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ostnqnwubjplxrpowgnooqveytgoyivnqzks` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tubbyfptzmineftcofsekfvvgcnlenqhhnoh` (`dateDeleted`),
  KEY `idx_eyovvtexmrhqwazdagpvzyaviebiucqvzggo` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wztpuiymwdgvxgtnrresgiyydeimzmgsnkwe` (`sortOrder`),
  KEY `idx_hikgvcvqcvfamvtdjzktufocqkaryufanajg` (`layoutId`),
  CONSTRAINT `fk_sstoqycooqjxuqtesdpfkimgipjvwrepkzjf` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unzwowaqdsnumfriowretxosjdkimottrhfg` (`handle`,`context`),
  KEY `idx_wphyvlodwourstbujwvuyklazeklyfwvyzzx` (`groupId`),
  KEY `idx_ybhugcdyvcmqgxipkeyxtsfqyatisjyhbyvs` (`context`),
  CONSTRAINT `fk_oruhjjpnumwajywhppxsdrhbhkygutmguixu` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_awiyxhmcgmaehffbkjxhkpflaqbhajdavjoq` (`name`),
  KEY `idx_brcqfcrzggelekfobkxvkdzrmryfaroxdunu` (`handle`),
  KEY `idx_jjyvlutwruiqwhrjtwjhszltidunbozmmghj` (`fieldLayoutId`),
  KEY `idx_fsjrfibcfuejzvgguavnphqprdujowyjmwqk` (`sortOrder`),
  CONSTRAINT `fk_jxmhardkhcazhjbyrywkipjihkumukiclciu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vuyfxydknqfmawfpswtsspvocjgzknjkgqob` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zxfltfiiuleqjrhkohpqgvbnfjvwqbvsnyxv` (`accessToken`),
  UNIQUE KEY `idx_woqitlsnqasyadnftpjvhdkojssmzusgrxzx` (`name`),
  KEY `fk_lnbmclzsxzzptzdwlnppjsstvlyjikyuedga` (`schemaId`),
  CONSTRAINT `fk_lnbmclzsxzzptzdwlnppjsstvlyjikyuedga` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
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
  KEY `idx_oeyvbhjmmviwvmcrqjyyycmstykhiztkbgus` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rbdzqliysylhvdmwrlawgzejpurezzpbusbg` (`name`),
  KEY `idx_ijcfawbpfqbarwqtilkqqbivgmutljkmaypl` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_azjvnccehfzaanrjvvebbcrzjzeqqtqmyzea` (`primaryOwnerId`),
  KEY `idx_hnweufcdwxwvfeaonysocaifvbsuqxiahslw` (`fieldId`),
  KEY `idx_vtygekftkhjkdxacajlgqirayhylmmbmwvew` (`typeId`),
  CONSTRAINT `fk_gksmdcopjfsohrqrhjknpsgpmtbolmlmuhxu` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mbmrmmzpumxapeexlzmkjswzwvdnjtxyqqcd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pagdymyvexkavdvcrgaclmnbdkkeeeypjoxo` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prymwnyzhirsnzzxvwaxlifagacbjhjyiekv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_lxamhxehimemcjemhbaweozagsqjgnhujyro` (`ownerId`),
  CONSTRAINT `fk_kwtczztyjtsgvntfoeswslxqvvjpzzzidfab` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lxamhxehimemcjemhbaweozagsqjgnhujyro` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zuduqbngtrvmeboddfcwjiqbbwevtdbnbtht` (`name`,`fieldId`),
  KEY `idx_iimzjsdszwamqzdyrxuliikokpbngsujrlbf` (`handle`,`fieldId`),
  KEY `idx_xndyoymwugfsoyxgvranivahgiqycgbuzjmy` (`fieldId`),
  KEY `idx_baapipbvymqhsyddjttlkfvzvxaxqhojbojj` (`fieldLayoutId`),
  CONSTRAINT `fk_ncwawvgxcnllovqxneetbjtglqzguiqumood` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_puotlefivkcmpemljdjmjkppubiypxjzgolu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zelqwwiymkaxbmdqyljasbhfxhxzidisrfvx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_agwyxsnpcigcwuwistwhkelywjlunhnkiasa` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_qihvqzsvsnfkfmpitnlxhpjldwdlxckzavaz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zloydpbospjvzgyhvevfpkhxspktqazghmbi` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yyxlgxhlbgrqvrkjcbrzmiylybftqosypxmp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_zvfnpisiljrfifwmawyokrmprcnbdvlickam` (`sourceId`),
  KEY `idx_alkwlohbrvgajwjcbiqkxhnwrwfefqzxliqr` (`targetId`),
  KEY `idx_iyuyvimpwvmkmvhivspabpyfxyiwlvdrxnjq` (`sourceSiteId`),
  CONSTRAINT `fk_dssblprcvwfblhxjwiwyovsyegmlkaioxxsn` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qbmiunpssfnsmyqndjjtyzarmzintbkpsmxi` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhwnkwdolgrkguevhektivqvjwhferxuouif` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zgyuemeshtbeyyfdbzakqzldptpcorhvtkyj` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gparliajxvbgzhejzyjebvbdqkqixbjmfszm` (`canonicalId`,`num`),
  KEY `fk_xvuzpwnzbxtdqvsepigfyodhrygjiigttvyl` (`creatorId`),
  CONSTRAINT `fk_xvuzpwnzbxtdqvsepigfyodhrygjiigttvyl` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zsiokzlcizlmkatxlhkfedclefgidgldttep` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_giogtvmqkghsikvfnfmzhjyqoxlujwygqhju` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bqcrxbgearxcfwolgiscvubhemzmysvywzqb` (`handle`),
  KEY `idx_qdeioekqxxalvmrtnejzcnxeqicfhpupcivj` (`name`),
  KEY `idx_zfmyanwtbwzjhjnyczdnjeohzemefjkbfhbo` (`structureId`),
  KEY `idx_wugylsfyfmkajdvsoknaanrpwmrqeyjgzwtl` (`dateDeleted`),
  CONSTRAINT `fk_owyihresidnhrzflxtpjodzgjzxmafpxvadc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ulzorqeytwqqqvrhvjilyhhkpstlxxinozga` (`sectionId`,`siteId`),
  KEY `idx_ouwfoykorjoqfwpsyfnmzmikuwpsnqrgockz` (`siteId`),
  CONSTRAINT `fk_anzcdsukvlvdroglpdtlgcnqhdsljfafpkhp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oppcirvzwgrqtpybbafjfmldbjnwskcdqfpk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int(11) DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int(11) DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int(11) DEFAULT NULL,
  `sourceAltSiteSettings` text,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text,
  `metaSiteVars` text,
  `metaSitemapVars` text,
  `metaContainers` text,
  `redirectsContainer` text,
  `frontendTemplatesContainer` text,
  `metaBundleSettings` text,
  PRIMARY KEY (`id`),
  KEY `idx_udssgcdejjcnlqtjfzyevtguumtcgrkwrkao` (`sourceBundleType`),
  KEY `idx_cjydjiskukripwefuqanwbwzulzuaphwuzia` (`sourceId`),
  KEY `idx_iwtyuipxujwtcfudhikiwnkbkjuvnoulayfy` (`sourceSiteId`),
  KEY `idx_ymdwklrcpwdjabnesvtfsrweobdyhnnzocpz` (`sourceHandle`),
  CONSTRAINT `fk_lwqrjfjqiemyjbpitqgpqletstriyohfsmaq` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bflrsqmuosryaxgpxtyqkjshcifeuvgaegzs` (`uid`),
  KEY `idx_wygpjrnzcneczlnaoynwvpviddhsxyisuafv` (`token`),
  KEY `idx_xlbqssdfbzvemvvzkrqtrphykhnnftpmbwkm` (`dateUpdated`),
  KEY `idx_jwmtqpkfnzjshyikdqpjizfrtywqlofjzzxk` (`userId`),
  CONSTRAINT `fk_jhlhzavxvmkixjtcbqobgmhqignqlgypoghp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sherlock`
--

DROP TABLE IF EXISTS `sherlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sherlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `highSecurityLevel` tinyint(1) NOT NULL,
  `pass` tinyint(1) NOT NULL,
  `warning` tinyint(1) NOT NULL,
  `results` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tilemubzaizusqimwgatjokkaebuosldkflv` (`siteId`),
  CONSTRAINT `fk_rpfderhlaorvygufgmokkvsmltrrrupkuuum` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jelkpelriuodhedtmbvyokybnjwrnqjeqevf` (`userId`,`message`),
  CONSTRAINT `fk_ixjeippbinyfujdfcxbxneysabgmlarneylm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xfblmpidlmgqpykyqvceuwapanrdrshsvmsk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_huemiydpujuezwltyiapbgitcvzuvtcrvyms` (`dateDeleted`),
  KEY `idx_hgfzkqwginehkiatqojvmdstgupfsjkemvek` (`handle`),
  KEY `idx_fmmqczlxduxopswnxjhpzjxxqalrrstqadko` (`sortOrder`),
  KEY `fk_ddklbkkaprtfytpssrvmezknhvkgbsqqnfby` (`groupId`),
  CONSTRAINT `fk_ddklbkkaprtfytpssrvmezknhvkgbsqqnfby` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uhnwxmbwjpnenwfvqhdcicycccforrwtdxzi` (`structureId`,`elementId`),
  KEY `idx_unufcylqmonwckesphevpzcabhnpnoxkynim` (`root`),
  KEY `idx_bqyvsxqpzbnculnsugyivbzphmdcgriqizvs` (`lft`),
  KEY `idx_ezrdcqegyaicnttfihkpnlxqqyyvjausegop` (`rgt`),
  KEY `idx_strucpkcplukrnpxrxjfuyvvhfwliluwkceb` (`level`),
  KEY `idx_ztdzgvqzofgquaqiiigcvzqgxbcntiinebos` (`elementId`),
  CONSTRAINT `fk_iilqersphknrxomfcwxuqbclfxikjldlffsa` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tofoxswrbtwvfqsrppgxawtujbdtxqheqwoj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_skbcsqsdkmymkbmwttjhdpuexqvnugofnzfg` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submariner`
--

DROP TABLE IF EXISTS `submariner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submariner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `localTemp` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rkkdhxmiyctlqmporvgenpyswignfqztdwxd` (`localTemp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_omykbyztpucoywzigjzlfnogfrqhoksuxcbo` (`key`,`language`),
  KEY `idx_vrwfzohzaoozyuovmynpyrdwazwjktzfmebd` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_haufcwaxffxutkmgababpvgfnypfyopkpknw` (`name`),
  KEY `idx_deaoyjbkmdaabczfynhjlkdpttyjuryxnwkc` (`handle`),
  KEY `idx_rzlikdublvoowwqeqesfzdprlofymupefitr` (`dateDeleted`),
  KEY `fk_qditkagaazvjracwoomikxzmgfrcvfiayjaj` (`fieldLayoutId`),
  CONSTRAINT `fk_qditkagaazvjracwoomikxzmgfrcvfiayjaj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jchubuzrrdkdgtdjjvdgiksxotfkvtshoekk` (`groupId`),
  CONSTRAINT `fk_rxqxtflmtzvumevfccoidkabhjpirzczzlwz` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tilavpmnarxotdxrextzcnxgdhtkivimljvs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lmwtrgttfgnwxzebgjhmidjqhrsagvgyxgnh` (`token`),
  KEY `idx_qmnishdvbovqtlivclqrqjaohnbtahgtiqvw` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vjqomywajsroctdwdxifpujutxcijqmjzflt` (`handle`),
  KEY `idx_lusqpqhepofvuukcjvhrrtjpffusukromdhb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jmpgtbzxdcxzjnygnharyetoraeqkyhkjhhx` (`groupId`,`userId`),
  KEY `idx_egmcxacluruixjzuunaaawcxnkehzxtvtkdm` (`userId`),
  CONSTRAINT `fk_tydkctmqtakxnegontbmemvdonmnooceqweo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vidaqhhgnirxjfwjhhlpoqtvlspvqpkagmxp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xfqycpsjzaooynligmwwswpmddafjoeegjad` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tyfqlqorifspqdmjxocolgtsurruizzitmer` (`permissionId`,`groupId`),
  KEY `idx_shevtuiplypdxgplmmxaklaitkqfqtkhuybc` (`groupId`),
  CONSTRAINT `fk_nfvnwgiryvxvasiuyusiotualkpltipwihft` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yvpxlgvjnycaspowcueqdtqjuyymcfagrprz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sfuyarcpyyghvsnfaobelukjmxbqgwwtbskr` (`permissionId`,`userId`),
  KEY `idx_qlvcjmmvruyayniltibzntztubywoibmepzx` (`userId`),
  CONSTRAINT `fk_mrljagmgsysynyqzncuaoesgxgdgwaeetsfi` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_twjnxrbzfzzdffpkrjxawqaofizfsfnsjnpr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_mxvwvcnciywjyrgyenkzbqfjbxscapcgvrnr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
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
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
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
  KEY `idx_bglqdgmvfxwojccnojkzhvxlgyaztdnemytx` (`active`),
  KEY `idx_vsxsrxaywwivwazkylrsdmtqzeigizqfdxet` (`locked`),
  KEY `idx_wxvltgluqvhmwtdcnzayeiuzgnrazuylgdtw` (`pending`),
  KEY `idx_rxllrtukdlomfjnubnbmbykxpurfszinakon` (`suspended`),
  KEY `idx_edjrvdmjjeyghzzlxhunlyifhrjqhimygbsx` (`verificationCode`),
  KEY `idx_swzabmkkmmjmuvtaiewjkxwxmgoquiyuxjqo` (`email`),
  KEY `idx_lyoyjfjcojcofutuoplvkxccedvgjieastkm` (`username`),
  KEY `fk_zeyklcifaktnwrqsnoocoskclckuztypmggd` (`photoId`),
  CONSTRAINT `fk_olhnjqkexcjthzjysmdhtfhlauprwwrinric` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zeyklcifaktnwrqsnoocoskclckuztypmggd` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wilbpztgqraxsogkmapjjidwatnjvifqftys` (`name`,`parentId`,`volumeId`),
  KEY `idx_umfwibuyhcifqkpknqowsujpljnzdrabntav` (`parentId`),
  KEY `idx_mfchsecedkdqezifqanevetybnlhzdxgzjch` (`volumeId`),
  CONSTRAINT `fk_jajkdhoduuuwkfqqrqezoiulhqcmthhwphkz` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrjwpeifzctdwzvnepxvkhbdeqjijriqyojk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_czlmgflfwxpqwvteznvhbbiaeppsoswowieg` (`name`),
  KEY `idx_aenujofoeesnzubfeajvifhzztbmirrpvtxp` (`handle`),
  KEY `idx_idlykxsqnimacvhzbldvslapzqkhjifeseoy` (`fieldLayoutId`),
  KEY `idx_pksimjbmwpjvyttioolqyqrdgimualinoeha` (`dateDeleted`),
  CONSTRAINT `fk_ousqsdncnfiqatzqjsfrblbqnyvpbieteogn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_girtsnfioobsebchjdwcrdbolxhnxgkouokd` (`userId`),
  CONSTRAINT `fk_ugulgczzmgsnpzbuxuhzzdzrecrsrbtcyyfz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2022-10-27 12:51:37
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
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
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_caches`
--

LOCK TABLES `blitz_caches` WRITE;
/*!40000 ALTER TABLE `blitz_caches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_caches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_cachetags`
--

LOCK TABLES `blitz_cachetags` WRITE;
/*!40000 ALTER TABLE `blitz_cachetags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_cachetags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_driverdata`
--

LOCK TABLES `blitz_driverdata` WRITE;
/*!40000 ALTER TABLE `blitz_driverdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_driverdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementcaches`
--

LOCK TABLES `blitz_elementcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementexpirydates`
--

LOCK TABLES `blitz_elementexpirydates` WRITE;
/*!40000 ALTER TABLE `blitz_elementexpirydates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementexpirydates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueries`
--

LOCK TABLES `blitz_elementqueries` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementqueries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerycaches`
--

LOCK TABLES `blitz_elementquerycaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerycaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementquerycaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerysources`
--

LOCK TABLES `blitz_elementquerysources` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerysources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementquerysources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_hints`
--

LOCK TABLES `blitz_hints` WRITE;
/*!40000 ALTER TABLE `blitz_hints` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_hints` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-09-02 10:56:59','2022-09-02 10:56:59','b786bbb8-5e64-4571-a043-083cb41dd601'),(2,2,1,'Home','2022-10-06 12:54:16','2022-10-06 12:54:16','2741e5f6-3fd0-433a-9078-777879dbb34e'),(3,3,1,'Home','2022-10-06 12:54:16','2022-10-06 12:54:16','0edd5460-c62b-448a-b610-7bfb8b82935f'),(4,4,1,'Home','2022-10-06 12:54:16','2022-10-06 12:54:16','c29b655f-18cb-4749-9232-cade0c5e1c1e');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-09-02 10:56:59','2022-09-02 10:56:59',NULL,NULL,'15d3f548-bcee-4b03-bfc3-ff209c714abc'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-10-06 12:54:16','2022-10-06 12:54:16',NULL,NULL,'a400b3d9-42be-48d7-b427-c05e5d20716e'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-10-06 12:54:16','2022-10-06 12:54:16',NULL,NULL,'7bb2ba92-0a51-40bc-bae6-4a14a509d9df'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-10-06 12:54:16','2022-10-06 12:54:16',NULL,NULL,'f284d083-17a6-46d1-9c5b-be74f0f8df82');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-09-02 10:56:59','2022-09-02 10:56:59','be3c1080-4fc7-4837-b181-9f5b253fecfc'),(2,2,1,'home','__home__',1,'2022-10-06 12:54:16','2022-10-06 12:54:16','f115d984-68b4-4af1-814d-7f4c0fe3036b'),(3,3,1,'home','__home__',1,'2022-10-06 12:54:16','2022-10-06 12:54:16','7771b77d-65d6-4dc2-92eb-00018b281f8f'),(4,4,1,'home','__home__',1,'2022-10-06 12:54:16','2022-10-06 12:54:16','eca0b289-3038-4eee-8ee4-8a7cb4811807');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2022-10-06 12:54:00',NULL,NULL,'2022-10-06 12:54:16','2022-10-06 12:54:16'),(3,1,NULL,1,NULL,'2022-10-06 12:54:00',NULL,NULL,'2022-10-06 12:54:16','2022-10-06 12:54:16'),(4,1,NULL,1,NULL,'2022-10-06 12:54:00',NULL,NULL,'2022-10-06 12:54:16','2022-10-06 12:54:16');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2022-10-06 12:54:16','2022-10-06 12:54:16',NULL,'9ef2dbac-4644-409d-89f6-9f97dd348717');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-09-02 10:56:59','2022-09-02 10:56:59',NULL,'ea8bcd6b-4ccb-4033-8540-dcb24610ff95');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-10-06 12:54:16','2022-10-06 12:54:16',NULL,'35469b12-f603-487b-8a7b-1333694181b6'),(2,'craft\\elements\\Asset','2022-10-06 13:12:11','2022-10-06 13:12:11',NULL,'fd9cb690-b7bc-46e0-9c09-bd035f05b456');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"f9674192-8a42-4e3e-8eaa-06e5f7126988\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-10-06 12:54:16','2022-10-06 12:54:16','58573e60-2df4-43e4-bc2c-a718b2144888'),(2,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7aac1b73-28c4-4142-8bf3-345ce294b18c\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-10-06 13:12:11','2022-10-06 13:12:11','58e1dd31-bdeb-4d10-bce7-4f0238b10123');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
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
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.2.7','4.0.0.9',0,'hwybevnrbvvf','3@zxwgqgkfqk','2022-09-02 10:56:59','2022-10-14 13:09:52','d13159ec-3cd4-4fc6-9b57-26ef00f40c42');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','986ed3bf-69b6-4829-ad86-f01c2c50aa4a'),(2,'craft','m210121_145800_asset_indexing_changes','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','fb882b80-0095-48ba-85d4-be610399901b'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','69585429-fa92-4eec-b638-dd8b94e7888a'),(4,'craft','m210724_180756_rename_source_cols','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','922b31fe-5f81-4174-8358-609627251479'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','cb4f85da-ff32-4176-8870-19a59ebb1409'),(6,'craft','m210817_014201_universal_users','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','cf3d8b8d-45eb-4186-8bfb-c133350faa0f'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','c0824013-284d-4c34-889b-f3606380f19b'),(8,'craft','m211115_135500_image_transformers','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','3c938090-d896-44f7-9568-0e4a516f7130'),(9,'craft','m211201_131000_filesystems','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','bb78c840-457b-4867-bd28-0e52d54885f4'),(10,'craft','m220103_043103_tab_conditions','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','3700a980-7fee-4985-bcf0-0553fa5cadfb'),(11,'craft','m220104_003433_asset_alt_text','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','6d1c63ea-cefd-468f-9370-8c800bde41ca'),(12,'craft','m220123_213619_update_permissions','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','e7487b06-aede-460a-ba09-3914d8676861'),(13,'craft','m220126_003432_addresses','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','7d0752d3-e625-4e21-b383-715787e18daa'),(14,'craft','m220209_095604_add_indexes','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','181364ef-f316-48a3-828f-8145abd88c5d'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','9fb632eb-9ee9-42d6-9668-037299aa7c10'),(16,'craft','m220214_000000_truncate_sessions','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','c923641e-8462-46db-b89c-dd47b9ff8176'),(17,'craft','m220222_122159_full_names','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','a7105514-9118-4cc3-a7b2-d3f1e77c8aba'),(18,'craft','m220223_180559_nullable_address_owner','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','d730b002-6eb1-401b-8819-531a3c6e9a89'),(19,'craft','m220225_165000_transform_filesystems','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','c03ae7c0-3d35-4818-89cf-3b6baf165675'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','ad2ac851-f39c-41ff-9da2-6b56c803d7ed'),(21,'craft','m220314_211928_field_layout_element_uids','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','f0014e07-2c06-43d8-9ca9-8b3dd752edb3'),(22,'craft','m220316_123800_transform_fs_subpath','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','345e90aa-2116-4259-91e1-0af006d51bc1'),(23,'craft','m220317_174250_release_all_jobs','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','6e871b21-570d-411c-98e3-c2e1876b5e8e'),(24,'craft','m220330_150000_add_site_gql_schema_components','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','6eb2166b-177e-44cf-b79c-455b8f04649a'),(25,'craft','m220413_024536_site_enabled_string','2022-09-02 10:57:00','2022-09-02 10:57:00','2022-09-02 10:57:00','3d61504b-3e2e-4919-b578-b51c48140c34'),(26,'plugin:redactor','m180430_204710_remove_old_plugins','2022-09-02 10:57:01','2022-09-02 10:57:01','2022-09-02 10:57:01','4cba159b-5973-4810-8d2c-2d5c827f5345'),(27,'plugin:redactor','Install','2022-09-02 10:57:01','2022-09-02 10:57:01','2022-09-02 10:57:01','f4720250-6911-4dae-8e4c-f6f2db6f1a70'),(28,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-09-02 10:57:01','2022-09-02 10:57:01','2022-09-02 10:57:01','f27dbc0e-ea97-457b-99ee-0c3972c1ca5a'),(29,'plugin:seomatic','Install','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','f0fa159c-57e2-409d-bcba-33e1b8cfe745'),(30,'plugin:seomatic','m180314_002755_field_type','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','0f77f47a-082f-4b6a-ab03-9f5467bd111a'),(31,'plugin:seomatic','m180314_002756_base_install','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','70d4df74-de4c-4ba2-9bfa-3338b7022151'),(32,'plugin:seomatic','m180502_202319_remove_field_metabundles','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','9d11c593-55c8-440c-869c-98fa5af9c688'),(33,'plugin:seomatic','m180711_024947_commerce_products','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','3487f580-949e-4bbb-8368-686720086615'),(34,'plugin:seomatic','m190401_220828_longer_handles','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','ce120569-72bb-491f-818e-af81431e1b8e'),(35,'plugin:seomatic','m190518_030221_calendar_events','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','925d57fc-6937-4860-9ea9-15ee03ecdc9f'),(36,'plugin:seomatic','m200419_203444_add_type_id','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','1fa63594-8e50-406b-b964-3fcb2e9eca7c'),(37,'plugin:seomatic','m210603_213100_add_gql_schema_components','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','100b399b-11a4-474f-b176-8f89539a9fe2'),(38,'plugin:seomatic','m210817_230853_announcement_v3_4','2022-09-02 10:57:02','2022-09-02 10:57:02','2022-09-02 10:57:02','a96736c4-0e56-460a-9e30-eba48be23ce5'),(39,'plugin:blitz','Install','2022-09-02 10:57:05','2022-09-02 10:57:05','2022-09-02 10:57:05','360a4a64-2854-4e65-a25d-e7c11ef8ae79'),(40,'plugin:blitz','m220330_120000_update_settings','2022-09-02 10:57:05','2022-09-02 10:57:05','2022-09-02 10:57:05','4a3c5f48-3623-4832-91d2-99f3cc767d52'),(41,'plugin:blitz','m220511_120000_add_hints_table','2022-09-02 10:57:05','2022-09-02 10:57:05','2022-09-02 10:57:05','96c3fe66-993a-4fc9-b806-99ca63a7b6ab'),(42,'plugin:blitz','m220517_120000_add_hints_announcement','2022-09-02 10:57:05','2022-09-02 10:57:05','2022-09-02 10:57:05','95237fa6-de62-4f13-b4b0-789d9ca07229'),(43,'plugin:blitz','m220630_120000_add_commerce_integration','2022-09-02 10:57:05','2022-09-02 10:57:05','2022-09-02 10:57:05','ece5c0aa-8eb9-46c4-9e44-8f3c2f5b9830'),(45,'plugin:submariner','Install','2022-09-23 11:18:06','2022-09-23 11:18:06','2022-09-23 11:18:06','246cace2-d579-434f-bcbd-45470287954e'),(46,'plugin:sherlock','Install','2022-10-06 12:42:19','2022-10-06 12:42:19','2022-10-06 12:42:19','00d8244f-8fb6-4208-8062-0675acf127bf'),(47,'plugin:sherlock','m220330_120000_update_setting','2022-10-06 12:42:19','2022-10-06 12:42:19','2022-10-06 12:42:19','d8953c56-07ed-45c5-9ceb-e07484450de6');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'redactor','3.0.2','2.3.0','unknown',NULL,'2022-09-02 10:57:01','2022-09-02 10:57:01','2022-10-27 12:51:35','d72d9914-e20e-4092-990b-0df835bd0df0'),(2,'seomatic','4.0.9','3.0.11','trial',NULL,'2022-09-02 10:57:02','2022-09-02 10:57:02','2022-10-27 12:51:35','fa702f9b-4646-44ac-91b8-cdc12fbcbfa6'),(3,'vite','4.0.3','1.0.0','unknown',NULL,'2022-09-02 10:57:04','2022-09-02 10:57:04','2022-10-27 12:51:35','68777f32-2382-428d-8b0c-59ff694d251a'),(4,'blitz','4.2.2','4.2.0','trial',NULL,'2022-09-02 10:57:05','2022-09-02 10:57:05','2022-10-27 12:51:35','f821524b-5be6-4eab-90f9-485d5958bc2b'),(7,'submariner','0.0.2','1.0.0','unknown',NULL,'2022-09-23 11:18:06','2022-09-23 11:18:06','2022-10-27 12:51:35','04d8d160-9e95-4300-9f2c-eed7ad9ae7c2'),(8,'sherlock','4.2.0','4.1.0','unknown',NULL,'2022-10-06 12:42:19','2022-10-06 12:42:19','2022-10-27 12:51:35','6f72bba3-90dc-4538-8883-77c6aa404835'),(9,'spacecontrol','0.0.1','1.0.0','unknown',NULL,'2022-10-06 13:48:29','2022-10-06 13:48:29','2022-10-27 12:51:35','399d94ee-fdff-4b1c-8782-a93edd4e3187'),(11,'plausible','2.0.0','2.0.0','unknown',NULL,'2022-10-06 13:55:04','2022-10-06 13:55:04','2022-10-27 12:51:35','06da9872-bee3-41b7-b8bf-097318b95c73');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1665064504'),('email.fromEmail','\"tb@szenario.desing\"'),('email.fromName','\"tomi\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elementCondition','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.autocomplete','false'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.autocorrect','true'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.class','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.disabled','false'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.elementCondition','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.id','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.instructions','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.label','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.max','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.min','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.name','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.orientation','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.placeholder','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.readonly','false'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.requirable','false'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.size','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.step','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.tip','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.title','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.uid','\"f9674192-8a42-4e3e-8eaa-06e5f7126988\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.userCondition','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.warning','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.elements.0.width','100'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.name','\"Content\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.uid','\"58573e60-2df4-43e4-bc2c-a718b2144888\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.fieldLayouts.35469b12-f603-487b-8a7b-1333694181b6.tabs.0.userCondition','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.handle','\"home\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.hasTitleField','false'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.name','\"Home\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.section','\"ced1899e-396b-42d0-ba9d-b6c2151972d3\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.sortOrder','1'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.titleFormat','\"{section.name|raw}\"'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.titleTranslationKeyFormat','null'),('entryTypes.9ef2dbac-4644-409d-89f6-9f97dd348717.titleTranslationMethod','\"site\"'),('fieldGroups.ea8bcd6b-4ccb-4033-8540-dcb24610ff95.name','\"Common\"'),('fs.media.hasUrls','true'),('fs.media.name','\"Media\"'),('fs.media.settings.path','\"@webroot\"'),('fs.media.type','\"craft\\\\fs\\\\Local\"'),('fs.media.url','\"@web\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.554c10bb-c4f5-42b3-becc-471c44394c65','\"tomi\"'),('meta.__names__.9ef2dbac-4644-409d-89f6-9f97dd348717','\"Home\"'),('meta.__names__.a5f4f75d-0744-4113-8362-1628a8d8da83','\"tomi\"'),('meta.__names__.ced1899e-396b-42d0-ba9d-b6c2151972d3','\"Home\"'),('meta.__names__.e4d54fad-ff98-4994-abe7-4f03a52acece','\"Public Schema\"'),('meta.__names__.ea8bcd6b-4ccb-4033-8540-dcb24610ff95','\"Common\"'),('meta.__names__.fc8456fb-a6ee-4b47-a4e6-11dfb38656be','\"Media\"'),('plugins.blitz.edition','\"standard\"'),('plugins.blitz.enabled','true'),('plugins.blitz.licenseKey','\"OHN7O2T62MQ6LPDAL87E9EJ0\"'),('plugins.blitz.schemaVersion','\"4.2.0\"'),('plugins.plausible.edition','\"standard\"'),('plugins.plausible.enabled','true'),('plugins.plausible.schemaVersion','\"2.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seomatic.edition','\"standard\"'),('plugins.seomatic.enabled','true'),('plugins.seomatic.licenseKey','\"WCZNLVOKKHX7JHV924RCGCU0\"'),('plugins.seomatic.schemaVersion','\"3.0.11\"'),('plugins.sherlock.edition','\"lite\"'),('plugins.sherlock.enabled','true'),('plugins.sherlock.schemaVersion','\"4.1.0\"'),('plugins.sherlock.settings.apiKey','\"khcperuugbdkopuwjelpaezbjycnhohi\"'),('plugins.sherlock.settings.blowfishHashCost.__assoc__.0.0','\"threshold\"'),('plugins.sherlock.settings.blowfishHashCost.__assoc__.0.1','13'),('plugins.sherlock.settings.contentSecurityPolicy.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.contentSecurityPolicy.__assoc__.0.1','true'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.0.0','\"enabled\"'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.0.1','false'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.1.0','\"enforce\"'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.1.1','false'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.2.0','\"header\"'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.2.1','true'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.3.0','\"directives\"'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.3.1.0.0','1'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.3.1.0.1','\"default-src\"'),('plugins.sherlock.settings.contentSecurityPolicySettings.__assoc__.3.1.0.2','\"\'self\'\"'),('plugins.sherlock.settings.cooldownDuration.__assoc__.0.0','\"threshold\"'),('plugins.sherlock.settings.cooldownDuration.__assoc__.0.1','300'),('plugins.sherlock.settings.cors.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.cors.__assoc__.0.1','true'),('plugins.sherlock.settings.craftFilePermissions.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.craftFilePermissions.__assoc__.0.1','true'),('plugins.sherlock.settings.craftFolderPermissions.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.craftFolderPermissions.__assoc__.0.1','true'),('plugins.sherlock.settings.craftFoldersAboveWebRoot.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.craftFoldersAboveWebRoot.__assoc__.0.1','true'),('plugins.sherlock.settings.criticalCraftUpdates.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.criticalCraftUpdates.__assoc__.0.1','true'),('plugins.sherlock.settings.criticalPluginUpdates.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.criticalPluginUpdates.__assoc__.0.1','true'),('plugins.sherlock.settings.defaultDirMode.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.defaultDirMode.__assoc__.0.1','true'),('plugins.sherlock.settings.defaultDirMode.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.defaultDirMode.__assoc__.1.1','509'),('plugins.sherlock.settings.defaultFileMode.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.defaultFileMode.__assoc__.0.1','true'),('plugins.sherlock.settings.defaultFileMode.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.defaultFileMode.__assoc__.1.1','436'),('plugins.sherlock.settings.defaultTokenDuration.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.defaultTokenDuration.__assoc__.0.1','true'),('plugins.sherlock.settings.defaultTokenDuration.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.defaultTokenDuration.__assoc__.1.1','86400'),('plugins.sherlock.settings.devMode.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.devMode.__assoc__.0.1','true'),('plugins.sherlock.settings.disabledTests','null'),('plugins.sherlock.settings.elevatedSessionDuration.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.elevatedSessionDuration.__assoc__.0.1','true'),('plugins.sherlock.settings.elevatedSessionDuration.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.elevatedSessionDuration.__assoc__.1.1','300'),('plugins.sherlock.settings.enableCsrfProtection.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.enableCsrfProtection.__assoc__.0.1','true'),('plugins.sherlock.settings.expectCT.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.expectCT.__assoc__.0.1','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.0.0','\"enabled\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.0.1','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.0','\"headers\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.0.0','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.0.1','\"Referrer-Policy\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.0.2','\"no-referrer-when-downgrade\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.1.0','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.1.1','\"Strict-Transport-Security\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.1.2','\"max-age=15552000\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.2.0','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.2.1','\"X-Content-Type-Options\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.2.2','\"nosniff\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.3.0','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.3.1','\"X-Frame-Options\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.3.2','\"SAMEORIGIN\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.4.0','true'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.4.1','\"X-Xss-Protection\"'),('plugins.sherlock.settings.headerProtectionSettings.__assoc__.1.1.4.2','\"1; mode=block\"'),('plugins.sherlock.settings.highSecurityLevel','false'),('plugins.sherlock.settings.httpsControlPanel.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.httpsControlPanel.__assoc__.0.1','true'),('plugins.sherlock.settings.httpsFrontEnd.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.httpsFrontEnd.__assoc__.0.1','true'),('plugins.sherlock.settings.integrationSettings','null'),('plugins.sherlock.settings.invalidLoginWindowDuration.__assoc__.0.0','\"threshold\"'),('plugins.sherlock.settings.invalidLoginWindowDuration.__assoc__.0.1','3600'),('plugins.sherlock.settings.maxInvalidLogins.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.maxInvalidLogins.__assoc__.0.1','true'),('plugins.sherlock.settings.maxInvalidLogins.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.maxInvalidLogins.__assoc__.1.1','5'),('plugins.sherlock.settings.monitor','false'),('plugins.sherlock.settings.notificationEmailAddresses','\"tb@szenario.desing\"'),('plugins.sherlock.settings.phpComposerVersion.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.phpComposerVersion.__assoc__.0.1','true'),('plugins.sherlock.settings.phpVersion.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.phpVersion.__assoc__.0.1','true'),('plugins.sherlock.settings.phpVersion.__assoc__.1.0','\"thresholds\"'),('plugins.sherlock.settings.phpVersion.__assoc__.1.1.__assoc__.0.0','\"8.0\"'),('plugins.sherlock.settings.phpVersion.__assoc__.1.1.__assoc__.0.1','\"2023-11-26\"'),('plugins.sherlock.settings.phpVersion.__assoc__.1.1.__assoc__.1.0','\"8.1\"'),('plugins.sherlock.settings.phpVersion.__assoc__.1.1.__assoc__.1.1','\"2024-11-25\"'),('plugins.sherlock.settings.preventUserEnumeration.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.preventUserEnumeration.__assoc__.0.1','true'),('plugins.sherlock.settings.referrerPolicy.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.referrerPolicy.__assoc__.0.1','true'),('plugins.sherlock.settings.rememberedUserSessionDuration.__assoc__.0.0','\"threshold\"'),('plugins.sherlock.settings.rememberedUserSessionDuration.__assoc__.0.1','12096004'),('plugins.sherlock.settings.requireEmailVerification.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.requireEmailVerification.__assoc__.0.1','true'),('plugins.sherlock.settings.sanitizeSvgUploads.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.sanitizeSvgUploads.__assoc__.0.1','true'),('plugins.sherlock.settings.sendPoweredByHeader.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.sendPoweredByHeader.__assoc__.0.1','false'),('plugins.sherlock.settings.strictTransportSecurity.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.strictTransportSecurity.__assoc__.0.1','true'),('plugins.sherlock.settings.strictTransportSecurity.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.strictTransportSecurity.__assoc__.1.1','15552000'),('plugins.sherlock.settings.testToEmailAddress.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.testToEmailAddress.__assoc__.0.1','true'),('plugins.sherlock.settings.translationDebugOutput.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.translationDebugOutput.__assoc__.0.1','true'),('plugins.sherlock.settings.userSessionDuration.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.userSessionDuration.__assoc__.0.1','true'),('plugins.sherlock.settings.userSessionDuration.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.userSessionDuration.__assoc__.1.1','3600'),('plugins.sherlock.settings.useSecureCookies.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.useSecureCookies.__assoc__.0.1','true'),('plugins.sherlock.settings.verificationCodeDuration.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.verificationCodeDuration.__assoc__.0.1','true'),('plugins.sherlock.settings.verificationCodeDuration.__assoc__.1.0','\"threshold\"'),('plugins.sherlock.settings.verificationCodeDuration.__assoc__.1.1','86400'),('plugins.sherlock.settings.webAliasInSiteBaseUrl.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.webAliasInSiteBaseUrl.__assoc__.0.1','true'),('plugins.sherlock.settings.webAliasInVolumeBaseUrl.__assoc__.0.0','\"forceFail\"'),('plugins.sherlock.settings.webAliasInVolumeBaseUrl.__assoc__.0.1','true'),('plugins.sherlock.settings.xContentTypeOptions.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.xContentTypeOptions.__assoc__.0.1','true'),('plugins.sherlock.settings.xFrameOptions.__assoc__.0.0','\"canFail\"'),('plugins.sherlock.settings.xFrameOptions.__assoc__.0.1','true'),('plugins.spacecontrol.edition','\"standard\"'),('plugins.spacecontrol.enabled','true'),('plugins.spacecontrol.schemaVersion','\"1.0.0\"'),('plugins.submariner.edition','\"standard\"'),('plugins.submariner.enabled','true'),('plugins.submariner.schemaVersion','\"1.0.0\"'),('plugins.submariner.settings.apiKey','\"6b5ae7d26ecefd98f16822de561b1f2a\"'),('plugins.submariner.settings.location','\"Vienna\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.defaultPlacement','\"end\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.enableVersioning','true'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.handle','\"home\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.name','\"Home\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.propagationMethod','\"all\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.siteSettings.a5f4f75d-0744-4113-8362-1628a8d8da83.enabledByDefault','true'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.siteSettings.a5f4f75d-0744-4113-8362-1628a8d8da83.hasUrls','true'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.siteSettings.a5f4f75d-0744-4113-8362-1628a8d8da83.template','\"index\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.siteSettings.a5f4f75d-0744-4113-8362-1628a8d8da83.uriFormat','\"__home__\"'),('sections.ced1899e-396b-42d0-ba9d-b6c2151972d3.type','\"single\"'),('siteGroups.554c10bb-c4f5-42b3-becc-471c44394c65.name','\"tomi\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.enabled','true'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.handle','\"default\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.hasUrls','true'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.language','\"en-US\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.name','\"tomi\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.primary','true'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.siteGroup','\"554c10bb-c4f5-42b3-becc-471c44394c65\"'),('sites.a5f4f75d-0744-4113-8362-1628a8d8da83.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"tomi\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elementCondition','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.autocapitalize','true'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.autocomplete','false'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.autocorrect','true'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.class','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.disabled','false'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.elementCondition','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.id','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.instructions','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.label','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.max','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.min','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.name','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.orientation','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.placeholder','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.readonly','false'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.requirable','false'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.size','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.step','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.tip','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.title','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.uid','\"7aac1b73-28c4-4142-8bf3-345ce294b18c\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.userCondition','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.warning','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.elements.0.width','100'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.name','\"Content\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.uid','\"58e1dd31-bdeb-4d10-bce7-4f0238b10123\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fieldLayouts.fd9cb690-b7bc-46e0-9c09-bd035f05b456.tabs.0.userCondition','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.fs','\"media\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.handle','\"media\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.name','\"Media\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.sortOrder','1'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.titleTranslationKeyFormat','null'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.titleTranslationMethod','\"site\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.transformFs','\"media\"'),('volumes.fc8456fb-a6ee-4b47-a4e6-11dfb38656be.transformSubpath','\"\"');
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
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' tb szenario desing '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' home '),(2,'title',0,1,' home ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all','end',NULL,'2022-10-06 12:54:15','2022-10-06 12:54:15',NULL,'ced1899e-396b-42d0-ba9d-b6c2151972d3');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2022-10-06 12:54:15','2022-10-06 12:54:15','1ece9bda-c773-4bba-ab95-e97daf208987');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seomatic_metabundles` VALUES (1,'2022-09-02 10:57:02','2022-09-02 10:57:02','974dcfe6-0b68-4508-a52a-81c4fdd7f209','1.0.61','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2022-09-02 10:57:02','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"tomi\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https://developers.google.com/gtagjs/)\",\"templatePath\":\"_frontend/scripts/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https://developers.google.com/adwords-remarketing-tag/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https://support.google.com/dcm/partner/answer/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtag/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https://support.google.com/tagmanager/answer/6102821?hl=en)\",\"templatePath\":\"_frontend/scripts/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"></iframe></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https://developers.google.com/tag-manager/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https://www.facebook.com/business/help/651294705016616)\",\"templatePath\":\"_frontend/scripts/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.facebook.com/docs/facebook-pixel/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://connect.facebook.net/en_US/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.facebook.com/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend/scripts/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n</script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" />\\n</noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://www.linkedin.com/help/lms/answer/65513/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://snap.licdn.com/li.lms-analytics/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://dc.ads.linkedin.com/collect/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://knowledge.hubspot.com/articles/kcs_article/reports/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"//js.hs-scripts.com/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https://help.pinterest.com/en/business/article/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend/scripts/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.pinterest.com/docs/ad-tools/conversion-tag/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://s.pinimg.com/ct/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://ct.pinterest.com/v3/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https://usefathom.com/)\",\"templatePath\":\"_frontend/scripts/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https://usefathom.com/support/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://cdn.usefathom.com/script.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https://matomo.org/)\",\"templatePath\":\"_frontend/scripts/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https://developer.matomo.org/guides/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https://developer.matomo.org/api-reference/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https://developer.matomo.org/api-reference/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https://developer.matomo.org/guides/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https://plausible.io/)\",\"templatePath\":\"_frontend/scripts/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https://plausible.io/docs/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://plausible.io/js/plausible.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https://www.google.com/analytics/analytics/)\",\"templatePath\":\"_frontend/scripts/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.google-analytics.com/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http://schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"teaches\":null,\"educationalLevel\":null,\"abstract\":null,\"creativeWorkStatus\":null,\"expires\":null,\"contentReferenceTime\":null,\"material\":null,\"review\":null,\"fileFormat\":null,\"text\":null,\"translator\":null,\"award\":null,\"assesses\":null,\"copyrightNotice\":null,\"schemaVersion\":null,\"countryOfOrigin\":null,\"pattern\":null,\"accountablePerson\":null,\"funding\":null,\"educationalUse\":null,\"genre\":null,\"keywords\":null,\"position\":null,\"accessibilityHazard\":null,\"alternativeHeadline\":null,\"audience\":null,\"offers\":null,\"locationCreated\":null,\"associatedMedia\":null,\"materialExtent\":null,\"mainEntity\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"awards\":null,\"contentLocation\":null,\"sdDatePublished\":null,\"producer\":null,\"spatial\":null,\"publisher\":null,\"sourceOrganization\":null,\"character\":null,\"funder\":null,\"exampleOfWork\":null,\"usageInfo\":null,\"provider\":null,\"sdPublisher\":null,\"comment\":null,\"accessibilityFeature\":null,\"publication\":null,\"translationOfWork\":null,\"interactivityType\":null,\"commentCount\":null,\"accessMode\":null,\"aggregateRating\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"interactionStatistic\":null,\"copyrightYear\":null,\"isBasedOn\":null,\"workExample\":null,\"publishingPrinciples\":null,\"discussionUrl\":null,\"releasedEvent\":null,\"dateCreated\":null,\"workTranslation\":null,\"editor\":null,\"creditText\":null,\"recordedAt\":null,\"editEIDR\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"dateModified\":null,\"sponsor\":null,\"accessibilitySummary\":null,\"encodingFormat\":null,\"maintainer\":null,\"educationalAlignment\":null,\"acquireLicensePage\":null,\"isAccessibleForFree\":null,\"datePublished\":null,\"spatialCoverage\":null,\"sdLicense\":null,\"conditionsOfAccess\":null,\"correction\":null,\"contentRating\":null,\"size\":null,\"isPartOf\":null,\"temporal\":null,\"thumbnailUrl\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"license\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"reviews\":null,\"about\":null,\"isFamilyFriendly\":null,\"headline\":null,\"accessibilityAPI\":null,\"publisherImprint\":null,\"isBasedOnUrl\":null,\"encodings\":null,\"interpretedAsClaim\":null,\"accessibilityControl\":null,\"citation\":null,\"version\":null,\"archivedAt\":null,\"learningResourceType\":null,\"encoding\":null,\"audio\":null,\"mentions\":null,\"accessModeSufficient\":null,\"hasPart\":null,\"temporalCoverage\":null,\"contributor\":null,\"video\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"additionalType\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"identifier\":null},\"identity\":{\"context\":\"http://schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"ownershipFundingInfo\":null,\"hasCredential\":null,\"founders\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"review\":null,\"knowsAbout\":null,\"award\":null,\"member\":null,\"employee\":null,\"dissolutionDate\":null,\"funding\":null,\"vatID\":null,\"globalLocationNumber\":null,\"keywords\":null,\"contactPoints\":[],\"subOrganization\":null,\"awards\":null,\"numberOfEmployees\":null,\"funder\":null,\"makesOffer\":null,\"legalName\":null,\"correctionsPolicy\":null,\"aggregateRating\":null,\"interactionStatistic\":null,\"location\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"memberOf\":null,\"publishingPrinciples\":null,\"diversityStaffingReport\":null,\"diversityPolicy\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"employees\":null,\"nonprofitStatus\":null,\"slogan\":null,\"ethicsPolicy\":null,\"brand\":null,\"sponsor\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"actionableFeedbackPolicy\":null,\"naics\":null,\"contactPoint\":null,\"serviceArea\":null,\"isicV4\":null,\"hasMerchantReturnPolicy\":null,\"hasPOS\":null,\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"parentOrganization\":null,\"alumni\":null,\"leiCode\":null,\"areaServed\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"knowsLanguage\":null,\"reviews\":null,\"seeks\":null,\"taxID\":null,\"owns\":null,\"hasOfferCatalog\":null,\"members\":null,\"events\":null,\"iso6523Code\":null,\"department\":null,\"faxNumber\":null,\"event\":null,\"mainEntityOfPage\":null,\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"name\":\"{{ seomatic.site.identity.genericName }}\",\"potentialAction\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"subjectOf\":null,\"additionalType\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"identifier\":null},\"creator\":{\"context\":\"http://schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"ownershipFundingInfo\":null,\"hasCredential\":null,\"founders\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"review\":null,\"knowsAbout\":null,\"award\":null,\"member\":null,\"employee\":null,\"dissolutionDate\":null,\"funding\":null,\"vatID\":null,\"globalLocationNumber\":null,\"keywords\":null,\"contactPoints\":[],\"subOrganization\":null,\"awards\":null,\"numberOfEmployees\":null,\"funder\":null,\"makesOffer\":null,\"legalName\":null,\"correctionsPolicy\":null,\"aggregateRating\":null,\"interactionStatistic\":null,\"location\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"memberOf\":null,\"publishingPrinciples\":null,\"diversityStaffingReport\":null,\"diversityPolicy\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"employees\":null,\"nonprofitStatus\":null,\"slogan\":null,\"ethicsPolicy\":null,\"brand\":null,\"sponsor\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"actionableFeedbackPolicy\":null,\"naics\":null,\"contactPoint\":null,\"serviceArea\":null,\"isicV4\":null,\"hasMerchantReturnPolicy\":null,\"hasPOS\":null,\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"parentOrganization\":null,\"alumni\":null,\"leiCode\":null,\"areaServed\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"knowsLanguage\":null,\"reviews\":null,\"seeks\":null,\"taxID\":null,\"owns\":null,\"hasOfferCatalog\":null,\"members\":null,\"events\":null,\"iso6523Code\":null,\"department\":null,\"faxNumber\":null,\"event\":null,\"mainEntityOfPage\":null,\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"name\":\"{{ seomatic.site.creator.genericName }}\",\"potentialAction\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"subjectOf\":null,\"additionalType\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"identifier\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"/* TEAM */\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n/a\\\" }}\\n\\n/* THANKS */\\n\\nCraft CMS - https://craftcms.com\\nPixel & Tonic - https://pixelandtonic.com\\n\\n/* SITE */\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 4, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend/pages/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend/pages/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"/\\\") }}\\n# More info: https://support.google.com/admanager/answer/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend/pages/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"/\\\") }} - more info: https://securitytxt.org/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\"security.txt\",\"template\":\"_frontend/pages/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2022-10-06 12:54:16','2022-10-06 12:54:16','e1f9f8be-5fbc-4a1a-8542-29f5cf51119f','1.0.30','section',1,'Home','home','single',NULL,'index',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index\",\"language\":\"en-us\"}}','2022-10-06 12:54:16','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"tomi\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http://schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"lastReviewed\":null,\"specialty\":null,\"primaryImageOfPage\":null,\"significantLink\":null,\"reviewedBy\":null,\"mainContentOfPage\":null,\"relatedLink\":null,\"speakable\":null,\"breadcrumb\":null,\"significantLinks\":null,\"teaches\":null,\"educationalLevel\":null,\"abstract\":null,\"creativeWorkStatus\":null,\"expires\":null,\"contentReferenceTime\":null,\"material\":null,\"review\":null,\"fileFormat\":null,\"text\":null,\"translator\":null,\"award\":null,\"assesses\":null,\"copyrightNotice\":null,\"schemaVersion\":null,\"countryOfOrigin\":null,\"pattern\":null,\"accountablePerson\":null,\"funding\":null,\"educationalUse\":null,\"genre\":null,\"keywords\":null,\"position\":null,\"accessibilityHazard\":null,\"alternativeHeadline\":null,\"audience\":null,\"offers\":null,\"locationCreated\":null,\"associatedMedia\":null,\"materialExtent\":null,\"mainEntity\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"awards\":null,\"contentLocation\":null,\"sdDatePublished\":null,\"producer\":null,\"spatial\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"sourceOrganization\":null,\"character\":null,\"funder\":null,\"exampleOfWork\":null,\"usageInfo\":null,\"provider\":null,\"sdPublisher\":null,\"comment\":null,\"accessibilityFeature\":null,\"publication\":null,\"translationOfWork\":null,\"interactivityType\":null,\"commentCount\":null,\"accessMode\":null,\"aggregateRating\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"interactionStatistic\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"isBasedOn\":null,\"workExample\":null,\"publishingPrinciples\":null,\"discussionUrl\":null,\"releasedEvent\":null,\"dateCreated\":false,\"workTranslation\":null,\"editor\":null,\"creditText\":null,\"recordedAt\":null,\"editEIDR\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"sponsor\":null,\"accessibilitySummary\":null,\"encodingFormat\":null,\"maintainer\":null,\"educationalAlignment\":null,\"acquireLicensePage\":null,\"isAccessibleForFree\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"spatialCoverage\":null,\"sdLicense\":null,\"conditionsOfAccess\":null,\"correction\":null,\"contentRating\":null,\"size\":null,\"isPartOf\":null,\"temporal\":null,\"thumbnailUrl\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"license\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"reviews\":null,\"about\":null,\"isFamilyFriendly\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"accessibilityAPI\":null,\"publisherImprint\":null,\"isBasedOnUrl\":null,\"encodings\":null,\"interpretedAsClaim\":null,\"accessibilityControl\":null,\"citation\":null,\"version\":null,\"archivedAt\":null,\"learningResourceType\":null,\"encoding\":null,\"audio\":null,\"mentions\":null,\"accessModeSufficient\":null,\"hasPart\":null,\"temporalCoverage\":null,\"contributor\":null,\"video\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"additionalType\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"identifier\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
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
-- Dumping data for table `sherlock`
--

LOCK TABLES `sherlock` WRITE;
/*!40000 ALTER TABLE `sherlock` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sherlock` ENABLE KEYS */;
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
INSERT INTO `sitegroups` VALUES (1,'tomi','2022-09-02 10:56:59','2022-09-02 10:56:59',NULL,'554c10bb-c4f5-42b3-becc-471c44394c65');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','tomi','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-09-02 10:56:59','2022-09-02 10:56:59',NULL,'a5f4f75d-0744-4113-8362-1628a8d8da83');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
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
-- Dumping data for table `submariner`
--

LOCK TABLES `submariner` WRITE;
/*!40000 ALTER TABLE `submariner` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `submariner` VALUES (1,'2022-09-23 11:18:06','2022-10-06 12:42:20','954fb78d-fa87-449d-a711-5797c3411704',23.16);
/*!40000 ALTER TABLE `submariner` ENABLE KEYS */;
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
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'tb@szenario.desing','$2y$13$IQKB8GuZSx3DwfkF9xUviOqi18NEbe09SbAVdWVh1/QNvNhA4Y/iq','2022-10-27 12:49:11',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-09-02 10:57:00','2022-09-02 10:57:00','2022-10-27 12:49:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Media','','2022-10-06 13:12:11','2022-10-06 13:12:11','a1e7bf1c-ab0c-4908-9d12-4a0b697055aa');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,2,'Media','media','media','media','','site',NULL,1,'2022-10-06 13:12:11','2022-10-06 13:12:11',NULL,'fc8456fb-a6ee-4b47-a4e6-11dfb38656be');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-09-09 09:23:22','2022-09-09 09:23:22','28351430-014b-483f-a4d7-427940cc61c4'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-09-09 09:23:22','2022-09-09 09:23:22','f4abd688-c026-482c-83da-9c5da9ade319'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-09-09 09:23:22','2022-09-09 09:23:22','56804446-8c0e-418d-9494-bdde14014e4c'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-09-09 09:23:22','2022-09-09 09:23:22','ec214310-2260-4072-a2a9-e4361a06e3b3'),(5,1,'shornuk\\plausible\\widgets\\TopBrowsers',5,NULL,'{\"limit\":\"4\",\"timePeriod\":\"30d\"}',1,'2022-10-06 13:55:17','2022-10-06 13:55:17','cdc39fb8-b878-4ea0-83ad-ad2ef518247a'),(10,1,'szenario\\spacecontrol\\widgets\\SpaceControlWidget',6,NULL,'{\"limit\":4,\"timePeriod\":\"30d\"}',1,'2022-10-27 12:49:39','2022-10-27 12:49:39','e803bfa8-b09f-467f-92c2-a46439ca4daa');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 12:51:37
