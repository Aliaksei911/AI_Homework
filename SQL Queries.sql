-- Создание таблицы
CREATE TABLE orders (
id INTEGER PRIMARY KEY,
customer TEXT,
amount REAL,
order_date DATE
);

-- Вставка данных
INSERT INTO orders (customer, amount, order_date) VALUES
('Alice', 5000, '2024-03-01'),
('Bob', 8000, '2024-03-05'),
('Alice', 3000, '2024-03-15'),
('Charlie', 7000, '2024-02-20'),
('Alice', 10000, '2024-02-28'),
('Bob', 4000, '2024-02-10'),
('Charlie', 9000, '2024-03-22'),
('Alice', 2000, '2024-03-30');

-- 1. Общая сумма продаж за март 2024
SELECT 'Total Sales in March' AS Metric, SUM(amount) AS Result
FROM orders
WHERE strftime('%Y-%m', order_date) = '2024-03'

-- 2. Клиент, потративший больше всего
SELECT 'Top-Spending Customer: ' || customer, SUM(amount)
FROM orders
GROUP BY customer
ORDER BY SUM(amount) DESC
    LIMIT 1

-- 3. Средняя сумма заказа за последние 3 месяца
SELECT 'Average Order Value (Jan–Mar)', ROUND(AVG(amount), 2)
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31';
