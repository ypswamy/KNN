bank_full <- read.table("C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/TBD/KNN_Bank/bank-full.txt",sep = ';',header = TRUE)

## DATASET UNDERSTANDING
head(bank_full) ## Displays first 6 rows for each variable
str(bank_full) ## Describes each variables
summary(bank_full) ## Provides basic statistical information of each variable

## DATA EXPLORATION - Check for Missing Data
## Option 1
is.na(bank_full) ## Displays True for a missing value
## Since it is a large dataset, graphical display of missing values will prove to be easier
##Option 2
require(Amelia)
missmap(bank_full,main="Missing Data - Bank Subscription", col=c("red","grey"),legend=FALSE)
## No red colour stripes are visible. hence no missing values.

##Option 3
summary(bank_full) ## displays missing values if any under every variable

## DATA VISUALISATION
## Use Box plots (Only for continuous variables)- To Check Ouliers
boxplot(bank_full$age~bank_full$y, main=" AGE",ylab="age of customers",xlab="Subscribed")
boxplot(bank_full$balance~bank_full$y, main=" BALANCE",ylab="Balance of customers",xlab="Subscribed")
boxplot(bank_full$lastday~bank_full$y, main=" LAST DAY",ylab="Last day of contact",xlab="Subscribed")
boxplot(bank_full$lastduration~bank_full$y, main="LAST DURATION",ylab="Last duration of contact",xlab="Subscribed")
boxplot(bank_full$numcontacts~bank_full$y, main="NUM CONTACTS",ylab="number of contacts",xlab="Subscribed")
boxplot(bank_full$pdays~bank_full$y, main=" Previous DAYS",ylab="Previous days of contact",xlab="Subscribed")
boxplot(bank_full$pcontacts~bank_full$y, main=" Previous Contacts",ylab="Previous Contacts with customers",xlab="Subscribed")


