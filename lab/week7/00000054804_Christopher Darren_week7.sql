 --DDL--
Use Week7

create table bank
(
BankID char(10) not null primary key,
BankName varchar(50) not null
);

create table Photographer
(
PhotographerID char(10) not null primary key,
PhotographerName varchar(50)not null,
PhotographerGender varchar(50)not null,
PhotographerAddress varchar(50)not null,
PhotographerEmail varchar(50)not null,
Skill varchar(50)not null,
Camera varchar(50)not null,
Lens varchar(50)not null,
Equipment varchar(50)not null,
AccountNumber int not null,
BankID char (10)not null,
Descriptions varchar(50)not null,

foreign key (BankID) references bank,
);


create table Customer
(
CustID char(10)not null primary key,
CustName varchar(50)not null,
CustGender varchar(50)not null,
CustAddress varchar(50)not null,
CustEmail varchar(50)not null,
Instagram varchar(50),
Facebook varchar(50),
Twitter varchar(50)
);

create table PortfolioAlbum
(
PortfolioAlbumID char(10)not null primary key,
PhotographerID char(10)not null,
AlbumTitle varchar(50)not null,
CreatedDate date not null,
Photo varchar(50)not null,
Descriptions varchar (50)not null,

foreign key (PhotographerID) references Photographer,
);

CREATE TABLE Transactions
(
 TransactionID CHAR (10)not null primary key,
 CustID CHAR (10)not null ,
 PhotographerID CHAR(10) not null,
 EventDate date not null,
 EventTime time not null,
 Duration int not null,
 PlaceName VARCHAR(50)not null,
 Locations CHAR(50)not null,
 BookingDate date not null,

 foreign key (CustID)references Customer,
 foreign key (PhotographerID) references Photographer,
);

Create Table Payment
(
PaymentID CHAR (10) not null PRIMARY KEY,
TransactionID CHAR (10), 
PaymentDate date not null,
AmountofPayment int not null,
PaymentMethod varchar (50)not null,
PaymentStatus varchar(50)not null,

foreign key (TransactionID) references Transactions,
)
;

--DML--

INSERT INTO bank 
 (BankID, BankName)
VALUES
 ('B001','BCA'),
 ('B002','BNI'),
 ('B003','MANDIRI'),
 ('B004','BRI'),
 ('B005','BJB'),
 ('B006','BTN'),
 ('B007','BTS');


INSERT INTO Customer
 (CustID, CustName, CustGender, CustAddress, CustEmail, Instagram, Facebook, Twitter)
VALUES
 ('COO1','Roesli','Male', 'Jakarta','Vincent.com', 'vincentsk', 'vingans', ''),
 ('COO2','Pungky','Male', 'Jakarta','pungky.com', '', 'pungpung', 'pungrok'),
 ('COO3','sk','Male', 'Jakarta','sks.com', 'vinsk', 'skjelek', 'skpinterz'),
 ('COO4','rendy','Male', 'Jakarta','rens.com', 'renv', 'rendykeren', 'rendypinterb'),
 ('COO5','benaya','Male', 'Jakarta','benz.com', 'benmw', 'bentrok', ''),
 ('COO6','darren','Male', 'Jakarta','darrrrr.com', '', '', 'darrenpinterd'),
 ('COO7','VCT','Male', 'Jakarta','Valorant.com', 'proplayer', '', 'ctpintera');

INSERT INTO PortfolioAlbum
 (PortfolioAlbumID,PhotographerID, AlbumTitle, CreatedDate, Photo, Descriptions)
VALUES
 ('P001','PG01','bahagia', '2012-12-21','seneng','bahagiaitusederhana'),
 ('P002','PG02','pegasus', '2011-11-20','cewecantik','cantikitucucimata'),
 ('P003','PG03','banana', '2010-12-22','cowojelek','jelekituprivilege'),
 ('P004','PG04','apple', '2013-12-22','sad','sadboyabis'),
 ('P005','PG05','anime','2006-06-06','wibu','wibuitukeren');

INSERT INTO Photographer
 (PhotographerID, PhotographerName, PhotographerGender, PhotographerAddress, PhotographerEmail, Skill, Camera, Lens, Equipment, AccountNumber, BankID, Descriptions)
VALUES
 ('PG01','Andre','Male', 'Tangerang ','Andre.com', 'Pro', 'Canon', '1', 'Tripod', '001','B001','keren'),
 ('PG02','Joe','Male', 'Jakarta ','Joe.com', 'Rookie', 'Sony', '3', 'Tripod, Lighting', '002','B002','mantap'),
 ('PG03','Bill','Male', 'Tangerang ','Bill.com', 'Pro', 'Canon', '2', 'Lighting', '003','B003','Best'),
 ('PG04','Bryan','Male', 'Jakarta ','Bryan.com', 'Newbie', 'Canon', '2', 'Bag', '004','B004','The Master'),
 ('PG05','Joko','Male', 'Tangerang ','Joko.com', 'Pro', 'Sony', '4', 'Stabilizer, Lighting,Tripod','005','B005','The Best Of The Best');

INSERT INTO Payment
 (PaymentID, TransactionID, PaymentDate, AmountofPayment, PaymentMethod, PaymentStatus)
VALUES
 ('PY01','TR01','2011-11-11', 1000000,'Debit', 'terbayar'),
 ('PY02','TR02','2012-11-11', 2000000,'kredit', 'nyicil'),
 ('PY03','TR03','2013-11-11', 3000000,'cash', 'terbayar'),
 ('PY04','TR04','2014-11-11', 4000000,'Debit', 'terbayar'),
 ('PY05','TR05','2015-11-11', 1000000,'Debit', 'terbayar'),
 ('PY06','TR06','2016-11-11', 1500000,'kredit', 'nyicil'),
 ('PY07','TR07','2017-11-11', 7000000,'Debit', 'terbayar');

INSERT INTO Transactions
 (TransactionID,CustID, PhotographerID,EventDate,EventTime,Duration, PlaceName,Locations, BookingDate)
VALUES
 ('TR01','COO1','PG01','1990-05-11','09:00','2','Central','Jakarta','1990-05-10'),
 ('TR02','COO2','PG02','1990-05-11','10:00','3','East','Jakarta','1990-05-11'),
 ('TR03','COO3','PG03','1990-05-19','10:00','4','West','Jakarta','1990-05-19'),
 ('TR04','COO4','PG04','1990-05-19','10:00','5','unknown','Jakarta','1990-05-18'),
 ('TR05','COO5','PG01','1990-05-19','11:00','6','tumbal','Jakarta','1990-05-17'),
 ('TR06','COO6','PG02','1990-05-19','12:00','7','gesno','Jakarta','1990-05-20'),
 ('TR07','COO7','PG03','1990-05-19','13:00','8','ambun','Jakarta','1990-05-21');


--DML 2.DELETE DATA-- 
DELETE FROM bank WHERE BankID = 'B006'
DELETE FROM Photographer WHERE PhotographerID = 'PG05'

--DML 3.UPDATE DATA--
SELECT Instagram, Facebook from Customer;
UPDATE Customer
SET
 Instagram = null,
 Facebook = null
WHERE
 Instagram = '' OR Facebook = '';

UPDATE Payment
SET 
 PaymentStatus = 'Instalment'
WHERE
 PaymentStatus = 'nyicil';