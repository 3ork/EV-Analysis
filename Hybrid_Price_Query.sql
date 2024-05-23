USE DATAPROJ 
GO


SELECT
	Make,
	Model,
	AVG(Base_MSRP) AS Average_MSRP ---Selects for the average price of hybrid electric vehicle from the query. 
FROM dbo.Electric_Vehicle_Population_Data 
WHERE SUBSTRING(Electric_Vehicle_Type, 0, 8) = 'Plug-in'
AND Base_MSRP > 1 ---filters out zeroes from the data as well as selects only vehicles with the hybrid type
GROUP BY Make, Model 
ORDER BY Average_MSRP DESC; ---Orders the query from highest price to lowest price


