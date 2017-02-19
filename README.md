# Getting-and-Cleaning-Data.R3

### Contents:
+ A run_analysis.R script -- that performs required data cleaning analysis.
+ A code book -- that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
+ A README -- that explains the analysis files is clear and understandable.

### Introduction:

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Cleaning Work:

1. Reads the data from url indicated above and get datasets x_train, y_train, subject_train, x_test, y_test, subject_test and feature factors features, activityLabels.

2. Sets the column names according to activityLabels.

3. Merges the training and the test sets to create one data set.

4. Extracts only the measurements on the mean and standard deviation for each measurement.

5. Uses descriptive activity names to name the activities in the data set.

6. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
