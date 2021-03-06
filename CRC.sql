-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema carsite
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `carsite` ;

-- -----------------------------------------------------
-- Schema carsite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carsite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `carsite` ;

-- -----------------------------------------------------
-- Table `carsite`.`auth_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_group` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `name` ON `carsite`.`auth_group` (`name` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`django_content_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`django_content_type` ;

CREATE TABLE IF NOT EXISTS `carsite`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` ON `carsite`.`django_content_type` (`app_label` ASC, `model` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`auth_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_permission` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `carsite`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 57
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` ON `carsite`.`auth_permission` (`content_type_id` ASC, `codename` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`auth_group_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_group_permissions` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `carsite`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `carsite`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `carsite`.`auth_group_permissions` (`group_id` ASC, `permission_id` ASC);

CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` ON `carsite`.`auth_group_permissions` (`permission_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`auth_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_user` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `username` ON `carsite`.`auth_user` (`username` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`auth_user_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_user_groups` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `carsite`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `carsite`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `carsite`.`auth_user_groups` (`user_id` ASC, `group_id` ASC);

CREATE INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` ON `carsite`.`auth_user_groups` (`group_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`auth_user_user_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`auth_user_user_permissions` ;

CREATE TABLE IF NOT EXISTS `carsite`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `carsite`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `carsite`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `carsite`.`auth_user_user_permissions` (`user_id` ASC, `permission_id` ASC);

CREATE INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` ON `carsite`.`auth_user_user_permissions` (`permission_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`django_admin_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`django_admin_log` ;

CREATE TABLE IF NOT EXISTS `carsite`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `carsite`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `carsite`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` ON `carsite`.`django_admin_log` (`content_type_id` ASC);

CREATE INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` ON `carsite`.`django_admin_log` (`user_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`django_migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`django_migrations` ;

CREATE TABLE IF NOT EXISTS `carsite`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carsite`.`django_session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`django_session` ;

CREATE TABLE IF NOT EXISTS `carsite`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `django_session_expire_date_a5c62663` ON `carsite`.`django_session` (`expire_date` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_state` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_state` (
  `abbreviation` VARCHAR(3) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`abbreviation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carsite`.`main_city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_city` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_city` (
  `city_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `state_abb` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`city_id`),
  CONSTRAINT `main_city_state_abb_5856fc0e_fk_main_state_abbreviation`
    FOREIGN KEY (`state_abb`)
    REFERENCES `carsite`.`main_state` (`abbreviation`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `main_city_state_abb_5856fc0e_fk_main_state_abbreviation` ON `carsite`.`main_city` (`state_abb` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_customer` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `birthday` DATE NOT NULL,
  `address` VARCHAR(150) NOT NULL,
  `phone_number` VARCHAR(30) NOT NULL,
  `occupation` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11572
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `main_customer_name_phone_number_acd6f1a4_uniq` ON `carsite`.`main_customer` (`name` ASC, `phone_number` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_maker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_maker` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_maker` (
  `maker_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`maker_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carsite`.`main_store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_store` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_store` (
  `store_id` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `city_id` INT(11) NOT NULL,
  PRIMARY KEY (`store_id`),
  CONSTRAINT `main_store_city_id_44a31ecb_fk_main_city_city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `carsite`.`main_city` (`city_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `main_store_city_id_44a31ecb_fk_main_city_city_id` ON `carsite`.`main_store` (`city_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_series` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_series` (
  `series_id` INT(11) NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(50) NOT NULL,
  `series` VARCHAR(50) NOT NULL,
  `year` SMALLINT(5) UNSIGNED NOT NULL,
  `price` INT(11) NOT NULL,
  `engine_size` VARCHAR(5) NOT NULL,
  `fuel_system` VARCHAR(20) NOT NULL,
  `tank_capacity` VARCHAR(5) NOT NULL,
  `power` VARCHAR(20) NOT NULL,
  `seating` INT(11) NOT NULL,
  `standard_transmission` VARCHAR(10) NOT NULL,
  `body_type` VARCHAR(15) NOT NULL,
  `car_drive` VARCHAR(4) NOT NULL,
  `car_wheelbase` VARCHAR(8) NOT NULL,
  `maker_id` INT(11) NOT NULL,
  PRIMARY KEY (`series_id`),
  CONSTRAINT `main_series_maker_id_da305d11_fk_main_maker_maker_id`
    FOREIGN KEY (`maker_id`)
    REFERENCES `carsite`.`main_maker` (`maker_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 291
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `main_series_maker_id_model_series_year_b2f056a6_uniq` ON `carsite`.`main_series` (`maker_id` ASC, `model` ASC, `series` ASC, `year` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_vehicleinstance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_vehicleinstance` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_vehicleinstance` (
  `vehicle_id` INT(11) NOT NULL,
  `series_id` INT(11) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `main_vehicleinstance_series_id_51b9b998_fk_main_series_series_id`
    FOREIGN KEY (`series_id`)
    REFERENCES `carsite`.`main_series` (`series_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `main_vehicleinstance_series_id_51b9b998_fk_main_series_series_id` ON `carsite`.`main_vehicleinstance` (`series_id` ASC);


-- -----------------------------------------------------
-- Table `carsite`.`main_rental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carsite`.`main_rental` ;

CREATE TABLE IF NOT EXISTS `carsite`.`main_rental` (
  `order_id` INT(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `returned_date` DATE NOT NULL,
  `order_date` DATE NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `pick_up_store_id` INT(11) NOT NULL,
  `return_store_id` INT(11) NOT NULL,
  `vehicle_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `main_rental_customer_id_613b6da3_fk_main_customer_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `carsite`.`main_customer` (`customer_id`),
  CONSTRAINT `main_rental_pick_up_store_id_47b5d092_fk_main_store_store_id`
    FOREIGN KEY (`pick_up_store_id`)
    REFERENCES `carsite`.`main_store` (`store_id`),
  CONSTRAINT `main_rental_return_store_id_dcbe9ebe_fk_main_store_store_id`
    FOREIGN KEY (`return_store_id`)
    REFERENCES `carsite`.`main_store` (`store_id`),
  CONSTRAINT `main_rental_vehicle_id_b4aaaa09_fk_main_vehi`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `carsite`.`main_vehicleinstance` (`vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `main_rental_customer_id_613b6da3_fk_main_customer_customer_id` ON `carsite`.`main_rental` (`customer_id` ASC);

CREATE INDEX `main_rental_pick_up_store_id_47b5d092_fk_main_store_store_id` ON `carsite`.`main_rental` (`pick_up_store_id` ASC);

CREATE INDEX `main_rental_return_store_id_dcbe9ebe_fk_main_store_store_id` ON `carsite`.`main_rental` (`return_store_id` ASC);

CREATE INDEX `main_rental_vehicle_id_b4aaaa09_fk_main_vehi` ON `carsite`.`main_rental` (`vehicle_id` ASC);


--
-- Dumping data for table `main_city`
--

LOCK TABLES `main_city` WRITE;
/*!40000 ALTER TABLE `main_city` DISABLE KEYS */;
INSERT INTO `main_city` VALUES (1,'Alexandria                    ','NSW'),(2,'Coffs Harbour                 ','NSW'),(3,'Darlinghurst                  ','NSW'),(4,'Goulburn                      ','NSW'),(5,'Lane Cove                     ','NSW'),(6,'Lavender Bay                  ','NSW'),(7,'Malabar                       ','NSW'),(8,'Matraville                    ','NSW'),(9,'Milsons Point                 ','NSW'),(10,'Newcastle                     ','NSW'),(11,'North Ryde                    ','NSW'),(12,'North Sydney                  ','NSW'),(13,'Port Macquarie                ','NSW'),(14,'Rhodes                        ','NSW'),(15,'Silverwater                   ','NSW'),(16,'Springwood                    ','NSW'),(17,'St. Leonards                  ','NSW'),(18,'Sydney                        ','NSW'),(19,'Wollongong                    ','NSW'),(20,'Brisbane                      ','QLD'),(21,'Caloundra                     ','QLD'),(22,'East Brisbane                 ','QLD'),(23,'Gold Coast                    ','QLD'),(24,'Hawthorne                     ','QLD'),(25,'Hervey Bay                    ','QLD'),(26,'Rockhampton                   ','QLD'),(27,'Townsville                    ','QLD'),(28,'Cloverdale                    ','SA'),(29,'Findon                        ','SA'),(30,'Perth                         ','SA'),(31,'Hobart                        ','TAS'),(32,'Bendigo                       ','VIC'),(33,'Cranbourne                    ','VIC'),(34,'Geelong                       ','VIC'),(35,'Melbourne                     ','VIC'),(36,'Melton                        ','VIC'),(37,'Seaford                       ','VIC'),(38,'South Melbourne               ','VIC'),(39,'Sunbury                       ','VIC'),(40,'Warrnambool                   ','VIC');
/*!40000 ALTER TABLE `main_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_customer`
--

LOCK TABLES `main_customer` WRITE;
/*!40000 ALTER TABLE `main_customer` DISABLE KEYS */;
INSERT INTO `main_customer` VALUES (11010,'Jacquelyn S','M','1968-02-16','800 Corrinne Court','1 (11) 543 535-016*','Labour'),(11011,'Curtis L','M','1967-11-14','224 Shoenic','1 (11) 543 535-011*','Labour'),(11012,'Lauren W','F','1972-01-07','785 Scott Street','717-535-016*','Labour'),(11013,'Ian J','M','1972-08-16','902 Hudson Ave.','817-535-018*','Labour'),(11014,'Sydney B','M','1972-05-08','7011 Tank Drive','431-535-015*','Labour'),(11015,'Chloe Y','F','1983-02-27','44 Willow Pass Road','208-535-014*','Labour'),(11016,'Wyatt H','M','1983-04-07','666 Northridge Ct.','135-535-017*','Labour'),(11017,'Shannon W','M','1948-06-26','330 Saddlehill Lane','1 (11) 543 535-019*','Labour'),(11018,'Clarence R','F','1948-10-19','44 Rivewview','1 (11) 543 535-013*','Labour'),(11019,'Luke L','M','1982-03-17','832 Landing Dr','262-535-011*','Labour'),(11050,'Alan Z','F','1955-09-17','741 Gainborough Dr.','1 (11) 543 535-013*','Labour'),(11051,'Daniel J','F','1955-08-14','85 Sunnyvale Avenue','1 (11) 543 535-015*','Labour'),(11052,'Heidi L','F','1955-08-17','514 Via Cordona','1 (11) 543 535-016*','Labour'),(11053,'Ana P','M','1984-08-20','660 Stonyhill Circle','859-535-011*','Labour'),(11054,'Deanna M','M','1956-03-20','825 B Way','1 (11) 543 535-019*','Labour'),(11055,'Gilbert R','F','1956-03-15','811 The Trees Dr.','1 (11) 543 535-012*','Labour'),(11056,'Michele N','M','1957-04-13','464 Janin Pl.','1 (11) 543 535-017*','Labour'),(11057,'Carl A','F','1957-10-22','930 Lake Nadine Place','1 (11) 543 535-018*','Labour'),(11058,'Marc D','F','1958-04-27','645 Sinaloa','1 (11) 543 535-014*','Labour'),(11059,'Ashlee A','F','1958-04-11','255 Highland Road','1 (11) 543 535-011*','Labour'),(11111,'Meredith G','M','1966-02-23','610 Northridge Ct.','1 (11) 543 535-017*','Labour'),(11112,'Crystal W','F','1966-09-19','773 Kirkwood Dr','1 (11) 543 535-013*','Labour'),(11113,'Micheal B','M','1966-02-21','96 Marfargoa Drive','1 (11) 543 535-013*','Labour'),(11114,'Leslie M','M','1966-05-07','941 Cristobal','1 (11) 543 535-011*','Labour'),(11115,'Alvin C','M','1966-02-22','759 Azalea Avenue','1 (11) 543 535-019*','Labour'),(11116,'Clinton C','M','1966-10-17','943 Cunha Ct.','1 (11) 543 535-018*','Labour'),(11117,'April D','F','1965-02-21','85 Ash Lane','1 (11) 543 535-018*','Labour'),(11119,'Evan J','F','1939-04-20','157 Sierra Ridge','1 (11) 543 535-018*','Retiree'),(11150,'Russell S','F','1945-03-25','755 Easley Drive','1 (11) 543 535-019*','Retiree'),(11151,'Melinda G','F','1946-02-25','05 Rainier Dr.','1 (11) 543 535-011*','Labour'),(11152,'James W','F','1980-01-20','827 Seagull Court','355-535-015*','Labour'),(11153,'Angela J','F','1980-06-23','877 Weatherly Drive','847-535-011*','Labour'),(11154,'Megan W','F','1980-08-21','898 Holiday Hills','918-535-018*','Labour'),(11155,'Hunter R','F','1980-01-26','356 Mori Court','891-535-012*','Labour'),(11156,'Maria R','M','1980-02-17','452 Mariposa Ct.','158-535-019*','Labour'),(11157,'Hannah L','M','1979-06-21','832 Preston Ct.','974-535-017*','Labour'),(11158,'Jason W','F','1979-10-18','771 Bundros Court','694-535-017*','Labour'),(11159,'Brianna H','F','1979-09-27','793 Bonifacio St.','319-535-018*','Labour'),(11250,'Shannon L','F','1959-03-22','185 Keywood Ct.','1 (11) 543 535-011*','Manager'),(11251,'Xavier L','M','1936-07-14','245 Dantley Way','243-535-011*','Retiree'),(11256,'Katelyn H','M','1937-09-20','496 Deerfield Dr.','249-535-011*','Retiree'),(11258,'Xavier H','F','1937-06-07','707 Virgil Street','559-535-014*','Retiree'),(11259,'Victoria S','M','1969-03-27','623 Barquentine Court','230-535-013*','Manager'),(11310,'Erin S','M','1957-07-19','541 Black Point Pl','233-535-016*','Manager'),(11311,'Gabrielle L','F','1957-08-24','619 Parkside Dr.','783-535-017*','Manager'),(11312,'Sara R','M','1957-04-13','375 Kipling Court','296-535-017*','Manager'),(11313,'Trevor J','F','1957-02-27','697 Yosemite Dr.','120-535-012*','Manager'),(11314,'Mya F','F','1957-12-21','439 Rio Grande Drive','522-535-014*','Manager'),(11315,'Hailey W','F','1957-10-11','321 Maya','767-535-015*','Manager'),(11316,'Luke A','F','1957-11-27','19 Deermeadow Way','786-535-013*','Manager'),(11317,'Victoria R','M','1956-09-27','268 Keller Ridge','663-535-019*','Manager'),(11318,'Jessica W','M','1956-10-26','652 Willcrest Circle','702-535-018*','Manager'),(11319,'Jade B','F','1941-04-27','119 Northridge Ct','819-535-016*','Retiree'),(11350,'Cara Z','M','1941-01-24','280 Greendell Pl','1 (11) 543 535-011*','Retiree'),(11351,'Anne R','M','1943-04-16','113 Eastgate Ave.','1 (11) 543 535-014*','Retiree'),(11352,'Raymond R','F','1944-03-17','4, impasse Ste-Madeleine','1 (11) 543 535-013*','Retiree'),(11410,'Maurice G','M','1972-08-25','5, avenue de la Gare','1 (11) 543 535-017*','Manager'),(11411,'Devin R','M','1958-02-22','ostenweg 2428','1 (11) 543 535-017*','Manager'),(11412,'Sydney B','M','1958-04-19','ostfach 99 92 92','1 (11) 543 535-015*','Manager'),(11413,'Megan S','F','1958-04-25','192 Seagull Court','1 (11) 543 535-011*','Manager'),(11414,'Ian R','M','1958-03-07','26 W. Buchanan Rd.','1 (11) 543 535-011*','Manager'),(11415,'Randy S','M','1948-06-15','o?str 5538','1 (11) 543 535-014*','Manager'),(11416,'Katrina B','F','1949-03-29','205, rue Malar','1 (11) 543 535-015*','Manager'),(11417,'Lacey Z','F','1949-02-26',', rue de Linois','1 (11) 543 535-017*','Manager'),(11418,'Rafael H','M','1949-02-19','eiter Weg 7765','1 (11) 543 535-015*','Manager'),(11419,'Kyle S','M','1949-02-07','381 Alpine Rd.','1 (11) 543 535-017*','Manager'),(11459,'Tasha D','M','1976-10-23','627 Kendall Rd','1 (11) 543 535-017*','Nurse'),(11510,'Seth R','M','1957-07-23','989 Concord Ave','199-535-014*','Nurse'),(11511,'Caleb P','F','1957-06-24','324 Cherry Street','786-535-013*','Nurse'),(11512,'Natalie C','M','1958-08-23','481 Broadmoor Drive','178-535-014*','Nurse'),(11513,'Alyssa H','M','1958-09-27','780 Conifer Terrace','805-535-018*','Nurse'),(11514,'Dalton D','F','1958-04-20','033 Danesta Dr.','994-535-015*','Nurse'),(11515,'Shannon H','F','1958-02-25','679 Duke Way','458-535-011*','Nurse'),(11516,'Mya G','F','1958-10-21','826 Fine Drive','211-535-011*','Nurse'),(11517,'Katherine B','F','1958-06-20','761 Dancing Court','802-535-013*','Nurse'),(11518,'Edward W','F','1959-05-20','747 Carmel Dr.','446-535-017*','Nurse'),(11519,'Jerome N','M','1959-03-27','537 Ridgewood Drive','934-535-019*','Nurse'),(11535,'Alexandria H','M','1930-07-18','1, rue de la Cavalerie','1 (11) 543 535-018*','Retiree'),(11550,'Deb T','M','1972-08-18','553 Harness Circle','1 (11) 543 535-012*','Nurse'),(11551,'Shannon A','F','1971-05-25','68, avenue de l?Europe','1 (11) 543 535-015*','Nurse'),(11552,'Eddie R','M','1971-05-27','eiderplatz 662','1 (11) 543 535-015*','Nurse'),(11553,'Sharon L','F','1971-09-19','804 Coldwater Drive','1 (11) 543 535-011*','Nurse'),(11554,'Sydney S','F','1930-09-07','8, avenue de l? Union Centrale','1 (11) 543 535-019*','Retiree'),(11556,'Lucas E','M','1971-05-24','663 A St.','1 (11) 543 535-015*','Nurse'),(11557,'Felicia R','M','1971-01-25','557 Steven Circle','1 (11) 543 535-019*','Nurse'),(11558,'Ivan M','M','1971-08-22','086 Nottingham Place','1 (11) 543 535-019*','Nurse'),(11559,'Frederick S','M','1971-12-26','otth?user Weg 636','1 (11) 543 535-011*','Nurse'),(11560,'daryltttt','M','1996-03-13','asd','12','qwe'),(11561,'darylcc','M','1996-03-03','asd','232','ddd'),(11562,'daryllllll','F','1996-09-13','asdasd','123','qweqwe'),(11563,'daryllllllss','M','1996-09-13','asdasd','1234','qweqwe'),(11564,'dawewe','M','1996-09-03','oasdsad','9999','asdasd'),(11565,'customah','M','1996-01-03','asdsad','9123123','we'),(11566,'dsad','M','1996-12-03','asddd','332','asdd'),(11567,'darylt','M','1994-10-03','asd','123','asdasd'),(11568,'dadad','M','1996-12-13','asd','123','321'),(11569,'da','F','1996-12-13','qwe','123','qwe'),(11570,'dw','M','1996-01-13','asd','123','q'),(11571,'ddddd','M','1996-12-13','asdsd','123123','asd');
/*!40000 ALTER TABLE `main_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_maker`
--

LOCK TABLES `main_maker` WRITE;
/*!40000 ALTER TABLE `main_maker` DISABLE KEYS */;
INSERT INTO `main_maker` VALUES (1,'LAND ROVER'),(2,'BMW'),(3,'NULL'),(4,'PEUGEOT'),(5,'VOLVO'),(6,'NISSAN'),(7,'EUNOS'),(8,'CHRYSLER'),(9,'MAZDA'),(10,'MITSUBISHI'),(11,'TOYOTA'),(12,'AUDI'),(13,'SAAB'),(14,'HONDA'),(15,'DATSUN'),(16,'VOLKSWAGEN'),(17,'ALFA ROMEO'),(18,'MERCEDES-BENZ'),(19,'RENAULT');
/*!40000 ALTER TABLE `main_maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_rental`
--

LOCK TABLES `main_rental` WRITE;
/*!40000 ALTER TABLE `main_rental` DISABLE KEYS */;
INSERT INTO `main_rental` VALUES (1,'1996-12-13','1996-12-13','1996-12-13',11019,15,16,14881),(3,'2005-07-03','2005-07-11','2005-07-03',11014,3,16,14806),(4,'2005-07-04','2005-07-09','2005-07-04',11012,12,8,14816),(5,'2005-07-05','2005-07-10','2005-07-05',11011,5,5,14810),(6,'2005-07-09','2005-07-15','2005-07-06',11011,6,25,14812),(7,'2005-07-07','2005-07-15','2005-07-07',11014,7,14,14814),(9,'2005-07-09','2005-07-18','2005-07-09',11014,9,18,14818),(11,'2005-07-11','2005-07-16','2005-07-11',11059,11,13,14811),(13,'2005-07-14','2005-07-21','2005-07-13',11054,50,13,14813),(15,'2005-07-15','2005-07-24','2005-07-15',11056,15,15,14815),(17,'2005-07-17','2005-07-22','2005-07-17',11011,17,50,14817),(19,'2005-07-20','2005-08-10','2005-07-19',11017,14,14,14819),(20,'2005-07-23','2005-08-04','2005-07-20',11052,15,35,14835),(21,'2005-07-21','2005-08-10','2005-07-21',11053,50,1,14842),(22,'2005-07-22','2005-08-08','2005-07-22',11018,17,39,14839),(23,'2005-07-23','2005-08-07','2005-07-23',11015,15,25,14838),(24,'2005-07-27','2005-08-12','2005-07-24',11018,19,19,14843),(25,'2005-07-25','2005-08-14','2005-07-25',11016,25,5,14850),(26,'2005-07-29','2005-08-14','2005-07-26',11018,21,21,14847),(27,'2005-07-27','2005-08-12','2005-07-27',11051,19,3,14846),(28,'2005-07-28','2005-08-21','2005-07-28',11054,50,22,14851),(29,'2005-07-29','2005-08-18','2005-07-29',11016,29,9,14858),(30,'2005-07-30','2005-08-20','2005-07-30',11016,30,10,14860),(31,'2005-07-31','2005-08-24','2005-07-31',11012,21,24,14831),(32,'2005-08-04','2005-08-06','2005-08-01',11015,21,21,14832),(33,'2005-08-02','2005-08-07','2005-08-02',11019,33,15,14833),(34,'2005-08-03','2005-08-24','2005-08-03',11057,21,21,14834),(36,'2005-08-05','2005-08-26','2005-08-05',11057,23,23,14836),(37,'2005-08-06','2005-08-15','2005-08-06',11013,37,37,14837),(40,'2005-08-10','2005-09-21','2005-08-09',11013,40,15,14880),(42,'2005-08-14','2005-08-16','2005-08-11',11015,13,13,14855),(44,'2005-08-16','2005-08-28','2005-08-13',11051,15,19,14859),(46,'2005-08-15','2005-09-01','2005-08-15',11051,17,23,14863),(47,'2005-08-16','2005-08-24','2005-08-16',11053,7,14,14854),(48,'2005-08-18','2005-09-08','2005-08-17',11017,22,30,14870),(52,'2005-08-21','2005-09-07','2005-08-21',11015,23,16,14852),(53,'2005-08-22','2005-09-10','2005-08-22',11018,9,9,14853),(56,'2005-08-26','2005-09-10','2005-08-25',11019,16,14,14856),(57,'2005-08-26','2005-09-14','2005-08-26',11018,13,13,14857),(61,'2005-08-30','2005-09-18','2005-08-30',11054,17,21,14861),(62,'2005-08-31','2005-09-16','2005-08-31',11011,50,22,14862),(64,'2005-09-02','2005-09-23','2005-09-02',11052,17,17,14864),(65,'2005-09-03','2005-09-11','2005-09-03',11054,18,25,14865),(66,'2005-09-05','2005-09-13','2005-09-04',11056,26,26,14866),(67,'2005-09-05','2005-09-10','2005-09-05',11011,27,27,14867),(71,'2005-09-09','2005-09-14','2005-09-09',11011,31,31,14871),(72,'2005-09-11','2005-10-01','2005-09-10',11010,32,21,14872),(73,'2005-09-11','2005-09-16','2005-09-11',11015,23,23,14873),(74,'2005-09-15','2005-09-17','2005-09-12',11015,24,24,14874),(75,'2005-09-14','2005-10-14','2005-09-13',11017,28,28,14875),(76,'2005-09-15','2005-09-19','2005-09-14',11015,26,26,14876),(77,'2005-09-15','2005-09-24','2005-09-15',11013,37,37,14877),(78,'2005-09-17','2005-09-24','2005-09-16',11014,38,13,14878),(79,'2005-09-17','2005-09-25','2005-09-17',11014,39,14,14879),(81,'2005-09-19','2005-09-24','2005-09-19',11051,13,13,14881),(82,'2005-09-20','2005-10-11','2005-09-20',11057,12,12,14882),(83,'2005-09-21','2005-09-26','2005-09-21',11055,3,3,14883),(84,'2005-09-23','2005-10-10','2005-09-22',11010,4,4,14884),(85,'2005-09-24','2005-10-14','2005-09-23',11052,20,20,14885),(86,'2005-09-27','2005-10-12','2005-09-24',11054,21,6,14886),(87,'2005-09-25','2005-10-13','2005-09-25',11058,7,7,14887),(88,'2005-09-26','2005-10-17','2005-09-26',11052,23,23,14888),(89,'2005-09-27','2005-10-12','2005-09-27',11051,21,21,14889),(90,'2005-09-29','2005-10-19','2005-09-28',11057,20,20,14890),(91,'2005-09-29','2005-10-17','2005-09-29',11014,11,10,14891),(92,'2005-09-30','2005-10-15','2005-09-30',11015,24,24,14892),(94,'2005-10-02','2005-10-07','2005-10-02',11051,24,24,14894),(95,'2005-10-03','2005-10-08','2005-10-03',11015,25,25,14895),(96,'2005-10-05','2005-10-09','2005-10-04',11051,26,26,14896),(97,'2005-10-05','2005-10-13','2005-10-05',11014,17,14,14897),(99,'2005-10-08','2005-10-28','2005-10-07',11017,14,14,14899),(100,'2005-10-09','2005-10-17','2005-10-08',11016,20,20,14900),(101,'2005-10-09','2005-10-18','2005-10-09',11113,21,21,14901),(102,'2005-10-10','2005-10-18','2005-10-10',11114,17,22,14902),(103,'2005-10-11','2005-10-22','2005-10-11',11114,18,10,14903),(104,'2005-10-15','2005-10-21','2005-10-12',11116,24,24,14904),(105,'2005-10-13','2005-10-18','2005-10-13',11115,25,25,14905),(106,'2005-10-14','2005-10-25','2005-10-14',11112,21,10,14906),(107,'2005-10-15','2005-10-24','2005-10-15',11113,27,27,14907),(108,'2005-10-17','2005-10-21','2005-10-16',11111,20,20,14908),(109,'2005-10-17','2005-10-22','2005-10-17',11119,29,15,14909),(110,'2005-10-21','2005-11-19','2005-10-18',11112,25,25,14910),(111,'2005-10-19','2005-11-10','2005-10-19',11117,21,21,14911),(112,'2005-10-21','2005-10-25','2005-10-20',11119,32,10,14912),(114,'2005-10-23','2005-10-27','2005-10-22',11111,26,26,14914),(115,'2005-10-23','2005-10-28','2005-10-23',11115,35,35,14915),(120,'2005-10-28','2005-11-10','2005-10-28',11117,12,13,14920),(121,'2005-10-29','2005-11-17','2005-10-29',11114,18,1,14921),(122,'2005-10-30','2005-11-18','2005-10-30',11158,2,2,14922),(123,'2005-10-31','2005-11-12','2005-10-31',11116,3,9,14923),(124,'2005-11-01','2005-11-12','2005-11-01',11111,15,10,14924),(125,'2005-11-02','2005-11-11','2005-11-02',11116,5,5,14925),(126,'2005-11-04','2005-11-24','2005-11-03',11112,20,20,14926),(127,'2005-11-04','2005-11-28','2005-11-04',11115,7,24,14927),(128,'2005-11-06','2005-11-13','2005-11-05',11158,8,8,14928),(129,'2005-11-07','2005-12-01','2005-11-06',11159,20,25,14929),(130,'2005-11-07','2005-11-15','2005-11-07',11114,24,10,14930),(140,'2005-11-18','2005-11-22','2005-11-17',11155,20,20,14940),(141,'2005-11-18','2005-12-10','2005-11-18',11154,21,12,14941),(142,'2005-11-19','2005-12-10','2005-11-19',11152,18,18,14942),(143,'2005-11-20','2005-12-02','2005-11-20',11154,23,12,14943),(144,'2005-11-24','2005-12-06','2005-11-21',11153,21,14,14944),(145,'2005-11-22','2005-12-11','2005-11-22',11116,25,25,14945),(146,'2005-11-24','2005-11-28','2005-11-23',11155,26,26,14946),(147,'2005-11-24','2005-12-05','2005-11-24',11117,18,10,14947),(148,'2005-11-26','2005-12-10','2005-11-25',11119,28,11,14948),(149,'2005-11-27','2005-12-15','2005-11-26',11153,26,26,14949),(150,'2005-11-27','2005-12-15','2005-11-27',11154,30,30,14950),(162,'2005-12-10','2006-01-03','2005-12-09',11154,2,26,14967),(165,'2005-12-12','2005-12-22','2005-12-12',11158,5,15,14960),(166,'2005-12-13','2005-12-19','2005-12-13',11154,6,9,14961),(167,'2005-12-14','2005-12-24','2005-12-14',11154,7,14,14962),(169,'2005-12-16','2005-12-24','2005-12-16',11158,9,9,14964),(174,'2005-12-22','2006-01-01','2005-12-21',11158,14,25,14969),(181,'2005-12-28','2006-01-03','2005-12-28',11154,21,21,14966),(184,'2005-12-31','2006-01-16','2005-12-31',11159,19,15,14965),(192,'2006-01-09','2006-01-13','2006-01-08',11151,32,32,14963),(194,'2006-01-13','2006-01-12','2006-01-10',11150,9,11,14985),(199,'2006-01-15','2006-01-24','2006-01-15',11156,15,15,14984),(200,'2006-01-17','2006-01-21','2006-01-16',11154,40,4,15004),(201,'2006-01-17','2006-02-03','2006-01-17',11250,1,18,15001),(202,'2006-01-19','2006-01-23','2006-01-18',11259,2,11,15002),(203,'2006-01-19','2006-02-11','2006-01-19',11258,18,12,15003),(205,'2006-01-21','2006-01-27','2006-01-21',11251,5,11,15005),(206,'2006-01-25','2006-02-11','2006-01-22',11259,6,9,15006),(207,'2006-01-23','2006-02-12','2006-01-23',11253,7,7,15007),(208,'2006-01-24','2006-02-24','2006-01-24',11258,23,38,15008),(209,'2006-01-25','2006-02-02','2006-01-25',11253,9,16,15009),(210,'2006-01-27','2006-02-11','2006-01-26',11251,10,10,15010),(217,'2006-02-02','2006-02-10','2006-02-02',11250,17,17,15000),(219,'2006-02-04','2006-02-25','2006-02-04',11257,31,31,14988),(220,'2006-02-06','2006-02-10','2006-02-05',11251,20,20,15020),(221,'2006-02-06','2006-02-27','2006-02-06',11257,15,15,15021),(222,'2006-02-08','2006-02-12','2006-02-07',11251,22,22,15022),(223,'2006-02-08','2006-02-17','2006-02-08',11253,23,23,15023),(224,'2006-02-12','2006-03-10','2006-02-09',11256,24,29,15024),(225,'2006-02-10','2006-02-18','2006-02-10',11258,19,19,15025),(226,'2006-02-11','2006-03-12','2006-02-11',11252,15,15,15026),(227,'2006-02-12','2006-02-21','2006-02-12',11256,27,27,15027),(228,'2006-02-14','2006-02-22','2006-02-13',11256,28,28,15028),(229,'2006-02-14','2006-02-19','2006-02-14',11259,29,11,15029),(230,'2006-02-18','2006-03-16','2006-02-15',11252,19,19,15030),(236,'2006-02-24','2006-03-12','2006-02-21',11252,25,25,15011),(240,'2006-02-28','2006-03-15','2006-02-25',11219,13,18,15040),(241,'2006-02-27','2006-03-12','2006-02-26',11219,14,15,15041),(243,'2006-02-28','2006-03-08','2006-02-28',11213,20,11,15043),(244,'2006-03-02','2006-04-05','2006-03-01',11218,4,39,15044),(245,'2006-03-02','2006-03-20','2006-03-02',11215,5,18,15045),(246,'2006-03-04','2006-03-28','2006-03-03',11217,22,30,15046),(247,'2006-03-04','2006-03-12','2006-03-04',11218,7,12,15047),(248,'2006-03-05','2006-03-20','2006-03-05',11216,25,22,15048),(249,'2006-03-06','2006-03-24','2006-03-06',11214,9,27,15049),(250,'2006-03-07','2006-03-12','2006-03-07',11219,23,11,15050),(254,'2006-03-14','2006-03-18','2006-03-11',11210,12,20,15042),(278,'2006-04-04','2006-04-15','2006-04-04',11255,12,22,15066),(280,'2006-04-06','2006-04-13','2006-04-06',11257,17,24,15063),(281,'2006-04-07','2006-05-13','2006-04-07',11251,1,37,15082),(282,'2006-04-09','2006-04-17','2006-04-08',11256,2,2,15087),(283,'2006-04-09','2006-04-11','2006-04-09',11252,15,17,15068),(284,'2006-04-11','2006-04-19','2006-04-10',11254,4,13,15088),(286,'2006-04-12','2006-04-19','2006-04-12',11256,6,9,15081),(291,'2006-04-17','2006-05-07','2006-04-17',11250,11,31,15085),(292,'2006-04-18','2006-05-15','2006-04-18',11251,12,39,15083),(295,'2006-04-21','2006-04-26','2006-04-21',11255,11,11,15084),(296,'2006-04-23','2006-04-25','2006-04-22',11254,16,19,15080),(300,'2006-04-27','2006-05-15','2006-04-26',11253,20,20,15100),(301,'2006-04-27','2006-05-08','2006-04-27',11355,21,11,15101),(302,'2006-04-29','2006-05-13','2006-04-28',11359,22,10,15102),(303,'2006-04-29','2006-05-14','2006-04-29',11351,19,19,15103),(304,'2006-04-30','2006-05-12','2006-04-30',11350,24,12,15104),(305,'2006-05-01','2006-05-10','2006-05-01',11353,25,25,15105),(307,'2006-05-03','2006-05-08','2006-05-03',11355,27,27,15107),(308,'2006-05-04','2006-05-25','2006-05-04',11352,25,25,15108),(309,'2006-05-05','2006-05-14','2006-05-05',11353,29,29,15109),(310,'2006-05-06','2006-05-11','2006-05-06',11351,24,24,15110),(315,'2006-05-11','2006-05-19','2006-05-11',11350,35,35,15089),(321,'2006-05-17','2006-05-25','2006-05-17',11350,1,1,15121),(325,'2006-05-21','2006-05-29','2006-05-21',11358,5,5,15125),(326,'2006-05-25','2006-06-13','2006-05-22',11352,25,25,15126),(330,'2006-05-26','2006-06-17','2006-05-26',11352,29,29,15130),(331,'2006-05-27','2006-05-29','2006-05-27',11312,25,26,15106),(333,'2006-05-29','2006-06-12','2006-05-29',11318,14,16,15119),(334,'2006-05-30','2006-06-18','2006-05-30',11350,14,14,15128),(336,'2006-06-02','2006-06-04','2006-06-01',11314,16,19,15129),(337,'2006-06-03','2006-06-03','2006-06-02',11312,10,11,15127),(340,'2006-06-05','2006-06-16','2006-06-05',11351,15,11,15140),(342,'2006-06-08','2006-07-06','2006-06-07',11314,22,28,15142),(343,'2006-06-08','2006-06-13','2006-06-08',11311,23,23,15143),(344,'2006-06-12','2006-06-18','2006-06-09',11316,24,24,15144),(345,'2006-06-10','2006-06-28','2006-06-10',11313,25,18,15145),(346,'2006-06-12','2006-06-16','2006-06-11',11311,26,26,15146),(347,'2006-06-13','2006-07-13','2006-06-12',11312,20,20,15147),(348,'2006-06-14','2006-07-14','2006-06-13',11317,26,26,15148),(349,'2006-06-14','2006-07-15','2006-06-14',11317,27,27,15149),(350,'2006-06-18','2006-06-23','2006-06-15',11314,30,16,15150),(353,'2006-06-18','2006-06-26','2006-06-18',11311,33,40,15123),(354,'2006-06-20','2006-06-24','2006-06-19',11311,34,34,15124),(358,'2006-06-24','2006-07-12','2006-06-23',11313,38,38,15122),(361,'2006-06-26','2006-07-06','2006-06-26',11316,1,11,15165),(362,'2006-06-28','2006-07-08','2006-06-27',11313,2,13,15166),(364,'2006-06-29','2006-08-10','2006-06-29',11316,4,35,15168),(365,'2006-06-30','2006-07-04','2006-06-30',11316,5,9,15169),(367,'2006-07-02','2006-07-13','2006-07-02',11316,7,18,15161),(368,'2006-07-04','2006-07-10','2006-07-03',11313,8,12,15162),(374,'2006-07-10','2006-07-17','2006-07-09',11318,14,14,15167),(380,'2006-07-16','2006-07-24','2006-07-15',11310,20,29,15163),(387,'2006-07-22','2006-08-10','2006-07-22',11314,27,11,15160),(392,'2006-07-27','2006-08-16','2006-07-27',11315,11,31,15181),(397,'2006-08-01','2006-08-02','2006-08-01',11312,11,12,15186),(399,'2006-08-03','2006-08-08','2006-08-03',11315,15,15,15184),(400,'2006-08-05','2006-08-13','2006-08-04',11315,16,9,15209),(401,'2006-08-05','2006-08-13','2006-08-05',11410,1,1,15201),(402,'2006-08-07','2006-08-21','2006-08-06',11419,2,14,15202),(403,'2006-08-07','2006-08-12','2006-08-07',11415,3,3,15203),(404,'2006-08-09','2006-08-19','2006-08-08',11410,4,15,15204),(405,'2006-08-09','2006-09-08','2006-08-09',11418,5,34,15205),(406,'2006-08-10','2006-08-17','2006-08-10',11413,6,13,15206),(407,'2006-08-11','2006-08-19','2006-08-11',11411,23,14,15207),(408,'2006-08-13','2006-08-23','2006-08-12',11416,8,19,15208),(410,'2006-08-14','2006-09-15','2006-08-14',11412,29,29,15210),(411,'2006-08-15','2006-08-21','2006-08-15',11419,11,17,15200),(418,'2006-08-22','2006-09-10','2006-08-22',11414,19,18,15199),(420,'2006-08-25','2006-09-04','2006-08-24',11418,20,11,15220),(421,'2006-08-25','2006-09-14','2006-08-25',11416,21,21,15221),(422,'2006-08-27','2006-09-11','2006-08-26',11411,20,20,15222),(423,'2006-08-27','2006-09-08','2006-08-27',11418,23,12,15223),(424,'2006-08-28','2006-09-26','2006-08-28',11415,24,14,15224),(425,'2006-08-29','2006-09-25','2006-08-29',11412,26,26,15225),(426,'2006-08-30','2006-09-15','2006-08-30',11411,24,24,15226),(427,'2006-08-31','2006-09-16','2006-08-31',11411,25,25,15227),(428,'2006-09-02','2006-09-10','2006-09-01',11413,28,28,15228),(429,'2006-09-02','2006-09-07','2006-09-02',11411,24,24,15229),(430,'2006-09-03','2006-09-12','2006-09-03',11416,30,30,15230),(440,'2006-09-14','2006-09-14','2006-09-13',11418,40,1,15241),(442,'2006-09-16','2006-09-28','2006-09-15',11415,2,14,15242),(443,'2006-09-16','2006-09-28','2006-09-16',11416,3,15,15243),(444,'2006-09-18','2006-10-06','2006-09-17',11410,4,22,15244),(445,'2006-09-18','2006-10-10','2006-09-18',11412,25,27,15245),(446,'2006-09-22','2006-09-28','2006-09-19',11416,6,6,15246),(447,'2006-09-20','2006-10-02','2006-09-20',11419,7,19,15247),(448,'2006-09-22','2006-10-12','2006-09-21',11412,28,10,15248),(449,'2006-09-22','2006-10-10','2006-09-22',11415,9,17,15249),(450,'2006-09-26','2006-10-11','2006-09-23',11414,12,10,15250),(458,'2006-10-01','2006-10-10','2006-10-01',11413,18,18,15240),(478,'2006-10-21','2006-10-22','2006-10-21',11411,17,18,15261),(481,'2006-10-24','2006-10-26','2006-10-24',11410,1,3,15280),(482,'2006-10-28','2006-10-27','2006-10-25',11417,19,21,15263),(489,'2006-11-01','2006-11-06','2006-11-01',11411,25,25,15264),(494,'2006-11-09','2006-11-11','2006-11-06',11459,12,18,15282),(497,'2006-11-09','2006-12-10','2006-11-09',11417,13,13,15284),(498,'2006-11-10','2006-11-18','2006-11-10',11414,19,18,15260),(499,'2006-11-12','2006-11-19','2006-11-11',11414,20,19,15259),(500,'2006-11-15','2006-12-10','2006-11-12',11412,21,18,15300),(501,'2006-11-13','2006-11-18','2006-11-13',11559,21,14,15301),(502,'2006-11-14','2006-12-15','2006-11-14',11552,18,18,15302),(503,'2006-11-15','2006-11-20','2006-11-15',11559,23,8,15303),(504,'2006-11-19','2006-11-24','2006-11-16',11554,24,13,15304),(505,'2006-11-18','2006-12-18','2006-11-17',11557,26,26,15305),(506,'2006-11-19','2006-11-27','2006-11-18',11556,26,26,15306),(507,'2006-11-19','2006-11-27','2006-11-19',11554,27,16,15307),(508,'2006-11-21','2006-11-28','2006-11-20',11550,28,28,15308),(509,'2006-11-21','2006-11-29','2006-11-21',11550,29,29,15309),(510,'2006-11-25','2006-12-10','2006-11-22',11554,30,11,15310),(511,'2006-11-24','2006-11-26','2006-11-23',11557,14,15,15297),(520,'2006-12-03','2006-12-09','2006-12-02',11551,40,7,15327),(521,'2006-12-03','2007-01-08','2006-12-03',11551,1,18,15321),(522,'2006-12-05','2006-12-13','2006-12-04',11535,20,11,15322),(523,'2006-12-05','2006-12-19','2006-12-05',11558,24,16,15323),(524,'2006-12-07','2006-12-15','2006-12-06',11556,4,13,15324),(525,'2006-12-07','2006-12-17','2006-12-07',11553,5,15,15325),(526,'2006-12-08','2007-01-12','2006-12-08',11559,6,40,15326),(528,'2006-12-11','2006-12-20','2006-12-10',11553,8,18,15328),(529,'2006-12-11','2006-12-21','2006-12-11',11554,9,19,15329),(530,'2006-12-13','2006-12-21','2006-12-12',11553,10,10,15330),(532,'2006-12-14','2006-12-16','2006-12-14',11558,15,17,15317),(540,'2006-12-23','2007-01-08','2006-12-22',11535,20,16,15340),(541,'2006-12-23','2006-12-28','2006-12-23',11551,21,21,15341),(542,'2006-12-25','2007-01-13','2006-12-24',11513,26,26,15342),(543,'2006-12-25','2007-01-05','2006-12-25',11514,23,9,15343),(544,'2006-12-26','2007-01-14','2006-12-26',11518,24,24,15344),(545,'2006-12-27','2007-01-12','2006-12-27',11519,25,11,15345),(546,'2006-12-28','2007-01-19','2006-12-28',11517,29,11,15346),(547,'2006-12-29','2007-01-14','2006-12-29',11519,9,13,15347),(548,'2006-12-30','2007-01-15','2006-12-30',11551,28,28,15348),(549,'2006-12-31','2007-01-19','2006-12-31',11550,29,29,15349),(550,'2007-01-01','2007-01-09','2007-01-01',11550,30,30,15350),(561,'2007-01-12','2007-02-03','2007-01-12',11515,1,22,15367),(562,'2007-01-13','2007-01-22','2007-01-13',11516,23,23,15316),(563,'2007-01-14','2007-01-24','2007-01-14',11511,3,13,15369),(565,'2007-01-16','2007-01-23','2007-01-16',11511,5,10,15361),(570,'2007-01-22','2007-02-13','2007-01-21',11515,10,12,15366),(574,'2007-01-26','2007-01-28','2007-01-25',11514,14,17,15363),(578,'2007-01-29','2007-02-05','2007-01-29',11515,18,25,15364),(579,'2007-01-30','2007-02-09','2007-01-30',11518,19,10,15368),(595,'2007-02-15','2007-02-20','2007-02-15',11511,35,35,15360),(596,'2007-02-16','2007-03-17','2007-02-16',11512,17,17,15362),(597,'2007-02-17','2007-02-25','2007-02-17',11514,37,37,15365),(599,'2007-02-19','2007-02-28','2007-02-19',11513,21,21,15357),(600,'2007-02-21','2007-02-28','2007-02-20',11514,40,40,15400),(601,'2007-03-21','2007-03-28','2007-02-20',11513,40,40,15400);
/*!40000 ALTER TABLE `main_rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_series`
--

LOCK TABLES `main_series` WRITE;
/*!40000 ALTER TABLE `main_series` DISABLE KEYS */;
INSERT INTO `main_series` VALUES (1,'1','E87 20d',2006,47800,'2.0L','DIESEL TURBO F/INJ','51L','115Kw',5,'6A','5D HATCHBACK','RWD','2660mm',2),(2,'1','E87 20i',2005,44100,'2.0L','MULTI POINT F/INJ','50L','110Kw',5,'6A','5D HATCHBACK','RWD','2660mm',2),(3,'2','44 GL',1979,11220,'2.1L','FUEL INJECTED','60L','91Kw',5,'3A','4D SEDAN','RWD','2640mm',5),(4,'3','18i',1997,51320,'1.8L','ELECTRONIC F/INJ','65L','85Kw',5,'4A','4D SEDAN','RWD','2700mm',2),(5,'3','18i',1995,49650,'1.8L','ELECTRONIC F/INJ','65L','85Kw',5,'5M','4D SEDAN','RWD','2700mm',2),(6,'3','18i',1989,36950,'1.8L','ELECTRONIC F/INJ','55L','83Kw',5,'5M','2D SEDAN','RWD','2570mm',2),(7,'3','18i',1994,46500,'1.8L','ELECTRONIC F/INJ','65L','85Kw',5,'5M','4D SEDAN','RWD','2700mm',2),(8,'3','18i',1991,44300,'1.8L','ELECTRONIC F/INJ','65L','85Kw',5,'4A','4D SEDAN','RWD','2700mm',2),(9,'3','18i',1986,38600,'1.8L','ELECTRONIC F/INJ','58L','77Kw',5,'5M','4D SEDAN','RWD','2570mm',2),(10,'3','18is',1998,56600,'1.9L','MULTI POINT F/INJ','65L','103Kw',5,'4A','4D SEDAN','RWD','2700mm',2),(11,'3','18is',1997,55100,'1.9L','MULTI POINT F/INJ','65L','103Kw',5,'5M','4D SEDAN','RWD','2700mm',2),(12,'3','18is',1996,57110,'1.8L','ELECTRONIC F/INJ','65L','103Kw',5,'4A','2D COUPE','RWD','2700mm',2),(13,'3','20i',1989,54700,'2.0L','ELECTRONIC F/INJ','65L','95Kw',5,'5M','4D SEDAN','RWD','2570mm',2),(14,'3','23Ci',1999,73900,'2.5L','MULTI POINT F/INJ','63L','125Kw',5,'5M','2D COUPE','RWD','2725mm',2),(15,'3','23i',1996,62550,'2.5L','MULTI POINT F/INJ','62L','125Kw',5,'5M','4D SEDAN','RWD','2700mm',2),(16,'3','25i',1988,74500,'2.5L','ELECTRONIC F/INJ','55L','125Kw',5,'4A','4D SEDAN','RWD','2570mm',2),(17,'3','E36 16i OPEN AIR',1995,46200,'1.6L','MULTI POINT F/INJ','52L','75Kw',5,'5M','3D HATCHBACK','RWD','2700mm',2),(18,'3','E36 18is SPORT',1998,58950,'1.9L','MULTI POINT F/INJ','62L','103Kw',5,'5M','2D COUPE','RWD','2700mm',2),(19,'3','E36 28i',1996,83330,'2.8L','MULTI POINT F/INJ','65L','142Kw',5,'5A','4D SEDAN','RWD','2700mm',2),(20,'3','E46 16ti',2002,43869,'1.8L','MULTI POINT F/INJ','63L','85Kw',5,'5AS','3D HATCHBACK','RWD','2725mm',2),(21,'3','E46 16ti',2004,41750,'1.8L','MULTI POINT F/INJ','63L','85Kw',5,'5M','3D HATCHBACK','RWD','2725mm',2),(22,'3','E46 16ti',2005,40350,'1.8L','MULTI POINT F/INJ','63L','85Kw',5,'5M','3D HATCHBACK','RWD','2725mm',2),(23,'3','E46 18i',1999,54370,'1.9L','MULTI POINT F/INJ','63L','87Kw',5,'5M','4D SEDAN','RWD','2725mm',2),(24,'3','E46 18i',2000,48315,'1.9L','MULTI POINT F/INJ','63L','87Kw',5,'5M','4D SEDAN','RWD','2725mm',2),(25,'3','E46 18i EXECUTIVE',2002,56550,'2.0L','MULTI POINT F/INJ','63L','105Kw',5,'5AS','4D SEDAN','RWD','2725mm',2),(26,'3','E46 18i EXECUTIVE',2001,53950,'2.0L','MULTI POINT F/INJ','63L','105Kw',5,'5M','4D SEDAN','RWD','2725mm',2),(27,'3','E46 18i EXECUTIVE',2000,52070,'1.9L','MULTI POINT F/INJ','63L','87Kw',5,'5M','4D SEDAN','RWD','2725mm',2),(28,'3','E46 18i SPORT',2005,54500,'2.0L','MULTI POINT F/INJ','63L','105Kw',5,'5M','4D SEDAN','RWD','2725mm',2),(29,'3','E46 20Ci',2001,67050,'2.2L','MULTI POINT F/INJ','63L','125Kw',5,'5AS','2D COUPE','RWD','2725mm',2),(30,'3','E46 20i SPORT',2005,65300,'2.2L','MULTI POINT F/INJ','63L','125Kw',5,'5AS','4D SEDAN','RWD','2725mm',2),(31,'3','E46 25Ci',2002,75000,'2.5L','MULTI POINT F/INJ','63L','141Kw',5,'5AS','2D COUPE','RWD','2725mm',2),(32,'3','E46 30Ci',2001,109050,'3.0L','MULTI POINT F/INJ','63L','170Kw',5,'5AS','2D CONVERTIBLE','RWD','2725mm',2),(33,'3','E46 30i',2001,90700,'3.0L','MULTI POINT F/INJ','63L','170Kw',5,'5AS','4D SEDAN','RWD','2725mm',2),(34,'3','E90 20i',2006,53400,'2.0L','MULTI POINT F/INJ','65L','110Kw',5,'6AS','4D SEDAN','RWD','2760mm',2),(35,'3','E90 20i EXECUTIVE',2005,57200,'2.0L','MULTI POINT F/INJ','65L','110Kw',5,'6AS','4D SEDAN','RWD','2760mm',2),(36,'3','E91 23i TOURING',2006,71500,'2.5L','MULTI POINT F/INJ','60L','130Kw',5,'6AS','4D WAGON','RWD','2760mm',2),(37,'4','40 GLT',1996,45500,'2.0L','ELECTRONIC F/INJ','60L','80Kw',5,'4A','4D HATCHBACK','FWD','2503mm',5),(38,'4','40 GLT',1994,40950,'2.0L','ELECTRONIC F/INJ','60L','80Kw',5,'4A','4D HATCHBACK','FWD','2503mm',5),(39,'5','20i',1991,69100,'2.0L','ELECTRONIC F/INJ','80L','110Kw',5,'5A','4D SEDAN','RWD','2761mm',2),(40,'5','25i',1991,80200,'2.5L','ELECTRONIC F/INJ','80L','141Kw',5,'5M','4D SEDAN','RWD','2761mm',2),(41,'5','28i',1997,96500,'2.8L','MULTI POINT F/INJ','70L','142Kw',5,'5AS','4D SEDAN','RWD','2830mm',2),(42,'5','E34 25i EXECUTIVE',1996,98200,'2.5L','ELECTRONIC F/INJ','80L','141Kw',5,'5A','4D SEDAN','RWD','2761mm',2),(43,'5','E39 23i',1996,83600,'2.5L','MULTI POINT F/INJ','70L','125Kw',5,'5AS','4D SEDAN','RWD','2830mm',2),(44,'5','E39 30i SPORT',2002,101400,'3.0L','MULTI POINT F/INJ','70L','170Kw',5,'5AS','4D SEDAN','RWD','2830mm',2),(45,'5','E60 25i',2005,89000,'2.5L','MULTI POINT F/INJ','70L','141Kw',5,'6AS','4D SEDAN','RWD','2888mm',2),(46,'7','35i',1984,59500,'3.2L','ELECTRONIC F/INJ','100L','145Kw',5,'4A','4D SEDAN','RWD','2795mm',2),(47,'7','35i EXECUTIVE',1987,136500,'3.4L','ELECTRONIC F/INJ','90L','155Kw',5,'4A','4D SEDAN','RWD','2833mm',2),(48,'7','35iL EXECUTIVE',1988,145900,'3.4L','ELECTRONIC F/INJ','95L','155Kw',5,'4A','4D SEDAN','RWD','2945mm',2),(49,'7','40 TURBO',1989,65900,'2.3L','TURBO EFI','82L','119Kw',5,'4A','4D SEDAN','RWD','2770mm',5),(50,'8','50 GLE',1992,45690,'2.4L','ELECTRONIC F/INJ','73L','103Kw',5,'4A','4D SEDAN','FWD','2665mm',5),(51,'8','50 GLE',1994,47950,'2.4L','ELECTRONIC F/INJ','73L','103Kw',5,'4A','4D SEDAN','FWD','2665mm',5),(52,'8','50 SE',1997,59950,'2.4L','MULTI POINT F/INJ','73L','125Kw',5,'4A','5D WAGON','FWD','2665mm',5),(53,'19','RT',1995,26790,'1.7L','MULTI POINT F/INJ','55L','68Kw',5,'5M','5D HATCHBACK','FWD','2540mm',19),(54,'30','X SPORT',1996,37155,'1.8L','ELECTRONIC F/INJ','50L','99Kw',4,'5M','2D COUPE','FWD','2455mm',7),(55,'90','SPORT',1990,42245,'2.3L','ELECTRONIC F/INJ','68L','100Kw',5,'5M','4D SEDAN','FWD','2546mm',12),(56,'121','DELUXE',1987,12250,'1.3L','CARB','38L','46Kw',5,'5M','3D HATCHBACK','FWD','2295mm',9),(57,'121','METRO SHADES',2001,19050,'1.5L','ELECTRONIC F/INJ','43L','64Kw',5,'5M','5D HATCHBACK','FWD','2390mm',9),(58,'121','METRO SHADES',2002,19240,'1.5L','ELECTRONIC F/INJ','43L','64Kw',5,'5M','5D HATCHBACK','FWD','2390mm',9),(59,'121','METRO SHADES',1999,19590,'1.5L','ELECTRONIC F/INJ','40L','64Kw',5,'4A','5D HATCHBACK','FWD','2390mm',9),(60,'121','SHADES',1997,14200,'1.3L','SINGLE POINT F/INJ','40L','54Kw',5,'5M','4D SEDAN','FWD','2390mm',9),(61,'147','2.0 TWIN SPARK',2003,39500,'2.0L','MULTI POINT F/INJ','60L','110Kw',5,'5M','5D HATCHBACK','FWD','2546mm',17),(62,'147','GTA MONZA',2005,59990,'3.2L','MULTI POINT F/INJ','63L','184Kw',5,'6M','3D HATCHBACK','FWD','2546mm',17),(63,'156','2.0 SELESPEED TWIN SPARK',1999,49950,'2.0L','MULTI POINT F/INJ','63L','114Kw',5,'5MSel','4D SEDAN','FWD','2595mm',17),(64,'156','V6 24V',2002,57500,'2.5L','MULTI POINT F/INJ','63L','140Kw',5,'6M','4D SEDAN','FWD','2595mm',17),(65,'180','E LIMITED EDITION',1993,47115,'1.8L','ELECTRONIC F/INJ','55L','82Kw',5,'4A','4D SEDAN','RWD','2665mm',18),(66,'180','E LIMITED EDITION',1992,45690,'1.8L','ELECTRONIC F/INJ','55L','82Kw',5,'4A','4D SEDAN','RWD','2665mm',18),(67,'180','E LIMITED EDITION',1994,47115,'1.8L','ELECTRONIC F/INJ','55L','82Kw',5,'4A','4D SEDAN','RWD','2665mm',18),(68,'200','S15 SX SPEC R GT',2002,46490,'2.0L','TURBO MPFI','65L','147Kw',4,'6M','2D COUPE','RWD','2525mm',6),(69,'200','S15 SX SPEC S',2001,40990,'2.0L','TURBO MPFI','65L','147Kw',4,'6M','2D COUPE','RWD','2525mm',6),(70,'200','S15 SX SPEC S',2002,40990,'2.0L','TURBO MPFI','65L','147Kw',4,'6M','2D COUPE','RWD','2525mm',6),(71,'200','S15 SX SPEC S GT',2002,42990,'2.0L','TURBO MPFI','65L','147Kw',4,'6M','2D COUPE','RWD','2525mm',6),(72,'200','SX LUXURY',1998,49995,'2.0L','TURBO MPFI','65L','147Kw',4,'5M','2D COUPE','RWD','2525mm',6),(73,'200','SX SPORTS',1996,44510,'2.0L','TURBO MPFI','65L','147Kw',4,'5M','2D COUPE','RWD','2525mm',6),(74,'200','SX SPORTS LIMITED',1998,39990,'2.0L','TURBO MPFI','65L','147Kw',4,'5M','2D COUPE','RWD','2525mm',6),(75,'200','SX SPORTS LIMITED',1994,38500,'2.0L','TURBO MPFI','65L','147Kw',4,'5M','2D COUPE','RWD','2525mm',6),(76,'205','GTi',1990,33750,'1.9L','ELECTRONIC F/INJ','50L','75Kw',5,'5M','3D HATCHBACK','FWD','2420mm',4),(77,'206','C',2006,22990,'1.6L','MULTI POINT F/INJ','50L','82Kw',5,'5M','5D HATCHBACK','FWD','2442mm',4),(78,'206','CC',2005,32990,'1.6L','MULTI POINT F/INJ','50L','80Kw',4,'5M','2D CABRIOLET','FWD','2442mm',4),(79,'206','CC',2006,34990,'1.6L','MULTI POINT F/INJ','50L','80Kw',4,'4ATip','2D CABRIOLET','FWD','2442mm',4),(80,'206','GTi',2004,29990,'2.0L','MULTI POINT F/INJ','50L','102Kw',5,'5M','3D HATCHBACK','FWD','2442mm',4),(81,'206','XR',2002,19990,'1.4L','MULTI POINT F/INJ','50L','55Kw',5,'5M','5D HATCHBACK','FWD','2442mm',4),(82,'206','XR',2004,19990,'1.4L','MULTI POINT F/INJ','50L','55Kw',5,'5M','5D HATCHBACK','FWD','2442mm',4),(83,'206','XR',2003,21990,'1.6L','MULTI POINT F/INJ','50L','82Kw',5,'5M','3D HATCHBACK','FWD','2442mm',4),(84,'206','XT',2001,22990,'1.6L','MULTI POINT F/INJ','50L','67Kw',5,'5M','5D HATCHBACK','FWD','2442mm',4),(85,'206','XT',2000,22450,'1.6L','MULTI POINT F/INJ','50L','67Kw',5,'5M','5D HATCHBACK','FWD','2442mm',4),(86,'230','W124 E',1988,87100,'2.3L','ELECTRONIC F/INJ','70L','97Kw',5,'4A','4D SEDAN','RWD','2800mm',18),(87,'280','W126 SE',1982,55979,'2.7L','ELECTRONIC F/INJ','90L','125Kw',5,'4A','4D SEDAN','RWD','2935mm',18),(88,'300','TE',1991,124500,'3.0L','ELECTRONIC F/INJ','70L','135Kw',7,'4A','4D WAGON','RWD','2800mm',18),(89,'300','W124 E',1986,79296,'3.0L','ELECTRONIC F/INJ','70L','135Kw',5,'4A','4D SEDAN','RWD','2800mm',18),(90,'306','XT',2000,29490,'2.0L','MULTI POINT F/INJ','60L','100Kw',5,'5M','5D HATCHBACK','FWD','2580mm',4),(91,'307','MY06 UPGRADE SPORT 2.0',2005,37990,'2.0L','MULTI POINT F/INJ','60L','130Kw',5,'5M','5D HATCHBACK','FWD','2608mm',4),(92,'307','MY06 UPGRADE XSE HDi 2.0',2006,32290,'2.0L','DIESEL TURBO F/INJ','60L','100Kw',5,'6M','5D HATCHBACK','FWD','2608mm',4),(93,'307','MY06 UPGRADE XSE HDi 2.0 TOURING',2006,33990,'2.0L','DIESEL TURBO F/INJ','60L','100Kw',5,'6M','4D WAGON','FWD','2708mm',4),(94,'307','XSE',2003,31790,'2.0L','MULTI POINT F/INJ','60L','100Kw',5,'5M','5D HATCHBACK','FWD','2608mm',4),(95,'307','XSE',2004,33990,'2.0L','MULTI POINT F/INJ','60L','100Kw',5,'4ATip','5D HATCHBACK','FWD','2608mm',4),(96,'323','ASTINA',1997,35700,'2.0L','MULTI POINT F/INJ','55L','104Kw',5,'5M','5D HATCHBACK','FWD','2605mm',9),(97,'323','ASTINA',1995,31050,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'4A','5D HATCHBACK','FWD','2605mm',9),(98,'323','ASTINA',1993,25715,'1.8L','MULTI POINT F/INJ','55L','76Kw',5,'5M','5D HATCHBACK','FWD','2500mm',9),(99,'323','ASTINA',1996,38270,'2.0L','MULTI POINT F/INJ','55L','104Kw',5,'5M','5D HATCHBACK','FWD','2605mm',9),(100,'323','ASTINA',1998,28480,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'4A','5D HATCHBACK','FWD','2605mm',9),(101,'323','ASTINA',2003,21840,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'4A','5D HATCHBACK','FWD','2610mm',9),(102,'323','ASTINA SHADES',2001,20490,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','5D HATCHBACK','FWD','2605mm',9),(103,'323','ASTINA SHADES',2000,19715,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','5D HATCHBACK','FWD','2605mm',9),(104,'323','ASTINA SHADES',1998,26990,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','5D HATCHBACK','FWD','2605mm',9),(105,'323','ASTINA SP',1994,30085,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','5D HATCHBACK','FWD','2500mm',9),(106,'323','ASTINA SP20',2002,29180,'2.0L','MULTI POINT F/INJ','55L','98Kw',5,'5M','5D HATCHBACK','FWD','2610mm',9),(107,'323','BJ PROTEGE SHADES',2003,19990,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(108,'323','DELUXE',1983,8835,'1.5L','CARB','45L','54Kw',4,'5M','4D WAGON','RWD','2315mm',9),(109,'323','LIMITED',1985,15826,'1.6L','MULTI POINT F/INJ','45L','61Kw',5,'5M','5D HATCHBACK','FWD','2400mm',9),(110,'323','PROTEGE',1999,20990,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(111,'323','PROTEGE',1997,22915,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','4D SEDAN','FWD','2605mm',9),(112,'323','PROTEGE',1998,22915,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','4D SEDAN','FWD','2605mm',9),(113,'323','PROTEGE',2003,21840,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'4A','4D SEDAN','FWD','2610mm',9),(114,'323','PROTEGE',2000,19715,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(115,'323','PROTEGE SHADES',2000,19715,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(116,'323','PROTEGE SHADES',2002,20695,'1.6L','MULTI POINT F/INJ','55L','78Kw',5,'5M','4D SEDAN','FWD','2605mm',9),(117,'323','PROTEGE SP20',2002,26990,'2.0L','MULTI POINT F/INJ','55L','98Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(118,'323','SUPER DELUXE',1989,20210,'1.6L','MULTI POINT F/INJ','48L','61Kw',5,'4A','5D HATCHBACK','FWD','2400mm',9),(119,'323','SUPER DELUXE',1988,19390,'1.6L','CARB','48L','53Kw',5,'3A','5D HATCHBACK','FWD','2400mm',9),(120,'380','DB',2005,35990,'3.8L','MULTI POINT F/INJ','67L','175Kw',5,'5ASPM','4D SEDAN','FWD','2750mm',10),(121,'380','SEL',1982,68795,'3.8L','ELECTRONIC F/INJ','90L','145Kw',5,'4A','4D SEDAN','RWD','3075mm',18),(122,'405','D60 SRI',1992,34995,'1.9L','ELECTRONIC F/INJ','70L','80Kw',5,'5M','4D SEDAN','FWD','2669mm',4),(123,'405','Mi16',1993,41995,'2.0L','ELECTRONIC F/INJ','70L','112Kw',5,'5M','4D SEDAN','FWD','2669mm',4),(124,'406','D8 ST',1997,39995,'2.0L','MULTI POINT F/INJ','70L','100Kw',5,'5M','4D SEDAN','FWD','2700mm',4),(125,'406','D9',2004,69550,'2.9L','MULTI POINT F/INJ','70L','157Kw',4,'5M','2D COUPE','FWD','2700mm',4),(126,'626','CLASSIC',1998,30180,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(127,'626','CLASSIC',1999,32430,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'4A','4D SEDAN','FWD','2610mm',9),(128,'626','CLASSIC',2001,32900,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'4A','5D HATCHBACK','FWD','2610mm',9),(129,'626','CLASSIC',2000,31070,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'5M','5D HATCHBACK','FWD','2610mm',9),(130,'626','DELUXE',1994,31335,'2.0L','MULTI POINT F/INJ','60L','85Kw',5,'4A','4D SEDAN','FWD','2610mm',9),(131,'626','ECLIPSE',2002,31980,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'4A','4D SEDAN','FWD','2610mm',9),(132,'626','LIMITED EDITION',2000,30160,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'5M','4D SEDAN','FWD','2610mm',9),(133,'626','LUXURY',1999,37290,'2.0L','MULTI POINT F/INJ','64L','93Kw',5,'4A','5D HATCHBACK','FWD','2610mm',9),(134,'800','M',1996,85165,'2.3L','MILLER CYCLE','68L','149Kw',5,'4A','4D SEDAN','FWD','2750mm',7),(135,'900','S 2.5 V6',1994,45900,'2.5L','MULTI POINT F/INJ','68L','125Kw',5,'5M','5D HATCHBACK','FWD','2600mm',13),(136,'900','SE 2.5 V6',1996,63900,'2.5L','MULTI POINT F/INJ','68L','125Kw',5,'4A','5D HATCHBACK','FWD','2600mm',13),(137,'929','DELUXE',1987,23010,'2.0L','MULTI POINT F/INJ','60L','70Kw',5,'5M','4D SEDAN','RWD','2615mm',9),(138,'929','LUXURY',1986,29600,'2.0L','MULTI POINT F/INJ','60L','70Kw',5,'4A','2D HARDTOP','RWD','2615mm',9),(139,'1600','SUPER BUG L',1975,3798,'1.6L','CARB','42L','37Kw',4,'4M','2D SEDAN','RWD','2420mm',16),(140,'9000','CD 16',1993,46990,'2.3L','ELECTRONIC F/INJ','66L','108Kw',5,'4A','4D SEDAN','FWD','2672mm',13),(141,'9000','CS',1997,52000,'2.3L','TURBO EFI','66L','125Kw',5,'4A','4D HATCHBACK','FWD','2672mm',13),(142,'9000','CS',1996,50400,'2.3L','TURBO EFI','66L','125Kw',5,'4A','4D HATCHBACK','FWD','2672mm',13),(143,'9000','CS ANNIVERSARY',1998,54900,'2.3L','TURBO EFI','66L','125Kw',5,'4A','4D HATCHBACK','FWD','2672mm',13),(144,'9000','CSE',1994,79200,'2.3L','TURBO EFI','66L','147Kw',5,'4A','4D HATCHBACK','FWD','2672mm',13),(145,'43168','AERO',2000,80887,'2.0L','TURBO MPFI','64L','158Kw',5,'5M','2D CONVERTIBLE','FWD','2605mm',13),(146,'43168','MY02 AERO',2002,64575,'2.0L','TURBO MPFI','68L','151Kw',5,'4A','5D HATCHBACK','FWD','2605mm',13),(147,'43168','MY03 TURBO 2.0t LTD ED',2003,73000,'2.0L','TURBO MPFI','68L','110Kw',5,'4A','2D CONVERTIBLE','FWD','2605mm',13),(148,'43168','MY04 AERO 2.0t',2004,67900,'2.0L','TURBO MPFI','62L','155Kw',5,'6M','4D SEDAN','FWD','2675mm',13),(149,'43168','MY04 ARC 2.0T',2004,56400,'2.0L','TURBO MPFI','62L','129Kw',5,'5A','4D SEDAN','FWD','2675mm',13),(150,'43168','MY05 AERO',2005,93000,'2.0L','TURBO MPFI','62L','155Kw',4,'5ASEN','2D CONVERTIBLE','FWD','2675mm',13),(151,'43168','MY07 LINEAR SPORT 1.9TiD SPORTCOMBI',2007,53400,'1.9L','TURBO MPFI','58L','110Kw',5,'5A','4D WAGON','FWD','2675mm',13),(152,'43168','S',2001,63885,'2.0L','TURBO MPFI','68L','113Kw',4,'5M','2D CONVERTIBLE','FWD','2605mm',13),(153,'43168','S',2000,65985,'2.0L','TURBO MPFI','68L','113Kw',4,'4A','2D CONVERTIBLE','FWD','2605mm',13),(154,'43168','SE',1999,62000,'2.0L','TURBO MPFI','68L','136Kw',5,'4A','5D SEDAN','FWD','2605mm',13),(155,'43229','MY01 S',2001,64000,'2.3L','TURBO MPFI','75L','136Kw',5,'4A','4D SEDAN','FWD','2703mm',13),(156,'43229','MY04 AERO',2004,84900,'2.3L','TURBO MPFI','75L','184Kw',5,'5AST','4D SEDAN','FWD','2703mm',13),(157,'43229','SE',2000,67986,'2.3L','TURBO MPFI','75L','125Kw',5,'4A','4D SEDAN','FWD','2703mm',13),(158,'(4x4)','LWB',1972,5203,'2.3L','DIESEL','73L','46Kw',12,'4M4x4','2D HARDTOP','4WD','2768mm',1),(159,'(4x4)','SWB',1978,9045,'2.3L','DIESEL','45L','46Kw',8,'4M4x4','2D HARDTOP','4WD','2230mm',1),(160,'180B','SSS',1977,6012,'1.8L','CARB','55L','82Kw',5,'5M','2D HARDTOP','RWD','2500mm',15),(161,'300C','LE MY06 CRD',2006,57990,'3.0L','DIESEL TURBO F/INJ','71L','160Kw',5,'5A','4D SEDAN','RWD','3050mm',8),(162,'300C','LE MY06 SRT8',2006,71990,'6.1L','MULTI POINT F/INJ','71L','317Kw',5,'5A','4D SEDAN','RWD','3050mm',8),(163,'4 RUNNER','DELUXE 4x4',1989,28200,'2.4L','CARB','65L','75Kw',5,'5M4x4','4D WAGON','4WD','2625mm',11),(164,'4 RUNNER','RV6 4x4',1992,36954,'3.0L','ELECTRONIC F/INJ','65L','105Kw',5,'4A4x4','4D WAGON','4WD','2625mm',11),(165,'A160','AVANTGARDE',1999,41400,'1.6L','MULTI POINT F/INJ','54L','75Kw',5,'5MSeq','5D HATCHBACK','FWD','2423mm',18),(166,'A170','W169 ELEGANCE',2006,42400,'1.7L','MULTI POINT F/INJ','54L','85Kw',5,'CVT7','5D HATCHBACK','FWD','2568mm',18),(167,'A190','W168 AVANTGARDE',2001,41230,'1.9L','MULTI POINT F/INJ','54L','92Kw',5,'5MSeq','5D HATCHBACK','FWD','2423mm',18),(168,'A190','W168 AVANTGARDE',2000,41230,'1.9L','MULTI POINT F/INJ','54L','92Kw',5,'5MSeq','5D HATCHBACK','FWD','2423mm',18),(169,'A190','W168 LWB ELEGANCE',2004,42900,'1.9L','MULTI POINT F/INJ','54L','92Kw',5,'5MSeq','5D HATCHBACK','FWD','2593mm',18),(170,'A3','1.6',2003,35400,'1.6L','MULTI POINT F/INJ','55L','75Kw',5,'5M','5D HATCHBACK','FWD','2512mm',12),(171,'A3','1.8',1999,42450,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'4A','3D HATCHBACK','FWD','2512mm',12),(172,'A3','1.8',2002,38700,'1.8L','MULTI POINT F/INJ','55L','92Kw',5,'5M','5D HATCHBACK','FWD','2512mm',12),(173,'A3','1.8 TURBO',2004,44950,'1.8L','TURBO MPFI','55L','110Kw',5,'5M','5D HATCHBACK','FWD','2512mm',12),(174,'A3','8P SPORTBACK 2.0 TDI AMBITION DSG',2005,47750,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6ADSG','5D HATCHBACK','FWD','2578mm',12),(175,'A3','8P SPORTBACK 2.0 TDI AMBITION DSG',2006,47750,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6ADSG','5D HATCHBACK','FWD','2578mm',12),(176,'A4','1.8 SE 20V',1996,51320,'1.8L','MULTI POINT F/INJ','60L','92Kw',5,'4A','4D SEDAN','FWD','2617mm',12),(177,'A4','B6 2.0',2002,50650,'2.0L','MULTI POINT F/INJ','70L','96Kw',5,'CVTM','4D SEDAN','FWD','2650mm',12),(178,'A4','B6 2.0 AVANT',2003,54250,'2.0L','MULTI POINT F/INJ','70L','96Kw',5,'CVTM6','4D WAGON','FWD','2650mm',12),(179,'A4','B7 2.0',2007,50450,'2.0L','MULTI POINT F/INJ','70L','96Kw',5,'CVTM','4D SEDAN','FWD','2648mm',12),(180,'A6','4B 2.4 V6',2003,80900,'2.4L','MULTI POINT F/INJ','70L','125Kw',5,'CVTM6','4D SEDAN','FWD','2749mm',12),(181,'ACCORD','40 VTi',2005,29990,'2.4L','MULTI POINT F/INJ','65L','118Kw',5,'5A','4D SEDAN','FWD','2740mm',14),(182,'ALLROAD QUATTRO','C5',2001,99250,'2.7L','TWIN TURBO MPFI','70L','184Kw',5,'5ATip','4D WAGON','AWD','2760mm',12),(183,'BORA','1J 2.0',2001,36350,'2.0L','MULTI POINT F/INJ','55L','85Kw',5,'5M','4D SEDAN','FWD','2500mm',16),(184,'C180','W203 KOMPRESSOR AVANTGARDE',2002,61400,'1.8L','SUPERCHARGED MPFI','70L','105Kw',5,'5ATS','4D SEDAN','RWD','2715mm',18),(185,'C200','W202 ELEGANCE',2000,64580,'2.0L','MULTI POINT F/INJ','62L','100Kw',5,'5A','4D SEDAN','RWD','2690mm',18),(186,'CADDY','2K 1.9 TDi',2006,24990,'1.9L','DIESEL TURBO F/INJ','60L','77Kw',2,'5M','VAN','FWD','2682mm',16),(187,'CADDY','2K LIFE',2006,34990,'1.9L','DIESEL TURBO F/INJ','60L','77Kw',5,'6ADSG','4D WAGON','FWD','2682mm',16),(188,'CARAVELLE','V6',2003,59990,'2.8L','MULTI POINT F/INJ','80L','150Kw',8,'4A','4D WAGON','FWD','2920mm',16),(189,'CLIO','CAMPUS',2006,18990,'1.4L','MULTI POINT F/INJ','50L','72Kw',5,'5M','5D HATCHBACK','FWD','2472mm',19),(190,'CLIO','SPORT',2002,33990,'2.0L','MULTI POINT F/INJ','50L','124Kw',5,'5M','3D HATCHBACK','FWD','2472mm',19),(191,'CLK230','KOMP ELEGANCE',2000,111580,'2.3L','SUPERCHARGED MPFI','62L','142Kw',4,'5A','2D CABRIOLET','RWD','2690mm',18),(192,'CROSSFIRE','ZH ROADSTER',2005,75990,'3.2L','MULTI POINT F/INJ','60L','160Kw',2,'5ASeq','2D CONVERTIBLE','RWD','2400mm',8),(193,'DISCOVERY','ES V8 4x4',1999,66000,'4.0L','MULTI POINT F/INJ','95L','132Kw',7,'4A','4D WAGON','4WD','2540mm',1),(194,'DISCOVERY','S 4x4',1998,39990,'2.5L','DIESEL TURBO','88.5L','83Kw',5,'5M4x4','4D WAGON','4WD','2540mm',1),(195,'DISCOVERY','SERIES II',2003,51950,'2.5L','DIESEL TURBO F/INJ','93L','101Kw',5,'5M','4D WAGON','4WD','2540mm',1),(196,'DISCOVERY','SERIES II S 4x4',2003,55450,'4.0L','MULTI POINT F/INJ','93L','136Kw',7,'4A','4D WAGON','4WD','2540mm',1),(197,'DISCOVERY','SERIES II SE 4x4',2004,71450,'4.0L','MULTI POINT F/INJ','93L','136Kw',7,'4A','4D WAGON','4WD','2540mm',1),(198,'DISCOVERY','Tdi 4x4',1996,51800,'2.5L','DIESEL TURBO','88.5L','83Kw',5,'4A4x4','4D WAGON','4WD','2540mm',1),(199,'DISCOVERY','Tdi 4x4',1994,50430,'2.5L','DIESEL TURBO','88.5L','83Kw',5,'4A4x4','4D WAGON','4WD','2540mm',1),(200,'DISCOVERY 3','HSE',2006,83650,'2.7L','DIESEL TURBO F/INJ','82L','140Kw',7,'6A','4D WAGON','4WD','2885mm',1),(201,'E280','W210 ELEGANCE',1999,112400,'2.8L','MULTI POINT F/INJ','80L','150Kw',5,'5ASeq','4D SEDAN','RWD','2833mm',18),(202,'E500','211 AVANTGARDE',2002,153900,'5.0L','MULTI POINT F/INJ','89L','225Kw',5,'5ATSh','4D SEDAN','RWD','2854mm',18),(203,'E55','211 MY06 UPGRADE AMG',2006,225600,'5.4L','SUPERCHARGED MPFI','80L','350Kw',5,'5ATSh','4D SEDAN','RWD','2854mm',18),(204,'FAIRLADY','SPORTS',1964,2530,'1.5L','CARB','43L','63Kw',0,'4M','2D ROADSTER','RWD','2280mm',15),(205,'FREELANDER','XEi 4x4',2000,34886,'1.8L','MULTI POINT F/INJ','59L','84Kw',5,'5M4x4','3D HARDBACK','4WD','2535mm',1),(206,'GOLF','1.6 GENERATION',2004,25990,'1.6L','MULTI POINT F/INJ','55L','75Kw',5,'5M','5D HATCHBACK','FWD','2511mm',16),(207,'GOLF','1K 1.6 TRENDLINE',2005,25490,'1.6L','MULTI POINT F/INJ','55L','75Kw',5,'5M','5D HATCHBACK','FWD','2578mm',16),(208,'GOLF','1K 1.9 TDI COMFORTLINE',2005,32290,'1.9L','DIESEL TURBO F/INJ','55L','77Kw',5,'6ADSG','5D HATCHBACK','FWD','2578mm',16),(209,'GOLF','1K 2.0 FSI COMFORTLINE',2005,32290,'2.0L','ELECTRONIC F/INJ','55L','110Kw',5,'6ATip','5D HATCHBACK','FWD','2578mm',16),(210,'GOLF','1K 2.0 FSI SPORTLINE',2006,32990,'2.0L','ELECTRONIC F/INJ','55L','110Kw',5,'6M','5D HATCHBACK','FWD','2578mm',16),(211,'GOLF','1K 2.0 TDI COMFORTLINE',2007,32490,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6M','5D HATCHBACK','FWD','2578mm',16),(212,'GOLF','1K 2.0 TDI COMFORTLINE',2004,32490,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6M','5D HATCHBACK','FWD','2578mm',16),(213,'GOLF','1K 2.0 TDI COMFORTLINE',2006,34790,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6ADSG','5D HATCHBACK','FWD','2578mm',16),(214,'GOLF','1K GT',2007,37290,'1.4L','S/C & T/C MPFI','55L','125Kw',5,'6ADSG','5D HATCHBACK','FWD','2578mm',16),(215,'GOLF','1K GTi',2007,39990,'2.0L','TURBO MPFI','55L','147Kw',5,'6M','5D HATCHBACK','FWD','2578mm',16),(216,'GOLF','2.0 GENERATION',2004,29490,'2.0L','MULTI POINT F/INJ','55L','85Kw',5,'4A','5D HATCHBACK','FWD','2511mm',16),(217,'GOLF','2.0 S',2002,29490,'2.0L','MULTI POINT F/INJ','55L','85Kw',5,'5M','5D HATCHBACK','FWD','2511mm',16),(218,'GOLF','GL',2001,25990,'1.6L','MULTI POINT F/INJ','55L','74Kw',5,'5M','5D HATCHBACK','FWD','2511mm',16),(219,'GOLF','GL',1995,30490,'2.0L','MULTI POINT F/INJ','55L','85Kw',5,'5M','5D HATCHBACK','FWD','2475mm',16),(220,'GOLF','GL',1998,31980,'1.6L','MULTI POINT F/INJ','55L','74Kw',5,'4A','5D HATCHBACK','FWD','2511mm',16),(221,'GOLF','GL',1999,31190,'1.6L','MULTI POINT F/INJ','55L','74Kw',5,'4A','5D HATCHBACK','FWD','2511mm',16),(222,'GOLF','GL',2000,25990,'1.6L','MULTI POINT F/INJ','55L','74Kw',5,'5M','5D HATCHBACK','FWD','2511mm',16),(223,'GOLF','GLE',1999,34990,'2.0L','MULTI POINT F/INJ','55L','85Kw',5,'5M','5D HATCHBACK','FWD','2511mm',16),(224,'GRAND VOYAGER','RG SE',2004,59090,'3.3L','MULTI POINT F/INJ','75L','128Kw',7,'4A','4D WAGON','FWD','3030mm',8),(225,'GTV','2',1999,61990,'2.0L','MULTI POINT F/INJ','70L','114Kw',4,'5M','2D COUPE','FWD','2540mm',17),(226,'JETTA','1KM 2.0 FSI',2007,35290,'2.0L','MULTI POINT F/INJ','55L','110Kw',5,'6ATip','4D SEDAN','FWD','2578mm',16),(227,'JETTA','1KM 2.0 TDI',2006,35490,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6M','4D SEDAN','FWD','2578mm',16),(228,'JETTA','1KM 2.0 TDI',2007,37990,'2.0L','DIESEL TURBO F/INJ','55L','103Kw',5,'6ADSG','4D SEDAN','FWD','2578mm',16),(229,'JETTA','1KM 2.0 TURBO FSI',2006,39990,'2.0L','TURBO MPFI','55L','147Kw',5,'6ADSG','4D SEDAN','FWD','2578mm',16),(230,'JETTA','1KM 2.0 TURBO FSI',2007,39990,'2.0L','TURBO MPFI','55L','147Kw',5,'6ADSG','4D SEDAN','FWD','2578mm',16),(231,'MEGANE','EXPRESSION',2002,41490,'1.6L','MULTI POINT F/INJ','60L','79Kw',4,'5M','2D CABRIOLET','FWD','2461mm',19),(232,'MEGANE','PRIVILEGE',2004,35990,'2.0L','MULTI POINT F/INJ','60L','98Kw',5,'4A','4D SEDAN','FWD','2686mm',19),(233,'ML','270 CDI 4x4',2001,64900,'2.7L','TURBO CDI','70L','120Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(234,'ML','320 LUXURY 4x4',2000,72900,'3.2L','MULTI POINT F/INJ','70L','160Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(235,'ML','320 LUXURY 4x4',1999,73400,'3.2L','MULTI POINT F/INJ','70L','160Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(236,'ML','W163 270 CDI 4x4',2002,69474,'2.7L','TURBO CDI','83L','120Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(237,'ML','W163 270 CDI LUXURY 4x4',2003,77274,'2.7L','TURBO CDI','83L','120Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(238,'ML','W163 320 LUXURY 4x4',2002,77274,'3.2L','MULTI POINT F/INJ','83L','160Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(239,'ML','W163 500 LUXURY 4x4',2004,99900,'5.0L','MULTI POINT F/INJ','83L','215Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(240,'ML','W163 500 LUXURY 4x4',2001,98500,'5.0L','MULTI POINT F/INJ','83L','215Kw',5,'5ATS','4D WAGON','4WD','2820mm',18),(241,'MULTIVAN','T5 COMFORTLINE 4MOTION',2006,60990,'2.5L','DIESEL TURBO F/INJ','80L','128Kw',7,'6M','4D VAN','4WD','3000mm',16),(242,'MULTIVAN','T5 HIGHLINE',2006,72990,'2.5L','DIESEL TURBO F/INJ','80L','128Kw',7,'6ATip','4D VAN','FWD','3000mm',16),(243,'NEON','SE',1997,24880,'2.0L','ELECTRONIC F/INJ','47L','98Kw',5,'3A','4D SEDAN','FWD','2642mm',8),(244,'PASSAT','3B 1.8T',2002,49800,'1.8L','TURBO MPFI','62L','110Kw',5,'5ATip','4D WAGON','FWD','2703mm',16),(245,'PASSAT','3C 2.0T FSI',2006,44990,'2.0L','TURBO MPFI','70L','147Kw',5,'6ATip','4D SEDAN','FWD','2709mm',16),(246,'PASSAT','3C 3.2 V6 FSI',2006,54990,'3.2L','MULTI POINT F/INJ','70L','184Kw',5,'6ADSG','4D SEDAN','AWD','2709mm',16),(247,'POLO','9N',2003,19800,'1.4L','MULTI POINT F/INJ','45L','55Kw',5,'5M','3D HATCHBACK','FWD','2460mm',16),(248,'POLO','9N MY06 UPGRADE CLUB',2006,16990,'1.4L','MULTI POINT F/INJ','45L','55Kw',5,'5M','3D HATCHBACK','FWD','2465mm',16),(249,'POLO','9N MY07 UPGRADE CLUB',2007,16990,'1.4L','MULTI POINT F/INJ','45L','59Kw',5,'5M','3D HATCHBACK','FWD','2465mm',16),(250,'POLO','9N MY07 UPGRADE GTi',2007,26990,'1.8L','TURBO MPFI','45L','110Kw',5,'5M','3D HATCHBACK','FWD','2466mm',16),(251,'POLO','9N S',2002,21800,'1.4L','MULTI POINT F/INJ','45L','55Kw',5,'5M','5D HATCHBACK','FWD','2460mm',16),(252,'POLO','OPEN AIR',1999,21490,'1.6L','MULTI POINT F/INJ','45L','55Kw',5,'5M','5D HATCHBACK','FWD','2400mm',16),(253,'PT CRUISER','CLASSIC',2001,35200,'2.0L','MULTI POINT F/INJ','57L','104Kw',5,'5M','5D HATCHBACK','FWD','2616mm',8),(254,'PT CRUISER','CLASSIC',2004,32490,'2.0L','MULTI POINT F/INJ','57L','104Kw',5,'4A','5D HATCHBACK','FWD','2616mm',8),(255,'PT CRUISER','LIMITED',2004,38490,'2.0L','MULTI POINT F/INJ','57L','104Kw',5,'4A','5D HATCHBACK','FWD','2616mm',8),(256,'PT CRUISER','MY06 CLASSIC',2005,31990,'2.4L','MULTI POINT F/INJ','57L','105Kw',5,'4A','5D HATCHBACK','FWD','2616mm',8),(257,'S3','1.8',2000,65850,'1.8L','TURBO MPFI','62L','154Kw',5,'6M','3D HATCHBACK','AWD','2519mm',12),(258,'S40','2',1997,44950,'1.9L','MULTI POINT F/INJ','60L','103Kw',5,'4A','4D SEDAN','FWD','2550mm',5),(259,'S40','MY06 T5 AWD',2006,54950,'2.5L','TURBO MPFI','57L','162Kw',5,'5AG','4D SEDAN','AWD','2640mm',5),(260,'S40','MY2001 2.0 SE',2001,47950,'1.9L','MULTI POINT F/INJ','60L','100Kw',5,'5A','4D SEDAN','FWD','2562mm',5),(261,'S40','MY2003 2.0 SE',2003,47950,'1.9L','MULTI POINT F/INJ','60L','100Kw',5,'5A','4D SEDAN','FWD','2562mm',5),(262,'S40','T4',1998,53450,'1.9L','TURBO MPFI','60L','147Kw',5,'5M','4D SEDAN','FWD','2550mm',5),(263,'S60','05 UPGRADE 2.4 20V SE',2006,56950,'2.4L','MULTI POINT F/INJ','70L','125Kw',5,'5A','4D SEDAN','FWD','2715mm',5),(264,'S80','T6 SE',2001,98950,'2.8L','TWIN TURBO MPFI','80L','200Kw',5,'4AG','4D SEDAN','RWD','2791mm',5),(265,'SCENIC','PRIVILEGE',2003,37990,'2.0L','MULTI POINT F/INJ','60L','101Kw',5,'4A','5D WAGON','FWD','2580mm',19),(266,'SLK','R171 200K',2004,86900,'1.8L','SUPERCHARGED MPFI','70L','120Kw',2,'5ATS','2D CONVERTIBLE','RWD','2430mm',18),(267,'SLK230','KOMPRESSOR',2000,95380,'2.3L','SUPERCHARGED MPFI','53L','142Kw',2,'5A','2D CONVERTIBLE','RWD','2400mm',18),(268,'TOUAREG','7L R5 TDi LUXURY',2006,78600,'2.5L','DIESEL TURBO F/INJ','100L','128Kw',5,'6ATip','4D WAGON','4WD','2855mm',16),(269,'TOUAREG','7L R5 TDi LUXURY',2005,78600,'2.5L','DIESEL TURBO F/INJ','100L','128Kw',5,'6ATip','4D WAGON','4WD','2855mm',16),(270,'TRANSPORTER','T5 MY08 CREWVAN SWB',2008,42990,'2.5L','DIESEL TURBO F/INJ','80L','96Kw',5,'6ATip','VAN','FWD','3000mm',16),(271,'TRANSPORTER','T5 SWB',2005,43400,'2.5L','DIESEL TURBO F/INJ','80L','96Kw',2,'6ATip','VAN','FWD','3000mm',16),(272,'TT','MY99',1999,73000,'1.8L','TURBO MPFI','55L','132Kw',4,'5M','2D COUPE','FWD','2419mm',12),(273,'TT','QUATTRO',2004,92500,'1.8L','TURBO MPFI','62L','165Kw',2,'6M','2D ROADSTER','AWD','2429mm',12),(274,'V40','2',1997,45950,'1.9L','MULTI POINT F/INJ','60L','103Kw',5,'4A','5D WAGON','FWD','2550mm',5),(275,'V50','MY07 2.4 LE',2007,47950,'2.4L','MULTI POINT F/INJ','62L','125Kw',5,'5AG','4D WAGON','FWD','2640mm',5),(276,'V50','MY08 D5',2008,47950,'2.4L','DIESEL TURBO F/INJ','60L','132Kw',5,'5AG','4D WAGON','FWD','2640mm',5),(277,'VALIANT','CM GLX',1979,8014,'4.3L','CARB','79L','120Kw',5,'3A','4D SEDAN','RWD','2820mm',8),(278,'VITO','115CDI COMPACT CREW CAB',2005,48380,'2.1L','DIESEL TURBO F/INJ','75L','110Kw',5,'5A','5D VAN','RWD','3200mm',18),(279,'VOYAGER','GS SE',1999,48200,'3.3L','MULTI POINT F/INJ','76L','116Kw',7,'4A','4D WAGON','FWD','2878mm',8),(280,'VOYAGER','GS SE',2001,46900,'3.3L','MULTI POINT F/INJ','76L','116Kw',7,'4A','4D WAGON','FWD','2878mm',8),(281,'VOYAGER','RG 05 UPGRADE LX',2004,62980,'3.3L','MULTI POINT F/INJ','75L','128Kw',7,'4A','4D WAGON','FWD','3030mm',8),(282,'VOYAGER','RG SE',2002,52590,'3.3L','MULTI POINT F/INJ','75L','128Kw',7,'4A','4D WAGON','FWD','2787mm',8),(283,'X5','E53 3.0d',2004,84500,'3.0L','TURBO CDI','93L','150Kw',5,'6A','4D WAGON','4WD','2820mm',2),(284,'X5','E53 3.0d',2005,84300,'3.0L','TURBO CDI','93L','150Kw',5,'6A','4D WAGON','4WD','2820mm',2),(285,'X5','E53 3.0i',2004,84000,'3.0L','MULTI POINT F/INJ','93L','170Kw',5,'5AS','4D WAGON','4WD','2820mm',2),(286,'X5','E53 3.0i',2001,82350,'3.0L','MULTI POINT F/INJ','93L','170Kw',5,'5AS','4D WAGON','4WD','2820mm',2),(287,'X5','E53 3.0i',2006,84000,'3.0L','MULTI POINT F/INJ','93L','170Kw',5,'5AS','4D WAGON','4WD','2820mm',2),(288,'X5','E53 MY06 UPGRADE 3.0d',2006,86800,'3.0L','TURBO CDI','93L','150Kw',5,'6A','4D WAGON','4WD','2820mm',2),(289,'XC70','05 UPGRADE II LIFESTYLE EDITION LE',2005,64450,'2.5L','TURBO MPFI','70L','154Kw',5,'5AG','4D WAGON','AWD','2761mm',5),(290,'XC90','MY06 LIFESTYLE EDITION LE',2006,69950,'2.5L','TURBO MPFI','72L','154Kw',7,'5AG','4D WAGON','AWD','2857mm',5);
/*!40000 ALTER TABLE `main_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_state`
--

LOCK TABLES `main_state` WRITE;
/*!40000 ALTER TABLE `main_state` DISABLE KEYS */;
INSERT INTO `main_state` VALUES ('NSW','New South Wales'),('QLD','Queensland'),('SA','South Australia'),('TAS','Tasmania'),('VIC','Victoria');
/*!40000 ALTER TABLE `main_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_store`
--

LOCK TABLES `main_store` WRITE;
/*!40000 ALTER TABLE `main_store` DISABLE KEYS */;
INSERT INTO `main_store` VALUES (1,'Alexandria_stroe','3761 N. 14th St','1 (11) 543 535-0162',1),(2,'Coffs Harbour_store','2243 W St.','1 (11) 543 535-0110',2),(3,'Darlinghurst_store','5844 Linden Land','1 (11) 543 535-0184',3),(4,'Goulburn_store','1825 Village Pl.','1 (11) 543 535-0162',4),(5,'Lane Cove_store','7553 Harness Circle','1 (11) 543 535-0131',5),(6,'Lavender Bay_store','7305 Humphrey Drive','1 (11) 543 535-0151',6),(7,'Malabar_store','2612 Berry Dr','1 (11) 543 535-0184',7),(8,'Matraville_store','942 Brook Street','1 (11) 543 535-0126',8),(9,'Milsons Point_store','624 Peabody Road','1 (11) 543 535-0164',9),(10,'Newcastle_store','3839 Northgate Road','1 (11) 543 535-0110',10),(11,'North Ryde_store','7800 Corrinne Court','1 (11) 543 535-0169',11),(12,'North Sydney_store','1224 Shoenic','1 (11) 543 535-0117',12),(13,'Port Macquarie_store','4785 Scott Street','717-535-0164',13),(14,'Rhodes_store','7902 Hudson Ave.','817-535-0185',14),(15,'Silverwater_store','9011 Tank Drive','431-535-0156',15),(16,'Springwood_store','244 Willow Pass Road','208-535-0142',16),(17,'St. Leonards_store','9666 Northridge Ct.','135-535-0171',17),(18,'Sydney_store','7330 Saddlehill Lane','1 (11) 543 535-0195',18),(19,'Wollongong_store','244 Rivewview','1 (11) 543 535-0137',19),(20,'Brisbane_store','7832 Landing Dr','262-535-0112',20),(21,'Caloundra_store','7156 Rose Dr.','550-535-0163',21),(22,'East Brisbane_store','8148 W. Lake Dr.','622-535-0158',22),(23,'Gold Coast_store','1769 Nicholas Drive','589-535-0185',23),(24,'Hawthorne_store','4499 Valley Crest','452-535-0188',24),(25,'Hervey Bay_store','8734 Oxford Place','746-535-0186',25),(26,'Rockhampton_store','2596 Franklin Canyon Road','1 (11) 543 535-0178',26),(27,'Townsville_store','8211 Leeds Ct.','1 (11) 543 535-0131',27),(28,'Cloverdale_store','213 Valencia Place','1 (11) 543 535-0184',28),(29,'Findon_store','9111 Rose Ann Ave','1 (11) 543 535-0116',29),(30,'Perth_store','6385 Mark Twain','1 (11) 543 535-0146',30),(31,'Hobart_store','636 Vine Hill Way','1 (11) 543 535-0182',31),(32,'Bendigo_store','6465 Detroit Ave.','1 (11) 543 535-0195',32),(33,'Cranbourne_store','626 Bentley Street','1 (11) 543 535-0169',33),(34,'Geelong_store','5927 Rainbow Dr','1 (11) 543 535-0137',34),(35,'Melbourne_store','5167 Condor Place','1 (11) 543 535-0136',35),(36,'Melton_store','1873 Mt. Whitney Dr','1 (11) 543 535-0177',36),(37,'Seaford_store','3981 Augustine Drive','115-535-0183',37),(38,'South Melbourne_store','8915 Woodside Way','229-535-0112',38),(39,'Sunbury_store','8357 Sandy Cove Lane','1 (11) 543 535-0114',39),(40,'Warrnambool_store','9353 Creekside Dr.','1 (11) 543 535-0183',40);
/*!40000 ALTER TABLE `main_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `main_vehicleinstance`
--

LOCK TABLES `main_vehicleinstance` WRITE;
/*!40000 ALTER TABLE `main_vehicleinstance` DISABLE KEYS */;
INSERT INTO `main_vehicleinstance` VALUES (14864,1),(14853,2),(15110,3),(14860,4),(14867,5),(14875,6),(14876,7),(14881,8),(14883,9),(14847,10),(14861,11),(14873,12),(14854,13),(14870,14),(14833,15),(14856,16),(14839,17),(14884,18),(14858,19),(14852,20),(14874,21),(14889,22),(14872,23),(14882,24),(14832,25),(14862,26),(14865,27),(14857,28),(14855,29),(14851,30),(14888,31),(14834,32),(14843,33),(14877,34),(14842,35),(14837,36),(15119,37),(15109,38),(14880,39),(14887,40),(14859,41),(14838,42),(14878,43),(14879,44),(14836,45),(14850,46),(14835,47),(14885,48),(15085,49),(15087,50),(15102,51),(15104,52),(15080,53),(15186,54),(15309,55),(14900,56),(14896,57),(14899,58),(14901,59),(14897,60),(15002,61),(15000,62),(15001,63),(14985,64),(15026,65),(15041,66),(15045,67),(15126,68),(15128,69),(15125,70),(15122,71),(15129,72),(15124,73),(15127,74),(15123,75),(15130,76),(15167,77),(15148,78),(15165,79),(15146,80),(15150,81),(15168,82),(15181,83),(15144,84),(15162,85),(15040,86),(15020,87),(15010,88),(15030,89),(15143,90),(15163,91),(15161,92),(15169,93),(15149,94),(15166,95),(15224,96),(15229,97),(15241,98),(15243,99),(15244,100),(15247,101),(15225,102),(15242,103),(15249,104),(15250,105),(15260,106),(15263,107),(15226,108),(15259,109),(15223,110),(15228,111),(15230,112),(15246,113),(15240,114),(15227,115),(15261,116),(15264,117),(15245,118),(15248,119),(15280,120),(15043,121),(15160,122),(15142,123),(15140,124),(15147,125),(15303,126),(15304,127),(15305,128),(15297,129),(15302,130),(15300,131),(15306,132),(15301,133),(15184,134),(15348,135),(15345,136),(15368,137),(15369,138),(14969,139),(15367,140),(15363,141),(15364,142),(15347,143),(15357,144),(15360,145),(15343,146),(15346,147),(15362,148),(15342,149),(15350,150),(15340,151),(15361,152),(15365,153),(15366,154),(15349,155),(15344,156),(15341,157),(14819,158),(14815,159),(14895,160),(15200,161),(15207,162),(15282,163),(15284,164),(15027,165),(15029,166),(15046,167),(15048,168),(15044,169),(15323,170),(15326,171),(15329,172),(15327,173),(15308,174),(15325,175),(15317,176),(15307,177),(15321,178),(15310,179),(15330,180),(15400,181),(15322,182),(14941,183),(15006,184),(15011,185),(14943,186),(14930,187),(14965,188),(15066,189),(15063,190),(15047,191),(15202,192),(14812,193),(14818,194),(14817,195),(14816,196),(14814,197),(14810,198),(14813,199),(14806,200),(15024,201),(15050,202),(15042,203),(14891,204),(14811,205),(14945,206),(14950,207),(14911,208),(14921,209),(14924,210),(14922,211),(14940,212),(14948,213),(14914,214),(14909,215),(14966,216),(14964,217),(14910,218),(14915,219),(14926,220),(14947,221),(14949,222),(14925,223),(15208,224),(14984,225),(14912,226),(14903,227),(14920,228),(14906,229),(14908,230),(15082,231),(15081,232),(15028,233),(15007,234),(15022,235),(15004,236),(15023,237),(15005,238),(15009,239),(15049,240),(14927,241),(14907,242),(15209,243),(14923,244),(14960,245),(14962,246),(14944,247),(14942,248),(14905,249),(14946,250),(14928,251),(14967,252),(15205,253),(15210,254),(15221,255),(15204,256),(15324,257),(15106,258),(15121,259),(15101,260),(15100,261),(15108,262),(15083,263),(15103,264),(15068,265),(15003,266),(15008,267),(14929,268),(14961,269),(14902,270),(14904,271),(15316,272),(15328,273),(15105,274),(15089,275),(15084,276),(15199,277),(15025,278),(15203,279),(15222,280),(15220,281),(15201,282),(14831,283),(14890,284),(14846,285),(14863,286),(14866,287),(14871,288),(15088,289),(15107,290);
/*!40000 ALTER TABLE `main_vehicleinstance` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
