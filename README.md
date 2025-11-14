# GA-Optimized-ARIMA-ETS-ELM
# GA-Optimized Hybrid ARIMA-ETS-ELM Model
This repository contains all the R scripts required to reproduce the experimental framework, model development, forecasting, and evaluation. The repository does not contain the raw dengue data file obtained from [1]. Instead, the analysis uses a cleaned and cumulative processed vector directly embedded in the code to ensure full reproducibility of the results submitted with the manuscript

# Repository Structure:

├── 1_Required_Libraries.R

├── 2_Load_Data.R

├── 3_Hyperparameter_Tuning.R

├── 4_Final_Hybrid_Model.R

├── 5_Final_Forecast.R

├── 6_Hybrid_Accuracy.R

└── README.md

# How to Reproduce the Experiments
Open R or RStudio.

Set the working directory to this repository folder.

Run the scripts in the following order:

1_Required_Libraries.R

2_Load_Data.R

3_Hyperparameter_Tuning.R

4_Final_Hybrid_Model.R

5_Final_Forecast.R

6_Hybrid_Accuracy.R

# References
World Health Organization. (2025). Global dengue surveillance. Retrieved January 2025, from https://worldhealthorg.shinyapps.io/dengue_global/

# Software Environment
R version: (4.4.2)
