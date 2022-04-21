-- ===== Практическое задание по теме “Транзакции, переменные, представления” =====

-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

truncate sample.users;
SELECT * FROM shop.users;
SELECT * FROM sample.users;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и
-- 	соответствующее название каталога name из таблицы catalogs.

CREATE VIEW name_products_and_name_catalog (product_name, catalog_name)
	AS SELECT
	p.name AS product_name,
	c.name AS catalog_name
	FROM products p
	JOIN catalogs AS c ON p.catalog_id = c.id;

SELECT * FROM name_products_and_name_catalog;


-- ===== Практическое задание по теме “Хранимые процедуры и функции, триггеры" =====

-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие,
-- в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
-- возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна
-- возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер",
-- с 00:00 до 6:00 — "Доброй ночи".

SELECT HOUR(now());

DELIMITER //
DROP FUNCTION IF EXISTS shop.hello;
CREATE FUNCTION shop.hello ()
RETURNS TINYTEXT DETERMINISTIC
BEGIN
	DECLARE time_now INT;
	SET time_now = HOUR(NOW());
	CASE
		WHEN time_now BETWEEN 6 AND 11 THEN
			RETURN "Доброе утро";
		WHEN time_now BETWEEN 12 AND 17 THEN
			RETURN "Добрый день";
		WHEN time_now BETWEEN 18 AND 23 THEN
			RETURN "Добрый вечер";
		WHEN time_now BETWEEN 0 AND 5 THEN
			RETURN "Доброй ночи";
	END CASE;
END//
SELECT hello() as greeting, now() as time_now//