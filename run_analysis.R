library(dplyr)
library(stringr)

# Import all the data into R
activity_labels <- read.table("activity_labels.txt")
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
features <- read.table("features.txt", as.is=TRUE)

features <- features[,2]
#features <- lapply(features, function(x) gsub("[()]","",x))
#features <- lapply(features, function(x) gsub("-","_",x))

names(subject_test) <- "subject"
names(y_test) <- "activity"
act_test <- lapply(y_test, function(i) {activity_labels[i,2]})
names(subject_train) <- "subject"
names(y_train) <- "activity"
act_train <- lapply(y_train, function(i) {activity_labels[i,2]})
# Task 3 completed: Uses descriptive activity names to name the activities in the data set.

test <- cbind(subject_test, group="test", act_test, x_test)
train <- cbind(subject_train, group="train", act_train, x_train)
HAR <- rbind(test,train)
# Task 1 completed: Merges the training and the test sets to create one data set.

names(HAR)[4:564] <- features
# Task 4 completed: Appropriately labels the data set with descriptive variable names.

keep <- lapply(features$V2,function(x){str_detect(x,"mean") | str_detect(x, "std")})
keep2 <- c(TRUE, TRUE, TRUE, keep)
HARsub <- HAR[,1:3]
j <- 3L
for (i in 4:564) (if (keep2[i]==TRUE) {
      HARsub <- cbind(HARsub, HAR[,i])
      j <- j+1
      names(HARsub)[j] <- names(HAR)[i]
})

# Task 2 completed: Extracts only the measurements on the mean and standard deviation for each measurement.

HARex <- group_by(HARsub, subject, activity)
HARmean <- summarise_each(HARex, funs(mean), -one_of("subject", "group", "activity"))

write.table(HARmean, file="HARmean.txt", row.names = FALSE)

# Task 5 completed: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
