SELECT last_name,
        salary,
        job_id,
        nvl(to_char(employees.manager_id), 'None') AS "Manager#",
        to_char(((salary + salary * nvl(commission_pct, 0) + 1000) * 12), '$99,999,000.00') AS "Annual Salary" 
    FROM employees INNER JOIN departments 
            ON departments.department_id = employees.department_id
    WHERE (commission_pct IS NULL OR upper(department_name) LIKE 'SALES') AND salary + salary * nvl(commission_pct, 0) + 1000 > 15000
    ORDER BY salary DESC;


SELECT *
    FROM employees;

SELECT *
    FROM departments;