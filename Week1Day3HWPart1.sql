-- 1. How many products can you find in the Production.Product table?
SELECT COUNT(ProductID) AS 'Total Products'
FROM Production.Product

-- 2. Write a query that retrieves the number of products in the Production.Product 
-- table that are included in a subcategory. The rows that have NULL in column 
-- ProductSubcategoryID are considered to not be a part of any subcategory.
SELECT COUNT(*) AS NumberOfProductsWithSubcategory
FROM Production.Product 
WHERE ProductSubcategoryID IS NOT NULL

-- 3.How many Products reside in each SubCategory? Write a query to display the results with the following titles.
-- ProductSubcategoryID CountedProducts
-------------------- ---------------
SELECT ProductSubcategoryID, COUNT(*) AS CountedProducts
FROM Production.Product
GROUP BY ProductSubcategoryID

-- 4. How many products that do not have a product subcategory.
SELECT COUNT(*) AS 'No Subcategory'
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

-- 5. Write a query to list the sum of products quantity of each product in the Production.ProductInventory table.
SELECT ProductID, SUM(Quantity) AS 'TotalProductQuantity'
FROM Production.ProductInventory
GROUP BY ProductID


-- 6. Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 
-- and limit the result to include just summarized quantities less than 100.
 --             ProductID    TheSum
 --             --------------------

SELECT *
FROM Production.ProductInventory

SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

/*
7. Write a query to list the sum of products with the shelf information in the Production.ProductInventory 
table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
    Shelf       ProductID    TheSum
    ----------  ----------- -----------
*/
SELECT Shelf, ProductID, SUM(Quantity) AS 'TheSum'
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100

-- 8. Write the query to list the average quantity for products where column LocationID has the value of 10 
-- from the table Production.ProductInventory table.
SELECT ProductID, Shelf, AVG(Quantity) AS 'TheAvg'
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID, Shelf

/*
9. Write query to see the average quantity of products by shelf from the table Production.ProductInventory
    ProductID   Shelf      TheAvg
    ----------- ---------- -----------
*/
SELECT ProductID, Shelf, AVG(Quantity) AS 'TheAvg'
FROM Production.ProductInventory
GROUP BY ProductID, Shelf


/*
10.  Write query to see the average quantity of products by shelf excluding rows that has the value of N/A 
    in the column Shelf from the table Production.ProductInventory
    ProductID   Shelf      TheAvg
    ----------- ---------- -----------
*/
SELECT ProductID, Shelf, AVG(Quantity) AS 'TheAvg'
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf

/*
11. List the members (rows) and average list price in the Production.Product table. This should be grouped 
    independently over the Color and the Class column. Exclude the rows where Color or Class are null.
    Color                        Class              TheCount          AvgPrice
    -------------- - -----    -----------            ---------------------
*/ 
SELECT Color, Class, COUNT(*) AS 'TheCount', AVG(ListPrice) AS 'AvgPrice'
FROM Production.Product
WHERE Color is NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

/*
12. Write a query that lists the country and province names from person.CountryRegion and person. 
StateProvince tables. Join them and produce a result set similar to the following.
    Country                        Province
    ---------              ----------------------
*/
SELECT cr.Name AS Country, sp.Name AS Province
FROM Person.CountryRegion cr
JOIN Person.StateProvince sp ON cr.CountryRegionCode = sp.CountryRegionCode
ORDER BY cr.Name, sp.Name


/*
13.  Write a query that lists the country and province names from person. CountryRegion and person. 
StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce 
a result set similar to the following.
    Country                        Province
    ---------                      ----------------------
*/
SELECT cr.Name AS Country, sp.Name AS Province
FROM Person.CountryRegion cr
JOIN Person.StateProvince sp ON cr.CountryRegionCode = sp.CountryRegionCode
WHERE cr.Name IN ('Germany', 'Canada')
ORDER BY cr.Name, sp.Name;