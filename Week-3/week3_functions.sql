#PART-A
use taxation_db;
show tables;
SELECT * FROM TAXPAYER;
SELECT * FROM Financial_year;
SELECT * FROM income_category;
SELECT * FROM INCOME_RECORD;
#part-B
#level-1
SELECT UPPER(full_name) AS full_name from taxpayer;
select lOWER(occupation) AS occupation from taxpayer;
select full_name ,
LENGTH(full_name) AS
name_length from taxpayer;
select LEFT(pan_number,4) from taxpayer;
select CONCAT(full_name,' - ',occupation) AS Details from taxpayer;
#level-2
select REPLACE(category_name,'income','Inc.') AS category from income_category;
select TRIM(full_name) AS full_name from taxpayer;
select LEFT(full_name,INSTR(full_name,' ')-1)
as First_name from taxpayer;
#level-03
select CONCAT('Taxpayer :',full_name,'\n occupation:',occupation) AS Details from taxpayer;
select pan_number from taxpayer where LEFT(pan_number,2)='AP';
#part-c
#level-01
select full_name, 
ROUND(annual_income) AS rounded_income 
from taxpayer;
select full_name, ABS(annual_income-500000)AS difference from taxpayer;
select full_name, POWER(annual_income,2)AS square_income from taxpayer;
#level-02
select full_name, MOD(annual_income,1000)AS remainder from taxpayer;
select full_name, 
ROUND(annual_income,2) AS annual_income 
from taxpayer;
select full_name,
CEIL(annual_income) AS ceiling_value,
FLOOR(annual_income) AS Floor_value
from taxpayer;
#level-03
select FLOOR(RAND()*100)+1 AS random_number;
select full_name, SQRT(annual_income)AS square_root from taxpayer;
select full_name , annual_income,annual_income*1.10 AS increased_income from taxpayer;
#part-D
#level-01
select CURDATE() AS DATE;
SELECT NOW() AS DATE_TIME;
SELECT YEAR(start_date) as year from financial_year;
SELECT start_date ,MONTH(start_date) as month from financial_year;
select start_date , DAY(start_date)AS day from financial_year;
#level-2
select start_date, DATE_ADD(start_date,INTERVAL 1 YEAR) AS end_date from financial_year;
select start_date,DATE_ADD(start_date,INTERVAL 30 DAY)AS new_date from financial_year;
select start_date,DATE_SUB(start_date,INTERVAL 30 DAY)AS new_date from financial_year;
#LEVEL-03
SELECT start_date,DATEDIFF(CURDATE(),start_date) as days_difference from financial_year;
select * FROM  Financial_year where year(start_date)=year(CURDATE());
#PART-E
#level-01
SELECT full_name,CAST(annual_income AS SIGNED)as annual_income_integer from taxpayer;
select cast(taxpayer_id AS char)AS taxpayer_id_char from taxpayer;
#level-02
select cast(start_date AS DATETIME) AS start_datetime from financial_year;
select full_name,cast(annual_income AS DECIMAL(10,2))AS annual_income_decimal from taxpayer;
#level-03
select full_name, CAST(annual_income AS char)AS annual_income_string from taxpayer;
select full_name,
cast(annual_income AS DECIMAL(10,2))*0.10 AS tax from taxpayer;



