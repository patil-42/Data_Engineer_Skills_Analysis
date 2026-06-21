
/*
Question: What are the highest-paying and most valuable skills for Data Engineers?

- Find remote Data Engineer jobs.
- Calculate the median salary for each skill.
- Count how often each skill appears in job postings.
- Display the top skills based on salary.
- This helps understand which skills can lead to better-paying Data Engineer jobs.
*/


SELECT
              
            sd.skills,
            ROUND(MEDIAN(jpf.salary_year_avg),0) as MEDIAN_SALARY,
            count(sd.skills) as DEMAND_COUNT
 FROM 
           job_postings_fact AS jpf
           INNER JOIN skills_job_dim sj
           on jpf.job_id=sj.job_id
           INNER JOIN skills_dim AS sd
            ON sj.skill_id=sd.skill_id
  WHERE 
           jpf.job_title_short='Data Engineer' AND
           jpf.job_work_from_home=TRUE
  GROUP BY 
           sd.skills
  HAVING
            count(sd.skills)>200
  ORDER BY  MEDIAN_SALARY DESC
  
  LIMIT 25;
/*

  ────────────┬───────────────┬──────────────┐
│   skills   │ MEDIAN_SALARY │ DEMAND_COUNT │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
│ kafka      │      145000.0 │         6415 │
│ spark      │      140000.0 │        12799 │
│ git        │      140000.0 │         4641 │
│ pandas     │      140000.0 │         2929 │
└────────────┴───────────────┴──────────────┘
  25 rows                         3 columns

  */

  /*
What I found:

- Rust, Golang, and Terraform are the highest-paying skills.
- Kubernetes, Airflow, Kafka, and Spark are in high demand and also pay well.
- Companies are looking for engineers who know cloud and big data technologies.
- Skills related to data pipelines and infrastructure are very valuable.

Conclusion:

- To become a strong Data Engineer, I should focus on Spark, Airflow, Kafka, Kubernetes, and Terraform.
- These skills provide a good balance of salary and job opportunities.
*/