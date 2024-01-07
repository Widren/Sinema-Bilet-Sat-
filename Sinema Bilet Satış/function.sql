--Bu fonksiyon, Filmler tablosundaki bir film ad�n� al�r, ilgili filmle ili�kili olan seans�n ba�lang�� saatini bulur ve bu saat de�erini d�nd�r�r.

CREATE FUNCTION dbo.FilmSaatiniGetir (@filmAdi NVARCHAR(50))
RETURNS DATETIME
AS
BEGIN
    DECLARE @seansSaati DATETIME;

    SELECT @seansSaati = seans_Saati
    FROM Filmler AS f
    INNER JOIN Film_Seans AS fs ON f.filmID = fs.filmID
    INNER JOIN Seanslar AS s ON fs.seansID = s.seansID
    WHERE f.film_Adi = @filmAdi;

    RETURN @seansSaati;
END;
