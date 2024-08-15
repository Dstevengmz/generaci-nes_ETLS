-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contenido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Id_usuario` INT(10) NOT NULL,
  `Edad` INT(10) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Plataforma` VARCHAR(50) NOT NULL,
  `Hora_de_uso_minutos` INT(10) NOT NULL,
  `Puplicaciones_por_dia` VARCHAR(10) NOT NULL,
  `Me_gusta_por_dia` INT(10) NOT NULL,
  `Comentarios_recibidos_por_dia` INT(10) NOT NULL,
  `Mensajes_enviados_por_dia` INT(10) NOT NULL,
  `Emocion_dominante` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plataforma` (
  `idPlataforma` INT NOT NULL AUTO_INCREMENT,
  `nombre_plataforma` VARCHAR(60) NULL,
  PRIMARY KEY (`idPlataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Edad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Edad` (
  `idEdad` INT NOT NULL AUTO_INCREMENT,
  `grupo_edad` INT NULL,
  PRIMARY KEY (`idEdad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombre_genero` VARCHAR(60) NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Emocion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Emocion` (
  `idEmocion` INT NOT NULL AUTO_INCREMENT,
  `nombre_emocion` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmocion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Uso de redes sociales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Uso de redes sociales` (
  `idUso_de_redes_sociales` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_codigo` INT(10) NULL,
  `tiempo_uso_diario(minutos)` INT(10) NULL,
  `publicaciones_por_dia` INT(10) NULL,
  `me_gusta_recibidos_por_dia` INT(10) NULL,
  `comentarios_recibidos_por_dia` INT(10) NULL,
  `mensajes_enviados_por_dia` INT(10) NULL,
  `Edad_idEdad` INT NOT NULL,
  `Plataforma_idPlataforma` INT NOT NULL,
  `Genero_idGenero` INT NOT NULL,
  `Emocion_idEmocion` INT NOT NULL,
  PRIMARY KEY (`idUso_de_redes_sociales`),
  INDEX `fk_Uso de redes sociales_Edad_idx` (`Edad_idEdad` ASC) VISIBLE,
  INDEX `fk_Uso de redes sociales_Plataforma1_idx` (`Plataforma_idPlataforma` ASC) VISIBLE,
  INDEX `fk_Uso de redes sociales_Genero1_idx` (`Genero_idGenero` ASC) VISIBLE,
  INDEX `fk_Uso de redes sociales_Emocion1_idx` (`Emocion_idEmocion` ASC) VISIBLE,
  CONSTRAINT `fk_Uso de redes sociales_Edad`
    FOREIGN KEY (`Edad_idEdad`)
    REFERENCES `mydb`.`Edad` (`idEdad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uso de redes sociales_Plataforma1`
    FOREIGN KEY (`Plataforma_idPlataforma`)
    REFERENCES `mydb`.`Plataforma` (`idPlataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uso de redes sociales_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `mydb`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uso de redes sociales_Emocion1`
    FOREIGN KEY (`Emocion_idEmocion`)
    REFERENCES `mydb`.`Emocion` (`idEmocion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
