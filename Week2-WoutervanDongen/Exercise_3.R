# Author: Wouter van Dongen
# Date: 11-02-2026

#5
whale <- read.table(file = 'whaledata.txt', header=TRUE, sep = '\t')
whale

#6
head(whale)
names(whale)
str(whale)

#7
summary(whale)
#number.whales has 1 NA

#8
whale.sub <- whale[1:10,1:4]
whale.num <- whale[,c("month","water.noise","number.whales")]
whale.may <- whale[1:50,]
whale[c(1:10),-c(8)]

#9
whale.deep <- whale[whale$depth>1200,]
whale.steep <- whale[whale$gradient>200,]
whale.lownoise <- whale[whale$water.noise=='low',]
whale.high.may <- whale[whale$month=='May'&whale$water.noise=='high',]
whale.low.oct.steep <- whale[whale$month=='October'&whale$water.noise=='low'&whale$gradient>132,]
whale$longitude <- as.numeric(gsub(",", ".", whale$longitude))
whale$latitude  <- as.numeric(gsub(",", ".", whale$latitude))
whale.area <- whale[whale$latitude>=60&whale$latitude<=61&whale$longitude>=-6&whale$longitude<=-4,]
whale.nomedium <- whale[whale$water.noise!='medium',]

#10
whale.low.oct.steep2 <- whale[whale$month=='October'&whale$water.noise=='low'&whale$gradient>median(whale$gradient),]

#11
whale.deep.avr <- whale[whale$depth>1500&whale$number.whales>mean(whale$number.whales, na.rm=TRUE),]

#12
subset1 <- subset(whale, month=='May' & time.at.station<1000 & depth>1000)
subset2 <- subset(whale, month=='October'&latitude>61, select = c('month','latitude','longitude','number.whales'))

#13
whale.depth.sort <- whale[order(whale$depth),]

#14
whale$water.noise <- factor(whale$water.noise, levels = c('low','medium','high'))
whale.noise.depth <- whale[order(whale$water.noise,whale$depth),]
whale.noise.depth2 <- whale[order(whale$water.noise,-whale$depth),]

#15
tapply(whale$number.whales, whale$water.noise, mean, na.rm=TRUE)
tapply(whale$number.whales, list(whale$water.noise, whale$month), median, na.rm=TRUE)

#16
aggregate(whale[,c('time.at.station', 'gradient', 'number.whales','depth')], by=list(noise = whale$water.noise), mean, na.rm = TRUE)
aggregate(whale[,c('time.at.station', 'gradient', 'number.whales','depth')], by=list(noise = whale$water.noise, month=whale$month), mean, na.rm = TRUE)

#17
table(whale$water.noise, whale$month)
xtabs(~ water.noise+month, data= whale)

#18
write.table(whale.num, file = 'whale_num.txt', col.names = TRUE, row.names = FALSE, sep = '\t')