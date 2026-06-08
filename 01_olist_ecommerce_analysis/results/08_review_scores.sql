SELECT
	review_score,
	COUNT(review_id) AS total_reviews,
	ROUND(COUNT(review_id) * 100.0 / SUM(COUNT(review_id)) OVER():: NUMERIC, 2) AS percentage
FROM order_reviews
GROUP BY review_score
ORDER BY  review_score DESC;