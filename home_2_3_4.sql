use vk;

-- 2 �������
select distinct firstname from users order by firstname ;

-- 3 �������
-- ������� ������� is_active � ��������� ��������� false (0)
ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL;

-- ��������� � ������� is_active �������� true (1) ������������� < 18 ���.
UPDATE profiles
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18
;

-- ������� 4
--  �������� ��������� � id 4 ���� �� ��������
UPDATE messages
	SET created_at='2222-11-24 04:06:29'
	WHERE id = 4;

-- ������ ��������� �� ��������
DELETE FROM messages
WHERE created_at > now()
;
