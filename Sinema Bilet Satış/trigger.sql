CREATE TRIGGER FilmEkleTrigger
ON Filmler
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @filmID INT;
    DECLARE @turID INT;
    DECLARE @seansSaati DATETIME;
    DECLARE @salonAdi NVARCHAR(50);

    -- Eklenen film bilgilerini al
    SELECT @filmID = filmID, @turID = film_tur_ID
    FROM INSERTED;

    -- Belirli bir �art� kontrol et (�rne�in, turID 1 olan dram filmlerini kontrol et)
    IF @turID = 1
    BEGIN
        -- ��lemi iptal et
        ROLLBACK;
        -- Hata mesaj�n� kullan�c�ya g�nder
        THROW 50000, 'Drama t�r�ndeki filmler eklenemez.', 1;
    END

    -- Eklenen filmle ilgili di�er bilgileri al
    SELECT @seansSaati = seans_Saati, @salonAdi = salon_Adi
    FROM Seanslar s
    INNER JOIN Film_Seans fs ON s.seansID = fs.seansID
    INNER JOIN Salon sa ON fs.filmID = sa.filmID
    WHERE fs.filmID = @filmID;

    -- Belirli bir �art� kontrol et (�rne�in, belirli bir saatteki filmleri kontrol et)
    IF @seansSaati < GETDATE()
    BEGIN
        -- ��lemi iptal et
        ROLLBACK;
        -- Hata mesaj�n� kullan�c�ya g�nder
        THROW 50000, 'Seans� ge�mi� filmler eklenemez.', 1;
    END

    -- ��lem ba�ar�l�ysa ba�ka bir tabloya veri ekle
    INSERT INTO YeniFilmler (filmID, salonAdi)
    VALUES (@filmID, @salonAdi);
END;


