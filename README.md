# customer-conversion-funnel-analysis
End-to-end customer funnel analysis using SQL and Python to identify drop-off points and improve conversion performance.
# Customer Conversion Funnel Analysis

## 1. Business Context
In digital platforms such as retail banking and e-commerce, understanding the customer journey is critical to improving conversion and user experience. Identifying where users drop off in the funnel helps prioritize product and UX improvements.

## 2. Problem Statement
This project aims to analyze the end-to-end customer journey, identify key drop-off points in the funnel, and propose data-driven recommendations to improve conversion rates.

## 3. Data & Methodology

### Data
- Simulated event-level dataset representing user interactions
- Columns include: user_id, event_time, event_type, device_type

### Tools
- SQL (data aggregation and funnel calculation)
- Python (Pandas, Matplotlib)
- Jupyter Notebook

### Funnel Stages
- Product View
- Add to Cart
- Checkout
- Purchase

---

## 4. Key Insights

- The largest drop-off occurs between **checkout and purchase**, indicating friction in the final step.
- Mobile users show significantly lower conversion rates compared to desktop users.
- A high number of users abandon during checkout, suggesting potential UX or payment issues.

---

## 5. Business Impact

- Identified opportunity to improve conversion by **8–12%**
- Suggested improvements:
  - Simplify checkout process
  - Reduce form fields
  - Improve mobile experience
  - Provide clearer pricing and payment options

---

## 6. Deliverables

- SQL scripts for funnel calculation (`sql/funnel_analysis.sql`)
- Python notebook for analysis and visualization (`notebooks/funnel_analysis.ipynb`)
- Funnel visualization (`images/funnel_chart.png`)

---

## 7. Example Funnel Output

| Stage        | Users |
|--------------|------|
| View         | 10,000 |
| Add to Cart  | 6,500 |
| Checkout     | 3,200 |
| Purchase     | 2,400 |

---

## 8. Visualization

![Funnel Chart](images/funnel_chart.png)

---

## 9. Conclusion

This project demonstrates how data analysis can be used to identify conversion bottlenecks and support business decisions in optimizing customer journeys.
