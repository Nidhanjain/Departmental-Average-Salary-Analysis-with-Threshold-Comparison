CREATE DATABASE employees_salary;
USE employees_salary;

CREATE TABLE employees_table (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  department_id INT,
  salary DECIMAL(10,2),
  FOREIGN KEY (department_id) REFERENCES department_table(department_id)
);

INSERT INTO employees_table (employee_id, name, department_id, salary)
VALUES
(1, 'John Doe', 1, 60000.00),
(2, 'Jane Smith', 1, 70000.00),
(3, 'Alice Johnson', 1, 65000.00),
(4, 'Bob Brown', 1, 75000.00),
(5, 'Charlie Wilson', 1, 80000.00),
(6, 'Eva Lee', 2, 70000.00),
(7, 'Michael Clark', 2, 75000.00),
(8, 'Sarah Davis', 2, 80000.00),
(9, 'Ryan Harris', 2, 85000.00),
(10, 'Emily White', 2, 90000.00),
(11, 'David Martinez', 3, 95000.00),
(12, 'Jessica Taylor', 3, 100000.00),
(13, 'William Rodriguez', 3, 105000.00);

CREATE TABLE department_table (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50)
);

INSERT INTO department_table (department_id, department_name)
VALUES
(1, 'Marketing'),
(2, 'Research'),
(3, 'Development');

Select 
d.department_name as DepartmentName,
AVG(e.salary) as AverageSalary,
(e.employee_id) as NumberOfEmployees
FROM employees_table 
JOIN department_table d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM employees_table);