library(plyr)

#1. Merges the training and the test sets to create one data set.
setwd("C:\\Personal\\DataScientistCourse\\03_GettingAndCleaningData\\Assignment\\GettingAndCleaningData")

#Read files as data table

#Training data
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
#Test data
x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

# row merge training and test samples - append all rows in single data table - x data
x_xis_data <- rbind(x_train, x_test)

#  row merge - append all rows in single data table - Y data
y_axis_data <- rbind(y_train, y_test)

# row merge - create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("UCI HAR Dataset\\features.txt")


# Filters for data columns containing mean and standard deviation(mean or std) in their name
features_with_mean_and_sd <- grep("-(mean|std)\\(\\)", features[, 2])

#Test
#features[features_with_mean_and_sd, 2]

# Extracts only the measurements on the mean and standard deviation for each measurement.
x_xis_data_with_mean_and_sd <- x_xis_data[, features_with_mean_and_sd]


#Appropriately labels the data set with descriptive variable names.
names(x_xis_data_with_mean_and_sd) <- features[features_with_mean_and_sd, 2]

# 3.Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset\\activity_labels.txt")


#update values with activity names
y_axis_data[, 1] <- activities[y_axis_data[, 1], 2]

# correct column name
names(y_axis_data) <- "activity"


#4. Appropriately labels the data set with descriptive variable names

# Update the column name
names(subject_data) <- "subject"

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Combine all data

all_data <- cbind(x_xis_data_with_mean_and_sd, y_axis_data, subject_data)

#check number of columns
length(colnames(all_data))
#contains 68 fields but last two contain activity & subject so taking 66 columns for column mean
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
