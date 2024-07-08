---exercise 1
SELECT DISTINCT city FROM station
WHERE ID%2=0;

---excercise 2
SELECT (SELECT COUNT(city) FROM station) - (SELECT COUNT(DISTINCT city) FROM station) AS difference
FROM DUAL;

--- excercise 3
SELECT CEIL(AVG(salary)-AVG(REPLACE(sallary, 0,' ')))
FROM employees;

--- excercise 4
WITH orders AS
(SELECT SUM(item_count*order_occurrences) AS total_items,
SUM(order_occurrences) AS total_orders FROM items_per_order)
SELECT ROUND(CAST(total_items AS numeric)/total_orders,1) AS mean FROM orders;                                                                       

--- excercise 5 --- note: the code does not run due to an error on LINE 1 (candidates?)
SELECT candidate_id FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id HAVING COUNT(skill) = 3
ORDER BY candidate_id ASC;

--- excercise 6
SELECT user_id, 
MAX(CAST(post_date AS date)) - MIN(CAST(post_date AS date)) AS days_between 
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id HAVING COUNT (post_id)>1;

---excercise 7
SELECT card_name,
MAX(issued_amount)- MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY  difference DESC;

---excercise 8
SELECT manufacturer, COUNT(drug) AS drug_count, ABS(SUM(total_sales-cogs)) AS total_losses 
FROM pharmacy_sales
WHERE total_sales-cogs<0
GROUP BY manufacturer
ORDER BY total_losses DESC;

---excercise 9
SELECT id, movie, description, rating FROM cinema
WHERE description NOT LIKE 'boring' 
GROUP BY movie HAVING id%2=1
ORDER BY rating DESC;

---excercise 10
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt 
FROM Teacher
GROUP BY teacher_id;

---excercise 11
SELECT user_id, COUNT(follower_id) AS followers_count FROM followers
GROUP BY user_id
ORDER BY user_id ASC;

---excercise 12
SELECT class FROM courses
GROUP BY class HAVING COUNT(student)>=5;
