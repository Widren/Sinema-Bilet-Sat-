create table Oyuncular (
oyuncuID INT IDENTITY(1,1) PRIMARY KEY,
oyuncu_Adi nvarchar(50) not null,
oyuncu_Soyadi nvarchar(50) not null
)

go

create table Turler (
turID INT IDENTITY(1,1) PRIMARY KEY,
tur_Adi nvarchar(50) not null
)

go

create table Seanslar (
seansID INT IDENTITY(1,1) PRIMARY KEY,
seans_Saati datetime not null
)

go

create table Filmler (
filmID INT IDENTITY(1,1) PRIMARY KEY,
film_Adi nvarchar(50) not null,
film_yonetmeni nvarchar(50) not null,
film_tur_ID int foreign key references Turler(turID),			
oyuncuID int foreign key references Oyuncular(oyuncuID)
)

go

create table Salon_Seans (
salonID INT IDENTITY(1,1) PRIMARY KEY,
seansID int foreign key references Seanslar(seansID)
)

go

create table Film_Seans (
film_seansID INT IDENTITY(1,1) PRIMARY KEY,
filmID int foreign key references Filmler(filmID),
seansID int foreign key references Seanslar(seansID)
)

go


create table Salon (
SalonID INT IDENTITY(1,1) PRIMARY KEY,
salon_seansID int foreign key references Salon_Seans(salonID),
salon_Adi nvarchar(50) not null,
filmID int foreign key references Filmler(filmID)
)

go

create table Koltuk (
koltukID INT IDENTITY(1,1) PRIMARY KEY,
salonID int foreign key references Salon_Seans(salonID),
koltuk_Harf nvarchar(50) not null,
koltuk_Rakam int not null
)

go

create table Bilet (
biletID INT IDENTITY(1,1) PRIMARY KEY,
bilet_Adi nvarchar(50) not null,
filmID int foreign key references Filmler(filmID),
koltukID int foreign key references Koltuk(koltukID),
salonID int foreign key references Salon_Seans(salonID),
seanslarID int foreign key references Seanslar(seansID)
)

go	