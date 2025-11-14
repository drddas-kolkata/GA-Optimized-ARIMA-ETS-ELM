# Fit the ARIMA and ETS models on the training data
fit_arima <- auto.arima(train_data, seasonal = FALSE)
fit_ets   <- ets(train_data)

# Generate 11-month ahead forecasts from ARIMA and ETS
forecast_arima <- forecast(fit_arima, h = 11)
forecast_ets   <- forecast(fit_ets, h = 11)

# Extract fitted values from ARIMA and ETS to use as external regressors
test_arima <- as.vector(fit_arima$fitted)
test_ets   <- as.vector(fit_ets$fitted)

# Construct the external regressor matrix for the ELM model
xreg <- cbind(
  arima1 = test_arima,
  ets1   = test_ets
)

# Train the final ELM model using the GA-optimized number of hidden nodes
set.seed(2025)
fit_elm <- elm(
  train_data,
  m = frequency(train_data),
  lags = 1:12,
  sel.lag = FALSE,
  hd = optimal_hd,              # GA-optimized hidden nodes
  difforder = c(1, 2, 3, 5),
  allow.det.season = FALSE,
  det.type = "auto",
  xreg = xreg,
  xreg.lags = c(1, 0)
)

print("Model Built")