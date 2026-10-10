# ✈️ Airline Passenger Satisfaction Analysis

## Project Overview

This project analyzes airline passenger satisfaction using the Airline Passenger Satisfaction dataset from Kaggle. The analysis is performed using **R programming** to understand passenger experiences, identify service improvement opportunities, and explore the relationship between passenger satisfaction and different travel factors.

The project covers data cleaning, exploratory data analysis (EDA), graphical reporting, and business recommendations.

## Objectives

- Identify and handle missing values in the dataset.
- Convert passenger satisfaction into a binary target variable.
- Examine the distribution of satisfied and neutral/dissatisfied passengers.
- Compare passenger satisfaction across travel classes and customer types.
- Analyze service ratings and correlations between services.
- Explore flight distance and flight delays.
- Suggest areas where airlines can improve customer experience.

## Dataset

- **Dataset:** Airline Passenger Satisfaction
- **Source:** Kaggle
- **Domain:** Aviation
- **Size:** Approximately 130,000 rows, as specified in the project brief.

🔗 [Download the dataset from Kaggle](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction)

## Technologies Used

- R Programming
- tidyverse
- dplyr
- ggplot2
- reshape2
- Data Cleaning and Transformation
- Exploratory Data Analysis (EDA)
- Data Visualization
- Correlation Analysis

## Project Workflow

### Phase 1: Data Cleaning

- Checked columns for missing values.
- Handled missing values in arrival delay data.
- Encoded the satisfaction variable as binary:
  - Satisfied = 1
  - Neutral/Dissatisfied = 0
- Examined class distribution and imbalance.
- Removed irrelevant columns such as ID and index columns.
- Normalized service rating columns to a 0–1 scale using Min-Max scaling.

### Phase 2: Exploratory Data Analysis (EDA)

The analysis investigates:

1. Percentage of satisfied and neutral/dissatisfied passengers.
2. Average passenger age across travel classes.
3. Service categories with the lowest average ratings.
4. Average departure and arrival delays.
5. Number of flights with zero departure delay.
6. Satisfaction rates across Business, Eco, and Eco Plus classes.
7. Satisfaction differences between loyal and disloyal customers.

### Phase 3: Graphical Reports

The project includes the following visualizations:

- **Customer Loyalty Analysis:** Satisfaction proportions for loyal and disloyal customers.
- **Travel Class Comparison:** Satisfaction counts across Business, Eco, and Eco Plus classes.
- **Service Rating Correlation Heatmap:** Relationships between different service ratings.
- **Flight Distance Distribution:** Comparison of flight distance distributions by satisfaction category.

### Phase 4: Business Decisions

The findings can help airlines:

- Identify low-rated services that may need investment.
- Compare customer experience across travel classes.
- Understand satisfaction differences between loyal and disloyal passengers.
- Investigate whether flight delays are associated with lower satisfaction.
- Develop data-driven strategies to improve passenger experience.

## Repository Structure

```text
airline-passenger-satisfaction-analysis/
│
├── README.md
├── project_code.R
├── test.csv
└── visualizations/
    └── (Add exported charts here)
```

*Note: Add only the files that are actually present in your repository. Do not upload the dataset if its license or sharing terms do not permit redistribution.*

## How to Run the Project

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install RStudio or another R-compatible editor.
3. Download the dataset from Kaggle.
4. Place the dataset in the project folder and use the filename expected by the R script.
5. Install the required packages:

```r
install.packages(c("tidyverse", "reshape2"))
```

6. Open `project_code.R` in RStudio.
7. Run the script and review the analysis outputs and plots.

## Results

The R script calculates passenger satisfaction percentages, average age by travel class, service rating averages, flight delays, satisfaction rates by customer type and class, and service-rating correlations.

**Actual findings and numerical results will be added after running and validating the analysis.**

## Key Learning Outcomes

- Data cleaning and missing-value handling in R.
- Data transformation and binary encoding.
- Exploratory data analysis using dplyr.
- Data visualization using ggplot2.
- Correlation analysis and heatmap creation.
- Interpreting data to support business decisions.

## Author

**Abhinav Pradhan**

Data Analytics | R Programming | Exploratory Data Analysis

---

If you find this project useful, feel free to explore the code and suggest improvements.
