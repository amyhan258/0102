library(data.table);library(magrittr)

exercise_data <- data.table(
  start_date = as.Date(c("2024-01-01", "2024-01-02", "2024-01-21", "2024-01-29")),
  duration = c(2, 3, 6, 6),z=c(1,1,1,2))

new_exercise_data<-exercise_data[1,]

for (i in c(2:length(exercise_data$start_date))){
  if (new_exercise_data[.N, start_date+duration]<exercise_data[i,start_date]) {
    new_exercise_data<-new_exercise_data %>% rbind(exercise_data[i,])
  } else {
    new_exercise_data<-new_exercise_data[.N,duration:=duration+exercise_data$duration[i]]
  }
}

check_exercise_days <- function(start_dates, durations) {
  drug_yes=Date()
  for (i in c(1:length(start_dates))) {
    drug_yes<-union(drug_yes,seq(start_dates[i], start_dates[i]+durations[i]-1, by = "days"))
  }
  return(as.vector(drug_yes))
}

new_exercise_data <- new_exercise_data[,drug_yes:=as.list(check_exercise_days(start_date,duration))]
