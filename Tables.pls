

-- Create the "departments" table
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100)
);

-- Create the "employees" table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department_id NUMBER,
    salary NUMBER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert data into the "departments" table
INSERT INTO departments (department_id, department_name) VALUES (101, 'IT');
INSERT INTO departments (department_id, department_name) VALUES (102, 'HR');
INSERT INTO departments (department_id, department_name) VALUES (103, 'Finance');
INSERT INTO departments (department_id, department_name) VALUES (104, 'Marketing');
INSERT INTO departments (department_id, department_name) VALUES (105, 'Sales');


-- Insert data into the "employees" table
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (1, 'Byiringiro', 'Christian', 101, 50000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (2, 'Alex', 'Smith', 102, 60000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (3, 'Bob', 'Johnson', 101, 55000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (4, 'Alice', 'Williams', 103, 70000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (5, 'Charlie', 'Brown', 101, 62000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (6, 'David', 'Jones', 103, 80000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (7, 'Eva', 'Miller', 104, 75000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (8, 'Frank', 'Taylor', 102, 58000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (9, 'Grace', 'Anderson', 105, 67000);
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES (10, 'Harry', 'Brown', 104, 72000);

