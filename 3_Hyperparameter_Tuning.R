# Automatically select ARIMA model
fit_arima <- auto.arima(train_data, seasonal = FALSE)
forecast_arima <- forecast(fit_arima, h=11)

# Automatically select ETS model
fit_ets <- ets(train_data)
forecast_ets <- forecast(fit_ets, h=11)

# Create external regressors to the ELM
test <- c(as.vector(fit_arima$fitted))
test1 <- c(as.vector(fit_ets$fitted))
xreg = cbind(arima1 = test, ets1 = test1)

# Define the fitness function for GA
elm_ga <- function(hidden_nodes) {
  tryCatch({
    set.seed(2025)
    fit_mlp <- elm(train_data, m = frequency(train_data),
                   lags = c(1:12),
                   sel.lag = FALSE,
                   hd = floor(hidden_nodes),
                   difforder = c(1,2,3,5),
                   allow.det.season = FALSE, 
                   det.type = "auto",
                   xreg = xreg,
                   xreg.lags = c(1,0))
    acc <- sqrt(fit_mlp$MSE)
    return(-acc) # Negative RMSE for minimization
  }, error = function(e) {
    return(Inf) # Penalize invalid solutions
  })
}

# Run GA
set.seed(2025)
ga_model <- ga(
  type = "real-valued",
  fitness = elm_ga,
  lower = 100,       # Minimum hidden nodes
  upper = 1000,      # Maximum hidden nodes
  popSize = 20,      # Population size
  maxiter = 50,      # Number of generations
  run = 10,          # Stop if no improvement in 10 iterations
  pcrossover = 0.8,
  pmutation = 0.1,
  seed = 123         # For reproducibility
)

# Extract the optimal hidden nodes
optimal_hd <- floor(ga_model@solution[1])
print(paste("Optimal hidden nodes:", optimal_hd))

# Extract all evaluated hidden nodes (population)
hidden_nodes_searched <- ga_model@population

# Extract corresponding RMSE values (convert negative RMSE to positive)
rmse_values <- -ga_model@fitness 

# Plot Hidden Nodes vs. RMSE
plot(hidden_nodes_searched, rmse_values, pch = 16, col = "blue",
     main = "GA Search: Hidden Nodes vs. RMSE",
     xlab = "Hidden Nodes", ylab = "RMSE",
     cex = 1.2)

# Highlight the optimal hidden nodes
points(optimal_hd, min(rmse_values), col = "red", pch = 19, cex = 1.5)
text(optimal_hd, min(rmse_values), labels = paste("Optimal:", optimal_hd), pos = 3, col = "red")
