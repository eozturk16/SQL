CREATE TABLE ogrenciler
(
id char(4),
isim_soyisim varchar(30),
not_ort real,
kayit_tarih date
);
CREATE TABLE ogrenci_ortalama
AS
SELECT isim_soyisim,not_ort
FROM ogrenciler;
SELECT * FROM ogrenciler
SELECT * FROM ogrenci_ortalama
SELECT kayit_tarih, not_ort  FROM ogrenciler