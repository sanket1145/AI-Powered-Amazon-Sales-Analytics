SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'C:/Users/SANKET PATIL/OneDrive/Desktop/Amazon Sales Analysis/Dataset/Amazon_Sales_Data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    OrderID,
    OrderDate,
    CustomerID,
    CustomerName,
    ProductID,
    ProductName,
    Category,
    Brand,
    Quantity,
    UnitPrice,
    Discount,
    Tax,
    ShippingCost,
    TotalAmount,
    PaymentMethod,
    OrderStatus,
    City,
    State,
    Country,
    SellerID
);