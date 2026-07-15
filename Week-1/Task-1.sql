CREATE DATABASE TAXATIOB_DB;
USE TAXATION_DB;
create table TAXPAYER(
    taxpayer_id INT PRIMARY KEY,
    pan_number VARCHAR(10) NOT NULL unique,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    occupation VARCHAR(50) NOT NULL,
    annual_income DECIMAL(12,2) NOT NULL,
    email VARCHAR(100) unique,
    is_active BOOLEAN 
);
INSERT into TAXPAYER values(101,'ABCDE1234F','RAVI KUMAR','1995-06-15','software engineer',850000.00,'ravikumar@example.com',TRUE);
SELECT * FROM TAXPAYER;
INSERT into TAXPAYER values(102,'BCDEF2345G','Priya Sharma','1992-11-22','Doctor',1200000.00,'priya.sharma@example.com',TRUE); 
INSERT into TAXPAYER values(103,'CDEFG3456H','Arjun Reddy','1988-03-10','business owner',1800000.00,'arjun.reddy@example.com',TRUE);
INSERT into TAXPAYER values(104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',620000.00,'sneha.patel@example.com',TRUE);
INSERT into TAXPAYER values(105,'EFGHJ5678K','kiran Rao','1990-01-18','freelancer',750000.00,'kiran.rao@example.com',TRUE);
INSERT into TAXPAYER values(106,'FGHJK6789L','Meera Singh','1985-12-30','consultant',1500000.00,'meera.singh@example.com',FALSE);
SELECT * FROM TAXPAYER;
insert into TAXPAYER() values(107,'ADCDE1234K','xyz','2013-06-15','teacher','1000000.00','xyz@example.com',TRUE);
select * from TAXPAYER;
UPDATE TAXPAYER
SET annual_income=950000.00 WHERE taxpayer_id=101;
SELECT * FROM TAXPAYER;
update TAXPAYER
SET occupation='Software consultant' where taxpayer_id=105;
SELECT * FROM TAXPAYER;
update TAXPAYER
SET is_active=TRUE where taxpayer_id=106;
SELECT * FROM TAXPAYER;
DELETE from TAXPAYER WHERE taxpayer_id=107;
SELECT * FROM TAXPAYER;
alter table TAXPAYER ADD phone_number INT;
SELECT * FROM TAXPAYER;
alter table TAXPAYER
MODIFY occupation VARCHAR(100);
select * from TAXPAYER;
INSERT into TAXPAYER(taxpayer_id) values(101);
insert into TAXPAYER(pan_number) values(ABCDE1234F);
select * from TAXPAYER;

use taxation_db;
create table income_category(
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL unique,
  Deescription VARCHAR(200) NOT NULL,
  taxable BOOLEAN NOT NULL
);
INSERT into income_category()
values(1,'salary','income received from employment',TRUE),
       (2,'business','income earned from business activities',TRUE),
       (3,'House property','income received from property or rent',TRUE),
       (4,'capital gains','income from transfer of eligible assets',TRUE),
       (5,'other sources','income such as bank interest',TRUE),
       (6,'Agricultural income','income from eligible agricultural activites',FALSE);
    select * from income_category;
    insert into income_category() values(7,'Rental Income','income earned by renting out houses,buildings,or other properties',TRUE);
    SELECT * FROM income_category;

    use taxation_db;
CREATE table Financial_year(
   year_id INT PRIMARY KEY,
   year_label VARCHAR(9) NOT NULL UNIQUE,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   filing_deadline DATE ,
   is_current BOOLEAN NOT NULL
);
insert into Financial_year() 
values
(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE),
(2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',FALSE),
(3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',FALSE),
(4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',FALSE),
(5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',FALSE),
(6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',TRUE);
select * from Financial_year;

use taxation_db;
create table Income_record(
income_id INT PRIMARY KEY,
taxpayer_id INT NOT NULL,
income_source VARCHAR(100) NOT NULL,
category_name VARCHAR(50) NOT NULL,
amount DECIMAL(12,2) NOT NULL,
received_data DATE NOT NULL,
financial_year VARCHAR(9) NOT NULL
);
insert into Income_record() 
values
(1001,101,'Technova solutions','salary',850000.00,'2026-03-31','2025-2026'),
(1002,102,'city care hospital','salary',1200000.00,'2026-03-31','2025-2026'),
(1003,103,'reddy enterprises','business',1800000.00,'2026-03-31','2025-2026'),
(1004,104,'sunrise school','salary',620000.00,'2026-03-31','2025-2026'),
(1005,105,'web design projects','business',750000.00,'2026-03-31','2025-2026'),
(1006,106,'professional consulting','business',1500000.00,'2026-03-31','2025-2026');
select * from Income_record;
alter table Income_record ADD remark VARCHAR(200);
SELECT * FROM Income_record;

use taxation_db;
create table Tax_Office(
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);
INSERT into Tax_Office values(101,'TATA COMPANY','MUMBAI'),
(102,'INFOSIS','CHENNAI');
SELECT * FROM Tax_Office;
TRUNCATE table Tax_Office;
SELECT * FROM Tax_Office;
drop table Tax_Office;