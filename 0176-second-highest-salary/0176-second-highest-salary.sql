# Write your MySQL query statement below
SELECT COALESCE(MAX(DISTINCT salary), null) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);