# Define the numeric vector with censored values indicated by '*'
y <- c(2, 2, 21, 21, 4, 3, 9, 38, 5, 3, 3, 20, 6, 13, 3, 31, 6, 14, 5, 22, 17, 13, 10, 9, 9)

# Define the censoring indicator vector (1 for uncensored, 0 for censored)
cens <- c(1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1)

library(survival)

# Kaplan-Meier estimator
km_fit <- survfit(Surv(y, cens) ~ 1)
summary(km_fit)
# Nelson-Aalen estimator
na_fit <- survfit(Surv(y, cens) ~ 1, type = "fh",conf.type='plain')  # Fleming-Harrington estimator (equivalent to NA)
summary(na_fit)
2/25^2

