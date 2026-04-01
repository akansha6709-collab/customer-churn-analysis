-- Customer Churn Analysis SQL

-- 1. Total Customers & Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data;

--------------------------------------------------

-- 2. Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate DESC;

--------------------------------------------------

-- 3. Churn by Tenure Group
SELECT 
    CASE 
        WHEN tenure <= 6 THEN '0-6 Months'
        WHEN tenure <= 12 THEN '6-12 Months'
        ELSE '12+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY tenure_group
ORDER BY churn_rate DESC;

--------------------------------------------------

-- 4. Churn by Payment Method
SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

--------------------------------------------------

-- 5. Average Monthly Charges (Churn vs Retained)
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;

--------------------------------------------------

-- 6. Churn by Internet Service
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY InternetService
ORDER BY churn_rate DESC;

--------------------------------------------------

-- 7. Combined Analysis (Contract + Internet Service)
SELECT 
    Contract,
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC;
