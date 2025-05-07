---QUESTION 1---
-- Step 1: Create the normalized table
CREATE TABLE ProductDetailNormalized (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Step 2: Insert normalized rows
INSERT INTO ProductDetailNormalized VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetailNormalized VALUES (101, 'John Doe', 'Mouse');

INSERT INTO ProductDetailNormalized VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetailNormalized VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetailNormalized VALUES (102, 'Jane Smith', 'Mouse');

INSERT INTO ProductDetailNormalized VALUES (103, 'Emily Clark', 'Phone');


--QUESTION 2----

-- Step 1: Create Orders table to remove partial dependency
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create OrderDetailsNormalized table with foreign key
CREATE TABLE OrderDetailsNormalized (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert distinct OrderID and CustomerName into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert order-product details into OrderDetailsNormalized
INSERT INTO OrderDetailsNormalized (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
