/* Problem statement:-
 You are part of a team which is involved in developing an E-Commerce Website.
The E-commerce website manages its data in the Database.. */
 
Create database Ecommerce_Lab4;
use Ecommerce_Lab4;
-- --------------------------------------------------------
/*1).CREATING TABLE FOR DATABASE Ecommerce supplier,customer,category,product,supplier_pricing,order,rating.
  2).You are required to develop SQL based programs   (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in
summarized format - The Data Retrieval needs are described below.
*/
--
-- Table structure for table `category`
--
CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int NOT NULL DEFAULT '0',
  `cat_name` varchar(20) NOT NULL,
   PRIMARY KEY (`cat_id`)
);
-- --------------------------------------------------------

--
-- Table structure for table `product`
--
create table if not exists product(
PRO_ID	INT Primary key not null auto_increment,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
PRO_DESC VARCHAR(60),
CAT_ID	INT,
foreign key (CAT_ID)references category(CAT_ID));

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `SUPP_ID` int NOT NULL DEFAULT '0',
  `SUPP_NAME` varchar(50) NOT NULL,
  `SUPP_CITY` varchar(50) NOT NULL,
  `SUPP_PHONE` varchar(50) NOT NULL,
  PRIMARY KEY (`SUPP_ID`)
);
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
-- --------------------------------------------------------

--
-- Table structure for table `orders`
--
create Table if not exists `orders` (
ORD_ID	INT primary key auto_increment not null,
ORD_DATE DATE NOT NULL,
CUS_ID	INT,
foreign key (CUS_ID) references customer(CUS_ID),
PRICING_ID	INT,
foreign key (PRICING_ID) references supplier_pricing(
PRICING_ID));
-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `RAT_ID` int NOT NULL DEFAULT '0',
  `ORD_ID` int NOT NULL,
  `RAT_RATSTARS` int ,
  PRIMARY KEY (`RAT_ID`),
 foreign key (ORD_ID) references `orders` (ORD_ID)
);

/*3). Inserting the following data in the table created above*/
-- --------------------------------------------------------
--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SUPP_ID`, `SUPP_NAME`, `SUPP_CITY`, `SUPP_PHONE`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- --------------------------------------------------------
--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUS_ID`, `CUS_NAME`, `CUS_PHONE`, `CUS_CITY`, `CUS_GENDER`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- --------------------------------------------------------
--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CAT_ID`, `CAT_NAME`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

-- --------------------------------------------------------
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PRO_ID`, `PRO_NAME`, `PRO_DESC`, `CAT_ID`) VALUES
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
-- Dumping data for table `supplier_pricing`
--

INSERT INTO `supplier_pricing` (`PRICING_ID`, `PRO_ID`, `SUPP_ID`, `SUPP_PRICE`) VALUES
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
-- ---------------------------------------------------------
--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`, `ord_date`, `cus_id`, `pricing_id`) VALUES
(101, '2021-10-06', 2, 1),
(102, '2021-10-12', 3, 5),
(103, '2021-09-16', 5, 2),
(104, '2021-10-05', 1, 1),
(105, '2021-08-16', 4, 3),
(106, '2021-08-18', 1, 9),
(107, '2021-09-01', 3, 7),
(108, '2021-09-07', 5, 6),
(109, '2021-09-10', 5, 3),
(110, '2021-09-10', 2, 4),
(111, '2021-09-15', 4, 5),
(112, '2021-09-16', 4, 7),
(113, '2021-09-16', 1, 8),
(114, '2021-09-16', 3, 5),
(115, '2021-09-16', 5, 3),
(116, '2021-09-17', 2, 14);
-- -----------------------------------------------------
--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`RAT_ID`, `ORD_ID`, `RAT_RATSTARS`) VALUES
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

-- ---------------------------------------------------------
-- Queries:-

/*4).Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.*/
-- -----------------------------------------------------------
SELECT c.CUS_GENDER, 
COUNT(*) AS total_customers
FROM customer c
JOIN orders o ON o.CUS_ID = c.CUS_ID
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
WHERE SP.supp_price >= 3000
group by c.CUS_GENDER;

-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2.
-- ----------------------------------------------------------
SELECT 
     product.PRO_NAME, `orders`.*
FROM 
     `orders`, supplier_pricing, product
WHERE 
     `orders`.CUS_ID = 2
	AND 
    `orders`.PRICING_ID = supplier_pricing.PRICING_ID
    AND 
    supplier_pricing.PRO_ID = product.PRO_ID;

-- 6). Display the Supplier details who can supply more than one product.
SELECT s.*, COUNT(distinct pr.PRO_ID) AS `Number` FROM supplier s
INNER JOIN supplier_pricing sp
ON s.SUPP_ID = sp.SUPP_ID
INNER JOIN product pr
ON sp.PRO_ID = pr.PRO_ID
GROUP BY s.SUPP_ID
HAVING COUNT(distinct pr.PRO_ID) > 1;
-- -----------------------------------------------------------

/* 7) Find the least expensive product from each category  and print the table with category id, name, product name and price of the product
*/
select p.cat_id as category_id , 
c.CAT_NAME as name,  
 p.pro_name as product_name,
 min_price as price 
 from product p 
 inner join (
select c.CAT_ID, min(p.Supp_price) as min_price 
from product pr 
inner join supplier_pricing p on pr.PRO_ID = p.PRO_ID 
inner join category c on c.CAT_ID = pr.CAT_ID 
group by c.CAT_ID )  category_price
on category_price.CAT_ID = p.CAT_ID 
inner join category c on c.CAT_ID = category_price.CAT_ID inner join supplier_pricing sp 
on sp.supp_price = category_price.min_price;

-- ----------------------------------------------------------


-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT  p.PRO_ID, p.PRO_NAME from product p 
inner join 
supplier_pricing sp on p.PRO_ID = sp.PRO_ID 
inner join 
`orders` o on sp.PRICING_ID = o.PRICING_ID 
where o.ORD_DATE >  '2021-10-05';

-- 9)	Display customer name and gender whose names start or end with character 'A'.
select CUS_NAME as name , CUS_GENDER as gender 
from customer 
where CUS_NAME like 'A%' or CUS_NAME like '%A';

-- 10).	Create a stored procedure to display supplier id, name, rating and Type_of_Service.
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
--  If rating >2 print “Average Service” else print “Poor Service”.
-- --------------------------------------------------------
USE `ecommerce_lab4`;
DROP procedure IF EXISTS `getSupplierRating`;

DELIMITER $$
USE `ecommerce_lab4`$$
CREATE PROCEDURE `getSupplierRating` ()

BEGIN
      select s.supp_id as `id`,
      s.supp_name as `name`, 
      r.stars as `rating`,
case
		when r.stars= 5 then 'Excellent Service'
		when r.stars> 4 then  'Good Service'
		when r.stars>2  then  'Average Service'
		when r.stars<= 2 then  'Poor Service'
		end as Type_of_Service
	from supplier s 
	inner join supplier_pricing sp on s.supp_id = sp.supp_id 
	inner join `orders` o on sp.pricing_id = o.pricing_id    
    inner join rating r on o.ord_id = r.ord_id;
END$$

DELIMITER ;

-- -------------------------------------------------
call getSupplierRating();
-- -------------------------------------------------