# Descriptive Analysis of Demographic Data


## Data Set Description
The data set used in this analysis is derived from the International Data Base of the US Census Bureau. It includes data from 2002 to 2022 for 227 countries, five regions, and 21 subregions. The data set includes attributes such as:
- Life Expectancy at Birth for Both Sexes
- Life Expectancy at Birth for Males
- Life Expectancy at Birth for Females
- Under Age 5 Mortality for Both Sexes
- Under Age 5 Mortality for Males
- Under Age 5 Mortality for Females

The data is of high quality, with only 10 out of 454 observations having missing values, which were removed, leaving 444 observations for analysis.

### Data Source
The International Data Base (IDB) contains various demographic data (currently from 1950 to 2100) on all states and regions of our world that are recognized by the U.S. Department of State and have a population of 5000 or more. The sources of the database are information from state institutions, such as censuses, surveys, or administrative records, as well as estimates and projections by the U.S. Census Bureau itself.

The dataset in the file `census2002_2022.csv` contains a small extract from the IDB. It includes life expectancy at birth and under age 5 mortality rates for 227 countries from 2002 and 2022. Both variables are stratified by sex, and the countries are divided geographically into 5 regions and 21 subregions. For exact definitions of these variables, see the [Glossary](https://www.census.gov/programs-surveys/international-programs/about/glossary.html). 
For further details regarding data collection, see the [IDB Program](https://www.census.gov/programs-surveys/international-programs/about/idb.html).

### Project Objective
The objective is to conduct a descriptive analysis to extract meaningful insights about life expectancy and under-age five mortality. The analysis includes:
- Frequency distribution of the variables using a five-number summary
- Visual representation using histograms and box plots
- Calculation of homogeneity and heterogeneity within and between sub-regions in Europe
- Correlation analysis using heat maps and scatter plots
- Comparison of data between 2002 and 2022

## Statistical Methods 
The following statistical methods were employed in the analysis:

### Five-number summary
This includes the minimum, first quartile (Q1), median (Q2), third quartile (Q3), and maximum values to summarize the data distribution.

### Interquartile Range (IQR)
The difference between Q3 and Q1 to measure the data's dispersion.

### Arithmetic Mean
The average value of the data set.

### Boxplot
A graphical representation of the five-number summary to visualize data distribution and identify outliers.

### Histogram
A bar chart representing the frequency distribution of variables.

### Scatterplots
Graphs to observe relationships between bivariate numeric variables.

### Heat map
A 2-dimensional data visualization technique to represent the magnitude of phenomena and show the correlation matrix of variables.

### Correlation
A measure of linearity between two variables, using Pearson’s correlation coefficient.

## Statistical Analysis

### Frequency Distribution
The frequency distribution of life expectancy and mortality was calculated and visualized. It was observed that women generally live longer than men, and the life expectancy in Africa is the lowest compared to other regions.

### Homogeneity and Heterogeneity in Europe
The analysis showed that Western and Northern Europe have homogeneous life expectancy and mortality values, while Southern and Eastern Europe have more variability.

### Correlation Between Variables
Life expectancy and under-age-five mortality are negatively correlated. Life expectancy at birth for both sexes, males, and females are positively correlated. 

### Comparison Between 2002 and 2022
Life expectancy has increased from 2002 to 2022, while under-age-five mortality has decreased, reflecting improvements in healthcare over time.

## Statistical Analysis

### Frequency Distribution
The frequency distribution of life expectancy and mortality was calculated and visualized. It was observed that women generally live longer than men, and the life expectancy in Africa is the lowest compared to other regions.

### Homogeneity and Heterogeneity in Europe
The analysis showed that Western and Northern Europe have homogeneous life expectancy and mortality values, while Southern and Eastern Europe have more variability.

### Correlation Between Variables
Life expectancy and under-age-five mortality are negatively correlated. Life expectancy at birth for both sexes, males, and females are positively correlated. 

### Comparison Between 2002 and 2022
Life expectancy has increased from 2002 to 2022, while under-age-five mortality has decreased, reflecting improvements in healthcare over time.

## Summary of Key Findings
- **Women live longer than men**: The analysis revealed that, on average, women have a higher life expectancy compared to men across all regions.
- **Regional Disparities**: Africa has the lowest life expectancy and the highest under-age five mortality rates. In contrast, Europe has the highest life expectancy and lower mortality rates.
- **Positive Trends Over Time**: From 2002 to 2022, life expectancy significantly increased, and under-age five mortality decreased, indicating improvements in global health and medical care.
- **Correlation Insights**: There is a strong negative correlation between life expectancy and mortality in the underage five group. Life expectancy for males and females shows a strong positive correlation, as does under-age five mortality for both sexes.


## Dependencies

### R Packages
All R dependencies are listed in the `R_requirements.txt` file. To install them, you can use the following R script:

```R
# Read the required packages from the file and install them
packages <- readLines("R_requirements.txt")
install.packages(packages)
```

