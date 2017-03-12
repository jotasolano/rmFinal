# data loading
if (exists('brfs') == F) {
  library(readr)
  brfs <- read_delim("~/Documents/IDV/2 Winter 2017/ARTG 5120 Design Research Methods/RmFinal/data/2012/data.tsv", 
                   "\t", escape_double = FALSE, trim_ws = TRUE)
}

# libraries
library(dplyr)
library(ggplot2)
library(ggthemes)
library(GGally)

# type coercion
brfs$GENHLTH <- as.factor(brfs$GENHLTH)
brfs$EMPLOY <- as.factor(brfs$EMPLOY)

fil.weight <- filter(brfs, WEIGHT2 < 1000)

brfs$GENHLTH <- recode(brfs$GENHLTH, '1' ='Excellent', '2' = 'Very good', '3' = 'Good', '4' = 'Fair',
                       '5' = 'Poor', '7' = "Don't know", '9' = 'Refused')

test <- ggplot(fil.weight, aes(GENHLTH, WEIGHT2)) + theme_tufte(ticks=T) + geom_tufteboxplot()
# test + geom_boxplot() + theme_economist()
# test + geom_boxplot(outlier.colour = "red", outlier.shape = 1)
test


