
################################
### FUNCTION: run_analysis.R ###
################################

# Set working directory
setwd("C:/Users/H/Desktop/Education/3 Getting & Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
# Install "reshape" package for melting and casting data
install.packages('reshape')
library(reshape)

## PART 1: MERGE THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.
# Activity labels
activity_labels <- read.table("activity_labels.txt")     # 6 obs. of 2 vars
colnames(activity_labels) <- c('ActivityID','ActivityDescription')
# Features
features <- read.table("features.txt")                   # 561 obs. of 2 var
# Subject test and training
subject_train <- read.table("./train/subject_train.txt") # 7352 obs. of 1 var
subject_test <- read.table("./test/subject_test.txt")    # 2947 obs. of 1 var
colnames(subject_train) <- 'Subject'
colnames(subject_test) <- 'Subject'
# X test and training
x_train <- read.table("./train/X_train.txt")             # 7352 obs. of 561 vars
x_test <- read.table("./test/X_test.txt")                # 2947 obs. of 561 vars
colnames(x_train) <- features[,2]       
colnames(x_test) <- features[,2]
# Y test and training
y_train <- read.table("./train/y_train.txt")             # 7352 obs. of 1 var
y_test <- read.table("./test/y_test.txt")                # 2947 obs. of 1 var
colnames(y_train) <- 'Activity'
colnames(y_test) <- 'Activity'
# Merged data set
mergedTrain <- cbind(subject_train, x_train, y_train)
mergedTest <- cbind(subject_test, x_test, y_test)
merged <- rbind(mergedTrain, mergedTest)

## PART 2: EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION
## FOR EACH MEASUREMENT.
extract <- grep("subject|mean|std|activity",
                names(merged),
                ignore.case=TRUE)
extracted <- merged[,extract]

## PART 3: USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA
## SET
subset <- merge(extracted,
                activity_labels, 
                by.x="Activity",
                by.y="ActivityID")
subsetActivities <- subset[2:ncol(subset)]

## PART 4: APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
# This part was completed in Parts 1 and 3

## PART 5: FROM THE DATA SET IN STEP 4, CREATE A SECOND, INDEPENDENT TIDY DATA
## SET WITHT HE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
melt <- melt(subsetActivities,
             id = c('ActivityDescription','Subject'),
             measure.vars = colnames(subsetActivities[2:(ncol(subsetActivities)-1)]))
tidy <- cast(melt, ActivityDescription + Subject ~ variable,mean)
tidyData <- write.table(tidy, file = "tidyData.csv", row.names = FALSE)

