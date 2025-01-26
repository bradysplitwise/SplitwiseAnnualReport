# Splitwise Annual Report by Brady Katler (January 25, 2024 - January 26, 2024)

## Project Overview

This project simulates the role of a Growth Data Analyst at Splitwise. The task was to produce a report for the first meeting of the year to analyze trends from 2024 and provide actionable insights for the new year. 

Key steps included:
1. Generating mock data with AI.
2. Hosting it on an RDS instance.
3. Conducting exploratory data analysis to uncover trends.
4. Developing visuals in Looker.
5. Crafting a slideshow presentation to summarize insights.

The full job description that inspired this project can be found [here](https://jobs.inspiredcapital.com/companies/splitwise/jobs/45077352-data-analyst-growth-providence-new-york-los-angeles-remote-mid-level-and-above?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic).

---

## Creating Mock Data

To generate the mock data, I used a custom GPT tool called [Data Craft](https://chatgpt.com/g/g-jJHuZrEPM-data-craft). This tool allowed me to create realistic, usable data quickly, which was crucial for a fast turnaround project like this.

---

## Deploying the Database and Loading the Data

I hosted the database using an AWS RDS instance with PostgreSQL, leveraging the free tier to complete the project efficiently and cost-effectively.

### Key Challenge: Uploading CSV Files
RDS restricts the `COPY` command for importing CSV files, but I resolved this by using **DBeaver**, which made importing data into tables straightforward.

---

## Performing Exploratory Data Analysis (EDA)

I began by identifying key metrics and analyzing trends that significantly differed between 2023 and 2024. The analysis focused on:
- **Renewal Rate**
- **Engagement**
- **Referral Sources**

These metrics were chosen based on their relevance to growth analysis, aligning with the responsibilities outlined in the job description.

---

## Using Looker Studio

I generated visuals in Looker Studio because Splitwise specifically mentioned it in their job description, and I also have extensive experience using Looker in my internship. 

If you'd like to view the Looker visuals, check out the report [here](https://lookerstudio.google.com/u/0/reporting/88e5e4aa-9dfc-4059-867d-7efce578b739/page/xZigE/edit).

---

## Final Presentation

I incorporated assets from the Splitwise website to design a professional slide deck. The visuals from Looker were loaded onto the slides, and I analyzed the trends, speculating on potential causes and actionable solutions for these patterns. While the data was mock, I aimed to ground my analysis in plausible scenarios.

---

## Retrospective

While the project was successful, especially considering it was completed within 24 hours, there are areas for improvement:

### Data Collection
- Using **Python** to generate the mock dataset instead of GPT would have allowed more control over data creation.
- This would also demonstrate my Python skills while ensuring the dataset was designed with more intentionality, avoiding inefficiencies in SQL analysis.

### Incorporating Common KPIs
- The dataset could benefit from additional calculated metrics like churn rates instead of pre-existing fields.
- Metrics such as **active users** and **stickiness** could further enrich the analysis and provide more comprehensive insights.

---

This project reflects a strong combination of technical skills, creativity, and fast execution while identifying opportunities for refinement in future iterations.
