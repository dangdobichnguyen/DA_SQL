--ex1: 
SELECT 
SUM(CASE 
  WHEN device_type = 'laptop' THEN 1 
  ELSE 0 END) AS laptop_views, 
SUM(CASE 
  WHEN device_type IN ('tablet', 'phone') THEN 1 
  ELSE 0 END) AS mobile_views 
FROM viewership
--ex2:
SELECT x,y,z,
CASE WHEN x+y>z and y+z>x and z+x>y then 'Yes' 
ELSE 'No' 
END AS triangle 
FROM triangle
--ex3: CÂU NÀY EM CHẠY RA NULL 
SELECT
ROUND(100.0*
SUM(CASE WHEN call_category IS NULL OR call_category = 'n/a'
      THEN 1 ELSE 0
      END)/COUNT(*),1) AS uncategorised_call
FROM callers
--ex4: 
SELECT name 
FROM customer
WHERE referee_id != 2 OR referee_id IS null
--ex5:
SELECT 
CASE
WHEN survived=1 then 'survivors'
ELSE 'non-survivors'
END AS category,
SUM(CASE 
    WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
SUM(CASE 
    WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
SUM(CASE 
    WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY category 
