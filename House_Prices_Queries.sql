-- Query 1: Total Houses and Average Sale Price
SELECT COUNT(Id) AS Total_Houses, AVG(SalePrice) AS Avg_Sale_Price 
FROM train;

-- Query 2: Top 5 Most Expensive Houses
SELECT TOP 5 Id, Neighborhood, YearBuilt, SalePrice 
FROM train 
ORDER BY SalePrice DESC;

-- Query 3: Average Price by Overall Quality
SELECT OverallQual, AVG(SalePrice) AS Avg_Price, COUNT(*) AS House_Count
FROM train
GROUP BY OverallQual
ORDER BY OverallQual DESC;

-- Query 4: Top 5 Neighborhoods by House Count
SELECT TOP 5 Neighborhood, COUNT(*) AS Total_Houses, AVG(SalePrice) AS Avg_Price
FROM train
GROUP BY Neighborhood
ORDER BY Total_Houses DESC;

-- Query 5: Impact of Garage Capacity on Price
SELECT GarageCars, AVG(SalePrice) AS Avg_Price, COUNT(*) AS Total_Houses
FROM train
GROUP BY GarageCars
ORDER BY GarageCars;

-- Query 6: Modern vs Classic Houses Price Comparison
SELECT 
    CASE WHEN YearBuilt >= 2000 THEN 'New (>=2000)' ELSE 'Old (<2000)' END AS House_Age_Category,
    AVG(SalePrice) AS Avg_Price,
    COUNT(*) AS Total_Houses
FROM train
GROUP BY CASE WHEN YearBuilt >= 2000 THEN 'New (>=2000)' ELSE 'Old (<2000)' END;

-- Query 7: Houses with Living Area Greater Than 2000 SqFt
SELECT COUNT(*) AS Large_Houses_Count 
FROM train 
WHERE GrLivArea > 2000;

-- Query 8: Average Price by Bedrooms
SELECT BedroomAbvGr, AVG(SalePrice) AS Avg_Price
FROM train
GROUP BY BedroomAbvGr
ORDER BY BedroomAbvGr;

-- Query 9: Price Range (Max, Min, and Difference)
SELECT MAX(SalePrice) AS Max_Price, MIN(SalePrice) AS Min_Price, (MAX(SalePrice) - MIN(SalePrice)) AS Price_Range
FROM train;

-- Query 10: Luxury Outlier Houses (Price > $400k)
SELECT Id, Neighborhood, GrLivArea, SalePrice
FROM train
WHERE SalePrice > 400000
ORDER BY SalePrice DESC;

-- 11. متوسط المساحة الإجمالية للمنازل (المساحة المعيشية + مساحة البدروم)
SELECT AVG(GrLivArea + TotalBsmtSF) AS Avg_Total_House_Area
FROM train;

-- 12. توزيع المنازل وحساب متوسط الأسعار حسب نوع التدفئة (Heating)
SELECT Heating, COUNT(*) AS Total_Houses, AVG(SalePrice) AS Avg_Price
FROM train
GROUP BY Heating
ORDER BY Total_Houses DESC;

