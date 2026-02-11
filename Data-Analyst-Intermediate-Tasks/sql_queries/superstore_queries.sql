CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE sales (
  OrderID INT,
  Category VARCHAR(50),
  SubCategory VARCHAR(50),
  Region VARCHAR(50),
  Sales DECIMAL(10,2),
  Profit DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1001, 'Office Supplies', 'Binders', 'West', 250.00, 45.00),
(1002, 'Technology', 'Phones', 'East', 1200.00, 300.00),
(1003, 'Furniture', 'Chairs', 'South', 800.00, 120.00),
(1004, 'Office Supplies', 'Paper', 'West', 150.00, 30.00),
(1005, 'Technology', 'Accessories', 'North', 600.00, 150.00),
(1006, 'Furniture', 'Tables', 'East', 950.00, 80.00),
(1007, 'Office Supplies', 'Storage', 'South', 400.00, 60.00),
(1008, 'Technology', 'Machines', 'West', 2000.00, 500.00),
(1009, 'Furniture', 'Bookcases', 'North', 700.00, 100.00),
(1010, 'Office Supplies', 'Art', 'East', 300.00, 40.00);

SELECT * FROM sales;

SELECT Region, SUM(Sales) AS TotalSales
FROM sales
GROUP BY Region;

SELECT Category, AVG(Profit) AS AvgProfit
FROM sales
GROUP BY Category;

SELECT Category
FROM sales
GROUP BY Category
HAVING SUM(Sales) >
(
  SELECT AVG(TotalSales)
  FROM (
    SELECT SUM(Sales) AS TotalSales
    FROM sales
    GROUP BY Category
  ) AS avg_table
);

SELECT Region
FROM sales
GROUP BY Region
HAVING SUM(Profit) =
(
  SELECT MAX(TotalProfit)
  FROM (
    SELECT SUM(Profit) AS TotalProfit
    FROM sales
    GROUP BY Region
  ) AS profit_table
);

SELECT SubCategory
FROM sales
GROUP BY SubCategory
HAVING AVG(Profit) <
(
  SELECT AVG(Profit)
  FROM sales
);
