use week8Darren
--4 Assessment bagian 1--
--SUBQUERIES & Multi Table QUERIES--

--a--
SELECT "MedicineID" , "MedicineName"
FROM MsMedicine Medic, MsMedicineType Medty
WHERE Medic.MedicineTypeID =  Medty.MedicineTypeID AND Medty.MedicineTypeName IN ('Balm');


--b--
SELECT DoctorID, DoctorName, DoctorPhone, YEAR(DoctorBirthDate) AS DoctorBirthDate
FROM MsDoctor
WHERE DoctorID NOT IN (SELECT DoctorID FROM TransactionHeader);

--c--
SELECT MedicineName, MedicineTypeName, MedicinePrice
FROM MsMedicine Medic
JOIN MsMedicineType Medty ON Medic.MedicineTypeID = Medty.MedicineTypeID
JOIN TransactionDetail Td ON Medic.MedicineID = Td.MedicineID
JOIN TransactionHeader Th ON Td.TransactionID = Th.TransactionID
WHERE EXISTS(SELECT TransactionDate FROM TransactionDetail WHERE MONTH(TransactionDate) = 12 )

--d--
SELECT MedicineID, MedicineName, 'Rp. ' + CAST(Medic.MedicinePrice AS varchar(20)) AS MedicinePrice
FROM MsMedicine Medic
WHERE NOT EXISTS (SELECT Md.DoctorID FROM MsDoctor Md, TransactionDetail Td, TransactionHeader Th
WHERE Medic.MedicineId = Td.MedicineID AND Td.TransactionID = Th.TransactionID AND Th.DoctorID = 'DC001')

--e--
SELECT PatientID, PatientName, YEAR(PatientBirthDate) AS PatientBirthYear
FROM MsPatient MPA
WHERE MPA.PatientID IN (SELECT MPA.PatientID FROM MsPatient MPA, TransactionHeader Th, MsDoctor Md
WHERE MPA.PatientID = Th.PatientID AND Md.DoctorID = Th.DoctorID AND YEAR(PatientBirthDate) < YEAR(DoctorBirthDate))

--f--
SELECT TransactionID, CONVERT(varchar(11), TransactionDate, 102) as TransactionDate
FROM TransactionHeader Th
WHERE EXISTS (SELECT Medty.MedicineTypeName, Medic.MedicinePrice FROM TransactionDetail Td, MsMedicine Medic, MsMedicineType Medty
WHERE Th.TransactionID = Td.TransactionID AND Td.MedicineID = Medic.MedicineID AND Medic.MedicineTypeID = Medty.MedicineTypeID AND
MedicineTypeName IN (SELECT MedicineTypeName FROM MsMedicineType WHERE MedicineTypeName != 'Syrup')
AND MedicinePrice IN(SELECT MedicinePrice FROM MsMedicine WHERE MedicinePrice > 15000));

--g--
SELECT PatientID, PatientName, REPLACE(PatientAddress, 'Street','') AS PatientRoadAddress
FROM MsPatient
WHERE LEN(PatientName) > (SELECT(AVG(LEN(PatientName))) FROM MsPatient);

--h--
SELECT PatientName, FORMAT(PatientBirthDate, 'dd/MM/yy') AS PatientBirthDate, PatientAddress 
FROM MsPatient MPA
WHERE MPA.PatientID IN (SELECT MPA.PatientID FROM MsPatient MPA
JOIN TransactionHeader Th ON MPA.PatientID = Th.PatientID
JOIN MsDoctor Md ON Th.DoctorID = Md.DoctorID
WHERE DAY(Th.TransactionDate) BETWEEN 15 AND 25 AND DoctorName LIKE '%j%' OR DoctorName LIKE '%k%');

--i--
SELECT PatientID, PatientName, UPPER(LEFT(PatientName, 2)) AS Initial, PatientBirthDate,
CAST((SELECT COUNT(TransactionID) FROM TransactionHeader Th
WHERE Th.PatientID = MPA.PatientID) AS varchar) + ' Transaction(s)' AS TransactionCount
FROM MsPatient MPA;

--j--
SELECT DoctorID, DoctorName, CONVERT(varchar(11), DoctorBirthDate, 0) AS DoctorBirthDate
FROM MsDoctor
WHERE YEAR(DoctorBirthDate) = (SELECT MAX(YEAR(DoctorBirthDate)) FROM MsDoctor)
OR YEAR(DoctorBirthDate) = (SELECT MIN(YEAR(DoctorBirthDate)) FROM MsDoctor);
