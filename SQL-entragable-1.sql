
CREATE DATABASE IF NOT EXISTS ecommerce_transactions;
USE ecommerce_transactions;


CREATE TABLE customers (
    id_customer INT PRIMARY KEY,
    clientName TEXT,
    email VARCHAR(255),
    birthDate DATE,
    INDEX(email)
);


CREATE TABLE product_categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Product_Categories(category_id)
);

CREATE TABLE orders (
    ID VARCHAR(255) PRIMARY KEY,
    hostname VARCHAR(255),
    creationDate DATETIME(6),
    clientName TEXT,
    items TEXT,
    totalValue DECIMAL(13,2),
    paymentNames TEXT,
    status TEXT,
    origin TEXT,
    totalItems INT,
    CustomerEmail VARCHAR(255),
    FOREIGN KEY (CustomerEmail) REFERENCES Customers(email)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id VARCHAR(255),
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(ID),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    start_date DATETIME,
    end_date DATETIME,
    discount_percentage DECIMAL(5,2),
    applicable_product_id INT,
    FOREIGN KEY (applicable_product_id) REFERENCES Products(product_id)
);

CREATE TABLE transactions (
    ID_transaction INT PRIMARY KEY,
    seller TEXT,
    connector TEXT,
    gmv DECIMAL(10,2),
    installments INT,
    authorized TINYINT(1),
    account VARCHAR(255),
    transactionId TEXT,
    paymentId TEXT,
    FOREIGN KEY (account) REFERENCES accounts(account)

);

CREATE TABLE accounts (
    hostname VARCHAR(255) PRIMARY KEY,
    account VARCHAR(255)
);


CREATE TABLE Sellers (
    id_sellers INT PRIMARY KEY,
    account VARCHAR(255),
    sellers TEXT,
    sellerId TEXT
   FOREIGN KEY (account) REFERENCES accounts(account)
);
