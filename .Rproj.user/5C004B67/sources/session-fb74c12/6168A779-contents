
###################################################################################
#
# (File 2/6)
# 
# Project                     : Area-Level Analysis of Life Satisfaction in England

# Author                      : Dionisio V. Del Orbe H.

# .R file name                : Part_2-stats_and_mapping.R (file 2 of 6 in project)

# Purpose                     : Descriptive stats and map of England's satisfaction

# Output data.frame           : N/A

# Output image                : England's map in section 2.2 (export size: width = 1000 & height = 834)

# Date                        : Jan 16th, 2025

# Pre-run another .R file?    : Yes, first run "Part_1-Loading_and_Mergin.R" 
#
###################################################################################

################################################
### 0. Loading Packages used in this .R file ###
################################################

# Note: must use "install.packages(name_package)" for packages not installed

library(ggthemes)   # function: theme_map()     --> theme for plotting map

##################################################################
### 1. Descriptive statistics of all variables in this project ###
##################################################################


#1.1 Prints 5 number summary for the 8 numerical variables (1 dependent and 7 independent)
# Note: LAD_codes is our identifier of our LADs (not a variable in analysis)

# Numeric variables (8 variables):
descriptive_stats <- function(df) {
  sapply(df, function(x) {
    if (is.numeric(x)) {
      c(
        Min = round(min(x, na.rm = TRUE), 2),
        Q1 = round(quantile(x, 0.25, na.rm = TRUE), 2),
        Median = round(median(x, na.rm = TRUE), 2),
        Mean = round(mean(x, na.rm = TRUE), 2),
        Q3 = round(quantile(x, 0.75, na.rm = TRUE), 2),
        Max = round(max(x, na.rm = TRUE), 2),
        IQR = round(IQR(x, na.rm = TRUE), 2),
        SD = round(sd(x, na.rm = TRUE), 2)
      )
    } else {
      NULL
    }
  })
}

descriptive_stats(Indicators_merged)

#1.2 categorical variable (1 variable)
# Prints frequency table for the one categorical variables (population density)

Indicators_merged |>
  group_by(Rural_Classification) |>
  summarise(n = n()) |>
  mutate(percent_rural_class = n/nrow(Indicators_merged)*100)

##################################################################
### 2. Plotting map of areas below and above life sat. average ###
##################################################################

#2.1 Adding column with % difference of Life Satisfaction from national average
# Note: for 2017 life sat avg in England was 7.68 (obtained from: 
# https://explore-local-statistics.beta.ons.gov.uk/indicators/wellbeing-satisfaction

Map_Indicators_merged <- Map_Indicators_merged |>
  mutate(Sat_perc_above_below_avg = (satisfaction-7.68)/7.68*100)

#2.2 Plotting the map:

Map_Indicators_merged |>
  ggplot()+
  geom_sf(aes(fill= Sat_perc_above_below_avg), color = "darkgray", lwd = 0.5) +
  labs(fill = "Life Satisfaction\n\n(% difference\n from national\naverage)\n") +
  # this is a 3 color gradient below:
  scale_fill_gradient2(midpoint=0, low= "#FF6347",
                       mid='lightgray', high= "#4682B4",
                       na.value = "white")+
  theme_map() +
  theme(
    legend.position = c(.05, 0.35),       
    legend.background = element_rect(fill = "transparent"),  
    legend.title = element_text(size = 16.5, hjust = 0.5, lineheight = 0.75), 
    legend.text = element_text(size = 16.5)   
  )+
  annotate(
    "point",
    x = 0.30, y = 51.35, 
    shape = 21,         
    size = 58,          
    color = "#7A7A7A",    
    fill = NA,         
    stroke = 1.12        
  ) + 
  # Arrow pointing towards the circle
  annotate(
    "segment",
    x = 1.9, y = 51.8 ,          
    xend =1.5 , yend = 51.6, 
    arrow = arrow(length = unit(0.35, "cm")),
    color = "#7A7A7A",         
    size = 0.73                 
  ) + 
  annotate(
    "segment",
    x = 1.9, y = 51.8 ,          
    xend =1.9 , yend = 53.5, 
    color = "#7A7A7A",        
    size = 0.73               
  )+  
  geom_text(
    data = data.frame(x = 0.55, y = 53.44, label = "Cluster of\nareas below\naverage"),
    aes(x = x, y = y, label = label),
    hjust = 0,
    vjust = 0,
    size = 5.7, 
    lineheight = 0.8, 
    color = "black"
  )

################################
### 3. Clearing environment  ###
################################

# clears environment (deletes variables not used in subsequent .R files)
rm(list = setdiff(ls(), c("Indicators_merged")))
