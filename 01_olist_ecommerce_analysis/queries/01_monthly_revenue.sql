-- Monthly Revenue Trend
-- Shows total revenue and orders per month for delivered orders

SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value)::NUMERIC, 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY month;
