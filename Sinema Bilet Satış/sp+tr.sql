CREATE PROCEDURE dbo.FilmEkleSP
    @filmAdi NVARCHAR(50),
    @yonetmen NVARCHAR(50),
    @turID INT,
    @oyuncuID INT,
    @seansSaati DATETIME,
    @salonAdi NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @errorOccurred BIT = 0;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Film Ekleme
        INSERT INTO Filmler (film_Adi, film_yonetmeni, film_tur_ID, oyuncuID)
        VALUES (@filmAdi, @yonetmen, @turID, @oyuncuID);

        DECLARE @filmID INT = SCOPE_IDENTITY();

        -- Seans Ekleme
        INSERT INTO Seanslar (seans_Saati)
        VALUES (@seansSaati);

        DECLARE @seansID INT = SCOPE_IDENTITY();

        -- Film-Seans Ekleme
        INSERT INTO Film_Seans (filmID, seansID)
        VALUES (@filmID, @seansID);

        -- Salon G�ncelleme
        UPDATE Salon
        SET salon_Adi = @salonAdi
        WHERE salon_seansID = @seansID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        SET @errorOccurred = 1;
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;

    IF @errorOccurred = 1
        THROW 50000, '��lem ba�ar�s�z, de�i�iklikler geri al�n�yor.', 1;
END;
