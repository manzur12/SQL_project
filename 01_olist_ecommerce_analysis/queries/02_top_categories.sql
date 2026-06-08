-- Top 10 Product Categories by Revenue
-- Shows highest revenue generating categories for delivered orders

SELECT 
    COALESCE(t.product_category_name_english, p.product_category_name, 'Unknown') AS category,
    ROUND(SUM(pay.payment_value)::NUMERIC, 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_payments pay ON oi.order_id = pay.order_id
LEFT JOIN product_category_translation t ON p.product_category_name = t.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY COALESCE(t.product_category_name_english, p.product_category_name, 'Unknown')
ORDER BY total_revenue DESC
LIMIT 10;
