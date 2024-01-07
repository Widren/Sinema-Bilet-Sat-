-- Oyuncular Tablosu
INSERT INTO Oyuncular (oyuncu_Adi, oyuncu_Soyadi)
VALUES 
  ('Tom', 'Hanks'),
  ('Scarlett', 'Johansson'),
  ('Brad', 'Pitt'),
  ('Jennifer', 'Lawrence'),
  ('Robert', 'Downey Jr.'),
  ('Leonardo', 'DiCaprio'),
  ('Emma', 'Stone'),
  ('Matt', 'Damon'),
  ('Charlize', 'Theron'),
  ('Chris', 'Hemsworth');

-- Turler Tablosu
INSERT INTO Turler (tur_Adi)
VALUES 
  ('Drama'),
  ('Aksiyon'),
  ('Komedi'),
  ('Bilim Kurgu'),
  ('Romantik'),
  ('Gerilim'),
  ('Fantastik'),
  ('Macera'),
  ('Suç'),
  ('Müzikal');

-- Seanslar Tablosu
INSERT INTO Seanslar (seans_Saati)
VALUES 
  ('2023-12-28 15:00:00'),
  ('2023-12-28 17:30:00'),
  ('2023-12-28 20:00:00'),
  ('2023-12-28 22:30:00'),
  ('2023-12-29 12:00:00'),
  ('2023-12-29 15:00:00'),
  ('2023-12-29 17:30:00'),
  ('2023-12-29 20:00:00'),
  ('2023-12-29 22:30:00'),
  ('2023-12-30 12:00:00');

-- Filmler Tablosu
INSERT INTO Filmler (film_Adi, film_yonetmeni, film_tur_ID, oyuncuID)
VALUES 
  ('The Shawshank Redemption', 'Frank Darabont', 1, 1),
  ('Inception', 'Christopher Nolan', 4, 2),
  ('The Hangover', 'Todd Phillips', 3, 3),
  ('Silver Linings Playbook', 'David O. Russell', 1, 4),
  ('Iron Man', 'Jon Favreau', 2, 5),
  ('The Revenant', 'Alejandro G. Iñárritu', 1, 6),
  ('La La Land', 'Damien Chazelle', 5, 7),
  ('The Bourne Identity', 'Doug Liman', 3, 8),
  ('Mad Max: Fury Road', 'George Miller', 2, 9),
  ('Thor', 'Kenneth Branagh', 4, 10);

-- Salon_Seans Tablosu
INSERT INTO Salon_Seans (seansID)
VALUES 
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);

-- Film_Seans Tablosu
INSERT INTO Film_Seans (filmID, seansID)
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-- Salon Tablosu
INSERT INTO Salon (salon_seansID, salon_Adi, filmID)
VALUES 
  (1, 'Salon 1', 1),
  (2, 'Salon 2', 2),
  (3, 'Salon 3', 3),
  (4, 'Salon 4', 4),
  (5, 'Salon 5', 5),
  (6, 'Salon 6', 6),
  (7, 'Salon 7', 7),
  (8, 'Salon 8', 8),
  (9, 'Salon 9', 9),
  (10, 'Salon 10', 10);

-- Koltuk Tablosu
INSERT INTO Koltuk (salonID, koltuk_Harf, koltuk_Rakam)
VALUES 
  (1, 'A', 1),
  (2, 'B', 2),
  (3, 'C', 3),
  (4, 'D', 4),
  (5, 'E', 5),
  (6, 'F', 6),
  (7, 'G', 7),
  (8, 'H', 8),
  (9, 'I', 9),
  (10, 'J', 10);

-- Bilet Tablosu
INSERT INTO Bilet (bilet_Adi, filmID, koltukID, salonID, seanslarID)
VALUES 
  ('Bilet 1', 1, 1, 1, 1),
  ('Bilet 2', 2, 2, 2, 2),
  ('Bilet 3', 3, 3, 3, 3),
  ('Bilet 4', 4, 4, 4, 4),
  ('Bilet 5', 5, 5, 5, 5),
  ('Bilet 6', 6, 6, 6, 6),
  ('Bilet 7', 7, 7, 7, 7),
  ('Bilet 8', 8, 8, 8, 8),
  ('Bilet 9', 9, 9, 9, 9),
  ('Bilet 10', 10, 10, 10, 10);
