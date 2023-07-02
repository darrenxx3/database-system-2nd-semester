--a--
backup database DBPRACCASEedit TO DISK = 'D:\UMN Sistem informasi 2021 - 2022\SEMESTER 2\data base system\lab\week5\ContohBackUp1.BAK' 
WITH NOFORMAT, INIT

--b--
use master
go
RESTORE DATABASE DBPRACCASEedit
FROM DISK = 'D:\UMN Sistem informasi 2021 - 2022\SEMESTER 2\data base system\lab\week5\ContohBackUp1.BAK' WITH REPLACE
go

--c--
use [DBPRACCASEedit]
go 

create login user1 WITH password = 'user1';
create user [user1] for login user1;

--d--
use [DBPRACCASEedit]
go 

create login user2 WITH password = 'user2';
create user [user2] for login user2;

--e--
use [DBPRACCASEedit]
go
GRANT select
ON MsPatient
TO user2

--f--
grant insert, update
ON TransactionDetail
To user2;
--g--
Grant all privileges
ON MsDoctor
TO user2 WITH GRANT OPTION;

--h--
revoke select ON MSPatient
from user2;

--i--
revoke insert, update on TransactionDetail from user2;

--j--
revoke all privileges on MsDoctor
to user2
cascade AS user2;