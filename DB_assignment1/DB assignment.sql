CREATE TABLE `Person` (
  `ssn` int PRIMARY KEY NOT NULL,
  `first_name` varchar(10),
  `last_name` varchar(10),
  `city` varchar(10),
  `street` varchar(10),
  `sex` varchar(10),
  `data_of_birth` date,
  `phone` int,
  `email` varchar(30)
);

CREATE TABLE `Customer` (
  `ssn` int PRIMARY KEY NOT NULL,
  `credit_card_number` varchar(30) NOT NULL,
  `shopping_history` mediumtext
);

CREATE TABLE `Clerk` (
  `ssn` int PRIMARY KEY NOT NULL,
  `year_of_experiment` int NOT NULL,
  `a_id` int
);

CREATE TABLE `Security_Officer` (
  `ssn` int PRIMARY KEY NOT NULL,
  `physical_fitness` varchar(30) NOT NULL,
  `a_id` int
);

CREATE TABLE `Shipper` (
  `ssn` int PRIMARY KEY NOT NULL,
  `vehicle_using` varchar(20) NOT NULL,
  `a_id` int
);

CREATE TABLE `Skill` (
  `ssn` int PRIMARY KEY NOT NULL,
  `professional_skill` mediumtext
);

CREATE TABLE `Administrator` (
  `admin_id` int PRIMARY KEY,
  `admin_name` varchar(20)
);

CREATE TABLE `Product` (
  `product_id` int PRIMARY KEY NOT NULL,
  `color` varchar(20),
  `p_name` varchar(20) NOT NULL,
  `image_url` text,
  `supplier_name` varchar(20)
);

CREATE TABLE `Item` (
  `product_id` int NOT NULL,
  `item_id` int NOT NULL,
  `Availability` bool NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`, `item_id`)
);

CREATE TABLE `Bill` (
  `bill_no` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `discount` int,
  `volume` int NOT NULL,
  `date` date,
  `tax` int,
  `customer_ssn` int NOT NULL
);

CREATE TABLE `Deal` (
  `bill_no` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT 1,
  PRIMARY KEY (`bill_no`, `product_id`)
);

CREATE TABLE `Supplier` (
  `s_name` varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE `Provide` (
  `s_name` varchar(20),
  `product_id` int,
  `unit_price` int NOT NULL,
  PRIMARY KEY (`s_name`, `product_id`)
);

CREATE TABLE `Store` (
  `store_id` int PRIMARY KEY NOT NULL,
  `location` varchar(20) NOT NULL,
  `area` int DEFAULT 50,
  `a_id` int
);

CREATE TABLE `Warehouse` (
  `warehouse_id` int PRIMARY KEY NOT NULL,
  `address` varchar(20) NOT NULL,
  `floor` int DEFAULT 1,
  `a_id` int
);

CREATE TABLE `Has` (
  `warehouse_id` int,
  `store_id` int,
  PRIMARY KEY (`warehouse_id`, `store_id`)
);

ALTER TABLE `Customer` ADD FOREIGN KEY (`ssn`) REFERENCES `Person` (`ssn`);

ALTER TABLE `Clerk` ADD FOREIGN KEY (`ssn`) REFERENCES `Person` (`ssn`);

ALTER TABLE `Security_Officer` ADD FOREIGN KEY (`ssn`) REFERENCES `Person` (`ssn`);

ALTER TABLE `Shipper` ADD FOREIGN KEY (`ssn`) REFERENCES `Person` (`ssn`);

ALTER TABLE `Skill` ADD FOREIGN KEY (`ssn`) REFERENCES `Clerk` (`ssn`);

ALTER TABLE `Skill` ADD FOREIGN KEY (`ssn`) REFERENCES `Security_Officer` (`ssn`);

ALTER TABLE `Clerk` ADD FOREIGN KEY (`a_id`) REFERENCES `Administrator` (`admin_id`);

ALTER TABLE `Security_Officer` ADD FOREIGN KEY (`a_id`) REFERENCES `Administrator` (`admin_id`);

ALTER TABLE `Shipper` ADD FOREIGN KEY (`a_id`) REFERENCES `Administrator` (`admin_id`);

ALTER TABLE `Bill` ADD FOREIGN KEY (`customer_ssn`) REFERENCES `Customer` (`ssn`);

ALTER TABLE `Item` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`);

ALTER TABLE `Deal` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`);

ALTER TABLE `Deal` ADD FOREIGN KEY (`bill_no`) REFERENCES `Bill` (`bill_no`);

ALTER TABLE `Provide` ADD FOREIGN KEY (`s_name`) REFERENCES `Supplier` (`s_name`);

ALTER TABLE `Provide` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`);

ALTER TABLE `Has` ADD FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`);

ALTER TABLE `Has` ADD FOREIGN KEY (`store_id`) REFERENCES `Store` (`store_id`);

ALTER TABLE `Warehouse` ADD FOREIGN KEY (`a_id`) REFERENCES `Administrator` (`admin_id`);

ALTER TABLE `Store` ADD FOREIGN KEY (`a_id`) REFERENCES `Administrator` (`admin_id`);

