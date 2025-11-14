# Construct extended ARIMA and ETS regressor series (fitted + future values)
new_test  <- c(as.vector(fit_arima$fitted),  as.vector(forecast_arima$mean))
new_test1 <- c(as.vector(fit_ets$fitted),    as.vector(forecast_ets$mean))

# Combine extended regressors for ELM forecasting
new_xreg <- cbind(arima1 = new_test, ets1 = new_test1)

# Generate 11-step-ahead forecasts using the GA-optimized ELM model
fc <- forecast(fit_elm, xreg = new_xreg, h = 11)

print("Forecast Complete")
