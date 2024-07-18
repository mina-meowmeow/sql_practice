--- exercise 1
SELECT country.continent, FLOOR(AVG(city.population)) FROM city
LEFT JOIN country
ON city.countrycode=country.code
WHERE country.continent IS NOT NULL
GROUP BY country.continent
ORDER BY FLOOR(AVG(city.population)) ASC

--- exercise 2
SELECT ROUND(CAST(COUNT(texts.email_id) AS DECIMAL)/
CAST(COUNT(DISTINCT emails.email_id) AS DECIMAL), 2)
AS activation_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';

--- exercise 3
WITH snaps_statistics AS (SELECT 
age.age_bucket, 
SUM(CASE WHEN activities.activity_type = 'send' 
THEN activities.time_spent ELSE 0 END) AS send_timespent, 
SUM(CASE WHEN activities.activity_type = 'open' 
THEN activities.time_spent ELSE 0 END) AS open_timespent, 
SUM(activities.time_spent) AS total_timespent 
FROM activities
INNER JOIN age_breakdown AS age 
ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket) 

SELECT 
age_bucket, 
ROUND(100.0 * send_timespent / total_timespent, 2) AS send_perc, 
ROUND(100.0 * open_timespent / total_timespent, 2) AS open_perc 
FROM snaps_statistics;

--- exercise 4
SELECT customer_id FROM 
(SELECT customers.customer_id, COUNT(DISTINCT products.product_category) 
AS product_count
FROM customer_contracts AS customers
INNER JOIN products 
ON customers.product_id = products.product_id
GROUP BY customers.customer_id) AS supercloud_cust
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products);

  
--- exercise 5
SELECT e1.employee_id, e1.name, COUNT(e2.reports_to) AS reports_count, ROUND(AVG(e2.age)) AS average_age
FROM employees AS e1
INNER JOIN employees AS e2 ON e1.employee_id=e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id ASC

--- exercise 6
SELECT products.product_name, SUM(orders.unit) AS unit FROM products
LEFT JOIN orders
ON products.product_id = orders.product_id
WHERE EXTRACT(month FROM order_date)=02
AND EXTRACT(year FROM order_date)=2020
GROUP BY products.product_name
HAVING unit>=100

--- exercise 7
SELECT pages.page_id FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL;
