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

    -- Belirli bir þartý kontrol et (Örneðin, turID 1 olan dram filmlerini kontrol et)
    IF @turID = 1
    BEGIN
        -- Ýþlemi iptal et
        ROLLBACK;
        -- Hata mesajýný kullanýcýya gönder
        THROW 50000, 'Drama türündeki filmler eklenemez.', 1;
    END

    -- Eklenen filmle ilgili diðer bilgileri al
    SELECT @seansSaati = seans_Saati, @salonAdi = salon_Adi
    FROM Seanslar s
    INNER JOIN Film_Seans fs ON s.seansID = fs.seansID
    INNER JOIN Salon sa ON fs.filmID = sa.filmID
    WHERE fs.filmID = @filmID;

    -- Belirli bir þartý kontrol et (Örneðin, belirli bir saatteki filmleri kontrol et)
    IF @seansSaati < GETDATE()
    BEGIN
        -- Ýþlemi iptal et
        ROLLBACK;
        -- Hata mesajýný kullanýcýya gönder
        THROW 50000, 'Seansý geçmiþ filmler eklenemez.', 1;
    END

    -- Ýþlem baþarýlýysa baþka bir tabloya veri ekle
    INSERT INTO YeniFilmler (filmID, salonAdi)
    VALUES (@filmID, @salonAdi);
END;


