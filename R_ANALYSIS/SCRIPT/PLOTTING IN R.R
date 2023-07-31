###PLOTTING
library(readr)
DISB <- read_csv("C:/Users/Arohan/Downloads/DISB.CSV", 
    col_types = cols(CUST_NBR = col_character(), 
        ACCT_NBR = col_character()))
View(DISB)



library(ggplot2)
ggplot(data = DISB,aes(x=LN_CYCLE_NBR)) + geom_histogram(fill="white",col="orange")

ggplot(data = DISB,aes(x=ZONE_NME)) + geom_bar(fill="black",col="ORANGE")

ggplot(data=DISB,aes(x=ZONE_NME,y=TOT_DISB_AMT,col=REGION)) + geom_point()
ggplot(data=DISB,aes(x=ZONE_NME,y=TOT_DISB_AMT,col=REGION)) + geom_boxplot()
ggplot(data=DISB,aes(x=GNDR,y=TOT_DISB_AMT,col=REGION)) + geom_boxplot() + facet_grid(~ZONE_NME) + theme(plot.background = element_rect(fill = "gray"))

