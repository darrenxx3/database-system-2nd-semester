--CREATE DATABASE 
CREATE DATABASE WEEK2
USE WEEK 2 

--CREATE TABLE
CREATE TABLE MsMedicineType
(
	MedicineTypeID CHAR (5) primary key,
	MedicineTypeName varchar (50) not null
);

CREATE TABLE MsMedicine
(
	MedicineID CHAR(5) primary key,
	MedicineTypeID CHAR(5) 
	CONSTRAINT FK_MsMedicine_MedicineTypeID REFERENCES MsMedicineType(MedicineTypeID),
	MedicineName varchar (50) not null,
	MedicinePrice int  not null,
	MedicineStock int not null
);

CREATE TABLE MsPatient
(
	PatientID CHAR (5) primary key,
	PatientName varchar (50) not null,
	PatientAddress varchar (100),
	PatientPhone varchar (20),
	PatientBirthDate date
);

CREATE TABLE MsDoctor
(
	DoctorID CHAR (5) primary key,
	DoctorName varchar (50) not null,
	DoctorAddress varchar (100),
	DoctorPhone varchar (20),
	DoctorBirthDate date
);

CREATE TABLE TransactionHeader
(
	TransactionID CHAR (5) primary key,
	DoctorID CHAR (5) 	
	CONSTRAINT FK_TH_DoctorID REFERENCES MsDoctor(DoctorID),
	PatientID CHAR (5) 
	CONSTRAINT FK_TH_PatientID REFERENCES MsPatient(PatientID),
	TransactionDate DATE not null
);

CREATE TABLE TransactionDetail
(
	TransactionID CHAR (5) 
	CONSTRAINT FK_TD_TransactionID REFERENCES TransactionHeader(TransactionID),
	MedicineID CHAR (5) 
	CONSTRAINT FK_TD_MedicineID REFERENCES MsMedicine(MedicineID),
	Quantity int not null,
	primary key(TransactionID,MedicineID)
);

--INSERT
INSERT INTO MsMedicineType VALUES('MT001','Tablet');
INSERT INTO MsMedicineType VALUES('MT002','Syrup');
INSERT INTO MsMedicineType VALUES('MT003','Balm');

INSERT INTO MsMedicine VALUES('ME001','MT002','OBH Combi Plus',18000,50);
INSERT INTO MsMedicine VALUES('ME002','MT001','Aspirin',5000,200);
INSERT INTO MsMedicine VALUES('ME003','MT003','Balpirik',15500,30);
INSERT INTO MsMedicine VALUES('ME004','MT003','Vicks',16000,30);
INSERT INTO MsMedicine VALUES('ME005','MT001','Panadol',6000,450);
INSERT INTO MsMedicine VALUES('ME006','MT002','Komix',2000,400);
INSERT INTO MsMedicine VALUES('ME007','MT001','Claritin',14500,25);
INSERT INTO MsMedicine VALUES('ME008','MT002','Decadryl',15000,25);
INSERT INTO MsMedicine VALUES('ME009','MT002','Bisolvon',25000,30);
INSERT INTO MsMedicine VALUES('ME010','MT002','Woods',18000,40);

INSERT INTO MsPatient VALUES('PA001','Fifilia','Hard Stone Street','08991828752','24-DEC-1991');
INSERT INTO MsPatient VALUES('PA002','Calvin','Syahdan Street','08191231589','23-DEC-2003');
INSERT INTO MsPatient VALUES('PA003','Ferlim Putra','Kapuk Street','08991200912','02-AUG-2001');
INSERT INTO MsPatient VALUES('PA004','Falerian Jonathan','Sunter Street','021921125252','30-MAY-1974');
INSERT INTO MsPatient VALUES('PA005','Gradiyanto Sanjaya','Greenville Street','02198776654','31-JUL-1982');
INSERT INTO MsPatient VALUES('PA006','Hianto Hendry','Syahdan Street','081823358796','01-APR-1987');
INSERT INTO MsPatient VALUES('PA007','Junius','Kijang Street','08812670794','03-MAR-1998');
INSERT INTO MsPatient VALUES('PA008','Andi Juardi','Google Street','0219783968','30-NOV-2005');
INSERT INTO MsPatient VALUES('PA009','Jeklin Harefa','Web Street','0818231322','25-FEB-1976');
INSERT INTO MsPatient VALUES('PA010','Davin Timothy','Strong Horse Street','0219780642','15-DEC-1955');

INSERT INTO MsDoctor VALUES('DC001','Yogie Soesanto','Binus Street','+62216600123','24-NOV-1985');
INSERT INTO MsDoctor VALUES('DC002','Nico Natalie','Anggrek Street','+628181231345','15-DEC-1992');
INSERT INTO MsDoctor VALUES('DC003','Julian Wesley','Syahdan Street','+628181212','07-MAR-1964');
INSERT INTO MsDoctor VALUES('DC004','Mellisa Pratiwi','Bowl Street','+6221112331','08-AUG-1994');
INSERT INTO MsDoctor VALUES('DC005','Indra Saswita','Sunter Street','+62216600127','23-SEP-1962');
INSERT INTO MsDoctor VALUES('DC006','Franky Quo','Crox Street','+62816609123','01-OCT-1975');
INSERT INTO MsDoctor VALUES('DC007','Livia Ashianti','Syahdan Street','+62816699111','03-APR-1989');
INSERT INTO MsDoctor VALUES('DC008','Yudy Purnama','Brother Street','+6221316623','22-MAY-1965');
INSERT INTO MsDoctor VALUES('DC009','Budiman','Kijang Street','+6289991221','02-FEB-1954');
INSERT INTO MsDoctor VALUES('DC010','Andy Putra','Angry Street Street','+6287877991','06-DEC-1987');

INSERT INTO TransactionHeader VALUES ('TR001','DC002','PA001','22-OCT-2011');
INSERT INTO TransactionHeader VALUES ('TR002','DC001','PA008','29-FEB-2008');
INSERT INTO TransactionHeader VALUES ('TR003','DC002','PA003','23-JUL-2011');
INSERT INTO TransactionHeader VALUES ('TR004','DC005','PA004','05-MAY-2011');
INSERT INTO TransactionHeader VALUES ('TR005','DC005','PA005','29-FEB-2012');
INSERT INTO TransactionHeader VALUES ('TR006','DC003','PA006','01-DEC-2011');
INSERT INTO TransactionHeader VALUES ('TR007','DC006','PA007','24-OCT-2012');
INSERT INTO TransactionHeader VALUES ('TR008','DC008','PA001','02-MAR-2012');
INSERT INTO TransactionHeader VALUES ('TR009','DC008','PA002','25-SEP-2012');
INSERT INTO TransactionHeader VALUES ('TR010','DC010','PA003','01-MAY-2011');
INSERT INTO TransactionHeader VALUES ('TR011','DC001','PA008','07-JUN-2010');
INSERT INTO TransactionHeader VALUES ('TR012','DC003','PA010','18-OCT-2010');
INSERT INTO TransactionHeader VALUES ('TR013','DC001','PA009','20-OCT-2010');
INSERT INTO TransactionHeader VALUES ('TR014','DC007','PA008','27-OCT-2006');
INSERT INTO TransactionHeader VALUES ('TR015','DC004','PA001','31-JUL-2012');

INSERT INTO TransactionDetail VALUES ('TR001','ME001',2);
INSERT INTO TransactionDetail VALUES ('TR002','ME005',55);
INSERT INTO TransactionDetail VALUES ('TR003','ME002',3);
INSERT INTO TransactionDetail VALUES ('TR004','ME004',4);
INSERT INTO TransactionDetail VALUES ('TR005','ME001',7);
INSERT INTO TransactionDetail VALUES ('TR006','ME003',10);
INSERT INTO TransactionDetail VALUES ('TR007','ME001',5);
INSERT INTO TransactionDetail VALUES ('TR004','ME001',7);
INSERT INTO TransactionDetail VALUES ('TR009','ME006',2);
INSERT INTO TransactionDetail VALUES ('TR010','ME007',5);
INSERT INTO TransactionDetail VALUES ('TR011','ME001',12);
INSERT INTO TransactionDetail VALUES ('TR013','ME010',5);
INSERT INTO TransactionDetail VALUES ('TR013','ME008',7);
INSERT INTO TransactionDetail VALUES ('TR014','ME001',4);
INSERT INTO TransactionDetail VALUES ('TR015','ME007',3);
INSERT INTO TransactionDetail VALUES ('TR001','ME003',4);
INSERT INTO TransactionDetail VALUES ('TR002','ME006',6);
INSERT INTO TransactionDetail VALUES ('TR002','ME002',12);
INSERT INTO TransactionDetail VALUES ('TR002','ME001',10);
INSERT INTO TransactionDetail VALUES ('TR001','ME004',2);
INSERT INTO TransactionDetail VALUES ('TR006','ME001',3);
INSERT INTO TransactionDetail VALUES ('TR007','ME007',5);
INSERT INTO TransactionDetail VALUES ('TR008','ME001',7);
INSERT INTO TransactionDetail VALUES ('TR009','ME002',12);
INSERT INTO TransactionDetail VALUES ('TR001','ME008',8);
INSERT INTO TransactionDetail VALUES ('TR011','ME010',9);
INSERT INTO TransactionDetail VALUES ('TR006','ME008',5);
INSERT INTO TransactionDetail VALUES ('TR013','ME002',1);
INSERT INTO TransactionDetail VALUES ('TR015','ME004',4);
INSERT INTO TransactionDetail VALUES ('TR015','ME009',2);

--SELECT
SELECT * FROM TransactionHeader;
SELECT * FROM TransactionDetail;
SELECT * FROM MsDoctor;
SELECT * FROM MsMedicine;
SELECT * FROM MsMedicineType;
SELECT * FROM MsPatient;

