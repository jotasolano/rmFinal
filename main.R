# libraries
# library(dplyr)
# require(scales)
require(ggplot2)
# library(ggthemes)
require(ggmosaic)
# library(GGally)
# library(psych)


# data loading
if (exists('df.a') == F) {
  library(readr)
  df.a <- read.delim("~/projects/RmFinal/data/2012/data.tsv", stringsAsFactors = F)
}

df.a <- as.data.frame(df.a, stringsAsFactors = F)

# type coercion
# df$GENHLTH <- as.factor(df$GENHLTH)
# df$EMPLOY <- as.factor(df$EMPLOY)
# df$SEX <- as.factor(df$SEX)
# df$LASTSMK2 <- as.factor(df$LASTSMK2)
# df$MARITAL <- as.factor(df$MARITAL)
# df$WEIGHT2 <- as.numeric(df$WEIGHT2)
  
# general health 
# fil.weight <- filter(df, WEIGHT2 < 1000)
# df$GENHLTH.cat <- recode(df$GENHLTH, '1' ='Excellent', '2' = 'Very good', '3' = 'Good', '4' = 'Fair',
#                        '5' = 'Poor', '7' = "Don't know", '9' = 'Refused')
# # 
# genHealth <- ggplot(fil.weight, aes(GENHLTH, WEIGHT2)) + theme_tufte(ticks=T) + geom_tufteboxplot()
# genHealth

# ggplot(data = df) + geom_mosaic(aes(weight = WEIGHT2, x = product(EMPLOY), fill=factor(EMPLOY)), na.rm=TRUE)

ggplot(data = df.a) +
  geom_mosaic(aes(weight = SEX, x = product(GENHLTH), fill=factor(GENHLTH, EMPLOY)), na.rm=TRUE) +
  labs(x="Hours of sleep a night ", title='f(SleepHrsNight)') + guides(fill=guide_legend(title = "SleepHrsNight", reverse = TRUE))
