# Getting and Cleaning Data Course Project

This repository contains the Coursera "Getting and Cleaning Data" Course Project R script created by Ilkka Melleri.

This documentation describes how the script works.

## Explanation of the script logic

The script implements the course project requirements step by step in the specified order. This is to help the reader to follow the logic in the script, especially in the context of peer evaluations.

The steps in the script are described in the below subsections.
###STEP 0: Preparatory work
The script reads the source data and loading the dplyr package. 
For the file paths to be correct, the provided source data zip file should be extracted to the same folder as  the script file.

###STEP 1: Merges the train and the test sets to create one data set.
The script does the following actions:

- Renames label and subject variables (V1) into more descriptive ("Activity" and "Subject")
- Renames measurement variables with more descriptive names from "features" variable
- Adds activity and subject columns to both data sets
- Creates the complete data set including train and test
- For readability, removes temporary variables from the environment.

###STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
The script does the following actions:

- Removes duplicate columns from data set (these do not include mean or std values)
- Extracts only those columns that contain "mean()" or "std()" values and keep Activity and Subject

###STEP 3: Uses descriptive activity names to name the activities in the data set
The script renames the values in the Activity column with the actual activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

###STEP 4: Appropriately labels the data set with descriptive variable names.
The script replaces "BodyBody" with "Body", "t" with "Time", "f" with "Frequency", "acc" with "Acceleration" and "Mag" with "Magnitude".


###STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script does the following actions:

- Creates the TidyDataSet variable that is grouped by Activity and Subject.
- For clarity, removes combinedDataSet variable from the environment
- Summarizes each variable data column into the average value of that variable
- Renames column names to indicate that the summarized columns are average values of each variable.
- Writes the result to a text file named "tidyData.txt"

