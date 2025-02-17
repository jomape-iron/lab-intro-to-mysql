SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `car_sales` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_sales` ;

CREATE TABLE IF NOT EXISTS `car_sales`.`cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(17) NOT NULL,
  `Manufacturer` VARCHAR(20) NULL DEFAULT NULL,
  `Car_model` VARCHAR(20) NOT NULL,
  `Date` YEAR NOT NULL,
  `Color` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `VIN`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`customers` (
  `Customer ID` INT NOT NULL,
  `c_name` VARCHAR(20) NOT NULL,
  `s_surname` VARCHAR(20) NOT NULL,
  `Phone number` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `Adress` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `state/province` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(20) NULL DEFAULT NULL,
  `Zip/postal code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Customer ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`salespersons` (
  `Staff ID` INT NOT NULL,
  `sp_name` VARCHAR(45) NOT NULL,
  `sp_surname` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`invoices` (
  `ID` VARCHAR(10) NULL,
  `Invoice number` INT NOT NULL,
  `Invoice_date` DATE NOT NULL,
  `Customers_Customer ID` INT NOT NULL,
  `Cars_VIN` VARCHAR(17) NOT NULL,
  `Salespersons_Staff ID` INT NOT NULL,
  PRIMARY KEY (`Customers_Customer ID`, `Cars_VIN`, `Salespersons_Staff ID`),
  INDEX `fk_Invoices_Customers_idx` (`Customers_Customer ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_Staff ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `car_sales`.`cars` (`VIN`),
  CONSTRAINT `fk_Invoices_Customers`
    FOREIGN KEY (`Customers_Customer ID`)
    REFERENCES `car_sales`.`customers` (`Customer ID`),
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_Staff ID`)
    REFERENCES `car_sales`.`salespersons` (`Staff ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
