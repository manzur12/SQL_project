SELECT
	payment_type,
	COUNT(DISTINCT order_id) AS total_orders,
	ROUND(SUM(payment_value)::NUMERIC, 2) AS total_revenue,
	ROUND(AVG(payment_value)::NUMERIC, 2) AS avg_payment_value,
	ROUND(AVG(payment_installments)::NUMERIC, 2) AS avg_installments,
	ROUND(COUNT(DISTINCT order_id) * 100.0 / SUM(COUNT(DISTINCT order_id)) OVER()::NUMERIC, 2) AS percenteage
FROM order_payments
GROUP BY payment_type
ORDER BY  total_orders DESC;