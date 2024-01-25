---ex1:  
SELECT NAME, COUNTRYCODE, POPULATION
FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA';

---ex2:
SELECT * FROM CITY 
WHERE COUNTRYCODE = 'JPN';

---ex3:
SELECT CITY, STATE
FROM STATION;

---ex4: CÂU NÀY CHẠY ĐƯỢC
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';
---ex5: NHƯNG CÂU NÀY CHẠY KHÔNG ĐƯỢC
SELECT CITY FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';

---ex6: Câu này cũng không
SELECT DISTINCT CITY FROM STATION  
WHERE CITY NOT LIKE 'A%'
AND CITY NOT LIKE 'E%'
AND CITY NOT LIKE  'I%' 
AND CITY NOT LIKE 'O%'
AND CITY NOT LIKE 'U%';


---ex7: 
SELECT name 
FROM employee
ORDER BY name
  
---ex8:
SELECT name
FROM Employee
WHERE salary > 2000 and months < 10
ORDER BY employee_id
  
---ex9: leetcode-recyclable-and-low-fat-products.
SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable ='Y'
  
---ex10: 
SELECT name FROM customer
WHERE referee_id != 2 OR referee_id IS null
  
---ex11: 
SELECT name, population, area 
FROM World
WHERE area >= 3000000 or population >=25000000
  
---ex12:
SELECT DISTINCT author_id AS ID 
FROM Views 
WHERE author_id = viewer_id
ORDER BY ID 
  
---ex13: 
SELECT * FROM parts_assembly
WHERE finish_date IS NULL 
  
---ex14: 
SELECT index AS Driver_id, yearly_salary AS Salary 
FROM lyft_drivers
WHERE yearly_salary <=30000 or yearly_salary >=70000
  
---ex15: 
SELECT year, advertising_channel, money_spent 
FROM uber_advertising
WHERE money_spent > 100000 and year = 2019
