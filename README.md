\# Investment Company Analysis (2010–2026)



\## Project Overview



This project analyzes the evolution of the U.S. investment fund industry using SEC Investment Company Series and Class data from 2010 to 2026.



The analysis focuses on industry growth, market concentration, geographic distribution, and market leadership trends. An end-to-end data pipeline was developed using Python, SQL Server, and Power BI to transform raw SEC datasets into actionable business insights.



\---



\## Business Problem



The investment fund industry has experienced significant changes over the past decade, but it is unclear:



\* How investment product offerings have evolved over time.

\* Whether the number of investment companies has increased or decreased.

\* Which firms dominate the market.

\* Where investment products are geographically concentrated.

\* Whether the industry is becoming more concentrated.



\---



\## Project Objectives



\* Analyze investment product growth from 2010–2026.

\* Evaluate trends in company participation.

\* Identify leading investment companies.

\* Examine geographic concentration across U.S. states.

\* Measure industry concentration and portfolio expansion.



\---



\## Dataset



\*\*Source:\*\* U.S. Securities and Exchange Commission (SEC)



\*\*Period Covered:\*\* 2010–2026



\*\*Records Analyzed:\*\* 713,468



\*\*Key Fields:\*\*



\* Entity Name

\* Series ID

\* Series Name

\* Class ID

\* Class Name

\* State

\* Report Year



\---



\## Technology Stack



\### Python



\* Pandas

\* NumPy



\### SQL Server



\* SQL Server Express

\* SSMS



\### Business Intelligence



\* Power BI



\---



\## Data Pipeline



\### Step 1: Data Collection



Collected annual SEC Investment Company Series and Class datasets from 2010–2026.



\### Step 2: Data Cleaning



\* Standardized column names

\* Removed invalid rows

\* Merged yearly datasets

\* Fixed schema inconsistencies



\### Step 3: Gold Dataset Creation



Created a consolidated dataset:



```text

investment\_products\_gold.csv

```



Final dataset:



```text

713,468 rows

15 columns

```



\### Step 4: SQL Analysis



Imported the cleaned dataset into SQL Server and performed business analysis using SQL queries.



\### Step 5: Power BI Dashboard



Developed a multi-page dashboard to visualize trends and generate business insights.



\---



\## Key Findings



\### Industry Growth



\* Investment products increased from 39,867 in 2010 to 43,121 in 2026.



\### Company Participation



\* Investment companies declined from 2,737 to 2,044.

\* Represents approximately a 25% decrease.



\### Industry Concentration



\* Average products per company increased from 14.6 to 21.1.

\* Indicates increasing industry concentration.



\### Geographic Concentration



Top states by investment products:



1\. Massachusetts

2\. New York

3\. California



These states account for nearly half of all investment products.



\### Market Leaders



Top investment companies include:



\* Goldman Sachs Trust

\* PIMCO Funds

\* John Hancock Funds II

\* JPMorgan Trust I



\---



\## Dashboard Pages



\### Page 1: Executive Overview



Answers:



\* How has the industry evolved?

\* Are products increasing?

\* Are companies decreasing?

\* Is the market becoming more concentrated?



\### Page 2: Geographic Analysis



Answers:



\* Where is the industry concentrated?

\* Which states dominate the market?



\### Page 3: Market Leaders Analysis



Answers:



\* Who are the dominant investment firms?

\* How concentrated is the market?

\* Which fund series generate the most products?



\---



\## Project Structure



```text

investment-company-analysis

│

├── data

│   ├── raw

│   └── processed

│

├── powerbi

│

├── scripts

│

├── sql

│

├── docs

│

├── README.md

│

└── requirements.txt

```



\---



\## SQL Analysis



Key SQL topics covered:



\* Aggregations

\* Group By

\* Window Functions

\* Ranking Functions

\* Market Share Analysis

\* Growth Rate Analysis

\* Portfolio Concentration Analysis



\---



\## Skills Demonstrated



\* Data Cleaning

\* Data Transformation

\* ETL Development

\* SQL Analytics

\* Data Visualization

\* Business Intelligence

\* Dashboard Design

\* Business Storytelling



\---



\## Author



\### Jumma Mohammad



GitHub:

https://github.com/jumma786



LinkedIn:

https://www.linkedin.com/in/jumma-mohammad/



Email:

\[jummamohammad477@gmail.com](mailto:jummamohammad477@gmail.com)



