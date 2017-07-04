#this R script solves PRoblem 2 part b

k<-c(.15,.273,.333,.595,.923,1.492,2.138,2.718,4.137,4.665) #This stores the k
TinC<-c(702,725,734,754,773,789,803,810,827,837) #This stores the temperature in Celsius
TinK=TinC+273 #This stores the temperature in K
lnk=log(k)
recipT=1/TinK
expT=exp(recipT)
dataframe1<-data.frame(k,TinC,TinK,lnk,recipT,expT)
#pick starting points 
astart=38000
bstart=-1000
#use R built in nls solver
modelab<-nls(k~a*exp(b/TinK),start=list(a=astart,b=bstart),control=nls.control(maxiter=200))
#report summary of the model
summary(modelab)
# report R^2 value
cor(k,predict(modelab))
#plot the experimental data
plot(recipT,k)
#plot the derived equation fitted line
lines(recipT,predict(modelab))