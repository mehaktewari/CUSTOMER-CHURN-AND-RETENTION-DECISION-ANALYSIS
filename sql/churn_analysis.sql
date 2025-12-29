-- Overall churn rate
SELECT
    ROUND(100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
    AS churn_rate
FROM customer_data;

-- Churn by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM customer_data
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Churn by payment method
SELECT
    PaymentMethod,
    ROUND(
        100.0 * SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM customer_data
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- High-risk customers
SELECT *
FROM customer_data
WHERE tenure < 12
AND Contract = 'Month-to-month';
