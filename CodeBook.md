# Objective

`run_analysis.R` performs the 5 steps described in the course project's definition.

* Merges the training and the test sets to create one data set. Uses `rbind()`
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Extra package used
ddply() from plyr package is used to simplify the coding

# Variables
* Source data from downloaded files stored in `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` variables
* Merged data is stored in `x_axis_data`, `y_axis_data` and `subject_data` 
* `features` contains the correct names for the `x_axis_data` dataset
* 'x_axis_data_with_mean_and_sd' contains the column name with mean and sd
* All data is merged into `all_data` 
* Average data required is stored in 'averages_data'