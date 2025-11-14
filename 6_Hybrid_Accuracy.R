# Initialize empty data frame for storing results
results <- data.frame(
  n    = integer(),
  ME   = numeric(),
  RMSE = numeric(),
  MAE  = numeric(),
  MPE  = numeric(),
  MAPE = numeric(),
  stringsAsFactors = FALSE
)

# Loop through forecast horizons (1-step ahead to 11-step ahead)
for (i in 1:11) {
  
  # Compute accuracy metrics for first i observations
  acc <- accuracy(test_data[1:i], fc$mean[1:i])
  
  # Store metrics in results table
  results <- rbind(
    results,
    data.frame(
      n    = i,
      ME   = acc[1],
      RMSE = acc[2],
      MAE  = acc[3],
      MPE  = acc[4],
      MAPE = acc[5]
    )
  )
}

# Remove row names for clean output
rownames(results) <- NULL

# Display results
print(results)
