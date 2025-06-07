SELECT *
From data_analyst_jobs_indeed;

--Question 1 How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs_indeed;

--Answer: 1793

--Queastion 2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company 
FROM data_analyst_jobs_indeed
LIMIT 10;

--Answer: ExxonMobil

--Queastion 3 How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(*)
FROM data_analyst_jobs_indeed
WHERE location = 'TN';

--ANSWER: 21
SELECT COUNT(location)
FROM data_analyst_jobs_indeed
WHERE location IN ('TN','KY');

--ANSWER: 27

--Question 4 How many postings in Tennessee have a star rating above 4?
SELECT count(location)
FROM data_analyst_jobs_indeed
WHERE location = 'TN' AND  star_rating >4;

--ANSWER: 3

--Question 5 How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(review_count)
FROM data_analyst_jobs_indeed
WHERE review_count BETWEEN 500 and 1000;

--ANSWER: 151 

--Question 6 Show the average star rating for companies in each state. 
--The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs_indeed
GROUP BY state
ORDER BY avg_rating DESC;

--ANSWER: NE, RI, KS,UT, ID

--Question 7 Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs_indeed;

--ANSWER: 881

--Question 8 How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs_indeed
WHERE location = 'CA';

--ANSWER: 230

--Question 9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs_indeed
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

-- ANSWER: 40
"Comcast"
"Microsoft"
"Nordstrom"
"Cognizant"
"Wipro LTD"
"PwC"
"Siemens"
"PepsiCo"
"General Motors"
"HP"
"JPMorgan Chase"
"Wells Fargo"
"Burlington Stores"
"Kaiser Permanente"
"PetSmart"
"Starbucks"
"State Farm"
"Aramark"
"Advance Auto Parts"
"Goodwill Industries International, Inc. (GII)"
"SUBWAY"
"IBM"
"Deloitte"
"Staples"
"Unilever"
"Citi"
"Honeywell"
"Lockheed Martin Corporation"
"Dell"
"Walmart"
"The Home Depot"
"Accenture"
"U.S. Bank"
"Kroger"
"Capgemini Government Solutions"
"Capital One"
"Nike"
"American Express"
"Capgemini"
"Meijer"

-- Question 10 Add the code to order the query in #9 from highest to lowest average star rating. 
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs_indeed
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;

--ANSWER: General Motors, unilever, Microsoft, Nike,American Express, Kaiser PErmaanent with an average rating of 4.19 stars

--QUESTION 11 Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs_indeed
WHERE title ILIKE '%Analyst%'


--ANSWER: 774

--QUESTION 12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
--What word do these positions have in common?
SELECT DISTINCT (title) 
FROM data_analyst_jobs_indeed
WHERE title NOT LIKE '%Analyst%' 
AND title NOT LIKE '%Analytics%'
AND title NOT LIKE '%ANALYST%'
AND title NOT LIKE '%ANALYTICS%'
AND title NOT LIKE '%analyst%'
AND title NOT LIKE '%analytics%'

--OR
SELECT DISTINCT (title) 
FROM data_analyst_jobs_indeed
WHERE title NOT iLIKE '%Analyst%' 
AND title NOT iLIKE '%Analytics%';



--ANSWER: the position is for visualization data and most common skill is tableau

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--Which three industrie)s are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?

SELECT domain, count(*) AS domain_jobs
FROM data_analyst_jobs_indeed
WHERE skill LIKE '%SQL%'
AND days_since_posting >21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY domain_jobs DESC
LIMIT 3;

