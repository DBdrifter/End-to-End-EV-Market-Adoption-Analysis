DROP TABLE if exists evdata;
CREATE TABLE evdata 
			(
            VIN varchar(255),
            County text,
            City text,
            State text,	
            Postal_Code	int,
            Model_Year int,
            Make varchar(255),
            Model varchar(255),
            EV_Type varchar(255),
            CAFV_Eligibility varchar(255),
            Electric_Range int,
            Legislative_District int,
            DOL_VehicleID	int,
            Electric_Utility varchar(255),
            census_tract_2020 bigint,	
            Vehicle_Age int
            );

-- Step-1  Importing the file

-- Step-2  Tasks

-- 2 a  	Finding the Top 5 most popular EV makes

SELECT Make, COUNT(VIN) as Total_Vehicles
FROM evdata
GROUP BY Make
ORDER BY Total_Vehicles DESC
LIMIT 5;

-- 2 b  	Calculating Year-Over-Year (YoY) growth in EV adoption using Window Functions
SELECT * FROM evdata;
WITH YearlyAdoption AS (
    SELECT model_year AS Year, COUNT(VIN) AS Vehicles_Registered
    FROM evdata
    GROUP BY model_year
						)
SELECT Year, Vehicles_Registered, LAG(Vehicles_Registered) OVER(ORDER BY Year) AS Prev_Year_Vehicles, 
		ROUND(((Vehicles_Registered - LAG(Vehicles_Registered) OVER(ORDER BY Year)) * 100.0 / LAG(Vehicles_Registered) OVER(ORDER BY Year)), 2) AS YoY_Growth_Percentage
FROM YearlyAdoption
ORDER BY Year DESC;

-- 2 c Regional Top Performers

WITH CityRankings AS (
    SELECT County, City,COUNT(VIN) AS Total_Vehicles,
        DENSE_RANK() OVER(PARTITION BY County ORDER BY COUNT(VIN) DESC) AS City_Rank
    FROM evdata
    WHERE County IS NOT NULL AND City IS NOT NULL
    GROUP BY County, City
)
SELECT County, City AS Top_City, Total_Vehicles
FROM CityRankings
WHERE City_Rank = 1
ORDER BY Total_Vehicles DESC
LIMIT 10;