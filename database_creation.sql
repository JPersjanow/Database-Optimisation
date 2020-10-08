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
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(50) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `user_email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `user_password_UNIQUE` (`user_password` ASC) VISIBLE,
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE)
ENGINE = InnoDB


-- -----------------------------------------------------
-- Table `mydb`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`videos` (
  `idvideos` INT NOT NULL AUTO_INCREMENT,
  `video_name` VARCHAR(50) NOT NULL,
  `video_description` LONGTEXT NULL,
  `vide_tags` VARCHAR(100) NOT NULL DEFAULT '#video',
  `num_likes` INT NULL,
  `num_comments` INT NULL,
  `videoscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idvideos`),
  UNIQUE INDEX `idvideos_UNIQUE` (`idvideos` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `idcomments` INT NOT NULL AUTO_INCREMENT,
  `videos_idvideos` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  `comment_content` LONGTEXT NULL,
  PRIMARY KEY (`idcomments`, `videos_idvideos`, `users_idusers`),
  INDEX `fk_comments_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  INDEX `fk_comments_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_comments_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `mydb`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_videos` (
  `users_idusers` INT NOT NULL,
  `videos_idvideos` INT NOT NULL,
  PRIMARY KEY (`users_idusers`, `videos_idvideos`),
  INDEX `fk_users_has_videos_videos1_idx` (`videos_idvideos` ASC) VISIBLE,
  INDEX `fk_users_has_videos_users_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_videos_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_videos_videos1`
    FOREIGN KEY (`videos_idvideos`)
    REFERENCES `mydb`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;