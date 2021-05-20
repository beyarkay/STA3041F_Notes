#!/usr/bin/env Rscript
DEBUG=FALSE
time = 0:60
slope = 0.2 
intercept = 1
period = 12
amplitude = 2
noise = rnorm(length(time))

seasonality = amplitude * sin(period * time)
values = intercept + slope * time + seasonality + noise


if (!DEBUG){ pdf("images/removing_the_seasons.pdf") }

plot(values ~ time, type="l", col="black")
window_sizes = c(4, 12)
for (i in 1:length(window_sizes)) {
    moving_average = filter(values, filter=rep(1, times=window_sizes[i]) / window_sizes[i]) 
    lines(moving_average, col=i+1)
}
legend(x = "topleft", 
       legend=append("All data", paste(window_sizes, " month MA")),
       col=1:(length(window_sizes)+1),
       lwd = 2
)

if (!DEBUG){ dev.off() }
