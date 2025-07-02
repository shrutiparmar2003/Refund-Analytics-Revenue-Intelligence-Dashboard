# 📊 Strategic Refund Analytics & Revenue Intelligence | Python · SQL · Power BI

A full-cycle data analytics project focused on refund intelligence and revenue risk assessment using **Python (pandas)**, **SQL (MySQL)**, and **Power BI**. This project simulates real-world data handling, metric design, and dynamic dashboarding for business-critical decision-making.

---

## Project Objective

To design a **modular analytics pipeline** that detects refund leakages, customer patterns, product-wise risks, and temporal trends — enabling strategic insight generation for e-commerce revenue optimization.

---

## Tech Stack

| Tool          | Purpose                                      |
|---------------|----------------------------------------------|
| Python (pandas, NumPy) | Data preprocessing, feature engineering |
| MySQL         | Analytical querying and metric computation   |
| Power BI      | Multi-page interactive dashboard             |

---

## Pipeline Summary

### 🔹 1. Data Wrangling (Python)
- Removed duplicates, nulls, and zero-value transactions
- Flagged refund transactions using invoice patterns (`Cxxxx`)
- Classified customers into `Guest` / `Registered`
- Segmented items as `Product` / `Service` using keyword logic
- Engineered features: `InvoiceHour`, `InvoiceWeekday`, `TotalAmount`, etc.

### 🔹 2. Metric Design & SQL Analytics
Executed 20+ optimized SQL queries to extract:

- **Revenue & refund breakdowns** by time, geography, and product
- **Top customers** by revenue contribution
- **Refund rate %** across descriptions and countries
- **Temporal behavior** of sales and refunds (hour, weekday, month)
- Identification of **loss-leading products** with high refund rates

### 🔹 3. Dashboard Design (Power BI)
Created a structured, multi-tab dashboard with:

- **Executive Summary** – KPIs, revenue funnels, time-based trends
- **Refund Risk View** – Refund % heatmap, product-level refund outliers
- **Customer/Product Analytics** – Pareto analysis, top contributors
- **Slicers** – Dynamic filtering by country, date, customer type, etc.

---

## Sample Insights

- 📉 Total refund amount: **~£479K**, nearly **4.6%** of total revenue
- 🇺🇸 **USA** shows over **50% refund rate** relative to its revenue
- 🔄 A few product SKUs are responsible for **majority of refund losses**
- 🕒 Sales and refunds vary significantly by **hour and weekday**

---


