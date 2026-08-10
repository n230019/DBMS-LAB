#part-A
use taxation_db;
show tables;
select * from taxpayer;
select * from income_category;
select * from income_record;
select * from financial_year;
#part-B
#level-01
select count(*) AS total_income_record from income_record;
select sum(amount) as total_income from income_record;
select AVG(amount) as average_income from income_record;
select MAX(amount) as MAX_income from income_record;
select MIN(amount) as MIn_income from income_record;
#level-02
select category_id ,count(*) AS no_of_records from income_record GROUP BY category_id;
select category_id ,sum(amount) AS amount from income_record GROUP BY category_id;
select category_id ,AVG(amount) average_income from income_record GROUP BY category_id;
select category_id ,MAX(amount) max_income from income_record GROUP BY category_id;
select category_id ,min(amount) min_income from income_record GROUP BY category_id;
select year_id ,sum(amount) total_income from income_record GROUP BY year_id;
select year_id ,count(*) as no_of_records from income_record GROUP BY year_id;
select category_id,year_id ,sum(amount) total_income from income_record GROUP BY category_id,year_id;
#LEVEL_03
select category_id,sum(amount) AS total_income from income_record group by category_id HAVING sum(amount)>1000000;
select category_id,avg(amount) AS avg_income from income_record group by category_id HAVING avg(amount)>500000;
select year_id,count(*) AS no_of_records from income_record group by year_id HAVING count(*) > 3;
select category_id,sum(amount) AS total_income from income_record group by category_id order by sum(amount) DESC;
select category_id,sum(amount) AS total_income from income_record group by category_id HAVING sum(amount)>1000000 order by sum(amount) DESC;
select category_id,sum(amount) AS total_income,AVG(amount)AS average_income from income_record group by category_id;
select category_id,year_id,sum(amount) AS total_income from income_record group by category_id,year_id order by sum(amount) DESC LIMIT 1;
select I.year_id,count(DISTINCT T.taxpayer_id) AS no_of_taxpayers from income_record I join taxpayer T on I.taxpayer_id= T.taxpayer_id group by I.year_id;
#16 Question
select C.category_name,sum(I.amount) as total_income from income_record I join income_category C on I.category_id=C.category_id group by C.category_name order by sum(I.amount) DESC LIMIT 1;
select F.year_label ,sum(I.amount) as total_income from income_record I join financial_year F on I.year_id=F.year_id
 group by F.year_label order by sum(I.amount) DESC LIMIT 1;
select C.category_name,avg(I.amount) as average_income from income_record I join income_category C on I.category_id=C.category_id group by C.category_name
 order by avg(I.amount) DESC LIMIT 1;
 select C.category_name,count(*) as no_of_records from income_record I join income_category C on I.category_id=C.category_id group by
 C.category_name  HAVING count(*)>2;
select F.year_label,sum(I.amount) as total_income from income_record I join financial_year F on I.year_id=F.year_id group by 
F.year_label HAVING sum(I.amount)>1000000;
select C.category_name AS income_category,COUNT(*) AS no_of_records ,sum(I.amount) aS total_income,AVG(I.amount)as average_income,MAX(I.amount)as highest_amount ,min(I.amount)as min_amount 
from income_record I join income_category C on I.category_id=C.category_id group by C.category_name;
 



