/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT 
    job.job_title, 
    job.salary_year_avg, 
    job.job_location, 
    job.job_posted_date,
    comp.name AS company

FROM job_postings_fact as job
LEFT JOIN company_dim as comp
ON comp.company_id = job.company_id

WHERE 
    job.job_title_short = 'Data Analyst' AND
    job.job_location = 'Anywhere' AND
    job.salary_year_avg IS NOT NULL
ORDER BY job.salary_year_avg DESC
LIMIT 10;