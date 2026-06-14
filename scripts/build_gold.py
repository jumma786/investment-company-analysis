import pandas as pd
from pathlib import Path

RAW_FOLDER = Path("data/raw")
OUTPUT_FILE = Path("data/processed/investment_products_gold.csv")

csv_files = list(RAW_FOLDER.glob("*.csv"))

dataframes = []

for file in csv_files:
    try:
        print(f"Processing: {file.name}")

        df = pd.read_csv(file, low_memory=False)

        # Extract year from filename
        year = ''.join(filter(str.isdigit, file.stem))

        if year:
            df["Report_Year"] = int(year)

        dataframes.append(df)

    except Exception as e:
        print(f"Error processing {file.name}: {e}")

gold_df = pd.concat(dataframes, ignore_index=True)

gold_df.columns = (
    gold_df.columns
    .str.strip()
    .str.replace(" ", "_")
)

gold_df.to_csv(OUTPUT_FILE, index=False)

print(f"Gold dataset created: {OUTPUT_FILE}")
print(f"Rows: {len(gold_df):,}")
print(f"Columns: {len(gold_df.columns)}")