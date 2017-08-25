DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;
USE lab1;
CREATE TABLE `desc` ( `id` INT(15) NOT NULL AUTO_INCREMENT, `r_type` VARCHAR(50), `name` VARCHAR(50), PRIMARY KEY(`id`) );

CREATE TABLE `point` ( `p_id` INT(15) NOT NULL AUTO_INCREMENT, `x` INT NOT NULL, `y` INT NOT NULL, PRIMARY KEY(`p_id`) );

CREATE TABLE `prof` ( `id` INT(15) NOT NULL, `p_id` INT(15) NOT NULL, `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


-- Создаем дескрипторы
INSERT INTO `desc` (`id`, `name`, `r_type`) VALUES
('1', 'name_1', 'normal'),
('2', 'name_2', 'good'),
('3', 'name_3', 'normal'),
('4', 'name_4', 'bad'),
('5', 'name_5', 'normal'),
('6', 'name_6', 'neutral');


SELECT * FROM `desc`;

-- Создаем точки
INSERT INTO `point` (`p_id`, `x`, `y`) VALUES
('1', '5', '2'),
('2', '8', '12'),
('3', '15', '17'),
('4', '14', '10'),
('5', '4', '17'),
('6', '1', '4');
SELECT * FROM `point`;


-- Создаем связи
INSERT INTO `prof` (`id`, `p_id`, `date`) VALUES
('3', '6', '2012-07-01 00:00:00'),
('3', '2', '2017-06-05 00:00:00'),
('3', '1', '2017-08-17 00:00:00'),
('1', '3', '2016-12-03 00:00:00'),
('6', '4', '2017-08-20 00:00:00'),
('2', '1', '2017-08-08 00:00:00');
SELECT * FROM `prof`;


-- Наша функция

CREATE PROCEDURE `lab_1_f` (OUT name INT)
BEGIN
       SELECT id INTO @id FROM desc WHERE date>SUBDATE(CURRENT_TIMESTAMP, Interval '1' MONTH);
SET name = @id;
END;

CALL lab_1_f(@ret);
SELECT @ret;





