/*exercise 1*/

SELECT table_name, table_rows
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'employees';

SELECT SUM(TABLE_ROWS)
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_SCHEMA = 'employees';

/*exercise 2*/
SELECT * FROM `employees` where first_name = "Mark"

/*exercise3*/
SELECT * FROM `employees` where employees.first_name = "Eric" and employees.last_name LIKE "A%"

/*exercise4*/

SELECT count(`employees`.`emp_no`) FROM employees where employees.hire_date BETWEEN "1990-01-01" and "2020-07-09";

SELECT COUNT(`employees`.`emp_no`)FROM employees where employees.hire_date BETWEEN "1990-01-01" and NOW();

SELECT * FROM employees where employees.hire_date BETWEEN "1990-01-01" and NOW();

/*exercise 5*/

SELECT count(`employees`.`emp_no`) FROM employees where employees.hire_date BETWEEN "1990-01-01" and "1997-12-31";
SELECT * FROM employees where employees.hire_date BETWEEN "1990-01-01" and "1997-12-31";

/*exercise 6*/

SELECT * FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE salaries.salary > 75000
SELECT count(employees.emp_no) from employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE salaries.salary > 70000; 


/* exercise 7*/

SELECT * FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE from_date BETWEEN "1992-01-01" and NOW() AND to_date = "9999-01-01"

/* exercise 8*/

SELECT * FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN salaries ON employees.emp_no = salaries.emp_no 
WHERE departments.dept_no = "d002" AND salaries.salary > 75000 AND dept_emp.from_date BETWEEN "1985-01-01" and NOW() AND dept_emp.to_date = "9999-01-01";

/*exercise 9*/

SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary, titles.to_date FROM employees 
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN salaries ON employees.emp_no = salaries.emp_no 
WHERE titles.to_date = "9999-01-01";

/*exercise 10*/

SELECT * from titles
where titles.title = "manager";

SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary, titles.to_date, departments.dept_name FROM employees 
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN salaries ON employees.emp_no = salaries.emp_no 
JOIN dept_emp ON  dept_emp.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_emp.dept_no
WHERE titles.to_date = "9999-01-01" and titles.title = "manager";


/*bonus:*/
SELECT * FROM `employees` JOIN titles ON employees.emp_no = titles.emp_no JOIN salaries ON employees.emp_no = salaries.emp_no JOIN dept_emp ON dept_emp.emp_no = employees.emp_no 
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no join departments ON departments.dept_no = dept_emp.dept_no


/*extra:*/
SELECT dept_emp.dept_no from dept_emp where (select COUNT(dept_emp.emp_no) from dept_emp)


