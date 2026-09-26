USE hr_analytics;

SELECT * FROM hr_data;


/* ============================================================
   Q1. What is the overall employee attrition rate?
   ============================================================ */

SELECT
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data;

/*
Key Finding:
The dataset contains 1,470 employees, with an overall attrition rate
of 16.12%. This means approximately 1 in every 6 employees has left
the organization.
*/


/* ============================================================
   Q2. How does attrition vary by gender?
   ============================================================ */

SELECT
    Gender,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Gender_Wise_Attrition
FROM hr_data
GROUP BY Gender
ORDER BY Gender_Wise_Attrition DESC;

/*
Key Finding:
Male employees recorded a higher attrition rate of 17.01%, compared
with 14.80% among female employees, a difference of 2.21 percentage
points.
*/


/* ============================================================
   Q3. How does attrition vary across age groups?
   ============================================================ */

SELECT
    AgeGroup,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS AgeGroup_Wise_Attrition
FROM hr_data
GROUP BY AgeGroup
ORDER BY AgeGroup_Wise_Attrition DESC;

/*
Key Finding:
The 18–25 age group recorded the highest attrition rate at 35.77%,
followed by the 26–35 group at 19.14%. Attrition was lower among
the 36–45 group (9.19%) and 46–55 group (11.50%), while the 55+
group recorded 17.02%, showing that the relationship is not linear.
*/


/* ============================================================
   Q4. Which department has the highest attrition rate?
   ============================================================ */

SELECT
    Department,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Department_Wise_Attrition
FROM hr_data
GROUP BY Department
ORDER BY Department_Wise_Attrition DESC;

/*
Key Finding:
Sales recorded the highest attrition rate at 20.63%, followed by
Human Resources at 19.05%. Research & Development recorded the
lowest rate at 13.84%.
*/


/* ============================================================
   Q5. Which job role has the highest attrition rate?
   ============================================================ */

SELECT
    JobRole,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS JobRole_Wise_Attrition
FROM hr_data
GROUP BY JobRole
ORDER BY JobRole_Wise_Attrition DESC;

/*
Key Finding:
Sales Representatives recorded the highest attrition rate at 39.76%,
followed by Laboratory Technicians at 23.94% and Human Resources
roles at 23.08%. The Sales Representative rate is more than twice
the overall attrition rate of 16.12%.
*/


/* ============================================================
   Q6. How does attrition vary across salary levels?
   ============================================================ */

SELECT
    SalarySlab,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Salary_Wise_Attrition
FROM hr_data
GROUP BY SalarySlab
ORDER BY Salary_Wise_Attrition DESC;

/*
Key Finding:
Attrition is higher(21.76%) among employees in the lower salary(upto 5k) slabs and
comparatively lower(3.76) in higher salary slabs(15k+). This shows an observed
association between salary level and employee attrition.
*/


/* ============================================================
   Q7. How does attrition differ between employees who work overtime
       and those who do not?
   ============================================================ */

SELECT
    OverTime,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Employees working overtime recorded approximately 3 times the
attrition rate of employees who did not work overtime, indicating
a strong observed association between overtime and attrition.
*/


/* ============================================================
   Q8. How does attrition vary by years at the company?
   ============================================================ */

SELECT
    CASE
        WHEN YearsAtCompany <= 1  THEN '1. New joiners (0-1 yrs)'
        WHEN YearsAtCompany <= 5  THEN '2. Early tenure (2-5 yrs)'
        WHEN YearsAtCompany <= 10 THEN '3. Established (6-10 yrs)'
        ELSE                           '4. Long-serving (11+ yrs)'
    END AS Tenure_Stage,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Tenure_Stage
ORDER BY Tenure_Stage;



/*
Key Finding:
Attrition falls with each career stage: 34.88% for new joiners (0-1 years),
15.51% for early tenure (2-5 years), 12.28% for established employees
(6-10 years) and 8.13% for long-serving employees (11+ years). New joiners
leave at more than twice the company rate of 16.12%, making the first two
years the highest-risk period.
*/


/* ============================================================
   Q9. How does attrition vary by job satisfaction level?
   ============================================================ */

SELECT
    JobSatisfaction,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Employees with lower job-satisfaction scores generally recorded
higher attrition rates. However, the pattern is not perfectly
consistent across every satisfaction level.
*/


/* ============================================================
   Q10. How does attrition vary by distance from home?
   ============================================================ */

SELECT
    CASE
        WHEN DistanceFromHome < 7 THEN '0-6 km'
        WHEN DistanceFromHome < 14 THEN '7-13 km'
        WHEN DistanceFromHome < 21 THEN '14-20 km'
        WHEN DistanceFromHome < 28 THEN '21-27 km'
        ELSE '28+ km'
    END AS Distance_Bin,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Distance_Bin
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
The relationship between distance from home and attrition is
non-linear. The 21–27 km group recorded the highest observed
attrition, while the 28+ km group showed comparatively lower
attrition.
*/


/* ============================================================
   Q11. How does attrition vary across percentage salary-hike bands?
   ============================================================ */

SELECT
    CASE
        WHEN PercentSalaryHike < 15 THEN '<15%'
        WHEN PercentSalaryHike <= 20 THEN '15-20%'
        ELSE '20-25%'
    END AS Salary_Hike_Bin,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Salary_Hike_Bin
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
No consistent relationship was observed between percentage salary
hike and attrition across the defined salary-hike bands. Therefore,
salary-hike percentage alone does not show a clear pattern with
employee attrition.
*/


/* ============================================================
   Q12. Among employees working overtime, how does attrition vary
        across salary levels?
   ============================================================ */

SELECT
    SalarySlab,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
WHERE OverTime = 'Yes'
GROUP BY SalarySlab
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Among employees who work overtime, lower salary slabs show higher
observed attrition than higher salary slabs. This suggests that the
combination of salary level and overtime is worth examining further.
*/


/* ============================================================
   Q13. How does attrition vary by years since the last promotion?
   ============================================================ */

SELECT
    YearsSinceLastPromotion,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsSinceLastPromotion
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Attrition rates across different values of years since the last
promotion do not show a consistent pattern. No clear relationship
is evident from this analysis alone.
*/


/* ============================================================
   Q14. How does attrition vary by gender and marital status?
   ============================================================ */

SELECT
    Gender,
    MaritalStatus,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Gender, MaritalStatus
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Attrition varies across gender and marital-status combinations,
with single employees generally recording higher attrition than
married employees. The size of the difference varies by gender.
*/


/* ============================================================
   Q15. How does attrition vary by department and marital status?
   ============================================================ */

SELECT
    Department,
    MaritalStatus,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Department, MaritalStatus
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Attrition varies across department and marital-status segments. Within each department, single employees show higher attrition than married employees. 
The highest attrition is observed among specific department–marital-status combinations
mainly Sales ands R&D.
*/


/* ============================================================
   Q16. How does attrition vary across age groups and salary levels?
   ============================================================ */

SELECT
    SalarySlab,
    AgeGroup,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY SalarySlab, AgeGroup
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Lower salary slabs generally show higher attrition across multiple
age groups, while higher salary slabs tend to show lower attrition.
Younger employees also show relatively high attrition within several
salary categories.
*/


/* ============================================================
   Q17. How does attrition vary across age groups and overtime status?
   ============================================================ */

SELECT
    OverTime,
    AgeGroup,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime, AgeGroup
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
The 18–25 age group working overtime recorded particularly high
attrition compared with other age–overtime combinations. However,
the relationship is not consistently linear across all age groups.
*/


/* ============================================================
   Q18. How does attrition vary across job roles and age groups?
   ============================================================ */

SELECT
    JobRole,
    AgeGroup,
    COUNT(EmpID) AS Total_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
        / COUNT(EmpID), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobRole, AgeGroup
HAVING COUNT(EmpID) > 20
ORDER BY Attrition_Rate DESC;

/*
Key Finding:
Attrition varies substantially across job-role and age-group
combinations. Younger employees show relatively high attrition
across several roles, with Sales Representative roles particularly
notable along with Laboratory Technician.


/* Q19 highest Risk segment--> low salary , overtime, 1 year with company */
select
count(EmpID) as Total_Employees,
sum(case when attrition='Yes' then 1 else 0 end) as people_leaving,
Round(sum(case when attrition='Yes' then 1 else 0 end)*100/ count(EmpID),2) as attrition_Rate
from hr_data
where YearsAtCompany <=1 and
overtime='Yes' and
salaryslab='upto 5k'
;

/*
Key Finding:
Among first-year employees who work overtime and earn up to 5k, 
the attrition rate is **66.67% (32 out of 48 employees), 
which is much higher than the overall attrition rate. 
However, since this is a small group, it should be treated as a strong indication.

*/




/* ============================================================
   OVERALL FINDINGS & RECOMMENDATIONS
   ============================================================
   1. Overtime + low pay is the strongest combined risk (42.9%). Q7
   2. The first year is the danger zone (34.9%).  Q8
   3. Highest-risk segment: first-year + overtime + up to 5k (66.7%, no of employees=48). Q19
   4. Sales Representatives (39.8%) and ages 18-25 (35.8%) leave most.
   Recommendations: Review overtime and pay for low-paid staff,
   strengthen first-year onboarding, and target Sales Rep retention.
   ============================================================ */