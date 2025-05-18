USE adashi_assessment;

-- Question 2: Transaction Frequency Analysis
-- Task: Calculate the average number of transactions per customer per month and categorize them.

-- Main query 
SELECT 
    -- Categorizing based on average monthly transactions:
    -- High Frequency: >= 10 transactions/month
    -- Medium Frequency: 3 to 9 transactions/month
    -- Low Frequency: <= 2 transactions/month
    CASE 
        WHEN sub.avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN sub.avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    
    -- Counting the number of customers in each category
    COUNT(*) AS customer_count,
    
    -- Calculating the average number of transactions per customer per month (rounded to 2 decimal places)
    ROUND(AVG(sub.avg_transactions_per_month), 2) AS avg_transactions_per_month
    
FROM (
    -- Subquery: Calculate the average transactions per month for each customer
    SELECT 
        owner_id, 
        COUNT(*) / 12.0 AS avg_transactions_per_month
    FROM savings_savingsaccount
    GROUP BY owner_id
) sub

-- Grouping by frequency category to get the final count and average
GROUP BY frequency_category;
