# set directory 
setwd("./R Programming/UCI HAR Data")
# load dplyr
library(dplyr)

# unzip the downloaded data file
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
unzip(filename) 

# read the data (activity labels, features, test, training)

# activity labels
activity_labels <- read.table(file = "activity_labels.txt", header = FALSE)
# features
features <- read.table(file = "features.txt", header = FALSE) 
# test (subject_test, X_test, y_test)
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
x_test   <- read.table("./test/X_test.txt", header = FALSE)
y_test   <- read.table("./test/y_test.txt", header = FALSE) 

# training (subject_train, X_train, y_train)
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
x_train   <- read.table("./train/X_train.txt", header = FALSE)
y_train   <- read.table("./train/y_train.txt", header = FALSE) 

# merge the test and training sets into one data set

# bind the rows (subject, x, y)
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)

# name the variables (subject, x, y)
colnames(subject_data) <- "subject"
colnames(x_data) <- features[,2]
colnames(y_data)<- "activity"

# bind the columns (subject, x, y)
data <- cbind(subject_data, x_data, y_data)

# extract the mean and standard deviation
subdata <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
subnames <- c(as.character(subdata), "subject", "activity")
data <- subset(data, select = subnames)

# descriptive activity names
data$activity <- factor(data$activity, levels = activity_labels[,1], labels = 
                        activity_labels[,2])

# label the data set with descriptive variable names
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("^t", "Time", names(data))

# create a second, independent tidy data set with the average of each variable 
# for each activity and each subject
tidydata <- data %>%
    group_by(activity) %>%
    summarize_all(funs(mean))
write.table(tidydata, file = "tidydata.txt", row.name = FALSE)