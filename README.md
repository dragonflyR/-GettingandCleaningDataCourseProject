# -GettingandCleaningDataCourseProject
Getting and Cleaning Data Course Project

This is a Course Project for the Cousera "Getting and Cleaning Data Course".

The task is to obtain the wearable computing data collected from the accelerometers from the Samsung Galaxy S smartphone, and then prepare tidy data that can be used for later analysis.

The data source of this project was collected from the accelerometers from a Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

And the data was downloaded from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

An analysis R code was created (run_analysis.R), through which five tasks were accomplised, and, for better execution not performed in the sames order as per below:

1. Merges the training and the test sets to create one data set:  The two files (test and train) were merged using rbind into a new dataset "HAR", with 10299 observations of 564 variables, which comprise with subject, group, activity and 561 vectors of numeric data.

2. Extracts only the measurements on the mean and standard deviation for each measurement:  A text match was conducted to identify 79 (out of 561) variables that containts either "mean" or "std".  The resulting dataframe was stored into HARsub.

3. Uses descriptive activity names to name the activities in the data set:  The original lables (1-6) were changed to more descriptive lables in accordance with "activities_label.txt"

4. Appropriately labels the data set with descriptive variable names:  The original txt files were without variable names, which were re-labelled in accordance with "features.txt".

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:  With the group_by and summarise_each commands, a smaller dataset, "HARmean", was created to show the means of measurements for each subject/activity.  "HARmean.txt" was exported into the working directory.
