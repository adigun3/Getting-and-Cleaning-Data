##Getting and Cleaning Data Course Project

###Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The grading will be performed by your peers on a series of yes/no questions related to the project. You are required to submit the following:
*A tidy data set as described below;
*A link to a Github repository with a script (run.analysis.R) for performing the analysis; and
*A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
*A README.md with the script to explain how all of the scripts work and how they are connected.

###Objectives
The R script called run_analysis.R performs and does the following:
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive activity names.
*Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##run_analysis.R
*This script downloads the UCI HAR Dataset data set and puts the zip file into my working directrory "C:/Users/seyifemi/Desktop/Coursera/. After the download is complete, it unzips the file into the UCI HAR Dataset folder "C:/Users/seyifemi/Desktop/Coursera/UCI HAR Dataset.
*The dataset is read in file-by-file and the x, y and subject dataset for train and test are appended together into one data (x_dataset, y_dataset and subject_dataset) using the rbind. These 3 dataset were combined together with data.frame to a single dataset called Data.all
*It extracts just the mean and standard deviation from the features data set. This is done using grep.
*After cleaning the column names, these are applied to the x data frame.
*After loading activity_labels data set, I converted it to lower case using tolower and removes underscore with gsub. Activity_labels and subject column names are named for y_Dataset and subject_Dataset.
*I later merged the three data sets, Subject_Dataset, Datase_all.sub and y_Dataset,  and exported as a text file into Assignment folder. The data is called mrgdata.txt. 
*Finnally I created the mean of activities and subjects into a separate tidy dataset called tidy_data.txt which I exported into the desktop/courser/UCI HAR Dataset folder. The link to this final tidy dataset is submitted with this project. 

