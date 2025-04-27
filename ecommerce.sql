-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Independent Tables (No foreign keys first)

-- 1. brand table
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. product_category table
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 3. color table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- 4. size_category table
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- tables with reference

-- 5. size_option table
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_value VARCHAR(50) NOT NULL,
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- 6. attribute_category table
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 7. attribute_type table
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Dependent Tables (with foreign keys next)

-- 8. product table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 9. product_item table
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- 10. product_image table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 11. product_attribute table
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

-- 12. product_variation table
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_name VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- TO perform insertion
USE ecommerce;

-- Insert into brand
INSERT INTO brand (name) VALUES
('Nike'),
('Apple'),
('Samsung'),
('Adidas');

-- Insert into product_category
INSERT INTO product_category (category_name) VALUES
('Electronics'),
('Clothing'),
('Footwear');

-- Insert into color
INSERT INTO color (color_name) VALUES
('Red'),
('Blue'),
('Black'),
('White');

-- Insert into size_category
INSERT INTO size_category (category_name) VALUES
('Clothing Size'),
('Shoe Size');

-- Insert into size_option
INSERT INTO size_option (size_value, size_category_id) VALUES
('S', 1),
('M', 1),
('L', 1),
('42', 2),
('43', 2);

-- Insert into attribute_category
INSERT INTO attribute_category (category_name) VALUES
('Physical Attributes'),
('Technical Attributes');

-- Insert into attribute_type
INSERT INTO attribute_type (type_name) VALUES
('Text'),
('Number'),
('Boolean');

-- Insert into product
INSERT INTO product (name, base_price, brand_id, category_id) VALUES
('iPhone 15', 999.99, 2, 1),
('Nike Running Shoes', 120.00, 1, 3),
('Samsung Galaxy S23', 899.99, 3, 1);

-- Insert into product_item
INSERT INTO product_item (product_id, color_id, size_option_id, stock_quantity, price) VALUES
(1, 4, NULL, 50, 999.99), -- iPhone (no size)
(2, 2, 2, 30, 120.00),    -- Nike Shoes, Blue, Size M
(3, 3, NULL, 40, 899.99); -- Samsung Galaxy (no size)

-- Insert into product_image
INSERT INTO product_image (product_id, image_url) VALUES
(1, 'images/iphone15.png'),
(2, 'images/nike_shoes.png'),
(3, 'images/samsung_galaxy.png');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value) VALUES
(1, 2, 2, 'Battery Capacity', '4000mAh'),
(2, 1, 1, 'Material', 'Mesh'),
(3, 2, 2, 'RAM', '8GB');

-- Insert into product_variation
INSERT INTO product_variation (product_id, variation_name) VALUES
(2, 'Nike Shoes Color Options'),
(3, 'Galaxy S23 Memory Variants');

