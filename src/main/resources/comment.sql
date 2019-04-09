/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : comment

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-09 20:55:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` varchar(32) NOT NULL,
  `customer_id` varchar(32) NOT NULL,
  `parent_comment_id` varchar(32) NOT NULL,
  `content_id` varchar(32) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `content` varchar(140) DEFAULT NULL,
  `comment_date` varchar(10) DEFAULT NULL,
  `comment_time` varchar(12) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '0', '1', '1', '吴乃中山靖王之后，孝景皇帝阁下玄孙，刘雄之孙，刘弘之子也。', '2018-12-18', '23:00:00', '0');
INSERT INTO `t_comment` VALUES ('10', '6', '0', '2', '1', '魏国大业全仰仗各位将军啦', '2018-12-18', '23:09:00', '0');
INSERT INTO `t_comment` VALUES ('11', '7', '10', '2', '1', '主公，华佗说你这病需要进行开颅手术', '2018-12-18', '23:10:00', '0');
INSERT INTO `t_comment` VALUES ('12', '8', '10', '2', '1', '是啊，主公您要保重身体啊。。。', '2018-12-18', '23:11:00', '0');
INSERT INTO `t_comment` VALUES ('13', '6', '12', '2', '1', '混账东西，你是想谋害老夫么，拖出去砍了', '2018-12-18', '23:12:00', '0');
INSERT INTO `t_comment` VALUES ('14', '8', '10', '2', '1', '主公，我好心救你，你不能这样对我啊，主公！！！', '2018-12-18', '23:13:00', '0');
INSERT INTO `t_comment` VALUES ('2', '2', '1', '1', '1', '大哥身份显贵，气度不凡啊！！！', '2018-12-18', '23:01:00', '0');
INSERT INTO `t_comment` VALUES ('3', '3', '1', '1', '1', '翼德愿跟随大哥一统天下。。。', '2018-12-18', '23:02:00', '0');
INSERT INTO `t_comment` VALUES ('4', '4', '1', '1', '1', '子龙愿意跟随大哥统一天下。。。', '2018-12-18', '23:03:00', '0');
INSERT INTO `t_comment` VALUES ('5', '1', '2', '1', '1', '云长贤弟，可否愿意和我一同匡扶蜀国大业？？？', '2018-12-18', '23:04:00', '0');
INSERT INTO `t_comment` VALUES ('6', '2', '1', '1', '1', '最近忙着高考，学习兵法，实在是没有时间啊。。。', '2018-12-18', '23:05:00', '0');
INSERT INTO `t_comment` VALUES ('7', '1', '2', '1', '1', '那就报个成人班好啦，贤弟果然热爱学习，咱们蜀国就缺乏像你这样的人才', '2018-12-18', '23:06:00', '0');
INSERT INTO `t_comment` VALUES ('8', '5', '1', '1', '1', '主公，云长兄能文能武，实属我吴国之幸啊。。。', '2018-12-18', '23:07:00', '0');
INSERT INTO `t_comment` VALUES ('9', '2', '5', '1', '1', '军师过奖了，您才是吴国重要谋臣', '2018-12-18', '23:08:00', '0');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` varchar(32) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '刘备');
INSERT INTO `t_customer` VALUES ('2', '关羽');
INSERT INTO `t_customer` VALUES ('3', '张飞');
INSERT INTO `t_customer` VALUES ('4', '赵云');
INSERT INTO `t_customer` VALUES ('5', '诸葛亮');
INSERT INTO `t_customer` VALUES ('6', '曹操');
INSERT INTO `t_customer` VALUES ('7', '郭嘉');
INSERT INTO `t_customer` VALUES ('8', '华佗');

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES ('1', '蜀国大业', '1');
INSERT INTO `t_item` VALUES ('2', '魏国大业', '1');
INSERT INTO `t_item` VALUES ('3', '吴国大业', '1');
