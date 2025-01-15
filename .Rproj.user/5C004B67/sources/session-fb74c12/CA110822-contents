
###################################################################################
#
# (File 5/6)
# 
# Project                     : Area-Level Analysis of Life Satisfaction in England

# Author                      : Dionisio V. Del Orbe H.

# .R file name                : Part_5-SLR_models.R (file 5 of 6 in project)

# Purpose                     : Build and test two simple linear regression models (model 1 and 2)

# Output data.frame           : N/A

# Output images               : scatter plot in section 1.2 (export size: width = 500 & height = 500)
# Output images               : histogram in section 1.3 (export size: width = 667 & height = 500)
# Output images               : scatter plot in section 1.4 (export size: width = 450 & height = 338)

# Date                        : Jan 16th, 2025

# Pre-run another .R file?    : Yes, first run "Part_1-Loading_and_Mergin.R" 
#                             : Then, Part_4-LinearReg_Assumptions_check.R 
#
###################################################################################

################################################
### 0. Loading Packages used in this .R file ###
################################################

# No additional package in this .R file

################################################
### 1. Model 1: Life satisfaction vs anxiety ###
################################################

# 1.1 Building the model: 

model_anxiety <- lm(formula = satisfaction~anxiety, 
                    data = df_training)
summary(model_anxiety)
attributes(model_anxiety) # to know the attributives like "fitted.values"
coefs_anxiety <- coef(model_anxiety) # (Intercept)8.54169    & slope = -0.28494

#1.2 Checking Homoscedasticity (with training set)

ggplot(df_training, aes(x = model_anxiety$fitted.values, y = residuals(model_anxiety))) +
  geom_point(size = 3.2, shape = 1, color = "black", alpha = 0.8) +
  theme_classic() +
  geom_hline(yintercept = 0, linetype = "dotted", color = "#7A7A7A", linewidth = 0.8) +  # Horizontal dotted line at zero
  labs(y = "Residuals", x = "Fitted Values (Satisfaction & Anxiety)", 
       title = "Assumption Check: Homoscedasticity") +
  theme(
    axis.text = element_text(size = 14),
    axis.title = element_text(size = 14),
    plot.title = element_text(size = 16, hjust = 0.5)
  ) +
  scale_y_continuous(limits = c(-.7, .7)) # looks scattered (assumption satisfied)

#1.3 checking Normality of Residuals (training set)

residuals_train_model_anxiety <- data.frame(residuals(model_anxiety))
colnames(residuals_train_model_anxiety) <- c("residuals")

ggplot(residuals_train_model_anxiety, aes(x = residuals)) +
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
  ) # looks normal (assumption satisfied)

#1.4 Predicting values (test set)

df_SLR_model_evaluation <- df_test # copying test frame
df_SLR_model_evaluation$predicted_md_anxiety <- predict(model_anxiety, newdata = df_test)
df_SLR_model_evaluation$residuals_md_anxiety <- df_SLR_model_evaluation$predicted_md_anxiety - df_SLR_model_evaluation$satisfaction 

ggplot(
  data=df_SLR_model_evaluation,
  aes(x=anxiety,y=satisfaction, color = "Actual values")) +
  geom_point(size=3) +
  geom_point(size=3, aes(y=predicted_md_anxiety, color = "Predicted Values"), shape=1) + # shows the predicted values
  geom_segment(aes(xend=anxiety, yend=predicted_md_anxiety, color = "Residuals"),alpha=0.9) +
  geom_abline(mapping=aes(slope=coefs_anxiety["anxiety"],
                          intercept=coefs_anxiety["(Intercept)"], color= "Fitted Line"),
              linewidth = 0.6)+
  theme_classic()+
  labs(y="Life Satisfaction", x = 'Anxiety')+
  scale_color_manual(values = c("Actual values" = "black", "Predicted Values" = "black", "Fitted Line" = "darkgray", "Residuals" = "#FF2D55"))+
  ylim(6.8, 8.8) + 
  theme(legend.position = c(0.85,0.85),
        legend.title = element_blank(),
        legend.background = element_rect(fill = "transparent", color = "gray"),
        legend.margin = margin(0.8, 0.8,0.8, 0.8), 
        legend.box.margin = margin(0.8, 0.8,0.8, 0.8))

#1.5 Computing Sum of Squared Errors (SSE) - on test set

sse_model_anxiety <- sum(df_SLR_model_evaluation$residuals_md_anxiety**2)
sse_model_anxiety #2.939318; this is a metric to compare models

###########################################################
### 2. Model 2: Life satisfaction vs population density ###
###########################################################

#2.1 Building the model
model_popDensity <- lm(formula = satisfaction~mean_pop_dens_2017, 
                       data = df_training)
summary(model_popDensity)

#2.2 quickly checking Homoscedasticity (w/ training set)
# plot(model_popDensity, which = 1) # constant variance checked

#2.3 Predicting values (test set)
df_SLR_model_evaluation2 <- df_test # copying test frame
df_SLR_model_evaluation2$predicted_md_popDensity <- predict(model_popDensity, newdata = df_test)
df_SLR_model_evaluation2$residuals_md_popDensity <- df_SLR_model_evaluation2$predicted_md_popDensity - df_SLR_model_evaluation2$satisfaction # cant use residua here

#2.4 quickly checking normality of residuals
# hist(residuals(model_popDensity)) # residuals seem normal (but a bit skewed)

#2.5 Computing Sum of Squared Errors (SSE)
sse_model_popDensity <- sum(df_SLR_model_evaluation2$residuals_md_popDensity**2)
sse_model_popDensity # 3.047251

################################
### 3. Clearing environment  ###
################################

# clears environment (deletes variables not used in subsequent .R files)
rm(list = setdiff(ls(), c("df_training" ,"df_test"))) 
