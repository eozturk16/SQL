-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz                                       
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
 URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
 MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız
	-MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  -- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id,musteri_isim FROM mart
WHERE exists (Select urun_id from nisan WHERE mart.urun_id=nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız
SELECT urun_isim,musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)
CREATE TABLE tedarikciler4 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler4 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler4 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler4 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler4 VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler4(vergi_no)
on delete cascade
);

INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');












select *from tedarikciler4

select *from urunler1

update tedarikciler4
set firma_ismi='Vestel' where vergi_no=102
select *from tedarikciler4
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler4
set firma_ismi='Casper', irtibat_ismi= 'Ali Veli' where vergi_no=101
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler1
set urun_isim='Telefon'
where urun_isim='Phone'
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

-- urunler tablosundaki tüm ürün isim'lerini, müşteri isimleri ile birleştirerek update edelim
UPDATE urunler1
SET urun_isim = CONCAT(urun_isim,'-',musteri_isim)
select * from urunler1
UPDATE urunler1
SET urun_isim = urun_isim || '-' || musteri_isim
urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), adres varchar(50)
);
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar where isim is Null

select * from insanlar where isim is not Null

drop table mart
select * from mart












-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler1						
SET urun_isim= (SELECT firma_ismi from tedarikciler4 WHERE irtibat_ismi = 'Adam Eve') --> Apple						
WHERE musteri_isim = 'Ali Bak'
select * from urunler1
--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler1					
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler4 WHERE firma_ismi = 'Apple')						
WHERE urun_isim = 'Laptop'

select * from mart
truncate table mart

CREATE TABLE calisanlar5 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );
INSERT INTO calisanlar5 VALUES(123456789, 'Ali Can','Istanbul'); 
INSERT INTO calisanlar5 VALUES(234567890, 'Veli Dem','Ankara'); 
INSERT INTO calisanlar5 VALUES(345678901,'Mine Bulut','Izmir');
select * from calisanlar5
SELECT calisan_id AS id, calisan_isim AS isim, calisan_dogdugu_sehir AS dogum_yeri 
FROM calisanlar5
SELECT calisan_id AS id, calisan_isim || calisan_dogdugu_sehir AS isim_ve_dogum_yeri
FROM calisanlar5;
