Create database student_affairs;
use student_affairs;

-- Creating The tables.

create table Student (
Stud_ID int primary key,
GPA decimal (3,2),
Fname varchar(20),
Mname varchar(20),
Lname varchar(20),
Email varchar(30),
Gender varchar(5),
National_ID int,
Birth_Date date,
PhoneNum varchar(10),
Dep_name varchar(10),
Advisor_ID int
);
desc Student;

create table Course (
Course_ID varchar(10) primary key,
Hours int,
Section_Num int,
Dep_name varchar(10)
);
desc Course;

create table Department (
Dep_name varchar(10) primary key,
Location varchar(10)
);
desc Department;

create table Acc_Advisor (
Advisor_ID int primary key,
PhoneNum varchar(10),
name varchar(30)
);
desc Acc_Advisor;

create table Acc_services_Emp (
Employee_ID int primary key,
PhoneNum varchar(10),
name varchar(30)
);
desc Acc_services_Emp;

create table Parent (
Stud_ID int,
PhoneNum varchar(10),
name varchar(30),
relationship varchar(10),
Primary key(name,Stud_ID)
);
desc Parent;

create table Stud_ActivatesDirector (
Dep_name varchar(10),
PhoneNum varchar(10),
name varchar(30),
Primary key(name,Dep_name)
);
desc Stud_ActivatesDirector;

create table Serves (
Employee_ID int,
Stud_ID int,
Primary key(Stud_ID,Employee_ID)
);
desc Serves;

create table Studies (
Course_ID varchar(10),
Stud_ID int,
Primary key(Stud_ID,Course_ID)
);
desc Studies;

create table Communicate (
Employee_ID int,
Advisor_ID int,
Primary key(Advisor_ID ,Employee_ID )
);
desc Communicate;

-- Establishing constraints using foreign keys between tables

Alter table student add constraint fk1 foreign key(Dep_name) references department(Dep_name);
Alter table student add constraint fk2 foreign key(Advisor_ID) references Acc_Advisor(Advisor_ID);

Alter table Course add constraint fk3 foreign key(Dep_name) references department(Dep_name);

Alter table Parent add constraint fk4 foreign key(Stud_ID) references Student(Stud_ID);

Alter table Stud_ActivatesDirector add constraint fk5 foreign key(Dep_name) references department(Dep_name);

Alter table Serves add constraint fk6 foreign key(Employee_ID) references Acc_services_Emp(Employee_ID);
Alter table Serves add constraint fk7 foreign key(Stud_ID) references Student(Stud_ID);

Alter table Studies add constraint fk8 foreign key(Stud_ID) references Student(Stud_ID);
Alter table Studies add constraint fk9 foreign key(Course_ID) references Course(Course_ID);

Alter table Communicate add constraint fk10 foreign key(Employee_ID) references Acc_services_Emp(Employee_ID);
Alter table Communicate add constraint fk11 foreign key(Advisor_ID) references Acc_Advisor(Advisor_ID);

-- Inserting values into each table.

insert into Department values
('CSCE', 'Hail'),
('ENG' , 'Hail'),
('IC' , 'Gazalah'); 

insert into Acc_Advisor values
(1, '0505951616' ,'Ahmad Hassan'),
(2 ,'0507795161' ,'Khaled hamad'),
(3 ,'0577230512' ,'Salem Abdullah');

insert into Acc_services_Emp values
(1, '01657321' ,'Mohammed'),
(2 ,'01643423' ,'Hamad'),
(3 ,'01634389' ,'Abdullah'); 

insert into Student values
(1 , 2.9 ,'Mohammed', 'Khaled', 'Altamimi','S201901@Uni.com', 'Male', 101201221,'2001-05-02','0599853949','IC',1),

(2 ,3.96 ,'Nawaf', 'Ibrahim', 'Alfaqih', '201902@Uni.com','Male', 1155481928,'2001-11-05', '0505161655','CSCE',2),

(3 ,'1.2' ,'Abdullah','Hassan','Ali','201903@Uni.com','Male', 1212334545, '2000-02-01', '0539338288','ENG', 3);

insert into Course values
('ICS 102', 4 ,2002 , 'CSCE'),
( 'ENGL 214' ,3, 3018 ,'ENG'),
( 'IC 104' ,2 , 5016 ,'IC');

insert into Parent values
(1, '0503134241' ,'Khalid' , 'father'),
(2, '0557558322' ,'Ibrahim' , 'brother'),
(3, '0576543268' ,'Hassan' , 'uncle');  

insert into Stud_ActivatesDirector values
('CSCE', '0503134241' ,'Ali Khalid' ),
('ENG', '0557558322' ,'Ibrahim Ahmad'),
('IC', '0576543268' ,'Hassan Ali'); 

insert into Serves values
(2, 1),
(1 ,3),
(3 ,1);

insert into Studies values
('ICS 102', 1),
( 'ENGL 214' ,3),
('IC 104' ,2);

insert into Communicate values
(2, 1),
(1 ,3),
(3 ,1);

-- Displaying all the tables

Select * from Department;
Select * from Acc_Advisor;
Select * from Acc_services_Emp;
Select * from Student;
Select * from Course;
Select * from Parent;
Select * from Stud_ActivatesDirector;
Select * from Serves;
Select * from Studies;
Select * from Communicate;  