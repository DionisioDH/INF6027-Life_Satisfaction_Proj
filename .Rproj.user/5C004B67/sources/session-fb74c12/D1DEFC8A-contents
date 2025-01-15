
###################################################################################
#
# (File 4/6)
# 
# Project                     : Area-Level Analysis of Life Satisfaction in England

# Author                      : Dionisio V. Del Orbe H.

# .R file name                : Part_4-LinearReg_Assumptions_check.R (file 4 of 6 in project)

# Purpose                     : Check assumptions of linear regression (normality and linearity)

# Output data.frame           : "df_training" ,"df_test"

# Output images               : histograms in section 2.2 (export size: width = 415 & height = 288)
# Output images               : Scatter plot matrix (SPLOM) in section 3 (export size: width = 1000 & height = 1000)

# Date                        : Jan 16th, 2025

# Pre-run another .R file?    : Yes, first run "Part_1-Loading_and_Mergin.R" 
#
###################################################################################

#################################################################
### 0. Loading Packages used in this .R file and setting seed ###
#################################################################

# Note: must use "install.packages(name_package)" for packages not installed

set.seed(42)      # to make code reproducible
library(psych)    # function: pairs.panels()    --> to plot scatter plot matrix with correlogram

#################################################
### 1. splitting data: training and test sets ###
#################################################

#1.1 Randomize data frame
df_reg <- Indicators_merged
df_reg <- Indicators_merged[sample(1:nrow(df_reg)),]

#1.2 split frame:
train_split <- 0.7 # 70% will be training
df_training <-  df_reg[1:(round(train_split*nrow(df_reg))),]  # 205 cases
df_test <-  df_reg[(nrow(df_training)+1):nrow(df_reg),]       # 88 cases

#############################################################################
### 2. Checking normality of all variables (Shapiro tests and histograms) ###
#############################################################################

#2.1 Shapiro

shapiro.test(df_training$satisfaction)       # Not normal
shapiro.test(df_training$Income_pounds)      # Not normal
shapiro.test(df_training$anxiety)            # Normal
shapiro.test(df_training$Time_toWork_mins)   # Not normal
shapiro.test(df_training$Emploment_perct)    # Normal
shapiro.test(df_training$Smokers_perct)      # Normal
shapiro.test(df_training$obesity_perct)      # Normal
shapiro.test(df_training$mean_pop_dens_2017) # Not normal

#2.2 Histograms

plot_histogram <- function(x, binwidth = NULL, x_title) {
  
  ggplot(df_training, aes_string(x = x)) +
    geom_histogram(binwidth = binwidth, fill = NA, color = "black") +
    theme_classic() +
    labs(
      x = x_title,
      y = "Frequency"
    )
}

plot_histogram(x = "satisfaction", x_title = "Life Satisfaction")
plot_histogram(x = "Income_pounds", binwidth = 2500, x_title = "Income (Pounds)")
plot_histogram(x = "anxiety", x_title = "Anxiety")
plot_histogram(x = "Time_toWork_mins",  x_title = "Time to Work (min)")
plot_histogram(x = "Emploment_perct", x_title = "Employment rate (%)")
plot_histogram(x = "Smokers_perct",  x_title = "Smoker rate (%)")
plot_histogram(x = "obesity_perct", x_title = "Obesity rate (%)")
plot_histogram(x = "mean_pop_dens_2017", x_title = "Population density (people/km2)")

##########################################################################
### 3. Checking linearity trends (Scatter Plot Matrix) and correlogram ###
##########################################################################

updated_labels <- c(
  "\n\n\nIncome\n(pounds)", 
  "\n\n\nAnxiety", 
  "\n\n\nTime to work\n(mins)", 
  "\n\n\nEmployment\n Rate (%)", 
  "\n\n\nSmoker\nRate (%)", 
  "\n\n\nObesity\n Rate (%)", 
  "\n\n\nPop. density\n(people/km2)", 
  "\n\n\nLife\nSatisfaction"
  )

# Spearman correlation used because some variables are not normal
pairs.panels(x = df_training[,c(3,4,5,6,7,8,9,2)],
             smooth = FALSE,
             scale = FALSE, 
             density = FALSE,
             ellipses = FALSE,
             digits = 2, 
             method = "spearman",
             pch = 21, 
             col = "lightgray",
             bg = rgb(0.8, 0.8, 0.8, 0.05),  
             lm = FALSE,
             cor = TRUE,
             jiggle=FALSE,
             hist.col = NA,
             show.points = TRUE, 
             rug = FALSE, #
             breaks = "Sturges", 
             cex.cor = 1.7, 
             cex.labels = 1.5,
             wt = NULL, 
             smoother = FALSE, 
             stars = TRUE,
             ci = FALSE, 
             alpha = 0.05, 
             hist.border = NA, 
             labels = updated_labels) 
# Result: Income and Obesity rate are not significantly correlated with life satisfaction

################################
### 4. Clearing environment  ###
################################

# clears environment (deletes variables not used in subsequent .R files)
rm(list = setdiff(ls(), c("df_training" ,"df_test"))) # "Indicators_merged" not used any more
