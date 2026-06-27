import pandas as pd

# Step 1: Loading the data
df = pd.read_csv("Electric_Vehicle_Population_Data.csv")

# Step 2: EDA- Checking the shape and missing values
print(df.info)
print(df.isnull().sum())

# Step 3: Data Cleaning: Dropping rows with missing critical spatial data
df.dropna(subset=['County', 'City', 'Legislative District'], inplace=True)

# Step 4: Feature Engineering- Creating an 'Age of Vehicle' column (assuming the current year as 2026)
df['Vehicle Age']= 2026-df['Model Year']

# Step 5: Anomaly Handling-Filtering out invalid model years (years in the future or way in the past)
df = df[(df['Model Year'] > 2000) & (df['Model Year'] <= 2026)]

# Step 6: Exporting the cleaned dataset for SQL and Power BI
df.to_csv('Cleaned_EV_Data.csv', index=False)
print("Data cleaned and exported successfully!")
