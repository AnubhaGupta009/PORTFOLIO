library(sqldf)
library(zip)
library(reader)
library(readxl)
library(readxlsb)
library(dplyr)
library(readr)
#n READ THE TXT FILE
AHR <- read_delim("E:/SAMPLE_DATA/LOAN_CLIENT_BASE_DATA.txt",
                  delim = "|", escape_double = FALSE, col_types = cols_only(ZONE = col_character(),
                                                                            REGION_NAME = col_character(),BR_CDE = col_character(),
                                                                            BRNCH_NME = col_character(),CUST_NBR = col_character(), ACCT_NBR = col_character(),
                                                                            PROD_TYP = col_character(), LGR_BAL = col_character(),
                                                                            CNTRID = col_character(), CNTRNME = col_character(),
                                                                            DISB_DTE= col_character(), DISB_AMT = col_character(),
                                                                            ACCT_CLOSE_DTE = col_character(),MAT_DT = col_character()), trim_ws = TRUE)



### COVERTING THE NULL VALUE INTO NA 
ARH$ACCT_CLOS_DTE[ARH$ACCT_CLOS_DTE=="NULL"] <- "NA"

### EXTRACT THE CLOSED ACCOUNT DETAILS
CLOSED <- na_omit(ARH, c("ARH$ACCT_CLOS_DTE"))

# USE DPLYR LIBRARY FOR FILTERI the data
library(dplyr)
y <- Filter(Negate(is.null), ACCT_CLOS_DTE)

# USE SQLDF LIBRARY TO FIND THE ACTIVE DATA BASE & GROUPING/PIVOT THE DATA
active=sqldf('SELECT * FROM ARH WHERE LGR_BAL >"0" AND DISB_AMT >"0"')
BR=sqldf('SELECT ZONE,REGION_NAME,BR_CDE,BRNCH_NME,COUNT(DISTINCT ACCT_NBR) AS ACCT_NBR,COUNT(DISTINCT CUST_NBR) AS CUST_NBR FROM active GROUP BY  ZONE,REGION_NAME,BR_CDE,BRNCH_NME ')
write.csv(BR,"BR_WISE_ACTIVE_CUST_STATUS.csv")


#EXTRACT THE DISBURSEMENT FOR A CERTAIN TIME PERIOD
DB=sqldf('SELECT * FROM active WHERE DISB_DTE BETWEEN "2021-09-01" AND "2022-01-31"')	

#FIND THE UNIQUE CUST DISBURSED IN EXTRACTED TIME PERIOD
UNIQUE=DB%>%distinct(CUST_NBR, .keep_all =2)
#CREATE A ZONE WISE SUMMARY
BR=sqldf('SELECT ZONE,COUNT(DISTINCT CUST_NBR) AS CUST_NBR FROM UNIQUE GROUP BY  ZONE ')


#####  OTHERS
NROW(DISB$CUST_NBR)
# EXTRACT THE SPECIFIC VALUES 
DISB %>% filter(LGR_BAL=="30000" & PROD_TYP =="1001") -> LYHD
DISB%>% select(1:19) %>% filter( PROD_TYP =="1001") -> LH


#ARITHMATIC_OPERATORS

DISB$AVERAGE=paste(DISB$TOT_DISB_AMT / DISB$LGR_BAL)
DISB$DIFF=paste(DISB$TOT_DISB_AMT - DISB$LGR_BAL)
DISB$ADD=paste(DISB$TOT_DISB_AMT - DISB$LGR_BAL)
DISB$MULTIPLICATION=paste(DISB$COUNT * DISB$LGR_BAL)
