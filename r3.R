library(data.table)
a<-data.table(x=rep(1,6), y=10:15, d=1:6, z=c("k1","k1","k1","k2","k2","k3")) %>%
  .[,e:=y+d-1 ] %>% .[,f=list(d:e)]
  

library(lubridate)
ymd("19900903")+5

exercise_data <- data.frame(
  start_date = as.Date(c("2024-01-01", "2024-01-10", "2024-02-05", "2024-03-15")),
  duration = c(5, 8, 4, 10)
)

# Calculate end dates based on start dates and durations
exercise_data$end_date <- exercise_data$start_date + exercise_data$duration - 1

# Function to check if within any 28-day period there are more than 14 exercise days
check_exercise_days <- function(start_date, end_date) {
  # Create a sequence of dates from start_date to end_date
  date_sequence <- seq(start_date, end_date, by = "days")
  
  # Check if within any 28-day window there are more than 14 exercise days
  for (i in 1:(length(date_sequence) - 27)) {
    window <- date_sequence[i:(i + 27)]
    if (sum(window %in% exercise_data$start_date) > 14) {
      return(TRUE)
    }
  }
  return(FALSE)
}

# Apply the function to each row of the dataset
exercise_data$more_than_14_days <- mapply(check_exercise_days, exercise_data$start_date, exercise_data$end_date)

# Print the result
print(exercise_data)\\\\\\\\\\\\\













install.packages("data.table")
library(data.table)

# Sample data (replace this with your actual data)
exercise_data <- data.table(
  start_date = as.Date(c("2024-01-01", "2024-01-10", "2024-02-05", "2024-03-15")),
  duration = c(5, 8, 4, 10)
)


start_date
# Create a sequence of dates from the minimum start date to the maximum end date
date_sequence <- seq(min(exercise_data$start_date), max(exercise_data$start_date + exercise_data$duration - 1), by = "days")

# Create a data.table with all the dates in the sequence
all_dates <- data.table(date = date_sequence)

# Function to check if within any 28-day period there are more than 14 exercise days
check_exercise_days <- function(start_date, end_date) {
  window <- seq(start_date, end_date, by = "days")
  sum(window %in% exercise_data$start_date) > 14
}

# Apply the function to each row of the dataset
all_dates[, more_than_14_days := sapply(.SD, function(date) {
  any(exercise_data[, check_exercise_days(date, date + 27), by = .I]$V1)
}), by = .(date)]

# Print the result
print(all_dates)
