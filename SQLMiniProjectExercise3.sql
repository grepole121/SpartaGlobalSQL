USE Northwind
-- 3.1 List all Employees from the Employees table and who they report to. 
-- No Excel required. Please mention the Employee Names 
-- and the ReportTo names. (5 Marks)
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS "Employee Name", 
    CONCAT(em.FirstName, ' ', em.LastName) AS "ReportTo Name"
FROM Employees e
LEFT JOIN Employees em ON e.ReportsTo = em.EmployeeID



-- 3.2 List all Suppliers with total sales over $10,000 in the Order Details table. 
-- Include the Company Name from the Suppliers Table and present as a bar 
-- chart as below: (5 Marks)
SELECT s.CompanyName, 
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Sales
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
INNER JOIN [Order Details] od on p.ProductID = od.ProductID
GROUP BY s.CompanyName
HAVING ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) > 10000
ORDER BY Sales DESC



-- 3.3 List the Top 10 Customers YTD for the latest year in the Orders file. 
-- Based on total value of orders shipped. No Excel required. (10 Marks)
SELECT TOP 10 c.CustomerID, c.CompanyName, 
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS "Sales YTD"
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od on o.OrderID = od.OrderID
WHERE YEAR(o.ShippedDate) = (SELECT MAX(YEAR(ShippedDate)) From Orders)
    AND o.ShippedDate IS NOT NULL
GROUP BY c.CustomerID, c.CompanyName
ORDER BY ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) DESC



-- 3.4 Plot the Average Ship Time by month for all data in the Orders Table 
-- using a line chart as below. (10 Marks)
SELECT AVG(CAST(DATEDIFF(d, OrderDate, ShippedDate) AS DECIMAL (10, 2))) 
    AS "Average Ship Time Per Month", 
    FORMAT(OrderDate, 'MMM-yy') AS "Month-Year",  MONTH(OrderDate), YEAR(OrderDate) 
FROM Orders
WHERE ShippedDate IS NOT NULL
GROUP BY FORMAT(OrderDate, 'MMM-yy'), MONTH(OrderDate), YEAR(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate) ASC
