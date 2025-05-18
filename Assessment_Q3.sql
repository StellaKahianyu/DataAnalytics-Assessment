USE adashi_assessment;

-- Question 3: Account Inactivity Alert
-- Task: Find all active accounts (savings or investments) with no transactions in the last 1 year.

-- Query to fetch inactive Investment accounts
SELECT 
    p.id AS plan_id,                            
    p.owner_id,                                
    'Investment' AS type,                      
    MAX(p.last_charge_date) AS last_transaction_date,  
    DATEDIFF(CURDATE(), MAX(p.last_charge_date)) AS inactivity_days  
FROM plans_plan p
-- Filter: Select only plans with no transactions in the last 1 year
WHERE p.last_charge_date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.id, p.owner_id   

-- Combine the results with Savings accounts
UNION ALL

-- Query to fetch inactive Savings accounts
SELECT 
    s.id AS plan_id,                            
    s.owner_id,                                
    'Savings' AS type,                         
    MAX(s.transaction_date) AS last_transaction_date,  
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days  
FROM savings_savingsaccount s
-- Filter: Select only savings accounts with no transactions in the last 1 year
WHERE s.transaction_date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY s.id, s.owner_id   
