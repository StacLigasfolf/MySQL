USE shop;

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
  append_dt DATETIME DEFAULT CURRENT_TIMESTAMP,
  append_tn VARCHAR (255),
  pk_id INT UNSIGNED NOT NULL,
  append_name VARCHAR (255)
  ) ENGINE ARCHIVE;

DROP PROCEDURE IF EXISTS append_logs;
delimiter //
CREATE PROCEDURE append_logs (
  tn VARCHAR (255),
  id INT,
  an VARCHAR (255)
)
BEGIN
	INSERT INTO logs (append_tn, pk_id, append_name) VALUES (tn, id, an);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_appending_from_catalogs;
delimiter $$
CREATE TRIGGER log_appending_from_catalogs
AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	CALL append_logs('catalogs', NEW.id, NEW.name);
END $$
delimiter ;

DROP TRIGGER IF EXISTS log_appending_from_users;
delimiter //
SELECT * FROM products;
INSERT INTO products (name, description, price, catalog_id) VALUES ('AMD Sempron 2650 OEM',
  'Ïðîöåññîð íà ñîêåòå ÀÌ1 è àðõèòåêòóðîé Jaguar', 999, 1);
DESC products ;
CREATE TRIGGER log_appending_from_users
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	CALL append_logs('users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_appending_from_products;
delimiter //
CREATE TRIGGER log_appending_from_products
AFTER INSERT ON products
FOR EACH ROW
BEGIN
	CALL append_logs('products', NEW.id, NEW.name);
END //
delimiter ;
