
data <- read.csv("/Users/Emrys/Downloads/lish-moa/train_features.csv")

sig_id <- data$sig_id

data <- data[,2:876]

library(mltools)
library(data.table)
newdata <- one_hot(as.data.table(data))

start <- Sys.time()
pr.out=prcomp(newdata, scale=TRUE)
end <- Sys.time()
(end - start)

summary(pr.out)

pr.var=pr.out$sdev ^2
pve=pr.var/sum(pr.var)
plot(pve[1:20], xlab="Principal Component", ylab="Proportion of Variance Explained ", ylim=c(0,1),type='b')

names(newdata)
names(data)

cumsum(pve)


