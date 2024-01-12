library(data.table);library(magrittr)
a<-data.table(x=c(rep("c",3),rep("d",3)),y=c(2,10,20,30,40,50),z=c(2,5,3,7,1,8),w=rep(0,6)) %>% .[,k:=rep(rep(seq(1,5,1),2))]
rep(seq(1,5,1),2)


b<-data.table(x=c(1,2))
b<-b[rep(),y:=rep(x,2)]

b <- data.table(x = c(1, 2))

# Use rep() to replicate each value in column 'x' twice

b[, y := rep(x, each = 2)]

# Print the resulting data.table
print(b)


dt <- data.table(fact = c("a", "b", "c"), count = c(1, 2, 3))
dt
dt[rep(seq(1, nrow(dt)), dt$count),]


b<-data.table(x=c(1,2)) 
b[rep(seq(1, nrow(b)), 2),y:=rep(x,2)]


