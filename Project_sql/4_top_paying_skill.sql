/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills_dim.skills,
    AVG(top.salary_year_avg) as average_salary
FROM job_postings_fact as top
INNER JOIN skills_job_dim
ON top.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' 
AND top.salary_year_avg IS NOT NULL
AND job_location = 'Anywhere'
GROUP BY skills

ORDER BY average_salary DESC

LIMIT 25;

/*

[
  {
    "skills": "pyspark",
    "average_salary": "208172.250000000000"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189154.500000000000"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.000000000000"
  },
  {
    "skills": "watson",
    "average_salary": "160515.000000000000"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.500000000000"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500.000000000000"
  },
  {
    "skills": "swift",
    "average_salary": "153750.000000000000"
  },
  {
    "skills": "jupyter",
    "average_salary": "152776.500000000000"
  },
  {
    "skills": "pandas",
    "average_salary": "151821.333333333333"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000.000000000000"
  },
  {
    "skills": "golang",
    "average_salary": "145000.000000000000"
  },
  {
    "skills": "numpy",
    "average_salary": "143512.500000000000"
  },
  {
    "skills": "databricks",
    "average_salary": "141906.600000000000"
  },
  {
    "skills": "linux",
    "average_salary": "136507.500000000000"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500.000000000000"
  },
  {
    "skills": "atlassian",
    "average_salary": "131161.800000000000"
  },
  {
    "skills": "twilio",
    "average_salary": "127000.000000000000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103.000000000000"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781.250000000000"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436.333333333333"
  },
  {
    "skills": "notion",
    "average_salary": "125000.000000000000"
  },
  {
    "skills": "scala",
    "average_salary": "124903.000000000000"
  },
  {
    "skills": "postgresql",
    "average_salary": "123878.750000000000"
  },
  {
    "skills": "gcp",
    "average_salary": "122500.000000000000"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619.250000000000"
  }
]

*/