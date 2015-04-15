# Getting and Cleaning Data Course Project

This repository contains the Coursera "Getting and Cleaning Data" Course Project R script created by Ilkka Melleri.
This documentation describes how the script works and the data variables used.

## 1. Explanation of the script logic

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

# 2. Data variables
The output data set created by the script contains average values of 66 measurements for 30 subjects performing 6 different activities.
The 66 measurements are average values for each subject and activity of either standard deviation or mean.
Moreover, the measurements are of several different dimensions including time, frequency, spatial (X, Y, Z), body and gravity acceleration and jerk.

Each variable name in the data set contains includes the type of the measurement and all dimensions that are included.

The following variables are included in the data set:

- "Activity"                                                 
- "Subject"                                                  
- "Average for TimeBodyAcceleration-mean()-X"                
- "Average for TimeBodyAcceleration-mean()-Y"                
- "Average for TimeBodyAcceleration-mean()-Z"                
- "Average for TimeGravityAcceleration-mean()-X"             
- "Average for TimeGravityAcceleration-mean()-Y"             
- "Average for TimeGravityAcceleration-mean()-Z"             
- "Average for TimeBodyAccelerationJerk-mean()-X"            
- "Average for TimeBodyAccelerationJerk-mean()-Y"            
- "Average for TimeBodyAccelerationJerk-mean()-Z"            
- "Average for TimeBodyGyro-mean()-X"                        
- "Average for TimeBodyGyro-mean()-Y"                        
- "Average for TimeBodyGyro-mean()-Z"                        
- "Average for TimeBodyGyroJerk-mean()-X"                    
-  "Average for TimeBodyGyroJerk-mean()-Y"                    
- "Average for TimeBodyGyroJerk-mean()-Z"                    
- "Average for TimeBodyAccelerationMagnitude-mean()"         
- "Average for TimeGravityAccelerationMagnitude-mean()"      
- "Average for TimeBodyAccelerationJerkMagnitude-mean()"     
- "Average for TimeBodyGyroMagnitude-mean()"                 
- "Average for TimeBodyGyroJerkMagnitude-mean()"             
- "Average for FrequencyBodyAcceleration-mean()-X"           
- "Average for FrequencyBodyAcceleration-mean()-Y"           
- "Average for FrequencyBodyAcceleration-mean()-Z"           
- "Average for FrequencyBodyAccelerationJerk-mean()-X"       
- "Average for FrequencyBodyAccelerationJerk-mean()-Y"       
- "Average for FrequencyBodyAccelerationJerk-mean()-Z"       
- "Average for FrequencyBodyGyro-mean()-X"                   
- "Average for FrequencyBodyGyro-mean()-Y"                   
- "Average for FrequencyBodyGyro-mean()-Z"                   
- "Average for FrequencyBodyAccelerationMagnitude-mean()"    
- "Average for FrequencyBodyAccelerationJerkMagnitude-mean()"
- "Average for FrequencyBodyGyroMagnitude-mean()"            
- "Average for FrequencyBodyGyroJerkMagnitude-mean()"        
- "Average for TimeBodyAcceleration-std()-X"                 
- "Average for TimeBodyAcceleration-std()-Y"                 
- "Average for TimeBodyAcceleration-std()-Z"                 
- "Average for TimeGravityAcceleration-std()-X"              
- "Average for TimeGravityAcceleration-std()-Y"              
- "Average for TimeGravityAcceleration-std()-Z"              
- "Average for TimeBodyAccelerationJerk-std()-X"             
- "Average for TimeBodyAccelerationJerk-std()-Y"             
- "Average for TimeBodyAccelerationJerk-std()-Z"             
- "Average for TimeBodyGyro-std()-X"                         
- "Average for TimeBodyGyro-std()-Y"                         
- "Average for TimeBodyGyro-std()-Z"                         
- "Average for TimeBodyGyroJerk-std()-X"                     
- "Average for TimeBodyGyroJerk-std()-Y"                     
- "Average for TimeBodyGyroJerk-std()-Z"                     
- "Average for TimeBodyAccelerationMagnitude-std()"          
- "Average for TimeGravityAccelerationMagnitude-std()"       
- "Average for TimeBodyAccelerationJerkMagnitude-std()"      
- "Average for TimeBodyGyroMagnitude-std()"                  
- "Average for TimeBodyGyroJerkMagnitude-std()"              
- "Average for FrequencyBodyAcceleration-std()-X"            
- "Average for FrequencyBodyAcceleration-std()-Y"            
- "Average for FrequencyBodyAcceleration-std()-Z"            
- "Average for FrequencyBodyAccelerationJerk-std()-X"        
- "Average for FrequencyBodyAccelerationJerk-std()-Y"        
- "Average for FrequencyBodyAccelerationJerk-std()-Z"        
- "Average for FrequencyBodyGyro-std()-X"                    
- "Average for FrequencyBodyGyro-std()-Y"                    
- "Average for FrequencyBodyGyro-std()-Z"                    
- "Average for FrequencyBodyAccelerationMagnitude-std()"     
- "Average for FrequencyBodyAccelerationJerkMagnitude-std()" 
- "Average for FrequencyBodyGyroMagnitude-std()"             
- "Average for FrequencyBodyGyroJerkMagnitude-std()"  

