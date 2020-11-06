
--showing the tables
select * from "Department"
select * from "Dept_emp"
select * from "Dept_manager"
select * from "Employees"
select * from "Salaries"
select * from "Titles"

--Q1) list employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary  
from "Employees" e inner join "Salaries" s
on e.emp_no = s.emp_no


--Q2) list first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date from "Employees"
where hire_date >= '1986-01-01T00:00:00' and hire_date < '1987-01-01T00:00:00'


--Q3) list the manager of each departmnet, department number, department name, manager's employee number, last name, first, name
select dm.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name from
"Dept_manager" dm inner join "Department" d on dm.dept_no = d.dept_no 
inner join "Dept_emp" de on dm.emp_no = de.emp_no 
inner join "Employees" e on de.emp_no = e.emp_no


--Q4) list the department of each employees, employee number, last name, first name, and department name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e inner join "Dept_emp" de on e.emp_no = de.emp_no
inner join "Department" d on d.dept_no = de.dept_no


--Q5) list first name, last name, and sex for employees whose first name "Hercules" and last name begin with "B"
select first_name, last_name, sex from "Employees"
where first_name = 'Hercules' and last_name like 'B%'


--Q6) list all employees in the Sales Deparment, including their employee number, last name, first name, and department name
select d.dept_name, de.emp_no, e.last_name, e.first_name from "Employees" e 
inner join "Dept_emp" de on e.emp_no = de.emp_no
inner join "Department" d on d.dept_no = de.dept_no
where dept_name = 'Sales'


--Q7) list all employees in Sales and Development departments, employee number, last name, first name and department name 
select d.dept_name, de.emp_no, e.last_name, e.first_name from "Employees" e 
inner join "Dept_emp" de on e.emp_no = de.emp_no
inner join "Department" d on d.dept_no = de.dept_no
where dept_name = 'Sales' or dept_name = 'Development'


--Q8) list the frequency count of employee last name in descending order 
select last_name, count(*) as frequency
from "Employees" 
group by last_name 
order by frequency desc



