#clear the console 
rm(list = ls())

# Reading the data file
dataentry<-read.csv("dataset_kehinde_elelu.csv", header=T, colClasses = "factor")

#Load the library
library(arules)
library(arulesViz)


newrules <- apriori(dataentry)

# Rules with specified parameter valus
newrules <- apriori(dataentry, parameter = list(minlen=2, maxlen=10, supp=.7, conf=.8))

inspect(newrules)



summary(dataentry)

# Finding interesting rules-1
newrules <- apriori(dataentry, parameter = list(minlen=2, maxlen=3, supp=.7, conf=.7), 
                    appearance=list(rhs=c("Injuryseverity=Fatal", "Injuryseverity=No Injury", 
                                          "SurfaceCondition=Dry", "SurfaceCondition=Wet"), 
                    lhs=c("AlcoholUse_Drv1=Alcohol", "DrugUse_Drv1=Drugs"),
                                 default="lhs"))

inspect(newrules)


# Finding interesting rules-2
newrules <- apriori(dataentry, parameter = list(minlen=2, maxlen=3, conf=.7), 
                    appearance=list(rhs=c("Weather=Clear","SurfaceCondition=Dry"),
                                    lhs=c("AlcoholUse_Drv1=Alcohol", "AlcoholUse_Drv1=No Apparent Influence", 
                                          "DrugUse_Drv1=No Apparent Influence", "DrugUse_Drv1=Drugs",
                                          "AlcoholUse_Drv2=Alcohol", "AlcoholUse_Drv2=No Apparent Influence",
                                          "DrugUse_Drv2=No Apparent Influence", "DrugUse_Drv2=Drugs")))


# Finding interesting rules-3
newrules <- apriori(dataentry, parameter = list(minlen=2, maxlen=3, conf=.7), 
                    appearance=list(rhs=c("AlcoholUse_Drv1=Alcohol", "AlcoholUse_Drv1=No Apparent Influence", 
                                          "DrugUse_Drv1=No Apparent Influence", "DrugUse_Drv1=Drugs",
                                          "AlcoholUse_Drv2=Alcohol", "AlcoholUse_Drv2=No Apparent Influence",
                                          "DrugUse_Drv2=No Apparent Influence", "DrugUse_Drv2=Drugs"),
                                    lhs=c("Injuryseverity=No Injury", "Injuryseverity=Non Incapacitating Injury", 
                                          "Injuryseverity=Possible Injury", "Injuryseverity=Incapacitating Injury",
                                          "Injuryseverity=Fatal",
                                          "Injuryseverity=Suspected Minor Injury", 
                                          "Injuryseverity=Suspected Serious Injury")))


# Finding interesting rules-4
newrules <- apriori(dataentry, parameter = list(minlen=2, maxlen=3, conf=.7), 
                    appearance=list(rhs=c("Injuryseverity=No Injury", "Injuryseverity=Non Incapacitating Injury", 
                                          "Injuryseverity=Possible Injury", "Injuryseverity=Incapacitating Injury",
                                          "Injuryseverity=Fatal",
                                          "Injuryseverity=Suspected Minor Injury", 
                                          "Injuryseverity=Suspected Serious Injury"),
                                    default="lhs"))


# Graphs and Charts
plot(newrules, jitter=0)
plot(newrules, method = "matrix", engine = "html") 
plot(newrules, method="grouped")
plot(newrules, method="graph")

#Injuryseverity
#Collisionmanner
#Lightcondition
#Weather
#SurfaceCondition
#Gender_Drv1 Gender_Drv2
#Violation1_Drv1	AlcoholUse_Drv1	DrugUse_Drv1
#Violation1_Drv2	AlcoholUse_Drv2	DrugUse_Drv2

#redundant <- is.redundant(newrules, measure="confidence")
#which(redundant)
#newrules.pruned <- rules[!redundant]
#newrules.pruned <- sort(rules.pruned, by="lift")
#inspect(newrules.pruned)


