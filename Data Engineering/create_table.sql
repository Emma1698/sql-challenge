-- create 'title' table
Create table titles(
	title_id varchar(10) primary key,
	title varchar(10) not null
);

-- view titles table
select *
from titles;

-- Create 'employees' table
create table employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
		FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- view employees table
select *
from employees

-- create 'salaries' table
create table salaries(
	emp_no int primary key,
	foreign key(emp_no) references employees(emp_no),
	salary int not null
);

-- view salaries table
select *
from salaries

-- create 'departments' table
create table departments (
	dept_no varchar(10) primary key,
	dept_name varchar(50) not null
);

-- view departments table 
select *
from departments

-- create 'dept_emp' table
create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar (10) not null,
	foreign key (dept_no) references departments(dept_no)
);

-- view dept_emp table
select *
from dept_emp

-- Create 'dept_manager' table
create table dept_manager (
	dept_no varchar(10) not null,
	foreign key (dept_no) References departments(dept_no),
	emp_no INT PRIMARY KEY,
	foreign key (emp_no) References employees(emp_no)	
);

-- view dept_manager table
select *
from dept_manager