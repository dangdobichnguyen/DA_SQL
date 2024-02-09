--ex1:
SELECT b.CONTINENT,
FLOOR(AVG(a.POPULATION)) AS avg_population
FROM CITY AS a
LEFT JOIN COUNTRY AS b
ON a.COUNTRYCODE= b.CODE 
GROUP BY b.CONTINENT
HAVING b.CONTINENT IS NOT NULL
ORDER BY b.CONTINENT
  
--ex2:
SELECT 
ROUND(SUM(CASE WHEN b.signup_action = 'Confirmed' THEN 1 ELSE 0 END)*1.0/COUNT(b.signup_action),2)
FROM emails AS a 
LEFT JOIN texts AS b 
ON a.email_id=b.email_id
  
--ex3: 
SELECT b.age_bucket, 
ROUND(SUM(CASE 
WHEN activity_type = 'send' 
THEN time_spent ELSE 0 END) * 100.0 / SUM(time_spent),2) AS send_perc, 
ROUND(SUM(CASE 
WHEN activity_type = 'open' 
THEN time_spent ELSE 0 END) * 100.0 / SUM(time_spent),2) AS open_perc 
FROM activities AS a 
LEFT JOIN age_breakdown AS b 
ON a.user_id = b.user_id 
WHERE a.activity_type IN ('send','open')
GROUP BY b.age_bucket 
  
--ex4:
SELECT a.customer_id
FROM customer_contracts AS a
INNER JOIN products AS b 
ON a.product_id=b.product_id 
GROUP BY a.customer_id
HAVING COUNT(DISTINCT product_category)>= 3
  
--ex5:
SELECT a.employee_id, a.name, 
COUNT(b.reports_to) AS reports_count,
ROUND(avg(b.age)) AS average_age 
FROM Employees AS a 
LEFT JOIN Employees AS b
ON a.employee_id=b.reports_to 
GROUP BY a.employee_id, a.name
HAVING reports_count>0
ORDER BY a.employee_id
  
--ex6:
SELECT a.product_name,
SUM(b.unit) AS unit
FROM Products AS a
JOIN Orders AS b
ON a.product_id=b.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY a.product_name
HAVING unit>=100
  
--ex7: 
SELECT a.page_id
FROM pages AS a 
LEFT JOIN page_likes AS b 
ON a.page_id=b.page_id
WHERE b.page_id IS NULL 
