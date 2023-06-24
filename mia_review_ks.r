library(ggplot2)
library(patchwork)
library(ggpubr)

datadir = "D:/codes/media2/r_scripts/data/paired_256"
filename = 'bile.csv'
filedir = paste(datadir, filename ,sep='/')

data = read.csv(filedir, header=TRUE)

data0 = filter(data, model_==0)
data1 = filter(data, model_==1)
data2 = filter(data, model_==2)
data3 = filter(data, model_==3)
data4 = filter(data, model_==4)

r0= ks.test(data0$ACC, data1$ACC, alternative = "l")
r1= ks.test(data0$ACC, data2$ACC, alternative = "l")
r2= ks.test(data0$ACC, data3$ACC, alternative = "l")
r3= ks.test(data0$ACC, data4$ACC, alternative = "l")

r0_= ks.test(data0$DSC, data1$DSC, alternative = "l")
r1_= ks.test(data0$DSC, data2$DSC, alternative = "l")
r2_= ks.test(data0$DSC, data3$DSC, alternative = "l")
r3_= ks.test(data0$DSC, data4$DSC, alternative = "l")



filename = 'hepatic.csv'

filedir = paste(datadir, filename ,sep='/')

data = read.csv(filedir, header=TRUE)

data0 = filter(data, model_==0)
data1 = filter(data, model_==1)
data2 = filter(data, model_==2)
data3 = filter(data, model_==3)
data4 = filter(data, model_==4)

rr0= ks.test(data0$ACC, data1$ACC, alternative = "l")
rr1= ks.test(data0$ACC, data2$ACC, alternative = "l")
rr2= ks.test(data0$ACC, data3$ACC, alternative = "l")
rr3= ks.test(data0$ACC, data4$ACC, alternative = "l")

rr0_= ks.test(data0$DSC, data1$DSC, alternative = "l")
rr1_= ks.test(data0$DSC, data2$DSC, alternative = "l")
rr2_= ks.test(data0$DSC, data3$DSC, alternative = "l")
rr3_= ks.test(data0$DSC, data4$DSC, alternative = "l")




filename = 'portal.csv'

filedir = paste(datadir, filename ,sep='/')

data = read.csv(filedir, header=TRUE)

data0 = filter(data, model_==0)
data1 = filter(data, model_==1)
data2 = filter(data, model_==2)
data3 = filter(data, model_==3)
data4 = filter(data, model_==4)

rrr0= ks.test(data0$ACC, data1$ACC, alternative = "l")
rrr1= ks.test(data0$ACC, data2$ACC, alternative = "l")
rrr2= ks.test(data0$ACC, data3$ACC, alternative = "l")
rrr3= ks.test(data0$ACC, data4$ACC, alternative = "l")

rrr0_= ks.test(data0$DSC, data1$DSC, alternative = "l")
rrr1_= ks.test(data0$DSC, data2$DSC, alternative = "l")
rrr2_= ks.test(data0$DSC, data3$DSC, alternative = "l")
rrr3_= ks.test(data0$DSC, data4$DSC, alternative = "l")


r0
r1
r2
r3
r0_
r1_
r2_
r3_


datadir = "D:/codes/media2/r_scripts/data/all_patches"
filename = 'test_set.csv'
filedir = paste(datadir, filename ,sep='/')

data = read.csv(filedir, header=TRUE)

data0 = filter(data, model_==0)
data1 = filter(data, model_==1)
data2 = filter(data, model_==2)
data3 = filter(data, model_==3)
data4 = filter(data, model_==4)

t0= ks.test(data0$ACC, data1$ACC, alternative = "l")
t1= ks.test(data0$ACC, data2$ACC, alternative = "l")
t2= ks.test(data0$ACC, data3$ACC, alternative = "l")
t3= ks.test(data0$ACC, data4$ACC, alternative = "l")

t0_= ks.test(data0$DSC, data1$DSC, alternative = "l")
t1_= ks.test(data0$DSC, data2$DSC, alternative = "l")
t2_= ks.test(data0$DSC, data3$DSC, alternative = "l")
t3_= ks.test(data0$DSC, data4$DSC, alternative = "l")
