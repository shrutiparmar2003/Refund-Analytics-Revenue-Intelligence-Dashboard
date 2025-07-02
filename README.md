# 📊 Strategic Refund Analytics & Revenue Intelligence | Python · SQL · Power BI

A full-cycle data analytics project focused on refund intelligence and revenue risk assessment using **Python (pandas)**, **SQL (MySQL)**, and **Power BI**. This project simulates real-world data handling, metric design, and dynamic dashboarding for business-critical decision-making.

---
<h3>Refund Dashboard - Visual 1</h3>
<img src="https://raw.githubusercontent.com/shrutiparmar2003/Refund-Analytics-Revenue-Intelligence-Dashboard/main/PowerBI%20dashboard%20images/image1.png" alt="Dashboard Image 1" width="700">

<br/>

<h3>Refund Dashboard - Visual 2</h3>
<img src="https://raw.githubusercontent.com/shrutiparmar2003/Refund-Analytics-Revenue-Intelligence-Dashboard/main/PowerBI%20dashboard%20images/img2.png" alt="Dashboard Image 2" width="700">

<br/>

<h3>Refund Dashboard - Visual 3</h3>
<img src="https://raw.githubusercontent.com/shrutiparmar2003/Refund-Analytics-Revenue-Intelligence-Dashboard/main/PowerBI%20dashboard%20images/img3.png" alt="Dashboard Image 3" width="700">


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

- **Page 1**: Revenue overview (KPIs, country-wise revenue, customer types)
- **Page 2**: Refund analysis (refund hotspots, product-wise refund %)
- **Page 3**: Customer & product performance (top customers, refund-prone items)

#### Visuals Used

- **Cards** – for KPIs (revenue, refund %)
- **Bar & Line Charts** – for comparison and trends
- **Donut Charts** – for contribution analysis
---

## Key Insights & Business Takeaways

- Registered customers drove ~89% of revenue
- Refunds accounted for ~4.64% of revenue (~£479K)
- USA had an unusually high refund rate of 51.66%
- Revenue peaked in November & December (seasonal trend)
- Refunds spiked on Fridays — potential batch return behavior
- Some top-selling products also had high refund rates (>10%)

These insights can help e-commerce businesses refine product quality, target customer retention, and reduce operational loss.


---


