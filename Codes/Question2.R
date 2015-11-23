fit.all = function(y) {  
  x = 1:length(y)
  dat = data.frame(x, y)
  res = matrix(nrow = 3, ncol = 2, dimnames = list(c("Weibull", "Gamma", "Rayleigh"), c("R2", "AIC")))  
  sumy = sum(y)
  startl = which.max(y)
  
  
  mod1 = nls(y ~ n * dweibull(x, shape = k, scale = l), data = dat, start = list(n = sumy, l = startl, k = 2))
  res1 = summary(mod1)
  res[1,1] = 1 - var(res1$residuals)/var(y)
  res[1,2] = AIC(mod1)
  Weibull=c(total =res1$coefficients[1,1],scale =res1$coefficients[2,1],shape =res1$coefficients[3,1],r2=res[1,1],AIC=res[1,2])
  
 
  mod2 = nls(y ~ n * dgamma(x, shape = k, scale = l), data = dat, start = list(n = sumy, l = 0.78, k = 6.5), trace = T)
  res2 = summary(mod2)
  res[2,1] = 1 - var(res2$residuals)/var(y)
  res[2,2] = AIC(mod2)
  Gamma=c(total = res2$coefficients[1,1],scale =res2$coefficients[2,1],shape =res2$coefficients[3,1],r2=res[2,1],AIC=res[2,2])
  
 
  mod3 = nls(y ~ n * dweibull(x, shape = 2, scale = l), data = dat, start = list(n = sumy, l = startl))
  res3 = summary(mod3)
  res[3,1] = 1 - var(res3$residuals)/var(y)
  res[3,2] = AIC(mod3)
  Rayleigh=c(total =res3$coefficients[1,1],scale =res3$coefficients[2,1],shape=2,r2=res[3,1],AIC=res[3,2])
  
  row.names(res) = c()
  stat = rbind(Weibull,Gamma,Rayleigh)
  stat
}

setwd ("//home//saratkiran//Desktop//CS6890//sarat")
dir(pattern = "*.txt")

httpd13_1_3_26=scan("httpd13_1326.txt")
httpd13_1_3_27=scan("httpd13_1327.txt")
httpd13_1_3_29=scan("httpd13_1329.txt")

p2_3_2=scan("2_3_2.txt")
p2_3_3=scan("2_3_3.txt")
p2_3_4=scan("2_3_4.txt")

p81_4=scan("81_4.txt")
p81_4_1=scan("81_4_1.txt")
p81_4_2=scan("81_4_2.txt")


p2_3_2_fitall <- fit.all(p2_3_2)   #PDE - gamma values  l = 0.78, k = 6.5 
p2_3_2_fitall

p2_3_3_fitall <- fit.all(p2_3_3) 
p2_3_3_fitall

p2_3_4_fitall <- fit.all(p2_3_4)
p2_3_4_fitall

httpd13_1_3_26_fitall <- fit.all(httpd13_1_3_26)
httpd13_1_3_26_fitall
#write.table("",file="2ndoutput_final.csv",append=TRUE,sep=",",col.names=FALSE)
#write.table(httpd13_1_3_26_fitall,file="2ndoutput_final.csv",append=TRUE,sep=",",col.names=FALSE)

httpd13_1_3_27_fitall <- fit.all(httpd13_1_3_27)    #Apache httpd 1.3 - gamma values  l = 0.78, k = 6.5 
httpd13_1_3_27_fitall

httpd13_1_3_29_fitall <- fit.all(httpd13_1_3_29)    
httpd13_1_3_29_fitall


p81_4_fitall<- fit.all(p81_4) #TPTP Agent Controller - gamma values  l = 0.07, k = 90
p81_4_fitall

p81_4_1_fitall<- fit.all(p81_4_1)     #TPTP Agent Controller - gamma values  l = 810, k = 27
p81_4_1_fitall

p81_4_2_fitall<- fit.all(p81_4_2)      #TPTP Agent Controller - gamma values  l = 810, k = 27
p81_4_2_fitall


