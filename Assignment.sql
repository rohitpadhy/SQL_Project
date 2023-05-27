# First we need to create a schema to run the provided data set and use it
create schema employee;
use employee;



-- 1. SQL query to find the salaries of all employees
select
first_name,
last_name,
salary
from employees
limit 0,999999;


-- 2. SQL query to find the unique designations of the employees. Return job name.
SELECT job_title as job_name 
FROM jobs
group by job_title;
# here we have used group by function to obtain the disticnt jobs


-- 3. SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
 SELECT first_name
      , last_name
      ,CONCAT('$', ( salary*1.15 ) ) AS `Number of dollars`
   FROM employees;
# here we have multiplied each entry of salary by 1.15 to increase it by 15% and used concat to add dollar symbol


-- 4. SQL query to list the employee's name and job name as a format of "Employee & Job"
select concat(first_name ,last_name , ' : ' , job_title)
 as employee_job from employees , jobs
 where jobs.job_id = employees.job_id;
 # here we have used concat to join two columns from different table,  used where clause to match job_id of jobs table to corresponding job_id of employee table


-- 5. SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT employee_id,
       First_name,
       last_name,
       salary,
       date_format(hire_date,'%M %D, %Y')
FROM employees;
#here we have used date_format to change the format of the date


-- 6 . SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select 
first_name,
last_name,
concat(first_name,last_name) as Employee_name,
length(concat(first_name,last_name)) as employee_name_length 
from employees;
# here first we joined first and last name without any space then used length function the calculate length and used as function to name it 


-- 7. SQL query to find the employee ID, salary, and commission of all the employees. 
select
employee_id,
salary,
(commission_pct*salary) as commision
from employees
limit 0 ,9999;
#Here we multiplies commision percentage with salary to calculate the commision money


-- 8. SQL query to find the unique department with jobs. Return department ID, Job name. 
SELECT   
employees.department_id,
job_title as job_name
FROM employees , jobs , departments
where jobs.job_id = employees.job_id and departments.department_id= employees.department_id
GROUP BY  department_name;
# here we have used select statement to obtain required columns , where clause to match corresponding id's in different tables and used group by to find unique job names


-- 9 . SQL query to find those employees who joined before 1991. Return complete information about the employees.
select * from employees
where hire_date < '1991-01-01';
# here we hve used where clause to obtain the result.


-- 10. SQL query to compute the average salary of those employees who work as ‘shipping clerk’. Return average salary.
select 
avg(salary) as average_salary
from employees
where Job_id = 'SH_CLERK';
# here we have used avg to calculate average and where clause to specify job_id