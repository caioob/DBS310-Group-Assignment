-- Task 3
SELECT last_name AS "Last Name",
        salary AS "Salary",
        job_id AS "Job ID",
        nvl(to_char(employees.manager_id), 'None') AS "Manager#",
        to_char(((salary + salary * nvl(commission_pct, 0) + 1000) * 12), '$99,999,000.00') AS "Annual Salary" 
    FROM employees INNER JOIN departments 
            ON departments.department_id = employees.department_id
    WHERE (commission_pct IS NULL OR upper(department_name) LIKE 'SALES') AND salary + salary * nvl(commission_pct, 0) + 1000 > 15000
    ORDER BY salary DESC;

-- Task 5
SELECT last_name AS "Last Name",
        salary AS "Salary",
        job_id AS "Job ID"
    FROM employees LEFT OUTER JOIN departments
            ON employees.department_id  = departments.department_id
        LEFT OUTER JOIN locations
            ON departments.location_id = locations.location_id
    WHERE country_id != 'US' AND job_id != 'AD_VP' AND job_id != 'AD_PRES' AND salary >(
                                                                                        SELECT max(minimum)
                                                                                            FROM (
                                                                                                    SELECT min(salary) AS minimum
                                                                                                        FROM employees
                                                                                                        GROUP BY department_id
                                                                                                        HAVING country_id != 'US' AND job_id != 'AD_VP'
                                                                                                 )    
                                                                                     );

