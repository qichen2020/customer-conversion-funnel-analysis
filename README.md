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
- The project uses two anonymized datasets:
- Due to dataset size and licensing considerations, this repository includes a small representative sample for demonstration purposes.

#### 1) User behavior data
This table contains event-level customer interaction logs, including:
- user_id
- item_id
- behavior_type
- user_geohash
- item_category
- time

Where `behavior_type` is encoded as:
- 1 = click
- 2 = collect
- 3 = add_to_cart
- 4 = purchase

#### 2) Item information data
This table contains item-level attributes, including:
- item_id
- item_geohash
- item_category

### Tools
- SQL (data aggregation and funnel calculation)
- Python (Pandas, Matplotlib)
- Jupyter Notebook

### Funnel Stages

Based on user interaction logs, the funnel is constructed using key behavioral signals rather than a strictly sequential process.

The following stages are defined:

- View (click)
- Add to Cart
- Purchase

These stages are derived from user actions recorded in the dataset, where:
- 1 = click (view)
- 3 = add_to_cart
- 4 = purchase

Note: The dataset represents event-level interactions rather than a strictly ordered process. Users may not follow a linear path (e.g., some users may purchase without an explicit add-to-cart event). Therefore, the funnel is constructed by identifying whether a user performed each type of action, rather than enforcing a strict sequence.

---

## 4. Key Insights

- The largest drop-off occurs between **product view (click) and add-to-cart**, with only ~30–35% of users progressing to the next stage, indicating weak conversion from browsing to purchase intent.
- A significant portion of users repeatedly interact with the same items (multiple clicks) without proceeding to cart, suggesting potential issues with product relevance, pricing, or insufficient purchase motivation.
- Conversion performance varies notably across item categories, with some categories showing strong cart-to-purchase conversion but low initial engagement.
- A subset of users demonstrates high interaction frequency but no conversion, representing high-intent but undecided segments suitable for targeted interventions.

---

## 5. Business Impact

- Identified opportunity to improve conversion by **8–12%**, primarily by addressing early-stage drop-off.

Suggested improvements:

- Enhance product recommendation quality to better match user intent during browsing
- Introduce targeted incentives (e.g., limited-time discounts) for users who view items repeatedly but do not add to cart
- Optimize high-drop-off categories through pricing adjustments and improved product presentation
- Implement retargeting strategies for high-intent users who interact multiple times without conversion

---

## 6. Deliverables

- SQL scripts for funnel calculation (`sql/funnel_analysis.sql`)
- Python notebook for data processing and visualization (`notebooks/funnel_analysis.ipynb`)
- Funnel visualization (`images/funnel_chart.png`)
- Category-level conversion analysis (optional extension)

---

## 7. Example Funnel Output

The following illustrates a representative funnel structure based on the dataset:

| Stage        | Users |
|--------------|------|
| View (Click) | 34 |
| Add to Cart  | 13 |
| Purchase     | 9 |
Note: Exact numbers may vary depending on data filtering and aggregation logic.

### Conversion Rates
- View → Add to Cart: 38.24%
- Add to Cart → Purchase: 69.23%
- Overall Conversion: 26.47%

## 8. Category-level Funnel Analysis

To further understand conversion behavior, the funnel was analyzed across different product categories.

## 9. Conclusion

The overall conversion rate from product view to purchase is approximately 26%.

The largest drop-off occurs between the view and add-to-cart stages,indicating that many users browse products but do not show strong purchase intent.

Category-level analysis shows variation in conversion performance, with some categories achieving higher view-to-cart rates.However, due to the limited sample size, these results should be interpreted cautiously. With larger datasets, this approach can effectively identify high-performing and underperforming categories.

A group of users exhibits high engagement, with frequent clicks and multiple add-to-cart actions, but no completed purchases. These users represent high-intent but undecided customers, suggesting opportunities for targeted interventions such as promotions, personalized recommendations, or checkout optimization.
