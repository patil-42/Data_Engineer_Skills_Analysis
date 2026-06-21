/*
Question: Which skills are best for Data Engineers based on both salary and demand?

- Consider only remote Data Engineer jobs with salary information available.
- Calculate the median salary for each skill.
- Count how many job postings require each skill.
- Create a score that combines salary and demand.
- Rank the skills based on this score.
*/


SELECT
              
            sd.skills,
            ROUND(MEDIAN(jpf.salary_year_avg),0) as MEDIAN_SALARY,
            count(jpf.*) as DEMAND_COUNT,
            ROUND(MEDIAN(jpf.salary_year_avg)*count(sd.skills),1) as OPTIMAL_SCORE,
            ROUND(LN(count(jpf.*)),1) as NATURAL_LOG
            
 FROM 
           job_postings_fact AS jpf
           INNER JOIN skills_job_dim sj
           on jpf.job_id=sj.job_id
           INNER JOIN skills_dim AS sd
            ON sj.skill_id=sd.skill_id
  WHERE 
           jpf.job_title_short='Data Engineer' AND
           jpf.job_work_from_home=TRUE AND
           jpf.salary_year_avg IS NOT NULL
  GROUP BY 
           sd.skills
  HAVING
        count(sd.skills)>100
  
  ORDER BY  OPTIMAL_SCORE DESC;


  /*

  ────────────┬───────────────┬──────────────┬───────────────┬─────────────┐
│   skills   │ MEDIAN_SALARY │ DEMAND_COUNT │ OPTIMAL_SCORE │ NATURAL_LOG │
│  varchar   │    double     │    int64     │    double     │   double    │
├────────────┼───────────────┼──────────────┼───────────────┼─────────────┤
│ python     │      135000.0 │         1133 │   152955000.0 │         7.0 │
│ sql        │      130000.0 │         1128 │   146640000.0 │         7.0 │
│ aws        │      137320.0 │          783 │   107521804.7 │         6.7 │
│ spark      │      140000.0 │          503 │    70420000.0 │         6.2 │
│ azure      │      128000.0 │          475 │    60800000.0 │         6.2 │
│ snowflake  │      135500.0 │          438 │    59349000.0 │         6.1 │
│ airflow    │      150000.0 │          386 │    57900000.0 │         6.0 │
│ kafka      │      145000.0 │          292 │    42340000.0 │         5.7 │
│ java       │      135000.0 │          303 │    40905000.0 │         5.7 │
│ redshift   │      130000.0 │          274 │    35620000.0 │         5.6 │
│ terraform  │      184000.0 │          193 │    35512000.0 │         5.3 │
│ databricks │      132750.0 │          266 │    35311500.0 │         5.6 │
│ scala      │      137290.0 │          247 │    33910749.6 │         5.5 │
│ git        │      140000.0 │          208 │    29120000.0 │         5.3 │
│ hadoop     │      135000.0 │          198 │    26730000.0 │         5.3 │
│ gcp        │      136000.0 │          196 │    26656000.0 │         5.3 │
│ nosql      │      134415.0 │          193 │    25942095.0 │         5.3 │
│ kubernetes │      150500.0 │          147 │    22123500.0 │         5.0 │
│ pyspark    │      140000.0 │          152 │    21280000.0 │         5.0 │
│ docker     │      135000.0 │          144 │    19440000.0 │         5.0 │
│ tableau    │      115000.0 │          164 │    18860000.0 │         5.1 │
│ mongodb    │      135750.0 │          136 │    18462000.0 │         4.9 │
│ r          │      134775.0 │          133 │    17925075.0 │         4.9 │
│ github     │      135000.0 │          127 │    17145000.0 │         4.8 │
│ sql server │      120000.0 │          139 │    16680000.0 │         4.9 │
│ bigquery   │      135000.0 │          123 │    16605000.0 │         4.8 │
│ go         │      140000.0 │          113 │    15820000.0 │         4.7 │
│ postgresql │      122500.0 │          129 │    15802500.0 │         4.9 │
│ power bi   │      120000.0 │          129 │    15480000.0 │         4.9 │
│ oracle     │      124500.0 │          109 │    13570500.0 │         4.7 │
│ flow       │      125500.0 │          107 │    13428500.0 │         4.7 │
│ mysql      │      130500.0 │          101 │    13180500.0 │         4.6 │
└────────────┴───────────────┴──────────────┴───────────────┴─────────────┘
  32 rows                                                       5 columns

 */
/*
Key Takeaways:

- SQL and Python should be the first skills every Data Engineer learns.
- Cloud platforms like AWS and Azure are highly important.
- Learning Spark, Airflow, Kafka, and Snowflake can improve both job opportunities and salary potential.
- Focus on skills that provide a balance of demand and salary rather than only chasing the highest-paying skills.
*/