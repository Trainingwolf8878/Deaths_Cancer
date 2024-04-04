#### Preamble ####
# Purpose : Graph the simulated data
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Work space set up
library(ggplot2)

# Read the simulated data
library(readr)
simulated_cancer_deaths_data <- read_csv("data/simulated_cancer_deaths_data.csv")

# Melt the data into long format for ggplot
data_long <- tidyr::pivot_longer(simulated_cancer_deaths_data, cols = -Year, names_to = "Hospital", values_to = "Deaths")

# Create the scatter plot with colored lines for each hospital
ggplot(data_long, aes(x = Year, y = Deaths, color = Hospital, group = Hospital)) +
  geom_point() +
  geom_line() +
  labs(title = "Cancer Deaths by Hospital Over Time",
       x = "Year",
       y = "Number of Deaths",
       color = "Hospital") +
  theme_minimal()

