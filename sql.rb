# https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
# two independent tables
<<-SQL
select case when grade < 8 then NULL else name end, grade, marks
from students, grades
where marks between min_mark and max_mark
order by grade desc, name asc
SQL

# https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
<<-SQL
select h.hacker_id, name, count(challenge_id) 
from hackers h 
join challenges c on c.hacker_id=h.hacker_id
group by h.hacker_id, name 
-- finding those with max counts
having count(challenge_id) in (
    select max(counter) 
    from (
        select count(challenge_id) counter 
            from challenges 
            group by hacker_id) t1
    ) 

-- finding those with unique counts 
OR count(challenge_id) in (
   select counter from (
        select count(challenge_id) counter 
            from challenges 
            group by hacker_id) t2
    group by counter
    having count(counter)=1
    ) 

order by 3 desc, 1
SQL