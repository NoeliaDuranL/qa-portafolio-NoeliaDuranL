-- Ejemplo de una BD básica de un ecommerce
CREATE DATABASE IF NOT EXISTS qa_portfolio;
USE qa_portfolio;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id_product INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

CREATE TABLE orders (
  id_order INT AUTO_INCREMENT PRIMARY KEY,
  id_user INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE order_items (
  id_order INT NOT NULL,
  id_product INT NOT NULL,
  qty INT NOT NULL CHECK (qty > 0),
  unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
  PRIMARY KEY (id_order, id_product),
  FOREIGN KEY (id_order) REFERENCES orders(id_order),
  FOREIGN KEY (id_product) REFERENCES products(id_product)
);

-- Data examples (with some intentional data issues for testing)
INSERT INTO users (email, password_hash) VALUES
('ana@example.com','hash1'),
('bruno@example.com','hash2'),
('ana@example.com','hash3'); -- duplicated email

INSERT INTO products (name, price, stock) VALUES
('Laptop 13', 999.99, 10),
('Mouse Pro', 25.00, 100),
('Gift Card', -5.00, 100); -- Negative price

INSERT INTO orders (id_user) VALUES 
(1), (2), (1); -- Order without items

INSERT INTO order_items (id_order, id_product, qty, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 2, 2, 25.00),
(2, 999, 1, 10.00); -- Product number 999 does not exist
