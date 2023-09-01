--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees as e

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, dm.dept_no, d.dept_name
FROM department_manager as dm 
Inner JOIN employees as e ON e.emp_no = dm.emp_no 
Inner JOIN department as d ON dm.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_emp as de
Inner JOIN employees as e ON e.emp_no = de.emp_no 
Inner JOIN department as d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex 
FROM employees as e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.first_name, e.last_name  
FROM employees as e
Inner JOIN department_emp as de ON e.emp_no = de.emp_no
Inner JOIN department as d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees as e
Inner JOIN department_emp as de ON e.emp_no = de.emp_no
Inner JOIN department as d ON de.dept_no = d.dept_no
WHERE dept_name IN ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency
FROM employees as e
GROUP BY last_name
ORDER BY frequency DESC;
