CREATE VIEW dbo.FilmBilgileriView
AS
SELECT
    f.filmID,
    f.film_Adi AS 'Film_Adi',
    f.film_yonetmeni AS 'Yonetmen',
    o.oyuncu_Adi + ' ' + o.oyuncu_Soyadi AS 'Oyuncu',
    t.tur_Adi AS 'Tur',
    dbo.FilmSaatiniGetir(f.film_Adi) AS 'Baslangic_Saati',
    s.salon_Adi AS 'Salon_Adi'
FROM
    Filmler AS f
    INNER JOIN Film_Seans AS fs ON f.filmID = fs.filmID
    INNER JOIN Seanslar AS se ON fs.seansID = se.seansID
    INNER JOIN Oyuncular AS o ON f.oyuncuID = o.oyuncuID
    INNER JOIN Turler AS t ON f.film_tur_ID = t.turID
    INNER JOIN Salon AS s ON fs.seansID = s.salon_seansID;