USE taxation_db;
show tables;
-- PART-A Basic Queries:
-- Level-1
-- Task-1
create view highest_income AS 
select * from Income_record
where amount=(
select MAX(amount) from Income_record);
select * from highest_income;
-- task-2
create view lowest_income AS 
select * from Income_record
where amount=(
select MIN(amount) from Income_record);
select * from lowest_income;
-- task-3
create view average_income as
select * from income_record where amount>(
select AVG(amount) from income_record);
select * from average_income;
-- task-4
create view highest_income_records as
select * from income_record where amount =(
select MAX(amount) from income_record);
select * from highest_income_records;
-- task-5
create view business_owners AS
select * from Taxpayer where occupation ='Business Owner';
select * from business_owners;

-- Level-2:Application
-- task-1
create view taxpayer_with_income AS
select * from taxpayer where taxpayer_id IN( 
select taxpayer_id from income_record);
select * from taxpayer_with_income;
-- task-2
create view taxpayer_business_income AS 
select * from taxpayer where taxpayer_id IN( 
select taxpayer_id from income_record where category_id IN( 
select category_id from income_category where category_name='Business'));
select * from taxpayer_business_income; 
-- task-3
create view income_2025_2026 AS
select i.* from income_record i 
join Financial_year f 
on i.year_id=f.year_id where f.year_label='2025-2026';
select * from income_2025_2026;
-- task-4
create view greater_than_minimum AS
select * from income_record where amount>(
select MIN(amount) from income_record i where i.category_id IN( 
select category_id from income_category where category_name='Business'));
select * from greater_than_minimum;
-- task-5
create view less_than_max AS
select * from income_record where amount < (
select MAX(amount) from income_record i where i.category_id IN( 
select category_id from income_category where category_name='salary'));
select * from greater_than_minimum;
-- task-6
create view taxpayers_above_average AS
select * from taxpayer where taxpayer_id IN(
select taxpayer_id from income_record where amount>(
select AVG(amount) from income_record));
select * from taxpayers_above_average;
-- task-7
create view categories_with_income AS 
select * from income_category where category_id IN( 
select category_id from income_record);
select * from categories_with_income;
-- task-8
create view taxpayers_without_investment AS
select * from taxpayer where taxpayer_id NOT IN (
select taxpayer_id from income_record 
where category_id IN( select category_id from income_category where category_name='Investment')
);
select * from taxpayers_without_investment;

-- level-3
-- task-1
create view taxpayer_high_income AS
select * from taxpayer where taxpayer_id IN( 
select taxpayer_id from income_record where amount=(
select MAX(amount) from income_record));
select * from taxpayer_high_income;
-- task-2
create view  above_average_business_income AS
select * from income_record where amount >(
select AVG(amount) from income_record where category_id IN ( 
select category_id from income_category where category_name='Business'));
select * from above_average_business_income;
-- task-3
CREATE VIEW taxpayers_above_avg_total AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS taxpayer_totals
);
select * from taxpayers_above_avg_total;
-- task-4
CREATE VIEW greater_than_any_investment AS
SELECT *
FROM Income_Record
WHERE amount > ANY (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
select * from greater_than_any_investment;
-- task-5
CREATE VIEW greater_than_all_investment AS
SELECT *
FROM Income_Record
WHERE amount > ALL (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
select * from greater_than_all_investment;
-- task-6
CREATE VIEW highest_income_category AS
SELECT *
FROM Income_Category
WHERE category_id IN (
    SELECT category_id
    FROM Income_Record
    WHERE amount = (
        SELECT MAX(amount)
        FROM Income_Record
    )
);
select * from  highest_income_category;
-- task-7
CREATE VIEW highest_income_year AS
SELECT year_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY year_id
HAVING SUM(amount) = (
    SELECT MAX(total_income)
    FROM (
        SELECT year_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY year_id
    ) AS yearly_totals
);
select * from highest_income_year;
-- task-8
CREATE VIEW taxpayers_greater_avg_total AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS totals
);
select * from taxpayers_greater_avg_total;

-- Real World Taxation Analysis:
-- task-1
create view highest_individual_income AS
select taxpayer_id,amount from income_record where amount =(
select MAX(amount) from income_record);
select * from highest_individual_income;
-- task-2
create view taxpayers_above_average_income as
select taxpayer_id,amount from income_record where amount >(
select AVG(amount) from income_record);
select * from taxpayers_above_average_income;
-- task-3
create view highest_income_category AS
SELECT *
FROM Income_Category
WHERE category_id IN (
    SELECT category_id
    FROM Income_Record
    WHERE amount = (
        SELECT MAX(amount)
        FROM Income_Record
    )
);
select * from highest_income_category;
-- task-4
CREATE VIEW business_no_investment AS
SELECT t.taxpayer_id, t.full_name
FROM Taxpayer t
WHERE t.taxpayer_id IN (
    SELECT i.taxpayer_id
    FROM Income_Record i
    INNER JOIN Income_Category c
    ON i.category_id = c.category_id
    WHERE c.category_name = 'Business'
)
AND t.taxpayer_id NOT IN (
    SELECT i.taxpayer_id
    FROM Income_Record i
    INNER JOIN Income_Category c
    ON i.category_id = c.category_id
    WHERE c.category_name = 'Investment'
);
SELECT * FROM business_no_investment;
-- task-5
CREATE VIEW greater_than_every_investmet AS
SELECT *
FROM Income_Record
WHERE amount > ALL (
    SELECT amount
    FROM Income_Record 
    where category_id IN (
    select category_id from income_category where category_name='Investment')
);
SELECT * FROM greater_than_every_investmet;
-- task-6
CREATE VIEW greater_than_one_investment AS
SELECT *
FROM Income_Record
WHERE amount > ANY (
    SELECT amount
    FROM Income_Record i
    INNER JOIN Income_Category c
    ON i.category_id = c.category_id
    WHERE c.category_name = 'Investment'
);
SELECT * FROM greater_than_one_investment;
-- task-7
CREATE VIEW taxpayers_highest_total_income AS
SELECT taxpayer_id,
       SUM(amount) AS total_income
FROM income_record
group by taxpayer_id 
HAVING SUM(amount) = (
    SELECT MAX(total_income)
    FROM (
        SELECT taxpayer_id,SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) as totals
);
SELECT * FROM taxpayers_highest_total_income;
-- task-8
CREATE VIEW income_above_category_average AS
SELECT i.*
FROM Income_Record i
INNER JOIN (
    SELECT category_id, AVG(amount) AS avg_income
    FROM Income_Record
    GROUP BY category_id
) AS c
ON i.category_id = c.category_id
WHERE i.amount > c.avg_income;
SELECT * FROM income_above_category_average;
