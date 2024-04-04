#### Preamble ####
# Purpose : Model set up
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Load necessary libraries
library(rstanarm)
library(readr)

# Load necessary libraries
library(rstanarm)
library(readr)

# Read the simulated data
library(readr)
simulated_cancer_deaths_data <- read_csv("data/simulated_cancer_deaths_data.csv")
simulated_data <- simulated_cancer_deaths_data

# Fit the model using rstanarm
sim_cancer_deaths_model <- stan_glm(
  formula = Year ~ Hospital1 + Hospital2 + Hospital3 + Hospital4 + Hospital5 ,  
  data = simulated_data,   
  family = poisson(link = "log"),  
  prior = normal(location = 0, scale = 2.5),  
  prior_intercept = normal(location = 0, scale = 2.5),  
  prior_aux = exponential(rate = 1),  
  seed = 302,  
  prior_PD = TRUE  
)

# Beep to indicate completion
beep()

# Save the model object
saveRDS(
  sim_cancer_deaths_model,
  file = "simulated_cancer_deaths_model.rds"
)
