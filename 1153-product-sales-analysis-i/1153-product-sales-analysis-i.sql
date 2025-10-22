# Write your MySQL query statement below
SELECT product_name
, year
, price
FROM Sales
JOIN Product ON Product.Product_id = Sales.Product_id 
;