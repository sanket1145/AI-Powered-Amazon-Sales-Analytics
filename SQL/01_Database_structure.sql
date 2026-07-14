create schema amazon_ai_sales_analytics;

USE amazon_ai_sales_analytics;

CREATE TABLE sales_data (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate Varchar(20),
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100),
    ProductID VARCHAR(20),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Tax DECIMAL(10,2),
    ShippingCost DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(30),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    SellerID VARCHAR(20)
);