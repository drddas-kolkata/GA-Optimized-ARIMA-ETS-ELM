# Cleaned and cumulatively processed dengue case data.
# The values were derived from the original dataset and are to be hard-coded here
# to allow full reproducibility without requiring the raw data file.
print("Store cumulative data in dengue_vec to run the code")

# Convert the cleaned numeric vector into a time series object.
# The time series starts from January 2014 and has a monthly frequency (12 observations per year).
dengue_ts <- ts(dengue_vec, start = c(2014, 1), frequency = 12)

# Define the length of the training set (all but the last 12 months)
n_train <- 120

# Create training and testing sets
train_data <- window(dengue_ts, start = start(dengue_ts), end = time(dengue_ts)[n_train])
test_data <- window(dengue_ts, start = time(dengue_ts)[n_train + 1], end = end(dengue_ts))
