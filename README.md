# Instagram Fraud Detector 🔍

Detecting suspicious Instagram accounts using **Python, Machine Learning, and MySQL** — combining EDA, Isolation Forest anomaly detection, and SQL-based behavioral analysis across 3 datasets.

---

## 📊 Project Overview

End-to-end fraud detection project analyzing 380 Instagram account records to identify bot accounts and suspicious influencers through engagement pattern analysis, risk scoring, and machine learning.

---

## 🔍 Key Findings

| Metric | Real Accounts | Suspicious/Unknown Accounts |
|---|---|---|
| Avg Engagement Rate | 6.39% | 0.23% |
| Avg Followers | 1,52,805 | 8,08,529 |
| Avg Posts | 424 | 53 |

- **27x lower engagement** in suspicious accounts despite **5x more followers** — classic bot pattern
- **19 high-risk accounts** flagged with 1M+ followers but <0.5% engagement using CASE WHEN risk scoring
- Isolation Forest algorithm detected anomalous influencers from Top 200 dataset based on engagement vs follower ratio
- **44% of flagged accounts** had near-zero avg comments (0–10) despite 5,00,000+ followers

---

## 🗄️ SQL Analysis (MySQL)

Built a **3-table relational database** and wrote 8 advanced queries to identify fraud patterns:

```sql
-- Fraud Flag: High followers, near-zero engagement
SELECT username, followers, engagement_rate,
  CASE
    WHEN engagement_rate < 1.0 AND followers > 100000 THEN 'HIGH RISK — Likely Bot'
    WHEN engagement_rate < 3.0 AND followers > 50000  THEN 'MEDIUM RISK — Suspicious'
    ELSE 'LOW RISK'
  END AS fraud_flag
FROM fake_accounts
ORDER BY fraud_flag, followers DESC;
```

**Queries written:** JOINs across 3 tables, GROUP BY aggregations, RANK() window functions, CASE WHEN risk classification, following/follower ratio analysis

---

## 🛠️ Tools & Technologies

- Python (Pandas, Scikit-learn, Matplotlib)
- MySQL & MySQL Workbench
- Isolation Forest (Anomaly Detection)
- Jupyter Notebook / Google Colab

---

## 📁 Datasets

| File | Records | Description |
|---|---|---|
| `instagram_data.csv` | 150 | Mixed Real + Unknown accounts with behavioral features |
| `fake_accounts.csv` | 30 | Suspicious accounts with engagement rate data |
| `top_200_instagrammers.csv` | 200 | Global top 200 influencers (Kaggle) |

---

## 📈 Result

![Fraud Detection Chart](fraud_chart_real.png)

---

## 🚀 How to Run

1. Clone this repository
2. Install requirements: `pip install pandas scikit-learn matplotlib`
3. Open `instafraud.ipynb` in Jupyter Notebook or Google Colab
4. For SQL analysis: import all 3 CSVs into MySQL and run queries from `queries.sql`
5. Run all cells
