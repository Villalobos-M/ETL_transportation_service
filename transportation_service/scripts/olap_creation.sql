-- Active: 1713537195020@@127.0.0.1@3306@dw_transportation_service
-- MySQL Workbench Forward Engineering
drop schema if exists `dw_transportation_service`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dw_transportation_service
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dw_transportation_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw_transportation_service` DEFAULT CHARACTER SET utf8 ;
USE `dw_transportation_service` ;

-- -----------------------------------------------------
-- Table `dw_transportation_service`.`dimension_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`dimension_users` (
  `user_id` INT NOT NULL,
  `rating` DECIMAL(5,2) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_transportation_service`.`dimension_vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`dimension_vehicles` (
  `driver_id` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `year` YEAR NULL,
  `tax_token` VARCHAR(45) NULL,
  `insurance_due_date_id` BIGINT NULL,
  `rating` DECIMAL(5,2) NULL,
  PRIMARY KEY (`driver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_transportation_service`.`dimension_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`dimension_locations` (
  `location_id` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_transportation_service`.`fact_trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`fact_trips` (
  `trip_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `driver_id` INT NULL,
  `pickup_spot` POINT NULL,
  `destination` POINT NULL,
  `initial_price` DECIMAL(6,2) NULL,
  `total_distance` DECIMAL(4,1) NULL,
  `final_price` VARCHAR(45) NULL,
  `driver_rating` TINYINT NULL,
  `user_rating` TINYINT NULL,
  `start_time_id` BIGINT NULL,
  `end_time_id` BIGINT NULL,
  `cancelation_time_id` BIGINT NULL,
  `reservation_time_id` BIGINT NULL,
  `sub_total` DECIMAL(6,2) NULL,
  `discount` DECIMAL(6,2) NULL,
  `total` DECIMAL(6,2) NULL,
  `payment_time_id` BIGINT NULL,
  `refund_time_id` BIGINT NULL,
  `payment_type` VARCHAR(45) NULL,
  `brand` VARCHAR(45) NULL,
  `unit` VARCHAR(45) NULL,
  `price` DECIMAL(6,2) NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`trip_id`, `user_id`, `location_id`),
  INDEX `fk_fact_trips_dimension_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_fact_trips_dimension_vehicles1_idx` (`driver_id` ASC) VISIBLE,
  INDEX `fk_fact_trips_dimension_locations1_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_fact_trips_dimension_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `dw_transportation_service`.`dimension_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_trips_dimension_vehicles1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `dw_transportation_service`.`dimension_vehicles` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_trips_dimension_locations1`
    FOREIGN KEY (`location_id`)
    REFERENCES `dw_transportation_service`.`dimension_locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_transportation_service`.`fact_stops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`fact_stops` (
  `stop_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `pickup_spot` POINT NOT NULL,
  `destination` POINT NOT NULL,
  `distance` DECIMAL(4,1) NOT NULL,
  `order` INT NOT NULL,
  PRIMARY KEY (`stop_id`, `trip_id`),
  INDEX `fk_dimension_stops_dimension_trips_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_dimension_stops_dimension_trips`
    FOREIGN KEY (`trip_id`)
    REFERENCES `dw_transportation_service`.`fact_trips` (`trip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_transportation_service`.`dimension_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_transportation_service`.`dimension_time` (
  `time_id` BIGINT NOT NULL,
  `year` YEAR NULL,
  `quarter` TINYINT NULL,
  `month` TINYINT NULL,
  `day` TINYINT NULL,
  `day_of_week` TINYINT NULL,
  `day_of_year` INT NULL,
  `week_of_year` TINYINT NULL,
  `is_weekend` TINYINT NULL,
  `hour` TINYINT NULL,
  `minutes` TINYINT NULL,
  `seconds` TINYINT NULL,
  PRIMARY KEY (`time_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
