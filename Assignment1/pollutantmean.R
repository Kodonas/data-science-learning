#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 2
#Assignment 1; Part 1

pollutantmean <- function(directory, pollutant, id= 1:...){
#if .csv files are not in working dir, then use ./dir or ../dir as an arg

	files <- list.files(path = directory, pattern = "*.csv$", full.names = TRUE)
	data <- data.frame()

	for(i in id) {
		data <- rbind(data, read.csv(files[i]))
	}
	if (pollutant == "sulfate"){
		mean(data$sulfate, na.rm = TRUE)
	}
	else if (pollutant == "nitrate"){
		mean(data$nitrate, na.rm = TRUE)
	}
}