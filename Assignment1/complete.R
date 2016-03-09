#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 2
#Assignment 1; Part 2

complete <- function(directory, id= 1:...){
#if .csv files are not in working dir, then use ./dir or ../dir as an arg

	files <- list.files(path = directory, pattern = "*.csv$", full.names = TRUE)
	data <- data.frame()
	complete <- data.frame()

	for(i in id) {
		data <- rbind(data, read.csv(files[i]))
		nobs <- sum(data$sulfate & data$nitrate, na.rm = TRUE)
		id <- data$ID[1]
		complete <- rbind(complete, data.frame(id, nobs))
	}
	complete
}