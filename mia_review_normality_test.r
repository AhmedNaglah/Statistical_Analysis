library(ggplot2)
library(patchwork)
library(ggpubr)
library(dplyr)

size_p_val = 11
size_text = 32

point = geom_point(size=4)
point2 = geom_point(size=4, color="orange")

theme_t = theme(plot.margin = margin(t = 60, r = 0, b = 0, l = 0, unit = "pt"))
theme_b = theme(plot.margin = margin(t = 0, r = 0, b = 60, l = 0, unit = "pt"))
theme_mid = theme(plot.margin = margin(t = 60, r = 0, b = 60, l = 0, unit = "pt"))

theme = theme(
plot.title = element_text(color="black", size=size_text, face="bold", hjust = 0.5),
axis.title.x = element_text(color="black", size=size_text, face="bold"),
axis.title.y = element_text(color="black", size=size_text, face="bold"),
axis.text.x = element_text(angle = 90, color="black", size=size_text),
axis.text.y = element_text(color="black", size=size_text),
panel.background = element_rect(fill = 'white', colour = 'black'),
panel.grid = element_line(colour = "gray", size=0.25),
)
bar = geom_bar(stat='identity', fill='white', colour="black", size=1.5)
dataDir = "D:/codes/media2/r_scripts/data/"
outDir = "C:/Users/inagl/Box/MedIA_Review_Processing_Tasks/plots/"

fig_w = 12*4
fig_h = 16*1

smoothing = geom_smooth(method = "loess", alpha= 0.2, color="black", size=2)

exper = paste(dataDir, "paired_256/", sep = "")
target = list(c('AverageFusion', "ExposureFusion", "DWT", "SESF", "DenseFuse"))
ftr1 = "MI"
ftr2 = "NMI"
ftr3 = "HistCorr"
ftr4 = "Bhatta Charyya Distance"

metric1 = ""
metric2 = ""

##########################################################################################################################
################# Optimizer Charts 
x_label ="Fusion Method"
my_comparisons = list( c("AverageFusion", "SESF"), c("AverageFusion", "ExposureFusion"), c("AverageFusion", 'DenseFuse'), c("AverageFusion", "DWT"))
filename = paste(exper, "cGAN_fusion_methods.csv", sep = "")
filename = paste(exper, "bile.csv", sep = "")

data = read.csv(filename, header=TRUE);
data2 = data[sample(nrow(data), 100), ]
data2 = data

filtered = data2[data2$model == "cGAN+MT2F-CLR", ]

shapiro.test(filtered$ACC)
shapiro.test(filtered$DSC)

filtered = data2[data2$model == "cGAN+MT2F-UNET", ]

shapiro.test(filtered$ACC)
shapiro.test(filtered$DSC)

filtered = data2[data2$model == "cycleGAN+MT2F-CLR", ]

shapiro.test(filtered$ACC)
shapiro.test(filtered$DSC)

filtered = data2[data2$model == "cycleGAN+MT2F-UNET", ]

shapiro.test(filtered$ACC)
shapiro.test(filtered$DSC)

filtered = data2[data2$model == "HE2F", ]

shapiro.test(filtered$ACC)
shapiro.test(filtered$DSC)

bartlett.test(ACC ~ model, data = data2)
bartlett.test(DSC ~ model, data = data2)

dc <- data[data$model=="cGAN+MT2F-CLR",]
dp <- data[data$model=="cGAN+MT2F-UNET",]
for(j in 4:5){  
  writeLines(names(dc)[j])
  print(ks.test(dc[,j], dp[,j]))  
}

dc <- data[data$model=="cGAN+MT2F-CLR",]
dp <- data[data$model=="cycleGAN+MT2F-CLR",]
for(j in 4:5){  
  writeLines(names(dc)[j])
  print(ks.test(dc[,j], dp[,j]))  
}


dc <- data[data$model=="cGAN+MT2F-UNET",]
dp <- data[data$model=="cycleGAN+MT2F-UNET",]
for(j in 4:5){  
  writeLines(names(dc)[j])
  print(ks.test(dc[,j], dp[,j]))  
}


dc <- data[data$model=="cGAN+MT2F-CLR",]
dp <- data[data$model=="HE2F",]
for(j in 4:5){  
  writeLines(names(dc)[j])
  print(ks.test(dc[,j], dp[,j]))  
}



chartname = paste(ftr1, metric1)
p11 = ggboxplot(data, x= "model", y="mi_tv", size=1) + stat_compare_means(comparisons = my_comparisons, method = "t.test",  size=size_p_val) + labs(title=chartname, x = x_label, y = 'value') + theme + theme_t

chartname = paste(ftr2, metric2)
p12 = ggboxplot(data, x= "model", y="nmi_tv", size=1) + stat_compare_means(comparisons = my_comparisons, method = "t.test",  size=size_p_val) + labs(title=chartname, x = x_label, y = 'value') + theme + theme_t

my_comparisons = list( c("SESF", "DenseFuse"), c("SESF", "ExposureFusion"), c("SESF", 'AverageFusion'), c("SESF", "DWT"))

chartname = paste(ftr3, metric2)
p13 = ggboxplot(data, x= "model", y="corr_tv", size=1) + stat_compare_means(comparisons = my_comparisons, method = "t.test",  size=size_p_val) + labs(title=chartname, x = x_label, y = 'value') + theme + theme_t

chartname = paste(ftr4, metric2)
p14 = ggboxplot(data, x= "model", y="bhata_tv", size=1) + stat_compare_means(comparisons = my_comparisons, method = "t.test",  size=size_p_val) + labs(title=chartname, x = x_label, y = 'value') + theme + theme_t

bartlett.test(mi_tv ~ model, data = data2)
bartlett.test(nmi_tv ~ model, data = data2)
bartlett.test(corr_tv ~ model, data = data2)
bartlett.test(bhata_tv ~ model, data = data2)


dc <- data[data$model=="AverageFusion",]
dp <- data[data$model=="ExposureFusion",]
for(j in 3:6){  
  writeLines(names(dc)[j])
  print(ks.test(dc[,j], dp[,j]))  
}