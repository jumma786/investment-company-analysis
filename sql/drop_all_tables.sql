USE InvestmentCompanyAnalysis;
GO

DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql +=
    'DROP TABLE [' + SCHEMA_NAME(schema_id) + '].[' + name + '];' + CHAR(13)
FROM sys.tables;

PRINT @sql;
EXEC sp_executesql @sql;
GO