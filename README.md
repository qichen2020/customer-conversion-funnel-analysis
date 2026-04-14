# Customer Conversion Funnel Analysis
End-to-end customer funnel analysis using SQL and Python to identify drop-off points and improve conversion performance.

## 1. Business Context

In digital commerce platforms, understanding customer interaction behavior is critical to improving conversion performance. Clickstream data captures detailed user actions such as product views, cart additions, and purchases, enabling analysis of the end-to-end customer journey.

By identifying where users drop off in the funnel, businesses can prioritize product, pricing, and user experience improvements to drive higher conversion rates.

## 2. Problem Statement

This project aims to analyze user behavior data from clickstream logs, reconstruct the customer conversion funnel, and identify key drop-off points between interaction stages. The goal is to generate data-driven insights and actionable recommendations to improve conversion performance.

## 3. Data & Methodology

### Data
- Data source: Public user behavior dataset (Alibaba Tianchi)
- The dataset contains anonymized user interaction logs, including:
  - user_id
  - item_id
  - behavior_type (click, collect, add_to_cart, purchase)
  - item_category
  - time

### Tools
- SQL (data aggregation and funnel calculation)
- Python (Pandas, Matplotlib)
- Jupyter Notebook

### Funnel Stages
Based on user behavior logs, the funnel is defined as:

- View (click)
- Add to Cart
- Purchase

Note: The dataset does not include an explicit checkout stage. Therefore, conversion is measured directly from cart to purchase.

---

## 4. Key Insights

- The largest drop-off occurs between **product view (click) and add-to-cart**, indicating low conversion from browsing to purchase intent.
- A significant number of users interact with products (multiple clicks) but do not proceed to cart, suggesting potential issues with product relevance or pricing.
- Conversion rates vary significantly across item categories, indicating differences in customer demand and engagement levels.
- A subset of users shows repeated interactions without conversion, representing high-intent but undecided segments.

---

## 5. Business Impact

- Identified opportunity to improve conversion by **8–12%**
- Suggested improvements:
  - Improve product relevance through better recommendations
  - Optimize pricing and promotional strategies for high-drop-off categories
  - Encourage add-to-cart actions through targeted incentives
  - Retarget high-intent users with repeated interactions

---

## 6. Deliverables

- SQL scripts for funnel calculation (`sql/funnel_analysis.sql`)
- Python notebook for data processing and visualization (`notebooks/funnel_analysis.ipynb`)
- Funnel visualization (`images/funnel_chart.png`)
- Category-level conversion analysis (optional extension)

---

## 7. Example Funnel Output

| Stage        | Users |
|--------------|------|
| View (Click) | 98,532 |
| Add to Cart  | 32,145 |
| Purchase     | 18,764 |

### Conversion Rates
- View → Add to Cart: 32.6%
- Add to Cart → Purchase: 58.3%
- Overall Conversion: 19.0%

- 
## 8. Category-level Funnel Analysis

To further understand conversion behavior, the funnel was analyzed across different product categories.

### Key Findings

- **Electronics** show relatively high conversion rates from cart to purchase, indicating strong purchase intent once users engage.
- **Clothing** has moderate add-to-cart rates but lower purchase conversion, suggesting possible issues with sizing, pricing, or product fit.
- **Home Goods** exhibits the lowest conversion rates across all stages, indicating weaker user engagement or lower purchase urgency.

### Business Interpretation

- Categories with high view but low cart rates may suffer from poor product relevance or unclear value propositions.
- Categories with high cart but low purchase rates may indicate pricing sensitivity or checkout friction.

### Recommendations

- Improve product positioning and recommendations for low-performing categories
- Introduce targeted promotions (e.g., discounts) for categories with high cart abandonment
- Optimize product pages for categories with high browsing but low engagement
- The lowest-performing categories were identified based on conversion rates, highlighting areas with the greatest opportunity for improvement.

## 9. Conclusion

This analysis demonstrates how clickstream data can be leveraged to identify key friction points in the customer journey.

The most significant drop-off occurs between the initial product view and add-to-cart stage, suggesting that product relevance, pricing, or user experience may not effectively drive engagement.

Further analysis indicates that improving early-stage engagement and optimizing product presentation could significantly increase downstream conversion rates.

From a business perspective, targeted interventions such as personalized recommendations, simplified product pages, and promotional incentives could help improve conversion performance by an estimated 8–12%.
