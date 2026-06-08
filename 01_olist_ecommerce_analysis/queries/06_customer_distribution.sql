WITH customer_counts AS(
	SELECT
		c.customer_state,
		COUNT(DISTINCT c.customer_id) AS total_customers
	FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
	WHERE o.order_status = 'delivered'
	GROUP BY c.customer_state
)

SELECT
	 customer_state,
	 total_customers,
	 ROUND(total_customers * 100.0 / SUM(total_customers) OVER()::NUMERIC, 2) AS percentage
FROM customer_counts
ORDER BY total_customers DESC;