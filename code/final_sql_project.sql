-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Tourism
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.20.04.1

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

DROP DATABASE IF EXISTS `TOURISM`;
CREATE SCHEMA `TOURISM`;
USE `TOURISM`;

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
      `cust_id`  bigint NOT NULL PRIMARY KEY ,
      `date_of_birth` varchar(20) DEFAULT NULL,
	    `home_city` varchar(30) NOT NULL,
      `email_id` varchar(60) NOT NULL, 
	    `gender` char(10) NOT NULL,
      `travel_no` int NOT NULL,
      `pincode` int NOT NULL,
      `fname` varchar(12) NOT NULL,
      `mname` varchar(12) NOT NULL,
      `lname` varchar(12) NOT NULL,
      `username` varchar(30) NOT NULL,
      `password` varchar(20) NOT NULL,
      FOREIGN KEY (`date_of_birth`) REFERENCES `cust_age` (`date_of_birth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Customer VALUES (230415661234,'1997-04-11','vizag','rameshh@gmail.com','male',3,258721,'ramesh','dash','dashramesh','dash123','sjfdhriugh');
INSERT INTO Customer VALUES (573939361234,'1970-02-05','kurnool','riyaaa@gmail.com','female',5,600031,'riya','tara','tarariya','tara1234','uhgreugh');
INSERT INTO Customer VALUES (506848581234,'1986-11-22','nellore','fakarourrr@gmail.com','male',8,746353,'fakaruddin','rao','gaur','gaur1234','erygerg');

DROP TABLE IF EXISTS `cust_age` ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_age` (
      `date_of_birth` varchar(20) NOT NULL PRIMARY KEY,
     `age` int NOT NULL,
      UNIQUE (`date_of_birth`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO cust_age VALUES ('1997-04-11',23);
INSERT INTO cust_age VALUES ('1970-02-05',50);
INSERT INTO cust_age VALUES ('1986-11-22',33);

/*INSERT INTO Customer VALUES (23,'2002-05-02','chennai','abc@gmail.com','female',456,600031,'dsg','fgd','fdh','drg','pqpe',34)*/

DROP TABLE IF EXISTS `Family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Family` (
      `cust_id` bigint NOT NULL,
	    `no_of_old_ppl` int NOT NULL,
      `total_no_of_family_members` int NOT NULL,
      `no_of_females` int NOT NULL,
      `no_of_children` int NOT NULL,
      FOREIGN KEY (`cust_id`) REFERENCES `Customer` (`cust_id`) 

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Family VALUES (230415661234, 1,4,2,1);
INSERT INTO Family VALUES (573939361234, 0,2,1,0);
INSERT INTO Family VALUES (506848581234, 2,6,3,0);

DROP TABLE IF EXISTS `Customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_contact` (
     `cust_id` bigint NOT NULL,
	   `contact_no` bigint NOT NULL,
	 FOREIGN KEY (`cust_id`) REFERENCES `Customer` (`cust_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Customer_contact VALUES (230415661234, 9472946527);
INSERT INTO Customer_contact VALUES (230415661234, 9637478494);
INSERT INTO Customer_contact VALUES (230415661234, 9965465244);
INSERT INTO Customer_contact VALUES (573939361234, 9362573625);
INSERT INTO Customer_contact VALUES (506848581234, 9274274654);
INSERT INTO Customer_contact VALUES (506848581234, 9123468443);

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Package` (
	    `transaction_id` int NOT NULL PRIMARY KEY auto_increment,
      `cust_id` bigint NOT NULL,
      `type` varchar(30) NOT NULL,
	    `cost` int NOT NULL,
	    `start_date` varchar(20) DEFAULT NULL,
      `transaction_status` char(20) NOT NULL,
      FOREIGN KEY (`cust_id`) REFERENCES `Customer` (`cust_id`),
      FOREIGN KEY (`type`) REFERENCES `Package_type` (`type`),
      FOREIGN KEY (`start_date`) REFERENCES `date` (`start_date`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Package (cust_id,type,cost,start_date,transaction_status) VALUES (506848581234,'3H',2500,'2020-05-08','enrolled');
INSERT INTO Package (cust_id,type,cost,start_date,transaction_status) VALUES (573939361234,'1V',1000,'2020-09-09','enrolled');
INSERT INTO Package (cust_id,type,cost,start_date,transaction_status) VALUES (573939361234,'3C',2500,'2020-08-10','enrolled');
INSERT INTO Package (cust_id,type,cost,start_date,transaction_status) VALUES (506848581234,'5H',4500,'2020-06-08','cancelled');



DROP TABLE IF EXISTS `Package_type` ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Package_type` (
       `type` varchar(30) NOT NULL PRIMARY KEY,
       `cost` float NOT NULL,    
        UNIQUE (`type`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO Package_type VALUES ('1H',1000);
INSERT INTO Package_type VALUES ('3H',2500);
INSERT INTO Package_type VALUES ('5H',4500);
INSERT INTO Package_type VALUES ('1V',1000);
INSERT INTO Package_type VALUES ('3V',2500);
INSERT INTO Package_type VALUES ('5V',4500);
INSERT INTO Package_type VALUES ('1C',1000);
INSERT INTO Package_type VALUES ('3C',2500);
INSERT INTO Package_type VALUES ('5C',4500);


DROP TABLE IF EXISTS `date` ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
      `start_date` varchar(20) NOT NULL PRIMARY KEY,
      `end_date` varchar(20) NOT NULL,
      UNIQUE (`start_date`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO date VALUES ('2020-05-08','2020-05-11');
INSERT INTO date VALUES ('2020-09-09','2020-09-10');
INSERT INTO date VALUES ('2020-08-10','2020-08-15');
INSERT INTO date VALUES ('2020-06-08','2020-06-13');

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee`(
      `emp_id` bigint NOT NULL PRIMARY KEY,
      `salary` float NOT NULL,
      `Name` char(20) NOT NULL,
	    `Designation` varchar(20) NOT NULL,
	    `Gender` char(10) NOT NULL,
      `email` varchar(60) NOT NULL,
      `username` varchar(30) NOT NULL,
      `password` varchar(20) NOT NULL,
	    `date_of_birth` varchar(20) DEFAULT NULL,
      FOREIGN KEY (`date_of_birth`) REFERENCES `Emp_age` (`date_of_birth`),
    UNIQUE (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Employee VALUES(123456789012,25000,'Ram gopal','Senior manager','male','gopall@gmail.com','gopalram','gopal1234','1986-09-22');
INSERT INTO Employee VALUES(647829362738,19000,'Gulab anees','junior manager','male','gulabb@gmail.com','aneesgulab','anees1234','1976-07-27');
INSERT INTO Employee VALUES(993737746353,22000,'avantika madani','excecutive','female','madanii@gmail.com','madaniavantika','madani1234','1989-11-13');
INSERT INTO Employee VALUES(637482919736,17000,'rachel bawa','Salesman','female','bawaa@gmail.com','bawarachel','bawa1234','1999-01-30');


DROP TABLE IF EXISTS `Emp_age` ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Emp_age` (
  `date_of_birth` varchar(20) NOT NULL PRIMARY KEY,
  `age` int NOT NULL,
  UNIQUE (`age`)

)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Emp_age VALUES ('1986-09-22',36);
INSERT INTO Emp_age VALUES ('1976-07-27',26);
INSERT INTO Emp_age VALUES ('1989-11-13',30);
INSERT INTO Emp_age VALUES ('1999-01-30',21);

DROP TABLE IF EXISTS `Emp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Emp_contact` (
    `emp_id` bigint NOT NULL,
	  `contact_no` bigint NOT NULL,
     FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) 
	
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Emp_contact VALUES(123456789012,7263827337);
INSERT INTO Emp_contact VALUES(647829362738,7263646364);
INSERT INTO Emp_contact VALUES(647829362738,7362384567);
INSERT INTO Emp_contact VALUES(647829362738,9273655757);
INSERT INTO Emp_contact VALUES(993737746353,9263647273);
INSERT INTO Emp_contact VALUES(637482919736,9263526374);
INSERT INTO Emp_contact VALUES(637482919736,9987456632);
INSERT INTO Emp_contact VALUES(637482919736,9087325793);

DROP TABLE IF EXISTS `Travel_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Travel_guide` (
	    `emp_id` bigint NOT NULL  PRIMARY KEY AUTO_INCREMENT,
      `city_code` varchar(10) NOT NULL,
      `door_no` varchar(15) NOT NULL,
      `street_name` varchar(15) NOT NULL,
      `locality` varchar(15) NOT NULL,
      `service_cost` float NOT NULL,
      `username` varchar(15) NOT NULL,
      `password` varchar(15) NOT NULL,
      FOREIGN KEY (`city_code`) REFERENCES `City` (`city_code`) 
    
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Travel_guide VALUES(637363775555,'CHE','42','mangal street','vani nagar',2300,'srivasanth','vasanth1234');
INSERT INTO Travel_guide VALUES(765432223445,'HYD','79','swaminath street','koti',2100,'manaswini','manu1234');

DROP TABLE IF EXISTS `languages_known`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages_known` (
      `emp_id` bigint NOT NULL,
	`language` char(20) NOT NULL,
     FOREIGN KEY (`emp_id`) REFERENCES `travel_guide` (`emp_id`) 

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO languages_known VALUES(637363775555,'english');
INSERT INTO languages_known VALUES(637363775555,'hindi');
INSERT INTO languages_known VALUES(637363775555,'tamil');
INSERT INTO languages_known VALUES(765432223445,'english');
INSERT INTO languages_known VALUES(765432223445,'hindi');
INSERT INTO languages_known VALUES(765432223445,'telugu');

DROP TABLE IF EXISTS `Guide_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guide_contact` (
    `emp_id` bigint NOT NULL,
	  `Contact_no` bigint NOT NULL,
	   FOREIGN KEY (`emp_id`) REFERENCES `travel_guide` (`emp_id`) 

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Guide_contact VALUES (637363775555,9643120351);
INSERT INTO Guide_contact VALUES (637363775555,9105483635);
INSERT INTO Guide_contact VALUES (765432223445,9915244758);
INSERT INTO Guide_contact VALUES (765432223445,9999651442);

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
	  `city_code` varchar(10) NOT NULL,
	  `state` varchar(20) NOT NULL,
    `city_name` varchar(20) NOT NULL,
	  PRIMARY KEY (`city_code`),
    UNIQUE (`city_code`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO City VALUES('HYD','Telangana','Hyderabad');
INSERT INTO City VALUES('VIJ','Andhra Pradesh','Vijayawada');
INSERT INTO City VALUES('CHE','Tamil Nadu','Chennai');

DROP TABLE IF EXISTS `Bus_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bus_reservation` (
  `service_no` varchar(15) NOT NULL,
  `total_available_seats` int NOT NULL,
  `seat_type` varchar(15) NOT NULL,
  `departure_date` varchar(20) DEFAULT NULL,
  `departure_time` varchar(20) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `source`  varchar(40) NOT NULL,
  `destination` varchar(40) NOT NULL,
  KEY `service_no` (`service_no`),
  FOREIGN KEY (`service_no`) REFERENCES `Bus` (`service_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Bus_reservation VALUES('998','20','luxury','2020-05-08','19:30',750,'Gachibowli','Charminar');
INSERT INTO Bus_reservation VALUES('567','16','luxury','2020-05-09','07:30',600,'Charminar','Birla mandir');
INSERT INTO Bus_reservation VALUES('567','13','normal','2020-05-09','08:30',500,'Birla andir','Lumbini Prk');
INSERT INTO Bus_reservation VALUES('567','23','luxury','2020-05-09','11:30',800,'Lumbini park','Wonderland');

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bus` (
  `service_no` varchar(15) NOT NULL,
  `license_plateno` varchar(20) NOT NULL,
  `Drivername` varchar(20) NOT NULL,
  PRIMARY KEY (`service_no`),
  UNIQUE(`service_no`,`license_plateno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Bus VALUES('998','TS12DE1433','Pulakit raj');
INSERT INTO Bus VALUES('567','TS65SF3564','Vani jayaraj');

DROP TABLE IF EXISTS `Bus_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bus_contact` (
  `service_no` varchar(15) NOT NULL,
  `contact_no` bigint DEFAULT NULL,
  FOREIGN KEY (`service_no`) REFERENCES `Bus` (`service_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Bus_contact VALUES('998',9876532166);
INSERT INTO Bus_contact VALUES('998',9995555333);
INSERT INTO Bus_contact VALUES('567',9999632223);
INSERT INTO Bus_contact VALUES('567',9000877765);

DROP TABLE IF EXISTS `Agency_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agency_office` (
  `pin_code_of_agency` bigint NOT NULL,
  `no_of_employees` int DEFAULT NULL,
  `door_no` varchar(20) 	NOT NULL,
  `streetname` varchar(20) 	NOT NULL,
  `locality`  varchar(30) 	NOT NULL,
   PRIMARY KEY(`pin_code_of_agency`),
   UNIQUE(`pin_code_of_agency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO Agency_office VALUES(510372,4,'23','vasanth street','gachibowli');
INSERT INTO Agency_office VALUES(810372,4,'44','off road side street','penumaka');
INSERT INTO Agency_office VALUES(610372,4,'15','manipalem street','taramani');


DROP TABLE IF EXISTS `Agency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agency_contact` (
  `pin_code_of_agency` bigint NOT NULL,
  `contact_no` bigint DEFAULT NULL,
  FOREIGN KEY (`pin_code_of_agency`) REFERENCES `Agency_office` (`pin_code_of_agency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO Agency_contact VALUES(510372,9926555222);
INSERT INTO Agency_contact VALUES(810372,9552444442);
INSERT INTO Agency_contact VALUES(610372,9002873636);

DROP TABLE IF EXISTS `Works_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works_at` (
  `emp_id` bigint NOT NULL,
  `pin_code_of_agency` bigint NOT NULL,
  FOREIGN KEY (`pin_code_of_agency`) REFERENCES `Agency_office` (`pin_code_of_agency`),
  FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO Works_at VALUES(765432223445,510372);
INSERT INTO Works_at VALUES(647829362738,510372);
INSERT INTO Works_at VALUES(123456789012,810372);
INSERT INTO Works_at VALUES(993737746353,810372);
INSERT INTO Works_at VALUES(637363775555,610372);
INSERT INTO Works_at VALUES(637482919736,610372);


DROP TABLE IF EXISTS `Restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restaurants` (
  `locality_id` int NOT NULL,
  `restaurant_name` varchar(20) 	NOT NULL,
  `restaurant_type` varchar(20) 	NOT NULL,
  `avgrate_person`  float DEFAULT  NULL,
  `streetaddress`  varchar(30) 	NOT NULL,
  `rating` int DEFAULT NULL,
   PRIMARY KEY(`locality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO Restaurants VALUES(1345,'saravana_bhavan','AC',400,'Anna salai street',4);
INSERT INTO Restaurants VALUES(1262,'sangeetha','non-AC',200,'tharamani',3);
INSERT INTO Restaurants VALUES(5345,'paradise','AC',400,'charminar rd',4);
INSERT INTO Restaurants VALUES(5283,'taj','non-AC',200,'salar jung road',3);
INSERT INTO Restaurants VALUES(9263,'barbeque nation','AC',400,'NRP road',4);
INSERT INTO Restaurants VALUES(9362,'bamboo and biryani','non-AC',200,'prakasam rd',3);

DROP TABLE IF EXISTS `Places_of_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Places_of_visit` (
  `pin_code_of_place` varchar(10) NOT NULL,
  `door_no` varchar(20) NOT NULL,
  `streetname` varchar(20) 	NOT NULL,
  `locality`  varchar(30) 	NOT NULL,
  `pause_time` int DEFAULT NULL,
  `distance_from_office` float NOT NULL,
  `avgcost_person` float default NULL,
  `rating` int default NULL,
   PRIMARY KEY(`pin_code_of_place`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Places_of_visit VALUES(523105,'1','prakasam barriage road','near prakasam barriage',25,1.5,200,4);
INSERT INTO Places_of_visit VALUES(520002,'1','mg road','Buckinghampeta',25,4,250,8);
INSERT INTO Places_of_visit VALUES(600048,'1','grand sourthern road','vandalur',25,3,220,4);
INSERT INTO Places_of_visit VALUES(603118,'49','state highway','muthukadu',25,6,320,8);
INSERT INTO Places_of_visit VALUES(500002,'1','charminar road','ghanzi bazar',25,3,230,4);
INSERT INTO Places_of_visit VALUES(500004,'1','salar jung road','darul shifa',25,4,250,8);
INSERT INTO Places_of_visit VALUES(500006,'2','ramu palace','vijaya nagar',25,3,230,4);

DROP TABLE IF EXISTS `Are_there_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Are_there_in` (
  `city_code` varchar(10) default NULL,
  `pin_code_of_agency` bigint default NULL,
  `locality_id` int default NULL,
  `pin_code_of_place` varchar(10) default NULL,
  FOREIGN KEY (`pin_code_of_agency`) REFERENCES `Agency_office` (`pin_code_of_agency`),
  FOREIGN KEY (`pin_code_of_place`) REFERENCES `Places_of_visit` (`pin_code_of_place`),
  foreign key(`locality_id`) references `Restaurants`(	`locality_id`),
  foreign key(`city_code`) references `City`(`city_code`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO Are_there_in VALUES('HYD',510372,5345,500002);
INSERT INTO Are_there_in VALUES('HYD',510372,5283,500004);
INSERT INTO Are_there_in VALUES('VIJ',810372,9263,523105);
INSERT INTO Are_there_in VALUES('VIJ',810372,9362,520002);
INSERT INTO Are_there_in VALUES('CHE',610372,1345,600048);
INSERT INTO Are_there_in VALUES('CHE',610372,1262,603118);
INSERT INTO are_there_in VALUES('VIJ',810372,1262,500006);