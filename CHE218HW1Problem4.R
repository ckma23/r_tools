Pco<-c(.5,.5,.5,.4,.6,.6)
PH2<-c(.5,.5,.5,.6,.6,.4)
MFCH4<-c(.5,.7,.16,.16,.1,0.06)
#Total Molar Feed
TMF<-c(1.7,1.2,0.6,0.3,0.75,2.75)
#the concentration of CH4 coming out is the mole fraction multiplied by the Total Molar Feed
RA=TMF*MFCH4
#guess a starting rate constant
kstart = .2
#guess a starting rate order of a
astart=1
#guess a starting rate order of b
bstart=1
modelac<-nls(RA~k*(Pco^a)*(PH2^b),start=list(k=kstart,a=astart,b=bstart))
#report summary of the model
summary(modelac)
#report R^2 value
cor(predict(modelac),RA)
#plot the experimental data
#plot the derived equation fitted line.


