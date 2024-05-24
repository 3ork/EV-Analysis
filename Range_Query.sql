
SELECT 
	AVG(Electric_Range) AS Average_Range, ---Selecting for the average range of all electric vehicles.
	Make,
	Model,
	Count(Model) AS Sample_Size ---selecting for the amount of cars that are in each model category.
FROM dbo.Electric_Vehicle_Population_Data 
WHERE Electric_Range > 1 ---filtering out zeroes in the data.
GROUP BY Make, Model
ORDER BY average_range DESC;
