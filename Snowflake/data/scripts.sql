--There are three tables in our Database (DEPARTMENT,EMPLOYEE & SALARY).
--DEPARTMENT(DeptCode,DeptName,Location).
--EMPLOYEE(EmpCode,EmpFName,EmpLName,Email,PhoneNo,Job,Manager,HireDate,DeptCode).
--SALARY(EmpCode,Basic,Additions,Deductions).
--Please Use these tables to write your query.


CREATE TABLE IF NOT EXISTS public."DEPARTMENT"
(
    DeptCode character varying,
	DeptName character varying,
	Location character varying
);

CREATE TABLE IF NOT EXISTS public."EMPLOYEE"
(
    EmpCode character varying,
	EmpFName character varying,
	EmpLName character varying,
	Email character varying,
	PhoneNo character varying,
	Job character varying,
	Manager character varying,
	HireDate Date,
	DeptCode character varying
	
);


CREATE TABLE IF NOT EXISTS public."SALARY"
(
    EmpCode character varying,
	Basic numeric(10,2),
	Additions numeric(10,2),
	Deductions numeric(10,2)
	
);

INSERT INTO public."DEPARTMENT"(
	deptcode, deptname, location)
	VALUES ('101', 'IT', 'Noida'),
	('102', 'HR', 'Delhi'),
	('103', 'Sales', 'Noida'),
	('104', 'Marketing', 'Noida');
	


INSERT INTO public."EMPLOYEE"(
empcode, empfname, emplname, email, phoneno, job, manager, hiredate, deptcode)
VALUES ('001', 'Taukir', 'Khan', 'taukir@gmail.com', '8010339935', 'Data Engineer','Santosh', '2021-10-27','101'),
('002', 'Saheba', 'pathan', 'saheba@gmail.com', '3020339935', 'DevOps','Santosh', '2022-10-27','101'),
('003', 'Zeenat', 'khan', 'zeenat@gmail.com', '2015339935', 'Tester','Santosh', '2022-06-20','101'),
('004', 'Sab', 'Saikh', 'taukir@gmail.com', '7015339935', 'Recruiter','Anajan', '2022-07-20','102'),
('005', 'Sonu', 'sona', 'sonu@gmail.com', '9115339935', 'Staffing','Anajan', '2020-07-20','102'),
('006', 'Rahul', 'cho', 'rahul@gmail.com', '8915339935', 'advertiser','Hema', '2020-02-20','103'),
('007', 'lavan', 'reddy', 'lavan@gmail.com', '2115339935', 'calling','Hema', '2021-02-20','103');

INSERT INTO public."EMPLOYEE"(
empcode, empfname, emplname, email, phoneno, job, manager, hiredate)
VALUES 
('008', 'Narayanam', 'Desik', 'narayanam@gmail.com', '885339935', 'Displaying','Hema', '2023-02-20');


INSERT INTO public."SALARY"(
	empcode, basic, additions, deductions)
	VALUES ('001', 10000, 500, 0),
	('002', 9000, 200, 0),
	('003', 8000, 300, 0),
	('004', 6000, 500, 0),
	('005', 8000, 300, 0),
	('006', 15000, 2000, 0),
	('007', 10000, 1500, 500);
	
	