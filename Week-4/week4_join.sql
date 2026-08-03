#part-A
use taxation_db;
show tables;
#part-B
select t.full_name,i.income_source from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id;
select t.full_name,c.category_name from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id 
inner join income_category c on i.category_id=c.category_id;
select i.income_id,i.income_source,f.year_label from income_record i inner join financial_year f on i.year_id=f.year_id;
select t.full_name,i.income_source,i.amount from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id; 
select t.full_name,i.income_source,c.category_name,f.year_label from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id
inner join financial_year f on i.year_id=f.year_id;
#level-2
select t.full_name,i.income_source from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id where c.category_name='salary';
select t.full_name,t.occupation,i.income_source from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id 
inner join income_category c on i.category_id=c.category_id where c.category_name='Business';
select t.full_name,f.start_date,f.end_date from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id 
inner join financial_year f on i.year_id=f.year_id;
select t.full_name,c.category_name,c.Deescription from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id;
select t.full_name,t.pan_number,t.occupation,i.income_source,c.category_name,i.amount,f.year_label,f.start_date,f.end_date from taxpayer t
inner join income_record i on t.taxpayer_id=i.taxpayer_id 
inner join income_category c on i.category_id=c.category_id
inner join financial_year f on i.year_id=f.year_id;
#level-03
select t.full_name,i.income_source from taxpayer t left outer join income_record i on t.taxpayer_id=i.taxpayer_id;
select c.category_name,i.income_source from income_record i right outer join income_category c on i.category_id=c.category_id; 
select t.full_name,i.income_source from taxpayer t left outer join income_record i on t.taxpayer_id=i.taxpayer_id
union 
select t.full_name,i.income_source from taxpayer t right outer join income_record i on t.taxpayer_id=i.taxpayer_id;
select t.full_name,f.year_label from taxpayer t cross join financial_year f;
select t1.full_name as taxpayer1,t2.full_name as taxpayer2,t1.occupation from taxpayer t1 join taxpayer t2 on t1.occupation=t2.occupation where t1.taxpayer_id<t2.taxpayer_id;
#Additional practice
select t.full_name,t.pan_number,i.income_source,c.category_name,f.year_label from taxpayer t 
inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id 
inner join financial_year f on i.year_id=f.year_id;
select t.full_name ,c.category_name,c.Deescription from taxpayer t 
inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id;
select i.income_source,f.year_label from income_record i 
inner join financial_year f on i.year_id=f.year_id;
select t.full_name from taxpayer t inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id
inner join financial_year f on i.year_id=f.year_id 
where c.category_name='Business' and f.year_label='2025-2026';
select t.full_name,t.pan_number,t.occupation,i.income_source,i.amount,c.category_name,c.Deescription,f.year_label,f.start_date,f.end_date from taxpayer t 
inner join income_record i on t.taxpayer_id=i.taxpayer_id
inner join income_category c on i.category_id=c.category_id
inner join financial_year f on i.year_id=f.year_id;


