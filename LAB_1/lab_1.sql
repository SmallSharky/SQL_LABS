DROP DATABASE IF EXISTS lab_1;
CREATE DATABASE lab_1;
USE lab_1;
CREATE TABLE `desc` ( `id` INT(15) NOT NULL AUTO_INCREMENT, `r_type` VARCHAR(50), `name` VARCHAR(50), PRIMARY KEY(`id`) );

CREATE TABLE `point` ( `p_id` INT(15) NOT NULL AUTO_INCREMENT, `x` INT NOT NULL, `y` INT NOT NULL, PRIMARY KEY(`p_id`));

CREATE TABLE `prof` ( `id` INT(15) NOT NULL, `p_id` INT(15) NOT NULL, `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO `desc` (`id`, `name`, `r_type`) VALUES
('1', 'name_1', 'normal'),
('2', 'name_2', 'good'),
('3', 'name_3', 'normal'),
('4', 'name_4', 'bad'),
('5', 'name_5', 'normal'),
('6', 'name_6', 'neutral');


SELECT * FROM `desc`;
DROP DATABASE IF EXISTS lab_1;
CREATE DATABASE lab_1;
USE lab_1;
CREATE TABLE `desc` ( `id` INT(15) NOT NULL AUTO_INCREMENT, `r_type` VARCHAR(50), `name` VARCHAR(50), PRIMARY KEY(`id`) );

CREATE TABLE `point` ( `p_id` INT(15) NOT NULL AUTO_INCREMENT, `x` INT NOT NULL, `y` INT NOT NULL, PRIMARY KEY(`p_id`));

CREATE TABLE `prof` ( `id` INT(15) NOT NULL, `p_id` INT(15) NOT NULL, `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO `desc` (`id`, `name`, `r_type`) VALUES
('1', 'name_1', 'normal'),
('2', 'name_2', 'good'),
('3', 'name_3', 'normal'),
('4', 'name_4', 'bad'),
('5', 'name_5', 'normal'),
('6', 'name_6', 'neutral');

SELECT * FROM `desc`;
INSERT INTO 'point' ('p_id', 'x', 'y') VALUES
('1', '5', '2')
('2', '8', '12')
('3', '15', '17')
('4', '14', '10')
('5', '4', '17')
('6', '1', '4')
SELECT * FROM `point`;
INSERT INTO 'prof' ('id', 'p_id', 'date') VALUES
('1', '5', '05.04.2017')
('2', '8', '12.05.2017')
('3', '15', '15.07.2018')
('4', '14', '10.08.2030')
('5', '4', '17.10.1984')
('6', '1', '18.06.1998')
SELECT * FROM `prof`;
-- Продолжать здесь
