import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

conn_str = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=.\\SQLEXPRESS;"
    "DATABASE=InvestmentCompanyAnalysis;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)

engine = create_engine(
    f"mssql+pyodbc:///?odbc_connect={quote_plus(conn_str)}",
    fast_executemany=True
)

chunksize = 50000

for i, chunk in enumerate(
    pd.read_csv(
        "data/processed/investment_products_gold.csv",
        chunksize=chunksize,
        low_memory=False
    )
):
    print(f"Loading chunk {i+1}")

    chunk.to_sql(
        "Investment_Products",
        engine,
        if_exists="append",
        index=False
    )

    print(f"Inserted {(i+1)*chunksize:,} rows (approx)")