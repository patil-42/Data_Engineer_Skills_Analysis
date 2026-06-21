/*
Question: What are the top 10 skills needed for remote Data Engineer roles?

- Connect job postings with skill data.
- Consider only remote Data Engineer jobs.
- Count the occurrence of each skill.
- Display the 10 most demanded skills.
- This helps identify the skills that Data Engineers should learn to increase their chances of getting remote jobs.
*/

SELECT
    count(jpf.*) as Demand_Count,
    sd.skills

FROM 
    job_postings_fact AS jpf
    INNER JOIN skills_job_dim sj
    on jpf.job_id=sj.job_id
    INNER JOIN skills_dim AS sd
    ON sj.skill_id=sd.skill_id
WHERE jpf.job_title_short='Data Engineer'
      AND jpf.job_work_from_home=True
GROUP BY sd.skills
ORDER BY count(jpf.*) DESC
LIMIT 10;


/*
┌──────────────┬────────────┐
│ Demand_Count │   skills   │
│    int64     │  varchar   │
├──────────────┼────────────┤
│        29221 │ sql        │
│        28776 │ python     │
│        17823 │ aws        │
│        14143 │ azure      │
│        12799 │ spark      │
│         9996 │ airflow    │
│         8639 │ snowflake  │
│         8183 │ databricks │
│         7267 │ java       │
│         6446 │ gcp        │
└──────────────┴────────────┘
  10 rows         2 columns

*/

/*
Key Findings:

- SQL and Python are the most in-demand skills.
- AWS and Azure are the top cloud platforms.
- Spark is important for big data processing.
- Airflow, Snowflake, and Databricks are widely used in data engineering.
- Learning these skills can improve chances of getting a Data Engineer role.
*/