CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
SELECT * from insanlar2 order by adres
SELECT * from insanlar2 where isim='Mine'order by ssn
SELECT * from insanlar2 where soyisim='Bulut'order by 2
SELECT * from insanlar2 where soyisim='Bulut'order by 2
SELECT * from insanlar2 order by ssn DESC
SELECT * from insanlar2 order by isim ASC
SELECT * from insanlar2 order by isim ASC,soyisim DESC
SELECT * from insanlar2 order by isim ASC,soyisim DESC
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim
FROM insanlar2
ORDER BY LENGTH (isim)
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT (isim, '' , soyisim) AS isim_soyisim
FROM insanlar2
ORDER BY LENGTH(isim)+LENGTH(soyisim);
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar2
ORDER BY LENGTH(isim||soyisim)
CREATE TABLE manav
(
isim varchar(50), Urun_adi varchar(50), Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
SELECT *from manav
SELECT isim, sum(Urun_miktar) FROM manav
GROUP BY isim
ORDER BY isim
SELECT urun_adi, COUNT(isim) AS Urunu_Alan_Kisi_Sayisi 
FROM manav
GROUP BY urun_adi
--3) Alinan kilo miktarina gore musteri sayisi
SELECT urun_miktar, COUNT(isim) AS Urun_Miktarini_Alan_Kisi_Sayisi
FROM manav
GROUP BY urun_miktar;
--Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi, COUNT(isim) AS Urunu_Alan_Kisi_Sayisi 
FROM manav
GROUP BY urun_adi
CREATE TABLE personel1
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel1
--Isme gore toplam maaslari bulun
SELECT isim, SUM(maas) AS toplam_maas 
FROM personel1
GROUP BY isim;
--sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) AS calisan_sayisi 
FROM personel1
GROUP BY sehir
--  Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(*) AS calisan_sayisi 
FROM personel1
where maas>5000
GROUP BY sirket
SELECT sirket, COUNT(isim) AS calisan_sayisi 
FROM personel1
where maas>5000
GROUP BY sirket
--sirket ismine gore toplam personel sayisi
SELECT sirket, COUNT(isim) AS calisan_sayisi 
FROM personel1
GROUP BY sirket
--Her sirket icin Min ve Max maasi bulun
SELECT sirket, MIN (maas) AS en_az_maas, MAX (maas) AS en_fazla_maas 
FROM personel1
GROUP BY sirket;
--Her sirketin MIN maaslarini eger 2000’den buyukse goster
SELECT sirket, MIN (maas) AS en_az_maas
FROM personel1 
GROUP BY sirket
HAVING MIN (maas) >3500
--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi 
ve toplam maasi gosteren sorgu yaziniz
SELECT isim, SUM (maas) AS toplam_maas 
FROM personel1
GROUP BY isim
HAVING SUM (maas) >10000;
--Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir, COUNT (isim) AS toplam_personel_sayisi 
FROM personel1
GROUP BY sehir
HAVING COUNT (isim) >1