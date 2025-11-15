# Cleaned and cumulatively processed dengue case data.
# These values were derived from the original dataset and are hard-coded here
# to allow full reproducibility without requiring the raw data file.
dengue_vec <- c(54,80,99,129,164,218,314,379,435,539,638,668,671,671,774,811,846,895,978,1052,1153,1283,1445,1613,1761,1844,1923,1966,2031,2119,2246,2394,2476,2521,2574,2603,2634,2650,2665,2677,2700,2723,2774,2855,2909,2968,3024,3056,3060,3070,3084,3087,3097,3113,3139,3174,3215,3278,3333,3387,3398,3434,3450,3478,3507,3516,3607,3791,3987,4232,4391,4545,4562,4596,4622,4652,4668,4676,4705,4740,4771,4789,4823,4852,4856,4859,4860,4861,4865,4868,4879,4884,4891,4911,4932,4966,4976,4982,5011,5023,5036,5065,5151,5349,5573,5834,6026,6122,6122,6122,6122,6122,6122,6122,6122,6122,6122,6122,6122,6278,6327,6471,6587,6789,6957,7093,7352,7709,8257,8714,8969)

# Convert the cleaned numeric vector into a time series object.
# The time series starts from January 2014 and has a monthly frequency (12 observations per year).
dengue_ts <- ts(dengue_vec, start = c(2014, 1), frequency = 12)

# Define the length of the training set (all but the last 12 months)
n_train <- 120

# Create training and testing sets
train_data <- window(dengue_ts, start = start(dengue_ts), end = time(dengue_ts)[n_train])
test_data <- window(dengue_ts, start = time(dengue_ts)[n_train + 1], end = end(dengue_ts))
