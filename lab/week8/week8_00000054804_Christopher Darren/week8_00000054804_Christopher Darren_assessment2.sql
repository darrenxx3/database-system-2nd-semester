--week8 bagian 2--
--SUBQUERIES , Multi Table Queries & Combining Result table--

use [week8Darren(2)]

--a--
SELECT MedicineID, MedicineName, MedicineTypeName, MedicineStock
FROM MsMedicine Medic, MsMedicineType Medty
WHERE Medic.MedicineTypeID = Medty.MedicineTypeID AND LEN(MedicineName) > 10;

--b--
SELECT Mdo.DoctorID, DoctorName, TransactionID, TransactionDate
FROM MsDoctor Mdo
LEFT JOIN TransactionHeader Th ON Mdo.DoctorID = Th.DoctorID
WHERE TransactionID IS NULL;

--c--
SELECT MPA.PatientID, PatientName, Th.TransactionID FROM MsPatient MPA
JOIN TransactionHeader Th ON MPA.PatientID = Th.PatientID
JOIN TransactionDetail Td ON Th.TransactionID = Td.TransactionID
WHERE MONTH(TransactionDate) BETWEEN 3 AND 7 AND MedicineID = 'ME001';

--d--
SELECT Th.TransactionID, DoctorName, TransactionDate, MedicineName, Quantity
FROM TransactionHeader Th
JOIN MsDoctor Mdo ON Th.DoctorID = Mdo.DoctorID
JOIN TransactionDetail Td ON Th.TransactionID = Td.TransactionID
JOIN MsMedicine Medic ON Td.MedicineID = Medic.MedicineID
WHERE MedicineName LIKE '%L' AND Quantity >  5;

--e--
SELECT Th.TransactionID, MPA.PatientID, PatientName, Mdo.DoctorID, DoctorName
FROM TransactionHeader Th
JOIN MsPatient MPA ON Th.PatientID = MPA.PatientID
JOIN MsDoctor Mdo ON Th.DoctorID = Mdo.DoctorID
WHERE Th.TransactionID IN (SELECT Td.TransactionID FROM TransactionDetail Td
WHERE Mdo.DoctorName NOT LIKE '% s%' AND Mdo.DoctorName
NOT LIKE '% p%' AND Td.Quantity % 5 = 0);

--f--
SELECT PatientID 'Code', PatientName 'Name '
FROM MsPatient
WHERE PatientName NOT LIKE '% %'
UNION
SELECT DoctorID, DoctorName FROM MsDoctor
WHERE DoctorName NOT LIKE '% %';

--g--
SELECT Medic.MedicineID, MedicineName, MedicineTypeName, MedicinePrice
FROM MsMedicine Medic
JOIN MsMedicineType Medty ON Medic.MedicineTypeID = Medty.MedicineTypeID
WHERE MedicineName LIKE 'A%' OR MedicineName LIKE 'B%' OR MedicineName LIKE 'C%'
OR MedicineName LIKE 'D%' OR MedicineName Like 'E%'
UNION
SELECT Medic.MedicineID, MedicineName, MedicineTypeName, MedicinePrice
FROM MsMedicine Medic
JOIN MsMedicineType Medty ON Medic.MedicineTypeID = Medty.MedicineTypeID
WHERE LEN(MedicineName) = LEN(MedicineTypeName);

--h--
SELECT DoctorName 'Name', DoctorAddress 'Address', CONVERT(VARCHAR, DoctorBirthDate, 23) 'BirthDate'
FROM MsDoctor Mdo
JOIN TransactionHeader Th ON Mdo.DoctorID = Th.DoctorID
WHERE SUBSTRING(TransactionID,3,3) % 3 = 0
UNION
SELECT PatientName 'Name' , PatientAddress 'Address', CONVERT(VARCHAR, PatientBirthDate,23) 'BirthDate' 
FROM MsPatient MPA
JOIN TransactionHeader Th ON MPA.PatientID = Th.PatientID
WHERE DATEDIFF(YEAR, PatientBirthDate, TransactionDate) < 10 
ORDER BY 'Name' DESC;

--i--
SELECT DoctorName 'Name', REPLACE(DoctorPhone, '+62' ,'0') 'Phone'
FROM MsDoctor Mdo
JOIN TransactionHeader Th ON Mdo.DoctorID = Th.DoctorID
JOIN TransactionDetail Td ON Th.TransactionID = Td.TransactionID
JOIN MsMedicine Medic ON Td.MedicineID = Medic.MedicineTypeID
WHERE MedicineTypeID = 'MT003'
UNION
SELECT PatientName 'Name', REPLACE(PatientPhone, '+62', '0') 'Phone'
FROM MsPatient Medic
JOIN TransactionHeader Th ON Medic.PatientID = Th.PatientID
WHERE MONTH(TransactionDate) = MONTH(PatientBirthDate);

--j--
SELECT DISTINCT Mdo.DoctorID , DoctorName, COUNT(TransactionID) 'TransactionHandled'
FROM MsDoctor Mdo
JOIN TransactionHeader Th ON Mdo.DoctorID = Th.DoctorID
WHERE YEAR(TransactionDate) = 2012
GROUP BY Mdo.DoctorID, DoctorName;