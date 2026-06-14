-- Dataset Overview
SELECT COUNT(*) AS Total_Records
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]

-- Products by Year
SELECT
    Report_Year,
    COUNT(*) AS Total_Products
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
GROUP BY Report_Year
ORDER BY Report_Year;

-- Top 20 Investment Companies
SELECT TOP 20
    Entity_Name,
    COUNT(*) AS Total_Products
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
GROUP BY Entity_Name
ORDER BY Total_Products DESC;

-- Top States
SELECT TOP 20
    State,
    COUNT(*) AS Total_Products
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
WHERE State IS NOT NULL
GROUP BY State
ORDER BY Total_Products DESC;

-- Unique Companies
SELECT COUNT(DISTINCT Entity_Name) AS Unique_Companies
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]


-- Unique Fund Series
SELECT COUNT(DISTINCT series_id) AS Unique_Series
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]


SELECT TOP 20
    Report_Year,
    State,
    COUNT(*) AS Total_Products
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
GROUP BY Report_Year, State
ORDER BY Total_Products DESC;


SELECT
    Report_Year,
    COUNT(DISTINCT Entity_Name) AS Companies
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
GROUP BY Report_Year
ORDER BY Report_Year;


SELECT
    Report_Year,
    State,
    COUNT(*) AS TotalProducts
FROM [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
WHERE State IN ('MA','NY','CA')
GROUP BY Report_Year, State
ORDER BY Report_Year, State;


SELECT
    Entity_Name,
    COUNT(*) AS TotalProducts
FROM  [InvestmentCompanyAnalysis].[dbo].[investment_products_gold]
GROUP BY Entity_Name
order by entity_name;