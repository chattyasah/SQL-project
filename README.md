# Supply Chain Analytics: SQL Project 

## Overview

This project portfolio demonstrates the use of SQL for supply chain analytics, focusing on sales and forecasting data. The project includes the creation of database triggers, stored procedures, and complex SQL queries to analyze and manage sales data, forecast accuracy, and performance metrics. The goal is to provide a robust and scalable solution for tracking sales, forecasting, and evaluating forecast accuracy over time.

## Project Structure

The project consists of three main SQL files:

1. **`database_trigger.sql`**: Contains a trigger to automatically update a fact table when new sales data is inserted.
2. **`fact_actual_table.sql`**: Creates and populates a fact table that combines actual sales data with forecast data.
3. **`get_forecast_accuracy_by_year_report.sql`**: Implements a stored procedure to calculate and report forecast accuracy for a given fiscal year.

## Detailed Explanation

### 1. `database_trigger.sql`

This file defines a trigger that is executed after a new record is inserted into the `fact_sales_monthly` table. The trigger inserts the new sales data into the `fact_act_est` table. If a record with the same key already exists, it updates the `sold_quantity` field.

#### Key Features:
- **Trigger**: Automates data synchronization between `fact_sales_monthly` and `fact_act_est`.
- **ON DUPLICATE KEY UPDATE**: Ensures that duplicate entries are handled gracefully by updating existing records.

### 2. `fact_actual_table.sql`

This script creates the `fact_act_est` table, which combines actual sales data from `fact_sales_monthly` and forecast data from `fact_forecast_monthly`. The table is populated using a `UNION` operation to ensure all records from both tables are included. Null values in `sold_quantity` and `forecast_quantity` are replaced with zeros.

#### Key Features:
- **UNION**: Combines data from two tables to create a full join.
- **Null Handling**: Replaces null values with zeros to ensure data consistency.
- **SQL_SAFE_UPDATES**: Temporarily disables safe update mode to allow bulk updates.

### 3. `get_forecast_accuracy_by_year_report.sql`

This file contains a stored procedure that calculates forecast accuracy for a given fiscal year. The procedure uses a Common Table Expression (CTE) to compute metrics such as total sold quantity, total forecast quantity, net error, and absolute error. The final output includes a forecast accuracy percentage for each customer.

#### Key Features:
- **Stored Procedure**: Encapsulates complex logic for calculating forecast accuracy.
- **CTE (Common Table Expression)**: Simplifies the calculation of error metrics.
- **Forecast Accuracy Calculation**: Computes accuracy based on absolute and net errors.

## Technical and Soft Skills Learned

This project allowed me to develop and demonstrate a variety of **technical** and **soft skills** that are essential for a data analyst role. Below is a breakdown of the skills I honed during this project:

### **Technical Skills**
1. **SQL Proficiency**:
   - Writing complex SQL queries involving **joins**, **unions**, and **aggregations**.
   - Creating and managing **database triggers** to automate data updates.
   - Developing **stored procedures** to encapsulate business logic for forecasting accuracy.

2. **Data Modeling**:
   - Designing and implementing a **fact table** (`fact_act_est`) to combine sales and forecast data.
   - Handling **data inconsistencies** by replacing null values with default values (e.g., zeros).

3. **Data Analysis**:
   - Calculating key performance metrics such as **net error**, **absolute error**, and **forecast accuracy**.
   - Using **CTEs (Common Table Expressions)** to simplify complex calculations and improve query readability.

4. **Database Optimization**:
   - Using **ON DUPLICATE KEY UPDATE** to handle duplicate records efficiently.
   - Temporarily disabling **SQL_SAFE_UPDATES** for bulk updates to improve performance.

5. **Data Validation**:
   - Ensuring data integrity by handling null values and ensuring consistency across tables.

### **Soft Skills**
1. **Problem-Solving**:
   - Identifying and resolving data inconsistencies (e.g., null values) to ensure accurate reporting.
   - Designing a solution to combine sales and forecast data effectively using SQL.

2. **Attention to Detail**:
   - Ensuring that all edge cases (e.g., duplicates, null values) are handled properly in the SQL logic.
   - Validating the accuracy of calculated metrics like forecast accuracy.

3. **Analytical Thinking**:
   - Breaking down complex business requirements (e.g., forecast accuracy calculation) into manageable SQL queries.
   - Interpreting the results of data analysis to provide actionable insights.

4. **Time Management**:
   - Prioritizing tasks such as data cleaning, table creation, and query optimization to deliver the project efficiently.

5. **Communication**:
   - Documenting the SQL logic and project structure clearly for future reference.
   - Presenting complex technical concepts (e.g., triggers, stored procedures) in an understandable way.

## Conclusion

This project showcases the power of SQL in managing and analyzing supply chain data. By leveraging triggers, stored procedures, and advanced SQL queries, the solution provides a comprehensive approach to tracking sales, forecasting, and evaluating forecast accuracy. This portfolio is a testament to the ability to create scalable and efficient data management systems using SQL.

Through this project, I developed a strong foundation in **SQL programming**, **data modeling**, and **data analysis**, while also honing essential soft skills like **problem-solving**, **attention to detail**, and **analytical thinking**. These skills are critical for any data analyst aiming to deliver impactful insights and drive data-driven decision-making in a business environment.
