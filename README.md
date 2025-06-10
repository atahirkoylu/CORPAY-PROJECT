# CORPAY-PROJECT
Developed a data-driven model to improve eligibility criteria for a corporate credit card cross-sell program. Analyzed customer behavior, payment history, and risk metrics to identify high-performing customers previously excluded and underperforming customers mistakenly included.
## Project Objective
As the company diligently continues the implementation of the Cross-Sell Program, aimed at
expanding the adoption of Universal Cards among existing Fuel-Only Cardholders, a pertinent
issue has arisen. It has become evident that not all customers who initially met the eligibility
criteria and opted into the program have demonstrated the expected level of performance.
Conversely, there are customers who did not initially meet the eligibility requirements but have
exhibited exceptional performance in terms of low risk, great payment history, etc. This
divergence in customer outcomes has prompted a need for a strategic reevaluation of the
program, specifically in terms of opting customers in or out.
# BUSINESS REQUIREMENTS

1. What is the current eligibility criteria for the Cross-Sell program?
2. What performance metrics are being used to evaluate customers?
3. What is the bad rate difference between opt-in and opt-out customers?
4. What are the spend and loss differences between different parent accounts?
5. How are Cross-Sell accounts performing?
6. Using various analyses, what variables are needed to re-evaluate the eligibility
model?
7. Detect customers to swap-in and swap-out using the re-evaluated model.
8. What is the expected revenue and wrote-off amount using the new eligibility model?
9. What are the final recommendations of swap-in and swap-out customers?


## MODELS
Multi Regression Model: Utilizing data analysis techniques, such as multi variable regression analysis to evaluate various variables that strongly correlate with customer performance. Remove existing variables or add new variables if needed.
CHAID Model: CHi-squared Automatic Interaction Detection (CHAID) is a type of decision tree analysis used in data mining and statistical analysis. It's particularly useful when exploring relationships within categorical variables. Here's why CHAID might be used in this scenario like Identifying Key Segment, Optimizing Allocation, Interpretable Results.
Sensitive Analysis

## Findings

# Bad Rate Difference Between Fuel Only and Universal Customers:
  A notable difference in bad rates was observed between "Fuel Only" and "Universal" customers within the same profile.
  The bad rate difference was approximately -0.667, indicating that the bad rate for "Fuel Only" customers was approximately 66.7% lower than that for "Universal" customers.
# Bad Rates by Different CLI% for Opt-in Customers:
  Further analysis revealed variations in bad rates based on different CLI% for opt-in customers within each portfolio type.
  Notably, certain CLI amounts exhibited higher bad rates, particularly for "Fuel Only" customers
# Multiple Regression 
  Delinquency ratio and delinquent variables helped us determine which customers were more likely at risk to have balance past the number of days due.
  Customers that had amounts in BAL_31_60, BAL_61_90, BAL_91_PLUS were at a higher risk 
  Customers that have a high delinquency ratio could be swapped out and customers who have a low delinquency ratio could be swapped in to generate the most value and revenue while also mitigating risks of underperforming customers.


https://github.com/atahirkoylu/CORPAY-PROJECT/blob/main/Cross%20Sell%20Perfomance%20Dash.png
