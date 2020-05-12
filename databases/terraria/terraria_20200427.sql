-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema terraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema terraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `terraria` DEFAULT CHARACTER SET utf8 ;
USE `terraria` ;

-- -----------------------------------------------------
-- Table `terraria`.`boss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`boss` (
  `id_boss` INT(255) NOT NULL,
  `damage` INT(255) NOT NULL,
  `level` INT(255) NOT NULL,
  `magic_trick` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `speed` INT(255) NOT NULL,
  UNIQUE INDEX `unique_id_boss` (`id_boss` ASC),
  PRIMARY KEY (`id_boss`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`player` (
  `id_user` INT(255) NOT NULL AUTO_INCREMENT,
  `login` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `date` DATE NOT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `status` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `about` CHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_ban` CHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  UNIQUE INDEX `id_user` (`id_user` ASC),
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`mode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`mode` (
  `id_mode` INT(255) NOT NULL AUTO_INCREMENT,
  `mode` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `unique_id_mode` (`id_mode` ASC),
  PRIMARY KEY (`id_mode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`world`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`world` (
  `id_world` INT(255) NOT NULL,
  `name` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `date_create` DATE NOT NULL,
  `size` CHAR(1) CHARACTER SET 'utf8' NOT NULL,
  `type_world` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `unique_id_world` (`id_world` ASC),
  PRIMARY KEY (`id_world`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`user_world`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`user_world` (
  `id_us_world` INT(255) NOT NULL,
  `id_user` INT(255) NOT NULL,
  `id_world` INT(255) NOT NULL,
  `id_mode` INT(255) NOT NULL,
  UNIQUE INDEX `unique_id_world` (`id_us_world` ASC),
  PRIMARY KEY (`id_us_world`),
  INDEX `fk_user_world_player_idx` (`id_user` ASC),
  INDEX `fk_user_world_mode1_idx` (`id_mode` ASC),
  INDEX `fk_user_world_world1_idx` (`id_world` ASC),
  CONSTRAINT `fk_user_world_player`
    FOREIGN KEY (`id_user`)
    REFERENCES `terraria`.`player` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_world_mode1`
    FOREIGN KEY (`id_mode`)
    REFERENCES `terraria`.`mode` (`id_mode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_world_world1`
    FOREIGN KEY (`id_world`)
    REFERENCES `terraria`.`world` (`id_world`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`weapon` (
  `id_weapon` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `damage` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `unique_id_weapon` (`id_weapon` ASC),
  PRIMARY KEY (`id_weapon`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`game_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`game_item` (
  `id_item` INT(255) NOT NULL,
  `about` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `bonus` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `name` CHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `sprite` CHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `id_weapon` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `unique_id_item` (`id_item` ASC),
  PRIMARY KEY (`id_item`),
  INDEX `fk_game_item_weapon1_idx` (`id_weapon` ASC),
  CONSTRAINT `fk_game_item_weapon1`
    FOREIGN KEY (`id_weapon`)
    REFERENCES `terraria`.`weapon` (`id_weapon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`action`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`action` (
  `id_action` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `action_date` DATE NOT NULL,
  `battle_result` BINARY(1) NOT NULL,
  `id_us_world` INT(255) NOT NULL,
  `id_boss` INT(255) NOT NULL,
  `id_item` INT(255) NOT NULL,
  UNIQUE INDEX `unique_id_action` (`id_action` ASC),
  PRIMARY KEY (`id_action`),
  INDEX `fk_action_boss1_idx` (`id_boss` ASC),
  INDEX `fk_action_user_world1_idx` (`id_us_world` ASC),
  INDEX `fk_action_game_item1_idx` (`id_item` ASC),
  CONSTRAINT `fk_action_boss1`
    FOREIGN KEY (`id_boss`)
    REFERENCES `terraria`.`boss` (`id_boss`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_user_world1`
    FOREIGN KEY (`id_us_world`)
    REFERENCES `terraria`.`user_world` (`id_us_world`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_game_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `terraria`.`game_item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`npc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`npc` (
  `id_npc` INT(255) NOT NULL,
  `about` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `type` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  UNIQUE INDEX `unique_id_npc` (`id_npc` ASC),
  PRIMARY KEY (`id_npc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`cooperation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`cooperation` (
  `id_cooperation` INT(255) NOT NULL,
  `id_us_world` INT(255) NOT NULL,
  `id_npc` INT(255) NOT NULL,
  `id_item` INT(255) NOT NULL,
  UNIQUE INDEX `unique_id_cooperation` (`id_cooperation` ASC),
  PRIMARY KEY (`id_cooperation`),
  INDEX `fk_cooperation_npc1_idx` (`id_npc` ASC),
  INDEX `fk_cooperation_user_world1_idx` (`id_us_world` ASC),
  INDEX `fk_cooperation_game_item1_idx` (`id_item` ASC),
  CONSTRAINT `fk_cooperation_npc1`
    FOREIGN KEY (`id_npc`)
    REFERENCES `terraria`.`npc` (`id_npc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cooperation_user_world1`
    FOREIGN KEY (`id_us_world`)
    REFERENCES `terraria`.`user_world` (`id_us_world`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cooperation_game_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `terraria`.`game_item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `terraria`.`user_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `terraria`.`user_item` (
  `id_user_item` INT(255) NOT NULL,
  `id_item` INT(255) NOT NULL,
  `date_item` DATE NOT NULL,
  `id_us_world` INT(255) NOT NULL,
  UNIQUE INDEX `unique_id_user_item` (`id_user_item` ASC),
  PRIMARY KEY (`id_user_item`),
  INDEX `fk_user_item_user_world1_idx` (`id_us_world` ASC),
  INDEX `fk_user_item_game_item1_idx` (`id_item` ASC),
  CONSTRAINT `fk_user_item_user_world1`
    FOREIGN KEY (`id_us_world`)
    REFERENCES `terraria`.`user_world` (`id_us_world`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_item_game_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `terraria`.`game_item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- action

-- Dump data of "action" ---------------------------------
INSERT INTO `action`(`id_action`,`action_date`,`battle_result`,`id_us_world`,`id_boss`,`id_item`) VALUES ( '1', '2018-04-02', '1', '1', '1', '1');
INSERT INTO `action`(`id_action`,`action_date`,`battle_result`,`id_us_world`,`id_boss`,`id_item`) VALUES ( '2', '2018-04-02', '0', '2', '8', '4');
INSERT INTO `action`(`id_action`,`action_date`,`battle_result`,`id_us_world`,`id_boss`,`id_item`) VALUES ( '3', '2018-04-03', '1', '1', '2', '7');
INSERT INTO `action`(`id_action`,`action_date`,`battle_result`,`id_us_world`,`id_boss`,`id_item`) VALUES ( '4', '2018-04-03', '0', '3', '5', '1');
INSERT INTO `action`(`id_action`,`action_date`,`battle_result`,`id_us_world`,`id_boss`,`id_item`) VALUES ( '5', '2018-04-04', '1', '3', '6', '2');
-- ---------------------------------------------------------

-- boss

-- Dump data of "boss" -------------------------------------
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '1', '4', '1', 'none', 'rabbit', '3');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '2', '5', '2', 'none', 'stelet', '2');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '3', '5', '3', 'none', 'Skeleton Archer', '2');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '4', '5', '2', 'none', 'Giant bat', '4' );
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '5', '2', '3', 'none', 'Undead Miner', '2');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '6', '2', '1', 'none', 'Cochineal Beetle', '2');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '7', '2', '1', 'none', 'Piranha', '2');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '8', '1', '3', 'none', 'Lost Girl', '3');
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '9', '20', '1', 'none', 'King Slime', '4' );
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '10', '30', '2', 'none', 'Eye of Cthulhu', '5' );
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '11', '30', '3', 'none', 'Eater of Worlds', '8' );
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '12', '40', '3', 'FireBoll', 'Brain of Cthulhu', '5' );
INSERT INTO `boss`(`id_boss`,`damage`,`level`,`magic_trick`,`name`,`speed`) VALUES ( '13', '50', '4', 'Hypnosis', 'Queen Bee', '10' );
-- ---------------------------------------------------------

-- game_item

-- Dump data of "game_item" --------------------------------
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '1',  'Основная валюта игры',                                                                                                                                                                       'null',            'Сoin',            '/pic/1.png',  'money',       'null' );
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '2',  'Аксессуар, добавленный в обновлении 1.3. ',                                                                                                                                                  'null',            'Metal Detector',  '/pic/2.png',  'accessories', 'null');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '3',  'Аксессуар, добавленный в обновлении 1.3. Можно купить у Странствующего Торговца. Отображает количество урона в секунду, наносимого вашим оружием. Работает, находясь в инвентаре.',          'null',            'DPS Meter',       '/pic/3.png',  'accessories', 'null');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '4',  'Аксессуар, добавленный в обновлении 1.3. Отображает вашу скорость передвижения под миникартой. Можно купить у Странствующего Торговца.',                                                     'null',            'Stopwatch',       '/pic/4.png',  'accessories', 'null');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '5',  'Его можно выбить во время кровавой луны с любого врага в режиме хардмода с шансом — 0,1 %. Действует как кулак Голема, но с меньшей скоростью атаки и длиной цепи',                          'Auto Attack',     'KO Cannon',       '/pic/5.png',  'weapon',      'Medusa Head');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '6',  'Меч, добавленный в версии 1.2.4. Является подвидом деревянного меча. По характеристикам равен мечу из махагони.',                                                                            'Damage X2',       'Palm Wood Sword', '/pic/6.png',  'weapon',      'Javelin');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '7',  'Cамый слабый лук, но самый лучший вариант для новичков, так как его можно сделать на верстаке из доступных материалов. Наносит больший урон, чем деревянный меч (если учесть со стрелами).', 'null',            'Wooden Bow',      '/pic/7.png',  'weapon',      'Pwnhammer');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '8',  'Взрывающееся метательное оружие, которое можно купить у подрывника или скелета-торговца, либо добыть из горшка, мёртвого шахтёра, статуи бомбы и сундука.',                                  'Boom!',           'Bomb',            '/pic/8.png',  'weapon',      'Bomb');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '9',  'Предмет еще не добавлен в игру',                                                                                                                                                             'null',            'Map',             '/pic/9.png',  'accessories', 'null');
INSERT INTO `game_item`(`id_item`,`about`,`bonus`,`name`,`sprite`,`type`,`id_weapon`) VALUES ( '10', 'Дает светло',                                                                                                                                                                                'Можно поставить', 'lamp',            '/pic/10.png', 'accessories', 'null');
-- ---------------------------------------------------------
-- ALTER TABLE game_item MODIFY type VARCHAR(255) NULL;

-- mode

-- Dump data of "mode" -------------------------------------
INSERT INTO `mode`(`id_mode`,`mode`) VALUES ( '1', 'Normal' );
INSERT INTO `mode`(`id_mode`,`mode`) VALUES ( '2', 'Hardmode' );
INSERT INTO `mode`(`id_mode`,`mode`) VALUES ( '3', 'Creative' );
-- ---------------------------------------------------------

-- npc

-- Dump data of "npc" --------------------------------------
INSERT INTO `npc`(`id_npc`,`about`, `name`,`type`) VALUES ( '1', 'Гид (Guide) — это самый первый НИП, которого встретит игрок после создания новой карты. ','Guide', 'human');
INSERT INTO `npc`(`id_npc`,`about`, `name`,`type`) VALUES ( '2', 'Гоблин-инженер (Goblin Tinkerer) — дружественный НИП, добавленный в версии 1.1. Он продаёт вам различные изобретения гоблинов.', 'Goblin Tinkerer', 'goblin');
INSERT INTO `npc`(`id_npc`,`about`, `name`,`type`) VALUES ( '3', 'Киборг (Cyborg) — НИП, добавленный в обновлении 1.2. Появляется, только если вы убили Плантеру. ', 'Cyborg', 'robot');
-- ---------------------------------------------------------

-- player

-- Dump data of "player" -----------------------------------
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '1', 'Govorov', '2018-09-20', 'abc', 'hardcore', 'Good guy', NULL );
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '2', 'neGovorov', '2018-09-18', 'trump!', 'normal', 'Dog', NULL );
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '3', 'valia', '2018-08-14', 'dell', 'normal', NULL, NULL );
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '4', 'conn', '2018-09-28', 'racoon', 'normal', NULL, NULL );
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '5', 'till', '2018-09-18', 'lindeman', 'normal', NULL, NULL );
INSERT INTO `player`(`id_user`,`login`,`date`,`password`,`status`,`about`,`date_ban`) VALUES ( '6', 'Red', '2018-04-14', 'bull', 'normal', NULL, NULL );
-- ---------------------------------------------------------

-- weapon

-- Dump data of "weapon" -------------------------------------
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'Flying Dragon', '90' );
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'Bomb', '100' );
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'Javelin', '8' );
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'Pwnhammer', '25' );
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'Medusa Head', '45' );
INSERT INTO `weapon`(`id_weapon`,`damage`) VALUES ( 'null', '0' );
-- ---------------------------------------------------------

-- user_item

-- Dump data of "user_item" --------------------------------
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '1', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '2', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '3', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '4', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '5', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '6', '1', '2018-04-02', '1');
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '7', '6', '2018-04-03', '1' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '8', '8', '2018-04-02', '1' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '9', '2', '2018-04-05', '1' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '10', '9', '2018-04-04', '1' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '11', '7', '2018-04-04', '2' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '12', '3', '2018-04-03', '2' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '13', '4', '2018-04-03', '2' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '14', '5', '2018-04-03', '2' );
INSERT INTO `user_item`(`id_user_item`,`id_item`,`date_item`, `id_us_world`) VALUES ( '15', '5', '2018-04-03', '2' );
-- ---------------------------------------------------------

-- cooperation

-- Dump data of "cooperation" ------------------------------
INSERT INTO `cooperation`(`id_cooperation`,`id_us_world`,`id_npc`,`id_item`) VALUES ( '1', '1', '1', '10');
INSERT INTO `cooperation`(`id_cooperation`,`id_us_world`,`id_npc`,`id_item`) VALUES ( '2', '2', '1', '1');
INSERT INTO `cooperation`(`id_cooperation`,`id_us_world`,`id_npc`,`id_item`) VALUES ( '3', '3', '2', '1');
INSERT INTO `cooperation`(`id_cooperation`,`id_us_world`,`id_npc`,`id_item`) VALUES ( '4', '4', '1', '3');
INSERT INTO `cooperation`(`id_cooperation`,`id_us_world`,`id_npc`,`id_item`) VALUES ( '5', '1', '3', '6');
-- ---------------------------------------------------------

-- user_world

-- Dump data of "user_world" -------------------------------
INSERT INTO `user_world`(`id_us_world`,`id_user`,`id_world`,`id_mode`) VALUES ( '1', '3', '3', '3');
INSERT INTO `user_world`(`id_us_world`,`id_user`,`id_world`,`id_mode`) VALUES ( '2', '2', '1', '2');
INSERT INTO `user_world`(`id_us_world`,`id_user`,`id_world`,`id_mode`) VALUES ( '3', '1', '3', '3');
INSERT INTO `user_world`(`id_us_world`,`id_user`,`id_world`,`id_mode`) VALUES ( '4', '2', '2', '1');
INSERT INTO `user_world`(`id_us_world`,`id_user`,`id_world`,`id_mode`) VALUES ( '5', '3', '3', '2');
-- ---------------------------------------------------------

-- world

-- Dump data of "world" ------------------------------------
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '1', 'Test0',  '2018-04-02', 'L', 'jungle' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '2', 'Test1',  '2018-04-02', 'S', 'jungle' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '3', 'Test2',  '2018-04-02', 'M', 'jungle' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '4', 'Test01', '2018-04-02', 'S', 'desert' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '5', 'Test02', '2018-04-02', 'M', 'desert' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '6', 'Test03', '2018-04-02', 'L', 'desert' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '7', 'Test11', '2018-04-02', 'S', 'tundra' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '8', 'Test12', '2018-04-02', 'M', 'tundra' );
INSERT INTO `world`(`id_world`,`name`,`date_create`,`size`,`type_world`) VALUES ( '9', 'Test13', '2018-04-02', 'L', 'tundra' );
-- ---------------------------------------------------------


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
