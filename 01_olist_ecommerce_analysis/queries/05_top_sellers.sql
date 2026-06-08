SELECT
	s.seller_id,
	s.seller_city,
	s.seller_state,
	ROUND(SUM(pay.payment_value)::NUMERIC, 2) AS total_revenue,
	COUNT(DISTINCT oi.order_id) AS total_orders,
	ROUND(AVG(pay.payment_value)::NUMERIC, 2) AS avg_order_value
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN order_payments pay ON oi.order_id = pay.order_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY total_revenue DESC
LIMIT 10;