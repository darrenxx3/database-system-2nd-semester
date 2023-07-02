--a--
create database TestDatabaseweek3edited;
use TestDatabaseweek3edited;

--b--
create table MsItem
(
ItemID CHAR(5) not null primary key,
ItemName VARCHAR(50) not null)

--c--
create table TransactionItem
(
TransactionID INT not null,
ItemID CHAR (5),
TransactionDate DATE not null,

FOREIGN KEY (ItemID) REFERENCES MsItem);

--d--
ALTER TABLE TransactionItem
ADD PRIMARY KEY (TransactionID)

--e--
ALTER TABLE MsItem
ADD CONSTRAINT ItemName CHECK (ItemName > 3)

--f--
ALTER TABLE MsItem
ADD ItemStock INT  not null,
ItemPrice NUMERIC (10, 2) not null;

--g--
CREATE INDEX "index1" ON "MsItem" (ItemID, ItemName)

--h--
DROP INDEX MsItem. "index1"

--i--
DROP TABLE TransactionItem , MsItem

--j--
drop database TestDatabaseweek3edited







