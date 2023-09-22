
-----SECOND LARGEST SALARY
WITH DATA AS (
select concat(e.EMPFNAME,' ', e.EMPLNAME) AS name,s.BASIC as basic,d.DEPTNAME as dept_name,
DENSE_RANK() OVER( ORDER BY s.BASIC DESC) AS rnk
FROM salary as s inner join EMPLOYEE as e on s.empcode= e.empcode
LEFT JOIN DEPARTMENT AS d on d.DEPTCODE = e.DEPTCODE
where d.DEPTNAME = 'IT')
SELECT name, basic, dept_name,rnk from DATA
where rnk =2


WITH DATA AS (
select s.BASIC as basic
FROM salary as s inner join EMPLOYEE as e on s.empcode= e.empcode
LEFT JOIN DEPARTMENT AS d on d.DEPTCODE = e.DEPTCODE
where d.DEPTNAME = 'IT' ORDER BY s.BASIC DESC LIMIT 1 OFFSET 2
)
SELECT concat(e.EMPFNAME,' ', e.EMPLNAME) AS name,s.BASIC as basic,d.DEPTNAME as dept_name
FROM salary as s inner join EMPLOYEE as e on s.empcode= e.empcode
LEFT JOIN DEPARTMENT AS d on d.DEPTCODE = e.DEPTCODE
where d.DEPTNAME = 'IT' AND s.BASIC IN (SELECT BASIC FROM DATA)

WITH CTX_TABLE AS (
SELECT e.EmpCode,e.EmpFName,e.DeptCode, sum(s.basic + s.additions - s.deductions),
DENSe_RANK() OVER (PARTITION BY e.EmpCode  by ORDER BY s.basic desc) AS rnk
from SALARY s inner join EMPLOYEE e on s.EmpCode = e.EmpCode
)
select e.EmpFName,d.DeptCode,d.DeptName,e.rnk,e.basic 
from CTX_TABLE e inner join DEPARTMENT as d on e.DeptCode = d.DeptCode

-- UPDATE COLUMN
UPDATE  PUBLIC.EMPLOYEE SET GENDER = (CASE WHEN GENDER = 'female' THEN 'male' WHEN GENDER = 'male' THEN 'female' ELSE GENDER END);


