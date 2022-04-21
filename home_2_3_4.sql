use vk;

-- 2 задание
select distinct firstname from users order by firstname ;

-- 3 задание
-- Добавим колонку is_active с дефолтным значением false (0)
ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL;

-- Проставим в колонке is_active значение true (1) пользователям < 18 лет.
UPDATE profiles
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18
;

-- задание 4
--  Поставим сообщению с id 4 дату из будущего
UPDATE messages
	SET created_at='2222-11-24 04:06:29'
	WHERE id = 4;

-- Удалим сообщение из будущего
DELETE FROM messages
WHERE created_at > now()
;
