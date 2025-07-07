# Credit-Card-Financial-Report

## Project Objective
To develop a comprehensive credit card weekly dashboard that provides real-time insights into key performance metrics and trends, enabling stakeholders to monitor and analyze credit card operations effectively.

## Import data to SQL database
1) Prepare csv file
2) Create tables in SQL
3) import csv file into SQL

## DAX Queries
1) AgeGroup = SWITCH(
                   TRUE(),
                   cust_detail[Customer_Age] < 30, "20-30",
                   cust_detail[Customer_Age] >=30 && cust_detail[Customer_Age] < 40, "30-40",
                   cust_detail[Customer_Age] >= 40 && cust_detail[Customer_Age] <50, "40-50",
                   cust_detail[Customer_Age] >= 50 && cust_detail[Customer_Age] <60, "50-60",
                   cust_detail[Customer_Age] >= 60, "60+",
                   "Unknown"
                 ))

2) IncomeGroup = SWITCH(
    TRUE(),
    cust_detail[Income]<35000, "Low",
    cust_detail[Income]>=35000 && cust_detail[Income]<70000, "Med",
    cust_detail[Income]>=70000, "High",
    "Unknown"
)

3) week_num2 = WEEKNUM(cc[Week_Start_Date])

4) Revenue = cc[Interest_Earned] + cc[Annual_Fees] + cc[Total_Trans_Amt]

5) Current_Week_Revenue = CALCULATE(
                                  SUM(cc[Revenue]),
                                  FILTER(
                                        ALL(cc),
                                        cc[week_num2]= MAX(cc[week_num2])

                                  )
)

6) Previous_Week_Revenue = CALCULATE(
                                  SUM(cc[Revenue]),
                                  FILTER(
                                        ALL(cc),
                                        cc[week_num2]= MAX(cc[week_num2]) - 1

                                  )
)

# Project Insights

## Overview YTD:
1) Overall revenue is 55.3M
2) Total interest is 7.8M
3) Total transaction amount is 44.5M
4) Male customers are contributing more in revenue 30.2M, female 25.1M
5) Blue & Silver credit card are contributing to 93% of overall transactions
6) TX, NY & CA is contributing to 68%
7) Overall Activation rate is 57.5%
8) Overall Delinquent rate is 6.06%


































