/* Problem statement:-
 1)  You are required to create tables for supplier,customer,category,product,supplier_pricing,orders,rating to store the data for the E-commerce with the schema definition given below. */
Create database ecommercelab4;
use ecommercelab4;
-- --------------------------------------------------------

--
-- Table structure for table `category`
--
create Table if not exists category (
CAT_ID	INT Primary key not null auto_increment,
CAT_NAME	VARCHAR(20) NOT NULL);



-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

create Table customer(
CUS_ID	INT Primary key not null auto_increment,
CUS_NAME	VARCHAR(20) NOT NULL,
CUS_PHONE	VARCHAR(10) NOT NULL,
CUS_CITY	VARCHAR(30) NOT NULL,
CUS_GENDER	CHAR);

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M'),
(7, 'ROHIT', '8888111222', 'MUMBIA', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

create table if not exists product(
PRO_ID	INT(5) Primary key not null auto_increment,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
PRO_DESC VARCHAR(60),
CAT_ID	INT(5),
foreign key (CAT_ID)
references category(CAT_ID));
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);  

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supp_id` int(5) NOT NULL DEFAULT '0',
  `supp_name` varchar(20) DEFAULT NULL,
  `supp_city` varchar(20) DEFAULT NULL,
  `supp_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`supp_id`)
);

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');
 
 -- --------------------------------------------------------

--
-- Table structure for table `supplier_pricing`
--

create Table if not exists supplier_pricing(
PRICING_ID	INT primary key not null auto_increment,
PRO_ID	INT,
SUPP_ID	INT,
SUPP_PRICE	INT DEFAULT 0,
foreign key (SUPP_ID) references supplier(SUPP_ID),
foreign key (PRO_ID) references product(PRO_ID));

--
-- Dumping data for table `supplier_pricing`
--

INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

create Table if not exists `orders` (
ORD_ID	INT primary key auto_increment not null,
ORD_AMOUNT	INT NOT NULL,
ORD_DATE	DATE NOT NULL,
CUS_ID	INT,
foreign key (CUS_ID) references customer(CUS_ID),
PRICING_ID	INT,
foreign key (PRICING_ID) references supplier_pricing(
PRICING_ID));

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`,`ORD_AMOUNT`, `ord_date`, `cus_id`, `pricing_id`) VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
 (108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
 (116, 99, '2021-09-17', 2, 14);
 
 -- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `rat_id` int NOT NULL DEFAULT '0',
  `ord_id` int DEFAULT NULL,
  `stars` int DEFAULT NULL,
  PRIMARY KEY (`rat_id`),
 foreign key (ORD_ID) references `orders` (ORD_ID)
);

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rat_id`, `ord_id`, `stars`) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

-- 3).	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select c.CUS_GENDER, count(*)  
from `orders` o, customer c 
where o.CUS_ID =c.CUS_ID and o.ORD_AMOUNT >=3000 
group by c.CUS_GENDER;


-- 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
select o.*, pr.PRO_NAME 
from customer c 
inner join `orders` o 
on  c.CUS_ID =o.CUS_ID 
inner join supplier_pricing p 
on o.PRICING_ID = p.PRICING_ID 
inner join product pr 
on p.PRO_ID = pr.PRO_ID 
where c.CUS_ID = 2;
  

-- 5)	Display the Supplier details who can supply more than one product.
select s.* , count(distinct pr.PRO_ID) as `Number` from supplier s 
inner join supplier_pricing p 
on s.SUPP_ID = p.SUPP_ID 
inner join product pr 
on p.PRO_ID = pr.PRO_ID 
group by s.SUPP_ID 
having count(distinct pr.PRO_ID)>1 ;

-- 6)	Find the least expensive product from each category and print the table with 
-- category id, name, product name and price of the product


select p.cat_id as id , c.CAT_NAME as name,  
 p.pro_name as product_name, min_price as price 
 from product p 
 inner join (
select c.CAT_ID, min(p.Supp_price) as min_price 
from product pr 
inner join supplier_pricing p on pr.PRO_ID = p.PRO_ID 
inner join category c on c.CAT_ID = pr.CAT_ID 
group by c.CAT_ID )  category_price
on category_price.CAT_ID = p.CAT_ID 
inner join category c on c.CAT_ID = category_price.CAT_ID inner join supplier_pricing sp on sp.supp_price = category_price.min_price  ;


-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
select p.pro_id, p.pro_name from product p 
inner join 
supplier_pricing sp on p.pro_id = sp.pro_id 
inner join 
`orders` o on sp.pricing_id = o.pricing_id 
where o.ord_date >  '2021-10-05';

-- 8)	Display customer name and gender whose names start or end with character 'A'.
select cus_name as name , cus_gender as gender 
from customer 
where cus_name like 'A%' or cus_name like '%A';

/* 10) Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */
-- -----------------------------------------------------------
-- #Step-1 
-- # Create a new procedure using MySQL Workbench.
-- # Name the procedure as 'getSupplierRating'.
-- ----------------------------------------------------------
-- #Step-2
-- #Embed the following block of code within the BEGIN and END statements
-- #Click Apply
-- ----------------------------------------------------------
select s.supp_id as `id`,
      s.supp_name as `name`, 
      r.RAT_RATSTARS as `rating`,
case
		when r.RAT_RATSTARS= 5 then 'Excellent Service'
		when r.RAT_RATSTARS> 4 then  'Good Service'
		when r.RAT_RATSTARS>2  then  'Average Service'
		when r.RAT_RATSTARS<= 2 then  'Poor Service'
		end as Type_of_Service
	from supplier s 
	inner join supplier_pricing sp on s.supp_id = sp.supp_id 
	inner join `orders` o on sp.pricing_id = o.pricing_id    
    inner join rating r on o.ord_id = r.ord_id;
    
-- -----------------------------------------------------------
-- #Step-3
-- #Invoke the procedure using the following statement

call getSupplierRating();
-- ----------------------------------------------------------
-- -----------------------------------------------------
/*external practice query*/
-- 1). Display total number of orders placed by Aakash
select count(cus_name)
As 'Number of Orders'
from customer, orders
where customer.cus_id = orders.cus_id
and cus_name like 'AAKASH';

/*q1). Using Inner join*/
SELECT COUNT(cus_name)
FROM customer
INNER JOIN orders
ON customer.cus_id = orders.cus_id
WHERE cus_name LIKE 'AAKASH';

/*q1). Using Inner join + "using" keyward*/

SELECT COUNT(cus_name)
FROM Customer
INNER JOIN orders
USING(cus_id)
WHERE cus_name LIKE 'AAKASH'; 

/* q2). Display total number of orders placed by akash and   Aman collectively*/
SELECT COUNT(cus_name)
FROM Customer
INNER JOIN orders
USING(cus_id)
WHERE cus_name IN('AAKASH','AMAN');

/*q3). Display product details supplier by Rajesh Retails */
SELECT supp_name, pro_name
FROM supplier
INNER JOIN supplier_pricing
USING(supp_id)
INNER JOIN product
USING(pro_id)
WHERE supp_name LIKE 'Rajesh Retails';

-- ------------------------------------------------------
/* q4). Display total price of products supplied by Rajesh Retails */
SELECT  supp_name, SUM(supp_price)
FROM supplier
INNER JOIN supplier_pricing
USING(supp_id)
INNER JOIN product
USING(pro_id)
WHERE supp_name LIKE 'Rajesh Retails';

-- ------------------------------------------------------
/* q5). Display supplier name and total price of products supplied by that supplier */
SELECT supp_name, SUM(supp_price)
FROM supplier
INNER JOIN supplier_pricing
USING(supp_id)
GROUP BY supp_name;

-- ------------------------------------------------------
/* q6). Display supplier name and total price of products supplied by that supplier whose supplying products more than 30000.*/
SELECT supp_name,SUM(supp_price)
FROM supplier
INNER JOIN supplier_pricing
USING(supp_id)
GROUP BY supp_name
HAVING SUM(supp_price) > 30000;

SELECT * FROM customer
LEFT JOIN orders
USING(cus_id);
-- ------------------------------------------------------
/* q7). Display details of customers who has not placed any orders */
SELECT * FROM customer
LEFT JOIN orders
USING(cus_id)
WHERE ord_id is null;
-- ------------------------------------------------------
/*q8). Display names of all customers who have placed more than tree orders*/
SELECT cus_name
FROM customer
LEFT JOIN orders
USING(cus_id)
GROUP BY cus_id
HAVING count(cus_id) > 3;

SELECT * FROM customer
LEFT JOIN orders USING(cus_id);

SELECT * FROM customer
LEFT JOIN orders USING(cus_id)
WHERE pricing_id IS NULL;

-- ------------------------------------------------------
/* q9). Display all the orders along with the products name orders by customer AAKASH.*/
SELECT ord_id,pro_name
FROM customer
JOIN orders
USING(cus_id)
JOIN supplier_pricing
USING(pricing_id)
Join product
USING(pro_id)
WHERE cus_name LIKE 'AAKASH';

-- ------------------------------------------------------
/* q10). Display supplier name who is supplying more than two products.*/
SELECT supp_name
FROM supplier
JOIN supplier_pricing
USING(supp_id)
JOIN product
USING(pro_id)
GROUP BY supp_id
HAVING count(supp_id) > 2;

-- ------------------------------------------------------
/* q11). Display name of customers whose name starts with 'A'.*/
SELECT cus_name FROM customer
WHERE cus_name LIKE 'A%';

-- ------------------------------------------------------
/* q12). Display product name ordered after 2021-10-06.*/
SELECT pro_name
FROM product
JOIN supplier_pricing
USING(pro_id)
JOIN orders
USING(pricing_id);
-- ----------------------------------------------------------
select S.SUPP_NAME, SP_RO_2.*,

CASE
	WHEN AverageRating = 5 THEN 'Excellent Service'
	WHEN AverageRating > 4 THEN 'Good Service'    
	WHEN AverageRating > 2 THEN 'Average Service'    
    ELSE 'Poor Service'
END As 'TypeOfService'
  from supplier S inner join (
select SUPP_ID, AVG(RAT_RATSTARS) as AverageRating from (
	select SP.SUPP_ID, RO.ORD_ID, RO.RAT_RATSTARS 
	from supplier_pricing SP inner join (
		select O.ORD_ID, O.PRICING_ID, R.RAT_RATSTARS from 
		`Order` O inner join Rating R ON
		O.ORD_ID = R.ORD_ID
	) as RO
	on SP.PRICING_ID = RO.PRICING_ID
) as SP_RO
group by supp_id
) as SP_RO_2
ON S.SUPP_ID = SP_RO_2.SUPP_ID;


 -- ======================

Procedure Creation - 'DisplaySupplierDetails'

-- ==============================

call DisplaySupplierDetails();
-- --------------------------------------------------------

-- ----------------------------------------------------------

-- 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
#Step-1 

#Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
# For Type_of_Service, If rating =5, print “Excellent Service”, 
# If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

# Create a new procedure using MySQL Workbench
# Name the procedure as get_supplier_rating_info


#Step-2

#Embed the following block of code within the BEGIN and END statements
#Click Apply

select 
	  report.supp_id as Supplier_ID,
	  report.supp_name as Supplier_Name, 
	  report.AverageRating as Average_Rating,
 
CASE
	  WHEN report.AverageRating =5 THEN 'Excellent Service'
	  WHEN report.AverageRating >4 THEN 'Good Service'
	  WHEN report.AverageRating >2 THEN 'Average Service'
	  ELSE 'Poor Service'
END 
AS Type_of_Service 
from
(select supplier.supp_name, final.supp_id, final.AverageRating from
	(select sp_orra.supp_id, avg(sp_orra.rat_ratstars) as AverageRating from
		(select supplier_pricing.supp_id, 
        orra.ORD_ID, 
        orra.RAT_RATSTARS 
        from supplier_pricing 
            inner join
			(select `orders`.pricing_id, rating.ORD_ID,             rating.RAT_RATSTARS 
            from `orders` 
            inner join rating 
            on rating.`ord_id` = `order`.ord_id 
			) 
			as orra
			on orra.pricing_id = supplier_pricing.pricing_id
		)
		as sp_orra 
		group by supplier_pricing.supp_id
	)
	as final 
	inner join supplier 
	where final.supp_id = supplier.supp_id
) 
as report;



#Step-3

#Invoke the procedure using the following statement

call get_supplier_rating_info();
-- ----------------------------------------------------------
/*
9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating > 4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
*/
DELIMITER //

CREATE PROCEDURE getSupplier_Rating()

BEGIN

SELECT T3.SUPP_ID, T3.SUPP_NAME, T3.RATING,
CASE
WHEN RATING = 5 THEN 'Excellent Service'
WHEN RATING >4 THEN 'Good Service'
WHEN RATING >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS TYPE_OF_SERVICE FROM

(SELECT S.SUPP_ID, SUPP_NAME, AVG(T2.RATING) AS RATING FROM SUPPLIER S INNER JOIN
(SELECT SP.SUPP_ID, SP.PRICING_ID, T.RATING FROM SUPPLIER_PRICING SP INNER JOIN
(SELECT PRICING_ID, AVG(RAT_RATSTARS) AS RATING 
FROM RATING R INNER JOIN ORDERS O ON R.ORD_ID = O.ORD_ID GROUP BY PRICING_ID) AS T 
ON T.PRICING_ID = SP.PRICING_ID) AS T2 
ON T2.SUPP_ID = S.SUPP_ID GROUP BY SUPP_ID) AS T3 
ORDER BY T3.SUPP_ID;

END//

DELIMITER ;

CALL getSupplier_Rating();
