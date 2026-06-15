\# Challenges Faced and Solutions



One of the most valuable aspects of this project was overcoming a series of real-world data engineering, ETL, database, and reporting challenges. The project required integrating 17 years of SEC investment company data into a single analytical dataset suitable for SQL analysis and Power BI reporting.



\---



\## 1. Collecting and Managing Multi-Year Datasets



\### Challenge



The SEC provides investment company data as separate annual files rather than a single consolidated dataset.



The project required collecting and managing datasets spanning:



\* 2010–2026

\* 17 separate CSV files

\* More than 133 MB of raw data



Managing a large collection of files increased the complexity of data integration and validation.



\### Solution



Developed automated Python workflows to process all source files and create a centralized analytical dataset.



\---



\## 2. Inconsistent File Naming Conventions



\### Challenge



The SEC datasets used different naming conventions across years.



Examples:



```text

investmentcompanyseriesclass2010.csv

investment\_company\_series\_class\_2011.csv

investment-company-series-class-2024.csv

```



This prevented simple automated processing.



\### Solution



Created file discovery and validation logic to automatically identify source files regardless of naming convention.



\---



\## 3. Schema Validation Across Years



\### Challenge



Before merging datasets, it was necessary to verify that all files shared the same structure.



Potential issues included:



\* Different column names

\* Different column ordering

\* Missing fields

\* Additional fields



Without validation, merged data could become inaccurate or corrupted.



\### Solution



Developed schema validation scripts to compare headers across all annual files before integration.



This ensured structural consistency throughout the ETL process.



\---



\## 4. Merging 17 Years of Data



\### Challenge



Combining 17 separate datasets into a single analytical dataset required careful handling.



Risks included:



\* Missing records

\* Duplicate records

\* Schema conflicts

\* Data loss during transformation



\### Solution



Developed automated merging scripts using Pandas to consolidate all annual datasets into a single master dataset while preserving data integrity.



\---



\## 5. Creating a Historical Time Dimension



\### Challenge



The SEC files represented annual snapshots but did not provide a unified field suitable for historical trend analysis.



Without a reporting-year attribute, it would not be possible to analyze:



\* Industry growth

\* Company trends

\* Product trends

\* Market evolution



\### Solution



Extracted year information from source files and created a reporting-year dimension to support time-series analysis.



\---



\## 6. Data Quality Issues



\### Challenge



Large regulatory datasets contained a variety of quality issues including:



\* Missing values

\* Blank records

\* Inconsistent text formatting

\* Duplicate entities

\* Invalid entries



Poor data quality would negatively impact both SQL analysis and dashboard reporting.



\### Solution



Built dedicated cleaning scripts to standardize values, remove invalid records, and improve overall dataset quality before analysis.



\---



\## 7. Building a Gold Layer Dataset



\### Challenge



Raw SEC files were not suitable for direct reporting.



The data required:



\* Cleaning

\* Standardization

\* Historical enrichment

\* Structural validation



before it could be used for business intelligence.



\### Solution



Created a Gold Layer dataset (`investment\_products\_gold.csv`) that served as the single source of truth for SQL Server and Power BI.



Final Dataset:



\* 713,468 records

\* 15 columns



\---



\## 8. SQL Server Integration



\### Challenge



Loading a large analytical dataset into SQL Server introduced several issues:



\* Data type validation

\* Import performance

\* Table design

\* Data verification



\### Solution



Developed SQL scripts for:



\* Database creation

\* Table creation

\* Bulk data import

\* Business analysis

\* Advanced analytical queries



This ensured a reliable and scalable reporting environment.



\---



\## 9. Designing Business Metrics



\### Challenge



The raw SEC dataset did not contain business KPIs.



Important metrics such as:



\* Product growth

\* Company growth

\* Market concentration

\* Product-per-company ratios

\* Company rankings



had to be derived from the underlying data.



\### Solution



Created custom analytical measures using SQL and Power BI to transform raw records into meaningful business insights.



\---



\## 10. Dashboard Design and Storytelling



\### Challenge



The dataset contained more than 700,000 records and dozens of possible analytical views.



The challenge was identifying which insights would be most valuable to business users.



\### Solution



Designed a focused three-page Power BI dashboard:



\### Executive Overview



Industry growth and concentration trends.



\### Geographic Analysis



State-level distribution and concentration.



\### Market Leaders Analysis



Company rankings, market share, and portfolio concentration.



This structure improved usability and storytelling.



\---



\## 11. GitHub File Size Limitations



\### Challenge



The final analytical dataset exceeded GitHub's file size restrictions.



```text

investment\_products\_gold.csv

128 MB

```



GitHub rejects files larger than 100 MB.



\### Solution



Removed generated datasets from version control, configured `.gitignore`, and documented the data recreation process using ETL scripts.



\---



\## 12. Repository Refactoring and Cleanup



\### Challenge



During development, multiple temporary scripts, notebooks, and intermediate files were created.



This resulted in:



\* Duplicate files

\* Experimental code

\* Redundant SQL scripts

\* Repository clutter



\### Solution



Refactored the repository into a clean portfolio structure:



```text

data/

scripts/

sql/

powerbi/

docs/

```



This improved maintainability and professional presentation.



\---



\## Key Lessons Learned



This project provided hands-on experience in:



\* Data Engineering

\* ETL Development

\* Schema Validation

\* Data Quality Management

\* SQL Analytics

\* Power BI Dashboard Development

\* Business Intelligence

\* Git \& GitHub Workflow Management



Most importantly, the project demonstrated that real-world analytics projects require significantly more effort in data preparation and validation than in dashboard creation alone.



