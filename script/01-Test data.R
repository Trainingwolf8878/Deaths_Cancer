#### Preamble ####
# Purpose : Test simulate data of death of cancer
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Work space set up

library(readr)
simulated_cancer_deaths_data <- read_csv("data/simulated_cancer_deaths_data.csv")
View(simulated_cancer_deaths_data)

# Check for missing values in the dataset

any_missing <- any(is.na(data))
if (any_missing) {
  print("There are missing values in the dataset.")
} else {
  print("There are no missing values in the dataset.")
}

# Check data types of variables
variable_types <- sapply(data, class)
print(variable_types)

# Check if all values in the dataset are integers
all_integer <- all(sapply(data, function(x) all(as.integer(x) == x)))
if (all_integer) {
  print("All values in the dataset are integers.")
} else {
  print("Not all values in the dataset are integers.")
}

# Check if all values in the dataset are numeric
all_numeric <- all(sapply(data, is.numeric))
if (all_numeric) {
  print("All values in the dataset are numeric.")
} else {
  print("Not all values in the dataset are numeric.")
}

# Check for unique values in each variable
unique_values <- sapply(data, function(x) length(unique(x)))
print(unique_values)

# Check if all values in each variable are the same
constant_values <- sapply(data, function(x) length(unique(x)) == 1)
if (any(constant_values)) {
  print("There are variables with constant values.")
} else {
  print("There are no variables with constant values.")
}

# Check for outliers using boxplots
boxplot(data[, -1], main = "Cancer Deaths by Hospital", xlab = "Hospital", ylab = "Number of Deaths")

# Calculate summary statistics for each variable
summary_stats <- summary(data[, -1])
print(summary_stats)

# Calculate z-scores for check the data 
z_scores <- data %>%
  mutate_at(vars(-Year), ~ (.-mean(.)) / sd(.))

outliers <- z_scores %>%
  filter(across(-Year, ~ abs(.) > 3))

if (nrow(outliers) > 0) {
  print("Outliers detected:")
  print(outliers)
} else {
  print("No outliers detected.")
}
