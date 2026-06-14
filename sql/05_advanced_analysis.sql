USE InvestmentCompanyAnalysis;
GO

/* ==========================================================
   1. Total Products by Year
========================================================== */

SELECT
    Report_Year,
    COUNT(*) AS Total_Products
FROM investment_products_gold
GROUP BY Report_Year
ORDER BY Report_Year;


/* ==========================================================
   2. Year-over-Year Growth
========================================================== */

WITH yearly AS
(
    SELECT
        Report_Year,
        COUNT(*) AS Total_Products
    FROM investment_products_gold
    GROUP BY Report_Year
)
SELECT
    Report_Year,
    Total_Products,
    LAG(Total_Products) OVER(ORDER BY Report_Year) AS Previous_Year,
    ROUND(
        100.0 *
        (Total_Products -
         LAG(Total_Products) OVER(ORDER BY Report_Year))
         /
         NULLIF(
            LAG(Total_Products) OVER(ORDER BY Report_Year),
            0
         ),
    2) AS Growth_Percent
FROM yearly
ORDER BY Report_Year;


/* ==========================================================
   3. Unique Companies by Year
========================================================== */

SELECT
    Report_Year,
    COUNT(DISTINCT Entity_Name) AS Companies
FROM investment_products_gold
GROUP BY Report_Year
ORDER BY Report_Year;


/* ==========================================================
   4. Products Per Company Trend
========================================================== */

SELECT
    Report_Year,
    COUNT(*) * 1.0 /
    COUNT(DISTINCT Entity_Name) AS Avg_Products_Per_Company
FROM investment_products_gold
GROUP BY Report_Year
ORDER BY Report_Year;


/* ==========================================================
   5. Top 20 Companies
========================================================== */

SELECT TOP 20
    Entity_Name,
    COUNT(*) AS Total_Products
FROM investment_products_gold
GROUP BY Entity_Name
ORDER BY Total_Products DESC;


/* ==========================================================
   6. Market Share of Top Companies
========================================================== */

WITH company_counts AS
(
    SELECT
        Entity_Name,
        COUNT(*) AS Product_Count
    FROM investment_products_gold
    GROUP BY Entity_Name
)
SELECT TOP 20
    Entity_Name,
    Product_Count,
    ROUND(
        Product_Count * 100.0 /
        SUM(Product_Count) OVER(),
        2
    ) AS Market_Share_Percent
FROM company_counts
ORDER BY Product_Count DESC;


/* ==========================================================
   7. Top States
========================================================== */

SELECT
    State,
    COUNT(*) AS Products
FROM investment_products_gold
WHERE State IS NOT NULL
GROUP BY State
ORDER BY Products DESC;


/* ==========================================================
   8. State Concentration Ranking
========================================================== */

SELECT
    State,
    COUNT(*) AS Products,
    DENSE_RANK() OVER(
        ORDER BY COUNT(*) DESC
    ) AS State_Rank
FROM investment_products_gold
WHERE State IS NOT NULL
GROUP BY State;


/* ==========================================================
   9. Most Diverse States
========================================================== */

SELECT TOP 20
    State,
    COUNT(DISTINCT Entity_Name) AS Companies
FROM investment_products_gold
WHERE State IS NOT NULL
GROUP BY State
ORDER BY Companies DESC;


/* ==========================================================
   10. Top Fund Series
========================================================== */

SELECT TOP 20
    Series_ID,
    Series_Name,
    COUNT(*) AS Product_Count
FROM investment_products_gold
GROUP BY
    Series_ID,
    Series_Name
ORDER BY Product_Count DESC;


/* ==========================================================
   11. Companies with Largest Product Portfolios
========================================================== */

SELECT TOP 20
    Entity_Name,
    COUNT(DISTINCT Series_ID) AS Series_Count,
    COUNT(*) AS Product_Count
FROM investment_products_gold
GROUP BY Entity_Name
ORDER BY Product_Count DESC;


/* ==========================================================
   12. Product Distribution by State
========================================================== */

SELECT
    State,
    COUNT(*) AS Products,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS Percent_of_Total
FROM investment_products_gold
WHERE State IS NOT NULL
GROUP BY State
ORDER BY Products DESC;


/* ==========================================================
   13. Industry Concentration
========================================================== */

WITH company_counts AS
(
    SELECT
        Entity_Name,
        COUNT(*) AS Product_Count
    FROM investment_products_gold
    GROUP BY Entity_Name
)
SELECT
    COUNT(*) AS Companies,
    AVG(Product_Count * 1.0) AS Avg_Portfolio_Size,
    MAX(Product_Count) AS Largest_Portfolio,
    MIN(Product_Count) AS Smallest_Portfolio
FROM company_counts;


/* ==========================================================
   14. Missing Data Audit
========================================================== */

SELECT
    SUM(CASE WHEN Entity_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Entity_Name,
    SUM(CASE WHEN series_id IS NULL THEN 1 ELSE 0 END) AS Missing_Series_ID,
    SUM(CASE WHEN class_id IS NULL THEN 1 ELSE 0 END) AS Missing_Class_ID,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS Missing_State
FROM investment_products_gold;


/* ==========================================================
   15. Latest Year Snapshot (2026)
========================================================== */

SELECT
    State,
    COUNT(*) AS Products_2026
FROM investment_products_gold
WHERE Report_Year = 2026
GROUP BY State
ORDER BY Products_2026 DESC;