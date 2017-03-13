# ---- LIBRARIES ---- 
library(dplyr)
# require(scales)
require(ggplot2)
# library(ggthemes)
require(ggmosaic)
library(wesanderson)
# library(GGally)
# library(psych)


# ---- DATA ---- 
if (exists('df.a') == F) {
  library(readr)
  df.a <- read.delim("~/projects/RmFinal/data/2012/data.tsv", stringsAsFactors = F)
  df.a[df.a == "\\N"] <- NA
}

# convert all \N into NAs so that they can be ignored later

# factor relabeling
df.a$SEX.cat <- as.factor(recode(df.a$SEX, '1' ='Male', '2' = 'Female'))

df.a$GENHLTH.cat <- recode(df.a$GENHLTH, '1' ='Excellent', '2' = 'Very good', '3' = 'Good', '4' = 'Fair',
                       '5' = 'Poor', '7' = "Don't know", '9' = 'Refused')

df.a$GENHLTH.cat <- factor(df.a$GENHLTH.cat , levels = c("Excellent", "Very good", "Good", 'Fair', 'Poor',
                           "Don't know", 'Refused'))

df.a$EMPLOY.cat <- recode(df.a$EMPLOY, '1' = 'For wages', '2' = 'Self=employed', '3' = 'Out of work 1+ year',
                          '4' = 'Out of work -1 year', '5' = 'Homemaker', '6' = 'Student', '7' = 'Retired',
                          '8' = 'Unable to work', '9' = 'Refused')

df.a$HOWLONG.cat <- recode(df.a$HOWLONG, '1' = 'Past year', '2' = 'Past two years', '3' = 'Past three years',
                           '4' = 'Past 5 years', '5' = '5+ years', '7' = "Don't know", '9' = 'Refused')

df.a$HOWLONG.cat <- factor(df.a$HOWLONG.cat, levels = c('Past year', 'Past two years', 'Past three years',
                                                        'Past 5 years', '5+ years', "Don't know", 'Refused'))


# ---- GRAPHICS ----

# Mosaic: General Health vs Employment Status by Sex
# ggplot(data = df.a) +
#   geom_mosaic(aes(x = product(GENHLTH.cat, EMPLOY.cat), fill=factor(GENHLTH.cat)), na.rm=TRUE) +
#   theme(axis.text.x=element_text(angle=-25, hjust= .1)) + facet_grid(SEX.cat~.) +
#   labs(x = 'Employment Status', title = 'f(General Health, Employment Status | Sex)') +
#   guides(fill=guide_legend(title = "General Health", reverse = TRUE))

bCan <- select(df.a, GENHLTH.cat, HOWLONG.cat) %>% subset(!is.na(HOWLONG.cat))

histo1 <- ggplot(bCan, aes(x = GENHLTH.cat, fill = HOWLONG.cat), na.rm=TRUE) + geom_bar()
histo1 + facet_grid(HOWLONG.cat~.)