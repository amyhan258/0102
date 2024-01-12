library(data.table)
library(magrittr)
library(ggplot2)

df2 <- data.table(supp=rep(c("VC", "OJ"), 3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))

ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge())
          
dfdf3<-data.table(x=c(1,1,1,1,1),y=1:5) 
melt(dfdf3,)

#dfdf3<-dfdf3 %>% rbind(dfdf3[,sum(y),keyby="x"],use.names=F)


dfdf3<-dfdf3[,percent:=y/sum(y)*100,by="x"] 

DT <- data.table(A = letters[1:10], X = 1:10, Y = 11:20)
as.matrix(DT) # character matrix
as.matrix(DT, rownames = "A")
as.matrix(DT, rownames = 1)
as.matrix(DT, rownames = TRUE)

setkey(DT, A)
as.matrix(DT, rownames = TRUE)



hi13<-data.table(이름=c("궁하","소심","백옥"),눈병=c(1,100,1000),바보=c(200,300,40000),심장=c(100,500,900)) 
hiru<-heatmap(as.matrix(hi13, rownames = "이름"))


aaa<-data.table(처방명=rep("궁하탕",5),상병명=c("a","b","c","d","e"),숫자=c(100,200,300,400,500))



data.table(처방명="궁하탕",aaa$상병명:=aaa$숫자)

hu<-c(55,56)

huhu<-data.table(처방명=hu) %>% .[,c("d","e"):=c(c(1),c(2))]

m1<-matrix(data=c(1:5),nrow=1,ncol=5,dimnames=list("궁하탕",c("눈","코","입","귀","손")))
m2<-matrix(data=c(10:14),nrow=1,ncol=5,dimnames=list("소심탕",c("눈","코","입","귀","발")))
rbind(m1,m2,use.names=TRUE,fill=F)
r
gDT <- data.table(A = letters[1:10], X = 1:10, Y = 11:20)

t(as.matrix(gDT,rownames="A"))

c


#================


aaa<-data.table(처방명=rep("궁하탕",5),상병명=c("a","b","c","d","e"),숫자=c(100,200,300,400,500))
dcast(aaa,처방명~상병명,value.var="숫자")


bbb<-transpose(aaa)

bbb[[,3]]
data.table[]

hi<-data.table(처방명="궁하탕")
for(i in c(1:3)){
  hi<-hi[,i:=123]
}

  :
  

#=================



mtcars













mydata <- data.table(col0=c("row1","row2","row3"),
                     col1=c(11,21,31),
                     col2=c(12,22,32),
                     col3=c(13,23,33))

dcast(melt(mydata, id.vars = "col0"), variable ~ col0)




A <- matrix(1:4, 2)
B <- matrix(6:11, 3)
print(A)
print(B)
cbind_fill_matrix(A, B)

# help with unstack()
row_keep <- sample(1:nrow(InsectSprays), size = 36)
InsectSprays2 <- InsectSprays[row_keep, ]
unstacked <- unstack(InsectSprays2)
cbind_fill_matrix(unstacked)

# using rownames for binding
rownames(A) <- c("one", "two")
rownames(B) <- c("three","two","one")
print(A)
print(B)
cbind_fill_matrix(A, B)

# data.frame input
C <- data.frame("V1" = c(12,13,14,15), row.names = c("one","two","three","four"))
print(C)
cbind_fill_matrix(A, B, C)

# atomic vector input
A <- matrix(1:4, 2)
B <- matrix(6:11, 3)
C <- c(12,13,14,15)
cbind_fill_matrix(A, B, C)

