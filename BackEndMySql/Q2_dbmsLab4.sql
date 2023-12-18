/*2) You are required to develop SQL based programs (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in
summarized format - The Data Retrieval needs are described below.
*/
SELECT CAT_ID, CAT_NAME FROM category;
-- ------------------------------------------------------
SELECT PRO_ID, PRO_NAME, PRO_DESC, CAT_ID
		FROM product;
-- -------------------------------------------------------
SELECT SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE
		FROM supplier;
        
-- ----------------------------------------------------------
SELECT PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE
		FROM supplier_pricing;
-- ----------------------------------------------------------
SELECT CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER
		FROM customer;
-- ----------------------------------------------------------
SELECT ORD_ID,  ORD_DATE, CUS_ID, PRICING_ID
		FROM orders;
-- ----------------------------------------------------------
SELECT RAT_ID, ORD_ID, RAT_RATSTARS FROM rating;
-- ----------------------------------------------------------