USE Emergency_Room_Analytics;
-- 1. EXECUTIVE SUMMARY: Patient Volume and Disposition Breakdown
SELECT 
    Disposition,
    COUNT(Patient_ID) AS Total_Patients,
    ROUND((COUNT(Patient_ID) * 100.0) / (SELECT COUNT(*) FROM ER_Patient_Logs), 2) AS Percentage_of_Total
FROM 
    ER_Patient_Logs
GROUP BY 
    Disposition
ORDER BY 
    Total_Patients DESC;
-- 2. WAIT TIME ANALYTICS: Average Triage Delay by Acuity Level
SELECT 
    Acuity_Level,
    COUNT(Patient_ID) AS Patient_Count,
    ROUND(AVG(CAST(DATEDIFF(MINUTE, Arrival_Timestamp, Triage_Timestamp) AS FLOAT)), 1) AS Avg_Triage_Wait_Minutes,
    MAX(DATEDIFF(MINUTE, Arrival_Timestamp, Triage_Timestamp)) AS Max_Wait_Minutes
FROM 
    ER_Patient_Logs
GROUP BY 
    Acuity_Level
ORDER BY 
    Acuity_Level ASC;
-- 3. OPERATIONAL BOTTLENECKS: Isolating High-Volume / High-Walkout Periods
SELECT 
    DATENAME(WEEKDAY, Arrival_Timestamp) AS Day_of_Week,
    DATEPART(HOUR, Arrival_Timestamp) AS Arrival_Hour,
    COUNT(Patient_ID) AS Total_Arrivals,
    SUM(CASE WHEN Disposition = 'LWBS' THEN 1 ELSE 0 END) AS Total_Walkouts
FROM 
    ER_Patient_Logs
GROUP BY 
    DATENAME(WEEKDAY, Arrival_Timestamp), 
    DATEPART(HOUR, Arrival_Timestamp)
HAVING 
    SUM(CASE WHEN Disposition = 'LWBS' THEN 1 ELSE 0 END) > 0
ORDER BY 
    Total_Walkouts DESC, Total_Arrivals DESC;
