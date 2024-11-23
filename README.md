# Tourism Revenue Analysis and Forecasting

## Overview

This project analyzes and forecasts monthly tourism revenue using time series analysis techniques. By leveraging ARIMA models and transfer function modeling, we establish a predictive relationship between the number of foreign tourists and corresponding tourism revenue. The project provides actionable insights for stakeholders in the tourism industry.

---

## Methodology

### Data Preprocessing
- The dataset includes monthly data on:
  - **x**: Number of foreign tourists
  - **y**: Monthly tourism revenue (in monetary units)
- A square root transformation was applied to stabilize variance in the data.

### Model Development
1. **ARIMA Models**:
   - The input series (\( x_1 \)) was fitted with candidate ARIMA models:
     - ARIMA((1),1,0)
     - ARIMA(0,1,(1))
     - ARIMA((1),1,(1))
   - The best ARIMA model for the input series was selected based on residual diagnostics and AIC values.

2. **Transfer Function Models**:
   - Cross-correlation analysis (CCF) between the input (\( x_1 \)) and output (\( y_1 \)) series determined the lag structure (\( b, r, s \)).
   - Candidate transfer function models were developed for:
     - \( (b, r, s) = (0, 2, 1) \)
     - \( (b, r, s) = (0, 1, 1) \)
     - \( (b, r, s) = (0, 0, 1) \)
   - The final model was selected based on statistical significance and white noise residuals.

---

## Results

### Final Transfer Function Model:
\[
(1 - B)Y_t = \frac{0.71569}{1 - 0.39636B}BX_t + a_t, \quad \hat{a}_t = 380.9856
\]

### Model Evaluation:
- **Variance Estimate**: 2807.963
- **AIC**: 380.9856
- All parameters in the final model were statistically significant, and residuals were confirmed to be white noise.

---

## Insights and Applications

### Tourism Industry:
- The model can help forecast short-term tourism revenue based on expected tourist numbers.
- Useful for marketing strategies, budgeting, and resource allocation.

### Future Work:
- Explore seasonality and long-term trends using decomposition methods.
- Integrate external factors (e.g., economic indicators, global events) to improve robustness.

---

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/jiyechoi-data/tourism-revenue-analysis.git
2. Open the tourism_revenue_analysis.sas script in SAS.
3. Run the script step-by-step to reproduce the analysis.

---

## Repository Structure
├── README.md                
├── tourism_revenue_analysis.sas 



