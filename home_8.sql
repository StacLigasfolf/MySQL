/*
1. осярэ гюдюм мейнрнпши онкэгнбюрекэ. хг бяеу дпсгеи щрнцн онкэгнбюрекъ мюидхре векнбейю, 
    йнрнпши анкэье бяеу наыюкяъ я мюьхл онкэгнбюрекел.
*/
 
USE vk;
 
SELECT
    from_user_id
    , COUNT(*) as send 
FROM messages 
WHERE to_user_id=1
GROUP BY from_user_id
ORDER BY send DESC;
 
-- оНКЭГНБЮРЕКЭ Я id=8 НРОПЮБХК АНКЭЬЕ БЯЕУ ЯННАЫЕМХИ ОНКЭГНБЮРЕКЧ Я id=1.
 
 
/*
2. ондявхрюрэ наыее йнкхвеярбн кюийнб, йнрнпше онксвхкх онкэгнбюрекх лкюдье 10 кер.
*/
 
SELECT COUNT(*) as 'Likes' FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 10;
 
 
/*
3. нопедекхрэ йрн анкэье онярюбхк кюийнб (бяецн): лсфвхмш хкх фемыхмш.
*/
 
SELECT gender, COUNT(*) as 'йНК-БН' FROM profiles GROUP BY gender;
 
-- х ЕЫЕ БЮПХЮМР ХГ БЕАХМЮПЮ:
    
SELECT 
    CASE(gender)
        WHEN 'm' THEN 'ЛСФЯЙНИ'
        WHEN 'f' THEN 'ФЕМЯЙХИ'
        ELSE 'МЕР'
    END as gender
    , COUNT(*) as 'йНК-БН:' FROM profiles GROUP BY gender;