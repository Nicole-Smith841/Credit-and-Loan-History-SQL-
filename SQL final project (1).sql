SELECT *
FROM Customer_info 
WHERE annual_income > 100000
GROUP BY customer_id 
ORDER BY annual_income DESC;
--By looking at the annual income of people who make more than $100,000 then the bank/comapny can see if a certain loan is accepatble and 'safe'. the reason it is grouped by 
--customer_id, is that there are multiple rows for each customer correlating different times in the year.

SELECT ci.name, ci.occupation, cr.credit_score 
FROM Credit_Info cr
JOIN Customer_info ci 
	ON cr.customer_id = ci.customer_id 
GROUP BY ci.name 
ORDER BY cr.credit_score DESC; 
--Joining both the Customer_info table and the Credit_Info table helps us look at and review each customer in reagrds to their credit infomation and we can see if their credit is
-- at all 'good' or how high of a risk someone is when considering a loan. 

SELECT occupation, COUNT(occupation) AS num_occupation, ROUND(AVG(annual_income), 2) AS avg_annual_income
FROM Customer_info 
GROUP BY occupation 
ORDER BY num_occupation DESC; 
--Counting the types of occupations and getting the average income from those occupations, you can then see if the person has a good income comparative to the average, and how many people have 
--lucrative careers. 

SELECT DISTINCT name, annual_income, 
	CASE WHEN annual_income <= '50000' THEN 'Low'
		WHEN annual_income > '50000' AND annual_income <= '90000' THEN 'Middle'
		WHEN annual_income > '90000' AND annual_income <= '200000' THEN 'High'
		ELSE 'Very High' 
		END AS Type_of_Income 
FROM Customer_info 
ORDER BY annual_income DESC;
--By ordering and classifying the annual income as Low, Middle, High and Very High, you can see at a glance how they would be classified as inreagrds to their financial status. Therefore, someone with a 'High' financial status
--could theoretically take out or be approved for a loan that is higher than that from someone who classifies as a Middle or Low. 

WITH customer_cte AS (
	SELECT age
	FROM Customer_info
	WHERE age > 30
)
SELECT COUNT(*) AS young_age_customers
FROM Customer_cte;
--Creating a CTE with the age being greater than 30, you can easily pull information seeing if they have an approprtiate credit score in refrence to their age. If someone is younger, it is expected that their credit score is going to be lower 
--than someone who is older. 


