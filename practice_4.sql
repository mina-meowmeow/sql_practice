---excercise 1
SELECT 
SUM(CASE
WHEN device_type IN ('tablet','phone') THEN 1 
ELSE 0 
END) AS mobile_views,
SUM(CASE
WHEN device_type LIKE 'laptop' THEN 1
ELSE 0
END) AS  laptop_views
FROM viewership;

---exercise 2
SELECT *, CASE
WHEN x+y>z AND x+z>y AND y+z>x 
THEN 'Yes' ELSE 'No'
END AS triangle
FROM triangle;

---exercise 3
WITH uncategorised_callers AS ---note down WITH column AS condition (allow for select)
(SELECT COUNT(case_id) AS uncategorised_calls
FROM callers
WHERE call_category IS NULL
OR call_category = 'n/a')
SELECT 
ROUND (100.0 * uncategorised_calls/(SELECT COUNT(*) FROM callers),1) AS uncategorised_call_pct
FROM uncategorised_callers;

---exercise 4
SELECT name FROM customer
WHERE referee_id !=2 OR referee_id IS null;

---exercise 5
SELECT survived,
SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class_count,
SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class_count,
SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class_count
FROM titanic
GROUP BY survived;
