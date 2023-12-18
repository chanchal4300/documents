-- CREATING THE DATABASE FOR ECOMMERCE

Create database Ecommerce_Lab4;
use Ecommerce_Lab4;

-- --------------------------------------------------------
/*1).CREATING TABLE FOR DATABASE Ecommerce_Lab4 supplier,customer,category,product,supplier_pricing,order,rating.
*/
-- ----------------------------------------------------------
-- Table structure for table `category`

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

-- #'ORD_AMOUNT' coloumn is excluded from orders table.
-- #REASON :- whenever two columns in same table got same value there is a chance of data inconsistency and redundancy happening so for practical perspective i have excluded this to avoid anomaly as 'SUPP_PRICE' and 'ORD_AMOUNT' has got same values.

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



