USE adashi_assessment;

-- Question 1: High-Value Customers with Multiple Products
-- Task: Find customers who have at least one funded savings plan AND one funded investment plan,
--       then sort them by total deposits in descending order.

SELECT 
    u.id AS owner_id,  -- Customer's unique ID
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    SUM(s.confirmed_amount) AS total_deposits

FROM users_customuser u
-- Join savings accounts owned by the customer
JOIN savings_savingsaccount s ON u.id = s.owner_id
-- Join investment plans owned by the customer
JOIN plans_plan p ON u.id = p.owner_id
-- Filter only savings accounts with positive confirmed amounts (funded)
WHERE s.confirmed_amount > 0
-- Filter only plans that are flagged as investment funds
AND p.is_a_fund = 1
-- Group results by user to aggregate counts and sums per customer
GROUP BY u.id, u.first_name, u.last_name

HAVING savings_count > 0 AND investment_count > 0

-- Sort customers by their total deposits in descending order (highest deposits first)
ORDER BY total_deposits DESC;
