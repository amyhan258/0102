library(data.table)
library(tidyverse)
hi<-data.table(x=c(1:5,1:5),y=2:11,z=10:19,k=c("a","b","c","d","e","a","b","c","d","a"))
 hi[,.(new1=sum(x)),keyby=k]     # 중요!
# hi<-hi[,new2:=sum(x+y)]
# hi[,.(new3=sum(x*y)),keyby=k]
hi2<-melt(hi,
  id.vars = c("x","y"),
  measure.vars = c("k"),
  variable.name = "k",
  value.name = "val")
hi4<-data.table(x=c(1:6),t=3:8)
merge(hi, hi4, by="x", all.x=F,all.y=T)

hi[c(1,2),2]<-c(-100,1000000)
DT[1, 2:3] <- as.list(DT[5, c(y, z)])


hi<-hi[,e:=lapply(z,function(k){k+1}) %>% unlist() ]

hihihihihi<-hi[,f:=lapply(k,function(x){gsub("a","qwerty",x)}) %>% unlist() ]

hihihihihi<-hihihihihi[,f:=ifelse(nchar(f)>4,stringr::str_sub (f,2,4),f)]

