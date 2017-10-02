Information about the R scripts used for the data cleaning project. The project is based on data collected from the accelerometers from the samsung galaxy smarphone. Full description of the dataset is available at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R

This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This file assumes that datazip file has been downloaded and unzipped.