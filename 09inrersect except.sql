--Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
sehirleri gosteren sorguyu yaziniz
SELECT sehir AS isci_veya_sehir_ismi ,maas
FROM personel1 
WHERE maas >5000 
UNION
SELECT isim, maas AS isci_veya_sehir_ismi , maas
FROM personel1
WHERE maas > 4000
--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
bir tabloda gosteren sorgu yaziniz
SELECT sehir 
FROM personel1 
WHERE sehir='Istanbul'
UNION
SELECT isim, maas 
FROM personel1
WHERE isim = 'Mehmet Ozturk';
-Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan  sehirleri	gosteren sorguyu yaziniz
SELECT isim as isim_sehir FROM personel5 WHERE maas>4000
UNION
SELECT sehir FROM personel5 WHERE maas>5000
--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
SELECT isim as isim_sehir,maas FROM personel1 WHERE isim='Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel1 WHERE sehir='Istanbul'
Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
SELECT sehir AS isci_veya_sehir_ismi , maas 
FROM personel1
WHERE maas>4500 
UNION
SELECT isim AS isci_veya_sehir_ismi , maas 
FROM personel1
WHERE maas<6000;
CREATE TABLE personel6
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_mk PRIMARY KEY (id)
);
INSERT INTO personel6 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel6 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel6 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel6 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel6 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel6 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel6 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
CREATE TABLE personel_bilgi1  (
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_lk FOREIGN KEY (id) REFERENCES personel6(id)
);
INSERT INTO personel_bilgi1 VALUES(123456789, '5302345678', 5);
INSERT INTO personel_bilgi1 VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi1 VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi1 VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi1 VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi1 VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi1 VALUES(123456710, '5537488585', 1);
select * from personel_bilgi1


--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi 
tablosundan da tel ve cocuk sayisini yazdirin
SELECT id,sehir, maas 
FROM personel6 
WHERE id='123456789'
UNION
SELECT id,tel,cocuk_sayisi 
FROM personel_bilgi1 
WHERE id= '123456789'
--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini,
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
SELECT id,sehir as sehir_tel,maas as cocuk_sayisi_maas FROM personel7 WHERE id=123456789
UNION
SELECT id,tel,cocuk_sayisi FROM personel_bilgi2 WHERE id=123456789
-- Personel tablosundada maasi 5000’den az olan tum sehirleri ve maaslari bulunuz
select sehir, maas from personel6 where maas<5000
union
select sehir, maas from personel6 where maas<5000
select sehir, maas from personel6 where maas<5000
union all
select sehir, maas from personel6 where maas<5000
--1)Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin

--2)Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
SELECT sehir as sehir_isim,maas FROM personel6 WHERE maas>4000
UNION
SELECT isim,maas FROM personel6 WHERE maas<5000
--UNION ALL kullanımı
SELECT sehir as sehir_isim,maas FROM personel6 WHERE maas>4000
UNION ALL
SELECT isim,maas FROM personel6 WHERE maas<5000
--1)Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id
FROM personel6
WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id
FROM personel_bilgi1
WHERE cocuk_sayisi IN (2,3);
2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin

--1)Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini
listeleyin
SELECT id
FROM personel6
WHERE maas NOT BETWEEN 4800 AND 5500
INTERSECT
SELECT id
FROM personel_bilgi1
WHERE cocuk_sayisi IN (2,3)
--2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT isim
FROM personel6 
WHERE sirket='Honda'
INTERSECT
SELECT isim 
FROM personel6
WHERE sirket='Ford'
INTERSECT
SELECT isim 
FROM personel6
WHERE sirket='Tofas'
--5000’den az maas alip Honda’da calismayanlari yazdirin
SELECT isim,sirket 
FROM personel6 
WHERE maas<5000

EXCEPT
SELECT isim,sirket 
FROM personel6 
WHERE sirket='Honda'
--Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
SELECT isim,sehir
FROM personel6
WHERE isim='Mehmet Ozturk'
EXCEPT ALL
SELECT isim, sirket 
FROM personel6 
WHERE sehir='Istanbul'
select isim,sehir from personel6 where isim='Mehmet Ozturk'
intersect
select isim,sehir from personel6 where not sehir='Ankara'
CREATE TABLE sirketler (
sirket_id int,
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');
Select * from siparisler
Select * from sirketler
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id