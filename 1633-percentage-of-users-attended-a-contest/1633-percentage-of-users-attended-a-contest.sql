# Write your MySQL query statement below
SELECT contest_id, 
ROUND(COUNT(DISTINCT r.user_id)/ (SELECT COUNT(DISTINCT user_id) FROM users) *100, 2) AS percentage
FROM users u
JOIN register r ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC