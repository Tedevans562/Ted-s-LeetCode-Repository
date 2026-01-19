# Write your MySQL query statement below
WITH first AS 
(
    SELECT a.player_id,
        MIN(a.event_date) AS first_login
    FROM Activity a
    GROUP BY a.player_id
)

, consec AS 
(
    SELECT COUNT(a.player_id) AS num_consecutive_logs
    FROM first f
    JOIN Activity a ON f.player_id = a.player_id
    AND f.first_login = DATE_SUB(a.event_date, INTERVAL 1 DAY)
)   


SELECT 
ROUND(
    (SELECT c.num_consecutive_logs FROM consec c)
    / (SELECT COUNT(f.player_id) FROM first f)
  , 2) AS fraction;