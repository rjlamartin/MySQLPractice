/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
LEFT JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name  = 'Computers'
;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5
;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName, e.LastName, sum(Quantity) as Quantity
FROM employees as e
JOIN sales as s on e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name AS Category
FROM categories AS c
INNER JOIN departments AS d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games"
;
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name AS Product, SUM(QUANTITY) AS Total_Units_Sold,
 SUM(QUANTITY + PricePerUnit) AS Gross_Revenue
 FROM sales
 INNER JOIN products
 ON sales.ProductID = products.ProductID
 WHERE Name LIKE "Eagles: Hotel California"
 ;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.reviewer, r.rating, r.comment
FROM products as p
JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE r.rating = 1 and p.name LIKE 'Visio%'
;
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName,
 products.Name, SUM(sales.Quantity) AS Total_Units_Sold, SUM(Quantity * PricePerUnit) AS Gross_Revenue
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
GROUP BY sales.EmployeeID, sales.ProductID
ORDER BY sales.EmployeeID, Gross_Revenue DESC
;
