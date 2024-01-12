library(data.table);library(magrittr)

exercise_data <- data.table(
  start_date = as.Date(c("2024-01-01", "2024-01-05", "2024-01-21", "2024-01-29")),
  duration = c(2, 3, 6, 6))



check_exercise_days <- function(start_date, duration) {
  return(seq(start_date, start_date+duration-1, by = "days"))
  
}

#hu<-exercise_data[,.(qwer=check_exercise_days(start_date,duration))]


#exercise_data[,end_date:=apply(1,seq(start_date,start_date+ duration,by="days"))]

help12313312321<-exercise_data[,hihi:=rep(seq(start_date, start_date+duration-1, by = "days"),.N),by="start_date"]

help<-help[,hihi:=unlist(hihi)]

help2<-exercise_data[,.(hihi=seq(start_date, start_date+duration-1, by = "days")),by="start_date"]
#apply(exercise_data,1,function(x){seq(x$start_dates, x$start_dates+x$durations-1, by = "days")})
