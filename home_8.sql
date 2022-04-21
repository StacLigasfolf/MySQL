/*
1. ����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, 
    ������� ������ ���� ������� � ����� �������������.
*/
 
USE vk;
 
SELECT
    from_user_id
    , COUNT(*) as send 
FROM messages 
WHERE to_user_id=1
GROUP BY from_user_id
ORDER BY send DESC;
 
-- ������������ � id=8 �������� ������ ���� ��������� ������������ � id=1.
 
 
/*
2. ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.
*/
 
SELECT COUNT(*) as 'Likes' FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 10;
 
 
/*
3. ���������� ��� ������ �������� ������ (�����): ������� ��� �������.
*/
 
SELECT gender, COUNT(*) as '���-��' FROM profiles GROUP BY gender;
 
-- � ��� ������� �� ��������:
    
SELECT 
    CASE(gender)
        WHEN 'm' THEN '�������'
        WHEN 'f' THEN '�������'
        ELSE '���'
    END as gender
    , COUNT(*) as '���-��:' FROM profiles GROUP BY gender;