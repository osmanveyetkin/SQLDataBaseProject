-- Kırklareli Üniversitesi MYO ve Bölümler İlişkisel Veritabanı Projesi

--Projede Kırklaleri Üniversitesinin Meslek Yüksek Okullarını ve 
--bu meslek yüksek okullarındaki bölümlerini ilişkisel bir veritabanında 
--tutmayı hedefledim.

--İlk olarak Kampüs tablsunu oluşturup Meslek Yüksek okulu tablosunu 
--bu tabloya bağlayacağız.
--Sorgular *S1,*S2, *S3....,Sn şeklinde belirtilerek istenen sayıda sorgu yazıldığı 
--belirtilmesi hedeflenmiştir

-- *S1
CREATE TABLE KAMPUS (
	KAMPUS_ID SERIAL PRIMARY KEY,
	KAMPUS_ADI VARCHAR(100) NOT NULL,
	ADRES TEXT,
	TELEFON VARCHAR(20)
);

--Meslek Yüksek Okulu Tablosu; *S2
CREATE TABLE MESLEKYUKSEKOKULU (
	MYO_ID SERIAL PRIMARY KEY,
	MYO_ADI VARCHAR(100) NOT NULL,
	KAMPUS_ID INT,
	FOREIGN KEY (KAMPUS_ID) REFERENCES KAMPUS (KAMPUS_ID) ON DELETE CASCADE
);

--Bölümlerin yer alacağı tablo; *S3
CREATE TABLE BOLUM (
	BOLUM_ID SERIAL PRIMARY KEY,
	BOLUM_ADI VARCHAR(100) NOT NULL,
	MYO_ID INT,
	FOREIGN KEY (MYO_ID) REFERENCES MESLEKYUKSEKOKULU (MYO_ID) ON DELETE CASCADE
);

-- Kampüslere bilgi ekleme aşaması; *S4
INSERT INTO
	KAMPUS (KAMPUS_ADI, ADRES, TELEFON)
VALUES
	(
		'Kayalı Kampüsü',
		'Kırklareli, Kayalı Köyü',
		'0288-123-4567'
	),
	(
		'Merkez Kampüsü',
		'Kırklareli, Merkez',
		'0288-765-4321'
	);

--Meslek Yüksek Okullarının eklenmesi aşaması; *S5
INSERT INTO
	MESLEKYUKSEKOKULU (MYO_ADI, KAMPUS_ID)
VALUES
	('Teknik Bilimler Meslek Yüksekokulu', 1),
	('Sosyal Bilimler Meslek Yüksekokulu', 1),
	('Sağlık Hizmetleri Meslek Yüksekokulu', 1),
	('Lüleburgaz Meslek Yüksekokulu', 2),
	('Babaeski Meslek Yüksekokulu', 2),
	('Pınarhisar Meslek Yüksekokulu', 2),
	('Vize Meslek Yüksekokulu', 2);

--Bölüm tablosuna bölümlerin eklenmesi; 
-- Teknik Bilimler Meslek Yüksekokulu (myo_id = 1); *S6
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Bilgisayar Programcılığı', 1),
	('Elektrik', 1),
	('Elektronik Teknolojisi', 1),
	('Gıda Teknolojisi', 1),
	('İç Mekan Tasarımı', 1),
	('İnşaat Teknolojisi', 1),
	('Makine', 1),
	('Mekatronik', 1),
	('Moda Tasarımı', 1);

-- Sosyal Bilimler Meslek Yüksekokulu (myo_id = 2); *S7
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Basım ve Yayım Teknolojileri', 2),
	('Dış Ticaret', 2),
	('İşletme Yönetimi', 2),
	('Lojistik', 2),
	('Maliye', 2),
	('Muhasebe ve Vergi Uygulamaları', 2),
	('Radyo ve Televizyon Programcılığı', 2),
	('Sivil Havacılık Kabin Hizmetleri', 2);

-- Sağlık Hizmetleri Meslek Yüksekokulu (myo_id = 3); *S8
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Çocuk Gelişimi', 3),
	('Optisyenlik', 3),
	('Sağlık Kurumları İşletmeciliği', 3),
	('Tıbbi Dokümantasyon ve Sekreterlik', 3),
	('Tıbbi Laboratuvar Teknikleri', 3),
	('Tıbbi Tanıtım ve Pazarlama', 3),
	('Yaşlı Bakımı', 3);

-- Lüleburgaz Meslek Yüksekokulu (myo_id = 4); *S9
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Bilgisayar Programcılığı', 4),
	('Bilgisayar Programcılığı (Uzaktan Öğretim)', 4),
	('Büro Yönetimi ve Yönetici Asistanlığı', 4),
	('Elektrik', 4),
	('Grafik Tasarımı', 4),
	('İnsan Kaynakları Yönetimi', 4),
	('İş Sağlığı ve Güvenliği', 4),
	('Kimya Teknolojisi', 4),
	('Muhasebe ve Vergi Uygulamaları', 4),
	('Otomotiv Teknolojisi', 4),
	('Pazarlama', 4),
	('Sosyal Güvenlik', 4),
	('Tekstil Teknolojisi', 4);

-- Babaeski Meslek Yüksekokulu (myo_id = 5); *S10
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Bankacılık ve Sigortacılık', 5),
	('Büro Yönetimi ve Yönetici Asistanlığı', 5),
	('Çağrı Merkezi Hizmetleri', 5),
	('Dış Ticaret', 5);

-- Pınarhisar Meslek Yüksekokulu (myo_id = 6); *S11
INSERT INTO
	BOLUM (BOLUM_ADI, MYO_ID)
VALUES
	('Aşçılık', 6),
	('Bilgi Yönetimi', 6),
	('Bilgisayar Programcılığı', 6),
	('Halkla İlişkiler ve Tanıtım', 6),
	('Kontrol ve Otomasyon Teknolojisi', 6),
	('Medya ve İletişim', 6),
	('Turizm ve Otel İşletmeciliği', 6);

--Bu doğrultuda  toplamda üç tablo oluşturulmuştur. Kampüs tablosunda 
--yüksekokulun hangi kampüse bağlı olduğu belirlenmesi adına ID 
--verilmiştir.
--Bu ıd ler daha sonra ayrıca bölüm tablosundada kullanılarak ilişki
--oluşumu sağlanmıştır.
--Bölüm tablosunda normal şartlarda yalnızca kampüsün ve 
--meslek yüksek okulu adının ıd bilgisi yazarkan aşağıdaki sorgu 
--ile bu tabloları birleştirip tüm bilgileri görebiliriz. 
--*S12
SELECT
	B.BOLUM_ADI,
	M.MYO_ADI
FROM
	BOLUM B
	INNER JOIN MESLEKYUKSEKOKULU M ON B.MYO_ID = M.MYO_ID;

-- bu sorgu sayesinde myo ismi ve bölüm adı birleştirilerek okuma 
--sağlanmıştır.

-- Diğer bir sorgu içinde dilersek yüksekokulun bağlı olduğu 
--kampüsün adı bölüm adı ve meslek yüksek okulu adını bağlayarak 
--oluşturalım; *S13
SELECT
	B.BOLUM_ADI,
	M.MYO_ADI,
	K.KAMPUS_ADI
FROM
	BOLUM B
	INNER JOIN MESLEKYUKSEKOKULU M ON B.MYO_ID = M.MYO_ID
	INNER JOIN KAMPUS K ON M.KAMPUS_ID = K.KAMPUS_ID;

-- Tüm tabloların normal çağırımı *S14,*S15,*S16
SELECT * FROM BOLUM

SELECT * FROM KAMPUS

SELECT * FROM MESLEKYUKSEKOKULU

-- Yalnızca Belirli MYO 'ya ait bölümleri çağıran sorgu *S17
SELECT
	B.BOLUM_ADI
FROM
	BOLUM B
	INNER JOIN MESLEKYUKSEKOKULU M ON B.MYO_ID = M.MYO_ID
WHERE
	M.MYO_ADI = 'Teknik Bilimler Meslek Yüksekokulu';

--MYO'lardaki bölüm sayısını çağıran sorgu *S18
SELECT
	M.MYO_ADI,
	COUNT(B.BOLUM_ID) AS BOLUM_SAYISI
FROM
	MESLEKYUKSEKOKULU M
	LEFT JOIN BOLUM B ON M.MYO_ID = B.MYO_ID
GROUP BY
	M.MYO_ADI
HAVING
	COUNT(B.BOLUM_ID) > 0;

-- Kampüslerde bulunan toplam MYO sayısını çağıran sorgu: *S19
SELECT K.KAMPUS_ADI, COUNT(M.MYO_ID) AS MYO_SAYISI
FROM KAMPUS K
LEFT JOIN MESLEKYUKSEKOKULU M ON K.KAMPUS_ID = M.KAMPUS_ID
GROUP BY K.KAMPUS_ADI;

-- En fazla bölüme sahip MYO’yu getiren sorgu: *S20
SELECT M.MYO_ADI, COUNT(B.BOLUM_ID) AS BOLUM_SAYISI
FROM MESLEKYUKSEKOKULU M
LEFT JOIN BOLUM B ON M.MYO_ID = B.MYO_ID
GROUP BY M.MYO_ADI
ORDER BY BOLUM_SAYISI DESC
LIMIT 1;

-- Kampüslerdeki MYO ve bölüm sayısını getiren sorgu: *S21
SELECT K.KAMPUS_ADI, M.MYO_ADI, COUNT(B.BOLUM_ID) AS BOLUM_SAYISI
FROM KAMPUS K
LEFT JOIN MESLEKYUKSEKOKULU M ON K.KAMPUS_ID = M.KAMPUS_ID
LEFT JOIN BOLUM B ON M.MYO_ID = B.MYO_ID
GROUP BY K.KAMPUS_ADI, M.MYO_ADI;

-- Bölüm sayısı 5 ten fazla olan MYO ları çağıran sorgu: *S22
SELECT MYO_ADI
FROM MESLEKYUKSEKOKULU
WHERE MYO_ID IN (
    SELECT MYO_ID
    FROM BOLUM
    GROUP BY MYO_ID
    HAVING COUNT(BOLUM_ID) > 5
);


-- Yalnızca bir kampüsteki MYO'larıN Bölümlerini listeleyen sorgu: *S23
SELECT B.BOLUM_ADI
FROM BOLUM B
WHERE B.MYO_ID IN (
    SELECT MYO_ID
    FROM MESLEKYUKSEKOKULU
    WHERE KAMPUS_ID = (
        SELECT KAMPUS_ID FROM KAMPUS WHERE KAMPUS_ADI = 'Kayalı Kampüsü'
    )
);

-- Adından belli bir karakter "Bilgisayar" geçen bölümleri çağıran sorgu: *S24
SELECT BOLUM_ADI FROM BOLUM
WHERE BOLUM_ADI LIKE '%Bilgisayar%';

--Yukarıdaki sorguya ek olarak MYO bilgisininde dahil edilidği sorgu: *S25
SELECT B.BOLUM_ADI, M.MYO_ADI
FROM BOLUM B
INNER JOIN MESLEKYUKSEKOKULU M ON B.MYO_ID = M.MYO_ID
WHERE B.BOLUM_ADI LIKE '%Bilgisayar%';


--Kampsülerdeki En fazla bölüme sahip MYO yu bulan sorgu: *S26
SELECT K.KAMPUS_ADI, M.MYO_ADI, COUNT(B.BOLUM_ID) AS BOLUM_SAYISI
FROM MESLEKYUKSEKOKULU M
INNER JOIN KAMPUS K ON M.KAMPUS_ID = K.KAMPUS_ID
INNER JOIN BOLUM B ON M.MYO_ID = B.MYO_ID
GROUP BY K.KAMPUS_ADI, M.MYO_ADI
ORDER BY BOLUM_SAYISI DESC;

--Projeyi geliştirmek adına bu aşamadan itibaren Fakülteler tablosu eklenmiştir.
--Benzer mantıkta fakültelerde ilişkilendirilmiştir. Daha fazla sorgu üretemediğimden
-- projemi geliştirme kararı aldığım kısımdır.

--Fakülteler ve Bölümlerinin oluşturulması: *S27 , *S28

CREATE TABLE FAKULTE (
    FAKULTE_ID SERIAL PRIMARY KEY,
    FAKULTE_ADI VARCHAR(100) NOT NULL,
    KAMPUS_ID INT,
    FOREIGN KEY (KAMPUS_ID) REFERENCES KAMPUS (KAMPUS_ID) ON DELETE CASCADE
);

CREATE TABLE FAKULTE_BOLUM (
    FAKULTE_BOLUM_ID SERIAL PRIMARY KEY,
    BOLUM_ADI VARCHAR(100) NOT NULL,
    FAKULTE_ID INT,
    FOREIGN KEY (FAKULTE_ID) REFERENCES FAKULTE (FAKULTE_ID) ON DELETE CASCADE
);

--Fakültelee ve Bağlı olduğu kampüslerin eklenmesi sorguları *S29


INSERT INTO FAKULTE (FAKULTE_ADI, KAMPUS_ID) VALUES
('Tıp Fakültesi', 1),
('Fen Edebiyat Fakültesi', 1),
('İktisadi ve İdari Bilimler Fakültesi', 1),
('Hukuk Fakültesi', 1),
('Mühendislik Fakültesi', 1),
('Teknoloji Fakültesi', 1),
('Lüleburgaz Havacılık ve Uzay Bilimleri Fakültesi', 2),
('İlahiyat Fakültesi', 2),
('Mimarlık Fakültesi', 2),
('Teknik Eğitim Fakültesi', 2),
('Turizm Fakültesi', 2),
('Uygulamalı Bilimler Fakültesi', 2);

--Fakülte Bölümlerinin eklendiği sorgular ; *S30-*S40

-- Fen Edebiyat Fakültesi (FAKULTE_ID = 2)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Matematik', 2),
('Fizik', 2),
('Kimya', 2),
('Biyoloji', 2),
('Tarih', 2),
('Türk Dili ve Edebiyatı', 2),
('Sosyoloji', 2),
('Felsefe', 2);

-- Mühendislik Fakültesi (FAKULTE_ID = 5)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Bilgisayar Mühendisliği', 5),
('Elektrik-Elektronik Mühendisliği', 5),
('Makine Mühendisliği', 5),
('İnşaat Mühendisliği', 5),
('Gıda Mühendisliği', 5);

-- İktisadi ve İdari Bilimler Fakültesi (FAKULTE_ID = 3)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('İktisat', 3),
('İşletme', 3),
('Kamu Yönetimi', 3),
('Uluslararası İlişkiler', 3),
('Maliye', 3);

-- Hukuk Fakültesi (FAKULTE_ID = 4)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Hukuk', 4);

-- Teknoloji Fakültesi (FAKULTE_ID = 6)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Mekatronik Mühendisliği', 6);

-- Lüleburgaz Havacılık ve Uzay Bilimleri Fakültesi (FAKULTE_ID = 7)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Havacılık ve Uzay Mühendisliği', 7);

-- İlahiyat Fakültesi (FAKULTE_ID = 8)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('İlahiyat', 8);

-- Mimarlık Fakültesi (FAKULTE_ID = 9)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Mimarlık', 9),
('Peyzaj Mimarlığı', 9),
('Şehir ve Bölge Planlama', 9);

-- Teknik Eğitim Fakültesi (FAKULTE_ID = 10)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Teknik Eğitim', 10);

-- Turizm Fakültesi (FAKULTE_ID = 11)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Turizm İşletmeciliği', 11),
('Gastronomi ve Mutfak Sanatları', 11),
('Turizm Rehberliği', 11);

-- Uygulamalı Bilimler Fakültesi (FAKULTE_ID = 12)
INSERT INTO FAKULTE_BOLUM (BOLUM_ADI, FAKULTE_ID) VALUES
('Uluslararası Ticaret ve Lojistik', 12),
('Finans ve Bankacılık', 12),
('Muhasebe ve Finans Yönetimi', 12);

--Bu aşamadan itibaren Fakülteler ve Fakültelere ait bölümler ilişkisel bir şekilde dahil edilmiştir.ABORT
--Fakülteler için sorgular: 

--Fakülte-Fakülte Bölümünü çağıran sorgu: *S41
SELECT F.FAKULTE_ADI, FB.BOLUM_ADI
FROM FAKULTE F
LEFT JOIN FAKULTE_BOLUM FB ON F.FAKULTE_ID = FB.FAKULTE_ID
ORDER BY F.FAKULTE_ADI;

--Kampüs bilgisi dahil Fakültelerin ve bölümlerin tamamını çağıran sorgu: *S42
SELECT K.KAMPUS_ADI, F.FAKULTE_ADI, FB.BOLUM_ADI
FROM KAMPUS K
INNER JOIN FAKULTE F ON K.KAMPUS_ID = F.KAMPUS_ID
LEFT JOIN FAKULTE_BOLUM FB ON F.FAKULTE_ID = FB.FAKULTE_ID
ORDER BY K.KAMPUS_ADI, F.FAKULTE_ADI;

--Bölümü olmayan fakülteyi(tıp) tam bilgileri ile çağıran sorgu *S43
SELECT K.KAMPUS_ADI, F.FAKULTE_ADI
FROM KAMPUS K
INNER JOIN FAKULTE F ON K.KAMPUS_ID = F.KAMPUS_ID
LEFT JOIN FAKULTE_BOLUM FB ON F.FAKULTE_ID = FB.FAKULTE_ID
WHERE FB.BOLUM_ADI IS NULL;


--Fakulte tabloların basic çağırım sorguları: *S44,45
SELECT * FROM fakulte
SELECT * FROM	fakulte_bolum

--Ve son olarak örnek teşkil etmesi adına hem fakülte hem kampüs bölümlerinden 
--ortak anahtar arayan ortak sorgu: *S46


SELECT B.BOLUM_ADI, M.MYO_ADI AS BIRIM_ADI, 'MYO' AS BIRIM_TURU
FROM BOLUM B
INNER JOIN MESLEKYUKSEKOKULU M ON B.MYO_ID = M.MYO_ID
WHERE B.BOLUM_ADI LIKE '%Bilgisayar%'
UNION
SELECT FB.BOLUM_ADI, F.FAKULTE_ADI AS BIRIM_ADI, 'FAKÜLTE' AS BIRIM_TURU
FROM FAKULTE_BOLUM FB
INNER JOIN FAKULTE F ON FB.FAKULTE_ID = F.FAKULTE_ID
WHERE FB.BOLUM_ADI LIKE '%Bilgisayar%';

--Bu doğrultuda istenilen sorgu sayısına veritabanı genişletilerek çoğaltılmıştır.
--Webte güncel öğrenci sayısı bulamadığımdan ekleyemedim.




--Kullanılan sorgu taleplerinden bazılarının açıklaması;

--INNER JOIN: 
--İki tablodaki eşleşen verileri birleştirir. 
--MYO ve bölümleri birleştirerek hangi MYO’ya hangi bölümün 
--bağlı olduğunu gösterir.

--LEFT JOIN:
--MYO’ya bağlı olmayan bölümleri de gösterir. Bu şekilde 
--bölümü olmayan MYO’ları da sorgulamak mümkündür. Ancak bizde tüm 
--bölümler bağlı olduğundan not null ifadesi görmeyiz

--GROUP BY: 
--Belirli bir sütuna göre gruplandırma yapar. MYO bazında bölüm 
--sayısını hesaplamak için kullanılır.

--HAVING: 
--GROUP BY sonrası filtreleme yapar. Sadece bölümü olan MYO’lar 
--listelenir.Ancak bizde tüm bölümler bağlı olduğundan not null ifadesi görmeyiz

--ON DELETE CASCADE: 
--Bir kampüs silindiğinde, o kampüse bağlı MYO’lar ve bölümler de 
--otomatik olarak silinir.

--UNION 
--iki farklı sorguyu birleştirmek amacıyla başvurulur.


--Basit bir şekilde oluşturabileceğimiz DATABASE bu şekildedir.

--Okunurluğun artması adına sorgular tamamen yazıldıktan sonra
-- FORMAT DOCUMENT komutu ile revize edilmiştir.

--Proje hakkındaki ayrıntılara raporumda ulaşabilirsiniz.


-- Osman Yetkin 1247008055