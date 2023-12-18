/* 8) Display the Id and Name of the Product ordered after “2021-10-05”. */
 -- --------------------------------------------------------
SELECT  p.PRO_ID, p.PRO_NAME from product p 
inner join 
supplier_pricing sp on p.PRO_ID = sp.PRO_ID 
inner join 
`orders` o on sp.PRICING_ID = o.PRICING_ID 
where o.ORD_DATE >  '2021-10-05';
