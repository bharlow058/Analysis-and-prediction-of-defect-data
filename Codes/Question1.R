curve.sim = function(x , y) {
  len = max(length(x), length(y))
  sumx = sum(x)
  sumy = sum(y)
  xx = yy = rep(0, len)
  for (i in 1:length(x)) xx[i] = x[i]/sumx
  for (i in 1:length(y)) yy[i] = y[i]/sumy
  
  1 - sum(abs(xx-yy))/2
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


curve.sim(httpd13_1_3_29,httpd13_1_3_26)
curve.sim(httpd13_1_3_29,httpd13_1_3_27)
curve.sim(httpd13_1_3_27,httpd13_1_3_26)

curve.sim(p81_4,p81_4_1)
curve.sim(p81_4_1,p81_4_2)
curve.sim(p81_4_2,p81_4)

curve.sim(p2_3_4,p2_3_2)
curve.sim(p2_3_4,p2_3_3)       #83.9
curve.sim(p2_3_3,p2_3_2)


# len=1:length(p81_4_2)
# plot(len,p81_4_2,type="o",lwd=2,col="red", xlab = "Quarters from release date",ylab = "Total Number of defects")
# title("TPTP Agent Controller",cex.main = 1.5,font.main= 2, col.main= "black")
# axis(1,at=1:length(p81_4_2),labels=len)
# lines(p81_4_1,col="black",type="o",lwd=2)
# lines(p81_4,col="blue",type="o",lwd=2)
# legend("topright",legend=c("Version - 4.2","Version - 4.1","Version - 4"),lty=1,lwd=3,pch=21,col=c("red","black","blue"),ncol=2,
#        bty="n",cex=0.6,text.col=c("red","black","blue"),inset=0.04)

# len=1:length(p2_3_4)
# plot(len,p2_3_4,type="o",lwd=2,col="red", xlab = "Quarters from release date",ylab = "Total Number of defects")
# title("Eclipse PDE",cex.main = 1.5,font.main= 2, col.main= "black")
# axis(1,at=1:length(p2_3_4),labels=len)
# lines(p2_3_2,col="black",type="o",lwd=2)
# lines(p2_3_3,col="blue",type="o",lwd=2)
# legend("topright",legend=c("Version - 3.4","Version - 3.2","Version - 3.3"),lty=1,lwd=3,pch=21,col=c("red","black","blue"),ncol=2,
#        bty="n",cex=0.6,text.col=c("red","black","blue"),inset=0.04)

len=1:length(httpd13_1_3_26)
plot(len,httpd13_1_3_26,type="o",lwd=2,col="red", xlab = "Quarters from release date",ylab = "Total Number of defects")
title("Apache Httpd-13",cex.main = 1.5,font.main= 2, col.main= "black")
axis(1,at=1:length(httpd13_1_3_26),labels=len)
lines(httpd13_1_3_29,col="black",type="o",lwd=2)
lines(httpd13_1_3_27,col="blue",type="o",lwd=2)
legend("topright",legend=c("Version - 1.3.26","Version - 1.3.29","Version - 1.3.27"),lty=1,lwd=3,pch=21,col=c("red","black","blue"),ncol=2,
       bty="n",cex=0.6,text.col=c("red","black","blue"),inset=0.04)

