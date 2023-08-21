--------------------------------------------------------------------------------------------
---------------------------------------IMPORTING DATA---------------------------------------
--------------------------------------------------------------------------------------------
BEGIN;

CREATE TABLE ecommerce (
    CustomerID CHAR (50),
    Churn INT,
    Tenure INT,
    PreferredLoginDevice CHAR (50),
    CityTier INT,
    WarehouseToHome INT,
    PreferredPaymentMode CHAR (50),
    Gender CHAR (50),
    HourSpendOnApp INT,
    NumberOfDeviceRegistered INT,
    PreferedOrderCat CHAR (50),
    SatisfactionScore INT,
    MaritalStatus CHAR (50),
    NumberOfAddress INT,
    Complain INT,
    OrderAmountHikeFromlastYear INT,
    CouponUsed INT,
    OrderCount INT,
    DaySinceLastOrder INT,
    CashbackAmount INT
);

COPY ecommerce (CustomerID, Churn, Tenure, PreferredLoginDevice,
                CityTier, WarehouseToHome, PreferredPaymentMode,
                Gender,	HourSpendOnApp,	NumberOfDeviceRegistered,
                PreferedOrderCat, SatisfactionScore, MaritalStatus,
                NumberOfAddress, Complain, OrderAmountHikeFromlastYear,	
                CouponUsed, OrderCount,	DaySinceLastOrder, CashbackAmount
)
FROM 'E:\Data Analyst\Projects\E Commerce\E_Commerce.csv'
DELIMITER ';'
CSV HEADER;
