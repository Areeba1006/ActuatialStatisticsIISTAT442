library(actuar)

data<-grouped.data(
  Group =c(0,25,50,75,100,150,250,500,1000,2000,4000,5000),
  Line1 =c(6,24,30,31,57,80,85,54,15,10,0)
)

data

fn=ogive(data)
fn

plot(fn, main="Ogive", xlab="Group", ylab="Cumulative Frequency", col="blue", lwd=2)

hist(data,main='histogram',xlab='')

# Exercise 3

x<-0:10
x

y<-c(10,20,15,12,8,5,3,2,2,1,1)

sum(y)

fn <- stepfun(x = x,
               y = c(0, cumsum(y) / sum(y)),
               f = 0, right = FALSE)
fn

plot(fn, main="ECDFe", xlab="Number of Claims",
     ylab="Cumulative Frequency", col="blue", 
     verticals = F,lwd=2)

# Probability at least 2 claims

1-fn(2) ##

fn(5)-fn(0) # Priobability between 1 and 5 claims
