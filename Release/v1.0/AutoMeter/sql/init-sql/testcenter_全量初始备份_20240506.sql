/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50729
Source Host           : 127.0.0.1:3306
Source Database       : testcenter

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2024-05-06 14:33:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_account_name` (`name`),
  UNIQUE KEY `ix_account_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin@qq.com', 'admin', '$2a$10$amYatUz63nRvdyZgmKKFnu62xIb.sOTbrEjOw4831JNXBc7nrDENe', '2024-05-06 14:00:52', '2024-05-06 14:31:08', 'admin');
INSERT INTO `account` VALUES ('2', 'pw1210@foxmail.com', 'test', '$2a$10$KxGOq.z/6iLVyPcQfTtoQ.VHGMkt3gBWOI4aeIPZ.VDC8o7KwxqLC', '2024-05-06 14:19:44', '2024-05-06 14:31:29', 'test');

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role` (
  `account_id` bigint(20) unsigned NOT NULL COMMENT '用户Id',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `account_role_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_role_fk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

-- ----------------------------
-- Records of account_role
-- ----------------------------
INSERT INTO `account_role` VALUES ('1', '1');
INSERT INTO `account_role` VALUES ('2', '4');

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT 'DeployUnitId',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务名',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口名',
  `visittype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '访问方式，字典表获取',
  `apistyle` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'restful,普通方式',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'url访问路径',
  `requestcontenttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '请求数据格式，form表单，json',
  `responecontenttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '响应数据格式，form表单，json',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `requesttype` varchar(20) DEFAULT 'Body传值' COMMENT '请求传值方式',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `casecounts` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用例数量',
  `modelname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `modelid` bigint(20) unsigned DEFAULT '0' COMMENT '模块id',
  `mnickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '维护者',
  `mid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  `creatorid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微服务表';

-- ----------------------------
-- Records of api
-- ----------------------------

-- ----------------------------
-- Table structure for apicases
-- ----------------------------
DROP TABLE IF EXISTS `apicases`;
CREATE TABLE `apicases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'API',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `casejmxname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例jmx名，和jmx文件名对齐',
  `casetype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型，功能，性能',
  `threadnum` bigint(20) unsigned NOT NULL COMMENT '线程数',
  `loops` bigint(20) unsigned NOT NULL COMMENT '循环数',
  `casecontent` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例内容，以英文逗号分开，提供jar获取自定义期望结果A：1的值，入参为冒号左边的内容',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '期望值',
  `middleparam` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '中间变量',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `level` bigint(20) unsigned NOT NULL COMMENT '优先级',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `modelname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `modelid` bigint(20) unsigned DEFAULT '0' COMMENT '模块id',
  `mnickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '维护者',
  `mid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  `creatorid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例表';

-- ----------------------------
-- Records of apicases
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_assert
-- ----------------------------
DROP TABLE IF EXISTS `apicases_assert`;
CREATE TABLE `apicases_assert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '断言Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `asserttype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言类型',
  `assertsubtype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言子类型',
  `assertvalues` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `expression` varchar(400) DEFAULT NULL COMMENT '断言表达式',
  `assertcondition` varchar(20) DEFAULT NULL COMMENT '断言条件',
  `assertvaluetype` varchar(20) DEFAULT NULL COMMENT '断言值类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='断言表';

-- ----------------------------
-- Records of apicases_assert
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_condition
-- ----------------------------
DROP TABLE IF EXISTS `apicases_condition`;
CREATE TABLE `apicases_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `execplanid` bigint(20) unsigned DEFAULT NULL COMMENT '执行计划Id',
  `execplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `target` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件目标',
  `caseid` bigint(20) unsigned DEFAULT NULL COMMENT '用例id',
  `envassemid` bigint(20) unsigned DEFAULT NULL COMMENT '环境组件id',
  `casedeployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例所属微服务',
  `caseapiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例所属api',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `basetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前置，后置',
  `conditionbasetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库，接口',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库：mysql，oracle，sqlserver，接口：http,https,dubbo',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '包含调用接口的微服务',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '调用接口的api',
  `conditionvalue` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件值，如果是数据库为sql，如果是接口为用例名',
  `conditioncaseid` bigint(20) unsigned DEFAULT NULL COMMENT '条件值id，如果是数据库为空，如果是接口为用例id',
  `connectstr` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '连接字',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例条件表';

-- ----------------------------
-- Records of apicases_condition
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_condition_report
-- ----------------------------
DROP TABLE IF EXISTS `apicases_condition_report`;
CREATE TABLE `apicases_condition_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前置，后置',
  `casetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '功能，性能',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `errorinfo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例前后置条件运行报告表';

-- ----------------------------
-- Records of apicases_condition_report
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_condition_report_extinfo
-- ----------------------------
DROP TABLE IF EXISTS `apicases_condition_report_extinfo`;
CREATE TABLE `apicases_condition_report_extinfo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `condition_reportid` bigint(20) unsigned NOT NULL COMMENT '条件报告id',
  `responeinfo` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '响应详细信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件报告扩展信息表';

-- ----------------------------
-- Records of apicases_condition_report_extinfo
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_dbassert
-- ----------------------------
DROP TABLE IF EXISTS `apicases_dbassert`;
CREATE TABLE `apicases_dbassert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '断言Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `assembleid` bigint(20) unsigned NOT NULL COMMENT '组件id',
  `assemblename` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境id',
  `enviroment` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '断言值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `expression` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '断言sql表达式',
  `expectrecordsnums` bigint(20) unsigned DEFAULT NULL COMMENT '期望结果条数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库断言表';

-- ----------------------------
-- Records of apicases_dbassert
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_dbassert_value
-- ----------------------------
DROP TABLE IF EXISTS `apicases_dbassert_value`;
CREATE TABLE `apicases_dbassert_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `dbassertid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `fieldname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '列名',
  `roworder` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '行号',
  `valuetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '值类型',
  `expectvalue` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '期望值',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库断言值表';

-- ----------------------------
-- Records of apicases_dbassert_value
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_debug_condition
-- ----------------------------
DROP TABLE IF EXISTS `apicases_debug_condition`;
CREATE TABLE `apicases_debug_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitid` bigint(20) unsigned DEFAULT NULL COMMENT '微服务Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务',
  `caseid` bigint(20) unsigned DEFAULT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `conditionname` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件名',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用例调试全局条件表';

-- ----------------------------
-- Records of apicases_debug_condition
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_performanceapdex
-- ----------------------------
DROP TABLE IF EXISTS `apicases_performanceapdex`;
CREATE TABLE `apicases_performanceapdex` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `apdex` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'apdex',
  `toleration` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'toleration',
  `frustration` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'frustration',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例性能apdex表';

-- ----------------------------
-- Records of apicases_performanceapdex
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_performancestatistics
-- ----------------------------
DROP TABLE IF EXISTS `apicases_performancestatistics`;
CREATE TABLE `apicases_performancestatistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `runtime` double(11,2) NOT NULL COMMENT '运行时长,秒',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `samples` bigint(20) unsigned NOT NULL COMMENT '样本',
  `errorcount` bigint(20) unsigned NOT NULL COMMENT '错误次数',
  `errorrate` double(11,2) NOT NULL COMMENT '错误率',
  `average` double(11,2) NOT NULL COMMENT '平均数',
  `min` double(11,2) NOT NULL COMMENT '最小值',
  `max` double(11,2) NOT NULL COMMENT '最大值',
  `median` double(11,2) NOT NULL COMMENT '中间值',
  `nzpct` double(11,2) NOT NULL COMMENT '90pct',
  `nfpct` double(11,2) NOT NULL COMMENT '95pct',
  `nnpct` double(11,2) NOT NULL COMMENT '99pct',
  `tps` double(11,2) NOT NULL COMMENT 'tps',
  `receivekbsec` double(11,2) NOT NULL COMMENT '每秒接受Kb数',
  `sendkbsec` double(11,2) NOT NULL COMMENT '每秒发送Kb数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例性能统计表';

-- ----------------------------
-- Records of apicases_performancestatistics
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_report
-- ----------------------------
DROP TABLE IF EXISTS `apicases_report`;
CREATE TABLE `apicases_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `respone` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '返回结果',
  `assertvalue` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '断言详细经过',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `expect` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '期望值',
  `errorinfo` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `requestheader` text COMMENT '请求头数据',
  `requestdatas` text COMMENT '请求数据',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `requestmethod` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `sceneid` bigint(20) unsigned NOT NULL COMMENT '场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例报告表';

-- ----------------------------
-- Records of apicases_report
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_reportstatics
-- ----------------------------
DROP TABLE IF EXISTS `apicases_reportstatics`;
CREATE TABLE `apicases_reportstatics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '发单单元id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例总数',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api计划批量用例统计报告表';

-- ----------------------------
-- Records of apicases_reportstatics
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_report_extinfo
-- ----------------------------
DROP TABLE IF EXISTS `apicases_report_extinfo`;
CREATE TABLE `apicases_report_extinfo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `reportid` bigint(20) unsigned NOT NULL COMMENT '报告id',
  `responeinfo` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '响应详细信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例功能报告扩展信息表';

-- ----------------------------
-- Records of apicases_report_extinfo
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_report_performance
-- ----------------------------
DROP TABLE IF EXISTS `apicases_report_performance`;
CREATE TABLE `apicases_report_performance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机id',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `respone` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '返回结果',
  `assertvalue` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '断言详细经过',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `expect` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '期望值',
  `errorinfo` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `requestheader` text COMMENT '请求头数据',
  `requestdatas` text COMMENT '请求数据',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `requestmethod` varchar(20) DEFAULT NULL COMMENT '请求方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例报告表';

-- ----------------------------
-- Records of apicases_report_performance
-- ----------------------------

-- ----------------------------
-- Table structure for apicases_variables
-- ----------------------------
DROP TABLE IF EXISTS `apicases_variables`;
CREATE TABLE `apicases_variables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `variablesid` bigint(20) unsigned NOT NULL COMMENT '变量Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `deployunitname` varchar(64) DEFAULT NULL COMMENT '微服务',
  `apiname` varchar(200) DEFAULT NULL COMMENT 'api',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT 'deployunitid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例变量表';

-- ----------------------------
-- Records of apicases_variables
-- ----------------------------

-- ----------------------------
-- Table structure for api_casedata
-- ----------------------------
DROP TABLE IF EXISTS `api_casedata`;
CREATE TABLE `api_casedata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `apiparam` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api参数',
  `apiparamvalue` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '用例参数值',
  `propertytype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api属性类型，header，body',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `paramstype` varchar(20) DEFAULT NULL COMMENT '参数类型',
  `mid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api用例数据表';

-- ----------------------------
-- Records of api_casedata
-- ----------------------------

-- ----------------------------
-- Table structure for api_params
-- ----------------------------
DROP TABLE IF EXISTS `api_params`;
CREATE TABLE `api_params` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiId',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api名',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务名',
  `propertytype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api属性类型，header，body',
  `keyname` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'key名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `keydefaultvalue` text COMMENT 'Key默认值',
  `keytype` varchar(20) DEFAULT NULL COMMENT '参数类型',
  `creatorid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api参数表';

-- ----------------------------
-- Records of api_params
-- ----------------------------

-- ----------------------------
-- Table structure for condition_api
-- ----------------------------
DROP TABLE IF EXISTS `condition_api`;
CREATE TABLE `condition_api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id',
  `deployunitid` bigint(20) unsigned DEFAULT NULL COMMENT '微服务id',
  `caseid` bigint(20) unsigned DEFAULT NULL COMMENT '接口caseid',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `apiid` int(11) NOT NULL COMMENT 'apiid',
  `conditionname` varchar(64) DEFAULT NULL COMMENT '条件名',
  `deployunitname` varchar(64) DEFAULT NULL COMMENT '微服务名',
  `apiname` varchar(200) DEFAULT NULL COMMENT 'api名',
  `casename` varchar(64) DEFAULT NULL COMMENT '接口名',
  `subconditionname` varchar(64) DEFAULT NULL COMMENT '子条件名',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型-scencecase，scence,execplan',
  `modelname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `modelid` bigint(20) unsigned NOT NULL COMMENT '模块id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口条件表';

-- ----------------------------
-- Records of condition_api
-- ----------------------------

-- ----------------------------
-- Table structure for condition_db
-- ----------------------------
DROP TABLE IF EXISTS `condition_db`;
CREATE TABLE `condition_db` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id',
  `enviromentid` bigint(20) unsigned DEFAULT NULL COMMENT '环境id',
  `dbtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据库类型',
  `dbcontent` text COMMENT 'db执行内容',
  `connectstr` varchar(200) DEFAULT NULL COMMENT 'db连接字',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `subconditionname` varchar(64) DEFAULT NULL COMMENT '子条件名',
  `assembleid` bigint(20) unsigned DEFAULT NULL COMMENT '组件id',
  `assemblename` varchar(64) DEFAULT NULL COMMENT '组件名',
  `conditionname` varchar(64) DEFAULT NULL COMMENT '条件名',
  `enviromentname` varchar(64) DEFAULT NULL COMMENT '环境名',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型-scencecase，scence,execplan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='db条件表';

-- ----------------------------
-- Records of condition_db
-- ----------------------------

-- ----------------------------
-- Table structure for condition_delay
-- ----------------------------
DROP TABLE IF EXISTS `condition_delay`;
CREATE TABLE `condition_delay` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '父条件id',
  `conditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '父条件名',
  `subconditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子条件名',
  `delaytime` bigint(20) unsigned DEFAULT NULL COMMENT '延时时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型-scencecase，scence,execplan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='延时子条件表';

-- ----------------------------
-- Records of condition_delay
-- ----------------------------

-- ----------------------------
-- Table structure for condition_order
-- ----------------------------
DROP TABLE IF EXISTS `condition_order`;
CREATE TABLE `condition_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '父条件id',
  `subconditionid` bigint(20) unsigned DEFAULT NULL COMMENT '子条件id',
  `subconditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子条件类型',
  `subconditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子条件名',
  `conditionorder` bigint(20) unsigned DEFAULT NULL COMMENT '条件顺序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `conditionname` varchar(64) DEFAULT NULL COMMENT '父条件名',
  `orderstatus` varchar(20) DEFAULT NULL COMMENT '顺序状态',
  `conditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型-case,scencecase，scence,execplan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件顺序表';

-- ----------------------------
-- Records of condition_order
-- ----------------------------

-- ----------------------------
-- Table structure for condition_script
-- ----------------------------
DROP TABLE IF EXISTS `condition_script`;
CREATE TABLE `condition_script` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionid` bigint(20) unsigned DEFAULT NULL COMMENT '条件id，只取类型为用例',
  `script` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '脚本',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `conditionname` varchar(64) DEFAULT NULL COMMENT '条件名',
  `subconditionname` varchar(64) DEFAULT NULL COMMENT '子条件名',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditiontype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型-scencecase，scence,execplan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='脚本条件表';

-- ----------------------------
-- Records of condition_script
-- ----------------------------

-- ----------------------------
-- Table structure for dbcondition_variables
-- ----------------------------
DROP TABLE IF EXISTS `dbcondition_variables`;
CREATE TABLE `dbcondition_variables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `dbconditionid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `dbconditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `variablesid` bigint(20) unsigned NOT NULL COMMENT '变量Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `fieldname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字段名',
  `roworder` bigint(20) unsigned NOT NULL COMMENT '行序号',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库条件变量表';

-- ----------------------------
-- Records of dbcondition_variables
-- ----------------------------

-- ----------------------------
-- Table structure for dbvariables
-- ----------------------------
DROP TABLE IF EXISTS `dbvariables`;
CREATE TABLE `dbvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `dbvariablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `variablesdes` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量描述',
  `valuetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量值类型',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditionid` bigint(20) unsigned NOT NULL COMMENT '备注',
  `conditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件名',
  `fieldname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '列名',
  `roworder` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '行号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库变量表';

-- ----------------------------
-- Records of dbvariables
-- ----------------------------

-- ----------------------------
-- Table structure for deployunit
-- ----------------------------
DROP TABLE IF EXISTS `deployunit`;
CREATE TABLE `deployunit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务名',
  `protocal` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '协议',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '访问端口',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `baseurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '基本路径',
  `projectid` bigint(20) unsigned DEFAULT NULL COMMENT '项目id',
  `apicounts` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'api数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微服务表';

-- ----------------------------
-- Records of deployunit
-- ----------------------------

-- ----------------------------
-- Table structure for deployunit_model
-- ----------------------------
DROP TABLE IF EXISTS `deployunit_model`;
CREATE TABLE `deployunit_model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务id',
  `modelname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块',
  `memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微服务模块表';

-- ----------------------------
-- Records of deployunit_model
-- ----------------------------

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `dicname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字典类名',
  `diccode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典编码',
  `dicitemname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典项名',
  `dicitmevalue` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典项值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', '测试环境', 'testenviroment1', '功能测试环境1', 'te112', '2019-07-01 00:00:00', '2020-04-21 17:04:47');
INSERT INTO `dictionary` VALUES ('2', '测试环境', 'testenviroment', '功能测试环境2', 'te2', '2019-07-01 00:00:00', '2021-10-10 10:51:08');
INSERT INTO `dictionary` VALUES ('5', 'http请求方式', 'httpmethod', '查询', 'get', '2020-04-17 17:57:30', '2021-10-10 10:55:55');
INSERT INTO `dictionary` VALUES ('6', 'http请求方式', 'httpmethod', '提交数据', 'post', '2020-04-17 17:59:02', '2020-11-15 15:11:35');
INSERT INTO `dictionary` VALUES ('9', '测试环境', '测试环境', '测试环境', '测试环境', '2020-04-20 15:42:10', '2021-09-24 16:09:53');
INSERT INTO `dictionary` VALUES ('17', '访问方式', 'httpvisittype', 'http访问方式', 'GET', '2020-05-18 21:05:24', '2021-09-24 16:09:55');
INSERT INTO `dictionary` VALUES ('18', '访问方式', 'httpvisittype', 'http访问方式', 'POST', '2020-05-18 21:05:55', '2021-09-24 16:09:57');
INSERT INTO `dictionary` VALUES ('19', '服务器作用', 'machineuse', '部署', '部署微服务', '2020-09-09 12:26:21', '2020-09-09 12:09:53');
INSERT INTO `dictionary` VALUES ('20', '服务器作用', 'machineuse', '执行测试', '功能测试用例执行机', '2020-09-09 12:27:40', '2020-09-09 12:09:26');
INSERT INTO `dictionary` VALUES ('21', '服务器作用', 'machineuse', '执行测试', '性能测试执行机', '2020-09-09 12:29:25', '2021-09-24 16:09:01');
INSERT INTO `dictionary` VALUES ('27', '数据库类型', 'DBType', '用例前后置数据库类型', 'Mysql', '2020-11-02 08:29:29', '2021-10-10 10:56:03');
INSERT INTO `dictionary` VALUES ('28', '数据库类型', 'DBType', '用例前后置数据库类型', 'Oracle', '2020-11-02 08:30:29', '2021-09-24 16:09:01');
INSERT INTO `dictionary` VALUES ('29', '数据库类型', 'DBType', '用例前后置数据库类型', 'Sqlserver', '2020-11-02 08:31:05', '2021-09-24 16:09:03');
INSERT INTO `dictionary` VALUES ('34', '环境部署内容', 'machinedeploy', '数据库', 'mysql', '2020-11-06 15:43:18', '2021-09-24 16:09:06');
INSERT INTO `dictionary` VALUES ('35', '环境部署内容', 'machinedeploy', '数据库', 'oracle', '2020-11-06 15:43:36', '2021-09-24 16:09:08');
INSERT INTO `dictionary` VALUES ('39', 'api请求格式', 'requestcontentype', '请求数据格式', 'Form表单', '2020-11-10 08:43:55', '2021-09-24 16:09:15');
INSERT INTO `dictionary` VALUES ('40', 'api请求格式', 'requestcontentype', '请求数据格式', 'JSON', '2020-11-10 08:44:19', '2021-09-24 16:09:17');
INSERT INTO `dictionary` VALUES ('41', 'api响应格式', 'responecontenttype', '响应数据格式', 'json', '2020-11-10 08:50:28', '2021-09-24 16:09:19');
INSERT INTO `dictionary` VALUES ('42', 'api响应格式', 'responecontenttype', '响应数据格式', 'html', '2020-11-10 08:55:14', '2021-09-24 16:09:33');
INSERT INTO `dictionary` VALUES ('43', 'http请求方式', 'httpmethod', '更新', 'put', '2020-11-15 15:41:55', '2021-09-24 16:09:35');
INSERT INTO `dictionary` VALUES ('44', 'http请求方式', 'httpmethod', '删除', 'delete', '2020-11-15 15:42:14', '2021-09-24 16:09:37');
INSERT INTO `dictionary` VALUES ('45', '访问方式', 'httpvisittype', '更新', 'PUT', '2020-11-15 15:47:03', '2021-09-24 16:09:39');
INSERT INTO `dictionary` VALUES ('46', '访问方式', 'httpvisittype', '删除', 'DELETE', '2020-11-15 15:47:20', '2021-09-24 16:09:41');
INSERT INTO `dictionary` VALUES ('47', '功能执行机最大并发数', 'FunctionJmeterProcess', '功能执行机并发Jmeter进程', '2', '2020-11-28 17:02:39', '2021-04-02 12:04:57');
INSERT INTO `dictionary` VALUES ('52', '性能执行机Jmeter并发数', 'PerformanceJmeterProcess', '性能测试Jmeter并行数', '1', '2021-04-07 09:08:10', '2021-05-26 23:05:05');
INSERT INTO `dictionary` VALUES ('53', '执行计划业务类型', 'planbusinesstype', '执行计划业务类型', '常规测试', '2021-04-20 17:24:17', '2021-09-24 16:09:08');
INSERT INTO `dictionary` VALUES ('54', '执行计划业务类型', 'planbusinesstype', '执行计划业务类型', 'CI自动化测试', '2021-04-20 17:24:48', '2021-09-24 16:09:10');
INSERT INTO `dictionary` VALUES ('55', '环境部署内容', 'machinedeploy', '数据库', 'pgsql', '2020-11-06 15:43:36', '2021-09-24 16:09:08');
INSERT INTO `dictionary` VALUES ('56', '钉钉通知', 'DingDing', 'DingDingToken', '111', '2022-03-04 15:17:07', '2022-06-07 19:33:41');
INSERT INTO `dictionary` VALUES ('57', '邮件通知', 'Mail', 'MailInfo', 'qq.smtp.qq.com,465,from@qq.com,mail,pass', '2022-03-04 16:16:04', '2022-03-04 16:16:04');
INSERT INTO `dictionary` VALUES ('58', 'api请求格式', 'requestcontentype', '请求数据格式', 'TEXT', '2020-11-10 08:43:55', '2021-09-24 16:09:15');
INSERT INTO `dictionary` VALUES ('59', 'api请求格式', 'requestcontentype', '请求数据格式', 'XML', '2020-11-10 08:43:55', '2021-09-24 16:09:15');

-- ----------------------------
-- Table structure for dispatch
-- ----------------------------
DROP TABLE IF EXISTS `dispatch`;
CREATE TABLE `dispatch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `execplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划Id',
  `execplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次Id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次名',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机Id',
  `slavername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行机名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `testcasename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `casejmxname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'jmeter-class',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务',
  `expect` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'jmeter-class',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '待分配，已分配，已结束，调度异常',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `plantype` varchar(20) DEFAULT NULL COMMENT '计划类型',
  `threadnum` bigint(20) DEFAULT NULL COMMENT '线程数',
  `loops` bigint(20) DEFAULT NULL COMMENT '循环数',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `sceneid` bigint(20) unsigned NOT NULL COMMENT '场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  `caseorder` bigint(20) unsigned DEFAULT NULL COMMENT '用例顺序',
  `stopflag` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '无' COMMENT '断言失败处理标志',
  `projectid` bigint(20) unsigned NOT NULL COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度表';

-- ----------------------------
-- Records of dispatch
-- ----------------------------

-- ----------------------------
-- Table structure for enviroment
-- ----------------------------
DROP TABLE IF EXISTS `enviroment`;
CREATE TABLE `enviroment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `envtype` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境类型',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境表';

-- ----------------------------
-- Records of enviroment
-- ----------------------------

-- ----------------------------
-- Table structure for enviromentvariables
-- ----------------------------
DROP TABLE IF EXISTS `enviromentvariables`;
CREATE TABLE `enviromentvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'key名',
  `variablesvalue` text,
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境id',
  `envname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境变量';

-- ----------------------------
-- Records of enviromentvariables
-- ----------------------------

-- ----------------------------
-- Table structure for enviroment_assemble
-- ----------------------------
DROP TABLE IF EXISTS `enviroment_assemble`;
CREATE TABLE `enviroment_assemble` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `assemblename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境组件名',
  `assembletype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'mysql，oracle，redis',
  `connectstr` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '连接字',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '环境描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境组件表';

-- ----------------------------
-- Records of enviroment_assemble
-- ----------------------------

-- ----------------------------
-- Table structure for envmachine
-- ----------------------------
DROP TABLE IF EXISTS `envmachine`;
CREATE TABLE `envmachine` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `machineid` bigint(20) unsigned NOT NULL COMMENT '服务器Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='环境服务器表';

-- ----------------------------
-- Records of envmachine
-- ----------------------------

-- ----------------------------
-- Table structure for executeplan
-- ----------------------------
DROP TABLE IF EXISTS `executeplan`;
CREATE TABLE `executeplan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行计划Id',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `executeplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行计划名',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态，new，waiting，running，pause，finish',
  `usetype` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行类型，function，performance，来区分分配什么slaver',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `businesstype` varchar(80) DEFAULT NULL COMMENT '业务类型，常规测试，CI自动化测试',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `runmode` varchar(20) DEFAULT NULL COMMENT '运行模式，单机运行，多机并发',
  `dingdingtoken` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '通知钉钉token',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `casecounts` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用例数量',
  `scenenums` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '场景数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='执行计划表';

-- ----------------------------
-- Records of executeplan
-- ----------------------------

-- ----------------------------
-- Table structure for executeplanbatch
-- ----------------------------
DROP TABLE IF EXISTS `executeplanbatch`;
CREATE TABLE `executeplanbatch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行计划Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `status` varchar(10) DEFAULT NULL COMMENT '状态，new，waiting，running，pause，finish',
  `source` varchar(10) DEFAULT NULL COMMENT '来源，平台，ci,其他',
  `executeplanname` varchar(100) DEFAULT NULL COMMENT '计划名',
  `exectype` varchar(20) DEFAULT NULL COMMENT '执行类型，立即，某天定时，每天定时',
  `execdate` varchar(20) DEFAULT NULL COMMENT '执行时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `sceneid` bigint(20) unsigned NOT NULL COMMENT '场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  `slaverid` bigint(20) unsigned DEFAULT '0' COMMENT 'slaverid',
  `memo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='执行计划表';

-- ----------------------------
-- Records of executeplanbatch
-- ----------------------------

-- ----------------------------
-- Table structure for executeplan_params
-- ----------------------------
DROP TABLE IF EXISTS `executeplan_params`;
CREATE TABLE `executeplan_params` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `paramstype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '参数类型',
  `keyname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Key',
  `keyvalue` text,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试集合全局参数表';

-- ----------------------------
-- Records of executeplan_params
-- ----------------------------

-- ----------------------------
-- Table structure for executeplan_testcase
-- ----------------------------
DROP TABLE IF EXISTS `executeplan_testcase`;
CREATE TABLE `executeplan_testcase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '微服务',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'API名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用例名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `caseorder` bigint(20) unsigned DEFAULT NULL COMMENT '用例顺序',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='执行计划用例表';

-- ----------------------------
-- Records of executeplan_testcase
-- ----------------------------

-- ----------------------------
-- Table structure for globalheader
-- ----------------------------
DROP TABLE IF EXISTS `globalheader`;
CREATE TABLE `globalheader` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `globalheadername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '全局header名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全局Header';

-- ----------------------------
-- Records of globalheader
-- ----------------------------

-- ----------------------------
-- Table structure for globalheaderuse
-- ----------------------------
DROP TABLE IF EXISTS `globalheaderuse`;
CREATE TABLE `globalheaderuse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `globalheaderid` bigint(20) unsigned NOT NULL COMMENT 'globalheaderId',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '集合Id',
  `globalheadername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '全局header名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='集合全局Header';

-- ----------------------------
-- Records of globalheaderuse
-- ----------------------------

-- ----------------------------
-- Table structure for globalheader_params
-- ----------------------------
DROP TABLE IF EXISTS `globalheader_params`;
CREATE TABLE `globalheader_params` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `globalheaderid` bigint(20) unsigned NOT NULL COMMENT 'globalheaderId',
  `keyname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'key名',
  `keyvalue` text,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全局Header参数';

-- ----------------------------
-- Records of globalheader_params
-- ----------------------------

-- ----------------------------
-- Table structure for globalvariables
-- ----------------------------
DROP TABLE IF EXISTS `globalvariables`;
CREATE TABLE `globalvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `keyname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'key名',
  `keyvalue` text,
  `memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全局变量';

-- ----------------------------
-- Records of globalvariables
-- ----------------------------

-- ----------------------------
-- Table structure for macdepunit
-- ----------------------------
DROP TABLE IF EXISTS `macdepunit`;
CREATE TABLE `macdepunit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `depunitid` bigint(20) unsigned DEFAULT NULL COMMENT '微服务Id',
  `assembleid` bigint(20) unsigned DEFAULT NULL COMMENT '组件Id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务名',
  `assembletype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件类型',
  `machineid` bigint(20) unsigned NOT NULL COMMENT '服务器Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `envid` bigint(20) unsigned NOT NULL COMMENT '环境Id',
  `enviromentname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '环境名',
  `visittype` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '访问方式，ip,域名',
  `domain` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '服务域名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务器微服务表';

-- ----------------------------
-- Records of macdepunit
-- ----------------------------

-- ----------------------------
-- Table structure for machine
-- ----------------------------
DROP TABLE IF EXISTS `machine`;
CREATE TABLE `machine` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `machinename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `cpu` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cpu',
  `disk` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'disk',
  `mem` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内存',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务器表';

-- ----------------------------
-- Records of machine
-- ----------------------------

-- ----------------------------
-- Table structure for mockapi
-- ----------------------------
DROP TABLE IF EXISTS `mockapi`;
CREATE TABLE `mockapi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `modelid` bigint(20) unsigned NOT NULL COMMENT '模块Id',
  `modelname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口',
  `apiurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'url',
  `apitype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口类型',
  `requesttype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型',
  `timeout` bigint(20) unsigned NOT NULL COMMENT '超时',
  `memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mock接口表';

-- ----------------------------
-- Records of mockapi
-- ----------------------------

-- ----------------------------
-- Table structure for mockapirespone
-- ----------------------------
DROP TABLE IF EXISTS `mockapirespone`;
CREATE TABLE `mockapirespone` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT '接口Id',
  `responecode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口',
  `responecontent` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '响应内容',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mock接口响应表';

-- ----------------------------
-- Records of mockapirespone
-- ----------------------------

-- ----------------------------
-- Table structure for mockmodel
-- ----------------------------
DROP TABLE IF EXISTS `mockmodel`;
CREATE TABLE `mockmodel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `modelcode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块编码',
  `modelname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mock模块表';

-- ----------------------------
-- Records of mockmodel
-- ----------------------------

-- ----------------------------
-- Table structure for performancereportfilelog
-- ----------------------------
DROP TABLE IF EXISTS `performancereportfilelog`;
CREATE TABLE `performancereportfilelog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `execplanid` bigint(20) unsigned NOT NULL COMMENT 'execplanid',
  `batchid` bigint(20) unsigned NOT NULL COMMENT 'batchid',
  `caseid` bigint(20) unsigned NOT NULL COMMENT 'caseid',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT 'slaverid',
  `filename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件名，planid+batchid+slaverid',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='性能报告文件记录表';

-- ----------------------------
-- Records of performancereportfilelog
-- ----------------------------

-- ----------------------------
-- Table structure for performancereportsource
-- ----------------------------
DROP TABLE IF EXISTS `performancereportsource`;
CREATE TABLE `performancereportsource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '环境Id',
  `planid` bigint(20) unsigned NOT NULL COMMENT '执行计划Id',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次Id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT '执行机Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `testclass` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '解析文件匹配sample',
  `runtime` double(11,2) NOT NULL COMMENT '运行时长',
  `source` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '解析文件目录',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '待解析，已解析',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `totalcasenums` bigint(20) unsigned NOT NULL COMMENT '用例数',
  `totalcasepassnums` bigint(20) unsigned NOT NULL COMMENT '用例成功数',
  `totalcasefailnums` bigint(20) unsigned NOT NULL COMMENT '用例失败数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='性能报告路径表';

-- ----------------------------
-- Records of performancereportsource
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限Id',
  `resource` varchar(256) NOT NULL COMMENT '权限对应的资源',
  `code` varchar(256) NOT NULL COMMENT '权限的代码/通配符,对应代码中@hasAuthority(xx)',
  `handle` varchar(256) NOT NULL COMMENT '对应的资源操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '账号', 'account:list', '列表');
INSERT INTO `permission` VALUES ('2', '账号', 'account:detail', '详情');
INSERT INTO `permission` VALUES ('3', '账号', 'account:add', '添加');
INSERT INTO `permission` VALUES ('4', '账号', 'account:update', '更新');
INSERT INTO `permission` VALUES ('5', '账号', 'account:delete', '删除');
INSERT INTO `permission` VALUES ('6', '账号', 'account:search', '搜索');
INSERT INTO `permission` VALUES ('7', '角色', 'role:list', '列表');
INSERT INTO `permission` VALUES ('8', '角色', 'role:detail', '详情');
INSERT INTO `permission` VALUES ('9', '角色', 'role:add', '添加');
INSERT INTO `permission` VALUES ('10', '角色', 'role:update', '更新');
INSERT INTO `permission` VALUES ('11', '角色', 'role:delete', '删除');
INSERT INTO `permission` VALUES ('12', '角色', 'role:search', '搜索');
INSERT INTO `permission` VALUES ('13', '测试表', 'table:list', '列表');
INSERT INTO `permission` VALUES ('14', '字典', 'dictionary:list', '列表');
INSERT INTO `permission` VALUES ('15', '字典', 'dictionary:add', '添加');
INSERT INTO `permission` VALUES ('16', '字典', 'dictionary:search', '搜索');
INSERT INTO `permission` VALUES ('17', '字典', 'dictionary:update', '修改');
INSERT INTO `permission` VALUES ('18', '字典', 'dictionary:delete', '删除');
INSERT INTO `permission` VALUES ('19', '微服务', 'depunit:list', '列表');
INSERT INTO `permission` VALUES ('20', '微服务', 'depunit:detail', '详情');
INSERT INTO `permission` VALUES ('21', '微服务', 'depunit:add', '添加');
INSERT INTO `permission` VALUES ('22', '微服务', 'depunit:update', '更新');
INSERT INTO `permission` VALUES ('23', '微服务', 'depunit:delete', '删除');
INSERT INTO `permission` VALUES ('24', '微服务', 'depunit:search', '搜索');
INSERT INTO `permission` VALUES ('25', '测试环境', 'enviroment:list', '列表');
INSERT INTO `permission` VALUES ('26', '测试环境', 'enviroment:detail', '详情');
INSERT INTO `permission` VALUES ('27', '测试环境', 'enviroment:add', '添加');
INSERT INTO `permission` VALUES ('28', '测试环境', 'enviroment:update', '更新');
INSERT INTO `permission` VALUES ('29', '测试环境', 'enviroment:delete', '删除');
INSERT INTO `permission` VALUES ('30', '测试环境', 'enviroment:search', '搜索');
INSERT INTO `permission` VALUES ('31', '服务器', 'machine:list', '列表');
INSERT INTO `permission` VALUES ('32', '服务器', 'machine:detail', '详情');
INSERT INTO `permission` VALUES ('33', '服务器', 'machine:add', '添加');
INSERT INTO `permission` VALUES ('34', '服务器', 'machine:update', '更新');
INSERT INTO `permission` VALUES ('35', '服务器', 'machine:delete', '删除');
INSERT INTO `permission` VALUES ('36', '服务器', 'machine:search', '搜索');
INSERT INTO `permission` VALUES ('37', '测试人员', 'tester:list', '列表');
INSERT INTO `permission` VALUES ('38', '测试人员', 'tester:detail', '详情');
INSERT INTO `permission` VALUES ('39', '测试人员', 'tester:add', '添加');
INSERT INTO `permission` VALUES ('40', '测试人员', 'tester:update', '更新');
INSERT INTO `permission` VALUES ('41', '测试人员', 'tester:delete', '删除');
INSERT INTO `permission` VALUES ('42', '测试人员', 'tester:search', '搜索');
INSERT INTO `permission` VALUES ('43', 'api', 'api:list', '列表');
INSERT INTO `permission` VALUES ('44', 'api', 'api:detail', '详情');
INSERT INTO `permission` VALUES ('45', 'api', 'api:add', '添加');
INSERT INTO `permission` VALUES ('46', 'api', 'api:update', '更新');
INSERT INTO `permission` VALUES ('47', 'api', 'api:delete', '删除');
INSERT INTO `permission` VALUES ('48', 'api', 'api:search', '搜索');
INSERT INTO `permission` VALUES ('49', 'api参数', 'apiparams:list', '列表');
INSERT INTO `permission` VALUES ('50', 'api参数', 'apiparams:detail', '详情');
INSERT INTO `permission` VALUES ('51', 'api参数', 'apiparams:add', '添加');
INSERT INTO `permission` VALUES ('52', 'api参数', 'apiparams:update', '更新');
INSERT INTO `permission` VALUES ('53', 'api参数', 'apiparams:delete', '删除');
INSERT INTO `permission` VALUES ('54', 'api参数', 'apiparams:search', '搜索');
INSERT INTO `permission` VALUES ('55', '环境服务器', 'envmachine:list', '列表');
INSERT INTO `permission` VALUES ('56', '环境服务器', 'envmachine:detail', '详情');
INSERT INTO `permission` VALUES ('57', '环境服务器', 'envmachine:add', '添加');
INSERT INTO `permission` VALUES ('58', '环境服务器', 'envmachine:update', '更新');
INSERT INTO `permission` VALUES ('59', '环境服务器', 'envmachine:delete', '删除');
INSERT INTO `permission` VALUES ('60', '环境服务器', 'envmachine:search', '搜索');
INSERT INTO `permission` VALUES ('61', '服务器微服务', 'macdepunit:list', '列表');
INSERT INTO `permission` VALUES ('62', '服务器微服务', 'macdepunit:detail', '详情');
INSERT INTO `permission` VALUES ('63', '服务器微服务', 'macdepunit:add', '添加');
INSERT INTO `permission` VALUES ('64', '服务器微服务', 'macdepunit:update', '更新');
INSERT INTO `permission` VALUES ('65', '服务器微服务', 'macdepunit:delete', '删除');
INSERT INTO `permission` VALUES ('66', '服务器微服务', 'macdepunit:search', '搜索');
INSERT INTO `permission` VALUES ('67', 'API用例库', 'apicases:list', '列表');
INSERT INTO `permission` VALUES ('68', 'API用例库', 'apicases:detail', '详情');
INSERT INTO `permission` VALUES ('69', 'API用例库', 'apicases:add', '增加');
INSERT INTO `permission` VALUES ('70', 'API用例库', 'apicases:update', '更新');
INSERT INTO `permission` VALUES ('71', 'API用例库', 'apicases:delete', '删除');
INSERT INTO `permission` VALUES ('72', 'API用例库', 'apicases:search', '查询');
INSERT INTO `permission` VALUES ('73', '执行机', 'slaver:list', '列表');
INSERT INTO `permission` VALUES ('74', '执行机', 'slaver:detail', '详情');
INSERT INTO `permission` VALUES ('75', '执行机', 'slaver:add', '增加');
INSERT INTO `permission` VALUES ('76', '执行机', 'slaver:update', '更新');
INSERT INTO `permission` VALUES ('77', '执行机', 'slaver:delete', '删除');
INSERT INTO `permission` VALUES ('78', '执行机', 'slaver:search', '查询');
INSERT INTO `permission` VALUES ('79', '执行计划', 'executeplan:list', '列表');
INSERT INTO `permission` VALUES ('80', '执行计划', 'executeplan:detail', '详情');
INSERT INTO `permission` VALUES ('81', '执行计划', 'executeplan:add', '增加');
INSERT INTO `permission` VALUES ('82', '执行计划', 'executeplan:update', '更新');
INSERT INTO `permission` VALUES ('83', '执行计划', 'executeplan:delete', '删除');
INSERT INTO `permission` VALUES ('84', '执行计划', 'executeplan:search', '查询');
INSERT INTO `permission` VALUES ('85', 'api报告', 'apireport:list', '列表');
INSERT INTO `permission` VALUES ('86', 'api报告', 'apireport:detail', '详情');
INSERT INTO `permission` VALUES ('87', 'api报告', 'apireport:add', '增加');
INSERT INTO `permission` VALUES ('88', 'api报告', 'apireport:update', '更新');
INSERT INTO `permission` VALUES ('89', 'api报告', 'apireport:delete', '删除');
INSERT INTO `permission` VALUES ('90', 'api报告', 'apireport:search', '查询');
INSERT INTO `permission` VALUES ('91', 'API用例库', 'apicases:params', '参数');
INSERT INTO `permission` VALUES ('92', '用例前后条件', 'apicases_condition:list', '列表');
INSERT INTO `permission` VALUES ('93', '用例前后条件', 'apicases_condition:detail', '详情');
INSERT INTO `permission` VALUES ('94', '用例前后条件', 'apicases_condition:add', '增加');
INSERT INTO `permission` VALUES ('95', '用例前后条件', 'apicases_condition:update', '更新');
INSERT INTO `permission` VALUES ('96', '用例前后条件', 'apicases_condition:delete', '删除');
INSERT INTO `permission` VALUES ('97', '用例前后条件', 'apicases_condition:search', '查询');
INSERT INTO `permission` VALUES ('98', '环境组件', 'enviroment_assemble:list', '列表');
INSERT INTO `permission` VALUES ('99', '环境组件', 'enviroment_assemble:detail', '详情');
INSERT INTO `permission` VALUES ('100', '环境组件', 'enviroment_assemble:add', '增加');
INSERT INTO `permission` VALUES ('101', '环境组件', 'enviroment_assemble:update', '更新');
INSERT INTO `permission` VALUES ('102', '环境组件', 'enviroment_assemble:delete', '删除');
INSERT INTO `permission` VALUES ('103', '环境组件', 'enviroment_assemble:search', '查询');
INSERT INTO `permission` VALUES ('104', '调度', 'dispatch:list', '列表');
INSERT INTO `permission` VALUES ('105', '调度', 'dispatch:detail', '详情');
INSERT INTO `permission` VALUES ('106', '调度', 'dispatch:add', '增加');
INSERT INTO `permission` VALUES ('107', '调度', 'dispatch:update', '更新');
INSERT INTO `permission` VALUES ('108', '调度', 'dispatch:delete', '删除');
INSERT INTO `permission` VALUES ('109', '调度', 'dispatch:search', '查询');
INSERT INTO `permission` VALUES ('110', '性能报告', 'apiperformancereport:list', '列表');
INSERT INTO `permission` VALUES ('111', '性能报告', 'apiperformancereport:detail', '列表');
INSERT INTO `permission` VALUES ('112', '性能报告', 'apiperformancereport:add', '列表');
INSERT INTO `permission` VALUES ('113', '性能报告', 'apiperformancereport:update', '列表');
INSERT INTO `permission` VALUES ('114', '性能报告', 'apiperformancereport:delete', '列表');
INSERT INTO `permission` VALUES ('115', '性能报告', 'apiperformancereport:search', '列表');
INSERT INTO `permission` VALUES ('116', '性能报告', 'apiperformancestatistics:list', '列表');
INSERT INTO `permission` VALUES ('117', '性能报告', 'apiperformancestatistics:detail', '详情');
INSERT INTO `permission` VALUES ('118', '性能报告', 'apiperformancestatistics:add', '增加');
INSERT INTO `permission` VALUES ('119', '性能报告', 'apiperformancestatistics:update', '更新');
INSERT INTO `permission` VALUES ('120', '性能报告', 'apiperformancestatistics:delete', '删除');
INSERT INTO `permission` VALUES ('121', '性能报告', 'apiperformancestatistics:search', '查询');
INSERT INTO `permission` VALUES ('122', '功能报告统计', 'apireportstatics:list', '列表');
INSERT INTO `permission` VALUES ('123', '功能报告统计', 'apireportstatics:search', '查询');
INSERT INTO `permission` VALUES ('124', '执行计划批次', 'executeplanbatch:list', '列表');
INSERT INTO `permission` VALUES ('125', '执行计划批次', 'executeplanbatch:detail', '详情');
INSERT INTO `permission` VALUES ('126', '执行计划批次', 'executeplanbatch:add', '增加');
INSERT INTO `permission` VALUES ('127', '执行计划批次', 'executeplanbatch:update', '更新');
INSERT INTO `permission` VALUES ('128', '执行计划批次', 'executeplanbatch:delete', '删除');
INSERT INTO `permission` VALUES ('129', '执行计划批次', 'executeplanbatch:search', '查询');
INSERT INTO `permission` VALUES ('130', '条件管理', 'condition:list', '列表');
INSERT INTO `permission` VALUES ('131', '条件管理', 'condition:search', '查询');
INSERT INTO `permission` VALUES ('132', '条件管理', 'condition:add', '增加');
INSERT INTO `permission` VALUES ('133', '条件管理', 'condition:detail', '详情');
INSERT INTO `permission` VALUES ('134', '条件管理', 'condition:update', '更新');
INSERT INTO `permission` VALUES ('135', '条件管理', 'condition:delete', '删除');
INSERT INTO `permission` VALUES ('136', 'api条件', 'apicondition:list', '列表');
INSERT INTO `permission` VALUES ('137', 'api条件', 'apicondition:search', '查询');
INSERT INTO `permission` VALUES ('138', 'api条件', 'apicondition:add', '增加');
INSERT INTO `permission` VALUES ('139', 'api条件', 'apicondition:detail', '详情');
INSERT INTO `permission` VALUES ('140', 'api条件', 'apicondition:update', '更新');
INSERT INTO `permission` VALUES ('141', 'api条件', 'apicondition:delete', '删除');
INSERT INTO `permission` VALUES ('142', '变量管理', 'testvariables:list', '列表');
INSERT INTO `permission` VALUES ('143', '变量管理', 'testvariables:search', '查询');
INSERT INTO `permission` VALUES ('144', '变量管理', 'testvariables:add', '增加');
INSERT INTO `permission` VALUES ('145', '变量管理', 'testvariables:detail', '详情');
INSERT INTO `permission` VALUES ('146', '变量管理', 'testvariables:update', '更新');
INSERT INTO `permission` VALUES ('147', '变量管理', 'testvariables:delete', '删除');
INSERT INTO `permission` VALUES ('148', '用例变量', 'ApicasesVariables:list', '列表');
INSERT INTO `permission` VALUES ('149', '用例变量', 'ApicasesVariables:search', '查询');
INSERT INTO `permission` VALUES ('150', '用例变量', 'ApicasesVariables:add', '增加');
INSERT INTO `permission` VALUES ('151', '用例变量', 'ApicasesVariables:detail', '详情');
INSERT INTO `permission` VALUES ('152', '用例变量', 'ApicasesVariables:update', '更新');
INSERT INTO `permission` VALUES ('153', '用例变量', 'ApicasesVariables:delete', '删除');
INSERT INTO `permission` VALUES ('154', '变量值', 'testvariablesvalue:list', '列表');
INSERT INTO `permission` VALUES ('155', '变量值', 'testvariablesvalue:search', '查询');
INSERT INTO `permission` VALUES ('156', '变量值', 'testvariablesvalue:add', '增加');
INSERT INTO `permission` VALUES ('157', '变量值', 'testvariablesvalue:detail', '详情');
INSERT INTO `permission` VALUES ('158', '变量值', 'testvariablesvalue:update', '更新');
INSERT INTO `permission` VALUES ('159', '变量值', 'testvariablesvalue:delete', '删除');
INSERT INTO `permission` VALUES ('160', '条件报告', 'testconditionreport:list', '列表');
INSERT INTO `permission` VALUES ('161', '条件报告', 'testconditionreport:search', '查询');
INSERT INTO `permission` VALUES ('162', '条件报告', 'testconditionreport:add', '增加');
INSERT INTO `permission` VALUES ('163', '条件报告', 'testconditionreport:detail', '详情');
INSERT INTO `permission` VALUES ('164', '条件报告', 'testconditionreport:update', '更新');
INSERT INTO `permission` VALUES ('165', '条件报告', 'testconditionreport:delete', '删除');
INSERT INTO `permission` VALUES ('166', '脚本条件', 'scriptcondition:list', '列表');
INSERT INTO `permission` VALUES ('167', '脚本条件', 'scriptcondition:detail', '详情');
INSERT INTO `permission` VALUES ('168', '脚本条件', 'scriptcondition:add', '添加');
INSERT INTO `permission` VALUES ('169', '脚本条件', 'scriptcondition:update', '更新');
INSERT INTO `permission` VALUES ('170', '脚本条件', 'scriptcondition:delete', '删除');
INSERT INTO `permission` VALUES ('171', '脚本条件', 'scriptcondition:search', '搜索');
INSERT INTO `permission` VALUES ('172', '数据库条件', 'dbcondition:list', '列表');
INSERT INTO `permission` VALUES ('173', '数据库条件', 'dbcondition:detail', '详情');
INSERT INTO `permission` VALUES ('174', '数据库条件', 'dbcondition:add', '添加');
INSERT INTO `permission` VALUES ('175', '数据库条件', 'dbcondition:update', '更新');
INSERT INTO `permission` VALUES ('176', '数据库条件', 'dbcondition:delete', '删除');
INSERT INTO `permission` VALUES ('177', '数据库条件', 'dbcondition:search', '搜索');
INSERT INTO `permission` VALUES ('178', '条件顺序', 'conditionorder:list', '列表');
INSERT INTO `permission` VALUES ('179', '条件顺序', 'conditionorder:detail', '详情');
INSERT INTO `permission` VALUES ('180', '条件顺序', 'conditionorder:add', '添加');
INSERT INTO `permission` VALUES ('181', '条件顺序', 'conditionorder:moveup', '上移');
INSERT INTO `permission` VALUES ('182', '条件顺序', 'conditionorder:movedown', '下移');
INSERT INTO `permission` VALUES ('183', '条件顺序', 'conditionorder:search', '搜索');
INSERT INTO `permission` VALUES ('185', '随机变量', 'variables:list', '列表');
INSERT INTO `permission` VALUES ('186', '随机变量', 'variables:detail', '详情');
INSERT INTO `permission` VALUES ('187', '随机变量', 'variables:update', '修改');
INSERT INTO `permission` VALUES ('188', '随机变量', 'variables:delete', '删除');
INSERT INTO `permission` VALUES ('189', '随机变量', 'variables:add', '添加');
INSERT INTO `permission` VALUES ('190', '随机变量', 'variables:search', '搜索');
INSERT INTO `permission` VALUES ('191', '数据库变量', 'dbvariables:search', '搜索');
INSERT INTO `permission` VALUES ('192', '数据库变量', 'dbvariables:add', '添加');
INSERT INTO `permission` VALUES ('193', '数据库变量', 'dbvariables:delete', '删除');
INSERT INTO `permission` VALUES ('194', '数据库变量', 'dbvariables:update', '更新');
INSERT INTO `permission` VALUES ('195', '数据库变量', 'dbvariables:detail', '修改');
INSERT INTO `permission` VALUES ('196', '数据库变量', 'dbvariables:list', '查询');
INSERT INTO `permission` VALUES ('197', '项目迭代', 'project:search', '搜索');
INSERT INTO `permission` VALUES ('198', '项目迭代', 'project:add', '添加');
INSERT INTO `permission` VALUES ('199', '项目迭代', 'project:delete', '删除');
INSERT INTO `permission` VALUES ('200', '项目迭代', 'project:update', '更新');
INSERT INTO `permission` VALUES ('201', '项目迭代', 'project:detail', '修改');
INSERT INTO `permission` VALUES ('202', '项目迭代', 'project:list', '查询');
INSERT INTO `permission` VALUES ('203', '延时子条件', 'delaycondition:search', '搜索');
INSERT INTO `permission` VALUES ('204', '延时子条件', 'delaycondition:add', '添加');
INSERT INTO `permission` VALUES ('205', '延时子条件', 'delaycondition:delete', '删除');
INSERT INTO `permission` VALUES ('206', '延时子条件', 'delaycondition:update', '更新');
INSERT INTO `permission` VALUES ('207', '延时子条件', 'delaycondition:detail', '修改');
INSERT INTO `permission` VALUES ('208', '延时子条件', 'delaycondition:list', '查询');
INSERT INTO `permission` VALUES ('209', '脚本变量', 'scriptvariables:search', '搜索');
INSERT INTO `permission` VALUES ('210', '脚本变量', 'scriptvariables:add', '添加');
INSERT INTO `permission` VALUES ('211', '脚本变量', 'scriptvariables:delete', '删除');
INSERT INTO `permission` VALUES ('212', '脚本变量', 'scriptvariables:update', '更新');
INSERT INTO `permission` VALUES ('213', '脚本变量', 'scriptvariables:detail', '修改');
INSERT INTO `permission` VALUES ('214', '脚本变量', 'scriptvariables:list', '查询');
INSERT INTO `permission` VALUES ('215', '流程用例', 'processtestcase:search', '搜索');
INSERT INTO `permission` VALUES ('216', '流程用例', 'processtestcase:add', '添加');
INSERT INTO `permission` VALUES ('217', '流程用例', 'processtestcase:delete', '删除');
INSERT INTO `permission` VALUES ('218', '流程用例', 'processtestcase:update', '更新');
INSERT INTO `permission` VALUES ('219', '流程用例', 'processtestcase:detail', '修改');
INSERT INTO `permission` VALUES ('220', '流程用例', 'processtestcase:list', '查询');
INSERT INTO `permission` VALUES ('221', '全局Header', 'globalheader:search', '搜索');
INSERT INTO `permission` VALUES ('222', '全局Header', 'globalheader:add', '添加');
INSERT INTO `permission` VALUES ('223', '全局Header', 'globalheader:delete', '删除');
INSERT INTO `permission` VALUES ('224', '全局Header', 'globalheader:update', '更新');
INSERT INTO `permission` VALUES ('225', '全局Header', 'globalheader:detail', '修改');
INSERT INTO `permission` VALUES ('226', '全局Header', 'globalheader:list', '查询');
INSERT INTO `permission` VALUES ('227', '全局变量', 'globalvariables:search', '搜索');
INSERT INTO `permission` VALUES ('228', '全局变量', 'globalvariables:add', '添加');
INSERT INTO `permission` VALUES ('229', '全局变量', 'globalvariables:delete', '删除');
INSERT INTO `permission` VALUES ('230', '全局变量', 'globalvariables:update', '更新');
INSERT INTO `permission` VALUES ('231', '全局变量', 'globalvariables:detail', '修改');
INSERT INTO `permission` VALUES ('232', '全局变量', 'globalvariables:list', '查询');
INSERT INTO `permission` VALUES ('233', 'mock模块', 'mockmodel:search', '搜索');
INSERT INTO `permission` VALUES ('234', 'mock模块', 'mockmodel:add', '添加');
INSERT INTO `permission` VALUES ('235', 'mock模块', 'mockmodel:delete', '删除');
INSERT INTO `permission` VALUES ('236', 'mock模块', 'mockmodel:update', '更新');
INSERT INTO `permission` VALUES ('237', 'mock模块', 'mockmodel:detail', '修改');
INSERT INTO `permission` VALUES ('238', 'mock模块', 'mockmodel:list', '查询');
INSERT INTO `permission` VALUES ('239', 'mock接口', 'mockapi:search', '搜索');
INSERT INTO `permission` VALUES ('240', 'mock接口', 'mockapi:add', '添加');
INSERT INTO `permission` VALUES ('241', 'mock接口', 'mockapi:delete', '删除');
INSERT INTO `permission` VALUES ('242', 'mock接口', 'mockapi:update', '更新');
INSERT INTO `permission` VALUES ('243', 'mock接口', 'mockapi:detail', '修改');
INSERT INTO `permission` VALUES ('244', 'mock接口', 'mockapi:list', '查询');
INSERT INTO `permission` VALUES ('245', 'mock接口响应', 'mockapirespone:search', '搜索');
INSERT INTO `permission` VALUES ('246', 'mock接口响应', 'mockapirespone:add', '添加');
INSERT INTO `permission` VALUES ('247', 'mock接口响应', 'mockapirespone:delete', '删除');
INSERT INTO `permission` VALUES ('248', 'mock接口响应', 'mockapirespone:update', '更新');
INSERT INTO `permission` VALUES ('249', 'mock接口响应', 'mockapirespone:detail', '修改');
INSERT INTO `permission` VALUES ('250', 'mock接口响应', 'mockapirespone:list', '查询');
INSERT INTO `permission` VALUES ('251', 'API用例库', 'apicases:copy', '复制');
INSERT INTO `permission` VALUES ('252', 'API用例库', 'apicases:batchcopy', '批量复制');
INSERT INTO `permission` VALUES ('253', 'API用例库', 'apicases:batchdelete', '批量删除');
INSERT INTO `permission` VALUES ('254', 'API用例库', 'apicases:batchassert', '批量断言');
INSERT INTO `permission` VALUES ('255', '测试场景', 'testscene:search', '搜索');
INSERT INTO `permission` VALUES ('256', '测试场景', 'testscene:add', '添加');
INSERT INTO `permission` VALUES ('257', '测试场景', 'testscene:delete', '删除');
INSERT INTO `permission` VALUES ('258', '测试场景', 'testscene:update', '更新');
INSERT INTO `permission` VALUES ('259', '测试场景', 'testscene:detail', '修改');
INSERT INTO `permission` VALUES ('260', '测试场景', 'testscene:list', '查询');
INSERT INTO `permission` VALUES ('261', '测试场景', 'testscene:scenecondition', '场景前置条件');
INSERT INTO `permission` VALUES ('262', '测试场景', 'testscene:scenecasecondition', '用例前置条件');
INSERT INTO `permission` VALUES ('263', '测试场景', 'testscene:loadcase', '装载用例');
INSERT INTO `permission` VALUES ('264', '测试场景', 'testscene:deletecase', '删除用例');
INSERT INTO `permission` VALUES ('265', '测试场景', 'testscene:casedeleteapicondition', '删除用例接口前置条件');
INSERT INTO `permission` VALUES ('266', '测试场景', 'testscene:caseupdateapicondition', '修改用例接口前置条件');
INSERT INTO `permission` VALUES ('267', '测试场景', 'testscene:casedeletedbcondition', '删除用例数据库前置条件');
INSERT INTO `permission` VALUES ('268', '测试场景', 'testscene:caseupdatedbcondition', '修改用例数据库前置条件');
INSERT INTO `permission` VALUES ('269', '测试场景', 'testscene:casedeletescriptcondition', '删除用例脚本前置条件');
INSERT INTO `permission` VALUES ('270', '测试场景', 'testscene:caseupdatescriptcondition', '修改用例脚本前置条件');
INSERT INTO `permission` VALUES ('271', '测试场景', 'testscene:casedeletedelaycondition', '删除用例延时前置条件');
INSERT INTO `permission` VALUES ('272', '测试场景', 'testscene:caseupdatedelaycondition', '修改用例延时前置条件');
INSERT INTO `permission` VALUES ('273', '测试场景', 'testscene:scendeleteapicondition', '删除场景接口前置条件');
INSERT INTO `permission` VALUES ('274', '测试场景', 'testscene:scenupdateapicondition', '修改场景接口前置条件');
INSERT INTO `permission` VALUES ('275', '测试场景', 'testscene:scendeletedbcondition', '删除场景数据库前置条件');
INSERT INTO `permission` VALUES ('276', '测试场景', 'testscene:scenupdatedbcondition', '修改场景数据库前置条件');
INSERT INTO `permission` VALUES ('277', '测试场景', 'testscene:scendeletescriptcondition', '删除场景脚本前置条件');
INSERT INTO `permission` VALUES ('278', '测试场景', 'testscene:scenupdatescriptcondition', '修改场景脚本前置条件');
INSERT INTO `permission` VALUES ('279', '测试场景', 'testscene:scendeletedelaycondition', '删除场景延时前置条件');
INSERT INTO `permission` VALUES ('280', '测试场景', 'testscene:scenupdatedelaycondition', '修改场景延时前置条件');
INSERT INTO `permission` VALUES ('281', '环境变量', 'enviromentvariables:search', '查询');
INSERT INTO `permission` VALUES ('282', '环境变量', 'enviromentvariables:update', '修改');
INSERT INTO `permission` VALUES ('283', '环境变量', 'enviromentvariables:delete', '删除');
INSERT INTO `permission` VALUES ('284', '环境变量', 'enviromentvariables:list', '列表');
INSERT INTO `permission` VALUES ('285', '环境变量', 'enviromentvariables:add', '新增');
INSERT INTO `permission` VALUES ('286', '数据库断言', 'apicasesdbassert:search', '查询');
INSERT INTO `permission` VALUES ('287', '数据库断言', 'apicasesdbassert:update', '修改');
INSERT INTO `permission` VALUES ('288', '数据库断言', 'apicasesdbassert:delete', '删除');
INSERT INTO `permission` VALUES ('289', '数据库断言', 'apicasesdbassert:list', '列表');
INSERT INTO `permission` VALUES ('290', '数据库断言', 'apicasesdbassert:add', '新增');
INSERT INTO `permission` VALUES ('291', '数据库断言值', 'apicasesdbassertvalue:search', '查询');
INSERT INTO `permission` VALUES ('292', '数据库断言值', 'apicasesdbassertvalue:update', '修改');
INSERT INTO `permission` VALUES ('293', '数据库断言值', 'apicasesdbassertvalue:delete', '删除');
INSERT INTO `permission` VALUES ('294', '数据库断言值', 'apicasesdbassertvalue:list', '列表');
INSERT INTO `permission` VALUES ('295', '数据库断言值', 'apicasesdbassertvalue:add', '新增');
INSERT INTO `permission` VALUES ('296', '集合通知', 'plannmessage:search', '查询');
INSERT INTO `permission` VALUES ('297', '集合通知', 'plannmessage:update', '修改');
INSERT INTO `permission` VALUES ('298', '集合通知', 'plannmessage:delete', '删除');
INSERT INTO `permission` VALUES ('299', '集合通知', 'plannmessage:list', '列表');
INSERT INTO `permission` VALUES ('300', '集合通知', 'plannmessage:add', '新增');

-- ----------------------------
-- Table structure for planbantchexeclog
-- ----------------------------
DROP TABLE IF EXISTS `planbantchexeclog`;
CREATE TABLE `planbantchexeclog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `batchid` bigint(20) unsigned NOT NULL COMMENT '批次Id',
  `exec_time` varchar(20) DEFAULT NULL COMMENT '执行时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `memo` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='计划执行日志表';

-- ----------------------------
-- Records of planbantchexeclog
-- ----------------------------

-- ----------------------------
-- Table structure for plannmessage
-- ----------------------------
DROP TABLE IF EXISTS `plannmessage`;
CREATE TABLE `plannmessage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '集合id',
  `messagetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '通知类型',
  `hookcontent` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'hookurl',
  `mid` bigint(20) unsigned NOT NULL COMMENT '维护者id',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='集合通知';

-- ----------------------------
-- Records of plannmessage
-- ----------------------------

-- ----------------------------
-- Table structure for process_testcase
-- ----------------------------
DROP TABLE IF EXISTS `process_testcase`;
CREATE TABLE `process_testcase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `executeplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '微服务',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'API名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用例名',
  `ordernum` bigint(20) unsigned NOT NULL COMMENT '顺序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程用例表';

-- ----------------------------
-- Records of process_testcase
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目Id',
  `projectname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目名',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '项目状态',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '项目描述',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目迭代表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '演示项目', '开始', '2024-04-27 00:00:00', '2024-04-27 12:56:46', '这是一个演示项目。', 'admin', '2024-04-27 12:56:50', '2024-05-06 14:11:26');

-- ----------------------------
-- Table structure for project_account
-- ----------------------------
DROP TABLE IF EXISTS `project_account`;
CREATE TABLE `project_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `projectid` bigint(20) unsigned NOT NULL COMMENT '客户名',
  `accountid` bigint(20) unsigned NOT NULL COMMENT '手机号',
  `projectname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目名',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='项目成员表';

-- ----------------------------
-- Records of project_account
-- ----------------------------
INSERT INTO `project_account` VALUES ('1', '1', '2', '演示项目', 'test', 'test', '2024-05-06 14:31:47', '2024-05-06 14:31:47');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '2019-07-01 00:00:00', '2019-07-01 00:00:00');
INSERT INTO `role` VALUES ('2', '普通用户', '2019-07-01 00:00:00', '2022-07-28 16:38:09');
INSERT INTO `role` VALUES ('3', '测试', '2019-07-01 00:00:00', '2019-07-01 00:00:00');
INSERT INTO `role` VALUES ('4', '除去删除的全部权限', '2024-05-06 14:24:08', '2024-05-06 14:24:08');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色Id',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_fk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_fk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('2', '2');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('2', '4');
INSERT INTO `role_permission` VALUES ('2', '5');
INSERT INTO `role_permission` VALUES ('3', '5');
INSERT INTO `role_permission` VALUES ('2', '6');
INSERT INTO `role_permission` VALUES ('4', '7');
INSERT INTO `role_permission` VALUES ('4', '13');
INSERT INTO `role_permission` VALUES ('4', '14');
INSERT INTO `role_permission` VALUES ('4', '19');
INSERT INTO `role_permission` VALUES ('4', '20');
INSERT INTO `role_permission` VALUES ('4', '21');
INSERT INTO `role_permission` VALUES ('4', '22');
INSERT INTO `role_permission` VALUES ('4', '24');
INSERT INTO `role_permission` VALUES ('2', '25');
INSERT INTO `role_permission` VALUES ('4', '25');
INSERT INTO `role_permission` VALUES ('2', '26');
INSERT INTO `role_permission` VALUES ('4', '26');
INSERT INTO `role_permission` VALUES ('2', '27');
INSERT INTO `role_permission` VALUES ('4', '27');
INSERT INTO `role_permission` VALUES ('2', '28');
INSERT INTO `role_permission` VALUES ('4', '28');
INSERT INTO `role_permission` VALUES ('2', '29');
INSERT INTO `role_permission` VALUES ('2', '30');
INSERT INTO `role_permission` VALUES ('4', '30');
INSERT INTO `role_permission` VALUES ('2', '31');
INSERT INTO `role_permission` VALUES ('4', '31');
INSERT INTO `role_permission` VALUES ('2', '32');
INSERT INTO `role_permission` VALUES ('4', '32');
INSERT INTO `role_permission` VALUES ('2', '33');
INSERT INTO `role_permission` VALUES ('4', '33');
INSERT INTO `role_permission` VALUES ('2', '34');
INSERT INTO `role_permission` VALUES ('4', '34');
INSERT INTO `role_permission` VALUES ('2', '35');
INSERT INTO `role_permission` VALUES ('2', '36');
INSERT INTO `role_permission` VALUES ('4', '36');
INSERT INTO `role_permission` VALUES ('4', '37');
INSERT INTO `role_permission` VALUES ('4', '38');
INSERT INTO `role_permission` VALUES ('4', '39');
INSERT INTO `role_permission` VALUES ('4', '40');
INSERT INTO `role_permission` VALUES ('4', '42');
INSERT INTO `role_permission` VALUES ('4', '43');
INSERT INTO `role_permission` VALUES ('4', '44');
INSERT INTO `role_permission` VALUES ('4', '45');
INSERT INTO `role_permission` VALUES ('4', '46');
INSERT INTO `role_permission` VALUES ('4', '48');
INSERT INTO `role_permission` VALUES ('4', '49');
INSERT INTO `role_permission` VALUES ('4', '50');
INSERT INTO `role_permission` VALUES ('4', '51');
INSERT INTO `role_permission` VALUES ('4', '52');
INSERT INTO `role_permission` VALUES ('4', '54');
INSERT INTO `role_permission` VALUES ('4', '55');
INSERT INTO `role_permission` VALUES ('4', '56');
INSERT INTO `role_permission` VALUES ('4', '57');
INSERT INTO `role_permission` VALUES ('4', '58');
INSERT INTO `role_permission` VALUES ('4', '60');
INSERT INTO `role_permission` VALUES ('4', '61');
INSERT INTO `role_permission` VALUES ('4', '62');
INSERT INTO `role_permission` VALUES ('4', '63');
INSERT INTO `role_permission` VALUES ('4', '64');
INSERT INTO `role_permission` VALUES ('4', '66');
INSERT INTO `role_permission` VALUES ('4', '67');
INSERT INTO `role_permission` VALUES ('4', '68');
INSERT INTO `role_permission` VALUES ('4', '69');
INSERT INTO `role_permission` VALUES ('4', '70');
INSERT INTO `role_permission` VALUES ('4', '72');
INSERT INTO `role_permission` VALUES ('4', '73');
INSERT INTO `role_permission` VALUES ('4', '74');
INSERT INTO `role_permission` VALUES ('4', '75');
INSERT INTO `role_permission` VALUES ('4', '76');
INSERT INTO `role_permission` VALUES ('4', '78');
INSERT INTO `role_permission` VALUES ('4', '79');
INSERT INTO `role_permission` VALUES ('4', '80');
INSERT INTO `role_permission` VALUES ('4', '81');
INSERT INTO `role_permission` VALUES ('4', '82');
INSERT INTO `role_permission` VALUES ('4', '84');
INSERT INTO `role_permission` VALUES ('4', '85');
INSERT INTO `role_permission` VALUES ('4', '86');
INSERT INTO `role_permission` VALUES ('4', '87');
INSERT INTO `role_permission` VALUES ('4', '88');
INSERT INTO `role_permission` VALUES ('4', '90');
INSERT INTO `role_permission` VALUES ('4', '91');
INSERT INTO `role_permission` VALUES ('4', '92');
INSERT INTO `role_permission` VALUES ('4', '93');
INSERT INTO `role_permission` VALUES ('4', '94');
INSERT INTO `role_permission` VALUES ('4', '95');
INSERT INTO `role_permission` VALUES ('4', '97');
INSERT INTO `role_permission` VALUES ('4', '98');
INSERT INTO `role_permission` VALUES ('4', '99');
INSERT INTO `role_permission` VALUES ('4', '100');
INSERT INTO `role_permission` VALUES ('4', '101');
INSERT INTO `role_permission` VALUES ('4', '103');
INSERT INTO `role_permission` VALUES ('4', '104');
INSERT INTO `role_permission` VALUES ('4', '105');
INSERT INTO `role_permission` VALUES ('4', '106');
INSERT INTO `role_permission` VALUES ('4', '107');
INSERT INTO `role_permission` VALUES ('4', '109');
INSERT INTO `role_permission` VALUES ('4', '110');
INSERT INTO `role_permission` VALUES ('4', '111');
INSERT INTO `role_permission` VALUES ('4', '112');
INSERT INTO `role_permission` VALUES ('4', '113');
INSERT INTO `role_permission` VALUES ('4', '114');
INSERT INTO `role_permission` VALUES ('4', '115');
INSERT INTO `role_permission` VALUES ('4', '116');
INSERT INTO `role_permission` VALUES ('4', '117');
INSERT INTO `role_permission` VALUES ('4', '118');
INSERT INTO `role_permission` VALUES ('4', '119');
INSERT INTO `role_permission` VALUES ('4', '121');
INSERT INTO `role_permission` VALUES ('4', '122');
INSERT INTO `role_permission` VALUES ('4', '123');
INSERT INTO `role_permission` VALUES ('4', '124');
INSERT INTO `role_permission` VALUES ('4', '125');
INSERT INTO `role_permission` VALUES ('4', '126');
INSERT INTO `role_permission` VALUES ('4', '127');
INSERT INTO `role_permission` VALUES ('4', '129');
INSERT INTO `role_permission` VALUES ('4', '130');
INSERT INTO `role_permission` VALUES ('4', '131');
INSERT INTO `role_permission` VALUES ('4', '132');
INSERT INTO `role_permission` VALUES ('4', '133');
INSERT INTO `role_permission` VALUES ('4', '134');
INSERT INTO `role_permission` VALUES ('4', '136');
INSERT INTO `role_permission` VALUES ('4', '137');
INSERT INTO `role_permission` VALUES ('4', '138');
INSERT INTO `role_permission` VALUES ('4', '139');
INSERT INTO `role_permission` VALUES ('4', '140');
INSERT INTO `role_permission` VALUES ('4', '142');
INSERT INTO `role_permission` VALUES ('4', '143');
INSERT INTO `role_permission` VALUES ('4', '144');
INSERT INTO `role_permission` VALUES ('4', '145');
INSERT INTO `role_permission` VALUES ('4', '146');
INSERT INTO `role_permission` VALUES ('4', '148');
INSERT INTO `role_permission` VALUES ('4', '149');
INSERT INTO `role_permission` VALUES ('4', '150');
INSERT INTO `role_permission` VALUES ('4', '151');
INSERT INTO `role_permission` VALUES ('4', '152');
INSERT INTO `role_permission` VALUES ('4', '154');
INSERT INTO `role_permission` VALUES ('4', '155');
INSERT INTO `role_permission` VALUES ('4', '156');
INSERT INTO `role_permission` VALUES ('4', '157');
INSERT INTO `role_permission` VALUES ('4', '158');
INSERT INTO `role_permission` VALUES ('4', '160');
INSERT INTO `role_permission` VALUES ('4', '161');
INSERT INTO `role_permission` VALUES ('4', '162');
INSERT INTO `role_permission` VALUES ('4', '163');
INSERT INTO `role_permission` VALUES ('4', '164');
INSERT INTO `role_permission` VALUES ('4', '166');
INSERT INTO `role_permission` VALUES ('4', '167');
INSERT INTO `role_permission` VALUES ('4', '168');
INSERT INTO `role_permission` VALUES ('4', '169');
INSERT INTO `role_permission` VALUES ('4', '171');
INSERT INTO `role_permission` VALUES ('4', '172');
INSERT INTO `role_permission` VALUES ('4', '173');
INSERT INTO `role_permission` VALUES ('4', '174');
INSERT INTO `role_permission` VALUES ('4', '175');
INSERT INTO `role_permission` VALUES ('4', '177');
INSERT INTO `role_permission` VALUES ('4', '178');
INSERT INTO `role_permission` VALUES ('4', '179');
INSERT INTO `role_permission` VALUES ('4', '180');
INSERT INTO `role_permission` VALUES ('4', '181');
INSERT INTO `role_permission` VALUES ('4', '182');
INSERT INTO `role_permission` VALUES ('4', '183');
INSERT INTO `role_permission` VALUES ('4', '185');
INSERT INTO `role_permission` VALUES ('4', '186');
INSERT INTO `role_permission` VALUES ('4', '187');
INSERT INTO `role_permission` VALUES ('4', '189');
INSERT INTO `role_permission` VALUES ('4', '190');
INSERT INTO `role_permission` VALUES ('4', '191');
INSERT INTO `role_permission` VALUES ('4', '192');
INSERT INTO `role_permission` VALUES ('4', '194');
INSERT INTO `role_permission` VALUES ('4', '195');
INSERT INTO `role_permission` VALUES ('4', '196');
INSERT INTO `role_permission` VALUES ('4', '197');
INSERT INTO `role_permission` VALUES ('4', '198');
INSERT INTO `role_permission` VALUES ('4', '200');
INSERT INTO `role_permission` VALUES ('4', '201');
INSERT INTO `role_permission` VALUES ('4', '202');
INSERT INTO `role_permission` VALUES ('4', '203');
INSERT INTO `role_permission` VALUES ('4', '204');
INSERT INTO `role_permission` VALUES ('4', '206');
INSERT INTO `role_permission` VALUES ('4', '207');
INSERT INTO `role_permission` VALUES ('4', '208');
INSERT INTO `role_permission` VALUES ('4', '209');
INSERT INTO `role_permission` VALUES ('4', '210');
INSERT INTO `role_permission` VALUES ('4', '212');
INSERT INTO `role_permission` VALUES ('4', '213');
INSERT INTO `role_permission` VALUES ('4', '214');
INSERT INTO `role_permission` VALUES ('4', '215');
INSERT INTO `role_permission` VALUES ('4', '216');
INSERT INTO `role_permission` VALUES ('4', '218');
INSERT INTO `role_permission` VALUES ('4', '219');
INSERT INTO `role_permission` VALUES ('4', '220');
INSERT INTO `role_permission` VALUES ('4', '221');
INSERT INTO `role_permission` VALUES ('4', '222');
INSERT INTO `role_permission` VALUES ('4', '224');
INSERT INTO `role_permission` VALUES ('4', '225');
INSERT INTO `role_permission` VALUES ('4', '226');
INSERT INTO `role_permission` VALUES ('4', '227');
INSERT INTO `role_permission` VALUES ('4', '228');
INSERT INTO `role_permission` VALUES ('4', '230');
INSERT INTO `role_permission` VALUES ('4', '231');
INSERT INTO `role_permission` VALUES ('4', '232');
INSERT INTO `role_permission` VALUES ('4', '233');
INSERT INTO `role_permission` VALUES ('4', '234');
INSERT INTO `role_permission` VALUES ('4', '236');
INSERT INTO `role_permission` VALUES ('4', '237');
INSERT INTO `role_permission` VALUES ('4', '238');
INSERT INTO `role_permission` VALUES ('4', '239');
INSERT INTO `role_permission` VALUES ('4', '240');
INSERT INTO `role_permission` VALUES ('4', '242');
INSERT INTO `role_permission` VALUES ('4', '243');
INSERT INTO `role_permission` VALUES ('4', '244');
INSERT INTO `role_permission` VALUES ('4', '245');
INSERT INTO `role_permission` VALUES ('4', '246');
INSERT INTO `role_permission` VALUES ('4', '248');
INSERT INTO `role_permission` VALUES ('4', '249');
INSERT INTO `role_permission` VALUES ('4', '250');
INSERT INTO `role_permission` VALUES ('4', '251');
INSERT INTO `role_permission` VALUES ('4', '252');
INSERT INTO `role_permission` VALUES ('4', '254');
INSERT INTO `role_permission` VALUES ('4', '255');
INSERT INTO `role_permission` VALUES ('4', '256');
INSERT INTO `role_permission` VALUES ('4', '258');
INSERT INTO `role_permission` VALUES ('4', '259');
INSERT INTO `role_permission` VALUES ('4', '260');
INSERT INTO `role_permission` VALUES ('4', '261');
INSERT INTO `role_permission` VALUES ('4', '262');
INSERT INTO `role_permission` VALUES ('4', '263');
INSERT INTO `role_permission` VALUES ('4', '266');
INSERT INTO `role_permission` VALUES ('4', '268');
INSERT INTO `role_permission` VALUES ('4', '270');
INSERT INTO `role_permission` VALUES ('4', '272');
INSERT INTO `role_permission` VALUES ('4', '274');
INSERT INTO `role_permission` VALUES ('4', '276');
INSERT INTO `role_permission` VALUES ('4', '278');
INSERT INTO `role_permission` VALUES ('4', '280');
INSERT INTO `role_permission` VALUES ('4', '281');
INSERT INTO `role_permission` VALUES ('4', '282');
INSERT INTO `role_permission` VALUES ('4', '284');
INSERT INTO `role_permission` VALUES ('4', '285');
INSERT INTO `role_permission` VALUES ('4', '286');
INSERT INTO `role_permission` VALUES ('4', '287');
INSERT INTO `role_permission` VALUES ('4', '289');
INSERT INTO `role_permission` VALUES ('4', '290');
INSERT INTO `role_permission` VALUES ('4', '291');
INSERT INTO `role_permission` VALUES ('4', '292');
INSERT INTO `role_permission` VALUES ('4', '294');
INSERT INTO `role_permission` VALUES ('4', '295');
INSERT INTO `role_permission` VALUES ('4', '296');
INSERT INTO `role_permission` VALUES ('4', '297');
INSERT INTO `role_permission` VALUES ('4', '299');
INSERT INTO `role_permission` VALUES ('4', '300');

-- ----------------------------
-- Table structure for routeperformancereport
-- ----------------------------
DROP TABLE IF EXISTS `routeperformancereport`;
CREATE TABLE `routeperformancereport` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '路由Id',
  `executeplanid` bigint(20) unsigned DEFAULT NULL COMMENT '集合id',
  `tablename` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '表名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='性能结果路由表';

-- ----------------------------
-- Records of routeperformancereport
-- ----------------------------

-- ----------------------------
-- Table structure for scenecases_debug_report
-- ----------------------------
DROP TABLE IF EXISTS `scenecases_debug_report`;
CREATE TABLE `scenecases_debug_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `batchname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行结果，成功，失败，异常',
  `respone` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '返回结果',
  `assertvalue` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '断言详细经过',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `expect` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '期望值',
  `errorinfo` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '错误信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `requestheader` text COMMENT '请求头数据',
  `requestdatas` text COMMENT '请求数据',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `requestmethod` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `sceneid` bigint(20) unsigned NOT NULL COMMENT '场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='场景用例调试报告表';

-- ----------------------------
-- Records of scenecases_debug_report
-- ----------------------------

-- ----------------------------
-- Table structure for scriptvariables
-- ----------------------------
DROP TABLE IF EXISTS `scriptvariables`;
CREATE TABLE `scriptvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `scriptvariablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `variablesdes` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量描述',
  `valuetype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量值类型',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `conditionid` bigint(20) unsigned NOT NULL COMMENT '条件id',
  `conditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='脚本变量表';

-- ----------------------------
-- Records of scriptvariables
-- ----------------------------

-- ----------------------------
-- Table structure for slaver
-- ----------------------------
DROP TABLE IF EXISTS `slaver`;
CREATE TABLE `slaver` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行机Id',
  `slavername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '执行机器名',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '端口',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态，idle，running',
  `stype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '执行机类型，功能机，性能机',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `macaddress` varchar(100) DEFAULT NULL COMMENT 'mac地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='服务器表';

-- ----------------------------
-- Records of slaver
-- ----------------------------
INSERT INTO `slaver` VALUES ('2', '执行机172.27.32.1', '172.27.32.1', '8081', '空闲', '功能', '执行机172.27.32.1', '2024-04-30 10:03:29', '2024-04-30 10:03:29', 'E0-D4-E8-65-82-77');

-- ----------------------------
-- Table structure for statics_deployunitandcases
-- ----------------------------
DROP TABLE IF EXISTS `statics_deployunitandcases`;
CREATE TABLE `statics_deployunitandcases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `passrate` double(11,2) NOT NULL COMMENT '成功率',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例成功总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例失败总数',
  `runtime` bigint(50) NOT NULL COMMENT '运行时长',
  `statics_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '统计日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api微服务用例统计报告表';

-- ----------------------------
-- Records of statics_deployunitandcases
-- ----------------------------

-- ----------------------------
-- Table structure for statics_planandcases
-- ----------------------------
DROP TABLE IF EXISTS `statics_planandcases`;
CREATE TABLE `statics_planandcases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '执行计划id',
  `testplanname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `passrate` double(11,2) NOT NULL COMMENT '成功率',
  `totalcases` bigint(20) NOT NULL COMMENT '用例总数',
  `totalpasscases` bigint(20) NOT NULL COMMENT '用例成功总数',
  `totalfailcases` bigint(20) NOT NULL COMMENT '用例失败总数',
  `runtime` bigint(50) NOT NULL COMMENT '运行时长',
  `statics_date` date NOT NULL COMMENT '统计日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='api计划用例统计报告表';

-- ----------------------------
-- Records of statics_planandcases
-- ----------------------------

-- ----------------------------
-- Table structure for testcondition
-- ----------------------------
DROP TABLE IF EXISTS `testcondition`;
CREATE TABLE `testcondition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditionname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件名',
  `objectid` bigint(20) unsigned DEFAULT NULL COMMENT '目标Id，计划，用例的id',
  `objectname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '目标名',
  `objecttype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '目标类型',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型，前置，后置，其他',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微服务名',
  `apiname` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'api名',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT 'deployunitid',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件表';

-- ----------------------------
-- Records of testcondition
-- ----------------------------

-- ----------------------------
-- Table structure for testcondition_report
-- ----------------------------
DROP TABLE IF EXISTS `testcondition_report`;
CREATE TABLE `testcondition_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '前置，后置',
  `subconditionid` bigint(20) DEFAULT NULL COMMENT '子条件id，接口，db，nosql条件id',
  `conditionresult` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '接口返回，数据库返回结果等等',
  `conditionstatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件完成状态，成功，失败',
  `runtime` bigint(20) NOT NULL COMMENT '运行时长',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `batchname` varchar(64) DEFAULT NULL COMMENT '批次',
  `planname` varchar(64) DEFAULT NULL COMMENT '计划名',
  `testplanid` bigint(20) DEFAULT NULL COMMENT '计划id',
  `subconditiontype` varchar(20) DEFAULT NULL COMMENT '子条件类型，接口，数据库，脚本其他',
  `status` varchar(64) DEFAULT NULL COMMENT '状态',
  `subconditionname` varchar(20) DEFAULT NULL COMMENT '子条件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='条件报告表';

-- ----------------------------
-- Records of testcondition_report
-- ----------------------------

-- ----------------------------
-- Table structure for tester
-- ----------------------------
DROP TABLE IF EXISTS `tester`;
CREATE TABLE `tester` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testername` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '测试人员姓名',
  `testertitle` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '测试人员职务',
  `testerorg` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属组织',
  `testermemo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试人员表';

-- ----------------------------
-- Records of tester
-- ----------------------------

-- ----------------------------
-- Table structure for testplan_testscene
-- ----------------------------
DROP TABLE IF EXISTS `testplan_testscene`;
CREATE TABLE `testplan_testscene` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `testscenenid` bigint(20) unsigned NOT NULL COMMENT '测试场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  `testplanid` bigint(20) unsigned NOT NULL COMMENT '集合id',
  `planname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '集合名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `ordernum` bigint(20) unsigned DEFAULT NULL COMMENT '顺序',
  `creator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试集合场景表';

-- ----------------------------
-- Records of testplan_testscene
-- ----------------------------

-- ----------------------------
-- Table structure for testscene
-- ----------------------------
DROP TABLE IF EXISTS `testscene`;
CREATE TABLE `testscene` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '场景Id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  `usetype` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运行类型，function，performance，来区分分配什么slaver',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `casenums` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用例数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试场景表';

-- ----------------------------
-- Records of testscene
-- ----------------------------

-- ----------------------------
-- Table structure for testscene_testcase
-- ----------------------------
DROP TABLE IF EXISTS `testscene_testcase`;
CREATE TABLE `testscene_testcase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `testscenenid` bigint(20) unsigned NOT NULL COMMENT '测试场景id',
  `scenename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '场景名',
  `apiid` bigint(20) unsigned NOT NULL COMMENT 'apiid',
  `deployunitid` bigint(20) unsigned NOT NULL COMMENT '微服务id',
  `deployunitname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '微服务',
  `modelid` bigint(20) unsigned NOT NULL COMMENT '模块id',
  `modelname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模块名',
  `apiname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'API名',
  `testcaseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用例名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '操作人',
  `caseorder` bigint(20) unsigned DEFAULT NULL COMMENT '用例顺序',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `threadnums` bigint(20) unsigned DEFAULT '1' COMMENT '线程数',
  `loopnums` bigint(20) unsigned DEFAULT '1' COMMENT '循环次数',
  `stopflag` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '无' COMMENT '断言失败处理标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试场景用例表';

-- ----------------------------
-- Records of testscene_testcase
-- ----------------------------

-- ----------------------------
-- Table structure for testvariables
-- ----------------------------
DROP TABLE IF EXISTS `testvariables`;
CREATE TABLE `testvariables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `testvariablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `testvariablestype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量类型，用例变量，全局变量',
  `variablesexpress` varchar(210) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量表达',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建者',
  `variablesdes` varchar(100) DEFAULT NULL COMMENT '变量描述',
  `valuetype` varchar(20) DEFAULT 'String' COMMENT 'String，Number，Array,Bool,其他',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量表';

-- ----------------------------
-- Records of testvariables
-- ----------------------------

-- ----------------------------
-- Table structure for testvariables_value
-- ----------------------------
DROP TABLE IF EXISTS `testvariables_value`;
CREATE TABLE `testvariables_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `planid` bigint(20) unsigned NOT NULL COMMENT '计划Id',
  `planname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '计划名',
  `caseid` bigint(20) unsigned NOT NULL COMMENT '用例Id',
  `casename` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用例名',
  `variablesid` bigint(20) unsigned NOT NULL COMMENT '变量Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `variablesvalue` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量值',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `batchname` varchar(64) DEFAULT NULL COMMENT '批次',
  `variablestype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量类型',
  `slaverid` bigint(20) unsigned NOT NULL COMMENT 'slaverid',
  `conditionid` bigint(20) unsigned NOT NULL COMMENT 'conditionid',
  `conditiontype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '条件类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量值表';

-- ----------------------------
-- Records of testvariables_value
-- ----------------------------

-- ----------------------------
-- Table structure for variables
-- ----------------------------
DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `variablesname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量名',
  `variablestype` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '变量类型',
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '变量描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastmodify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上一次修改时间',
  `variablecondition` varchar(64) DEFAULT NULL COMMENT '变量条件',
  `projectid` bigint(20) unsigned DEFAULT '1' COMMENT '项目id',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量表';

-- ----------------------------
-- Records of variables
-- ----------------------------
