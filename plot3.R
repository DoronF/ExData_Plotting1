source("load_data.R")

dt <- load_data()

png(
    filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px"
)


plot(
    dt$date_time,
    dt$sub_metering_1,
    type = "n",
    ylab = "Energy sub metering",
    xlab = "",
    xaxt = "n"
)

axis(1,
     at = c(min(dt$date_time), median(dt$date_time), max(dt$date_time)),
     labels = c("Thu", "Fri", "Sat"))

lines(dt$date_time, dt$sub_metering_1)
lines(dt$date_time, dt$sub_metering_2, col = "red")
lines(dt$date_time, dt$sub_metering_3, col = "blue")

legend(
    x = "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col  = c("black", "red", "blue"),
    lty = 1
)

dev.off()