# JHU3GettingAndCleaningDataProject

For this project, we will use 'Human Activity Recognition' data collected by UCI's Center for Machine Learning and Intelligent Systems. The data was collected off of Samsung Galaxy S smartphone accelerometers from the recordings of 30 subjects performing activities of daily living (ADL). 

The repository contains:
1) a tidy data set 
2) a link to a Github repo with the script "run_analysis.R" for performing the analysis
3) a code book ("CodeBook.md") that describes the variables, the data, and any transformations or work that was used to clearn up the data

### Input
The data used for this script comes from UCI's Center for Machine Learning and Intelligent Systems. 

https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

### Process
To run the script, copy the "run_analysis.R" script and the data folder. "run_analysis.R" will read the training and test files from the data folder and perform the following steps:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Output
The script "run_analysis.R" creates a csv file called "tidyData.csv". Each row of "tidyData.csv" corresponds to a particular activity and specific subject, and it displays the average of each accelerometer variable. 
