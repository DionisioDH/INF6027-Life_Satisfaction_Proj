
###################################################################################
#
# (File 6/6)
# 
# Project                     : Area-Level Analysis of Life Satisfaction in England

# Author                      : Dionisio V. Del Orbe H.

# .R file name                : Part_6-MLR_model.R (file 6 of 6 in project)

# Purpose                     : Build and test a multiple linear regression model (model #3)

# Output data.frame           : N/A

# Output images               : scatter plot in section 2.2 (export size: width = 600 & height = 450)
# Output images               : scatter plot in section 4.2 (export size: width = 500 & height = 500)
# Output images               : histogram in section 4.3 (export size: width = 667 & height = 500)

# Date                        : Jan 16th, 2025

# Pre-run another .R file?    : Yes, first run "Part_1-Loading_and_Mergin.R" 
#                             : Then, Part_4-LinearReg_Assumptions_check.R 
#
###################################################################################

#################################################################
### 0. Loading Packages used in this .R file and setting seed ###
#################################################################

# Note: must use "install.packages(name_package)" for packages not installed

library(olsrr)  # function: ols_step_all_possible  --> to find generate all model combinations possible with variables
library(car)    # function: vif()                   --> to idenfity multicolinearity in a model (variance-inflation factors) 


##############################################################
### 1. MLR - Ver 1 (based on multicolinearity assumptions) ###
##############################################################

# Based on Scatter plot matrix and the correlogram (R file #4, section 3), income and obsecity rate are removed.
# we suspect "time to work" and "population density" have high collinearity: we will check the VIF to confirm


# 1.1. Building model: with relevant variables combined: 

model_all_var <- lm(formula = satisfaction~anxiety+
                      #Income_pounds+ #removed based on lack of significant correlation/linearity (R file #4, section 3)
                      Time_toWork_mins+
                      Emploment_perct+
                      Smokers_perct+
                      # obesity_perct+  #removed based on lack of significant correlation/linearity (R file #4, section 3)
                      mean_pop_dens_2017+
                      Rural_Classification, 
                    data = df_training)

###################################################
### 2. MLR - finding optimized model from ver 1 ###
###################################################

# 2.1. finding all possible model combinations with model above (model_all_var)
# it gives R2 for all models. So, we find model with maximum R-sqr_adj:

k  = ols_step_all_possible(model_all_var)
View(k$result) # this shows the 63 models possible
View(k$result[which.max(k$result[["adjr"]]),])  # R-sqr_adj = 0.3480613 maximum (a model w 4 independent variables)


#2.2 plotting the R-squared of all models:
# The maximum R-squared is not coming from model with the highest number of variables included

k$result$n <- as.factor(k$result$n)
label_data <- k$result[42, ]
ggplot(data = k$result, 
       mapping = aes(x=mindex, y=adjr )) +
  geom_point(aes(color = n), size = 2.5, alpha = 0.7)+
  geom_segment(data = 
                 data.frame(
                   x = label_data$mindex - 5, 
                   y = label_data$adjr + 0.01,
                   xend = label_data$mindex, 
                   yend = label_data$adjr
                 ), 
               aes(x = label_data$mindex - 5, y = label_data$adjr + 0.01, 
                   xend = label_data$mindex, yend = label_data$adjr),
               arrow = arrow(length = unit(0.4, "cm")), color = "red", size = .8) +
  labs(
    x = "Model number in model exploration", y = "Adjusted R-Squared",
    color = "Number of\nindependent\nvariables\nin model" 
  )+
  theme_classic()+
  theme(
    axis.text = element_text(size = 14),
    axis.title.x = element_text(size = 14), 
    axis.title.y = element_text(size = 14), 
    legend.title = element_text(size = 14, hjust = 0.5, lineheight = 0.85), 
    legend.text = element_text(size = 14))+
  guides(color = guide_legend(override.aes = list(size = 3)))

############################################
### 3. MLR - optimized model (version 2) ###
############################################

#3.1 Optimized model:

model_all_var_best <- lm(formula = satisfaction~anxiety+
                           #Income_pounds+      # removed based on lack of significant correlation
                           #Time_toWork_mins+   # removed because optimized model does not include it (section 2 - above)
                           Emploment_perct+
                           #Smokers_perct+      # removed because optimized model does not include it (section 2 - above)
                           # obesity_perct+     # removed based on lack of significant correlation
                           mean_pop_dens_2017+
                           Rural_Classification, 
                         data = df_training)

summary(model_all_var_best) # general info of model. 

#####################################################################
### 4. MLR - verifying assumptions of optimized model (version 2) ###
#####################################################################

#4.1 re-visiting multicolinearity by assessing VIF:  

vif(model_all_var_best) # variance-inflation factors. All VIF < 5; thus, no high multicolinearity

#4.2 Checking Homoscedasticity (with training set)

ggplot(df_training, aes(x = model_all_var_best$fitted.values, y = residuals(model_all_var_best))) +
  geom_point(size = 3.2, shape = 1, color = "black", alpha = 0.8) +
  theme_classic() +
  geom_hline(yintercept = 0, linetype = "dotted", color = "#7A7A7A", linewidth = 0.8) +  # Horizontal dotted line at zero
  labs(y = "Residuals", x = "Fitted Values (Satisfaction & All Variables)", 
       title = "Assumption Check: Homoscedasticity") +
  theme(
    axis.text = element_text(size = 14),
    axis.title = element_text(size = 14),
    plot.title = element_text(size = 16, hjust = 0.5)
  ) +
  scale_y_continuous(limits = c(-.7, .7)) # graph looks very random (so, homoscedasticity assumption met)


#4.3 checking Normality of Residuals

residuals_train_model_all_var_best <- data.frame(residuals(model_all_var_best))
colnames(residuals_train_model_all_var_best) <- c("residuals")

ggplot(residuals_train_model_all_var_best, aes(x = residuals)) +
  geom_histogram(fill = NA, color = "black") +
  theme_classic() +
  labs(
    x = "Residuals (Training Set)",
    y = "Frequency", 
    title = "Assumption Check: Normality of Residuals"
  )+
  theme(
    axis.text = element_text(size = 14),
    axis.title.x = element_text(size = 14), 
    axis.title.y = element_text(size = 15), 
    plot.title = element_text(size = 16, hjust = 0.5) 
  ) # histogram looks normal, so assumption met. 


#######################################################################
### 5. MLR - evaluating the optimized model (version 2) w/ test set ###
#######################################################################

#5.1 Predicting test set
df_MLR_model_evaluation <- df_test # copying test frame
df_MLR_model_evaluation$predicted_md_All_var <- predict(model_all_var_best, newdata = df_test)
df_MLR_model_evaluation$residuals_md_All_var <- df_MLR_model_evaluation$predicted_md_All_var - df_MLR_model_evaluation$satisfaction # cant use residue here

# Not able to plot 5 dimensions; thus, did not visualize directly

#5.2 Computing Sum of Squared Errors (SSE)
sse_model_all_var_best <- sum(df_MLR_model_evaluation$residuals_md_All_var**2)
sse_model_all_var_best #2.435991