# ER Bottleneck Analysis: Fixing Wait Times with Data 🏥📊

## The Problem
Hospital emergency rooms face a major issue: overcrowding. When wait times get too high, patients get frustrated and leave without seeing a doctor. This project uses data to find the root cause of these delays and propose a staffing solution.

## How I Analyzed It
Using **SQL**, I extracted data from 250 patient logs. I calculated the time between a patient arriving and getting evaluated (triage) based on their severity level. I then mapped this out in **Power BI** to make the trends easily readable for hospital management.

## The Findings & The Solution
1. **The Impact (Walkout Rate):** 16.4% of patients (41 people) left without treatment due to long waits.
2. **The Root Cause:** Bottlenecks happen because patient arrivals drastically spike at specific times, overwhelming the staff.
3. **The Answer (Solution):** My SQL queries isolated the exact days and hours with the most arrivals and walkouts. By showing hospital leaders these "peak hours," they can proactively schedule more nurses and doctors during these times to eliminate the bottleneck.

## Tools Used
* **SQL:** Data extraction, finding peak hours, and calculating wait times.
* **Power BI:** Visualizing the data for non-technical stakeholders.

## Files Included
* `ER_Patient_Logs.csv`: The raw dataset.
* `er_analysis.sql`: The SQL queries used to track the wait times.
* `er_dashboard.jpg`: The final visual dashboard.

## Dashboard Preview
<img width="1327" height="747" alt="ER_dashboard" src="https://github.com/user-attachments/assets/9053c9f7-97f2-4ba3-83cb-444c15cfb845" />
