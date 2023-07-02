create table Student (
StudentID char (5) primary key,
MajorID char (5),
StudentName varchar (100),
StudentGender varchar (10),
StudentDOB varchar (10),
StudentEmail varchar (100)
);

create table Major (
MajorID char (5) primary key,
MajorName varchar (100)
);

create table DetailEvent (
EventID char(5),
StudentID char(5),
constraint studentid_primary primary key (EventID, StudentID)
);

create table Event (
EventID char(5) primary key,
OrganizationID char(5),
StaffID char(5),
EventName varchar(100),
EventStartDate DATE,
EventEndDate DATE,
EventLocation varchar(100),
);

create table Organization (
OrganizationID char(5) primary key,
OrganizationName varchar(100),
OrganizationFoundedDate DATE,
OrganizationEmail varchar(100)
);