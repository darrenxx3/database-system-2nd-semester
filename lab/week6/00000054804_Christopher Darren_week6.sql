create database week6;
use week6;

--a--
select "DoctorID", "DoctorName","DoctorPhone" from dbo.MsDoctor

--b--
select "MedicineId","MedicineName","MedicinePrice" from dbo.MsMedicine 
WHERE MedicineStock > 100;

--c--
select "PatientName", "PatientAddress" from dbo.MsPatient
where  "PatientBirthDate" > '2000-01-01';


--d--
select "PatientID", "PatientName", "PatientPhone" from dbo.MsPatient
where LEFT(PatientPhone, 3 ) = '021'

--e--
select "TransactionId", "TransactionDate" from dbo.TransactionHeader
WHERE month(TransactionDate)between '05' and '07'

--f--
select "DoctorID", "DoctorName", "DoctorAddress" from dbo.MsDoctor
WHERE   DoctorName LIKE  '[aiueo]%'

--g--
select REPLACE (PatientID, 'PA', 'Patient#') as "PatientNumber" , "PatientName" , "PatientAddress"   from dbo.MsPatient
WHERE PatientID LIKE '%1%'

--h--
select "TransactionID",  "TransactionDate" from dbo.TransactionHeader
WHERE RIGHT(DoctorID, 3) % 2 = 0
ORDER BY TransactionDate ASC

--i--
select PatientID, PatientName, PatientBirthDate, TransactionDate from dbo.MsPatient 
JOIN TransactionHeader  ON PatientID = PatientID
WHERE DATEDIFF(YEAR, PatientBirthDate, TransactionDate) < 17
ORDER BY PatientBirthDate DESC

--j--
select MedicineID, MedicineName, upper(MT.MedicineTypeName) as TypeName, MedicineStock
from MsMedicine MS
join MsMedicineType on Ms.MedicineID = MT.MedicineTypeID
ORDER BY MedicineName ASC