# Project Information: 
----------------------------------------
Name: Life_Satisfaction_Eng_Project

Description: This is the final project for INF6027 (Intro to DS) at The University of Sheffield. It is entitled "Area-Level Analysis of Life Satisfaction in England and Associated Factors". It uses 4 datasets from the UK's Office for National Statistics, primarily it uses local indicators (https://explore-local-statistics.beta.ons.gov.uk/indicators). 

# Instructions to executing this project
----------------------------------------
    1. Download the "Life Satisfaction - Project.Rproj" project file
    2. Download the 4 datasets (following steps in section below or from the "Data" folder in GitHub)
    3. Run the .R files in order (1 through 6).


# Instructions to downloading the data sets (directly from the ONS website)
-----------------------------------------
    1. Download the indicators dataset
          from https://explore-local-statistics.beta.ons.gov.uk/indicators/wellbeing-satisfaction
          by clicking on "accompanying dataset (ODS, 4MB)." at bottom of the page;
          change the name of the file to "ONS_Indicators_dataset.ods"

    2. Download the population density dataset
          from https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareapopulationdensity
          by clicking on "Mid-2017 edition of this dataset SAPE20DT11" --> "zip (1.5 MB)" --> open the zip file;
          change the name of the file to "population_density_dataset.xlsx"

    3. Download the  Rural/Urban Classification dataset
         from https://geoportal.statistics.gov.uk/datasets/f9fdc3adbc234f8eacee7c2b62274632/about
         by clicking on "Download";
         change the name of the file to "urban_classification.xlsx"

    4. Download the Local Administrative Districts boundaries dataset
         from https://geoportal.statistics.gov.uk/datasets/a2128b32c7fb4205ba99e6344fcbb2be_0/explore?location=60.692869%2C17.973571%2C3.89
         by clicking on "Download" --> select GeoJSON --> clicking on "Download" again;
         change the name to "Local_Authority_Districts.geojson"

    5. Create a folder (in home directory of the project) and name it "Data";
         copy all four files above into this "Data" folder.
         the Data folder should be inside the folder containing the "Life Satisfaction - Project.Rproj" project.
