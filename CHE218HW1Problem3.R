#this R script solves PRoblem 3 part c
t<-c(0,48,76,124,204,238,289) #this is the temperature in Celsius
ca<-c(19.04,17.6,16.9,15.8,14.41,13.94,13.37) #this is the concentration of A
caadj<-c(17.6,16.9,15.8,14.41,13.94,13.37)
dcadt<-c(-.03,-0.025,-0.02292,-0.01738,-0.01382,-0.01118)
#pick starting points
kstart=.2
nstart=7
#use R built in nls solver
modela<-nls(dcadt~k*caadj^n,start=list(k=kstart,n=nstart))
#report summary of the model
summary(modela)
# report R^2 value
cor(dcadt,predict(modela))
#Plot the experimental data
plot(dcadt,caadj)
#plot the derived equation fitted line
lines(predict(modela),caadj)
