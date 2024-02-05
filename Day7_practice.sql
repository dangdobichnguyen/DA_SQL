--ex1: 
SELECT Name
FROM STUDENTS
WHERE Marks>75
ORDER BY RIGHT(Name,3),ID
--ex2: 
SELECT user_id,
CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2))) AS name
FROM Users
--ex3:
SELECT manufacturer,
'$' || ROUND(sum(total_sales)/1000000,0) || ' '|| 'million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC, manufacturer
--ex4: 
SELECT sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)=8 AND EXTRACT(YEAR FROM sent_date)=2022
GROUP BY(sender_id)
ORDER BY message_count DESC
LIMIT(2)
--ex5:
SELECT 
EXTRACT(MONTH FROM submit_date) as mth,product_id,
round(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date),product_id
ORDER BY mth,product_id
--ex6: 
SELECT tweet_id
FROM Tweets
WHERE length(content)>15
--ex7:
SELECT activity_date as day, 
COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date >= '2019-06-27' 
AND activity_date <= '2019-07-27' 
AND session_id>=1
GROUP BY activity_date
--ex8:
select
count(id) as number_employees
from employees
where extract(month from joining_date) between 1 and 7
and extract(year from joining_date)=2022
--ex9: 
select 
position ('a' IN first_name) as position
from worker
where first_name='Amitah'
--ex10:
select 
substring(title,length(winery)+2,4)
from winemag_p2
where country='Macedonia'
