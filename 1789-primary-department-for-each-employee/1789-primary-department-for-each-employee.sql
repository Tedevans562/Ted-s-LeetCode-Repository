# Write your MySQL query statement below
WITH flag_number AS
(
    SELECT employee_id,
            department_id,
            primary_flag,
            COUNT(*) OVER (partition by employee_id) AS number
    FROM Employee
)

SELECT employee_id, department_id
FROM flag_number
WHERE primary_flag = 'Y' OR number = 1