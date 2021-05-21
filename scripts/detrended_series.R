#!/usr/bin/env Rscript
DEBUG=TRUE
time = 0:100
slope = 0.2 
intercept = 1
noise = rnorm(length(time))

values = intercept + slope * time + noise

if (!DEBUG){ pdf("detrended_series_experiment.pdf") }

plot(values ~ time, type="l")

if (!DEBUG){ dev.off() }
