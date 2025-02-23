#测量透明薄片折射率
N1<-c(90,96,108,127,150,179,204,235,277,295)
θ<-c(10,12,14,16,18,20,22,24,26,28)
t<-0.002617
λ<-632.8*10^(-9)
l<-length(N1)

n1<-(t*(sin(θ))^2)/(2*t*(1-cos(θ))-N1*λ)+1-cos(θ)-(N1*λ)/(2*t)
a<-mean(n1)
Sn1<-sd(n1)/(sqrt(l))

#测量空气折射率
N2<-c(20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1)
p<-c(110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300)
L<-0.089
p0<-760
z<-(-0.1)*p+31

n2<-1+((N2*λ)/(2*L)*((p0+300)/(300-p)))
#方法一
opar <- par(no.readonly=TRUE)
plot(p,N2,type = "o",pch=18,ann=FALSE)
lm(N2~p)
lines(p,z,type="b",pch=22,col="red",las=2,cex.axis=0.7,tck=-0.01)
legend("topright",c("实验结果","拟合曲线"),title="图例",col=c("black","red"),
       lty=c(1,1),pch=c(18,22),cex=0.5)
title("条纹变化数N随气室压强δp变化关系曲线",
      xlab="δp(mmHg)",ylab="条纹变化数N")







#方法二(非线性错误)
opar <- par(no.readonly=TRUE)
plot(p,n2,type = "o",pch=18,ann=FALSE)

title("折射率n随气室压强δp的变化关系曲线",
      xlab="δp(mmHg)",ylab="折射率n")





