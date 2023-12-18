-- 6). Display the Supplier details who can supply more than one product.
-- -----------------------------------------------------------
SELECT s.*, COUNT(distinct pr.PRO_ID) AS `Number` FROM supplier s
INNER JOIN supplier_pricing sp
ON s.SUPP_ID = sp.SUPP_ID
INNER JOIN product pr
ON sp.PRO_ID = pr.PRO_ID
GROUP BY s.SUPP_ID
HAVING COUNT(distinct pr.PRO_ID) > 1;