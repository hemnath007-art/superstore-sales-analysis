DROP DATABASE IF EXISTS superstore_db;
CREATE DATABASE superstore_db;
USE superstore_db;
CREATE TABLE customers (
    customer_id   VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment       VARCHAR(20) NOT NULL
);

CREATE TABLE products (
    product_id   VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category     VARCHAR(30) NOT NULL,
    sub_category VARCHAR(30) NOT NULL
);

CREATE TABLE orders (
    order_id    VARCHAR(20) PRIMARY KEY,
    order_date  DATE NOT NULL,
    ship_date   DATE NOT NULL,
    ship_mode   VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    country     VARCHAR(50) NOT NULL,
    city        VARCHAR(50) NOT NULL,
    state       VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    region      VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    row_id     INT PRIMARY KEY,
    order_id   VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    sales      DECIMAL(12,4) NOT NULL,
    quantity   INT NOT NULL,
    discount   DECIMAL(4,2) NOT NULL,
    profit     DECIMAL(12,4) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
SHOW TABLES;
DESCRIBE orders;