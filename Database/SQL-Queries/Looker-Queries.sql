/*
Business Question: How did engagements differ across different devices?
Expected Output: Date | Device | ActionTypes (Transactions, GroupCreation, GroupJoins)
 */
SELECT
    ActionDate AS Month,
    DeviceType,
    EngagementID AS EngagementCount,
    CASE WHEN ActionType = 'Added a transaction' THEN 1 END AS TransactionActions,
    CASE WHEN ActionType = 'Created a group' THEN 1 END AS GroupCreations,
    CASE WHEN ActionType = 'Joined a group' THEN 1 END AS GroupJoins
FROM
    Engagements;
    
/*
Business Question: What factors could be affecting user renewal rate?
Expected Output: Date | Plan | Country | Source | Subscriptions | Renewals
 */
SELECT
    DATE_TRUNC('month', s.StartDate) AS Month,
    s.PlanType,                            
    u.Country,                      
    u.ReferralSource,                        
    s.SubscriptionID,                        
    CASE WHEN s.RenewalStatus = 'Active' THEN 1 ELSE 0 END AS IsRenewed 
FROM
    Subscriptions s
	JOIN Users u ON s.UserID = u.UserID;

/*
Business Question: How have transaction volumes and amounts changed across categories over time?
Expected Output: Date | Category | Total Transactions | Total Amount
 */
SELECT
    DATE_TRUNC('month', t.Date) AS Month,
    t.Category,
    t.TransactionID AS TotalTransactions,
    t.Amount AS TotalAmount
FROM
    Transactions t;
   
/*
Business Question: How has Churn Risk changed over the last two years?
Expected Output: Month | Churn Risk | Users
 */
SELECT
    DATE_TRUNC('month', u.SignupDate) AS Month,
    r.ChurnRisk,
    r.UserID AS UserCount
FROM
    RetentionMetrics r
JOIN
    Users u ON r.UserID = u.UserID;

/*
Business Question: Which referral sources drive the most engaged and retained users over time?
Expected Output F-1: User | Month | Total Actions
Expected Output Final: Month | Referral Source | Total Users | Avg Engagement Actions | Retention Rate
 */
WITH UserEngagement AS (
    SELECT
        e.UserID,
        DATE_TRUNC('month', e.ActionDate) AS Month,
        COUNT(e.EngagementID) AS TotalActions
    FROM
        Engagements e
    GROUP BY
        e.UserID, DATE_TRUNC('month', e.ActionDate)
)
SELECT
    DATE_TRUNC('month', u.SignupDate) AS Month,
    u.ReferralSource,
    COUNT(DISTINCT u.UserID) AS TotalUsers, 
    AVG(ue.TotalActions) AS AvgEngagementActions, 
    ROUND(100.0 * COUNT(CASE WHEN r.MonthlyActive = 'Y' THEN 1 END) / COUNT(DISTINCT u.UserID), 2) AS RetentionRate 
FROM
    Users u
    LEFT JOIN UserEngagement ue ON u.UserID = ue.UserID AND DATE_TRUNC('month', u.SignupDate) = ue.Month
	LEFT JOIN RetentionMetrics r ON u.UserID = r.UserID
GROUP BY
    DATE_TRUNC('month', u.SignupDate), u.ReferralSource;
    
   
SELECT
    DATE_TRUNC('month', s.StartDate) AS Month,
    s.PlanType,
    ROUND(SUM(CASE WHEN s.RenewalStatus = 'Active' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.SubscriptionID), 2) AS RenewalRate
FROM
    Subscriptions s
WHERE
    DATE_TRUNC('month', s.StartDate) >= '2023-01-01' AND s.PlanType = 'Premium'
GROUP BY
    DATE_TRUNC('month', s.StartDate), s.PlanType;
