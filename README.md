# GA-Optimized Hybrid ARIMA-ETS-ELM Model
This repository contains the R scripts used to reproduce the experimental workflow for the GA-optimized ARIMA-ETS-ELM model, including library loading, data preparation, GA-based hyperparameter tuning, final model development, forecasting using the optimized model, and performance evaluation of it. A Genetic Algorithm (GA) is used only for tuning the number of hidden nodes in the ELM component of the hybrid model; it is not applied elsewhere in the workflow. The raw dengue data obtained from [1] is not included; instead, a cleaned and cumulatively processed data vector is embedded directly within the code to ensure full reproducibility of the results presented in the manuscript.

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

# Software Environment
R version: (4.4.2)

# References
[1] World Health Organization. (2025). Global dengue surveillance. Retrieved January 2025, from https://worldhealthorg.shinyapps.io/dengue_global/
