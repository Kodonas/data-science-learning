#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 4
#Assignment 3.1
#Plot the 30-day mortality rates for heart attack.

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#head(outcome)
#ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
jpeg("mortality_hist.jpg")
hist(outcome[, 11], main = "30-day mortality rate for heart attack")