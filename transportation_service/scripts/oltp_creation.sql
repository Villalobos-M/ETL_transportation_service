-- Active: 1713537195020@@127.0.0.1@3306@transportation_service_db
-- MySQL Workbench Forward Engineering

drop schema if exists transportation_service_db;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema transportation_service_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema transportation_service_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `transportation_service_db` DEFAULT CHARACTER SET utf8 ;
USE `transportation_service_db` ;

-- -----------------------------------------------------
-- Table `transportation_service_db`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `country_UNIQUE` (`country` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`languages` (
  `language_id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE INDEX `language_UNIQUE` (`language` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `identity_number` VARCHAR(45) NULL,
  `location_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  `rating` DECIMAL(5,2) NULL,
  PRIMARY KEY (`user_id`, `location_id`, `language_id`),
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_users_locations1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_users_languages1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `transportation_service_db`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_languages1`
    FOREIGN KEY (`language_id`)
    REFERENCES `transportation_service_db`.`languages` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`drivers` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `identity_number` VARCHAR(45) NULL,
  `rating` DECIMAL(5,2) NULL,
  `driving_license_number` VARCHAR(45) NOT NULL,
  `language_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`driver_id`, `language_id`, `location_id`),
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_drivers_languages1_idx` (`language_id` ASC) VISIBLE,
  INDEX `fk_drivers_locations1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_drivers_languages1`
    FOREIGN KEY (`language_id`)
    REFERENCES `transportation_service_db`.`languages` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drivers_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `transportation_service_db`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`vehicles` (
  `vehicle_id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `registration` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `tax_token` YEAR NULL,
  `insurance_due_date` DATE NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`, `driver_id`),
  INDEX `fk_vehicles_drivers1_idx` (`driver_id` ASC) VISIBLE,
  CONSTRAINT `fk_vehicles_drivers1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `transportation_service_db`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`prices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`prices` (
  `price_id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`price_id`, `location_id`),
  INDEX `fk_prices_locations1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_prices_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `transportation_service_db`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`trips` (
  `trip_id` INT NOT NULL AUTO_INCREMENT,
  `price_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `driver_id` INT NULL,
  `initial_price` DECIMAL(6,2) NULL,
  `total_distance` DECIMAL(4,1) NULL,
  `final_price` DECIMAL(6,2) NULL,
  `driver_rating` TINYINT NULL,
  `user_rating` TINYINT NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `cancelation_time` DATETIME NULL,
  `reservation_date` DATETIME NULL,
  PRIMARY KEY (`trip_id`, `price_id`, `user_id`),
  INDEX `fk_trips_drivers1_idx` (`driver_id` ASC) VISIBLE,
  INDEX `fk_trips_prices1_idx` (`price_id` ASC) VISIBLE,
  INDEX `fk_trips_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_trips_drivers1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `transportation_service_db`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trips_prices1`
    FOREIGN KEY (`price_id`)
    REFERENCES `transportation_service_db`.`prices` (`price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trips_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `transportation_service_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`stops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`stops` (
  `stop_id` INT NOT NULL AUTO_INCREMENT,
  `trip_id` INT NOT NULL,
  `pickup_spot` POINT NOT NULL,
  `destination` POINT NOT NULL,
  `distance` DECIMAL(4,1) NOT NULL DEFAULT 0,
  `order` TINYINT NOT NULL,
  PRIMARY KEY (`stop_id`, `trip_id`),
  INDEX `fk_stops_trips1_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_stops_trips1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `transportation_service_db`.`trips` (`trip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`payment_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`payment_types` (
  `payment_type_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NULL,
  PRIMARY KEY (`payment_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`user_payment_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`user_payment_methods` (
  `user_payment_method_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `payment_type_id` INT NOT NULL,
  `is_default` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_payment_method_id`, `user_id`, `payment_type_id`),
  INDEX `fk_payments_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_payments_payment_types1_idx` (`payment_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `transportation_service_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_payment_types1`
    FOREIGN KEY (`payment_type_id`)
    REFERENCES `transportation_service_db`.`payment_types` (`payment_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`discounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`discounts` (
  `discount_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `percentage` INT NOT NULL,
  `expiration_date` DATE NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`discount_id`),
  INDEX `fk_discounts_users1_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  CONSTRAINT `fk_discounts_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `transportation_service_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`payments` (
  `payments_id` INT NOT NULL AUTO_INCREMENT,
  `trip_id` INT NOT NULL,
  `user_payment_method_id` INT NOT NULL,
  `discount_id` INT NULL,
  `sub_total` DECIMAL(6,2) NULL,
  `discount` DECIMAL(6,2) NULL DEFAULT 0,
  `total` DECIMAL(6,2) NULL,
  `payment_time` DATETIME NULL,
  `refund_time` DATETIME NULL,
  PRIMARY KEY (`payments_id`, `trip_id`, `user_payment_method_id`),
  INDEX `fk_payments_trips1_idx` (`trip_id` ASC) VISIBLE,
  INDEX `fk_payments_user_payments1_idx` (`user_payment_method_id` ASC) VISIBLE,
  INDEX `fk_payments_discounts1_idx` (`discount_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_trips1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `transportation_service_db`.`trips` (`trip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_user_payments1`
    FOREIGN KEY (`user_payment_method_id`)
    REFERENCES `transportation_service_db`.`user_payment_methods` (`user_payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_discounts1`
    FOREIGN KEY (`discount_id`)
    REFERENCES `transportation_service_db`.`discounts` (`discount_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`vouchers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`vouchers` (
  `voucher_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(16) NOT NULL,
  `expiration_date` DATE NULL,
  `user_payment_method_id` INT NULL,
  PRIMARY KEY (`voucher_id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  INDEX `fk_vouchers_user_payment_methods1_idx` (`user_payment_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_vouchers_user_payment_methods1`
    FOREIGN KEY (`user_payment_method_id`)
    REFERENCES `transportation_service_db`.`user_payment_methods` (`user_payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`gift_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`gift_cards` (
  `gift_card_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(16) NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `expiration_date` DATE NULL,
  `user_payment_method_id` INT NULL,
  PRIMARY KEY (`gift_card_id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  INDEX `fk_gift_cards_user_payment_methods1_idx` (`user_payment_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_gift_cards_user_payment_methods1`
    FOREIGN KEY (`user_payment_method_id`)
    REFERENCES `transportation_service_db`.`user_payment_methods` (`user_payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`credit_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`credit_cards` (
  `credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(16) NOT NULL,
  `card_holder` VARCHAR(45) NOT NULL,
  `expiration_date_year` YEAR NOT NULL,
  `expiration_date_month` INT NOT NULL,
  `cvv` VARCHAR(3) NOT NULL,
  `nickname` VARCHAR(45) NULL,
  `location_id` INT NOT NULL,
  `user_payment_method_id` INT NOT NULL,
  PRIMARY KEY (`credit_card_id`, `location_id`, `user_payment_method_id`),
  INDEX `fk_credit_cards_locations1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_credit_cards_user_payment_methods1_idx` (`user_payment_method_id` ASC) VISIBLE,
  UNIQUE INDEX `card_number_UNIQUE` (`card_number` ASC) VISIBLE,
  CONSTRAINT `fk_credit_cards_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `transportation_service_db`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit_cards_user_payment_methods1`
    FOREIGN KEY (`user_payment_method_id`)
    REFERENCES `transportation_service_db`.`user_payment_methods` (`user_payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transportation_service_db`.`app_cash`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportation_service_db`.`app_cash` (
  `app_cash_id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL DEFAULT 0,
  `user_payment_method_id` INT NOT NULL,
  PRIMARY KEY (`app_cash_id`, `user_payment_method_id`),
  INDEX `fk_app_cash_user_payment_methods1_idx` (`user_payment_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_app_cash_user_payment_methods1`
    FOREIGN KEY (`user_payment_method_id`)
    REFERENCES `transportation_service_db`.`user_payment_methods` (`user_payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
