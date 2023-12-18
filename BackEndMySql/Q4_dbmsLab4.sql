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