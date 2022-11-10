SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id
--LEFT JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id
SELECT * from sirketler
SELECT * from siparisler
--RIGHT JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id
--FULL JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id
CREATE TABLE personel7 (
id int,
isim varchar(20),
title varchar(60), yonetici_id int
);

INSERT INTO personel7 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel7 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel7 VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel7 VALUES(4, 'Fatma Can', 'CEO', 5);
select * from personel7
SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel7 p1 INNER JOIN personel7 p2
ON p1.yonetici_id = p2.id
CREATE TABLE musteriler1 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
select * from musteriler1
--Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE 'A%'
-- A harfi biten tum musteri bilgilerini
SELECT *
FROM musteriler1
WHERE isim LIKE '%a'
--ILIKE buyuk kucuk harf fark etmez
SELECT *
FROM musteriler1
WHERE isim ILIKE '%A'
SELECT * FROM musteriler1 WHERE isim ~~ 'A%';
-- Like kullanımında sembol kullanıyorsak ve büyük küçük harf gözetmeksizin sorgu yapmak istersek ~~* sembollerini kullanabiliriz
SELECT * FROM musteriler1 WHERE isim ~~* 'a%';
--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir 
FROM musteriler1 
WHERE isim LIKE '%e'
SELECT isim,gelir 
FROM musteriler1 
WHERE isim ILIKE '%e'
--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir 
FROM musteriler1
WHERE isim LIKE '%er%';
--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  '_atma'
--SORU : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  '_a%'
--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  '__s%'
--SORU : Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  '__s_'
--SORU : Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  'F___%'
--SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * from musteriler1 where isim IlIKE  '_a_m%'
CREATE TABLE kelimeler (
id int UNIQUE,
kelime varchar(50) NOT NULL, Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ 'h[ai]t'


--lk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini 
yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ 'h[a-k]t';
--222SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '[mi]';
--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '^[as]'
--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
2
--Regexp-Like kullanımında başlangıç belirtmek için ^ sembol kullanılır
--Regexp-Like kullanımında sonuç belirtmek için $ sembol kullanılır
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime not like 'h%';
--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime NOT LIKE '%a%'
--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime !~~ '_de%'
SELECT *
FROM kelimeler
WHERE kelime !~ '[_eio]';
SELECT UPPER (kelime) as kelime
FROM kelimeler
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma')
--urun isimlerini distinct gruplama
SELECT DISTINCT urun_isim 
FROM musteri_urun;
SELECT DISTINCT musteri_isim 
FROM musteri_urun
--kac farki urun oldugunu gosterir
SELECT COUNT(DISTINCT urun_isim) AS urun_cesit_sayisi 
FROM musteri_urun