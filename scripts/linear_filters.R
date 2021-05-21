#!/usr/bin/env Rscript
# Set the seed so we can reproduce the data consistently
set.seed(1)

# Get a list of numbers from -49 to 50
indexes = (-49):50
X = cbind(indexes, indexes^2)

# Simulate some cubic data, with some rnorm random noise added
y = 10 + 0.05 * indexes - 0.005 * indexes^2 + 0.0001 * indexes ^ 3 + 5 * rnorm(100)
par(mfrow=c(2, 2))
plot(indexes, y, type="l", main="(a)")

# Plot the first 5 observations
plot.ts( indexes[1:5], y[1:5], main = "First 5 observations (b)") 


quadratic_fit = lm(y[1:5] ~ X[1:5, 1] + X[1:5, 2]) 
summary(quadratic_fit)
lines(indexes[1:5],quadratic_fit$fit, col = "red", lty = 2)
points(indexes[3], quadratic_fit$fit[3], cex = 2, pch = 19, col = "blue")
abline(v=indexes[3], lty=2)
c1 = c(-2:2)
c2 = (c(-2:2))^2
linear_model_fit = lm(y[1:5] ~ c1+c2)
summary(linear_model_fit)
linear_model_fit$fit
