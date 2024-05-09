-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: admin_dev
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `apicases_reportstatics`


DROP TABLE IF EXISTS `apicases_reportstatics`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apicases_reportstatics`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
    `testplanid`  bigint(20) unsigned NOT NULL COMMENT '执行计划id',
    `deployunitid`  bigint(20) unsigned NOT NULL COMMENT '发单单元id',
    `batchname`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin COMMENT '批次',
    `slaverid`  bigint(20) unsigned NOT NULL COMMENT '执行机id',
    `totalcases`      bigint(20) NOT NULL COMMENT '用例总数',
    `totalpasscases`      bigint(20) NOT NULL COMMENT '用例总数',
    `totalfailcases`      bigint(20) NOT NULL COMMENT '用例总数',
    `runtime`      bigint(20) NOT NULL COMMENT '运行时长',
    `create_time`   datetime DEFAULT NOW() COMMENT '创建时间',
    `lastmodify_time`    datetime DEFAULT NOW() COMMENT '上一次修改时间',
    `creator`    varchar(10) CHARACTER SET utf8 COLLATE utf8_bin COMMENT '创建者',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4 COMMENT ='api计划批量用例统计报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicases_reportstatics`
--

LOCK TABLES `apicases_reportstatics` WRITE;
/*!40000 ALTER TABLE `apicases_reportstatics`
    DISABLE KEYS */;
INSERT INTO `apicases_reportstatics`
VALUES (1, 1,1,'batch2020-10-21-tag-100',100,70,30,300,'2019-07-01 00:00:00', '2019-07-01 00:00:00','admin');
/*!40000 ALTER TABLE `apicases_reportstatics`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2018-02-16 19:24:53
