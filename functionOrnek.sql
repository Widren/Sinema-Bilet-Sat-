-- �rnek kullan�m
DECLARE @filmAdi NVARCHAR(50);
SET @filmAdi = 'La La Land';

DECLARE @seansSaati DATETIME;
SET @seansSaati = dbo.FilmSaatiniGetir(@filmAdi);

-- D�nen de�eri g�ster
SELECT @seansSaati AS 'Film_Baslangic_Saati';