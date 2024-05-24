
---This query selects for the top 5 postal codes with the most unique electric vehicles
SELECT TOP 5
	Postal_Code,
	COUNT(DOL_Vehicle_ID) AS Individual_Vehicles ---I used the DOL vehicle ID to count the total amount of unique vehicles in each county
FROM dbo.Electric_Vehicle_Population_Data a
WHERE EXISTS(
				SELECT *
				FROM dbo.Electric_Vehicle_Population_Data e
				WHERE a.Postal_Code = e.Postal_Code ---correlated subquery 
				HAVING COUNT(DOL_Vehicle_ID) > 100 ---used HAVING because I'm working with aggregated data
			)
GROUP BY Postal_Code
ORDER BY individual_vehicles DESC; 
