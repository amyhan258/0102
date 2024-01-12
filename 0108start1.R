library(data.table);library(magrittr)

exercise_data <- data.table(
  start_date = as.Date(c("2024-01-01", "2024-01-10", "2024-01-20", "2024-01-24",)),
  duration = c(12, 8, 4, 10)
) %>% .[,end_date:=start_date+duration]

new_exercise_data<-exercise_data[1,]

for (i in c(2:length(exercise_data$start_date))){
  if (new_exercise_data[.N, end_date]<exercise_data[i,start_date]) {
    new_exercise_data<-new_exercise_data %>% rbind(exercise_data[i,])
    print(i)
  } else {
    new_exercise_data<-new_exercise_data[.N,duration:=duration+exercise_data$duration[i]] %>% .[.N, end_date:=start_date+duration]
    print("hi~")
  }
}
print(new_exercise_data)
