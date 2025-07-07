-- SQL Query to create, clean and import data from csv files:

-- Create a database
create database test;
use test;

-- Credit card table name is cc
select * from cc; 

-- datatype of Week_Start_Date is text
show columns from cc; 

-- Distinct values of Week_Start_Date column
select count(distinct(Week_Start_Date)) from cc; -- count is 52

/* Standardize Date Format */
SELECT Week_Start_Date, Str_to_date(Week_Start_Date, '%d-%m-%Y' ) FROM cc;

# Data Backup
CREATE TABLE cc_backup AS SELECT * FROM cc;

# Create a new column with correct data type
ALTER TABLE cc ADD COLUMN New_Week_Start_Date Date;

# Convert text date to DATE format and update the new column
SET SQL_SAFE_UPDATES=0;  -- Disable SAFE_UPDATES mode temporarily.
UPDATE cc set New_Week_Start_Date = str_to_date(Week_start_date, '%d-%m-%Y');
select * from cc;

# Verify the conversion
SELECT Week_Start_Date, New_Week_Start_Date
FROM cc
WHERE New_Week_Start_Date IS NULL AND Week_Start_Date IS NOT NULL;

# Replace the old column
ALTER TABLE cc DROP COLUMN Week_Start_Date;
ALTER TABLE cc Change COLUMN New_Week_Start_Date Week_Start_Date DATE;

-- Credit Card Data is cleaned
select * from cc;

--------------------------------------------------------------------------------------------------- 
# Create a table cust_detail and copy all data from customer csv file.
create table cust_detail(
Client_Num	int,
Customer_Age	int,
Gender	varchar(20),
Dependent_Count	int,
Education_Level	varchar(50),
Marital_Status	varchar(20),
state_cd	varchar(50),
Zipcode varchar(20),
Car_Owner	varchar(5),
House_Owner	varchar(5),
Personal_loan	varchar(5),
contact	varchar(50),
Customer_Job	varchar(50),
Income	int,
Cust_Satisfaction_Score int
);


-- Copy csv data into SQL
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:\Credit_dataset\customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from cust_detail;
