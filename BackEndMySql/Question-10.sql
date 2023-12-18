CREATE DEFINER=`root`@`localhost` PROCEDURE `getSupplierRating`()
BEGIN
select s.supp_id as `supp_id`, s.supp_name as `name`, r.RAT_RATSTARS as `rating`,
case
when r.RAT_RATSTARS= 5 then 'Excellent Service'
when r.RAT_RATSTARS> 4 then  'Good Service'
when r.RAT_RATSTARS>2  then  'Average Service'
when r.RAT_RATSTARS<= 2 then  'Poor Service'
end as Type_of_Service
from supplier s inner join 
supplier_pricing sp on s.supp_id = sp.supp_id 
inner join `orders` o on 
      sp.pricing_id = o.pricing_id 
inner join rating r on o.ord_id = r.ord_id;
END