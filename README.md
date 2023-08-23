# Ecommerce-Customer-Churn-Analysis

This dataset from [Kaggle](https://www.kaggle.com/datasets/ankitverma2010/ecommerce-customer-churn-analysis-and-prediction?sort=most-comments), and it contains information such as customers' personal details, satisfaction scores, preferred payment mode, days since the last order, and cashback amount. I used SQL (POstgreSQL) to clean and analyze this dataset.
The data set belongs to a leading online E-Commerce company. An online retail (E commerce) company wants to know the customers who are going to churn, so accordingly they can approach customer to offer some promos.

This analysis is divided into several steps: 
## 1. Data Cleaning
   - Checking for duplicate rows
   - Checking for null values
   - Handling for null values
   - Handling inconsistency values
   - Creating new columns for additional information
## 3. Data Exploration
## 4. Business Insights
   - The dataset contains 5,630 customers with overall churn rate 16,84%.
   - Customers who prefer login with a computer have slightly higher churn rate compared to login with a phone suggesting different usage patterns and preferences. This may indicate that customers who access the ecommerce with computer might have different usage patterns, preferences, or experiences that contribute to a higher likelihood of churn.
   - The city tier affects on customers churns rate. Tier 3 cities have higher churn rate than Tier 1 and Tier 2 cities, possibly due to behavior and customer preferences.
     - City Tier 1 is typically a major metropolitan area with the highest level of economic development and infrastructure. These cities are usually the most populous and have significant commercial and business centers.
     - City Tier 2 is considered smaller or secondary urban centers compared to Tier 1 cities.
     - City Tier 3 is further down the hierarchy and generally refers to smaller towns or cities with a smaller population and less developed infrastructure compared to Tier 1 and 2 cities.
   - The distance between warehouse to customers home affects churn rate, customers who living near the warehouse showing lower churn while customers living further from the warehouse are more likely to churn. This customers retention probably caused by factors such as delivery times, shipping costs, or store availability.
   - Customers with the longer tenure or stay with the company more than 2 years showing lower churn rate compared to customers with shorter tenure like 6 months or less.
   - Male customers have slightly higher churn rate than female customers, although the difference churn rate is minimal.
   - App usage time of customers who churned and not churned have the same average hours spend on the app. This indicates that the average app usage time is not one of the factors of customer churn.
   - The different order categories have relation with customer’s churn. There’s an indication that the product / values didn’t meet the user expectations especially in “Mobile Phone” category. Customers who order related to “Mobile Phone” category has the highest churn rate, while “Grocery” has the lowest. Make retention strategies for specific categories.
   - Customers that give satisfaction score 5 of customers service have a relatively showing higher churn rate compared to the lower satisfaction scores. This shows that even highly satisfied score given by the customers for the services can lead to high churn rate.
   - The total of customers complain is less than customers do not complain, but the customer churn of the customers who complained is higher than not complain.
   - Non-churned customers use more coupon compared to churned customers. This shows the loyalty and engagement between non churned customers with the company.
   - Churned customers have a short time since their last order (avg only 3 days) that they recently stopped engaging with the platform.
## 5. Recommendations

   a. Enhance the UI/UX friendly for customers who prefer logging in via a computer to make customers can use the app easily. Conduct research to identify any issues they might be facing while login by computer.

   b. Conduct research to identify the customers behaviors based on city tier. Tailor retention strategies based on the different city tiers. Understand the preferences and behaviors of customers in each tier to provide targeted offerings.
   
   c. Optimize logistics and delivery to improve customer retention. Focus on reducing delivery times, lowering shipping costs, and finding ways to make the process more convenient, especially for customers living further away.

   d. Develop targeted retention initiatives for specific order categories, especially “Mobile Phone” category. Offer discounts, cashbacks or lower the price, to improve customers engagement loyalty and to prevent higher customer churn.

   e. Improve service quality and address customer service issues promptly across all satisfaction level and complains. Identify and address common service failure issues, enhance customer support channels, and implement proactive service monitoring and troubleshooting. Actively listen to customers feedback, make necessary improvements, and demonstrate a commitment to addressing their concerns.


