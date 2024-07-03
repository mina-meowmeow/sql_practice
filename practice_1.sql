---ex1
SELECT name FROM city 
where countrycode='USA' AND population > 120000;

---ex2
SELECT * FROM city
WHERE countrycode = 'JPN';

---ex3
SELECT city, state FROM station;

---ex4
SELECT DISTINCT city FROM station 
WHERE city LIKE 'a%'
OR city LIKE 'e%' 
OR city LIKE 'u%' 
OR city LIKE 'i%'
OR city LIKE 'o%';

---ex5
SELECT DISTINCT city FROM station
WHERE city LIKE '%a' 
OR city LIKE '%e' 
OR city LIKE '%u'
OR city LIKE '%i'
OR city LIKE '%o';

---ex6
SELECT DISTINCT city FROM station
WHERE city NOT LIKE 'a%'
AND city NOT LIKE 'i%'
AND city NOT LIKE 'u%'
AND city NOT LIKE 'e%'
AND city NOT LIKE 'o%';

---ex7
SELECT name FROM employee
ORDER BY name ASC;

---ex8
SELECT name FROM employee
WHERE salary >2000 AND months <10
ORDER BY employee_id ASC;

---ex 9
SELECT product_id FROM products
WHERE low_fats='Y' AND recyclable='Y';

---ex 10
SELECT name FROM customer
WHERE referee_id !=2 OR referee_id IS null;

---ex 11
SELECT name, area, population FROM world
WHERE area >=3000000 OR population >=25000000;

---ex 12
SELECT DISTINCT author_id AS id FROM VIEWS
WHERE author_id = viewer_id
ORDER BY author_id ASC;

---ex 13
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL;

---ex 14
SELECT * FROM lyft_drivers
WHERE yearly_salary <=30000 OR yearly_salary >=70000;

---ex 15
SELECT advertising_channel FROM uber_advertising
WHERE year=2019 AND money_spent>100000;
