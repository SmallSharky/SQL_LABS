DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;
USE lab1;
CREATE TABLE `desc` ( `id` INT(15) NOT NULL AUTO_INCREMENT, `r_type` VARCHAR(50), `name` VARCHAR(50), PRIMARY KEY(`id`) );

CREATE TABLE `point` ( `p_id` INT(15) NOT NULL AUTO_INCREMENT, `x` INT NOT NULL, `y` INT NOT NULL, PRIMARY KEY(`p_id`) );

CREATE TABLE `prof` ( `id` INT(15) NOT NULL, `p_id` INT(15) NOT NULL, `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE `ret` (`id` INT(15) NOT NULL, `name` VARCHAR(50), `a` INT NULL, PRIMARY KEY(`id`) );


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
  
DELIMITER //--Разделитель. Окончание операции.
CREATE PROCEDURE `p2` ()--Создание процедуры.
LANGUAGE SQL --Язык: "SQL"
READS SQL DATA --Программа содержит инструкции, которые читают данные.
MODIFIES SQL DATA -- подпрограмма содержит инструкции, которые могут записывать данные.
SQL SECURITY DEFINER -- Характеристика SQL SECURITY может использоваться, чтобы определить, должна ли подпрограмма быть выполнена
BEGIN
	DELETE FROM ret; -- Удалить данные из временной таблицы 'ret'.
	INSERT INTO ret (`id`) -- Добавить во временную таблицу номаера id.
       		SELECT id FROM `desc`; -- Выдать значения 'id' из таблицы 'desc.
	DECLARE cursor CURSOR FOR SELECT id FROM `ret`; --Объявление курсора.
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @ex=1;     --SET Используется для задания значения.
	SET @ex=0; -- Объявление счетчика ex типа int.
	OPEN cursor; --Начало работы курсора.                                 
		WHILE @ex=0 DO -- Начало работы цикла.
			SET @n=0; -- n - количество точек.
			SET @average=NULL; -- Average - Среднее арифметическое.
			FETCH cursor INTO @d_id; --FETCH Сдвигает курсор в массиве.
			IF @ex=0 THEN
				
				DECLARE cur_2 CURSOR FOR SELECT p_id FROM `prof` WHERE id=d_id AND date>SUBDATE(CURRENT_TIMESTAMP, Interval '1' MONTH);
				-- Объявляется курсор для передвижения по ячейкам таблицы 'prof', где id = p_id. Интервал 1 месяц.

				DECLARE CONTINUE HANDLER FOR NOT FOUND SET @ex_2=1;
				SET @ex_2=0;--Объявление переменной типа ex_2 = 0.
				WHILE @ex_2=0 DO -- Цикл для нахждения среднего арифметического.
					FETCH cur_2 INTO @x_val;--Сдвигает курсор cur_2 в x_val.
					IF @ex_2=0 THEN-- Если ex_2 = 0, то 
						IF @average=NULL THEN-- Если среднее значение = NULL.
							SET @average=0; -- Среднее значение = нулю.
						END IF;

						SET @average=@average+@x_val;-- Среднее значение = СР.ЗН + x_val.
						SET @n=@n+1;-- Прибавляется значение n.
					END IF;  --Закончить оператор IF.
	
				END WHILE; -- Закончить цикл WHILE.
				CLOSE cur_2; -- Удалить cur_2.
				SELECT name INTO @d_name FROM `desc` WHERE id=@d_id;-- Выбрать d_name из таблицы 'desc', где id=d_id
				UPDATE `ret` SET name=@d_name, a=@average WHERE id=@d_id; --Оператор UPDATE обновляет 
				-- таблицу 'ret'. 
			END IF;
		END WHILE;
	CLOSE cursor;                                 
	
	
	
	
	SELECT * FROM `ret`;
END//  

DELIMITER ;

CALL p2();







