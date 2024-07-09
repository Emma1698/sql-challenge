-- List the employee number, last name, first name, sex, and salary of each employee.
select emp_no, last_name, first_name, sex,
	(select salaries.salary
	from salaries
	where employees.emp_no = salaries.emp_no) AS "Salary"
from employees;

-- List the first name, last name, and hire date for the employees who were hired in 1986
select emp_no, last_name, first_name, sex
from employees
where date_part('year', hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number,last name, and first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
inner join departments d
on dm.dept_no = d.dept_no
inner join employees e
on dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, de.dept_no,
	(select d.dept_name
	from departments d
	where de.dept_no = d.dept_no)
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
select de.emp_no, e.last_name, e.first_name
from dept_emp de
inner join employees e
on de.emp_no = e.emp_no
where de.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name,
	(select d.dept_name
	from departments d
	where de.dept_no = d.dept_no)
from dept_emp de
inner join employees e
on de.emp_no = e.emp_no
where de.dept_no = 'd007'
or de.dept_no = 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name, count(last_name) as "Count of Last Name"
from employees
group by last_name
order by "Count of Last Name" desc;
