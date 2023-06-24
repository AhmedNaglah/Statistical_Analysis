# Statistical Analysis Scripts using R

## About

This repository contains R scripts that perform statistical analysis using R, such as

1- Kolmogorov–Smirnov test: ks.test(data0$ACC, data1$ACC, alternative = "l")

2- Mann-Whitney-Wilcoxon: wilcox.test(mpg ~ am, data=mtcars) 

Also, includes ggplots that embedd statistical comparisons using 

https://www.rdocumentation.org/packages/ggpubr/versions/0.6.0/topics/stat_compare_means


## Prerequisit 

System:  x86_64, mingw32 <br>
R Studio    <br>
R version 4.2.2 (2022-10-31 ucrt)  <br>

## Dependency

ggplot2 <br>
patchwork  <br>
ggpubr

## Usage

1- Add data to ./data folder

2- Adjust script parameters

For ggplots
mia_review_segmentation_anatomical_features_eps_single_updated_kolmogrov.R

``` R
dataDir = "D:/codes/media2/r_scripts/data/"
outDir = "C:/Users/inagl/Box/MedIA_Review_Processing_Tasks/plots/"
```

For standalone statistical analysis
mia_review_ks.R

``` R
datadir = "D:/codes/media2/r_scripts/data/paired_256"
filename = 'bile.csv'
filedir = paste(datadir, filename ,sep='/')

data = read.csv(filedir, header=TRUE)
```
