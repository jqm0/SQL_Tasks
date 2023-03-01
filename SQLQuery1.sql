create table department(
	dep_id INTEGER primary key,
	dep_name VARCHAR(20),
    dep_location VARCHAR(15),
);


create table salary_grade(
	grade INTEGER,
	min_salary INTEGER,
	max_salary INTEGER,
);
create table employees(
	emp_id INTEGER,

	emp_name VARCHAR(15),
	job_name VARCHAR(10),
	manager_id INTEGER,
	hire_date DATE,
	salary DECIMAL(10, 2),
	commission DECIMAL(7,2),
	dep_id INTEGER,
	Foreign key(dep_id) REFERENCES department(dep_id),
);

insert into department(dep_id,dep_name,dep_location)
Values
   (1001 , 'FINANCE' , 'SYDNEY'),
   (2001 ,'AUDIT' ,'MELBOURNE'),
   (3001 ,'MARKETING'  , 'PERTH'),
   (4001 ,'PRODUCTION' , 'BRISBANE');

insert into salary_grade(grade,min_salary,max_salary) 
values 
    ( 1 ,     800 ,    1300),
    ( 2 ,    1301 ,    1500),
    ( 3 ,    1501 ,    2100),
    ( 4 ,    2101 ,    3100),
    ( 5 ,    3101 ,    9999);

insert into employees(emp_id , emp_name , job_name  , manager_id , hire_date  , salary  , commission , dep_id)
values
 ( 68319 ,'KAYLING','PRESIDENT'  ,  null  ,'1991-11-18' ,6000.00, null,1001),
 ( 66928 ,'BLAZE'  ,'MANAGER'  ,  68319 ,'1991-05-01', 2750.00 , null,3001),
 ( 67832 ,'CLARE'  ,'MANAGER'  ,  68319 ,'1991-06-09', 2550.00 , null,1001),
 ( 65646 ,'JONAS'  ,'MANAGER'  ,  68319 ,'1991-04-02', 2957.00 , null,2001),
 ( 67858 ,'SCARLET','ANALYST'  ,  65646 ,'1997-04-19', 3100.00 , null,2001),
 ( 69062 ,'FRANK'  ,'ANALYST'  ,  65646 ,'1991-12-03', 3100.00 , null,2001),
 ( 63679 ,'SANDRIN','CLERK'  ,  69062 ,'1990-12-18',  900.00 , null,2001),
 ( 64989 ,'ADELYN' ,'SALESMAN'  ,  66928 ,'1991-02-20', 1700.00 , 400.00 ,3001),
 ( 65271 ,'WADE'   ,'SALESMAN'  ,  66928 ,'1991-02-22', 1350.00 , 600.00 ,3001),
 ( 66564 ,'MADDEN' ,'SALESMAN'  ,  66928 ,'1991-09-28', 1350.00 , 1500.00,3001),
 ( 68454 ,'TUCKER' ,'SALESMAN'  ,  66928 ,'1991-09-08', 1600.00 , 0.00 ,  3001),
 ( 68736 ,'ADNRES' ,'CLERK'  ,  67858 ,'1997-05-23', 1200.00 , null,2001),
 ( 69000 ,'JULIUS' ,'CLERK'  ,  66928 ,'1991-12-03', 1050.00 , null,3001),
 ( 69324 ,'MARKER' ,'CLERK'  ,  67832 ,'1992-01-23', 1400.00 , null,1001);

-- // ------------------------------------------------------------------ \\ 


 -- Q1 DONE													
SELECT * FROM employees;								
-- Q2 DONE
SELECT salary FROM employees;
-- Q3 DONE
SELECT DISTINCT job_name FROM employees;
-- Q4 DONE
SELECT emp_name, salary * 1.15 AS increased_salary FROM employees;
-- Q5 DONE
SELECT CONCAT(emp_name, ' & ', job_name) AS "Employee & Job" FROM employees;
-- Q6 DONE
SELECT 
    emp_id, 
    emp_name AS 'Employee Name', 
    salary, 
    CONVERT(VARCHAR(15), hire_date, 106) AS 'Hire Date (MMM DD, YYYY)'
FROM 
    employees
WHERE 
    DATENAME(MONTH, hire_date) + ' ' + CAST(DAY(hire_date) AS VARCHAR(2)) + ', ' + CAST(YEAR(hire_date) AS VARCHAR(4)) = 'February 22, 1991'
-- Q7 DONE
SELECT COUNT(*) FROM employees WHERE salary + COALESCE(commission, 0) * salary > 2200;
-- Q8 
SELECT DISTINCT job_name, dep_id
FROM employees;
-- Q9 Done 
SELECT * FROM employees WHERE dep_id != 2001;
-- Q10 Done
SELECT * 
FROM employees
WHERE YEAR(hire_date) < 1991;
-- Q11 Done
SELECT AVG(salary)
FROM employees
WHERE job_name = 'ANALYST';
-- Q12 DONE
SELECT * FROM employees WHERE emp_name LIKE 'B%' OR emp_name LIKE '%E';
-- Q13 DONE
SELECT * FROM employees e JOIN department d ON e.dep_id = d.dep_id WHERE d.dep_name LIKE 'B%' OR d.dep_name LIKE '%E';
-- Q14 
SELECT *
FROM employees e
JOIN department d
ON e.dep_id = d.dep_id
WHERE d.dep_location like 'F%' OR d.dep_location like '%N';

-- Q15 Done
SELECT *, department.dep_location, department.dep_name
FROM employees
JOIN department ON employees.dep_id = department.dep_id
WHERE employees.commission > employees.salary;
-- Q16
SELECT * FROM employees WHERE salary * 1.25 > 3000;
-- Q17
SELECT *
FROM employees
WHERE MONTH(hire_date) = 1;
-- Q18
SELECT CONCAT( em.emp_name,'  WORKS FOR  ',mn.emp_name) AS "EMP & MAN" FROM employees em, employees mn
WHERE em.manager_id = mn.emp_id;
-- Q19
SELECT * FROM employees WHERE job_name = 'CLERK';
-- Q20 Find employees with more than 27 years of experience
SELECT *
FROM employees
WHERE hire_date < 'jun 1, 1997';

-- Q21 Find employees with salary less than 3500
SELECT *
FROM employees
WHERE salary < 3500;

-- Q22 Find employee with designation 'ANALYST'
SELECT emp_name, job_name, salary
FROM employees
WHERE job_name = 'ANALYST';

-- Q23 Find employees who joined in 1991
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991;

-- Q24 Find employees who joined after 1991
SELECT *
FROM employees
WHERE hire_date > '1991-12-31';

-- Q25 Find employees who joined before 1st April 1991
SELECT emp_id, emp_name, hire_date, salary
FROM employees
WHERE hire_date < '1991-04-01';

-- Q26 Find employees who don't report to a manager
SELECT emp_name, job_name
FROM employees
WHERE manager_id IS NULL;

-- Q27 Find employees who joined on 1st May 1991
SELECT *
FROM employees
WHERE hire_date = '1991-05-01';

-- Q28 Find experience of employees under manager with ID 68319
SELECT emp_id, emp_name, salary , DATEDIFF(YEAR, hire_date, GETDATE()) AS experience 
FROM employees
WHERE manager_id = 68319;

-- Q29 Find employees earning more than 100 per day
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary / 30 > 100;

-- Q30 Find employees who retired after 31-Dec-99 and completed 8 years of service
