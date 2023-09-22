--There are three tables in our Database (DEPARTMENT,EMPLOYEE & SALARY).
--DEPARTMENT(DeptCode,DeptName,Location).
--EMPLOYEE(EmpCode,EmpFName,EmpLName,Email,PhoneNo,Job,Manager,HireDate,DeptCode).
--SALARY(EmpCode,Basic,Additions,Deductions).
--Please Use these tables to write your query.


-- 1: find out duplicate email address from emplyee table;
select email,count(*) from  public."EMPLOYEE"
group by email having count(*) >1

--2: Display DeptName, and number of employee in each department.
-- output:  DeptName, emp_count
select dpt.deptname,count(*) emp_count from public."DEPARTMENT" as dpt
inner join public."EMPLOYEE" emp on dpt.deptcode = emp.deptcode
group by  dpt.deptname order by emp_count desc
--CASE-1: IF department exist but no employee assign, then it will count that department as 1
select dpt.deptname,COUNT(*) emp_count from public."DEPARTMENT" as dpt
LEFT join public."EMPLOYEE" emp on dpt.deptcode = emp.deptcode
group by  dpt.deptname order by emp_count desc

--3 find the department_name and  total spend salary on employee  by each department.
SELECT dpt.deptname,SUM(sal.basic + sal.additions - sal.deductions) as total
from public."SALARY" as sal left join public."EMPLOYEE" as emp
on sal.empcode = emp.empcode
left join  public."DEPARTMENT" as dpt on dpt.deptcode = emp.deptcode
group by dpt.deptname order by total desc

-- find second largest salary of employee

select * from(
SELECT *,
DENSE_RANK() OVER (ORDER BY emp.total DESC) as rnk
FROM (
SELECT emp.empcode,emp.empfname, emp.emplname,
SUM(sal.basic + sal.additions - sal.deductions) OVER (PARTITION BY emp.empcode) total
from public."SALARY" as sal 
left join public."EMPLOYEE" as emp
on sal.empcode = emp.empcode
) emp
) fn
where rnk =2