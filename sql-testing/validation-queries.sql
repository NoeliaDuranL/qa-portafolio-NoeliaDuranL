-- Duplicate emails
SELECT email, COUNT(*) AS cnt
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- Orders without items
SELECT o.id_order
FROM orders o
LEFT JOIN order_items oi ON o.id_order = oi.id_order
WHERE oi.id_order IS NULL;

-- Items referencing non-existing product
SELECT oi.id_order, oi.id_product
FROM order_items oi
LEFT JOIN products p ON p.id_product = oi.id_product
WHERE p.id_product IS NULL;

-- Negative prices or stock
SELECT id_product, name, price, stock
FROM products
WHERE price < 0 OR stock < 0;

-- Orphan orders referencing non-existing users
SELECT o.id_order, o.id_user
FROM orders o
LEFT JOIN users u ON u.id_user = o.id_user
WHERE u.id_user IS NULL;
