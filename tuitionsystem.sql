/*
Navicat MySQL Data Transfer

Source Server         : 黄文东
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : tuitionsystem

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-12-19 12:52:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for charge_item
-- ----------------------------
DROP TABLE IF EXISTS `charge_item`;
CREATE TABLE `charge_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '收费项目名称',
  `school_year` int(20) NOT NULL COMMENT '学年',
  `student_category` varchar(20) NOT NULL COMMENT '类别',
  `major_id` bigint(20) NOT NULL COMMENT '专业',
  `enrollment_year` int(20) NOT NULL COMMENT '入学年份',
  `money` int(20) NOT NULL COMMENT '金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge_item
-- ----------------------------
INSERT INTO `charge_item` VALUES ('1', '专业学费', '2018', '高职学生', '1', '2018', '650000', '2018-11-20 16:40:23', '2018-11-20 16:40:40');
INSERT INTO `charge_item` VALUES ('2', '住宿费', '2018', '高职学生', '1', '2018', '120000', '2018-11-20 16:56:28', '2018-11-20 16:56:28');
INSERT INTO `charge_item` VALUES ('3', '热水维护费', '2018', '高职学生', '1', '2018', '10000', '2018-11-20 16:57:59', '2018-11-20 17:07:29');
INSERT INTO `charge_item` VALUES ('4', '空调维护费', '2018', '高职学生', '1', '2018', '10000', '2018-11-20 17:07:19', null);
INSERT INTO `charge_item` VALUES ('5', '教材费', '2018', '高职学生', '1', '2018', '100000', '2018-11-20 17:08:32', null);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '班级名称',
  `major_id` bigint(20) NOT NULL COMMENT '专业编号',
  `employee_id` bigint(20) NOT NULL COMMENT '辅导员编号',
  `enrollment_year` int(20) NOT NULL COMMENT '入学年份',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_major_id` (`major_id`) USING BTREE,
  KEY `idx_staff_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '计科一班', '1', '1', '2018', '2018-11-15 16:17:08', '2018-11-19 23:07:08');
INSERT INTO `class_info` VALUES ('2', '计科二班', '1', '1', '2018', '2018-11-16 21:22:38', '2018-11-19 23:07:17');
INSERT INTO `class_info` VALUES ('5', '计科三班', '1', '1', '2018', '2018-11-16 21:52:54', '2018-11-19 23:07:12');

-- ----------------------------
-- Table structure for employee_info
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `department_name` varchar(20) NOT NULL COMMENT '部门名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '2', '督导组', '2018-11-15 14:21:04', null);
INSERT INTO `employee_info` VALUES ('2', '7', '财务部', '2018-11-20 15:40:40', null);

-- ----------------------------
-- Table structure for major_info
-- ----------------------------
DROP TABLE IF EXISTS `major_info`;
CREATE TABLE `major_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '班级名称',
  `institute_name` varchar(20) NOT NULL COMMENT '学院',
  `department_name` varchar(20) NOT NULL COMMENT '系部',
  `enrollment_year` int(20) NOT NULL COMMENT '入学年份',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_institute_name` (`institute_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_info
-- ----------------------------
INSERT INTO `major_info` VALUES ('1', '计算机科学与技术', '信息科学与工程学院', '计算机系', '2018', '2018-11-15 14:47:42', '2018-11-19 21:10:16');

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `menu_type` tinyint(1) NOT NULL COMMENT '类型(1-菜单0-按钮)',
  `code` varchar(50) DEFAULT NULL COMMENT '按钮名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `menu_info` VALUES ('1', '学生信息管理', '37', '/static/pages/system/student/student-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('2', '缴费管理', '0', '', '1', null);
INSERT INTO `menu_info` VALUES ('3', '数据查询', '0', '', '1', null);
INSERT INTO `menu_info` VALUES ('4', '统计报表', '0', '', '1', null);
INSERT INTO `menu_info` VALUES ('5', '系统管理', '0', '', '1', null);
INSERT INTO `menu_info` VALUES ('6', '添加学生', '1', '', '0', 'btn_student_add');
INSERT INTO `menu_info` VALUES ('7', '修改学生', '1', '', '0', 'btn_student_modify');
INSERT INTO `menu_info` VALUES ('9', '收费项目管理', '2', '/static/pages/system/charge_item/charge-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('10', '学生缴费', '2', '/static/pages/system/payment/payment-info-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('11', '学生信息查询', '3', '/static/pages/system/student/student-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('13', '欠费情况查询', '3', '/static/pages/system/payment/payment-arrear-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('14', '专业查询', '3', '/static/pages/system/major/major-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('15', '班级查询', '3', '/static/pages/system/class/class-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('16', '学生信息统计表', '4', '/static/pages/system/statistical_table/student_count.html', '1', null);
INSERT INTO `menu_info` VALUES ('17', '缴费情况统计表', '4', '/static/pages/system/statistical_table/payment_info.html', '1', null);
INSERT INTO `menu_info` VALUES ('18', '欠费情况统计表', '4', '/static/pages/system/statistical_table/arrear_info.html', '1', null);
INSERT INTO `menu_info` VALUES ('19', '用户管理', '5', '/static/pages/system/user/user-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('20', '专业管理', '5', '/static/pages/system/major/major-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('21', '班级管理', '5', '/static/pages/system/class/class-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('22', '教职工管理', '5', '/static/pages/system/employee/employee-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('24', '角色管理', '5', '/static/pages/system/role/role-list.html', '1', null);
INSERT INTO `menu_info` VALUES ('25', '添加收费项目标准', '9', '', '0', 'btn_charge_add');
INSERT INTO `menu_info` VALUES ('26', '修改收费标准', '0', '', '0', null);
INSERT INTO `menu_info` VALUES ('27', '添加专业', '20', '', '0', 'btn_major_add');
INSERT INTO `menu_info` VALUES ('28', '添加班级', '21', '', '0', 'btn_class_add');
INSERT INTO `menu_info` VALUES ('29', '添加员工', '0', '', '0', null);
INSERT INTO `menu_info` VALUES ('30', '修改员工', '0', '', '0', null);
INSERT INTO `menu_info` VALUES ('35', '修改用户密码', '5', '/static/pages/reset-password.html', '1', null);
INSERT INTO `menu_info` VALUES ('37', '信息管理', '0', '', '1', null);
INSERT INTO `menu_info` VALUES ('39', '导出学生信息', '1', null, '0', 'btn_student_export');
INSERT INTO `menu_info` VALUES ('40', '导入学生信息', '1', null, '0', 'btn_student_import');

-- ----------------------------
-- Table structure for payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `payment_detail`;
CREATE TABLE `payment_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `amount` int(20) NOT NULL COMMENT '本次缴费金额',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本次缴费时间',
  `balance` int(20) NOT NULL COMMENT '剩余金额',
  `pay_method` varchar(20) NOT NULL COMMENT '支付方式',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_detail
-- ----------------------------
INSERT INTO `payment_detail` VALUES ('1', '20181009', '100000', '2018-11-23 14:17:34', '790000', '现金缴费', '2018-11-23 14:17:34', null);
INSERT INTO `payment_detail` VALUES ('2', '20181009', '790000', '2018-11-23 14:19:04', '0', '邮政转账缴费', '2018-11-23 14:19:04', null);
INSERT INTO `payment_detail` VALUES ('3', '20181006', '111100', '2018-11-23 18:42:17', '778900', '现金缴费', '2018-11-23 18:42:17', null);
INSERT INTO `payment_detail` VALUES ('4', '20181006', '121200', '2018-11-23 18:42:27', '657700', '刷卡缴费', '2018-11-23 18:42:27', null);
INSERT INTO `payment_detail` VALUES ('5', '20181006', '112400', '2018-11-23 18:42:41', '545300', '邮政转账缴费', '2018-11-23 18:42:41', null);
INSERT INTO `payment_detail` VALUES ('6', '20181006', '422400', '2018-11-23 18:42:50', '122900', '助学贷款', '2018-11-23 18:42:50', null);
INSERT INTO `payment_detail` VALUES ('7', '20181006', '1300', '2018-11-23 18:50:51', '121600', '现金缴费', '2018-11-23 18:50:51', null);
INSERT INTO `payment_detail` VALUES ('8', '20181006', '13200', '2018-11-23 18:50:57', '108400', '现金缴费', '2018-11-23 18:50:57', null);
INSERT INTO `payment_detail` VALUES ('9', '20181006', '32300', '2018-11-23 18:51:10', '89300', '邮政转账缴费', '2018-11-23 18:51:10', null);
INSERT INTO `payment_detail` VALUES ('10', '20181006', '11100', '2018-11-23 18:51:28', '78200', '现金缴费', '2018-11-23 18:51:28', null);
INSERT INTO `payment_detail` VALUES ('11', '20181006', '11100', '2018-11-23 18:51:42', '67100', '邮政转账缴费', '2018-11-23 18:51:42', null);
INSERT INTO `payment_detail` VALUES ('12', '20181006', '11100', '2018-11-23 18:51:46', '67100', '刷卡缴费', '2018-11-23 18:51:46', null);
INSERT INTO `payment_detail` VALUES ('13', '20181006', '22200', '2018-11-23 18:51:51', '56000', '助学贷款', '2018-11-23 18:51:51', null);
INSERT INTO `payment_detail` VALUES ('14', '20181006', '56000', '2018-11-23 18:52:20', '0', '现金缴费', '2018-11-23 18:52:20', null);
INSERT INTO `payment_detail` VALUES ('15', '20181010', '123300', '2018-12-02 21:37:36', '766700', '现金缴费', '2018-12-02 21:37:36', null);
INSERT INTO `payment_detail` VALUES ('16', '20181010', '100000', '2018-12-18 15:26:42', '666700', '现金缴费', '2018-12-18 15:26:42', null);
INSERT INTO `payment_detail` VALUES ('17', '20181010', '200000', '2018-12-18 16:35:34', '466700', '现金缴费', '2018-12-18 16:35:34', null);

-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `tuition` int(20) NOT NULL COMMENT '学费',
  `arrear` int(20) NOT NULL COMMENT '欠费',
  `school_year` int(20) NOT NULL,
  `hire_purchase_count` int(2) NOT NULL COMMENT '分期次数ID',
  `pay_status` tinyint(1) NOT NULL COMMENT '是否付清(1-已付清0-未付清)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_info
-- ----------------------------
INSERT INTO `payment_info` VALUES ('1', '20181006', '890000', '0', '2018', '12', '1', '2018-11-20 15:14:28', '2018-11-23 17:00:17');
INSERT INTO `payment_info` VALUES ('2', '20181009', '890000', '0', '2018', '4', '1', '2018-11-20 19:25:56', '2018-11-22 20:46:19');
INSERT INTO `payment_info` VALUES ('7', '20181010', '890000', '466700', '2018', '1', '0', '2018-11-30 16:41:27', '2018-12-02 21:37:36');
INSERT INTO `payment_info` VALUES ('8', '20181013', '890000', '890000', '2018', '1', '0', '2018-12-02 21:35:55', null);
INSERT INTO `payment_info` VALUES ('11', '20181016', '890000', '890000', '2018', '1', '0', '2018-12-12 16:28:56', null);
INSERT INTO `payment_info` VALUES ('12', '20181017', '890000', '890000', '2018', '1', '0', '2018-12-12 17:10:16', null);
INSERT INTO `payment_info` VALUES ('13', '20181018', '890000', '890000', '2018', '1', '0', '2018-12-12 17:10:16', null);

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '系统管理员', '2018-11-07 19:42:03', '2018-11-07 19:43:52');
INSERT INTO `role_info` VALUES ('2', '财务管理员', '2018-11-07 19:42:34', '2018-11-07 19:43:51');
INSERT INTO `role_info` VALUES ('3', '辅导员', '2018-11-07 19:43:23', null);
INSERT INTO `role_info` VALUES ('4', '学生', '2018-11-07 19:43:37', null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_id_menu_id` (`role_id`,`menu_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '3', '2018-11-07 19:48:33', null);
INSERT INTO `role_menu` VALUES ('2', '1', '5', '2018-11-07 19:48:41', null);
INSERT INTO `role_menu` VALUES ('3', '1', '11', '2018-11-07 19:48:55', null);
INSERT INTO `role_menu` VALUES ('6', '1', '19', '2018-11-07 19:51:26', null);
INSERT INTO `role_menu` VALUES ('7', '1', '20', '2018-11-07 19:51:30', null);
INSERT INTO `role_menu` VALUES ('8', '1', '21', '2018-11-07 19:51:35', null);
INSERT INTO `role_menu` VALUES ('9', '1', '22', '2018-11-07 19:51:41', null);
INSERT INTO `role_menu` VALUES ('10', '1', '24', '2018-11-07 19:51:51', null);
INSERT INTO `role_menu` VALUES ('12', '1', '27', '2018-11-07 19:53:17', null);
INSERT INTO `role_menu` VALUES ('13', '1', '28', '2018-11-07 19:53:24', null);
INSERT INTO `role_menu` VALUES ('14', '1', '29', '2018-11-07 19:53:26', null);
INSERT INTO `role_menu` VALUES ('15', '1', '30', '2018-11-07 19:53:38', null);
INSERT INTO `role_menu` VALUES ('18', '2', '2', '2018-11-07 19:54:09', null);
INSERT INTO `role_menu` VALUES ('19', '2', '3', '2018-11-07 19:54:13', null);
INSERT INTO `role_menu` VALUES ('20', '2', '4', '2018-11-07 19:54:33', null);
INSERT INTO `role_menu` VALUES ('21', '2', '9', '2018-11-07 19:55:29', null);
INSERT INTO `role_menu` VALUES ('22', '2', '10', '2018-11-07 19:55:57', null);
INSERT INTO `role_menu` VALUES ('24', '2', '13', '2018-11-07 19:56:06', null);
INSERT INTO `role_menu` VALUES ('25', '2', '14', '2018-11-07 19:56:13', null);
INSERT INTO `role_menu` VALUES ('26', '2', '15', '2018-11-07 19:56:34', null);
INSERT INTO `role_menu` VALUES ('27', '2', '17', '2018-11-07 19:56:44', null);
INSERT INTO `role_menu` VALUES ('28', '2', '18', '2018-11-07 19:56:48', null);
INSERT INTO `role_menu` VALUES ('30', '2', '25', '2018-11-07 19:57:13', null);
INSERT INTO `role_menu` VALUES ('31', '2', '26', '2018-11-07 19:57:15', null);
INSERT INTO `role_menu` VALUES ('32', '3', '1', '2018-11-07 19:57:30', null);
INSERT INTO `role_menu` VALUES ('33', '3', '3', '2018-11-07 19:57:38', null);
INSERT INTO `role_menu` VALUES ('34', '3', '4', '2018-11-07 19:57:42', null);
INSERT INTO `role_menu` VALUES ('35', '3', '6', '2018-11-07 19:57:46', null);
INSERT INTO `role_menu` VALUES ('36', '3', '7', '2018-11-07 19:57:49', null);
INSERT INTO `role_menu` VALUES ('37', '3', '8', '2018-11-07 19:57:55', null);
INSERT INTO `role_menu` VALUES ('39', '3', '14', '2018-11-07 19:58:24', null);
INSERT INTO `role_menu` VALUES ('40', '3', '15', '2018-11-07 19:58:28', null);
INSERT INTO `role_menu` VALUES ('41', '3', '16', '2018-11-07 19:58:35', null);
INSERT INTO `role_menu` VALUES ('49', '1', '35', '2018-11-13 23:25:14', '2018-11-13 23:25:44');
INSERT INTO `role_menu` VALUES ('50', '3', '37', '2018-11-16 13:45:47', null);
INSERT INTO `role_menu` VALUES ('59', '3', '39', '2018-12-17 13:58:54', null);
INSERT INTO `role_menu` VALUES ('60', '3', '40', '2018-12-17 13:59:34', null);
INSERT INTO `role_menu` VALUES ('102', '4', '3', '2018-12-18 20:46:29', null);
INSERT INTO `role_menu` VALUES ('103', '4', '14', '2018-12-18 20:46:29', null);
INSERT INTO `role_menu` VALUES ('104', '4', '15', '2018-12-18 20:46:29', null);

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `class_id` bigint(20) NOT NULL COMMENT '班级编号',
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别 ',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `enrollment_date` varchar(11) NOT NULL COMMENT '入学日期',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE,
  KEY `idx_class_id` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20181019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('20181006', '6', '1', '高职学生', '在读', '2018-11-20', '', '2018-11-20 15:14:28', '2018-11-20 18:32:31');
INSERT INTO `student_info` VALUES ('20181009', '8', '5', '高职学生', '在读', '2018-11-20', '', '2018-11-20 19:25:56', '2018-11-20 19:25:56');
INSERT INTO `student_info` VALUES ('20181010', '9', '2', '高职学生', '在读', '2018-11-30', '', '2018-11-30 16:41:27', '2018-11-30 16:41:27');
INSERT INTO `student_info` VALUES ('20181013', '10', '1', '高职学生', '在读', '2018-12-02', '', '2018-12-02 21:35:54', '2018-12-02 21:35:54');
INSERT INTO `student_info` VALUES ('20181016', '11', '5', '高职学生', '在读', '2018-11-20', '', '2018-12-12 16:28:56', '2018-12-12 16:28:56');
INSERT INTO `student_info` VALUES ('20181017', '12', '1', '高职学生', '在读', '2018-11-20', '', '2018-12-12 17:10:16', '2018-12-12 17:10:16');
INSERT INTO `student_info` VALUES ('20181018', '13', '5', '高职学生', '在读', '2018-11-20', '', '2018-12-12 17:10:16', '2018-12-12 17:10:16');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL COMMENT '性别(1-男 0-女)',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `status` tinyint(1) NOT NULL COMMENT '用户类型(1-启用 0-禁用)',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'admin', '张三', '1', '37dc628b62fbe54b4ba55dcee93be0d2', '1', '1');
INSERT INTO `user_info` VALUES ('2', '李四11', '李四', '1', '79a37626c44893bc87b19fad1e61b745', '1', '3');
INSERT INTO `user_info` VALUES ('4', '20181004', '学生0001', '1', '745fa81c9fb632ed5615ffba7ad2e807', '1', '4');
INSERT INTO `user_info` VALUES ('5', '20181005', '沈培', '1', '37dc628b62fbe54b4ba55dcee93be0d2', '1', '4');
INSERT INTO `user_info` VALUES ('6', '20181006', '学生0002', '1', '9bb1afdbd0a14fe1d938dfac83a6e51b', '1', '4');
INSERT INTO `user_info` VALUES ('7', '财务001', '财务一', '0', '46608e74e8286bf1cc04b89d761d148c', '1', '2');
INSERT INTO `user_info` VALUES ('8', '20181009', '学生0008', '1', '20db4d4d8c1673491e5753aa9fd6c929', '1', '4');
INSERT INTO `user_info` VALUES ('9', '20181010', '学生0010', '1', '5a2923cf7d59c4306f232b8139f4b992', '1', '4');
INSERT INTO `user_info` VALUES ('10', '20181013', '学生0101', '1', '539d6ee6259ec6fcdc74743c431c6993', '0', '4');
INSERT INTO `user_info` VALUES ('11', '20181016', '学生0013', '0', 'a84eee425e92be81bafccea79e1ac880', '0', '4');
INSERT INTO `user_info` VALUES ('12', '20181017', '学生0012', '1', '73f18dba8a800c4db4262173fed126be', '1', '4');
INSERT INTO `user_info` VALUES ('13', '20181018', '学生0013', '0', '9c8eeca24f50c9ca3527753fbb9504ec', '1', '4');
SET FOREIGN_KEY_CHECKS=1;
