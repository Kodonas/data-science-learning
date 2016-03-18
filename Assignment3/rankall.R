#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 4
#Assignment 3.4
# Ranking hospitals in all states.

rankall <- function(outcome, num = "best") {

	#reading outcome-of-care-measures.csv data
	data <- read.csv("./data/outcome-of-care-measures.csv")

	states <- levels(data[, 7])	#state data is in 7th column

	#check if outcome data are valid. There is no state argument, so I don't check it.
	outcomes <- c("heart attack", "heart failure", "pneumonia")
	if (!outcome %in% outcomes){
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
	rank <- vector()

	for(i in 1:length(states)) {

		state_data <- data[grep(states[i], data$State), ]	#getting state data
		result <- state_data[order(state_data[, outcome_col], state_data[, 2], na.last = NA) , ]

		if (num == "best"){
			numRow <- 1
		}
		else if (num == "worst"){
			numRow <- nrow(result)	#number of the last row
		}
		else {
			numRow <- num
		}
		hospital <- result[numRow, 2]

		rank <- append(rank, c(hospital, states[i]))
	}

	rank <- as.data.frame(matrix(rank, length(states), 2, byrow = TRUE))
	colnames(rank) <- c("hospital", "state")
	rownames(rank) <- states

	rank
}