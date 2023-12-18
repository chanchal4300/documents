 -- Consider the following schema for OrderDatabase:
 -- SALESPERSON (S_id int primary Key, Namevarchar, Cityvarchar, Earning float)
 -- CUSTOMER (C_id int primary key, Cust_Name, City, Grade,S_id)
 -- ORDERS (Ord_Noint primary key, Purchase_Amt int, Ord_Date varchar , C_id, S_id)
 -- Write SQL queries to
 -- q1).Create respective tables with the above schema
 -- q2).Insert the appropriate values in all the tables
 
 -- q3).
select * from SALESMAN;
select * From customer;
select * from orders;

-- q4). Count the customers with grades above Delhi’s average.
Select GRADE, count(DISTINCT (C_ID))
FROM CUSTOMER 
GROUP BY GRADE HAVING 
GRADE > (SELECT AVG(GRADE) FROM CUSTOMER WHERE CITY='Delhi');

-- q5). Find the name and numbers of all salesmen who had more than one customer.
SELECT SALESMAN.S_ID, NAME, CUST_NAME, Earning 
FROM SALESMAN, CUSTOMER 
WHERE SALESMAN.CITY = CUSTOMER.CITY 
UNION
SELECT S_ID, NAME, 'NO MATCH', Earning 
FROM SALESMAN 
WHERE NOT CITY = ANY(SELECT CITY FROM CUSTOMER)ORDER BY 2 DESC;

-- q5). List all salesmen and indicate those who have and don’t have customers in their cities (Use UNION operation.)

SELECT SALESMAN.S_ID, NAME, CUST_NAME, Earning 
FROM SALESMAN, CUSTOMER 
WHERE SALESMAN.CITY = CUSTOMER.CITY 
UNION
SELECT S_ID, NAME, 'NO MATCH', Earning FROM
SALESMAN 
WHERE NOT CITY = ANY(SELECT CITY FROM CUSTOMER)
ORDER BY 2 DESC

