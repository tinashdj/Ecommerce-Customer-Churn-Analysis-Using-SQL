------------------------------------------------------------------------------------------
---------------------------------------DATA CLEANING--------------------------------------
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
--------------------------------Checking for duplicate rows-------------------------------
------------------------------------------------------------------------------------------
SELECT CustomerID, Churn, Tenure, PreferredLoginDevice, CityTier, WarehouseToHome, 
PreferredPaymentMode, Gender, HourSpendOnApp, NumberOfDeviceRegistered, 
PreferedOrderCat, SatisfactionScore, MaritalStatus, NumberOfAddress, Complain, 
OrderAmountHikeFromlastYear,CouponUsed, OrderCount, DaySinceLastOrder, CashbackAmount, COUNT(*)
FROM ecommerce
GROUP BY CustomerID, Churn, Tenure, PreferredLoginDevice, CityTier, WarehouseToHome, 
PreferredPaymentMode, Gender, HourSpendOnApp, NumberOfDeviceRegistered, 
PreferedOrderCat, SatisfactionScore, MaritalStatus, NumberOfAddress, Complain, 
OrderAmountHikeFromlastYear,CouponUsed, OrderCount, DaySinceLastOrder, CashbackAmount
HAVING COUNT(*) > 1;


------------------------------------------------------------------------------------------
----------------------------------Checking for null values--------------------------------
------------------------------------------------------------------------------------------
SELECT 'Tenure' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE Tenure IS NULL 
UNION
SELECT 'WarehouseToHome' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE warehousetohome IS NULL 
UNION
SELECT 'HourSpendonApp' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE hourspendonapp IS NULL
UNION
SELECT 'OrderAmountHikeFromLastYear' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE orderamounthikefromlastyear IS NULL 
UNION
SELECT 'CouponUsed' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE couponused IS NULL 
UNION
SELECT 'OrderCount' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE ordercount IS NULL 
UNION
SELECT 'DaySinceLastOrder' as ColumnName, COUNT(*) AS NullCount 
FROM ecommerce
WHERE daysincelastorder IS NULL
;


------------------------------------------------------------------------------------------
----------------------------------Handling for null values--------------------------------
------------------------------------------------------------------------------------------
UPDATE ecommerce
SET tenure = (SELECT AVG(tenure) FROM ecommerce),
    warehousetohome = (SELECT  AVG(warehousetoHome) FROM ecommerce),
    hourspendonapp = (SELECT  AVG(hourspendonapp) FROM ecommerce),
    orderamounthikefromlastyear = (SELECT  AVG(orderamounthikefromlastyear) FROM ecommerce),
    couponused = (SELECT  AVG(couponused) FROM ecommerce),
    ordercount = (SELECT  AVG(ordercount) FROM ecommerce),
    daysincelastorder = (SELECT  AVG(daysincelastorder) FROM ecommerce)
WHERE tenure ISNULL OR warehousetohome ISNULL OR hourspendonapp 
    ISNULL OR orderamounthikefromlastyear ISNULL OR couponused ISNULL OR ordercount 
    ISNULL OR daysincelastorder ISNULL
;


------------------------------------------------------------------------------------------
--------------------------------Handling inconsistency values-----------------------------
------------------------------------------------------------------------------------------

--------------------Fixing inconsistency in “PreferedLoginDevice” Column------------------
UPDATE ecommerce
SET preferredlogindevice = 'Phone'
WHERE preferredlogindevice = 'Mobile Phone'
;

-------------------Fixing inconsistency in “PreferredPaymentMode” Column------------------
UPDATE ecommerce
SET preferredpaymentmode = 'Cash on Delivery'
WHERE preferredpaymentmode = 'COD'
;

---------------------Fixing inconsistency in “PreferedOrderCat” Column--------------------
UPDATE ecommerce
SET preferedordercat = 'Mobile Phone'
WHERE preferedordercat = 'Mobile'
;

----------------------Fixing inconsistency in “WarehouseToHome” Column--------------------
UPDATE ecommerce
SET warehousetohome = '26'
WHERE warehousetohome ='126';

UPDATE ecommerce
SET warehousetohome = '27'
WHERE warehousetohome ='127';


------------------------------------------------------------------------------------------
----------------------Creating new columns for additional information---------------------
------------------------------------------------------------------------------------------

---------------------------------------customerstatus-------------------------------------
ALTER TABLE ecommerce
ADD customerstatus VARCHAR (50)

UPDATE ecommerce
SET customerstatus = 
CASE 
    WHEN churn = 1 THEN 'Churned'
    WHEN churn = 0 THEN 'Stayed'
END

---------------------------------------complainstatus-------------------------------------
ALTER TABLE ecommerce
ADD complainstatus VARCHAR (50)

UPDATE ecommerce
SET complainstatus =
CASE 
    WHEN complain = 1 THEN 'Yes'
    WHEN complain = 0 THEN 'No'
END

------------------------------------warehousetohomerange----------------------------------
ALTER TABLE ecommerce
ADD warehousetohomerange VARCHAR (50)

UPDATE ecommerce
SET warehousetohomerange =
CASE
    WHEN warehousetohome <= 10 THEN 'Very Close Distance'
    WHEN warehousetohome > 10 AND warehousetohome <=20 THEN 'Close Distance'
    WHEN warehousetohome > 20 AND warehousetohome <=30 THEN 'Moderate Distance'
    WHEN warehousetohome >30 THEN 'Far Distance'
END

----------------------------------------TenureRange---------------------------------------
ALTER TABLE ecommerce
ADD TenureRange VARCHAR (50)

UPDATE ecommerce
SET TenureRange =
CASE
    WHEN tenure <= 6 THEN '6 Months'
    WHEN tenure > 6 AND tenure <= 12 THEN '1 Year'
    WHEN tenure > 12 AND tenure <= 24 THEN '2 Years'
    WHEN tenure > 24 THEN 'More than 2 Years'
END

------------------------------------cashbackamountrange-----------------------------------
ALTER TABLE ecommerce
ADD cashbackamountrange VARCHAR (50)

UPDATE ecommerce
SET cashbackamountrange =
CASE 
    WHEN cashbackamount <= 100 THEN 'Low Cashback Amount'
    WHEN cashbackamount > 100 AND cashbackamount <= 200 THEN 'Moderate Cashback Amount'
    WHEN cashbackamount > 200 AND cashbackamount <= 300 THEN 'High Cashback Amount'
    WHEN cashbackamount > 300 THEN 'Very High Cashback Amount'
END
