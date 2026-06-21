
# 📊 Data Engineer Skills Analysis Using SQL

## 📌 Project Overview

This project analyzes remote Data Engineer job postings to answer three important questions:

1. What skills are most in demand?
2. Which skills offer the highest salaries?
3. Which skills provide the best balance between demand and salary?

Using SQL, I joined job posting data with skill-related tables and performed analysis to identify the most valuable skills for Data Engineers.

---

##  Data Source & Data Warehouse

The analysis was performed on a Data Engineering job postings dataset stored in a **data warehouse hosted on MotherDuck**, a cloud-based analytics platform powered by DuckDB.

The warehouse follows a **star schema design**, consisting of:

* **Fact Table:** `job_postings_fact` containing job posting details, salaries, locations, and job information.
* **Dimension Tables:** `company_dim` and `skills_dim` containing company and skill-related information.
* **Bridge Table:** `skills_job_dim` connecting job postings with their required skills.

Using SQL joins across these tables, I was able to analyze skill demand, salary trends, and identify the most valuable skills for Data Engineers.

<img width="1536" height="1024" alt="data_jobs_database" src="https://github.com/user-attachments/assets/b3de71dd-5519-4d52-9cda-0489250af6b3" />



---

## 🛠 Tools Used

* SQL
* DuckDB
* VS Code
* Git & GitHub

---

## 📂 Project Structure

```text
SQL Data Engineering__Project/
│
├── 01_Top demand skills.sql
├── 02_Top Paying Skills.sql
├── 03_Optimal skills.sql
├── data_jobs_database.png
└── README.md

```

---

## 🎯 Business Questions

### 1. What are the top 10 skills needed for remote Data Engineer roles?

For this analysis, I:

* Joined job postings with skill data
* Filtered only remote Data Engineer jobs
* Counted the occurrence of each skill
* Ranked skills based on demand

#### Top 10 Most Demanded Skills

| Skill      | Demand Count |
| ---------- | -----------: |
| SQL        |       29,221 |
| Python     |       28,776 |
| AWS        |       17,823 |
| Azure      |       14,143 |
| Spark      |       12,799 |
| Airflow    |        9,996 |
| Snowflake  |        8,639 |
| Databricks |        8,183 |
| Java       |        7,267 |
| GCP        |        6,446 |

#### Key Findings

* SQL and Python are the most in-demand skills.
* AWS and Azure are the leading cloud platforms.
* Spark is highly demanded for big data processing.
* Airflow, Snowflake, and Databricks are widely used in data engineering workflows.

---

## 💰 Highest Paying Skills Analysis

The second analysis focused on identifying skills associated with higher salaries.

For this analysis, I:

* Considered remote Data Engineer jobs
* Calculated median salary for each skill
* Measured skill demand using job posting counts
* Ranked skills by median salary

#### Top Paying Skills

| Skill     | Median Salary ($) |
| --------- | ----------------: |
| Rust      |           210,000 |
| Golang    |           184,000 |
| Terraform |           184,000 |
| Spring    |           175,500 |
| Neo4j     |           170,000 |

#### Key Findings

* Rust has the highest median salary among all analyzed skills.
* Golang and Terraform also provide strong earning potential.
* Kubernetes, Airflow, Kafka, and Spark offer a combination of strong salaries and market demand.
* Companies highly value cloud, infrastructure, and big data technologies.

#### Conclusion

To become a strong Data Engineer, focusing on skills such as Spark, Airflow, Kafka, Kubernetes, and Terraform can provide a good balance of salary and job opportunities.

---

## ⚖️ Optimal Skills Analysis

The final analysis combines salary and demand to identify the most valuable skills overall.

For this analysis, I:

* Considered only remote Data Engineer jobs with salary information available
* Calculated median salary for each skill
* Counted skill demand
* Created an Optimal Score by combining salary and demand
* Used Natural Log transformation to normalize demand values

#### Top Optimal Skills

| Skill  | Median Salary ($) | Demand Count |
| ------ | ----------------: | -----------: |
| Python |           135,000 |        1,133 |
| SQL    |           130,000 |        1,128 |
| AWS    |           137,320 |          783 |
| Spark  |           140,000 |          503 |
| Azure  |           128,000 |          475 |

#### Key Findings

* Python achieved the highest overall score.
* SQL ranked second due to extremely high demand.
* AWS, Spark, Azure, and Snowflake continue to be highly valuable skills.
* Airflow, Kafka, and Databricks remain important technologies for modern data engineering roles.

#### Key Takeaways

* SQL and Python should be the first skills every Data Engineer learns.
* Cloud platforms such as AWS and Azure are highly important.
* Spark, Airflow, Kafka, and Snowflake provide both strong demand and competitive salaries.
* It is better to focus on skills that balance salary and demand rather than chasing only the highest-paying skills.

---

## 💻 SQL Concepts Used

Throughout this project, I applied:

### Joins

```sql
INNER JOIN
```

### Aggregation Functions

```sql
COUNT()
MEDIAN()
ROUND()
```

### Filtering

```sql
WHERE
HAVING
```

### Grouping

```sql
GROUP BY
```

### Mathematical Functions

```sql
LN()
```

### Sorting & Ranking

```sql
ORDER BY
LIMIT
```

---

## 🚀 What I Learned

This project helped me strengthen my understanding of:

* SQL joins across multiple tables
* Aggregation and grouping techniques
* Demand and salary analysis
* Using business questions to drive data analysis
* Extracting meaningful insights from real-world job market data

The analysis shows that SQL, Python, cloud technologies, and big data tools continue to be the most important skills for Data Engineers in today's job market.
