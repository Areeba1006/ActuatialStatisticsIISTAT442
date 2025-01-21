# Data
x <- c(1, 2, 3, 4, 5)
y <- c(81714, 11306, 1618, 250, 50, 7)
n <- sum(y)
n
# ECDF
fn <- stepfun(x = c(0, 1, 2, 3, 4, 5), 
              y = c(0, cumsum(y) / sum(y)), 
              f = 0, right = FALSE)

plot(fn, main = "ECDF Plot")

### Estimating 95% CI

# Data
x <- c(1, 2, 3, 4, 5)
y <- c(81714, 11306, 1618, 250, 50, 7)
n <- sum(y)

# ECDF
fn <- stepfun(x = c(0, 1, 2, 3, 4, 5), 
              y = c(0, cumsum(y) / sum(y)), 
              f = 0, right = FALSE)

# Compute ECDF values at unique points
ecdf_values <- cumsum(y) / sum(y)

# Compute 95% Confidence Intervals
se <- sqrt(ecdf_values * (1 - ecdf_values) / n)  # Standard error
ci_lower <- pmax(ecdf_values - 1.96 * se, 0)  # Lower bound
ci_upper <- pmin(ecdf_values + 1.96 * se, 1)  # Upper bound

ci_lower
ci_upper
