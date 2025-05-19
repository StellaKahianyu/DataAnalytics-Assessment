# DataAnalytics-Assessment
## Overview

This repository contains SQL solutions for the SQL Proficiency Assessment. The queries were written to solve various business problems related to data retrieval, aggregation, joins, subqueries, and data manipulation across multiple tables.

### Tables Used:

* **users\_customuser**: Contains customer demographic and contact information.
* **savings\_savingsaccount**: Records of deposit transactions.
* **plans\_plan**: Records of plans created by customers.
* **withdrawals\_withdrawal**: Records of withdrawal transactions.

## Questions and Solutions:

### Question 1: High-Value Customers with Multiple Products

* **Objective**: To identify customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
* **Tables Involved**: `users_customuser`, `savings_savingsaccount`, `plans_plan`
* **Solution**:

  * Combined `first_name` and `last_name` to form the `name` column as the original `name` column was `NULL`.
  * Filtered for only funded savings (`confirmed_amount > 0`) and investment plans (`is_a_fund = 1`).
  * Grouped by user and calculated the total deposits.

### Question 2: Transaction Frequency Analysis

* **Objective**: To calculate the average number of transactions per customer per month and categorize them.
* **Tables Involved**: `savings_savingsaccount`
* **Solution**:

  * Aggregated transactions for each user and divided by 12 to get monthly averages.
  * Categorized customers into `High Frequency`, `Medium Frequency`, and `Low Frequency` groups.

### Question 3: Account Inactivity Alert

* **Objective**: To find all active accounts (savings or investments) with no transactions in the last 1 year.
* **Tables Involved**: `plans_plan`, `savings_savingsaccount`
* **Solution**:

  * Queried both savings and investment accounts separately and filtered those with transactions older than one year.
  * Used `UNION ALL` to combine the results for a complete view.

### Question 4: Customer Lifetime Value (CLV) Estimation

* **Objective**: To estimate CLV based on account tenure and transaction volume.
* **Tables Involved**: `users_customuser`, `savings_savingsaccount`
* **Solution**:

  * Combined `first_name` and `last_name` to form the `name` column.
  * Calculated account tenure in months and the total number of transactions.
  * Used the formula provided to estimate CLV.

## Challenges Faced:

* The `name` column in `users_customuser` was `NULL`. To solve this, I concatenated `first_name` and `last_name`.
* MySQL's `ONLY_FULL_GROUP_BY` mode required careful grouping and aggregation.
* This mode enforces strict SQL standards for grouping. I ensured all selected columns were either aggregated or included in the `GROUP BY` clause, enabling the queries to run successfully without errors.

## Conclusion:

The solutions were optimized for clarity, efficiency, and accuracy. Comments were added to all queries for better understanding. All tasks were successfully completed as per the assessment requirements.
