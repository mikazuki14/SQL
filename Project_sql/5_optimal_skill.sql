/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg),0) as average_salary,
    COUNT(skills_job_dim.skill_id) as skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst'
AND job_postings_fact.salary_year_avg IS NOT NULL
AND job_postings_fact.job_location = 'Anywhere'
GROUP BY skills_dim.skills
HAVING COUNT(skills_job_dim.skill_id) > 10
ORDER BY average_salary DESC, skill_count DESC
LIMIT 25;      

/*

[
  {
    "skills": "go",
    "average_salary": "115320",
    "skill_count": "27"
  },
  {
    "skills": "confluence",
    "average_salary": "114210",
    "skill_count": "11"
  },
  {
    "skills": "hadoop",
    "average_salary": "113193",
    "skill_count": "22"
  },
  {
    "skills": "snowflake",
    "average_salary": "112948",
    "skill_count": "37"
  },
  {
    "skills": "azure",
    "average_salary": "111225",
    "skill_count": "34"
  },
  {
    "skills": "bigquery",
    "average_salary": "109654",
    "skill_count": "13"
  },
  {
    "skills": "aws",
    "average_salary": "108317",
    "skill_count": "32"
  },
  {
    "skills": "java",
    "average_salary": "106906",
    "skill_count": "17"
  },
  {
    "skills": "ssis",
    "average_salary": "106683",
    "skill_count": "12"
  },
  {
    "skills": "jira",
    "average_salary": "104918",
    "skill_count": "20"
  },
  {
    "skills": "oracle",
    "average_salary": "104534",
    "skill_count": "37"
  },
  {
    "skills": "looker",
    "average_salary": "103795",
    "skill_count": "49"
  },
  {
    "skills": "nosql",
    "average_salary": "101414",
    "skill_count": "13"
  },
  {
    "skills": "python",
    "average_salary": "101397",
    "skill_count": "236"
  },
  {
    "skills": "r",
    "average_salary": "100499",
    "skill_count": "148"
  },
  {
    "skills": "redshift",
    "average_salary": "99936",
    "skill_count": "16"
  },
  {
    "skills": "qlik",
    "average_salary": "99631",
    "skill_count": "13"
  },
  {
    "skills": "tableau",
    "average_salary": "99288",
    "skill_count": "230"
  },
  {
    "skills": "ssrs",
    "average_salary": "99171",
    "skill_count": "14"
  },
  {
    "skills": "spark",
    "average_salary": "99077",
    "skill_count": "13"
  },
  {
    "skills": "c++",
    "average_salary": "98958",
    "skill_count": "11"
  },
  {
    "skills": "sas",
    "average_salary": "98902",
    "skill_count": "126"
  },
  {
    "skills": "sql server",
    "average_salary": "97786",
    "skill_count": "35"
  },
  {
    "skills": "javascript",
    "average_salary": "97587",
    "skill_count": "20"
  },
  {
    "skills": "power bi",
    "average_salary": "97431",
    "skill_count": "110"
  }
]

*/