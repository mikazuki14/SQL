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

/*
[
  {
    "job_title": "Data Analyst",
    "salary_year_avg": "650000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-02-20 15:13:33",
    "company": "Mantys"
  },
  {
    "job_title": "Director of Analytics",
    "salary_year_avg": "336500.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-08-23 12:04:42",
    "company": "Meta"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "job_posted_date": "2023-06-18 16:03:12",
    "company": "AT&T"
  },
  {
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-12-05 20:00:40",
    "company": "Pinterest Job Advertisements"
  },
  {
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-01-17 00:17:23",
    "company": "Uclahealthcareers"
  },
  {
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-08-09 11:00:01",
    "company": "SmartAsset"
  },
  {
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-12-07 15:00:13",
    "company": "Inclusively"
  },
  {
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-01-05 00:00:25",
    "company": "Motional"
  },
  {
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-07-11 16:00:05",
    "company": "SmartAsset"
  },
  {
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "job_posted_date": "2023-06-09 08:01:04",
    "company": "Get It Recruit - Information Technology"
  }
]

*/