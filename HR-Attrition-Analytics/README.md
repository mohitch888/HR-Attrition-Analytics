# HR Attrition Analytics

An end-to-end HR analytics project that identifies patterns associated with employee attrition and highlights segments with higher observed attrition.

![Workforce Overview](Dashboard_Images/Page_1-WorkForce_Overview.png)
![Attrition Drivers](Dashboard_Images/Page_2-Attrition_Drivers.png)
![Insights and Recommendations](Dashboard_Images/Page_3-Insights_and_Recommendations.png)

## 📌 Project Overview

**16.12% of employees in the dataset have left. But the overall number only tells part of the story.**

The real insights emerged when attrition was broken down by **who the employees were, how long they had been with the company, what they earned, whether they worked overtime, and which roles or departments they belonged to**.

This project analyzes **1,470 employee records** using Python, SQL, and Power BI to uncover these patterns, identify segments with notably higher observed attrition, and translate the analysis into actionable HR recommendations.

**Overall attrition rate: 16.12%** (237 of 1,470 employees)

## 🧰 Tools & Tech Stack

- **Python** (Pandas, NumPy, Matplotlib, Seaborn) — data cleaning & exploratory data analysis
- **SQL** — attrition analysis queries and key-finding validation
- **Power BI** — interactive 3-page dashboard for stakeholders
- **Jupyter Notebook** — EDA workflow

## 📂 Repository Structure

```
├── Data
         ├── HR_Analytics.csv                               # Raw dataset
         ├── HR_Analytics_cleaned.csv                       # cleaned dataset
├── HR_Attrition_EDA.ipynb                                  # Data cleaning + exploratory data analysis
├── HR_Attrition_Analysis.sql                               # SQL queries answering 19 business questions
├── HR_Attrition_Dashboard.pbix                             # Power BI dashboard (source file)
├── Dashboard_Images/
         ├── Page_1-WorkForce_Overview.png                  # Dashboard screenshot: Workforce Overview
         ├── Page_2-Attrition_Drivers.png                   # Dashboard screenshot: Attrition Drivers
         └── Page_3-Insights_and_Recommendations.png        # Dashboard screenshot: insights & recommendations
└── README.md
```

## 🧹 Data Cleaning (EDA Notebook)

- Removed zero-variance columns (`Over18`, `StandardHours`, `EmployeeCount`)
- Filled 57 missing values in `YearsWithCurrManager` with the column median
- Removed 7 exact duplicate records
- Resolved duplicate `EmpID`s with near-identical records by keeping the entry with the higher `YearsWithCurrManager` (most recent/likely correct)
- Fixed categorical inconsistency (`TravelRarely` vs `Travel_Rarely`)
- Performed univariate analysis (boxplots, histograms, count plots) and bivariate analysis (attrition vs. gender, age, department, job role, income, overtime)

## 🔍 Key Insights

| Finding | Detail |
|---|---|
| **Highest-risk segment** | First-year employees who work overtime **and** earn ≤5k: **66.67% attrition** (32 of 48 employees) |
| **Overtime effect** | Employees working overtime attrite at **~3x** the rate of those who don't (30.53% vs 10.44%) |
| **Tenure risk** | New joiners (0–1 yr) attrite at **34.88%**, dropping steadily to **8.13%** for employees with 11+ years |
| **Job role** | Sales Representatives have the highest attrition of any role at **39.76%** |
| **Age group** | 18–25 year-olds attrite at **35.77%**, the highest of any age group |
| **Salary** | Attrition is markedly higher in the lowest salary slab (≤5k) vs the highest (15k+) |
| **Department** | Sales (20.63%) and HR (19.05%) have higher attrition than R&D (13.84%) |

## ✅ Recommendations

1. **Flag the highest-risk group** — first-year employees who work overtime and fall in the lowest salary band is the top priority .The company should either reduce their overtime or increase their pay.
2. **Strengthen first-year onboarding** — structured training, mentorship, and regular check-ins, since the first year is the single highest-risk period regardless of role or pay.
3. **Investigate Sales Representative attrition** Investigate the factors associated with Sales Representative attrition, including workload, performance targets, incentives and career progression.
4. **Build career development paths for young employees (18–25)** rather than relying on pay increases alone.

## 📊 Dashboard Preview

**Page 1 — Workforce Overview**
1. Total Employees
2. Active Employees
3. Overall Attrition Rate
4. Attrition by Overtime
5. Attrition by Age Group
6. Attrition by Department
7. Attrition by Gender

![Workforce Overview](Dashboard_Images/Page_1-WorkForce_Overview.png)

**Page 2 — Attrition Drivers**
1. Attrition by Salary Slab & Overtime
2. Attrition by Marital Status & Gender
3. Attrition by Job Role
4. Attrition by Years at Company

![Attrition Drivers](Dashboard_Images/Page_2-Attrition_Drivers.png)

**Page 3 — Insights & Recommendations**
1. Headline KPIs
2. Risk-Segment Heatmap
3. Key Insights
4. Prioritized Recommendations

![Insights and Recommendations](Dashboard_Images/Page_3-Insights_and_Recommendations.png)

## 🚀 How to Explore This Project

1. Clone the repo (see steps below)
2. Open `HR_Attrition_EDA.ipynb` in Jupyter to see the full cleaning and analysis process
3. Open `HR_Attrition_Analysis.sql` in any SQL client (with the cleaned CSV loaded into a table named `hr_data`) to explore the 19 business questions
4. Open `HR_Attrition_Dashboard.pbix` in Power BI Desktop for the interactive dashboard, or view the PNG screenshots directly

## 📁 Dataset Source

The raw dataset was obtained from Kaggle (a derivative of the IBM HR Analytics Employee Attrition dataset).

HR Analytics Dataset
https://www.kaggle.com/datasets/saadharoon27/hr-analytics-dataset

License: CC0 1.0 — Public Domain

The project includes the raw dataset and a cleaned version generated during the EDA workflow.

👤 Author

Mohit Chaudhary

Data Analytics | Python | SQL | Power BI

*Feel free to open an issue or reach out if you have questions or suggestions!*
