# End-to-End Electric Vehicle (EV) Market Adoption Analysis

## Project Overview
This project is an end-to-end data analytics pipeline that explores the rapidly growing Electric Vehicle (EV) market. Using a real-world dataset of over 200,000 registered EVs, this analysis extracts, cleans, enriches, and visualizes geographic and technical data to uncover market adoption trends, brand dominance, and the penetration of Battery Electric Vehicles (BEVs) versus Plug-in Hybrids (PHEVs).

## Tech Stack & Tools
* **Python (Pandas, NumPy):** Data ingestion, handling missing values, and feature engineering (e.g., calculating vehicle age).
* **SQL (PostgreSQL/MySQL):** Advanced querying, window functions (YoY growth), and conditional aggregations.
* **Microsoft Excel:** Ad-hoc analysis, pivot tables, and data enrichment utilizing `XLOOKUP` arrays.

## Repository Structure
```text
├── data/
│   ├── Electric_Vehicle_Population_Data.csv    # Raw dataset (link provided below)
│   └── Cleaned_EV_Data.csv                     # Processed dataset after Python cleaning
├── python_scripts/
│   └── data_cleaning.ipynb                     # Jupyter notebook containing EDA and cleaning logic
├── sql_queries/
│   ├── 01_top_brands.sql                       # Queries for market share
│   ├── 02_yoy_growth.sql                       # Window functions calculating adoption rates
│   └── 03_regional_performers.sql              # Partitioning data by geography
└── README.md
```

Project Workflow
1. Data Cleaning & Feature Engineering (Python)
Imported the raw dataset from Data.gov.

Filtered out incomplete geographic records and anomalies in the Model Year column.

Engineered a new Vehicle_Age feature to analyze adoption timelines.

Exported a clean, unified CSV for downstream processing.

2. Exploratory Data Analysis (SQL)
Designed robust SQL scripts to extract business KPIs.

Utilized CTEs and Window Functions (LAG, DENSE_RANK, PARTITION BY) to calculate Year-Over-Year (YoY) growth and identify top-performing cities within individual regions.

Executed Conditional Aggregations (CASE WHEN) to pivot categorical data regarding BEV vs. PHEV distributions.

3. Data Enrichment (Excel)
Integrated a secondary Brand_Directory mapping table.

Executed dynamic XLOOKUP functions across 200,000+ rows to append manufacturer Headquarter Countries, effectively dealing with anomalies using fallback arguments.

Data Source: [Electric Vehicle Population](https://catalog.data.gov/dataset/electric-vehicle-population-data)
