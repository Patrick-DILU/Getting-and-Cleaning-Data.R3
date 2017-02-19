setwd("C:\\Users\\Di LU\\Desktop\\Coursera\\R.3\\W4")
getwd()

# Getting data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reading data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./data/UCI HAR Dataset/features.txt")
activityLabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")

#Setting column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merging datasets into one
mergeTrain <- cbind(y_train, subject_train, x_train)
mergeTest <- cbind(y_test, subject_test, x_test)
wholeDataset <- rbind(mergeTrain, mergeTest)

#Extracting measurements on the mean and standard deviation for each measurement
colNames <- colnames(wholeDataset)
moments <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
momentsDataset <- wholeDataset[ , moments == TRUE]

#Using descriptive activity names to name the activities in the data set
setWithActivityNames <- merge(momentsDataset, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr);
newDataset <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
newDataset <- newDataset[order(newDataset$subjectId, newDataset$activityId),]
write.table(newDataset, "newDataset.txt", row.name=FALSE)













