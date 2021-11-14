-- I want to know how many employees with each title were born after 1965-01-01.
 SELECT titles.title, count(*) AS employee_count FROM titles
 INNER JOIN employees emp ON titles.emp_no = emp.emp_no WHERE emp.birth_date > '1965-01-01'
 GROUP BY title ORDER BY employee_count ASC;

-- I want to know the average salary per title.
SELECT titles.title, AVG (sal.salary) AS average_salary FROM titles
INNER JOIN salaries sal ON titles.emp_no = sal.emp_no
GROUP BY title ORDER BY average_salary ASC;

-- How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT dept_name , SUM(salary) AS Salary FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE departments.dept_no = 'd001' AND
(salaries.from_date BETWEEN '1990-01-01' AND '1992-12-31') AND 
(salaries.to_date BETWEEN '1990-01-01' AND '1992-12-31') GROUP BY departments.dept_name;

