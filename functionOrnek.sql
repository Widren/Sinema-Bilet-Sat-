-- Örnek kullaným
DECLARE @filmAdi NVARCHAR(50);
SET @filmAdi = 'La La Land';

DECLARE @seansSaati DATETIME;
SET @seansSaati = dbo.FilmSaatiniGetir(@filmAdi);

-- Dönen deðeri göster
SELECT @seansSaati AS 'Film_Baslangic_Saati';