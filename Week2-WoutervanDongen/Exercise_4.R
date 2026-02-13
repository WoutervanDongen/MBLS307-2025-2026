# Author: Wouter van Dongen
# Date: 13-02-2026

#library(lattice)

#4
squid <- read.table(file = 'squid1.txt', sep = '\t', header = TRUE, dec = ',')
squid$month = factor(squid$month)
squid$year = factor(squid$year)
squid$maturity.stage = factor(squid$maturity.stage)
str(squid)

#5
table(squid$year, squid$month)
xtabs(~year+month+maturity.stage, data=squid)

#7
squid[11,'nid.length'] = 43.2
squid[11,'nid.length']

#8
squid$DML = as.numeric(squid$DML)
hist(squid$DML)
hist(squid$weight)
hist(squid$ovary.weight)
hist(squid$eviscerate.weight)
brks = seq(50,350,20)
hist(squid$DML, breaks = brks)

#9
weight.log <- log(squid$weight)
weight.sqrt <- sqrt(squid$weight)
squid = cbind(squid,weight.log, weight.sqrt)
plot(squid$weight.log, squid$DML)
jpeg('logplot.jpg')
plot(squid$weight.sqrt, squid$DML)
dev.off()

#10
boxplot(DML~maturity.stage, data=squid, xlab = 'Maturaty stage', ylab= 'DSM (cm)')
vioplot(DML~maturity.stage, data=squid, xlab = 'Maturaty stage', ylab= 'DSM (cm)', col='lightblue')
