import pandas as pd
from pathlib import Path

raw_folder = Path("data/raw")

files = {
"investmentcompanyseriesclass2010.csv": 2010,
"investment_company_series_class_2011.csv": 2011,
"investment_company_series_class_2012.csv": 2012,
"investment_company_series_class_2013.csv": 2013,
"investment_company_series_class_2014.csv": 2014,
"investment_company_series_class_2015.csv": 2015,
"investment_company_series_class.csv": 2016,
"investment_company_series_class_2017.csv": 2017,
"investment_company_series_class_2018.csv": 2018,
"investment_company_series_class_2019.csv": 2019,
"investment_company_series_class_2020.csv": 2020,
"investment_company_series_class_2021.csv": 2021,
"investment_company_series_class_2022.csv": 2022,
"investment_company_series_class_2023.csv": 2023,
"investment-company-series-class-2024.csv": 2024,
"investment-company-series-class-2025.csv": 2025,
"investment-company-series-class-2026.csv": 2026
}

dfs = []

keep_cols = [
"Reporting File Number",
"CIK Number",
"Entity Name",
"Entity Org Type",
"Series ID",
"Series Name",
"Class ID",
"Class Name",
"Class Ticker",
"Address_1",
"Address_2",
"City",
"State",
"Zip Code"
]

for file_name, year in files.items():

```
print(f"\nProcessing {year}: {file_name}")

file_path = raw_folder / file_name

# Special files

if year == 2012:

    df = pd.read_csv(file_path, skiprows=1, dtype=str)

    # Remove dashed separator row
    df = df[
        ~df.iloc[:, 0]
        .astype(str)
        .str.contains("-----", na=False)
    ]

    df.rename(columns={
        "Name of Registered Investment Company ": "Entity Name",
        "State ": "State"
    }, inplace=True)

elif year == 2015:

    df = pd.read_csv(file_path, skiprows=1, dtype=str)

    df.rename(columns={
        "CIK": "CIK Number",
        "Name of Registrant": "Entity Name",
        "Org Type": "Entity Org Type",
        " Address_1": "Address_1"
    }, inplace=True)

elif year == 2017:

    df = pd.read_csv(file_path, skiprows=1, dtype=str)

else:

    df = pd.read_csv(file_path, dtype=str)

# Remove leading/trailing spaces from column names
df.columns = df.columns.str.strip()

# Standardize schemas

rename_map = {

    # OpenGov schema
    "rep_file_num": "Reporting File Number",
    "CIK": "CIK Number",
    "entity_name": "Entity Name",
    "entity_org_type": "Entity Org Type",
    "series_id": "Series ID",
    "series_name": "Series Name",
    "class_id": "Class ID",
    "class_name": "Class Name",
    "class_ticker_symbol": "Class Ticker",
    "street1": "Address_1",
    "street2": "Address_2",
    "city": "City",
    "state_code": "State",
    "zip": "Zip Code",

    # 2013 schema
    "File_No": "Reporting File Number",
    "Registrant_Name": "Entity Name",
    "Org_Type": "Entity Org Type",
    "Series_ID": "Series ID",
    "Series_Name": "Series Name",
    "Class_ID": "Class ID",
    "Class_Name": "Class Name",
    "Class_Ticker": "Class Ticker",
    "Zip_Code": "Zip Code",

    # 2014 schema
    "Name of Investment Company": "Entity Name",
    "Org Type": "Entity Org Type",

    # 2015 schema
    "Name of Registrant": "Entity Name"
}

df.rename(columns=rename_map, inplace=True)

missing = [c for c in keep_cols if c not in df.columns]

if missing:

    print("\nERROR FOUND")
    print("YEAR:", year)
    print("FILE:", file_name)
    print("Missing:", missing)
    print("\nColumns Available:")
    print(df.columns.tolist())

    raise Exception("Column mismatch")

df = df[keep_cols]

df["Report_Year"] = year

dfs.append(df)
```

master = pd.concat(dfs, ignore_index=True)

print("\nFINAL SHAPE")
print(master.shape)

print("\nNULL COUNTS")
print(master.isnull().sum())

master.to_csv(
"data/processed/investment_products_gold.csv",
index=False
)

print("\nSaved:")
print("data/processed/investment_products_gold.csv")
