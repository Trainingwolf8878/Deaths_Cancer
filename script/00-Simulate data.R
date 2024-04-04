#### Preamble ####
# Purpose : Simulate data of death of cancer
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Load necessary libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(302)

# Simulate the data
years <- seq(2004, 2024)
num_hospitals <- 5

# Create an empty data frame to store the simulated data
simulated_data <- tibble()

# Loop through each year and simulate the total number of deaths for each hospital
for (year in years) {
  hospital_deaths <- tibble(Year = year)
  for (i in 1:num_hospitals) {
    hospital <- paste0("Hospital", i)
    deaths <- rpois(1, lambda = 100 + i*10)  # Simulate total number of deaths for the year
    hospital_deaths[[hospital]] <- deaths
  }
  simulated_data <- bind_rows(simulated_data, hospital_deaths)
}

# Write data to CSV file
write_csv(simulated_data, "simulated_cancer_deaths_data.csv")
