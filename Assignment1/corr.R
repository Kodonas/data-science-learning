#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 2
#Assignment 1; Part 3

corr <- function(directory, threshold=0, id= 1:332) {
#if .csv files are not in working dir, then use ./dir or ../dir as an arg
	files <- list.files(path = directory, pattern = "*.csv$", full.names = TRUE)
	j <- 1
	correlation <- c()
	for (i in id) {
		currentFile <- read.csv(files[i], header = T, sep=",")
		nobs <- sum(complete.cases(currentFile))
		data <- complete.cases(currentFile)
		if (nobs > threshold) {
		correlation[j] <- cor(currentFile$sulfate[data], currentFile$nitrate[data], use="complete.obs")
		j <- j + 1
		}
	}
	result <- correlation
	return (result)
}