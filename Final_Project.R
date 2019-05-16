library(tidyverse)
library(maps)
library(geosphere)
library(magrittr)

par(mar=c(0,0,0,0))
map('world',col="#f2f2f2", fill=TRUE, bg="white", lwd=0.08,mar=rep(0,4),border=0, ylim=c(-80,100) )



Australia=c(133.775136,-25.274398)
Iran=c(53.688046,32.427908)
Norway=c(8.468946,60.472024)
New_Zealand=c(174.885971,-40.900557)



data=rbind(Australia, Iran, Norway, New_Zealand) %>% as.data.frame()
colnames(data)=c("long","lat")

points(x=data$long, y=data$lat, col="slateblue", cex=2, pch=20)
text(rownames(data), x=data$long, y=data$lat,  col="slateblue", cex=0.5, pos=2)

# Connection between Australia and Iran
inter <- gcIntermediate(Australia,  Iran, n=50, addStartEnd=TRUE, breakAtDateLine=F)             
lines(inter, col="slateblue", lwd=2)

# Between Australia and New Zealand
inter <- gcIntermediate(Australia,  New_Zealand, n=50, addStartEnd=TRUE, breakAtDateLine=F)             
lines(inter, col="slateblue", lwd=2)


# Between Iran and Norway
inter <- gcIntermediate(Iran,  Norway, n=50, addStartEnd=TRUE, breakAtDateLine=F)             
lines(inter, col="slateblue", lwd=2)
