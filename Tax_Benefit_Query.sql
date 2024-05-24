USE DATAPROJ 
GO


---Since a large majority of data is from Washington, this query filters through the vehicles in Washington to determine if the buyer recieved a tax benifit after the purchase.
SELECT 
	VIN_1_10,
	State,
	Model_Year,
	CASE WHEN State = 'WA' AND Model_Year > 2022 THEN 'Recieved tax benifits'
		 WHEN State = 'WA' AND Model_Year < 2022 THEN 'Didnt recieve tax benifit'
		 ELSE 'Unknown'
		 END AS Tax_Status 
FROM dbo.Electric_Vehicle_Population_Data
