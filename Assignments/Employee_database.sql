-- CREATE DATABASE EmployeeManagementDB;
USE EmployeeManagementDB;

-- CREATE TABLE departments (
--     department_id INT PRIMARY KEY,
--     department_name VARCHAR(50) NOT NULL
-- );

-- INSERT INTO departments (department_id, department_name)
-- VALUES
--     (1, 'Human Resources'),
--     (2, 'Finance'),
--     (3, 'Marketing'),
--     (4, 'IT'),
--     (5, 'Operations');

-- CREATE TABLE employees (
--     employee_id INT PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     hire_date DATE NOT NULL,
--     department_id INT,departmentsdepartment_id
--     salary DECIMAL(10, 2) CHECK (salary >= 0),
--     FOREIGN KEY (department_id) REFERENCES departments(department_id)
-- );

-- INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, department_id, salary)
-- VALUES
--     (1, 'Pratham', 'Chopra', 'pratham.chopra@example.com', '2023-01-15', 1, 60000.00),
--     (2, 'Ranvir', 'Mehta', 'ranvir.mehta@example.com', '2022-07-20', 2, 75000.00),
--     (3, 'Neell', 'Ambere', 'neell.ambere@example.com', '2023-03-10', 3, 80000.00),
--     (4, 'Dwaj', 'Ranka', 'dwaj.ranka@example.com', '2022-05-05', 4, 90000.00),
--     (5, 'Abrar', 'Amhed', 'abrar.amhed@example.com', '2023-02-01', 5, 70000.00);



-- ALTER TABLE Employees
-- ADD Gender VARCHAR(10) NOT NULL;

-- ALTER TABLE Employees MODIFY last_name VARCHAR(25);

-- ALTER TABLE Employees DROP Gender;
-- describe Employees;

-- truncate TABLE Employees;
-- describe Employees;
-- -- SELECT * FROM Employees;

-- DROP TABLE Employees; 
show tables