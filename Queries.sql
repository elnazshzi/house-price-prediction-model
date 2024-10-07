-- 1. Create a new DB:
create database if not exists house_price_regression;
use house_price_regression;

-- 2,3. Create the table 'house_price_data'. I created it by using import wizerd .



-- 4. Select all the data from table house_price_data to check if the data was imported correctly
select * from house_price_data;


-- 5. drop the column date from the database, select all the data from the table to verify if the command worked. Limit your returned results to 10.
alter table house_price_data
drop column date; 


select * from house_price_data
limit 10;



-- 6.Use sql query to find how many rows of data you have.
select count(*) from house_price_data;


-- 7. Find the unique values
-- 7.1 The unique values in the column bedrooms
select distinct bedrooms
from house_price_data
order by bedrooms asc;

-- 7.2 The unique values in the column bathrooms
select distinct bathrooms
from house_price_data
order by bathrooms asc;

-- 7.3 The unique values in the column floors
select distinct floors
from house_price_data
order by floors asc;

-- 7.4 The unique values in the column condition
select distinct house_price_data.condition
from house_price_data
order by  house_price_data.condition asc;

-- 7.5 The unique values in the column grade
select distinct grade
from house_price_data
order by grade asc;


-- 8. The IDs of the top 10 most expensive houses
select id 
from house_price_data
order by price desc
limit 10; 



-- 9. The average price of all the properties
select round(avg(price),2) as average_price
from house_price_data;


-- 10.1 The average price of the houses grouped by bedrooms
select bedrooms, avg(price) as Average_prices
from house_price_data
group by bedrooms;


-- 10.2 The average sqft_living of the houses grouped by bedrooms
select bedrooms, avg(sqft_living) as Average_sqft_living
from house_price_data
group by bedrooms;


-- 10.3 The average price of the houses with a waterfront and without a waterfront
select waterfront, avg(price) as Average_price_waterfront
from house_price_data
group by waterfront;


-- 10.4 Is there any correlation between the columns condition and grade?
select house_price_data.condition, avg(grade)
from house_price_data
group by house_price_data.condition
order by  house_price_data.condition asc; -- There is no clear correlation 



-- 11. One customer is only interested in a house in following conditions:
select * 
from house_price_data
where (bedrooms = 3 or bedrooms = 4) and
bathrooms > 3 and
floors = 1 and 
waterfront = 0 and
house_price_data.condition >= 3 and
grade >= 5 and
price < 300000;  -- There is no options available for them.



-- 12.Properties with prices twice more than the average:
select *
from house_price_data
where price > 2 * (select avg(price) from house_price_data);



-- 13. Create a view for properties with prices twice the average:                          
create view expensive_houses as
select *
from house_price_data
where price > 2 * (select avg(price) from house_price_data);



-- 14. Difference in average prices of properties with 3 and 4 bedrooms:
select 
(select avg(price) from house_price_data where bedrooms = 4)  -
(select avg(price) from house_price_data where bedrooms = 3) as price_difference_bedrooms;



-- 15.different locations where properties are available
select distinct zipcode from house_price_data;



-- 16.The list of all the properties that were renovated.
select * from house_price_data
where yr_renovated >0;



-- 17. The 11th most expensive property.
with ranked as(
select *, row_number() over( order by price desc) as price_rank
from house_price_data)
select * from ranked
where price_rank = 11;


 
 
 





