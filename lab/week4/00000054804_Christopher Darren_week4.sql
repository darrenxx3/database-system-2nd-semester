--a--
use week4
create view view1 as select * from MsMedicine;

select * from view1;

--a--
create view view2 as select MedicineName, MedicinePrice, MedicineStock, MedicinePrice * MedicineStock as total
from MsMedicine

select * from view2

--c--
create view view3 as select convert(varchar, TransactionDate,106) as "Transaction Date" , DoctorName, PatientName from TransactionHeader TH)
join MsDoctor MD ON TH.DoctorID = MD.DoctorID
join MsPatient MP ON TH.PatientID = MP.PatientID
where DoctorName = 'Melissa Pratiwi')

select * from view3;

--d--
create view view4 as select RIGHT(PatientID, 3) as QueueCode, PatientName
from MsPatient
where RIGHT(patientID, 3) % 2 = 0

select * from view4;

--e--
create view  view5
Join MsPatient MP ON TH.PatientID = MP.PatientID
where PatientName not like '% %'
select * from view5;

--f--
create view view6 as select distinct MD.Doctor ID, MD.DoctorName from TransactionHeader TH
JOIN MsDoctor MD ON TH.DoctorID = MD.DoctorID
where DATENAME(weekday, TH.TransactionDate) = 'Thursday';
select * from view6;

--g--
CREATE FUNCTION Multiply (@number1 int, @number2 int)
RETURNS int as BEGIN return @number1 * @number2 end;
select dbo.Multiply(5,4);

--h--
create procedure
create procedure proc1 as select * from MsPatient;
EXEC proc1;

--i--
CREATE PROCEDURE proc2 (@MedicineID char (5)) as select TD.TransactionID, dbo.Multiply(Quantity, MM.MedicinePrice) as TotalSales from TransactionDetail TD
JOIN TransactionHeader TH ON TD.TransactionID = TH.TransactionID
JOIN MsMedicine MM ON TD.MedicineID = MM.MedicineID
where MM.MedicineID = @MedicineID;
EXEC proc2 @MedicineID = 'ME009';

--j--
drop view view1
drop view view2
drop view view3
drop view view4
drop view view5
drop view view6
drop function Multiply
drop function  proc1

