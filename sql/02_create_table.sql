USE InvestmentCompanyAnalysis;
GO

CREATE TABLE Investment_Products
(
    Reporting_File_Number NVARCHAR(50),
    CIK_Number NVARCHAR(20),
    Entity_Name NVARCHAR(255),
    Entity_Org_Type NVARCHAR(50),
    Series_ID NVARCHAR(50),
    Series_Name NVARCHAR(255),
    Class_ID NVARCHAR(50),
    Class_Name NVARCHAR(500),
    Class_Ticker NVARCHAR(50),
    Address_1 NVARCHAR(255),
    Address_2 NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Zip_Code NVARCHAR(50),
    Report_Year INT
);
GO