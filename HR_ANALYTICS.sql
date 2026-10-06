CREATE DATABASE HR_ANALYTIC;
USE HR_ANALYTIC;
SELECT * FROM HR_ANALYTICS;

-- 1. Total Number of Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_analytics;

-- 2. Total Employee Attrition
SELECT COUNT(*) AS Total_Attrition
FROM hr_analytics
WHERE Attrition = 'Yes';

-- 3. Overall Attrition Rate
SELECT 
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics;

-- 4. Employee Count by Department
SELECT Department,
    COUNT(*) AS Employee_Count
FROM hr_analytics
GROUP BY Department
ORDER BY Employee_Count DESC;

-- 5. Attrition by Department
SELECT Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_analytics
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- 6. Employee Count by Job Role
SELECT JobRole,
    COUNT(*) AS Employee_Count
FROM hr_analytics
GROUP BY JobRole
ORDER BY Employee_Count DESC;

-- 7. Average Salary by Department
SELECT Department,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Salary
FROM hr_analytics
GROUP BY Department
ORDER BY Average_Salary DESC;

-- 8. Attrition by Overtime
SELECT OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_analytics
GROUP BY OverTime
ORDER BY Attrition_Count DESC;

-- 9. Attrition by Gender
SELECT Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_analytics
GROUP BY Gender;

-- 10. Attrition by Age Group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    
    COUNT(*) AS Total_Employees,
    
    SUM(
        CASE 
            WHEN Attrition = 'Yes' THEN 1 
            ELSE 0 
        END
    ) AS Attrition_Count

FROM hr_analytics

GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END

ORDER BY Attrition_Count DESC;
