
######This is the Coursera "Get Data" Course Project R script created by Ilkka Melleri
######The script implements the course project requirements step by step, indicated as "STEP X".
######This is to help the reader to follow the logic in the script.

#####STEP 0. Preparatory work of reading source files and loading dpylr package.
##Read the data sets from the provided source files.
print("Starting to read input files.")

##Read files relevant for the "test" data set.
testData <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

##Read files relevant for the "train" data set.
trainData <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

features <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activityLabels <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

print("Input files reading complete.")
print("Loading dpylr package")

#Load dplyr package for easier data manipulation
library(dplyr)
print("dpylr package loaded.")



####STEP 1. Merges the train and the test sets to create one data set.

##Rename label and subject variables (V1) into more descriptive ("Activity" and "Subject")
testLabels <- rename(testLabels, Activity = V1)
trainLabels <- rename(trainLabels, Activity = V1)
testSubjects <- rename(testSubjects, Subject = V1)
trainSubjects <- rename(trainSubjects, Subject = V1)

##Rename measurement variables with more descriptive names from "features" variable
measurementNames <- as.character(features$V2)
colnames(testData) <- measurementNames
colnames(trainData) <- measurementNames

##Add activity and subject columns to both data sets
testDataWithLabels <- cbind(testData, testLabels)
trainDataWithLabels <- cbind(trainData, trainLabels)
testDataWithLabelsAndSubject <- cbind(testDataWithLabels, testSubjects)
trainDataWithLabelsAndSubject <- cbind(trainDataWithLabels, trainSubjects)

##Create the complete data set (train and test)
combinedDataSet <- rbind(testDataWithLabelsAndSubject, trainDataWithLabelsAndSubject)

##For readability, remove temporary variables from the environment.
rm(testData, testLabels, testSubjects)
rm(trainData, trainLabels, trainSubjects)
rm(measurementNames, features, activityLabels)
rm(testDataWithLabels, trainDataWithLabels, testDataWithLabelsAndSubject, trainDataWithLabelsAndSubject)



print("Step 1 done.")


####STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

##Remove duplicate columns from data set (these do not include mean or std values)
combinedDataSet <- combinedDataSet[!duplicated(names(combinedDataSet))]

##Extract only those columns that contain "mean()" or "std()" values and keep Activity and Subject.
combinedDataSet <- select(combinedDataSet, contains("mean()"), contains("std()"), Activity, Subject)

print("Step 2 done.")


####STEP 3.Uses descriptive activity names to name the activities in the data set
##Rename the values in the Activity column with the actual activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
combinedDataSet <- mutate(combinedDataSet, Activity =  
                                        ifelse(Activity == 1, "WALKING", 
                                          ifelse(Activity == 2, "WALKING UPSTAIRS",
                                            ifelse(Activity == 3, "WALKING DOWNSTAIRS",
                                              ifelse(Activity == 4, "SITTING",
                                                ifelse(Activity == 5, "STANDING",
                                                  ifelse(Activity == 6, "LAYING", "NA")))))))

print("Step 3 done.")

####4.Appropriately labels the data set with descriptive variable names. 
##Replace "BodyBody" with "Body", "t" with "Time", "f" with "Frequency", "acc" with "Acceleration" and "Mag" with "Magnitude".
names(combinedDataSet) <- gsub("BodyBody", "Body", names(combinedDataSet))
names(combinedDataSet) <- gsub("tB", "TimeB", names(combinedDataSet))
names(combinedDataSet) <- gsub("tG", "TimeG", names(combinedDataSet))
names(combinedDataSet) <- gsub("fB", "FrequencyB", names(combinedDataSet))
names(combinedDataSet) <- gsub("Acc", "Acceleration", names(combinedDataSet))
names(combinedDataSet) <- gsub("Mag", "Magnitude", names(combinedDataSet))


print("Step 4 done.")

#####5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##Create the Tidy Data Set that is grouped by Activity and Subject.
TidyDataSet <- combinedDataSet %>% group_by(Activity, Subject)

##For clarity, remove combinedDataSet from the environment.
rm(combinedDataSet)


##Summarize each variable into the average value of that variable.
TidyDataSet <- TidyDataSet %>% summarise_each(funs(mean))

##Rename column names to indicate that columns are average values of each variable.
names(TidyDataSet)[3:68] <- paste("Average for", names(TidyDataSet)[3:68], sep=" ")

##Write the result to a text file.
write.table(TidyDataSet, "tidyDataSet.txt", row.names=FALSE)

print("Step 5 done. Script complete.")
print("Script complete.")
