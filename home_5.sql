use vk;

-- Задание 1
UPDATE users
	SET created_at = NOW() AND updated_at = NOW()
;


-- задание 2
ALTER TABLE users MODIFY COLUMN created_at varchar(150); # преобразуем колонку в VARCHAR
ALTER TABLE users MODIFY COLUMN updated_at varchar(150); # преобразуем колонку в VARCHAR

ALTER TABLE users
  MODIFY COLUMN created_at DATETIME,
  MODIFY COLUMN updated_at DATETIME
;
UPDATE users
  SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i:%s'),
  updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i:%s')
;
-- задание 3
SELECT * FROM storehouses_products;

INSERT INTO storehouses_products
	(storehouse_id, product_id, value, created_at, updated_at) VALUES
	(1, 1, 2, now(), now()),
	(2, 2, 1, now(), now()),
	(3, 3, 5, now(), now()),
	(4, 4, 0, now(), now()),
	(5, 5, 4, now(), now()),
	(6, 6, 3, now(), now())
;

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN 9999999999999999999999 ELSE value END;




