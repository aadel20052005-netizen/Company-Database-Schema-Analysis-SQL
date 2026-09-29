create table department(
department_id serial primary key,
department_name varchar(100) not null
);

create table employee(
employee_id serial primary key,
employee_name varchar(100) not null,
employee_email varchar(150) unique,
employee_hiring_date date,
employee_salary decimal(10, 2),
department_id int,
manager_id int,
constraint fk_employee_department foreign key (department_id) references department(department_id),
constraint fk_employee_manager foreign key (manager_id) references employee(employee_id)
);

create table employee_profile(
employee_id int primary key,
employee_phone varchar(20),
employee_address varchar(500),
employee_emergency_contact varchar(20),
constraint fk_profile_employee foreign key (employee_id) references employee(employee_id)
);

create table project(
project_id serial primary key,
project_name varchar(100) not null,
project_start_date date,
project_end_date date
);

create table employee_project(
project_id int,
employee_id int,
role_in_project varchar(100),
primary key (project_id, employee_id),

constraint fk_employee_project_project foreign key (project_id) references project (project_id),
constraint fk_employee_project_employee foreign key (employee_id) references employee (employee_id)
);


INSERT INTO department (department_name)
VALUES
('IT'),
('Human Resources'),
('Finance'),
('Marketing');

SELECT *
FROM department;

INSERT INTO employee (
    employee_name,
    employee_email,
    employee_hiring_date,
    employee_salary,
    department_id,
    manager_id
)
VALUES (
    'Ahmed Ali',
    'ahmed@company.com',
    '2020-01-15',
    30000,
    1,
    NULL
);

select * from employee;



INSERT INTO employee (
    employee_name,
    employee_email,
    employee_hiring_date,
    employee_salary,
    department_id,
    manager_id
)
VALUES
(
    'Sara Mohamed',
    'sara@company.com',
    '2022-03-10',
    18000,
    1,
    1
),
(
    'Omar Hassan',
    'omar@company.com',
    '2023-06-20',
    16000,
    1,
    1
);

INSERT INTO employee (
    employee_name,
    employee_email,
    employee_hiring_date,
    employee_salary,
    department_id,
    manager_id
)
VALUES
(
    'Mona Adel',
    'mona@company.com',
    '2021-09-01',
    19000,
    2,
    1
);



INSERT INTO employee_profile
VALUES
(
    1,
    '01011111111',
    'Cairo',
    '01222222222'
),
(
    2,
    '01033333333',
    'Giza',
    '01144444444'
),
(
    3,
    '01255555555',
    'Cairo',
    '01066666666'
);


select * from employee_profile;


INSERT INTO project (
    project_name,
    project_start_date,
    project_end_date
)
VALUES
(
    'E-Commerce System',
    '2026-01-01',
    '2026-06-30'
),
(
    'Mobile Application',
    '2026-02-01',
    '2026-08-30'
),
(
    'AI Recommendation System',
    '2026-03-01',
    '2026-12-31'
);

select * from project;

INSERT INTO employee_project
VALUES
(1, 1, 'Project Manager'),
(1, 2, 'Frontend Developer'),
(1, 3, 'Backend Developer'),
(2, 2, 'Mobile Developer'),
(2, 3, 'Backend Developer'),
(3, 1, 'Project Manager'),
(3, 3, 'ML Engineer');


select * from employee_project;



select * from employee;


select * from department;


select employee_name, employee_email, employee_hiring_date, department_name
from employee e join department d on e.department_id = d.department_id;



select employee_name, employee_hiring_date, employee_salary, project_name, 
project_start_date, project_end_date, role_in_project
from employee e join employee_project ep on e.employee_id = ep.employee_id
join project p on p.project_id = ep.project_id;




select employee_name, employee_salary, project_name, project_start_date, project_end_date, 
role_in_project, employee_phone, employee_address, department_name
from employee e  join employee_project eprj on e.employee_id = eprj.employee_id
join project p on p.project_id = eprj.project_id
join employee_profile eprf on e.employee_id = eprf.employee_id
join department d on d.department_id = e.department_id
where e.employee_id = 3