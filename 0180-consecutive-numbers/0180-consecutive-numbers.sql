

with following as

(
    select
    num,
    lead(num,1) over(order by id) as lead2,
    lead(num,2) over(order by id) as lead3
    from logs
)

select
DISTINCT num as ConsecutiveNums
from following
where num = lead2 and num = lead3