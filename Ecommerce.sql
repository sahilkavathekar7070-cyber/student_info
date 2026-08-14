CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(30),
    registration_date DATE
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(50),
    city VARCHAR(50)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    shipping_city VARCHAR(50),
    shipping_state VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id)
);



CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);


INSERT INTO Product
(product_id, product_name, category, sub_category, price, cost)
VALUES
(101, 'Laptop', 'Electronics', 'Computers', 65000, 52000),
(102, 'Smartphone', 'Electronics', 'Mobiles', 30000, 24000),
(103, 'Keyboard', 'Electronics', 'Accessories', 1500, 900),
(104, 'Mouse', 'Electronics', 'Accessories', 800, 450),
(105, 'Monitor', 'Electronics', 'Computers', 18000, 14000),
(106, 'Office Chair', 'Furniture', 'Chairs', 12000, 8500),
(107, 'Study Table', 'Furniture', 'Tables', 9000, 6500),
(108, 'T-Shirt', 'Clothing', 'Men', 999, 500),
(109, 'Jeans', 'Clothing', 'Men', 1999, 1100),
(110, 'Shoes', 'Clothing', 'Footwear', 2999, 1700);


INSERT INTO Customer
(customer_id, customer_name, email, gender, age, city, state, region, registration_date)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Male', 28, 'Mumbai', 'Maharashtra', 'West', '2025-01-15'),
(2, 'Priya Patil', 'priya@gmail.com', 'Female', 25, 'Pune', 'Maharashtra', 'West', '2025-02-20'),
(3, 'Amit Kumar', 'amit@gmail.com', 'Male', 32, 'Delhi', 'Delhi', 'North', '2025-03-10'),
(4, 'Sneha Rao', 'sneha@gmail.com', 'Female', 29, 'Bengaluru', 'Karnataka', 'South', '2025-04-12'),
(5, 'Vikas Shah', 'vikas@gmail.com', 'Male', 35, 'Ahmedabad', 'Gujarat', 'West', '2025-05-05'),
(6, 'Neha Joshi', 'neha@gmail.com', 'Female', 27, 'Nashik', 'Maharashtra', 'West', '2025-06-18'),
(7, 'Rohit Verma', 'rohit@gmail.com', 'Male', 31, 'Jaipur', 'Rajasthan', 'North', '2025-07-22'),
(8, 'Anjali Singh', 'anjali@gmail.com', 'Female', 26, 'Hyderabad', 'Telangana', 'South', '2025-08-14'),
(9, 'Karan Mehta', 'karan@gmail.com', 'Male', 30, 'Thane', 'Maharashtra', 'West', '2025-09-08'),
(10, 'Pooja Das', 'pooja@gmail.com', 'Female', 33, 'Kolkata', 'West Bengal', 'East', '2025-10-11');


INSERT INTO Employee
(employee_id, employee_name, department, designation, city)
VALUES
(1, 'Rajesh Patil', 'Sales', 'Sales Executive', 'Mumbai'),
(2, 'Amit Singh', 'Sales', 'Sales Executive', 'Delhi'),
(3, 'Neha Sharma', 'Sales', 'Sales Manager', 'Pune'),
(4, 'Kiran Rao', 'Sales', 'Sales Executive', 'Bengaluru'),
(5, 'Vijay Shah', 'Sales', 'Sales Executive', 'Ahmedabad');


INSERT INTO Orders
(order_id, customer_id, employee_id, order_date,
 payment_method, order_status, shipping_city, shipping_state)
VALUES
(1001, 1, 1, '2026-01-05', 'UPI', 'Completed', 'Mumbai', 'Maharashtra'),
(1002, 2, 3, '2026-01-10', 'Credit Card', 'Completed', 'Pune', 'Maharashtra'),
(1003, 3, 2, '2026-01-15', 'UPI', 'Completed', 'Delhi', 'Delhi'),
(1004, 4, 4, '2026-02-02', 'Debit Card', 'Completed', 'Bengaluru', 'Karnataka'),
(1005, 5, 5, '2026-02-12', 'UPI', 'Cancelled', 'Ahmedabad', 'Gujarat'),
(1006, 6, 1, '2026-03-08', 'Cash', 'Completed', 'Nashik', 'Maharashtra'),
(1007, 7, 2, '2026-03-18', 'UPI', 'Pending', 'Jaipur', 'Rajasthan'),
(1008, 8, 4, '2026-04-05', 'Credit Card', 'Completed', 'Hyderabad', 'Telangana'),
(1009, 9, 1, '2026-04-20', 'UPI', 'Completed', 'Thane', 'Maharashtra'),
(1010, 10, 5, '2026-05-15', 'Debit Card', 'Completed', 'Kolkata', 'West Bengal');

INSERT INTO OrderDetails
(order_detail_id, order_id, product_id, quantity, unit_price, discount)
VALUES
(1, 1001, 101, 1, 65000, 5),
(2, 1001, 103, 2, 1500, 0),
(3, 1002, 102, 1, 30000, 10),
(4, 1003, 105, 2, 18000, 5),
(5, 1004, 106, 1, 12000, 0),
(6, 1004, 107, 1, 9000, 5),
(7, 1005, 108, 3, 999, 0),
(8, 1006, 109, 2, 1999, 10),
(9, 1007, 110, 1, 2999, 0),
(10, 1008, 101, 1, 65000, 5),
(11, 1009, 102, 2, 30000, 8),
(12, 1010, 105, 1, 18000, 0);

-- Total revenue
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM OrderDetails;

-- Total Orders 
SELECT COUNT(*) AS Total_Orders
from Orders;

-- Completed orders 
SELECT 
    COUNT(*) AS completed_orders
FROM Orders
WHERE order_status = 'Completed';


SELECT 
    order_status,
    COUNT(*) AS order_count
FROM Orders
GROUP BY order_status;

-- Category generate most revenue

SELECT
    p.category,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM Product p
JOIN OrderDetails od
    ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- product of  Electronics category responsible for that
SELECT
    p.product_name,
    SUM(od.quantity * od.unit_price) AS revenue
FROM Product p
JOIN OrderDetails od
    ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;


-- Top performing Products

SELECT
    p.product_name,
    SUM(od.quantity * od.unit_price) AS revenue
FROM Product p
JOIN OrderDetails od
    ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;


-- Where our customer buying fro
SELECT
    o.shipping_city,
    SUM(od.quantity * od.unit_price) AS revenue
FROM Orders o
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY o.shipping_city
ORDER BY revenue DESC;

-- Customer contributing most revenue

SELECT
    c.customer_name,
    SUM(od.quantity * od.unit_price) AS total_spending
FROM Customer c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

-- Monthly Sale trends

SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(od.quantity * od.unit_price) AS revenue
FROM Orders o
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    sales_year,
    sales_month;
    
    
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Employee;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;


-- Average_order_value of customer
SELECT
    SUM(od.quantity * od.unit_price) / COUNT(DISTINCT o.order_id)
        AS average_order_value
FROM Orders o
JOIN OrderDetails od
    ON o.order_id = od.order_id;
    
    
-- Payment method
SELECT payment_method ,COUNT(*) AS TOTAL_ORDERS 
FROM Orders
GROUP BY payment_method
ORDER BY TOTAL_ORDERS DESC;


-- Classifying customers based on spending
SELECT
    c.customer_name,
    SUM(od.quantity * od.unit_price) AS spending,

    CASE
        WHEN SUM(od.quantity * od.unit_price) >= 50000
            THEN 'High Value'

        WHEN SUM(od.quantity * od.unit_price) >= 20000
            THEN 'Medium Value'

        ELSE 'Low Value'
    END AS customer_segment

FROM Customer c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name;


SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Employee;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
-- Each category wise top 3 products

WITH CTE AS(SELECT P.product_name as Product,
       P.category as Category,
       Sum(od.quantity * od.unit_price) as Total_revenue
       from Product as P JOIN OrderDetails AS od
       ON P.product_id=od.product_id
       GROUP BY P.product_name, P.category),
       
CTE2 AS (
    SELECT 
        Product,
        Category,
        Total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_revenue DESC
        ) AS rnk
    FROM CTE
)
select * from CTE2
WHERE rnk<=3;


       
       
	   
























