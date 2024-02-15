--ex1: 
WITH duplicate_companies AS 
(SELECT company_id, title, description, 
COUNT(*)
FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(*)>1)
SELECT COUNT(*)
FROM duplicate_companies
  
--ex2: 

--ex3:
WITH member_count AS
(SELECT policy_holder_id,
COUNT(case_id) 
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3)
SELECT COUNT(policy_holder_id) as memmer_count 
FROM member_count
  
--ex4: 
SELECT a.page_id
FROM pages AS a 
LEFT JOIN page_likes AS b 
ON a.page_id=b.page_id
WHERE b.page_id IS NULL 
--ex5: 

--ex: 
SELECT SUBSTRING(trans_date,1,7) AS month, country, 
COUNT(id) AS trans_count, 
SUM(state = 'approved') AS approved_count, 
SUM(amount) AS trans_total_amount, 
SUM(CASE
WHEN state = 'approved' THEN amount ELSE 0 
END) AS approved_total_amount
FROM Transactions
GROUP BY month, country

--ex8: 
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product)
--ex9: 
SELECT DISTINCT emp.employee_id
FROM employees AS emp
LEFT JOIN employees AS mng 
ON emp.manager_id=mng.employee_id
WHERE emp.manager_id IS NOT NULL
AND emp.salary < 30000
AND mng.employee_id IS NULL
ORDER BY emp.employee_id 
  
--ex10: trùng câu 1
  
--ex11:
WITH new1 AS
(SELECT U.name as results, count(U.name) FROM MovieRating AS R
LEFT JOIN Movies M ON R.movie_id = M.movie_id
LEFT JOIN Users U ON R.user_id = U.user_id
GROUP BY 1
ORDER BY count(U.name) DESC, U.name ASC
LIMIT 1),
new2 AS
(SELECT M.title AS title, avg(R.rating) AS avg_rating FROM MovieRating AS R
LEFT JOIN Movies M ON R.movie_id = M.movie_id
LEFT JOIN Users U ON R.user_id = U.user_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 1
ORDER BY avg_rating DESC, title ASC
LIMIT 1)
SELECT results FROM new1
UNION ALL 
SELECT title FROM new2;

--ex12:
WITH new AS 
(SELECT requester_id AS id FROM RequestAccepted
UNION ALL 
SELECT accepter_id AS id FROM RequestAccepted)
SELECT id,
COUNT(*) AS num FROM new
GROUP BY id
ORDER BY num DESC
LIMIT 1
