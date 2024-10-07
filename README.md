# 🏡 House Price Prediction Project

<img width="1203" alt="photo2" src="https://github.com/user-attachments/assets/68bac370-ae06-4fbb-b1bd-8ee14f75c091">

## 📈 Problem Statement / Business Objective

In the competitive real estate market, accurately predicting selling prices of houses is crucial for strategic decision-making. This project aims to develop a machine learning model to predict house prices based on various features, including location, size, and number of rooms. Additionally, we analyze factors influencing higher property values (valued at $650,000 and above) to support targeted marketing, investment decisions, and property development strategies.

## 🔍 Data Analysis Workflow

### 1. 📊 Data Collection
The dataset contains multiple features describing properties:
- **Id**: Unique property identification number.
- **date**: Sale date of the house.
- **price**: Selling price of the house.
- **waterfront**: Waterfront view status.
- **condition**: Overall condition of the property (1 to 5 scale).
- **grade**: Grade based on the King County grading system (1 poor, 13 excellent).
- **sqft_above**: Square footage above the basement.
- **sqft_living15**: Living room area in 2015.
- **sqft_lot15**: Lot size area in 2015.

### 2. 🧹 Data Understanding and Wrangling
- Adjusted header names and data types.
- Addressed missing values to prepare for exploratory data analysis (EDA).

### 3. 🔍 EDA - Exploratory Data Analysis
- Analyzed probability distributions, identified outliers, and examined correlations.
- Insights revealed that square footage has the highest positive correlation with price (~0.70).
- Features with low correlations may be candidates for removal, while maintaining useful features.

### 4. ⚙️ Encoding Categorical Variables
Encoded string features (e.g., "bathrooms" and "floors") to numerical values for model use.

### 5. 🤖 Model Development
Developed a Linear Regression model to predict house prices, starting point for analysis.

### 6. 📊 Data Splitting
Divided the dataset into training and testing sets for model performance evaluation.

### 7. 📏 Feature Scaling
Applied Standardization Scaling to ensure features are on a similar scale, essential for model performance.

### 8. 🚀 Training the Model
Fitted the model using the scaled training data to generate price predictions.

### 9. 📉 Model Validation
Evaluated model performance with metrics like MAE, RMSE, and R-squared. Initial R-squared was 0.61.

### 10. 🔧 Improving the Model
Enhanced model performance through:
- **Log Scaling**: Applied log transformation to reduce extreme value impact; R-squared improved to 0.64.
- **Cross-Validation**: Implemented to provide a reliable performance estimate, resulting in an average R² score of approximately 0.8127.

## 🏆 Conclusion
The project successfully developed a model for predicting house prices with reasonable accuracy. Valuable insights into factors driving property value, especially for high-end properties, were provided. These findings can aid the company in making informed decisions regarding property investments, pricing strategies, and market positioning.
