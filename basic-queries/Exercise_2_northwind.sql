--1. Table that holds products sold
SELECT *
FROM dbo.Products;

--2. List product id, name, and unit price of all products
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products;

--3. Do number 2, but in Ascending Order by Price
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice ASC;

--4. Products carried priced $7.50 or less
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice < 7.50;

--5. Products with at least 100 units on hand in descending order by price
SELECT ProductID, ProductName, UnitsInStock, UnitPrice
FROM dbo.Products
WHERE UnitsInStock > 100
ORDER BY UnitPrice DESC

--6. at least 100 units on hand, descending order by price, if 2 or more have same price, list in ascending order by name
SELECT ProductID, ProductName, UnitsInStock, UnitPrice
FROM dbo.Products
WHERE UnitsInStock > 100
ORDER BY UnitPrice DESC, ProductName ASC;

--7.no units on hand, but 1 or more units of them on backorder?

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM dbo.Products
WHERE UnitsInStock = 0 AND UnitsOnOrder > 0
ORDER BY ProductName ASC;

--8. Categories holds the types of items
--9. List all col and row of categories table, Seafood id is 8
SELECT *
FROM dbo.Categories;

--10.Products table has a Category ID column to identify which type a product is. Query all seafood
SELECT ProductID, ProductName, C.CategoryName
FROM dbo.Products as P
JOIN dbo.Categories as C ON C.CategoryID = P.CategoryID
WHERE C.CategoryID = 8;