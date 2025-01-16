# Project Information
----------------------------------------

**Name**: Life_Satisfaction_Eng_Project

**Description**: This is the final project for INF6027 (Intro to DS) at The University of Sheffield. It is entitled "Area-Level Analysis of Life Satisfaction in England and Associated Factors". It uses 4 datasets from the UK's Office for National Statistics, primarily it uses local indicators ([ONS Local Indicators Datasets](https://explore-local-statistics.beta.ons.gov.uk/indicators)).

**Motivation**: Life satisfaction is an important metric monitored by governments to promote healthy communities. This project studies life satisfaction in England in 2017, examining its geographical distribution, its changes with urban/rural classification, and its relation with local indicators. 

### Research Questions and Key Findings

The three research questions and their respective key findings are presented below. The geographical areas used are local authority districts (LADs).

1. **How do life satisfaction scores compare spatially across LADs in England?**

   **Key finding**: Southeast England (around the London area) has a high concentration of LADs with below-average life satisfaction scores. The opposite is true for southwest England. Other LADs have combinations of below- and above-average life satisfaction.

2. **Are there differences in the life satisfaction scores amongst the different urban/rural classifications of LADs?**

   **Key finding**: Yes. Urban areas with conurbation display below-average satisfaction. Conversely, rural areas have the highest levels of life satisfaction.

3. **How do local indicators (economic, health, etc.) relate to life satisfaction across the LADs in England?**

   **Key finding**: Life satisfaction has a significantly positive correlation with employment rate and time to go to work, while it has a significantly negative correlation with anxiety, smoker rate, and population density. The best Multiple Linear Regression model had an R-squared of 34.81%, which consisted of 4 of these independent variables.


# Instructions to Execute This Project
----------------------------------------

1. Download the "Life Satisfaction - Project.Rproj" project file.
2. Download the 4 datasets (following steps in the section below or from the "Data" folder in GitHub).
3. Run the `.R` files in order (1 through 6).

# Instructions to Download the Datasets (Directly from the ONS Website)
-----------------------------------------

1. **Download the indicators dataset**  
   From [ONS Life Satisfaction Indicators](https://explore-local-statistics.beta.ons.gov.uk/indicators/wellbeing-satisfaction)  
   Click on "Accompanying dataset (ODS, 4MB)" at the bottom of the page.  
   Change the name of the file to `ONS_Indicators_dataset.ods`.

2. **Download the population density dataset**  
   From [ONS Population Density Dataset](https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareapopulationdensity)  
   Click on "Mid-2017 edition of this dataset SAPE20DT11" --> "zip (1.5 MB)" --> Open the zip file.  
   Change the name of the file to `population_density_dataset.xlsx`.

3. **Download the Rural/Urban Classification dataset**  
   From [ONS Rural/Urban Classification](https://geoportal.statistics.gov.uk/datasets/f9fdc3adbc234f8eacee7c2b62274632/about)  
   Click on "Download".  
   Change the name of the file to `urban_classification.xlsx`.

4. **Download the Local Administrative Districts boundaries dataset**  
   From [ONS Local Administrative Districts](https://geoportal.statistics.gov.uk/datasets/a2128b32c7fb4205ba99e6344fcbb2be_0/explore?location=60.692869%2C17.973571%2C3.89)  
   Click on "Download" --> Select GeoJSON --> Click "Download" again.  
   Change the name to `Local_Authority_Districts.geojson`.

5. **Create a folder in the home directory of the project and name it "Data"**  
   Copy all four files into this "Data" folder.  
   The "Data" folder should be inside the folder containing the "Life Satisfaction - Project.Rproj" project.
