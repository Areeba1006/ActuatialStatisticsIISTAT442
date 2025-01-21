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


### Ogive functions

# Install and load the actuar package
install.packages("actuar")
library(actuar)

# Create grouped data
x <- grouped.data(
  Group = c(0, 7500, 17500, 32500, 67500, 125000, 300000, 500000),
  Line1 = c(99, 42, 29, 28, 17, 9, 3)
)

# Display grouped data
x

# Compute the Ogive (ECDF for grouped data)
fn <- ogive(x)

# Display the ogive
fn
# Output: Ogive for grouped data
# Call: ogive(x = x)
# x =      0,   7500,  17500,  ...,  3e+05,  5e+05
# F(x) =      0, 0.43612, 0.62115,  ..., 0.98678,      1

# Extract knots (data points where ECDF changes)
knots(fn)

# Evaluate the Ogive at specific points
fn(3400)   # Output: 0.1977093
fn(100000) # Output: 0.9145758

# Create a histogram
z <- hist(x)

# Display histogram details
z
