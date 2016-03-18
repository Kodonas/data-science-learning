#!/usr/bin/env Rscript

#Donatas Sledzius
#R Programming
#Week 3
#Quiz3

#These are only practical questions of the quiz

	library(datasets)
	data(iris)
	library(datasets)
	data(mtcars)

#1. There will be an object called 'iris' in your workspace. 
#In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 
#Please round your answer to the nearest whole number.
	
	message("----------\n1. Mean of 'Sepal.Length' for the species virginica is:")
	tapply(iris$Sepal.Length, iris$Species == "virginica", mean)

#Continuing with the 'mtcars' dataset from the previous Question, 
#what is the absolute difference between the average horsepower 
#of 4-cylinder cars and the average horsepower of 8-cylinder cars?

	message("----------\n4. Absolute difference is:")
	hp_4cyl <- tapply(mtcars$hp, mtcars$cyl == 4, mean)
	hp_8cyl <- tapply(mtcars$hp, mtcars$cyl == 8, mean)
	abs(hp_4cyl - hp_8cyl)