/*
 Navicat MySQL Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : 192.168.1.102:3306
 Source Schema         : gmall

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 25/11/2019 13:44:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_category1
-- ----------------------------
DROP TABLE IF EXISTS `base_category1`;
CREATE TABLE `base_category1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一级分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_category2
-- ----------------------------
DROP TABLE IF EXISTS `base_category2`;
CREATE TABLE `base_category2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级分类名称',
  `category1_id` bigint(20) NULL DEFAULT NULL COMMENT '一级分类编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二级分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_category3
-- ----------------------------
DROP TABLE IF EXISTS `base_category3`;
CREATE TABLE `base_category3`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '三级分类名称',
  `category2_id` bigint(20) NULL DEFAULT NULL COMMENT '二级分类编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1150 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '三级分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_province
-- ----------------------------
DROP TABLE IF EXISTS `base_province`;
CREATE TABLE `base_province`  (
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称',
  `region_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大区id',
  `area_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政区位码'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_region
-- ----------------------------
DROP TABLE IF EXISTS `base_region`;
CREATE TABLE `base_region`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大区id',
  `region_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大区名称'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称（冗余)',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称（冗余)',
  `order_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '购买价格(下单时sku价格）',
  `sku_num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买个数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3095 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `consignee` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `consignee_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `payment_way` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式',
  `delivery_address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送货地址',
  `order_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `out_trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单交易编号（第三方支付用)',
  `trade_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单描述(第三方支付用)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
  `tracking_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单编号',
  `parent_order_id` bigint(20) NULL DEFAULT NULL COMMENT '父订单编号',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `province_id` int(20) NULL DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表 订单表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外业务编号',
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `alipay_trade_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易流水编号',
  `total_amount` decimal(16, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `subject` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易内容',
  `payment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58817 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sku_info
-- ----------------------------
DROP TABLE IF EXISTS `sku_info`;
CREATE TABLE `sku_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存id(itemID)',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格描述',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '重量',
  `tm_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌(冗余)',
  `category3_id` bigint(20) NULL DEFAULT NULL COMMENT '三级分类id（冗余)',
  `sku_default_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认显示图片(冗余)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存单元表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `passwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone_num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `head_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_level` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户级别',
  `birthday` date NULL DEFAULT NULL COMMENT '用户生日',
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 M男,F女',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for init_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_data`;
delimiter ;;
CREATE PROCEDURE `init_data`(do_date_string VARCHAR(20) ,order_incr_num INT,user_incr_num INT ,sku_num INT ,if_truncate BOOLEAN)
BEGIN  
     DECLARE user_count INT DEFAULT 0; 
     DECLARE sku_count INT DEFAULT 0; 
     DECLARE do_date VARCHAR(20) DEFAULT do_date_string;
     IF if_truncate  THEN 
        TRUNCATE TABLE order_info ;
        TRUNCATE TABLE order_detail ;
        TRUNCATE TABLE sku_info ;
        TRUNCATE TABLE user_info ;
     END IF ;     
     CALL insert_sku(do_date,sku_num );
     SELECT COUNT(*) INTO sku_count FROM  sku_info;
     CALL insert_user(do_date,user_incr_num );
     SELECT COUNT(*) INTO user_count FROM  user_info;
     CALL update_order(do_date);
     CALL insert_order(do_date,order_incr_num,user_count);
     CALL insert_payment(do_date);
 END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_order`;
delimiter ;;
CREATE PROCEDURE `insert_order`(create_time_string VARCHAR(200),max_num INT,user_num INT)
BEGIN  
 DECLARE v_create_time DATETIME DEFAULT NULL;
  DECLARE i INT DEFAULT 0;
  DECLARE v_order_status INT DEFAULT 0;  
  DECLARE v_operate_time DATETIME DEFAULT NULL; 
  DECLARE v_order_id INT DEFAULT NULL; 
  DECLARE v_order_detail_num INT DEFAULT NULL; 
  DECLARE j INT DEFAULT 0;
  Declare v_province int DEFAULT 0;
  DECLARE v_skuid VARCHAR(20) DEFAULT NULL;
  DECLARE v_skuname VARCHAR(20) DEFAULT NULL;
 SET autocommit = 0;    
 REPEAT  
 SET i = i + 1;  
 SET v_create_time=DATE_ADD(DATE_FORMAT(create_time_string,'%Y-%m-%d') ,INTERVAL rand_num(30,3600*23) SECOND);
 set v_province=  rand_num(1,9);
  SET v_order_status=rand_num(1,2);  
  IF v_order_status>1 THEN 
     SET v_operate_time= DATE_ADD(v_create_time ,INTERVAL rand_num(30,3600) SECOND);
   ELSE 
     SET v_operate_time=NULL  ;
   END IF ;
 INSERT INTO order_info (consignee, consignee_tel,total_amount ,order_status ,user_id,payment_way,delivery_address,order_comment,out_trade_no,trade_body,create_time,operate_time,expire_time, tracking_no,parent_order_id ,img_url, province_id) 
 VALUES (rand_string(6) , CONCAT('13',rand_nums(0,9,9,'')),CAST(rand_num(50,1000) AS DECIMAL(10,2)) ,v_order_status ,rand_num(1,user_num), rand_num(1,2),rand_string(20),rand_string(20),rand_nums(0,9,10,''),'',v_create_time, v_operate_time,NULL,NULL,NULL,NULL ,v_province); 
  SELECT  LAST_INSERT_ID() INTO v_order_id ;
     SET v_order_detail_num=rand_num(1,5); 
    WHILE j<v_order_detail_num DO
       SET j=j+1;
       SET v_skuid= rand_num(1,11) ;
       INSERT INTO  order_detail  (order_id , sku_id,sku_name ,img_url ,order_price,sku_num,create_time ) 
       select v_order_id ,id,sku_name,CONCAT('http://',rand_string(40)),price,rand_num(1,5) ,v_create_time  from sku_info where id=v_skuid;
    END WHILE;
    SET j=0;
 UNTIL i = max_num  
 END REPEAT;  
 COMMIT;  
 END
;;
delimiter ;


-- ----------------------------
-- Procedure structure for insert_payment
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_payment`;
delimiter ;;
CREATE PROCEDURE `insert_payment`(do_date_str VARCHAR(200))
BEGIN      
 INSERT INTO payment_info (out_trade_no,order_id,user_id,alipay_trade_no,total_amount,`subject`,payment_type,payment_time  ) 
  SELECT o.out_trade_no,o.id,user_id,
   CONCAT( rand_string(4),'-',rand_nums(0,9,8,'')) alipay_trade_no,
   o.total_amount,
   rand_string(8) `subject`,
  ( CASE rand_num(1,3) WHEN 1 THEN  'wechatpay' WHEN 2 THEN 'alipay' WHEN 3 THEN 'unionpay' END) payment_type , 
  IF(o.operate_time IS NULL,o.create_time,o.operate_time) payment_time
  FROM order_info  o 
  WHERE (DATE_FORMAT(o.create_time,'%Y-%m-%d')= do_date_str OR DATE_FORMAT(o.operate_time,'%Y-%m-%d')= do_date_str ) AND o.order_status='2';
  COMMIT;
 END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_sku
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_sku`;
delimiter ;;
CREATE PROCEDURE `insert_sku`(create_time_string VARCHAR(200),max_num INT)
BEGIN  
 DECLARE v_create_time DATETIME DEFAULT NULL;
 DECLARE i INT DEFAULT 0;
 SET autocommit = 0;    
 REPEAT  
 SET i = i + 1;  
 SET v_create_time=DATE_ADD(DATE_FORMAT(create_time_string,'%Y-%m-%d') ,INTERVAL rand_num(1,3600*24) SECOND); 
 INSERT INTO sku_info (spu_id,price,sku_name,sku_desc,weight,tm_id,category3_id,sku_default_img,create_time  ) 
 VALUES (rand_num(1,1000) ,rand_num(10,5000) , rand_string(20), rand_string(30),CAST(rand_num(50,500) AS DECIMAL(10,2))/100.0  ,rand_num(1,20),  rand_num(1,1150),CONCAT('http://',rand_string(40)), v_create_time    ); 
 UNTIL i = max_num  
 END REPEAT;  
 COMMIT;  
 END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_user`;
delimiter ;;
CREATE PROCEDURE `insert_user`(create_time_string VARCHAR(200),max_num INT)
BEGIN  
 DECLARE v_create_time DATETIME DEFAULT NULL;
 DECLARE v_operate_time DATETIME DEFAULT NULL;
 DECLARE i INT DEFAULT 0;
 DECLARE v_birthday DATE DEFAULT '1970-01-01';
 DECLARE v_gender VARCHAR(1) DEFAULT NULL;
 DECLARE v_flag INT DEFAULT 0;
 SET autocommit = 0;    
 REPEAT  
   SET i  = i + 1;  
   SET v_create_time=DATE_ADD(DATE_FORMAT(create_time_string,'%Y-%m-%d') ,INTERVAL rand_num(1,3600*24) SECOND); 
   SET v_birthday=DATE_ADD(DATE_FORMAT('1950-01-01','%Y-%m-%d') ,INTERVAL rand_num(1,365*50) DAY); 
   SET v_gender=IF(rand_num(0,1)=0,'M','F');
     SET v_flag=rand_num(1, 100);
     IF v_flag>90 THEN 
     SET v_operate_time= DATE_ADD(v_create_time ,INTERVAL rand_num(30,3600) SECOND);
   ELSE 
     SET v_operate_time=NULL  ;
   END IF ;
 INSERT INTO user_info (login_name,nick_name,passwd,NAME,phone_num,email,head_img,user_level,birthday,gender,create_time,operate_time  ) 
 VALUES (rand_string(20) ,rand_string(20) , CONCAT('pwd',rand_string(20)), rand_string(30), CONCAT('13',rand_nums(0,9,9,''))    ,CONCAT(rand_string(8),'@',rand_string(3),'.com') ,  CONCAT('http://',rand_string(40)), rand_num(1,5),v_birthday,v_gender,v_create_time,v_operate_time   ); 
 UNTIL i = max_num  
 END REPEAT;  
 COMMIT;  
 END
;;
delimiter ;

-- ----------------------------
-- Function structure for rand_num
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_num`;
delimiter ;;
CREATE FUNCTION `rand_num`(from_num INT ,to_num INT)
 RETURNS int(11)
BEGIN   
 DECLARE i INT DEFAULT 0;  
 SET i = FLOOR(from_num +RAND()*(to_num -from_num+1))   ;
RETURN i;  
 END
;;
delimiter ;

-- ----------------------------
-- Function structure for rand_nums
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_nums`;
delimiter ;;
CREATE FUNCTION `rand_nums`(from_num INT ,to_num INT,n INT ,delemit VARCHAR(20))
 RETURNS varchar(255) CHARSET utf8
BEGIN   
 DECLARE i INT DEFAULT 0;  
 DECLARE v INT DEFAULT 0;
 DECLARE return_str VARCHAR(255) DEFAULT '';  
 WHILE i < n DO 
	 SET v = rand_num (from_num   ,to_num  ) ;
	 SET return_str=CONCAT(return_str,v);
	 IF LENGTH(return_str)>0 THEN 
	   SET return_str=CONCAT(return_str,delemit) ;
	 END IF;
	 SET i = i + 1;
END WHILE;
 RETURN return_str;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for rand_num_seed
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_num_seed`;
delimiter ;;
CREATE FUNCTION `rand_num_seed`(from_num INT ,to_num INT,seed LONG)
 RETURNS int(11)
BEGIN   
 DECLARE i INT DEFAULT 0;  
 SET i = FLOOR(from_num +RAND(seed+UNIX_TIMESTAMP(NOW()))*(to_num -from_num+1))   ;
RETURN i;  
 END
;;
delimiter ;

-- ----------------------------
-- Function structure for rand_string
-- ----------------------------
DROP FUNCTION IF EXISTS `rand_string`;
delimiter ;;
CREATE FUNCTION `rand_string`(n INT)
 RETURNS varchar(255) CHARSET utf8
BEGIN    
DECLARE chars_str VARCHAR(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFJHIJKLMNOPQRSTUVWXYZ';
 DECLARE return_str VARCHAR(255) DEFAULT '';
 DECLARE i INT DEFAULT 0;
 WHILE i < n DO  
 SET return_str =CONCAT(return_str,SUBSTRING(chars_str,FLOOR(1+RAND()*52),1));  
 SET i = i + 1;
 END WHILE;
 RETURN return_str;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_order`;
delimiter ;;
CREATE PROCEDURE `update_order`(operate_time_string VARCHAR(20))
BEGIN 
UPDATE order_info o SET   o.`order_status`=o.`order_status`+rand_num_seed(0,1,o.id)
WHERE o.`order_status`<5;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;




/*Data for the table `base_category1` */

INSERT  INTO `base_category1`(`id`,`name`) VALUES 

(1,'图书、音像、电子书刊'),

(2,'手机'),

(3,'家用电器'),

(4,'数码'),

(5,'家居家装'),

(6,'电脑办公'),

(7,'厨具'),

(8,'个护化妆'),

(9,'服饰内衣'),

(10,'钟表'),

(11,'鞋靴'),

(12,'母婴'),

(13,'礼品箱包'),

(14,'食品饮料、保健食品'),

(15,'珠宝'),

(16,'汽车用品'),

(17,'运动健康'),

(18,'玩具乐器');



INSERT  INTO `base_category2`(`id`,`name`,`category1_id`) VALUES 

(1,'电子书刊',1),

(2,'音像',1),

(3,'英文原版',1),

(4,'文艺',1),

(5,'少儿',1),

(6,'人文社科',1),

(7,'经管励志',1),

(8,'生活',1),

(9,'科技',1),

(10,'教育',1),

(11,'港台图书',1),

(12,'其他',1),

(13,'手机通讯',2),

(14,'运营商',2),

(15,'手机配件',2),

(16,'大 家 电',3),

(17,'厨卫大电',3),

(18,'厨房小电',3),

(19,'生活电器',3),

(20,'个护健康',3),

(21,'五金家装',3),

(22,'摄影摄像',4),

(23,'数码配件',4),

(24,'智能设备',4),

(25,'影音娱乐',4),

(26,'电子教育',4),

(27,'虚拟商品',4),

(28,'家纺',5),

(29,'灯具',5),

(30,'生活日用',5),

(31,'家装软饰',5),

(32,'宠物生活',5),

(33,'电脑整机',6),

(34,'电脑配件',6),

(35,'外设产品',6),

(36,'游戏设备',6),

(37,'网络产品',6),

(38,'办公设备',6),

(39,'文具/耗材',6),

(40,'服务产品',6),

(41,'烹饪锅具',7),

(42,'刀剪菜板',7),

(43,'厨房配件',7),

(44,'水具酒具',7),

(45,'餐具',7),

(46,'酒店用品',7),

(47,'茶具/咖啡具',7),

(48,'清洁用品',8),

(49,'面部护肤',8),

(50,'身体护理',8),

(51,'口腔护理',8),

(52,'女性护理',8),

(53,'洗发护发',8),

(54,'香水彩妆',8),

(55,'女装',9),

(56,'男装',9),

(57,'内衣',9),

(58,'洗衣服务',9),

(59,'服饰配件',9),

(60,'钟表',10),

(61,'流行男鞋',11),

(62,'时尚女鞋',11),

(63,'奶粉',12),

(64,'营养辅食',12),

(65,'尿裤湿巾',12),

(66,'喂养用品',12),

(67,'洗护用品',12),

(68,'童车童床',12),

(69,'寝居服饰',12),

(70,'妈妈专区',12),

(71,'童装童鞋',12),

(72,'安全座椅',12),

(73,'潮流女包',13),

(74,'精品男包',13),

(75,'功能箱包',13),

(76,'礼品',13),

(77,'奢侈品',13),

(78,'婚庆',13),

(79,'进口食品',14),

(80,'地方特产',14),

(81,'休闲食品',14),

(82,'粮油调味',14),

(83,'饮料冲调',14),

(84,'食品礼券',14),

(85,'茗茶',14),

(86,'时尚饰品',15),

(87,'黄金',15),

(88,'K金饰品',15),

(89,'金银投资',15),

(90,'银饰',15),

(91,'钻石',15),

(92,'翡翠玉石',15),

(93,'水晶玛瑙',15),

(94,'彩宝',15),

(95,'铂金',15),

(96,'木手串/把件',15),

(97,'珍珠',15),

(98,'维修保养',16),

(99,'车载电器',16),

(100,'美容清洗',16),

(101,'汽车装饰',16),

(102,'安全自驾',16),

(103,'汽车服务',16),

(104,'赛事改装',16),

(105,'运动鞋包',17),

(106,'运动服饰',17),

(107,'骑行运动',17),

(108,'垂钓用品',17),

(109,'游泳用品',17),

(110,'户外鞋服',17),

(111,'户外装备',17),

(112,'健身训练',17),

(113,'体育用品',17),

(114,'适用年龄',18),

(115,'遥控/电动',18),

(116,'毛绒布艺',18),

(117,'娃娃玩具',18),

(118,'模型玩具',18),

(119,'健身玩具',18),

(120,'动漫玩具',18),

(121,'益智玩具',18),

(122,'积木拼插',18),

(123,'DIY玩具',18),

(124,'创意减压',18),

(125,'乐器',18);
 

 

INSERT  INTO `base_category3`(`id`,`name`,`category2_id`) VALUES 

(1,'电子书',1),

(2,'网络原创',1),

(3,'数字杂志',1),

(4,'多媒体图书',1),

(5,'音乐',2),

(6,'影视',2),

(7,'教育音像',2),

(8,'少儿',3),

(9,'商务投资',3),

(10,'英语学习与考试',3),

(11,'文学',3),

(12,'传记',3),

(13,'励志',3),

(14,'小说',4),

(15,'文学',4),

(16,'青春文学',4),

(17,'传记',4),

(18,'艺术',4),

(19,'少儿',5),

(20,'0-2岁',5),

(21,'3-6岁',5),

(22,'7-10岁',5),

(23,'11-14岁',5),

(24,'历史',6),

(25,'哲学',6),

(26,'国学',6),

(27,'政治/军事',6),

(28,'法律',6),

(29,'人文社科',6),

(30,'心理学',6),

(31,'文化',6),

(32,'社会科学',6),

(33,'经济',7),

(34,'金融与投资',7),

(35,'管理',7),

(36,'励志与成功',7),

(37,'生活',8),

(38,'健身与保健',8),

(39,'家庭与育儿',8),

(40,'旅游',8),

(41,'烹饪美食',8),

(42,'工业技术',9),

(43,'科普读物',9),

(44,'建筑',9),

(45,'医学',9),

(46,'科学与自然',9),

(47,'计算机与互联网',9),

(48,'电子通信',9),

(49,'中小学教辅',10),

(50,'教育与考试',10),

(51,'外语学习',10),

(52,'大中专教材',10),

(53,'字典词典',10),

(54,'艺术/设计/收藏',11),

(55,'经济管理',11),

(56,'文化/学术',11),

(57,'少儿',11),

(58,'工具书',12),

(59,'杂志/期刊',12),

(60,'套装书',12),

(61,'手机',13),

(62,'对讲机',13),

(63,'合约机',14),

(64,'选号中心',14),

(65,'装宽带',14),

(66,'办套餐',14),

(67,'移动电源',15),

(68,'电池/移动电源',15),

(69,'蓝牙耳机',15),

(70,'充电器/数据线',15),

(71,'苹果周边',15),

(72,'手机耳机',15),

(73,'手机贴膜',15),

(74,'手机存储卡',15),

(75,'充电器',15),

(76,'数据线',15),

(77,'手机保护套',15),

(78,'车载配件',15),

(79,'iPhone 配件',15),

(80,'手机电池',15),

(81,'创意配件',15),

(82,'便携/无线音响',15),

(83,'手机饰品',15),

(84,'拍照配件',15),

(85,'手机支架',15),

(86,'平板电视',16),

(87,'空调',16),

(88,'冰箱',16),

(89,'洗衣机',16),

(90,'家庭影院',16),

(91,'DVD/电视盒子',16),

(92,'迷你音响',16),

(93,'冷柜/冰吧',16),

(94,'家电配件',16),

(95,'功放',16),

(96,'回音壁/Soundbar',16),

(97,'Hi-Fi专区',16),

(98,'电视盒子',16),

(99,'酒柜',16),

(100,'燃气灶',17),

(101,'油烟机',17),

(102,'热水器',17),

(103,'消毒柜',17),

(104,'洗碗机',17),

(105,'料理机',18),

(106,'榨汁机',18),

(107,'电饭煲',18),

(108,'电压力锅',18),

(109,'豆浆机',18),

(110,'咖啡机',18),

(111,'微波炉',18),

(112,'电烤箱',18),

(113,'电磁炉',18),

(114,'面包机',18),

(115,'煮蛋器',18),

(116,'酸奶机',18),

(117,'电炖锅',18),

(118,'电水壶/热水瓶',18),

(119,'电饼铛',18),

(120,'多用途锅',18),

(121,'电烧烤炉',18),

(122,'果蔬解毒机',18),

(123,'其它厨房电器',18),

(124,'养生壶/煎药壶',18),

(125,'电热饭盒',18),

(126,'取暖电器',19),

(127,'净化器',19),

(128,'加湿器',19),

(129,'扫地机器人',19),

(130,'吸尘器',19),

(131,'挂烫机/熨斗',19),

(132,'插座',19),

(133,'电话机',19),

(134,'清洁机',19),

(135,'除湿机',19),

(136,'干衣机',19),

(137,'收录/音机',19),

(138,'电风扇',19),

(139,'冷风扇',19),

(140,'其它生活电器',19),

(141,'生活电器配件',19),

(142,'净水器',19),

(143,'饮水机',19),

(144,'剃须刀',20),

(145,'剃/脱毛器',20),

(146,'口腔护理',20),

(147,'电吹风',20),

(148,'美容器',20),

(149,'理发器',20),

(150,'卷/直发器',20),

(151,'按摩椅',20),

(152,'按摩器',20),

(153,'足浴盆',20),

(154,'血压计',20),

(155,'电子秤/厨房秤',20),

(156,'血糖仪',20),

(157,'体温计',20),

(158,'其它健康电器',20),

(159,'计步器/脂肪检测仪',20),

(160,'电动工具',21),

(161,'手动工具',21),

(162,'仪器仪表',21),

(163,'浴霸/排气扇',21),

(164,'灯具',21),

(165,'LED灯',21),

(166,'洁身器',21),

(167,'水槽',21),

(168,'龙头',21),

(169,'淋浴花洒',21),

(170,'厨卫五金',21),

(171,'家具五金',21),

(172,'门铃',21),

(173,'电气开关',21),

(174,'插座',21),

(175,'电工电料',21),

(176,'监控安防',21),

(177,'电线/线缆',21),

(178,'数码相机',22),

(179,'单电/微单相机',22),

(180,'单反相机',22),

(181,'摄像机',22),

(182,'拍立得',22),

(183,'运动相机',22),

(184,'镜头',22),

(185,'户外器材',22),

(186,'影棚器材',22),

(187,'冲印服务',22),

(188,'数码相框',22),

(189,'存储卡',23),

(190,'读卡器',23),

(191,'滤镜',23),

(192,'闪光灯/手柄',23),

(193,'相机包',23),

(194,'三脚架/云台',23),

(195,'相机清洁/贴膜',23),

(196,'机身附件',23),

(197,'镜头附件',23),

(198,'电池/充电器',23),

(199,'移动电源',23),

(200,'数码支架',23),

(201,'智能手环',24),

(202,'智能手表',24),

(203,'智能眼镜',24),

(204,'运动跟踪器',24),

(205,'健康监测',24),

(206,'智能配饰',24),

(207,'智能家居',24),

(208,'体感车',24),

(209,'其他配件',24),

(210,'智能机器人',24),

(211,'无人机',24),

(212,'MP3/MP4',25),

(213,'智能设备',25),

(214,'耳机/耳麦',25),

(215,'便携/无线音箱',25),

(216,'音箱/音响',25),

(217,'高清播放器',25),

(218,'收音机',25),

(219,'MP3/MP4配件',25),

(220,'麦克风',25),

(221,'专业音频',25),

(222,'苹果配件',25),

(223,'学生平板',26),

(224,'点读机/笔',26),

(225,'早教益智',26),

(226,'录音笔',26),

(227,'电纸书',26),

(228,'电子词典',26),

(229,'复读机',26),

(230,'延保服务',27),

(231,'杀毒软件',27),

(232,'积分商品',27),

(233,'桌布/罩件',28),

(234,'地毯地垫',28),

(235,'沙发垫套/椅垫',28),

(236,'床品套件',28),

(237,'被子',28),

(238,'枕芯',28),

(239,'床单被罩',28),

(240,'毯子',28),

(241,'床垫/床褥',28),

(242,'蚊帐',28),

(243,'抱枕靠垫',28),

(244,'毛巾浴巾',28),

(245,'电热毯',28),

(246,'窗帘/窗纱',28),

(247,'布艺软饰',28),

(248,'凉席',28),

(249,'台灯',29),

(250,'节能灯',29),

(251,'装饰灯',29),

(252,'落地灯',29),

(253,'应急灯/手电',29),

(254,'LED灯',29),

(255,'吸顶灯',29),

(256,'五金电器',29),

(257,'筒灯射灯',29),

(258,'吊灯',29),

(259,'氛围照明',29),

(260,'保暖防护',30),

(261,'收纳用品',30),

(262,'雨伞雨具',30),

(263,'浴室用品',30),

(264,'缝纫/针织用品',30),

(265,'洗晒/熨烫',30),

(266,'净化除味',30),

(267,'相框/照片墙',31),

(268,'装饰字画',31),

(269,'节庆饰品',31),

(270,'手工/十字绣',31),

(271,'装饰摆件',31),

(272,'帘艺隔断',31),

(273,'墙贴/装饰贴',31),

(274,'钟饰',31),

(275,'花瓶花艺',31),

(276,'香薰蜡烛',31),

(277,'创意家居',31),

(278,'宠物主粮',32),

(279,'宠物零食',32),

(280,'医疗保健',32),

(281,'家居日用',32),

(282,'宠物玩具',32),

(283,'出行装备',32),

(284,'洗护美容',32),

(285,'笔记本',33),

(286,'超极本',33),

(287,'游戏本',33),

(288,'平板电脑',33),

(289,'平板电脑配件',33),

(290,'台式机',33),

(291,'服务器/工作站',33),

(292,'笔记本配件',33),

(293,'一体机',33),

(294,'CPU',34),

(295,'主板',34),

(296,'显卡',34),

(297,'硬盘',34),

(298,'SSD固态硬盘',34),

(299,'内存',34),

(300,'机箱',34),

(301,'电源',34),

(302,'显示器',34),

(303,'刻录机/光驱',34),

(304,'散热器',34),

(305,'声卡/扩展卡',34),

(306,'装机配件',34),

(307,'组装电脑',34),

(308,'移动硬盘',35),

(309,'U盘',35),

(310,'鼠标',35),

(311,'键盘',35),

(312,'鼠标垫',35),

(313,'摄像头',35),

(314,'手写板',35),

(315,'硬盘盒',35),

(316,'插座',35),

(317,'线缆',35),

(318,'UPS电源',35),

(319,'电脑工具',35),

(320,'游戏设备',35),

(321,'电玩',35),

(322,'电脑清洁',35),

(323,'网络仪表仪器',35),

(324,'游戏机',36),

(325,'游戏耳机',36),

(326,'手柄/方向盘',36),

(327,'游戏软件',36),

(328,'游戏周边',36),

(329,'路由器',37),

(330,'网卡',37),

(331,'交换机',37),

(332,'网络存储',37),

(333,'4G/3G上网',37),

(334,'网络盒子',37),

(335,'网络配件',37),

(336,'投影机',38),

(337,'投影配件',38),

(338,'多功能一体机',38),

(339,'打印机',38),

(340,'传真设备',38),

(341,'验钞/点钞机',38),

(342,'扫描设备',38),

(343,'复合机',38),

(344,'碎纸机',38),

(345,'考勤机',38),

(346,'收款/POS机',38),

(347,'会议音频视频',38),

(348,'保险柜',38),

(349,'装订/封装机',38),

(350,'安防监控',38),

(351,'办公家具',38),

(352,'白板',38),

(353,'硒鼓/墨粉',39),

(354,'墨盒',39),

(355,'色带',39),

(356,'纸类',39),

(357,'办公文具',39),

(358,'学生文具',39),

(359,'财会用品',39),

(360,'文件管理',39),

(361,'本册/便签',39),

(362,'计算器',39),

(363,'笔类',39),

(364,'画具画材',39),

(365,'刻录碟片/附件',39),

(366,'上门安装',40),

(367,'延保服务',40),

(368,'维修保养',40),

(369,'电脑软件',40),

(370,'京东服务',40),

(371,'炒锅',41),

(372,'煎锅',41),

(373,'压力锅',41),

(374,'蒸锅',41),

(375,'汤锅',41),

(376,'奶锅',41),

(377,'锅具套装',41),

(378,'煲类',41),

(379,'水壶',41),

(380,'火锅',41),

(381,'菜刀',42),

(382,'剪刀',42),

(383,'刀具套装',42),

(384,'砧板',42),

(385,'瓜果刀/刨',42),

(386,'多功能刀',42),

(387,'保鲜盒',43),

(388,'烘焙/烧烤',43),

(389,'饭盒/提锅',43),

(390,'储物/置物架',43),

(391,'厨房DIY/小工具',43),

(392,'塑料杯',44),

(393,'运动水壶',44),

(394,'玻璃杯',44),

(395,'陶瓷/马克杯',44),

(396,'保温杯',44),

(397,'保温壶',44),

(398,'酒杯/酒具',44),

(399,'杯具套装',44),

(400,'餐具套装',45),

(401,'碗/碟/盘',45),

(402,'筷勺/刀叉',45),

(403,'一次性用品',45),

(404,'果盘/果篮',45),

(405,'自助餐炉',46),

(406,'酒店餐具',46),

(407,'酒店水具',46),

(408,'整套茶具',47),

(409,'茶杯',47),

(410,'茶壶',47),

(411,'茶盘茶托',47),

(412,'茶叶罐',47),

(413,'茶具配件',47),

(414,'茶宠摆件',47),

(415,'咖啡具',47),

(416,'其他',47),

(417,'纸品湿巾',48),

(418,'衣物清洁',48),

(419,'清洁工具',48),

(420,'驱虫用品',48),

(421,'家庭清洁',48),

(422,'皮具护理',48),

(423,'一次性用品',48),

(424,'洁面',49),

(425,'乳液面霜',49),

(426,'面膜',49),

(427,'剃须',49),

(428,'套装',49),

(429,'精华',49),

(430,'眼霜',49),

(431,'卸妆',49),

(432,'防晒',49),

(433,'防晒隔离',49),

(434,'T区护理',49),

(435,'眼部护理',49),

(436,'精华露',49),

(437,'爽肤水',49),

(438,'沐浴',50),

(439,'润肤',50),

(440,'颈部',50),

(441,'手足',50),

(442,'纤体塑形',50),

(443,'美胸',50),

(444,'套装',50),

(445,'精油',50),

(446,'洗发护发',50),

(447,'染发/造型',50),

(448,'香薰精油',50),

(449,'磨砂/浴盐',50),

(450,'手工/香皂',50),

(451,'洗发',50),

(452,'护发',50),

(453,'染发',50),

(454,'磨砂膏',50),

(455,'香皂',50),

(456,'牙膏/牙粉',51),

(457,'牙刷/牙线',51),

(458,'漱口水',51),

(459,'套装',51),

(460,'卫生巾',52),

(461,'卫生护垫',52),

(462,'私密护理',52),

(463,'脱毛膏',52),

(464,'其他',52),

(465,'洗发',53),

(466,'护发',53),

(467,'染发',53),

(468,'造型',53),

(469,'假发',53),

(470,'套装',53),

(471,'美发工具',53),

(472,'脸部护理',53),

(473,'香水',54),

(474,'底妆',54),

(475,'腮红',54),

(476,'眼影',54),

(477,'唇部',54),

(478,'美甲',54),

(479,'眼线',54),

(480,'美妆工具',54),

(481,'套装',54),

(482,'防晒隔离',54),

(483,'卸妆',54),

(484,'眉笔',54),

(485,'睫毛膏',54),

(486,'T恤',55),

(487,'衬衫',55),

(488,'针织衫',55),

(489,'雪纺衫',55),

(490,'卫衣',55),

(491,'马甲',55),

(492,'连衣裙',55),

(493,'半身裙',55),

(494,'牛仔裤',55),

(495,'休闲裤',55),

(496,'打底裤',55),

(497,'正装裤',55),

(498,'小西装',55),

(499,'短外套',55),

(500,'风衣',55),

(501,'毛呢大衣',55),

(502,'真皮皮衣',55),

(503,'棉服',55),

(504,'羽绒服',55),

(505,'大码女装',55),

(506,'中老年女装',55),

(507,'婚纱',55),

(508,'打底衫',55),

(509,'旗袍/唐装',55),

(510,'加绒裤',55),

(511,'吊带/背心',55),

(512,'羊绒衫',55),

(513,'短裤',55),

(514,'皮草',55),

(515,'礼服',55),

(516,'仿皮皮衣',55),

(517,'羊毛衫',55),

(518,'设计师/潮牌',55),

(519,'衬衫',56),

(520,'T恤',56),

(521,'POLO衫',56),

(522,'针织衫',56),

(523,'羊绒衫',56),

(524,'卫衣',56),

(525,'马甲/背心',56),

(526,'夹克',56),

(527,'风衣',56),

(528,'毛呢大衣',56),

(529,'仿皮皮衣',56),

(530,'西服',56),

(531,'棉服',56),

(532,'羽绒服',56),

(533,'牛仔裤',56),

(534,'休闲裤',56),

(535,'西裤',56),

(536,'西服套装',56),

(537,'大码男装',56),

(538,'中老年男装',56),

(539,'唐装/中山装',56),

(540,'工装',56),

(541,'真皮皮衣',56),

(542,'加绒裤',56),

(543,'卫裤/运动裤',56),

(544,'短裤',56),

(545,'设计师/潮牌',56),

(546,'羊毛衫',56),

(547,'文胸',57),

(548,'女式内裤',57),

(549,'男式内裤',57),

(550,'睡衣/家居服',57),

(551,'塑身美体',57),

(552,'泳衣',57),

(553,'吊带/背心',57),

(554,'抹胸',57),

(555,'连裤袜/丝袜',57),

(556,'美腿袜',57),

(557,'商务男袜',57),

(558,'保暖内衣',57),

(559,'情侣睡衣',57),

(560,'文胸套装',57),

(561,'少女文胸',57),

(562,'休闲棉袜',57),

(563,'大码内衣',57),

(564,'内衣配件',57),

(565,'打底裤袜',57),

(566,'打底衫',57),

(567,'秋衣秋裤',57),

(568,'情趣内衣',57),

(569,'服装洗护',58),

(570,'太阳镜',59),

(571,'光学镜架/镜片',59),

(572,'围巾/手套/帽子套装',59),

(573,'袖扣',59),

(574,'棒球帽',59),

(575,'毛线帽',59),

(576,'遮阳帽',59),

(577,'老花镜',59),

(578,'装饰眼镜',59),

(579,'防辐射眼镜',59),

(580,'游泳镜',59),

(581,'女士丝巾/围巾/披肩',59),

(582,'男士丝巾/围巾',59),

(583,'鸭舌帽',59),

(584,'贝雷帽',59),

(585,'礼帽',59),

(586,'真皮手套',59),

(587,'毛线手套',59),

(588,'防晒手套',59),

(589,'男士腰带/礼盒',59),

(590,'女士腰带/礼盒',59),

(591,'钥匙扣',59),

(592,'遮阳伞/雨伞',59),

(593,'口罩',59),

(594,'耳罩/耳包',59),

(595,'假领',59),

(596,'毛线/布面料',59),

(597,'领带/领结/领带夹',59),

(598,'男表',60),

(599,'瑞表',60),

(600,'女表',60),

(601,'国表',60),

(602,'日韩表',60),

(603,'欧美表',60),

(604,'德表',60),

(605,'儿童手表',60),

(606,'智能手表',60),

(607,'闹钟',60),

(608,'座钟挂钟',60),

(609,'钟表配件',60),

(610,'商务休闲鞋',61),

(611,'正装鞋',61),

(612,'休闲鞋',61),

(613,'凉鞋/沙滩鞋',61),

(614,'男靴',61),

(615,'功能鞋',61),

(616,'拖鞋/人字拖',61),

(617,'雨鞋/雨靴',61),

(618,'传统布鞋',61),

(619,'鞋配件',61),

(620,'帆布鞋',61),

(621,'增高鞋',61),

(622,'工装鞋',61),

(623,'定制鞋',61),

(624,'高跟鞋',62),

(625,'单鞋',62),

(626,'休闲鞋',62),

(627,'凉鞋',62),

(628,'女靴',62),

(629,'雪地靴',62),

(630,'拖鞋/人字拖',62),

(631,'踝靴',62),

(632,'筒靴',62),

(633,'帆布鞋',62),

(634,'雨鞋/雨靴',62),

(635,'妈妈鞋',62),

(636,'鞋配件',62),

(637,'特色鞋',62),

(638,'鱼嘴鞋',62),

(639,'布鞋/绣花鞋',62),

(640,'马丁靴',62),

(641,'坡跟鞋',62),

(642,'松糕鞋',62),

(643,'内增高',62),

(644,'防水台',62),

(645,'婴幼奶粉',63),

(646,'孕妈奶粉',63),

(647,'益生菌/初乳',64),

(648,'米粉/菜粉',64),

(649,'果泥/果汁',64),

(650,'DHA',64),

(651,'宝宝零食',64),

(652,'钙铁锌/维生素',64),

(653,'清火/开胃',64),

(654,'面条/粥',64),

(655,'婴儿尿裤',65),

(656,'拉拉裤',65),

(657,'婴儿湿巾',65),

(658,'成人尿裤',65),

(659,'奶瓶奶嘴',66),

(660,'吸奶器',66),

(661,'暖奶消毒',66),

(662,'儿童餐具',66),

(663,'水壶/水杯',66),

(664,'牙胶安抚',66),

(665,'围兜/防溅衣',66),

(666,'辅食料理机',66),

(667,'食物存储',66),

(668,'宝宝护肤',67),

(669,'洗发沐浴',67),

(670,'奶瓶清洗',67),

(671,'驱蚊防晒',67),

(672,'理发器',67),

(673,'洗澡用具',67),

(674,'婴儿口腔清洁',67),

(675,'洗衣液/皂',67),

(676,'日常护理',67),

(677,'座便器',67),

(678,'婴儿推车',68),

(679,'餐椅摇椅',68),

(680,'婴儿床',68),

(681,'学步车',68),

(682,'三轮车',68),

(683,'自行车',68),

(684,'电动车',68),

(685,'扭扭车',68),

(686,'滑板车',68),

(687,'婴儿床垫',68),

(688,'婴儿外出服',69),

(689,'婴儿内衣',69),

(690,'婴儿礼盒',69),

(691,'婴儿鞋帽袜',69),

(692,'安全防护',69),

(693,'家居床品',69),

(694,'睡袋/抱被',69),

(695,'爬行垫',69),

(696,'妈咪包/背婴带',70),

(697,'产后塑身',70),

(698,'文胸/内裤',70),

(699,'防辐射服',70),

(700,'孕妈装',70),

(701,'孕期营养',70),

(702,'孕妇护肤',70),

(703,'待产护理',70),

(704,'月子装',70),

(705,'防溢乳垫',70),

(706,'套装',71),

(707,'上衣',71),

(708,'裤子',71),

(709,'裙子',71),

(710,'内衣/家居服',71),

(711,'羽绒服/棉服',71),

(712,'亲子装',71),

(713,'儿童配饰',71),

(714,'礼服/演出服',71),

(715,'运动鞋',71),

(716,'皮鞋/帆布鞋',71),

(717,'靴子',71),

(718,'凉鞋',71),

(719,'功能鞋',71),

(720,'户外/运动服',71),

(721,'提篮式',72),

(722,'安全座椅',72),

(723,'增高垫',72),

(724,'钱包',73),

(725,'手拿包',73),

(726,'单肩包',73),

(727,'双肩包',73),

(728,'手提包',73),

(729,'斜挎包',73),

(730,'钥匙包',73),

(731,'卡包/零钱包',73),

(732,'男士钱包',74),

(733,'男士手包',74),

(734,'卡包名片夹',74),

(735,'商务公文包',74),

(736,'双肩包',74),

(737,'单肩/斜挎包',74),

(738,'钥匙包',74),

(739,'电脑包',75),

(740,'拉杆箱',75),

(741,'旅行包',75),

(742,'旅行配件',75),

(743,'休闲运动包',75),

(744,'拉杆包',75),

(745,'登山包',75),

(746,'妈咪包',75),

(747,'书包',75),

(748,'相机包',75),

(749,'腰包/胸包',75),

(750,'火机烟具',76),

(751,'礼品文具',76),

(752,'军刀军具',76),

(753,'收藏品',76),

(754,'工艺礼品',76),

(755,'创意礼品',76),

(756,'礼盒礼券',76),

(757,'鲜花绿植',76),

(758,'婚庆节庆',76),

(759,'京东卡',76),

(760,'美妆礼品',76),

(761,'礼品定制',76),

(762,'京东福卡',76),

(763,'古董文玩',76),

(764,'箱包',77),

(765,'钱包',77),

(766,'服饰',77),

(767,'腰带',77),

(768,'太阳镜/眼镜框',77),

(769,'配件',77),

(770,'鞋靴',77),

(771,'饰品',77),

(772,'名品腕表',77),

(773,'高档化妆品',77),

(774,'婚嫁首饰',78),

(775,'婚纱摄影',78),

(776,'婚纱礼服',78),

(777,'婚庆服务',78),

(778,'婚庆礼品/用品',78),

(779,'婚宴',78),

(780,'饼干蛋糕',79),

(781,'糖果/巧克力',79),

(782,'休闲零食',79),

(783,'冲调饮品',79),

(784,'粮油调味',79),

(785,'牛奶',79),

(786,'其他特产',80),

(787,'新疆',80),

(788,'北京',80),

(789,'山西',80),

(790,'内蒙古',80),

(791,'福建',80),

(792,'湖南',80),

(793,'四川',80),

(794,'云南',80),

(795,'东北',80),

(796,'休闲零食',81),

(797,'坚果炒货',81),

(798,'肉干肉脯',81),

(799,'蜜饯果干',81),

(800,'糖果/巧克力',81),

(801,'饼干蛋糕',81),

(802,'无糖食品',81),

(803,'米面杂粮',82),

(804,'食用油',82),

(805,'调味品',82),

(806,'南北干货',82),

(807,'方便食品',82),

(808,'有机食品',82),

(809,'饮用水',83),

(810,'饮料',83),

(811,'牛奶乳品',83),

(812,'咖啡/奶茶',83),

(813,'冲饮谷物',83),

(814,'蜂蜜/柚子茶',83),

(815,'成人奶粉',83),

(816,'月饼',84),

(817,'大闸蟹',84),

(818,'粽子',84),

(819,'卡券',84),

(820,'铁观音',85),

(821,'普洱',85),

(822,'龙井',85),

(823,'绿茶',85),

(824,'红茶',85),

(825,'乌龙茶',85),

(826,'花草茶',85),

(827,'花果茶',85),

(828,'养生茶',85),

(829,'黑茶',85),

(830,'白茶',85),

(831,'其它茶',85),

(832,'项链',86),

(833,'手链/脚链',86),

(834,'戒指',86),

(835,'耳饰',86),

(836,'毛衣链',86),

(837,'发饰/发卡',86),

(838,'胸针',86),

(839,'饰品配件',86),

(840,'婚庆饰品',86),

(841,'黄金吊坠',87),

(842,'黄金项链',87),

(843,'黄金转运珠',87),

(844,'黄金手镯/手链/脚链',87),

(845,'黄金耳饰',87),

(846,'黄金戒指',87),

(847,'K金吊坠',88),

(848,'K金项链',88),

(849,'K金手镯/手链/脚链',88),

(850,'K金戒指',88),

(851,'K金耳饰',88),

(852,'投资金',89),

(853,'投资银',89),

(854,'投资收藏',89),

(855,'银吊坠/项链',90),

(856,'银手镯/手链/脚链',90),

(857,'银戒指',90),

(858,'银耳饰',90),

(859,'足银手镯',90),

(860,'宝宝银饰',90),

(861,'裸钻',91),

(862,'钻戒',91),

(863,'钻石项链/吊坠',91),

(864,'钻石耳饰',91),

(865,'钻石手镯/手链',91),

(866,'项链/吊坠',92),

(867,'手镯/手串',92),

(868,'戒指',92),

(869,'耳饰',92),

(870,'挂件/摆件/把件',92),

(871,'玉石孤品',92),

(872,'项链/吊坠',93),

(873,'耳饰',93),

(874,'手镯/手链/脚链',93),

(875,'戒指',93),

(876,'头饰/胸针',93),

(877,'摆件/挂件',93),

(878,'琥珀/蜜蜡',94),

(879,'碧玺',94),

(880,'红宝石/蓝宝石',94),

(881,'坦桑石',94),

(882,'珊瑚',94),

(883,'祖母绿',94),

(884,'葡萄石',94),

(885,'其他天然宝石',94),

(886,'项链/吊坠',94),

(887,'耳饰',94),

(888,'手镯/手链',94),

(889,'戒指',94),

(890,'铂金项链/吊坠',95),

(891,'铂金手镯/手链/脚链',95),

(892,'铂金戒指',95),

(893,'铂金耳饰',95),

(894,'小叶紫檀',96),

(895,'黄花梨',96),

(896,'沉香木',96),

(897,'金丝楠',96),

(898,'菩提',96),

(899,'其他',96),

(900,'橄榄核/核桃',96),

(901,'檀香',96),

(902,'珍珠项链',97),

(903,'珍珠吊坠',97),

(904,'珍珠耳饰',97),

(905,'珍珠手链',97),

(906,'珍珠戒指',97),

(907,'珍珠胸针',97),

(908,'机油',98),

(909,'正时皮带',98),

(910,'添加剂',98),

(911,'汽车喇叭',98),

(912,'防冻液',98),

(913,'汽车玻璃',98),

(914,'滤清器',98),

(915,'火花塞',98),

(916,'减震器',98),

(917,'柴机油/辅助油',98),

(918,'雨刷',98),

(919,'车灯',98),

(920,'后视镜',98),

(921,'轮胎',98),

(922,'轮毂',98),

(923,'刹车片/盘',98),

(924,'维修配件',98),

(925,'蓄电池',98),

(926,'底盘装甲/护板',98),

(927,'贴膜',98),

(928,'汽修工具',98),

(929,'改装配件',98),

(930,'导航仪',99),

(931,'安全预警仪',99),

(932,'行车记录仪',99),

(933,'倒车雷达',99),

(934,'蓝牙设备',99),

(935,'车载影音',99),

(936,'净化器',99),

(937,'电源',99),

(938,'智能驾驶',99),

(939,'车载电台',99),

(940,'车载电器配件',99),

(941,'吸尘器',99),

(942,'智能车机',99),

(943,'冰箱',99),

(944,'汽车音响',99),

(945,'车载生活电器',99),

(946,'车蜡',100),

(947,'补漆笔',100),

(948,'玻璃水',100),

(949,'清洁剂',100),

(950,'洗车工具',100),

(951,'镀晶镀膜',100),

(952,'打蜡机',100),

(953,'洗车配件',100),

(954,'洗车机',100),

(955,'洗车水枪',100),

(956,'毛巾掸子',100),

(957,'脚垫',101),

(958,'座垫',101),

(959,'座套',101),

(960,'后备箱垫',101),

(961,'头枕腰靠',101),

(962,'方向盘套',101),

(963,'香水',101),

(964,'空气净化',101),

(965,'挂件摆件',101),

(966,'功能小件',101),

(967,'车身装饰件',101),

(968,'车衣',101),

(969,'安全座椅',102),

(970,'胎压监测',102),

(971,'防盗设备',102),

(972,'应急救援',102),

(973,'保温箱',102),

(974,'地锁',102),

(975,'摩托车',102),

(976,'充气泵',102),

(977,'储物箱',102),

(978,'自驾野营',102),

(979,'摩托车装备',102),

(980,'清洗美容',103),

(981,'功能升级',103),

(982,'保养维修',103),

(983,'油卡充值',103),

(984,'车险',103),

(985,'加油卡',103),

(986,'ETC',103),

(987,'驾驶培训',103),

(988,'赛事服装',104),

(989,'赛事用品',104),

(990,'制动系统',104),

(991,'悬挂系统',104),

(992,'进气系统',104),

(993,'排气系统',104),

(994,'电子管理',104),

(995,'车身强化',104),

(996,'赛事座椅',104),

(997,'跑步鞋',105),

(998,'休闲鞋',105),

(999,'篮球鞋',105),

(1000,'板鞋',105),

(1001,'帆布鞋',105),

(1002,'足球鞋',105),

(1003,'乒羽网鞋',105),

(1004,'专项运动鞋',105),

(1005,'训练鞋',105),

(1006,'拖鞋',105),

(1007,'运动包',105),

(1008,'羽绒服',106),

(1009,'棉服',106),

(1010,'运动裤',106),

(1011,'夹克/风衣',106),

(1012,'卫衣/套头衫',106),

(1013,'T恤',106),

(1014,'套装',106),

(1015,'乒羽网服',106),

(1016,'健身服',106),

(1017,'运动背心',106),

(1018,'毛衫/线衫',106),

(1019,'运动配饰',106),

(1020,'折叠车',107),

(1021,'山地车/公路车',107),

(1022,'电动车',107),

(1023,'其他整车',107),

(1024,'骑行服',107),

(1025,'骑行装备',107),

(1026,'平衡车',107),

(1027,'鱼竿鱼线',108),

(1028,'浮漂鱼饵',108),

(1029,'钓鱼桌椅',108),

(1030,'钓鱼配件',108),

(1031,'钓箱鱼包',108),

(1032,'其它',108),

(1033,'泳镜',109),

(1034,'泳帽',109),

(1035,'游泳包防水包',109),

(1036,'女士泳衣',109),

(1037,'男士泳衣',109),

(1038,'比基尼',109),

(1039,'其它',109),

(1040,'冲锋衣裤',110),

(1041,'速干衣裤',110),

(1042,'滑雪服',110),

(1043,'羽绒服/棉服',110),

(1044,'休闲衣裤',110),

(1045,'抓绒衣裤',110),

(1046,'软壳衣裤',110),

(1047,'T恤',110),

(1048,'户外风衣',110),

(1049,'功能内衣',110),

(1050,'军迷服饰',110),

(1051,'登山鞋',110),

(1052,'雪地靴',110),

(1053,'徒步鞋',110),

(1054,'越野跑鞋',110),

(1055,'休闲鞋',110),

(1056,'工装鞋',110),

(1057,'溯溪鞋',110),

(1058,'沙滩/凉拖',110),

(1059,'户外袜',110),

(1060,'帐篷/垫子',111),

(1061,'睡袋/吊床',111),

(1062,'登山攀岩',111),

(1063,'户外配饰',111),

(1064,'背包',111),

(1065,'户外照明',111),

(1066,'户外仪表',111),

(1067,'户外工具',111),

(1068,'望远镜',111),

(1069,'旅游用品',111),

(1070,'便携桌椅床',111),

(1071,'野餐烧烤',111),

(1072,'军迷用品',111),

(1073,'救援装备',111),

(1074,'滑雪装备',111),

(1075,'极限户外',111),

(1076,'冲浪潜水',111),

(1077,'综合训练器',112),

(1078,'其他大型器械',112),

(1079,'哑铃',112),

(1080,'仰卧板/收腹机',112),

(1081,'其他中小型器材',112),

(1082,'瑜伽舞蹈',112),

(1083,'甩脂机',112),

(1084,'踏步机',112),

(1085,'武术搏击',112),

(1086,'健身车/动感单车',112),

(1087,'跑步机',112),

(1088,'运动护具',112),

(1089,'羽毛球',113),

(1090,'乒乓球',113),

(1091,'篮球',113),

(1092,'足球',113),

(1093,'网球',113),

(1094,'排球',113),

(1095,'高尔夫',113),

(1096,'台球',113),

(1097,'棋牌麻将',113),

(1098,'轮滑滑板',113),

(1099,'其他',113),

(1100,'0-6个月',114),

(1101,'6-12个月',114),

(1102,'1-3岁',114),

(1103,'3-6岁',114),

(1104,'6-14岁',114),

(1105,'14岁以上',114),

(1106,'遥控车',115),

(1107,'遥控飞机',115),

(1108,'遥控船',115),

(1109,'机器人',115),

(1110,'轨道/助力',115),

(1111,'毛绒/布艺',116),

(1112,'靠垫/抱枕',116),

(1113,'芭比娃娃',117),

(1114,'卡通娃娃',117),

(1115,'智能娃娃',117),

(1116,'仿真模型',118),

(1117,'拼插模型',118),

(1118,'收藏爱好',118),

(1119,'炫舞毯',119),

(1120,'爬行垫/毯',119),

(1121,'户外玩具',119),

(1122,'戏水玩具',119),

(1123,'电影周边',120),

(1124,'卡通周边',120),

(1125,'网游周边',120),

(1126,'摇铃/床铃',121),

(1127,'健身架',121),

(1128,'早教启智',121),

(1129,'拖拉玩具',121),

(1130,'积木',122),

(1131,'拼图',122),

(1132,'磁力棒',122),

(1133,'立体拼插',122),

(1134,'手工彩泥',123),

(1135,'绘画工具',123),

(1136,'情景玩具',123),

(1137,'减压玩具',124),

(1138,'创意玩具',124),

(1139,'钢琴',125),

(1140,'电子琴/电钢琴',125),

(1141,'吉他/尤克里里',125),

(1142,'打击乐器',125),

(1143,'西洋管弦',125),

(1144,'民族管弦乐器',125),

(1145,'乐器配件',125),

(1146,'电脑音乐',125),

(1147,'工艺礼品乐器',125),

(1148,'口琴/口风琴/竖笛',125),

(1149,'手风琴',125);


insert  into `base_region`(`id`,`region_name`) values 

('1','华北'),

('2','华东'),

('3','东北'),

('4','华中'),

('5','华南'),

('6','西南'),

('7','西北');



insert  into `base_province`(`id`,`name`,`region_id`,`area_code`) values 

(1,'北京','1','110000'),

(2,'天津市','1','120000'),

(3,'山西','1','140000'),

(4,'内蒙古','1','150000'),

(5,'河北','1','130000'),

(6,'上海','2','310000'),

(7,'江苏','2','320000'),

(8,'浙江','2','330000'),

(9,'安徽','2','340000'),

(10,'福建','2','350000'),

(11,'江西','2','360000'),

(12,'山东','2','370000'),

(14,'台湾','2','710000'),

(15,'黑龙江','3','230000'),

(16,'吉林','3','220000'),

(17,'辽宁','3','210000'),

(18,'陕西','7','610000'),

(19,'甘肃','7','620000'),

(20,'青海','7','630000'),

(21,'宁夏','7','640000'),

(22,'新疆','7','650000'),

(23,'河南','4','410000'),

(24,'湖北','4','420000'),

(25,'湖南','4','430000'),

(26,'广东','5','440000'),

(27,'广西','5','450000'),

(28,'海南','5','460000'),

(29,'香港','5','810000'),

(30,'澳门','5','820000'),

(31,'四川','6','510000'),

(32,'贵州','6','520000'),

(33,'云南','6','530000'),

(13,'重庆','6','500000'),

(34,'西藏','6','540000');