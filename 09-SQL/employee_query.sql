
-- check data count after import

select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from employee;
select count(*) from salaries;
select count(*) from titles;


-- List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sl.salary
from employee as emp 
join salaries as sl
    on sl.emp_no = emp.emp_no
order by emp.emp_no;

-- List employees who were hired in 1986.

select emp_no, last_name, first_name, hire_date
from employee
where extract(year from hire_date) = '1986'
order by emp_no;


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

select distinct dept.dept_no, dept.dept_name, emp.emp_no, 
emp.last_name, emp.first_name, titles.from_date, titles.to_date
from employee as emp
join dept_emp as emp_dept
  	on emp_dept.emp_no = emp.emp_no
join departments as dept
  	on emp_dept.dept_no = dept.dept_no
join titles
	on emp.emp_no = titles.emp_no
where titles.title = 'Manager'
order by dept_name;
	
 
-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
join dept_emp as emp_dept
    on emp_dept.emp_no = emp.emp_no
join departments as dept
    on emp_dept.dept_no = dept.dept_no
order by emp.emp_no;


-- List all employees whose first name is "Hercules" and last names begin with "B."

select emp_no, last_name, first_name
from employee
where first_name='Hercules'
and last_name like 'B%'
order by emp_no;

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
join dept_emp as emp_dept
    on emp_dept.emp_no = emp.emp_no
join departments as dept
    on emp_dept.dept_no = dept.dept_no
where dept.dept_name='Sales'
order by emp_no;

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
join dept_emp as emp_dept
    on emp_dept.emp_no = emp.emp_no
join departments as dept
    on emp_dept.dept_no = dept.dept_no
where dept.dept_name in ('Sales', 'Development'); 


-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select count(*) as emp_count, last_name
from employee
group by last_name
order by emp_count desc;