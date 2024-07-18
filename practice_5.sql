--- exercise 1
SELECT country.continent, FLOOR(AVG(city.population)) FROM city
LEFT JOIN country
ON city.countrycode=country.code
WHERE country.continent IS NOT NULL
GROUP BY country.continent
ORDER BY FLOOR(AVG(city.population)) ASC
  
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

--- exercise 5
