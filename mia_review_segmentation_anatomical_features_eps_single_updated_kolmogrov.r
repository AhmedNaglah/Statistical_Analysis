library(ggplot2)
library(patchwork)
library(ggpubr)

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
axis.text.x = element_text(angle = 90,color="black", size=size_text),
axis.text.y = element_text(color="black", size=size_text),
panel.background = element_rect(fill = 'white', colour = 'black'),
panel.grid = element_line(colour = "gray",size=0.25),
)
bar = geom_bar(stat='identity', fill='white', colour="black", size=1.5)
dataDir = "D:/codes/media2/r_scripts/data/"
outDir = "C:/Users/inagl/Box/MedIA_Review_Processing_Tasks/plots/"

fig_w = 11*4
fig_h = 18*2

smoothing = geom_smooth(method = "loess", alpha= 0.2, color="black", size=2)
my_comparisons <- list( c("cGAN+MT2F-CLR", "cGAN+MT2F-UNET"), c("cGAN+MT2F-CLR", "cycleGAN+MT2F-CLR"), c("cGAN+MT2F-UNET", "cycleGAN+MT2F-UNET"), c("cGAN+MT2F-CLR", "HE2F") )

exper = paste(dataDir, "paired_256/", sep = "")
metric1 = " - Segmentation ACC"				   
metric2 = " - Segmentation DSC"		
ftr1 = "Bile Duct Branch"		
ftr2 = "Hepatic Artery Branch"
ftr3 = "Portal Vein Branch"
ftr4 = "All Patches"

mymethod = "wilcox.test"

##########################################################################################################################
################# Optimizer Charts 
x_label ="Model"

filename = paste(exper, "bile.csv", sep = "")
data = read.csv(filename, header=TRUE);

chartname = paste(ftr1, metric1)
p11 = ggboxplot(data, x= "model", y="ACC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "ACC") + theme + theme_mid

chartname = paste(ftr1, metric2)
p21 = ggboxplot(data, x= "model", y="DSC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "DSC") + theme + theme_b

# Hepatic
filename = paste(exper, "hepatic.csv", sep = "")
data = read.csv(filename, header=TRUE);

chartname = paste(ftr2, metric1)
p12 = ggboxplot(data, x= "model", y="ACC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "ACC") + theme + theme_mid

chartname = paste(ftr2, metric2)
p22 = ggboxplot(data, x= "model", y="DSC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "DSC") + theme + theme_b

# Portal
filename = paste(exper, "portal.csv", sep = "")
data = read.csv(filename, header=TRUE);

chartname = paste(ftr3, metric1)
p13 = ggboxplot(data, x= "model", y="ACC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "ACC") + theme + theme_mid

chartname = paste(ftr3, metric2)
p23 = ggboxplot(data, x= "model", y="DSC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "DSC") + theme + theme_b

# All
filename = paste(exper, "test_set.csv", sep = "")
data = read.csv(filename, header=TRUE);

chartname = paste(ftr4, metric1)
p14 = ggboxplot(data, x= "model", y="ACC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "ACC") + theme + theme_mid

chartname = paste(ftr4, metric2)
p24 = ggboxplot(data, x= "model", y="DSC", size=1) + stat_compare_means(comparisons = my_comparisons, method= mymethod, size=size_p_val) + labs(title=chartname, x = x_label, y = "DSC") + theme + theme_b


p = p11 + p12 + p13 + p14 + p21 + p22 + p23 + p24 + plot_layout(ncol = 4)

output_filename = paste("Segmentation_Anatomical_Features_updated.eps")
savedir = paste(outDir, output_filename, sep="")
ggsave(savedir, width = fig_w, height = fig_h, device=cairo_ps, fallback_resolution = 600)
