---exercise 1
SELECT name FROM students
WHERE marks>75
ORDER BY RIGHT(name, 3) ASC, ID ASC;

---exercise 2
SELECT user_id, 
CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2,length(name)))) AS name 
FROM Users
ORDER BY user_id;

---exercise 3
SELECT manufacturer, 
CONCAT('$',ROUND(SUM(total_sales)/1000000), ' ','millions') AS sale 
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer ASC;

---exercise 4
SELECT EXTRACT(month FROM submit_date) AS month, product_id, ROUND(AVG(stars),2) FROM reviews
GROUP BY month, product_id
ORDER BY month, product_id;

---exercise 5
SELECT sender_id, COUNT(message_id) AS message_count 
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)='8'
AND EXTRACT(YEAR FROM sent_date)='2022'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC 
LIMIT 2;

---exercise 6
SELECT tweet_id FROM tweets
WHERE LENGTH(content)>15;

---exercise 7
SELECT activity_date AS day, 
COUNT(DISTINCT user_id) AS active_users FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date HAVING COUNT(activity_type)>=1; 

---exercise 8
select COUNT(DISTINCT id), DATE from employees
WHERE EXTRACT(MONTH FROM joining_date) BETWEEN 01 AND 07 
AND EXTRACT(DATE FROM joining_date) BETWEEN 01 AND 31
AND EXTRACT(YEAR FROM joining_date)=2022
GROUP BY EXTRACT(MONTH FROM joining_date);

---exercise 9
select POSITION (LOWER('a') IN first_name) from worker
WHERE first_name='Amitah';

---exercise 10
