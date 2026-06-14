USE InvestmentCompanyAnalysis;
GO
BULK INSERT Investment_Products
FROM 'C:\SQLData\investment_products_gold.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    KEEPNULLS
);