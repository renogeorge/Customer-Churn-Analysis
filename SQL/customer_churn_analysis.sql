CREATE DATABASE customer_churn;
USE customer_churn;
SELECT DATABASE();

use customer_churn;
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,
    SUM(CASE
        WHEN Churn = 'No' THEN 1
        ELSE 0
    END) AS retained_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS churn_rate
FROM
    telco_churn;

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS churn_rate
FROM
    telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS churn_rate
FROM
    telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

