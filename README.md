# SQL Data Cleaning Project

## Overview

This project focuses on cleaning a real world layoffs dataset using MySQL. The goal was to transform raw and inconsistent data into a clean dataset that is ready for analysis and visualization.

The cleaning process follows a structured approach that includes removing duplicate records, standardizing values, handling missing data, converting data types, and removing unnecessary columns.

The project was completed using MySQL and all transformations were performed with SQL queries.

---

## Dataset

The project uses the **Layoffs 2022** dataset, which contains information about company layoffs across different industries and countries.

The dataset includes details such as:

* Company
* Location
* Industry
* Total employees laid off
* Percentage laid off
* Date
* Company stage
* Country
* Funds raised in millions

---

## Objectives

The primary goal of this project was to prepare the dataset for further analysis by:

* Removing duplicate records
* Standardizing inconsistent values
* Cleaning null and blank values
* Converting columns to appropriate data types
* Removing unnecessary columns

---

## Steps Performed

### 1. Created a Staging Table

A staging table was created as a copy of the original dataset so the raw data remained unchanged throughout the cleaning process.

---

### 2. Removed Duplicate Records

Used the `ROW_NUMBER()` window function to identify duplicate rows based on all relevant columns.

Duplicate records were stored with a row number greater than one and then removed from the cleaned table.

---

### 3. Standardized the Data

Several inconsistencies in the dataset were corrected.

This included:

* Removing extra spaces from company names using `TRIM()`
* Standardizing industry names such as converting all variations of Crypto into a single value
* Standardizing country names by replacing different versions of United States with a consistent format

---

### 4. Converted Date Format

The original date column was stored as text.

It was converted into a proper SQL `DATE` data type using `STR_TO_DATE()` and then modified to the `DATE` format for easier querying.

---

### 5. Handled Missing Values

Blank values in the industry column were converted to `NULL`.

For companies that had duplicate records where one row contained the industry and another did not, the missing industry values were filled using a self join on company and location.

Rows where both `total_laid_off` and `percentage_laid_off` were missing were removed because they did not provide meaningful information for analysis.

---

### 6. Removed Unnecessary Columns

After duplicate records were removed, the helper column used to identify duplicates (`row_num`) was dropped from the final table.

---

## SQL Concepts Used

* Common Table Expressions (CTEs)
* Window Functions
* `ROW_NUMBER()`
* `PARTITION BY`
* `TRIM()`
* `STR_TO_DATE()`
* `UPDATE`
* `DELETE`
* `ALTER TABLE`
* Self Joins
* Data Type Conversion

---

## Tools Used

* MySQL
* MySQL Workbench

---

## Final Outcome

The final dataset is free from duplicate records, contains standardized values, has properly formatted dates, handles missing values appropriately, and is ready for exploratory data analysis or visualization.

---

## Learning Outcomes

Through this project, I gained practical experience with:

* Cleaning real world datasets using SQL
* Using window functions for duplicate detection
* Standardizing inconsistent data
* Handling missing values effectively
* Working with joins for data correction
* Preparing raw data for analysis

---

## Files

* `layoffs.csv` – Original dataset
* `Portfolio Project - Data Cleaning.sql` – Complete SQL data cleaning script

---

## Author

**Abhijit Ramesh**

This project was completed as part of my SQL learning journey using a real world layoffs dataset to strengthen practical data cleaning skills.
