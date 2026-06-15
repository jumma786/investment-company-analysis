 # Project Assets and Development Components



This project involved building a complete data analytics pipeline from raw SEC data collection through SQL analysis and Power BI dashboard development.



The following files and scripts were created throughout the project lifecycle.



 ---



 # Python ETL Scripts



 ## build _gold.py



 ### Purpose



Creates the final analytical dataset used for SQL Server and Power BI reporting.



 ### Responsibilities



 * Reads cleaned source data

 * Applies final transformations

 * Creates the Gold Layer dataset

 * Generates:



```text

investment _products _gold.csv

```



 ---



 ## check _headers.py



 ### Purpose



Validates schema consistency across all annual SEC datasets.



 ### Responsibilities



 * Compares column names

 * Detects schema differences

 * Identifies missing fields

 * Ensures merge readiness



 ### Problem Solved



Prevented data corruption caused by schema mismatches.



 ---



 ## import _to _sql.py



 ### Purpose



Loads the analytical dataset into SQL Server.



 ### Responsibilities



 * Reads final dataset

 * Connects to SQL Server

 * Imports records into database tables

 * Validates successful loading



 ### Problem Solved



Automated database integration.



 ---



 # SQL Scripts



 ## 01 _create _database.sql



 ### Purpose



Creates the project database.



 ### Responsibilities



 * Creates SQL Server database

 * Initializes project environment



 ---



 ## 02 _create _table.sql



 ### Purpose



Creates analytical tables.



 ### Responsibilities



 * Defines table schema

 * Creates columns and data types



 ---



 ## 03 _bulk _import.sql



 ### Purpose



Imports large datasets efficiently.



 ### Responsibilities



 * Bulk loads CSV data

 * Reduces import time

 * Improves loading performance



 ---



 ## 04 _business _analysis.sql



 ### Purpose



Performs business-focused analysis.



 ### Responsibilities



 * Product trends

 * Company trends

 * Geographic analysis

 * Market concentration metrics



 ### Business Questions Answered



 * Is the industry growing?

 * Are companies increasing or decreasing?

 * Which states dominate the market?



 ---



 ## 05 _advanced _analysis.sql



 ### Purpose



Performs advanced analytical queries.



 ### Responsibilities



 * Rankings

 * Window Functions

 * Market Share Analysis

 * Portfolio Concentration Analysis



 ### Business Questions Answered



 * Who are the market leaders?

 * Which firms control the largest portfolios?

 * How concentrated is the industry?



 ---



 ## drop _all _tables.sql



 ### Purpose



Development utility script.



 ### Responsibilities



 * Removes project tables during testing



 ---



 ## drop _database.sql



 ### Purpose



Environment reset utility.



 ### Responsibilities



 * Removes project database during development



 ---



 # Power BI Assets



 ## Investment _Company _Analysis.pbix



 ### Purpose



Interactive business intelligence dashboard.



 ### Pages



 #### Page 1 – Executive Overview



Focus:



 * Industry Growth

 * Product Trends

 * Company Trends

 * Market Concentration



 ---



 #### Page 2 – Geographic Analysis



Focus:



 * State Distribution

 * Geographic Concentration

 * Top States



 ---



 #### Page 3 – Market Leaders Analysis



Focus:



 * Company Rankings

 * Market Share

 * Top Fund Series

 * Industry Leaders



 ---



 # Dataset Assets



 ## Raw SEC Files



 ### Coverage



2010–2026



 ### Files



```text

investmentcompanyseriesclass2010.csv

investment _company _series _class _2011.csv

investment _company _series _class _2012.csv

investment _company _series _class _2013.csv

investment _company _series _class _2014.csv

investment _company _series _class _2015.csv

investment _company _series _class _2017.csv

investment _company _series _class _2018.csv

investment _company _series _class _2019.csv

investment _company _series _class _2020.csv

investment _company _series _class _2021.csv

investment _company _series _class _2022.csv

investment _company _series _class _2023.csv

investment-company-series-class-2024.csv

investment-company-series-class-2025.csv

investment-company-series-class-2026.csv

```



 ### Total Raw Data



 * 17 annual files

 * Approximately 133 MB



 ---



 ## Gold Dataset



 ### File



```text

investment _products _gold.csv

```



 ### Statistics



 * 713,468 Records

 * 15 Columns



 ### Purpose



Served as the single source of truth for SQL Server and Power BI.



 ---



 # Final Project Architecture



```text

Raw SEC Files (2010–2026)

&#x20;         ↓

Schema Validation

(check _headers.py)

&#x20;         ↓

Data Transformation

(build _gold.py)

&#x20;         ↓

Gold Dataset

(investment _products _gold.csv)

&#x20;         ↓

SQL Server

(import _to _sql.py)

&#x20;         ↓

Business Analysis

(SQL Scripts)

&#x20;         ↓

Power BI Dashboard

&#x20;         ↓

Business Insights

```



 ---



 # Project Development Summary



 ### Data Source Files



17 Annual SEC Files



 ### Python Scripts



3 Production Scripts



 * build _gold.py

 * check _headers.py

 * import _to _sql.py



 ### SQL Scripts



7 SQL Scripts



 ### Dashboard Pages



3 Interactive Power BI Pages



 ### Final Dataset



713,468 Records



 ### Technologies Used



 * Python

 * Pandas

 * SQL Server

 * Power BI

 * Git

 * GitHub



This project demonstrates a complete end-to-end analytics workflow from raw data ingestion to executive-level business intelligence reporting.



