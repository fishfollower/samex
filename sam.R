load("input.RData")
library(TMB)
compile("sam.cpp")
dyn.load(dynlib("sam"))
obj <- MakeADFun(data,parameters,random=c("logN","logF"),DLL="sam")
opt<-nlminb(obj$par,obj$fn,obj$gr,control=list(trace=1,eval.max=1200,iter.max=900))
sdrep<-sdreport(obj)
pl <- as.list(sdrep,"Est")
plsd <- as.list(sdrep,"Std")


