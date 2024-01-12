library(data.table);library(magrittr)

qwerty<-data.table(a=c(1,1,1,1,2,2),b=c(1,10,20,30,40,50),cd=c(1,2,3,3,2,1)) %>% .[rep(c(1:6),cd),y:=seq(1,cd,1)]

d
qwerty<-data.table(a=c(1),b=c(2)) %>% .[,y:=seq(1,b),by="a"]


library(data.table)

# Create a data.table
b <- data.table(x = c(1, 2), y = c(3, 4))

# Duplicate each row in the data.table
b[, .(x = rep(x, each = 2), y = seq(y,y+1,1))]

# Alternatively, you can use rep() directly within the := operator
b[, c("x", "y") := .(rep(x, each = 2), rep(y, each = 2))]

# Print the resulting data.table
print(b)