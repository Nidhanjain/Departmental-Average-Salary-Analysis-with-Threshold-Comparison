create database if not exists employee_salary;
use employee_salary;

create table if not exists department_table (
  department_id int primary key auto_increment,
  department_name varchar(50)
);

create table if not exists employees_table (
  employee_id int primary key auto_increment,
  name varchar(50),
  department_id int,
  salary decimal(10,2),
  foreign key (department_id) references department_table(department_id)
);

insert into department_table (department_id, department_name) values
  (1, 'Marketing'),
  (2, 'Research'),
  (3, 'Development');

insert into employees_table (employee_id, name, department_id, salary) values
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

select
  d.department_name as DepartmentName,
  avg(e.salary) as AverageSalary,
  count(e.employee_id) as NumberOfEmployees
from employees_table e
join department_table d on e.department_id = d.department_id
group by d.department_name
having avg(e.salary) > (select avg(salary) from employees_table);
