#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 4
#Assignment 3.3
#Ranking hospitals by outcome in a state.

rankhospital <- function(state, outcome, num = "best") {

	#reading outcome-of-care-measures.csv data
	data <- read.csv("./data/outcome-of-care-measures.csv")

	states <- data[, 7]		#state data is in 7th column
	outcomes <- c("heart attack", "heart failure", "pneumonia")

	#check if state and outcome data are valid
	if (!state %in% states){
		stop ("invalid state")
	}
	else if (!outcome %in% outcomes){
		stop ("invalid outcome")
	}

	#heart attack is in 11th col, heart failure- 17th, pneumonia- 23rd
	if (outcome == "heart attack") {
		outcome_col <- 11
	}
	else if (outcome == "heart failure") {
		outcome_col <- 17
	}
	else {
		outcome_col <- 23
	}

	#ignore warnings
	data[, outcome_col] <- suppressWarnings(as.numeric(levels(data[, outcome_col])[data[, outcome_col]]))
	data[, 2] <- as.character(data[, 2])	#hospital names is in 2nd column
	state_data <- data[grep(state, states), ]	#getting state data

	result <- state_data[order(state_data[, outcome_col], state_data[, 2], na.last = NA), ]

	if (num == "best"){
		numRow <- 1
	}
	else if (num == "worst"){
		numRow <- nrow(result)	#number of the last row
	}
	else {
		numRow <- num
	}
	result[numRow, 2] #Return hospital name in that state with lowest 30-day death rate
}