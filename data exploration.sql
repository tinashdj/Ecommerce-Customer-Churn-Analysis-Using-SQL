------------------------------------------------------------------------------------------
--------------------------------------DATA EXPLORATION------------------------------------
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
------------------------1. What is the overall customer churn rate?-----------------------
SELECT TotalNumberofCustomers, 
       TotalNumberofChurnedCustomers,
       CAST((TotalNumberofChurnedCustomers * 1.0 / 
             TotalNumberofCustomers * 1.0)*100 AS DECIMAL(10,2)) AS ChurnRate
FROM
(SELECT COUNT(*) AS TotalNumberofCustomers
FROM ecommerce) AS Total,
(SELECT COUNT(*) AS TotalNumberofChurnedCustomers
FROM ecommerce
WHERE CustomerStatus = 'Churned') AS Churned
;

------------------------------------------------------------------------------------------
------------2. How does the churn rate vary based on the preferred login device?----------
SELECT PreferredLoginDevice, 
    COUNT(*) AS TotalCustomers,
    SUM (churn) AS ChurnedCustomers,
    CAST (SUM (churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY PreferredLoginDevice
;

------------------------------------------------------------------------------------------
-----------3. What is the distribution of customers across different city tiers?----------
SELECT citytier, 
    COUNT(*) AS totalcustomers,
    SUM(churn) AS churnedcustomers,
    CAST(SUM (churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY citytier
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
--4. Is there any correlation between the warehouse-to-home distance and customer churn?--
SELECT warehousetohomerange, 
    COUNT(*) AS TotalCustomer,
    SUM(churn) AS CustomerChurn,
    CAST(SUM(churn)*1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY warehousetohomerange
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
-----------5. What is the most preferred payment mode among churned customers?-----------
SELECT preferredpaymentmode,
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn)*1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY preferredpaymentmode
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
-------------------6. What is the typical tenure for churned customers?-------------------
SELECT TenureRange, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY TenureRange
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
-----------------7. What is the difference in churn rate based on gender?-----------------
SELECT gender, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY gender
ORDER BY ChurnRate DESC
;

---------------------------------------------------------------------------------------------------
----8. How does the average time spent on the app differ for churned and non-churned customers?----
SELECT customerstatus, ROUND(AVG (hourspendonapp)) AS AvgHourSpend
FROM ecommerce
GROUP BY customerstatus
;

------------------------------------------------------------------------------------------
---------9. Does the number of registered devices impact the likelihood of churn?---------
SELECT numberofdeviceregistered, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY numberofdeviceregistered
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
-----------10. What order category is most preferred among churned customers?------------
SELECT preferedordercat, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
    FROM ecommerce
GROUP BY preferedordercat
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
-----------------11. What is the churn rate based on satisfaction scores?-----------------
SELECT satisfactionscore, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY satisfactionscore
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
--------------12. Does the marital status of customers impact the churn rate?-------------
SELECT maritalstatus, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY maritalstatus
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
---------------------13. Do customer complaints impact the churn rate?--------------------
SELECT complainstatus, 
    COUNT(*) AS TotalCustomer,
    SUM (churn) AS CustomerChurn,
    CAST(SUM(churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS ChurnRate
FROM ecommerce
GROUP BY complainstatus
ORDER BY ChurnRate DESC
;

------------------------------------------------------------------------------------------
----14. How does the use of coupons differ between churned and non-churned customers?-----
SELECT customerstatus, SUM(couponused) AS Totalcouponused
FROM ecommerce
GROUP BY customerstatus
;

------------------------------------------------------------------------------------------
----15. What is the average number of days since the last order for churned customers?----
SELECT ROUND(AVG(daysincelastorder)) AS AvgDaysSInceLastOrder
FROM ecommerce
WHERE customerstatus = 'Churned'
;

------------------------------------------------------------------------------------------
-----------16. Is there any correlation between cashback amount and churn rate?-----------
SELECT cashbackamountrange,
    COUNT(*) AS totalcustomer,
    SUM (churn) AS customerchurn,
    CAST(SUM (churn) * 1.0 / COUNT(*) * 100 AS DECIMAL (10,2)) AS Churnrate
FROM ecommerce
GROUP BY cashbackamountrange
ORDER BY churnrate DESC
;
