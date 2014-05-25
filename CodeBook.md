# Codebook

## Original Data

The original data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This data consists the acclerometer gyroscope readings that have been pre-processed as follows:
* Noise filters applied
* Seperation of acceleration into gravity and body components
* A total of 561 features were derived for frequency and time domains, see above link for full description of all original variables.
* The data is labelled by subject and by activity.

## Transformations Applied to Obtain Tidy Data

* The data was loaed into R as a set of data frames
* The subject and activity labels were added to test and training data frames
* The test and training data frames were combined
* The activity ids were replaced with verbose activity labels, and converted to factors (along with the subject ids)
* The number of variables was reduced, keeping only the mean and standard deviation of the derived frequency and time domain variables
* Variables names were transformed to verbose form:
	- "Acc" -> "Accelerometer"
	- "Gyro" -> "Gyroscope"
	- "t" -> "time"
	- "f" -> "frequency"
	- "mag - "Magnitude"
* Non-alphanumeric characters were removed from variables names, and camelCase was used to ensure readability.
* Mislabelled variable names (with "BodyBody" instead of "Body") were corrected.

## Variables

The variables are the means and standard deviations of these quantities, with measurements given in x, y and z directions and also for overll magnitude.
* timeBodyAccelerometer
* timeGravityAccelerometer
* timeBodyAccelerometerJerk
* timeBodyGyroscope
* timeBodyGyroscopeJerk
* frequencyBodyAccelerometer
* frequencyBodyAccelerometerJerk
* frequencyBodyGyroscope
* frequencyBodyGyroscopeJerk (magnitude only)
Note the following:
* Body refers to the fact that effect of Earth's gravitational field has been removed from measurement.
* Jerk refers to the derivative of the acceleration (accelerometer) or angular velocity (gyroscope)