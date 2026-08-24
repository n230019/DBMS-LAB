USE taxation_db;
show tables;
#part-A: 
#level-1:
-- task-1
select * from income_record 
where amount=(
select MAX(amount) from income_record);
-- task-2
select * from income_record 
where amount=(
select MIN(amount) from income_record);
-- task-3
select * from income_record 
where amount >(select AVG(amount) from income_record);
-- task-4
select * from income_record 
where amount=(
select MAX(amount) from income_record);
-- task-5
select * from Taxpayer where taxpayer_id IN (
select taxpayer_id from taxpayer where occupation='Business Owner'); 

#level-2:
-- task-1
select * from taxpayer 
where taxpayer_id IN 
(select taxpayer_id from income_record);
-- task-2
select * from taxpayer 
where taxpayer_id IN (
select taxpayer_id from income_record 
where category_id IN (
select category_id from income_category where category_name='Business')
);
-- task-3
select * from income_record 
where year_id in (select year_id from financial_year
where year_label='2025-2026'
);
-- task-4
select * from income_record where amount >
(select MIN(amount) from income_record where category_id IN (
select category_id from income_category where category_name='Business'));
-- task-5
select * from income_record where amount <
(select MAX(amount) from income_record where category_id IN (
select category_id from income_category where category_name='salary'));
-- task-6
select * from taxpayer
where taxpayer_id IN( 
select taxpayer_id from income_record where amount>(
select AVG(amount) from income_record)
);
-- task-7
select * from income_category where category_id IN( 
select category_id from income_record);
-- task-8
select * from taxpayer where taxpayer_id NOT IN(
select taxpayer_id from income_record where category_id IN (
select category_id from income_category where category_name='Investment'));

#level-3:
#task-1
select * from taxpayer where taxpayer_id IN (
select taxpayer_id from income_record where amount=(select MAX(amount) from income_record));
#task-2
select * from income_record where amount>(
select AVG(amount) from income_record where category_id IN(
select category_id from income_category where category_name='Business'));
#task-3
select * from taxpayer where taxpayer_id IN (
select taxpayer_id from income_record GROUP BY taxpayer_id HAVING SUM(amount) > (
select AVG(total_income) from (
select taxpayer_id,SUM(amount) AS total_income from income_record GROUP BY taxpayer_id )AS taxpayer_totals));
#task-4
select * from income_record where amount> ANY(
select amount from income_record where category_id IN (
select category_id from income_category where category_name='Investment'));
#task-5
select * from income_record where amount> ALL(
select amount from income_record where category_id IN (
select category_id from income_category where category_name='Investment'));
#task-6
select * from income_category where category_id IN(select category_id from income_record
where amount=(select MAX(amount) from income_record));
#task-7
select * from financial_year where year_id IN( 
select year_id from income_record 
GROUP BY year_id 
HAVING sum(amount)=(
select MAX(total_income) from (
select year_id,SUM(amount) AS total_income from income_record GROUP BY year_id) AS year_totals));
#task-8
select taxpayer_id, SUM(amount) AS total_income from income_record
GROUP BY taxpayer_id HAVING SUM(amount)>(
select AVG(total_income) from (
select taxpayer_id,SUM(amount) AS total_income from income_record GROUP BY taxpayer_id)AS taxpayer_totals);
#Real World Taxation Analysis.
-- task-1
select * from taxpayer where taxpayer_id IN (
select taxpayer_id from income_record where amount=(select MAX(amount) from income_record));
-- task-2
select * from taxpayer where taxpayer_id IN (
select taxpayer_id from income_record where amount>(select AVG(amount) from income_record));
-- task-3
select * from income_category where category_id IN( 
select category_id from income_record where amount=(select MAX(amount) from income_record));
 -- task-4
SELECT *
FROM Taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Business'
    )
)
AND taxpayer_id NOT IN (
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
-- task-5
SELECT * FROM Income_Record
WHERE amount > ALL (
    SELECT amount FROM Income_Record
     WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'));
-- task-6
SELECT * FROM Income_Record
WHERE amount > ANY (
    SELECT amount FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'));
-- task-7
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) = (
    SELECT MAX(total_income)
    FROM (
        SELECT taxpayer_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS taxpayer_totals);
-- task-8
SELECT i.*
FROM Income_Record i
JOIN (
    SELECT category_id, AVG(amount) AS avg_income
    FROM Income_Record
    GROUP BY category_id
) AS category_avg
ON i.category_id = category_avg.category_id
WHERE i.amount > category_avg.avg_income;
