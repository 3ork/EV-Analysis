
---This query selects for the top 10 brands with the most electric vehicles
SELECT TOP 10
	Make,
	COUNT(DOL_Vehicle_ID) AS individual_vehicles ---using DOL Vehicle ID as a metric to count how many unique vehicles there are 
FROM dbo.Electric_Vehicle_Population_Data
WHERE EXISTS (
				SELECT *
				FROM dbo.Electric_Vehicle_Population_Data
				WHERE Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)' ---I used a subquery because I didnt want to add EV type into the returned table
			 )
GROUP BY Make 
ORDER BY individual_vehicles DESC;
