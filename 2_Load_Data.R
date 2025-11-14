# Read the dengue data from a text file into a data frame.
# The 'header = TRUE' argument tells R that the first row contains column names.
dengue_df <- read.table("D:/dengue_data.txt", header = TRUE)

# Flatten the data frame into a single numeric vector by transposing it first (t()).
# Transposing ensures all values (possibly across multiple columns) are read sequentially.
dengue_vec <- as.numeric(t(dengue_df))

# Remove any missing values (NA) that may appear due to uneven rows or missing data.
dengue_vec <- dengue_vec[!is.na(dengue_vec)]

# Convert the cleaned numeric vector into a time series object.
# The time series starts from January 2014 and has a monthly frequency (12 observations per year).
dengue_ts <- ts(dengue_vec, start = c(2014, 1), frequency = 12)

# Define the length of the training set (all but the last 12 months)
n_train <- 120

# Create training and testing sets
train_data <- window(dengue_ts, start = start(dengue_ts), end = time(dengue_ts)[n_train])
test_data <- window(dengue_ts, start = time(dengue_ts)[n_train + 1], end = end(dengue_ts))
