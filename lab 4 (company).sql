-- 4 Лб  

-- Вибрати всі дані з таблиці employee
USE company;
SELECT
*
FROM 
employee;

-- Вибрати конкретні поля з таблиці employee (ім'я, прізвище, посада)
SELECT 
employee_id,
first_name, 
last_name, 
position
FROM 
employee;

-- Вибрати обмежену кількість записів та конкретні поля з таблиці employee
SELECT 
employee_id,
first_name,
last_name, 
position
FROM 
employee
LIMIT 7;

-- Вибрати унікальні значення посад з таблиці employee
SELECT DISTINCT
position
FROM 
employee;

-- Вибрати унікальні значення посад та впорядкувати за зростанням
SELECT DISTINCT
position
FROM 
employee
ORDER By
position ASC;

-- Вибрати унікальні значення посад та впорядкувати за спаданням
SELECT DISTINCT
position
FROM
employee
ORDER By
position DESC;

-- Вибрати працівників з посадою 'Seller' та впорядкувати за датою працевлаштування
SELECT
employee_id, 
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
position = 'Seller'
ORDER By
employment_date ASC;

-- Вибрати працівників з посадами 'Seller' або 'Consultant' після 2013-01-01 та впорядкувати за датою працевлаштування у зворотньому порядку
SELECT
employee_id,
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position = 'Seller'
OR
position = 'Consultant'
)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

USE Company;
-- Вибрати працівників з посадами 'Seller', 'Senior Consultant', або 'Consultant' після 2013-01-01 та впорядкувати за датою працевлаштування у зворотньому порядку
SELECT
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position LIKE 'Seller'
OR 
position IN ('Senior Consultant', 'Consultant')
)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

-- Вибрати працівників з посадою 'Seller' або без менеджера або із заповненим відділом та впорядкувати за ідентифікатором менеджера у зростаючому порядку
SELECT
employee_id, 
last_name, 
first_name, 
position, 
manager_id, 
department_id
FROM 
employee
WHERE 
manager_id IS NULL
OR 
department_id IS NOT NULL
ORDER By
manager_id ASC;

-- Вибрати працівників з заповненим бонусом між 2015-12-31 та 2016-12-31 та впорядкувати за прізвищем у зростаючому порядку
SELECT 
last_name,
first_name, 
position, 
employment_date,
bonus
FROM 
employee
WHERE
bonus IS NOT NULL
AND 
(
employment_date > '2015-12-31'
and 
employment_date < '2016-12-31'
)
ORDER By 
last_name ASC;

-- Вибрати працівників та визначити їхнє відношення до клієнта на основі посади
SELECT
last_name "Last Name", 
first_name 'First Name', 
position Title,
CASE
WHEN position = 'Senior Consultant' THEN 'Can Seles, Consulting and Lead'
WHEN position IN ('Senior Consultant', 'Consultant') THEN 'Can Seles and Consulting'
WHEN position like 'Assistant Consultant' THEN 'Can only Consulting'
WHEN position LIKE 'Seller' THEN 'Can only Sale'
ELSE 'Service Roles'
END AS 'Relation to Customer'
FROM 
employee
ORDER By 
last_name;

-- Вибрати працівників та дату прийому на роботу
SELECT
last_name "Last Name", 
first_name 'First Name', 
position Title,
employment_date AS 'Hire Date'
FROM 
employee;




-- Домашнэ завдання лб4




-- Сортування за прізвищем у таблиці customer:
SELECT * FROM customer ORDER BY last_name;

-- Сортування виробників за зростанням унікальних значень у таблиці product:
SELECT DISTINCT manufacture FROM product ORDER BY manufacture ASC;

-- Вибірка конкретних полів для товарів від DELL, впорядкованих за назвою товару:
SELECT 
  product_name,
  manufacture,
  category,
  product_type,
  price
FROM product
WHERE manufacture = 'DELL'
ORDER BY product_name ASC;


-- Вибірка інформації про жіночих клієнтів, народжених між 1990 і 2000, впорядкованих за прізвищем:
SELECT
  first_name,
  last_name,
  gender,
  birth_date,
  phone_number
FROM customer
WHERE gender = 'F'
  AND birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY last_name ASC;


-- Вибірка товарів категорії 'NOTEBOOK' з описом, що містить '512GB':
SELECT * FROM product WHERE category = 'NOTEBOOK' AND product_description LIKE '%512GB%';


-- Вибірка товарів категорій 'NOTEBOOK' або 'Desktops' з описом, що містить '512GB' або '1TB':
SELECT * FROM product WHERE (category = 'NOTEBOOK' OR category = 'Desktops') AND (product_description LIKE '%512GB%' OR product_description LIKE '%1TB%');


-- Вибірка всіх даних з таблиці invoice, де відсутній ідентифікатор клієнта:
SELECT * FROM invoice WHERE customer_id IS NULL;

