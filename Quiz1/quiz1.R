#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 1
#Quiz1

#These are only practical questions of the quiz

	data = read.csv("hw1_data.csv")
	good_data <- complete.cases(data$Solar.R, data$Ozone, data$Temp, data$Month)

#11.In the dataset provided for this Quiz, what are the column names of the dataset?

	message("----------\n11. Column names of the dataset are:")
	colnames(data)

#12.Extract the first 2 rows of the data frame and print them to the console. 
#	What does the output look like?
	
	message("\n----------\n12. First two rows of the dataset are:")
	head(data, n=2)

#13.How many observations (i.e. rows) are in this data frame?

	message("\n----------\n13. Number of rows in the dataset:")
	nrow(data)

#14.Extract the last 2 rows of the data frame and print them to the console. 
#	What does the output look like?

	message("\n----------\n14. Last two rows of the dataset are:")
	tail(data, n=2)

#15.What is the value of Ozone in the 47th row?

	message("\n----------\n15. Value of Ozone in 47th row is:")
	data[47,c("Ozone")]

#16. How many missing values are in the Ozone column of this data frame?

	message("\n----------\n16. Number of missing values in the Ozone column:")
	sum(is.na(data[, c("Ozone")]))

#17.What is the mean of the Ozone column in this dataset? 
#	Exclude missing values (coded as NA) from this calculation.

	message("\n----------\n17. The mean of the Ozone column in the dataset is:")
	mean(data$Ozone[!is.na(data$Ozone)])

#18.Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
#	What is the mean of Solar.R in this subset?

	message("\n----------\n18. Mean of Solar.R where Ozone value > 31 and Temp > 90:")
	mean(data$Solar.R[good_data & data$Ozone > 31 & data$Temp > 90])

#19.What is the mean of "Temp" when "Month" is equal to 6?

	message("\n----------\n19. Mean of Temp in June:")
	mean(data$Temp[good_data & data$Month == 6])

#20.What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?

	message("\n----------\n20. Max ozone value of May:")
	max(data$Ozone[good_data & data$Month == 5])



