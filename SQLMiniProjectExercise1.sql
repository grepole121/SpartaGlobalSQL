USE Northwind
-- 1.1 Write a query that lists all Customers in either Paris or London. 
-- Include Customer ID, Company Name and all address fields. 
SELECT CustomerID, CompanyName, Address, City, Region, PostalCode, Country 
FROM Customers WHERE City IN ('Paris', 'London')

-- 1.2 List all products stored in bottles. 
SELECT * FROM Products WHERE QuantityPerUnit LIKE '%bottle%'

-- 1.3 Repeat question above, but add in the Supplier Name and Country. 
SELECT Products.*, 
    Suppliers.CompanyName as "Supplier Company", 
    Suppliers.Country as "Supplier Country" 
FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
WHERE QuantityPerUnit LIKE '%bottle%'

-- 1.4 Write an SQL Statement that shows how many products there are in each category. 
-- Include Category Name in result set and list the highest number first. 
SELECT p.CategoryID, COUNT(*) AS "Products in Category", c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID 
GROUP BY p.CategoryID, c.CategoryName
ORDER BY "Products in Category" DESC

-- 1.5 List all UK employees using concatenation to join their title of courtesy, 
-- first name and last name together. Also include their city of residence.
SELECT CONCAT(TitleOfCourtesy, ' ', FirstName, ' ', LastName) as "Employee", City 
FROM Employees WHERE Country = 'UK'

-- 1.6 List Sales Totals for all Sales Regions (via the Territories table using 4 joins) 
-- with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present the numbers.  
SELECT r.RegionDescription, 
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS "Sales Total"
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN EmployeeTerritories et ON o.EmployeeID = et.EmployeeID
INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID
INNER JOIN Region r ON t.RegionID = r.RegionID
GROUP BY r.RegionDescription
HAVING ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) > 1000000


-- 1.7 Count how many Orders have a Freight amount greater than 100.00 and 
-- either USA or UK as Ship Country. 
SELECT COUNT(*) AS 
"Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country" 
FROM Orders 
WHERE Freight > 100.00 AND ShipCountry IN ('USA', 'UK')

-- 1.8 Write an SQL Statement to identify the Order Number of the Order with the 
-- highest amount(value) of discount applied to that order. 
SELECT TOP 1 OrderID, SUM(UnitPrice * Quantity * Discount) AS "Discount Applied"
FROM [Order Details]
GROUP BY OrderID
ORDER BY "Discount Applied" DESC
