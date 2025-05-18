USE adashi_assessment;

-- Question 4: Customer Lifetime Value (CLV) Estimation
-- Task: Estimate CLV based on account tenure and transaction volume.

SELECT 
    u.id AS customer_id,  -- Customer's unique ID
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    ROUND(
        (COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * 0.001 * AVG(s.confirmed_amount), 
        2
    ) AS estimated_clv

FROM users_customuser u

-- Join savings accounts owned by the customer
JOIN savings_savingsaccount s ON u.id = s.owner_id

-- Group by customer to aggregate metrics
GROUP BY u.id, u.first_name, u.last_name

-- Sort customers by estimated CLV in descending order
ORDER BY estimated_clv DESC;
