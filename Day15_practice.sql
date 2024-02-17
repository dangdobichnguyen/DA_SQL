
--ex2: 
SELECT DISTINCT card_name,
FIRST_VALUE (issued_amount) OVER (PARTITION BY card_name 
ORDER BY issue_year, issue_month ASC) AS issued_amount
FROM monthly_cards_issued
ORDER BY issued_amount DESC
--ex3:
WITH newtable AS 
(SELECT *,
RANK () OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank
FROM transactions)
SELECT user_id, spend,transaction_date
FROM newtable
WHERE rank=3
-ex4: 
WITH newtable AS
(SELECT user_id, spend, transaction_date, 
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS  count
FROM transactions)
SELECT user_id, spend, transaction_date 
FROM newtable 
WHERE count= 3;
--ex7:
(SELECT category, product,
SUM(spend) AS total_spend,
RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
FROM product_spend
WHERE EXTRACT(year FROM transaction_date)=2022
GROUP BY category, product)
SELECT category, product, total_spend 
FROM newtable
WHERE RANK<=2
--ex8:
WITH newtable AS (
SELECT artists.artist_name,
DENSE_RANK() OVER (ORDER BY COUNT(songs.song_id) DESC) AS artist_rank
FROM artists
JOIN songs ON artists.artist_id = songs.artist_id
JOIN global_song_rank AS ranking
ON songs.song_id = ranking.song_id
WHERE ranking.rank <= 10
GROUP BY artists.artist_name)
SELECT artist_name, artist_rank
FROM newtable
WHERE artist_rank <= 5
