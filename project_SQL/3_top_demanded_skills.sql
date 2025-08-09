/*
Question: 
    What are the most in-demand skills for data analysts?
        - Join job postings to inner join table similar to query 2
        - Identify the top 5 in-demand skills for a data analyst.
        - Focus on all job postings.
        - Why? Retrieves the top 5 skills with the highest demand in the job market, 
        providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Most in-demand skills for Data Analysts (remote):
    1. SQL – 7,291 postings
    2. Excel – 4,611 postings
    3. Python – 4,330 postings
    4. Tableau – 3,745 postings
    5. Power BI – 2,609 postings

Insights:
    - SQL dominates demand, underscoring its role as the core data management skill.
    - Excel and Python remain essential for analysis, automation, and data wrangling.
    - Visualization tools (Tableau, Power BI) highlight the importance of presenting insights effectively.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/