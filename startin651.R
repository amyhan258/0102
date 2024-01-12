library(data.table);library(magrittr)

exercise_data <- data.table(
  start_date = as.Date(c("2024-01-01", "2024-01-02", "2024-01-21", "2024-01-29")),
  duration = c(2, 10, 6, 6),z=c(1,1,1,1))

new_exercise_data<-exercise_data[1,]

for (i in c(2:length(exercise_data$start_date))){
  if (new_exercise_data[.N, start_date+duration]<exercise_data[i,start_date]) {
    new_exercise_data<-new_exercise_data %>% rbind(exercise_data[i,])
  } else {
    new_exercise_data<-new_exercise_data[.N,duration:=duration+exercise_data$duration[i]]
  }
}

check_exercise_days <- function(start_date, duration) {
  return(seq(start_date, start_date+duration-1, by = "days"))
}

help3<-new_exercise_data[,hi:=mapply(check_exercise_days, start_date, duration)]

help3<-help3[,vdsvvdvd:=sum(hi),keyby="z"]
help3 <- help3 %>% .[,vuvu:=sum(seq(start_date:start_date+27,1) %in% hi),by="start_date"]
  
#ifelse(sum(seq(as.numeirc(start_date):as.numeirc(start_date)+27,1) %in% hi)>=14,"Y","N"))
