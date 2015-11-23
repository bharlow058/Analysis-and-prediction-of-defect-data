

getvalue = function(bug,lscale,kshape) {
  sum.e= sum(bug)
  error= rep(1, length(bug))
  temp_sum = rep(1, length(bug))
  for (i in 2:length(bug)){
    mod1 = nls(y ~ n * dweibull(x, shape = kshape, scale = lscale), data = data.frame(x = 1:i, y = bug[1:i]), start = list(n = sum(bug[1:i])))
    n.e = summary(mod1)$coefficients[1,1]
    error[i]=abs(n.e-sum(bug))/sum(bug)
    temp_sum[i]=n.e
  }
  error
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

# testing = (getvalue(p81_4_2,7.053996886,9.772940502),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue"))
#plot(getvalue(p81_4_2,7.053996886,9.772940502),type="o",lwd=2,col="red",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue")

# #both almost same p81_4_0
# plot(getvalue(p81_4_2,7.053996886,9.772940502),type="o",lwd=2,col="red",ylim=c(0,0.7),xlab = "Number of Quarters from release date",ylab = "Relative error")
# #this is little better p81_4_1
# title("TPTP Agent Controller",sub = "Predicting Verison 4.2",cex.main = 1.5,font.main= 2, col.main= "black",cex.sub = 0.75, font.sub = 3, col.sub = "black")
# #sub("TPTP Agent Cr",cex.main = 1.5,font.main= 2, col.main= "black")
# lines(getvalue(p81_4_2,7.522033648,9.142275113),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters from release date",ylab = "Relative error")
# legend("topright",legend=c("using Version - 4.0","using Version - 4.1"),lty=1,lwd=3,pch=21,col=c("red","blue"),ncol=2,
#                bty="n",cex=0.6,text.col=c("red","blue"),inset=0.04)

# #p2_3_2 - best to use
# plot(getvalue(p2_3_4,4.399227125,3.888177789),type="o",lwd=2,col="red",ylim=c(0,0.7),xlab = "Number of Quarters from release date",ylab = "Relative error")
# #this is little better p81_4_1
# title("Eclipse PDE",sub = "Predicting Verison 3.4",cex.main = 1.5,font.main= 2, col.main= "black",cex.sub = 0.75, font.sub = 3, col.sub = "black")
# #p2_3_3 not bad
# lines(getvalue(p2_3_4,4.310036685,3.710756961),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters from release date",ylab = "Relative error")
# legend("topright",legend=c("using Version - 3.2","using Version - 3.3"),lty=1,lwd=3,pch=21,col=c("red","blue"),ncol=2,
#        bty="n",cex=0.6,text.col=c("red","blue"),inset=0.04)

#p2_3_2 - best to use
#plot(getvalue(p2_3_4,4.399227125,3.888177789),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue")
#p2_3_3 not bad
#plot(getvalue(p2_3_4,4.310036685,3.710756961),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue")

#not too good
plot(getvalue(httpd13_1_3_29,4.0845610029,5.4025246028),type="o",lwd=2,col="red",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error")
#this is little better p81_4_1
title("Apache Httpd 13",sub = "Predicting Verison 1.3.29",cex.main = 1.5,font.main= 2, col.main= "black",cex.sub = 0.75, font.sub = 3, col.sub = "black")
#use this - httpd 1327
lines(getvalue(httpd13_1_3_29,4.563379556,4.679533969),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error")
legend("topright",legend=c("using Version - 1.3.26","using Version - 1.3.27"),lty=1,lwd=3,pch=21,col=c("red","blue"),ncol=2,
       bty="n",cex=0.6,text.col=c("red","blue"),inset=0.04)

#not too good
plot(getvalue(httpd13_1_3_29,4.0845610029,5.4025246028),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue")
#use this - httpd 1327
plot(getvalue(httpd13_1_3_29,4.563379556,4.679533969),type="o",lwd=2,col="blue",ylim=c(0,0.7),xlab = "Number of Quarters since release date",ylab = "Relative error of getvalue")



forecast = function(bug, k, l) {  
  err = aic = rep(0, length(bug))
  vol = bug[1]/dweibull(1, shape = k, scale = l)
  total = sum(bug)
  err[1] = abs(vol - total)/total
  aic[1] = 100
  for (i in 2:length(bug)) {
    mod = nls(y ~ n * dweibull(x, shape = k, scale = l), data = data.frame(x = 1:i, y = bug[1:i]), start = list(n = sum(bug[1:i])))
    vol = summary(mod)$coefficients[1,1]
    err[i] = abs(vol-total)/total
    aic[i] = AIC(mod)
  }
  list(error = err, aic = aic)
} 

para=read.csv(file="bugrates.csv",header=TRUE)
para.mod.shape = lm(shape ~ cost+type,data=para[1:31,])
para.mod.scale = lm(scale ~ cost+type,data=para[1:31,])
shape=predict(para.mod.shape,para[32:34,])
scale=predict(para.mod.scale,para[32:34,])
shape[1]
forecast(p81_4,shape[1],scale[1])
forecast(p81_4_1,shape[1],scale[1])
forecast(p81_4_2,shape[1],scale[1])