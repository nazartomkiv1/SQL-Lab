-- лб5

USE Company;

-- запит вибирає конкретні стовпці з таблиці employee, де умова позицій є "CEO" або "Manager"і виводить інформацію про них 
SELECT
   employee_id "Manager ID",
   last_name "Manager Last Name",
   first_name 'Manager First Name',
   position 'Manager Title',
   employment_date AS 'Manager Hire Date'
FROM
   employee AS Managers
WHERE
position IN ('CEO','Manager');

-- запит вибирає інформацію про працівників та їхніх менеджерів за допомогою self-join таблиці employee. Використовуються аліаси e та m для позначення основної таблиці та таблиці-менеджера
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   e.employment_date AS 'Employee Hire Date',
   e.manager_id "Emloyee Manager ID",
   m.employee_id "Manager ID",
   m.last_name "Manager Last Name",
   m.position "Manager Title",
   m.employment_date AS 'Manager Hire Date'
FROM
   employee AS e,
   employee AS m
WHERE
   e.manager_id = m.employee_id;
   
-- запит об'єднує таблиці employee та department для вибору інформації про працівників та їх департаменти
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   e.department_id "Emloyee Department ID",
   d.department_id "Department ID",
   d.department_name "Department name"
FROM
   employee AS e,
   department AS d
WHERE
   e.department_id = d.department_id;
   
   -- Цей запит використовує INNER JOIN між таблицями employee та invoice, щоб отримати інформацію про транзакції працівників, відсортовані за моментом транзакції
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   i.employee_id "Invoice Employee ID",
   i.invoice_id 'Invoice',
   i.transaction_moment 'Transaction_moment'
FROM
   employee AS e
JOIN
   invoice  AS i
ON 
   e.employee_id = i.employee_id
ORDER By
   i.transaction_moment;
   
   -- цей запит повертає інформацію про співробітників та відповідні їм транзакції з таблиці invoice, де employee_id співпадає в обох таблицях, та виводить результат у вказаному порядку
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   i.employee_id "Invoice Employee ID",
   i.invoice_id 'Invoice',
   i.transaction_moment 'Transaction_moment'
FROM
   employee AS e
JOIN
   invoice  AS i
USING (employee_id)
ORDER By
    i.transaction_moment;
    
-- цей запит повертає інформацію про співробітників та відповідні їм транзакції з таблиці invoice, де з'єднання відбувається автоматично за всіма стовпцями з однаковими іменами, та результат сортується за transaction_moment
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   i.employee_id "Invoice Employee ID",
   i.invoice_id 'Invoice',
   i.transaction_moment 'Transaction_moment'
FROM
   employee AS e
NATURAL JOIN
   invoice  AS i
ORDER By
    i.transaction_moment;
    
  --   запит об'єднує таблиці employee, invoice, та customer за допомогою ключових слів NATURAL JOIN та JOIN USING, щоб отримати інформацію про співробітників, транзакції та відповідних клієнтів.
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   i.employee_id "Invoice Employee ID",
   i.invoice_id 'Invoice',
   i.customer_id 'Invoice Customer ID',
   i.transaction_moment 'Transaction_moment',
   c.customer_id 'Customer ID',
   c.last_name 'Customer Last Name',
   c.first_name 'Customer First Name'
FROM
   employee AS e
NATURAL JOIN
   invoice  AS i
JOIN
   customer AS c
USING (customer_id)
ORDER By
   i.transaction_moment;


-- задача цього запиту - вивести інформацію про транзакції співробітників (з таблиці invoice), які не мають відповідності в таблиці customer (де customer_id IS NULL).
SELECT
   e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Title',
   i.employee_id "Invoice Employee ID",
   i.invoice_id 'Invoice',
   i.customer_id 'Invoice Customer ID',
   i.transaction_moment 'Transaction_moment',
   c.customer_id 'Customer ID',
   c.last_name 'Customer Last Name',
   c.first_name 'Customer First Name'
FROM
   employee AS e
NATURAL JOIN
   invoice  AS i
LEFT JOIN
   customer AS c
USING (customer_id)
WHERE customer_id IS NULL
ORDER By
   i.transaction_moment; 
   
   --  використовується RIGHT JOIN між таблицями department та employee для отримання інформації про департаменти, їхніх працівників та менеджерів. Також використовуються LEFT JOIN та ON для вибору інформації про менеджерів, які можуть бути відсутніми.
SELECT
-- Employee as e
  e.employee_id "Employee ID",
   e.last_name "Employee Last Name",
   e.first_name 'Employee First Nmae',
   e.position 'Employee Position',
   e.manager_id "Emloyee Manager ID",
   e.department_id "Emloyee Department ID",
-- Manager as m   
   m.employee_id "Manager ID",
   m.last_name "Manager Last Name",
   m.first_name "Manager First Name",
   m.position "Manager Position",
   m.department_id "Manager Department ID",
-- department
   d.department_id "Department ID",
   d.department_name "Department name",
   d.city 'Department City'
FROM
    department as d
RIGHT JOIN
    employee as e
ON
    e.department_id = d.department_id
LEFT JOIN
    employee as m
ON
    e.manager_id = m.employee_id;
   
  --   використовується оператор UNION для об'єднання двох окремих запитів, які вибирають працівників з різними типами посад: "Consulting" та "Not Consulting". Результати виводяться відсортованими за прізвищем.
SELECT
    employee_id,
    first_name,
    last_name,
    position,
    'Consulting' as Responsibility
FROM
    employee
WHERE
    position LIKE '%Consultant'
UNION

SELECT
    employee_id,
    first_name,
    last_name,
    position,  'Not Consulting'
FROM
    employee
WHERE
    position NOT LIKE '%Consultant'
ORDER By last_name;
