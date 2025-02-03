# Data
x <- c(1, 2, 3, 4, 5,6)
y <- c(1089, 706, 318, 250, 90, 75,45)
options(digits = 4)
n <- sum(y)
n
# ECDF
fn <- stepfun(x = c(0, 1, 2, 3, 4, 5,6), 
              y = c(0, cumsum(y) / sum(y)), 
              f = 0, right = FALSE)

plot(fn, main = "ECDF Plot")

### Estimating 95% CI



# ECDF
fn <- stepfun(x = c(0, 1, 2, 3, 4, 5,6), 
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

tikzDevice::tikz("ecdf.tex",standAlone = F, width = 5, height = 5)
plot(fn, main = "ECDF Plot")
dev.off()

### Ogive functions

# Install and load the actuar package
library(actuar)

# Create grouped data
x <- grouped.data(
  Group = c(0, 2500, 5500,10000, 12500, 15000, 30000, 50000),
  Line1 = c(199, 242, 29, 53, 17, 29, 6)
)

# Display grouped data
x


fn <- ogive(x)

# Display the ogive
fn

knots(fn)

# Evaluate the Ogive at specific points
fn(3400)   # Output: 0.1977093
fn(1000) # Output: 0.9145758
fn(5600)
# Create a histogram
z <- hist(x,main='Histogram',xlab="") # how to add a grid
# Add a grid to the histogram
grid()

tikzDevice::tikz("hist.tex",standAlone = F, width = 5, height = 5)
z <- hist(x,main='Histogram',xlab="")
grid()
dev.off()

tikzDevice::tikz("ogive.tex",standAlone = F, width = 5, height = 5)
plot(fn, main = "Ogive Plot")
grid()
dev.off()

# Display histogram details
z
