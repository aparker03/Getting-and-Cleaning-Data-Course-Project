# Code Book 
### This code book contains the variables used in the *run_analysis.R* and *tidydata.txt*
## **Dataset variables** 
  - **Test**
    - subject_test
    - x_test = set
    - y_test = labels
  - **Train**
    - subject_train
    - x_train = set
    - y_train = labels
## Merged data 
  - **x data**
    - x_data = (x_test, x_train)
  - **y data**
    - y_data = (y_test, y_train)
  - **subject data**
    - subject_data = (subject_test, subject_train)
  - **complete merge**
    - data = (subject_data, x_data, y_data) 
## Activity labels
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING
## Features
  1. TimeBodyAccelerometer
  2. TimeGravityAccelerometer
  3. TimeBodyAccelerometerJerk
  4. TimeBodyGyroscope
  5. TimeBodyGyroscopeJerk
  6. TimeBodyAccelerometerMagnitude
  7. TimeGravityAccelerometerMagnitude
  8. TimeBodyAccelerometerJerkMagnitude
  9. TimeBodyGyroscopeMagnitude
  10. TimeBodyGyroscopeJerkMagnitude
  11. FrequencyBodyAccelerometer
  12. FrequencyBodyAccelerometerJerk
  13. FrequencyBodyGyroscope
  14. FrequencyBodyAccelerometerMagnitude
  15. FrequencyBodyAccelerometerJerkMagnitude
  16. FrequencyBodyGyroscopeMagnitude
  17. FrequencyBodyGyroscopeJerkMagnitude
