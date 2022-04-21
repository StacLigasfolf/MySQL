-- ===== ������������ ������� �� ���� �����������, ����������, �������������� =====

-- 1. � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������.
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users.
-- ����������� ����������.

truncate sample.users;
SELECT * FROM shop.users;
SELECT * FROM sample.users;

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- 2. �������� �������������, ������� ������� �������� name �������� ������� �� ������� products �
-- 	��������������� �������� �������� name �� ������� catalogs.

CREATE VIEW name_products_and_name_catalog (product_name, catalog_name)
	AS SELECT
	p.name AS product_name,
	c.name AS catalog_name
	FROM products p
	JOIN catalogs AS c ON p.catalog_id = c.id;

SELECT * FROM name_products_and_name_catalog;


-- ===== ������������ ������� �� ���� ��������� ��������� � �������, ��������" =====

-- 1. �������� �������� ������� hello(), ������� ����� ���������� �����������,
-- � ����������� �� �������� ������� �����. � 6:00 �� 12:00 ������� ������
-- ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������
-- ���������� ����� "������ ����", � 18:00 �� 00:00 � "������ �����",
-- � 00:00 �� 6:00 � "������ ����".

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
			RETURN "������ ����";
		WHEN time_now BETWEEN 12 AND 17 THEN
			RETURN "������ ����";
		WHEN time_now BETWEEN 18 AND 23 THEN
			RETURN "������ �����";
		WHEN time_now BETWEEN 0 AND 5 THEN
			RETURN "������ ����";
	END CASE;
END//
SELECT hello() as greeting, now() as time_now//