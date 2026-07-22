# Credit Card Spending Analysis (SQL)

## Overview
Analysis of 2,458 credit card transactions across 150 customers over a 6-month
period (Jan–Jun 2025), answering business questions relevant to card issuers —
spending patterns, customer segmentation, category and city-level trends.

## Dataset
| Column | Description |
|---|---|
| transaction_id | Unique transaction identifier |
| customer_id | Unique customer identifier |
| timestamp | Date and time of transaction |
| amount | Transaction value (INR) |
| category | Spending category (Travel, Groceries, Dining, etc.) |
| merchant | Merchant name |
| city | Customer's city |

150 customers · 10 spending categories · 10 cities · 6 months of data

## Tech Used
MySQL · SQL (GROUP BY, HAVING, JOINs, subqueries, CASE statements, aggregate functions)

## Key Business Questions & Insights

1. **Total spend by category** — `[fill in: top category and amount]`
2. **Top 10 customers by total spend** — `[fill in: e.g. top 10 customers account for X% of total spend]`
3. **Monthly spending trend** — Spending peaked in April (₹18.6L) and dipped lowest in February (₹14.8L). Spend stays in the ₹14.7L–18.6L range across all 6 months, with April standing out as the high point — likely tied to a spike in travel/electronics purchases that month.
4. **Average transaction value by category** — Travel and Electronics have near-identical average transaction values (₹13,692 and ₹13,674) — over 4x higher than any other category. While Groceries/Fuel/Utilities occur more often, Travel and Electronics purchases carry far more weight per transaction, which explains why Travel leads total spend despite lower frequency.
5. **Highest transaction count by merchant** — `[fill in: top merchant and count]`
6. **Customers spending above average** — `[fill in: how many customers, e.g. X out of 150 customers spend above the per-customer average]`
7. **Spend by day of week** — `[fill in: weekday vs weekend pattern]`
8. **Frequent vs occasional customers** — `[fill in: e.g. X customers classified as Frequent, Y as Regular, Z as Occasional]`
9. **Highest single transaction per customer** — `[fill in: highest value and category it fell under]`
10. **Category-wise spend contribution (%)** — Travel dominates spending at 28.5% of total (₹28L), followed by Electronics at 18.2% — together these two categories account for nearly 47% of all spend, despite being lower-frequency purchases. Fuel is the smallest contributor at just 3.7%, consistent with its low per-transaction value.
11. **Spending trend for top 3 categories over time** — `[fill in: how Travel/Electronics/Dining trended month over month]`
12. **City-wise spend comparison** — Gurugram leads in total spend (₹13.3L) despite Mumbai having slightly more transactions (326 vs 318) — Gurugram customers spend more per transaction on average (₹4,197 vs ₹3,808). Noida is lowest at ₹5.8L total, roughly 44% of Gurugram's volume, likely tied to fewer active customers in that city segment.

## How to Run
1. Import `credit_card_transactions.csv` into MySQL (Table Data Import Wizard, or `LOAD DATA INFILE`)
2. Run the queries in `queries.sql` — each is commented with its business question

## Files
- `credit_card_transactions.csv` — dataset
- `queries.sql` — all 12 business-question queries
- `README.md` — this file
