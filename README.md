# Problem Statement / Business Objective

In the competitive real estate market, accurately predicting the selling prices of houses is crucial for strategic decision-making. Our company aims to develop a machine learning model that predicts house prices based on various features such as location, size, number of rooms, and other characteristics. Additionally, senior management wants to understand the key factors that influence higher property values, specifically those valued at $650,000 and above. This analysis will support targeted marketing, investment decisions, and property development strategies.

## Data Analysis Workflow

### 1. Data Collection

The dataset used for this analysis was obtained from a reliable real estate source containing multiple features that describe the properties such as:

- **Id**: Unique identification number for the property.
- **date**: Date the house was sold.
- **price**: Price of the house.
- **waterfront**: Whether the house has a view of a waterfront.
- **condition**: Overall condition of the property (1 indicates worn out, 5 indicates excellent).
- **grade**: Overall grade given to the housing unit based on the King County grading system (1 poor, 13 excellent).
- **sqft_above**: Square footage of the house apart from the basement.
- **sqft_living15**: Living room area in 2015 (implies some renovations). This might or might not have affected the lot size area.
- **sqft_lot15**: Lot size area in 2015 (implies some renovations).

These features are critical in determining the market value of a house.

### 2. Data Understanding and Wrangling

Before diving into modeling, it is essential to explore the dataset to understand its structure and how it could impact the model's performance. This process is known as "Data Cleaning" and involves:

- Changing the header names.
- Checking and adjusting the data types in each column.
- Dealing with missing values (NANs).

We made our data ready to start with EDA by completing the above process.

### 3. EDA - Exploratory Data Analysis

In the next steps, we start exploring our data. This step includes:

- Checking the probability distributions within the columns.
- Identifying outliers.
- Checking the relationships between the columns.

#### Insights from Probability Distributions:

- Most of the plots are normally distributed, indicating a good sample.
- There are several distinct peaks in the distribution of some variables like grade or condition, suggesting that the data might be composed of different subgroups or categories.
- Variables related to property square footage (SQFT) have a skew in their distributions, indicating a potential need for transformations to meet model assumptions.
- The "id," "zipcode," and "yr_built" columns do not seem normally distributed as they represent categorical or continuous data types not expected to follow a normal distribution.

#### Insights from Identifying Outliers:

- Outliers for the "price" column are values smaller than -162500 or bigger than 1129500.

#### Insights from Correlation Analysis:

- The square footage of the living area has the highest positive correlation with "price" at approximately 0.70. This suggests that as the living area increases, the price of the house tends to increase as well.
- The variables "sqft_living," "grade," and "sqft_above" are the most important predictors of house prices in this dataset.
- Features with very low correlations (e.g., "zipcode," "id," "condition") may not contribute much to the model and could be candidates for removal, though "zipcode" might still be useful if it's one-hot encoded or used in combination with other features.
- We don't have any features with correlations higher than 0.9, so we will keep all of the features.

### 4. Encoding Categorical Variables

Most machine learning algorithms cannot handle strings as features for the model. To use that information, we need to represent it numerically. We encoded the "bathrooms" and "floors" in this step.

### 5. Model Development

For predicting house prices, various machine learning models can be considered. In this project, I used the "Linear Regression" model, which is a simple model that can be a good starting point.

### 6. Splitting the Data

The dataset was divided into training and testing sets to evaluate model performance.

### 7. Feature Scaling

Before training the models, it's essential to scale the features to ensure they are on a similar scale. This is particularly important for models like Linear Regression or Gradient Boosting Machines, where the algorithm's performance can be affected by the range of feature values. I used "Standardization Scaling" in this project.

### 8. Training the Model

The scaled training data was used to fit the models. In this step, the model generated the "predictions," which are the predicted house prices.

### 9. Model Validation

I evaluated model performance using metrics like Mean Absolute Error (MAE), Root Mean Squared Error (RMSE), and R-squared. The R-squared of the model is 0.61, which is almost good, but in the next steps, I attempted to improve the model and its R-squared.

### 10. Improving the Model

I improved my model in two key steps to enhance its performance and reliability:

- **Log Scaling the Numerical Variables**: Applied a logarithmic transformation to the `Y_test` and `Y_train`. Log scaling helped to reduce the impact of extreme values and bring the distribution closer to normal. The R-squared of the model increased from 0.61 to 0.64 after this step.
  
- **Evaluating Using Cross-Validation**: Implemented cross-validation during the evaluation phase to further enhance the model's reliability. Cross-validation divides the training data into multiple folds (subsets). The model is then trained on some of these folds and validated on the remaining ones, repeating this process multiple times. By averaging the results across these iterations, cross-validation provides a more accurate and reliable estimate of the model’s performance on unseen data. The cross-validation results show that the model is performing well, with an average R² score of approximately 0.8127, indicating that the model explains a significant portion of the variance in house prices, making it a reliable tool for predicting house prices in the given dataset.

## Conclusion

The project successfully developed a model that predicts house prices with reasonable accuracy and provided valuable insights into the factors that drive property value, especially for high-end properties. These findings can help the company make informed decisions regarding property investments, pricing strategies, and market positioning.
