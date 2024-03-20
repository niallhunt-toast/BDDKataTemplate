# Mr.Bean.Counter - "Very good! Now we have a lot of historical data for categories
# as well. I took this course on Business Intelligence at the University of Baloney,
# and would like to apply some of this to the data we have!

# I want your program to be able to calculate the similarity of two ROS files. If we
# can do this, we could let your program tell us how similar stores are by comparing
# the similarity of their ROS files over time.

# If we have the pattern analysis in place, stores with similar ROS files could be
# targeted with similar advertisement campaigns!"

# You - "Ok, so we should be able to pass two files to the program, and it should
# output a number between 0 and 1?"

# Mr.Bean.Counter - "Yes, obviously the same ROS file should be 1 (similar to itself).
# But two files that contain the same 1 item, except for one extra in one of the files,
# can only be 0.5 similar. We consider two items to be equal for now, regardless of sales,
# as long as the same item exists in both ROS."

# Hint: have you heard of the “Jaccard index”?

# -------- UNCOMMENT THE BELOW WHEN YOU GET TO THIS STEP --------

#Feature: computing the similarity of two ROS files
#    Scenario: identic files
#        Given a set of items
#            | name             | quantity | price |
#            | bread            | 1        | 1     |
#            | 12-pack of eggs  | 1        | 1     |
#            | milk (1L)        | 1        | 1     |
#            | coca cola (33cl) | 1        | 1     |
#            | carrots          | 1        | 1     |
#            | bananas          | 1        | 1     |
#        Given a set of comparison items
#            | name             | quantity | price |
#            | bread            | 1        | 1     |
#            | 12-pack of eggs  | 1        | 1     |
#            | milk (1L)        | 1        | 1     |
#            | coca cola (33cl) | 1        | 1     |
#            | carrots          | 1        | 1     |
#            | bananas          | 1        | 1     |
#        When we compute the similarity index
#        Then we will have a similarity index of 1.0
#
#    Scenario: partially equal files (subset)
#        Given a set of items
#            | name             | quantity | price |
#            | bread            | 1        | 1     |
#            | 12-pack of eggs  | 1        | 1     |
#            | milk (1L)        | 1        | 1     |
#            | coca cola (33cl) | 1        | 1     |
#            | carrots          | 1        | 1     |
#            | bananas          | 1        | 1     |
#        Given a set of comparison items
#            | name             | quantity | price |
#            | bread            | 2        | 0.5   |
#            | 12-pack of eggs  | 2        | 0.5   |
#            | milk (1L)        | 2        | 0.5   |
#            | coca cola (33cl) | 2        | 0.5   |
#        When we compute the similarity index
#        Then we will have a similarity index of 0.667
#
#    Scenario: partially equal files (intersection)
#        Given a set of items
#            | name             | quantity | price |
#            | 12-pack of eggs  | 2        | 0.75  |
#            | milk (1L)        | 2        | 0.75  |
#            | coca cola (33cl) | 2        | 0.75  |
#            | carrots          | 2        | 0.75  |
#            | bananas          | 2        | 0.75  |
#
#        Given a set of comparison items
#            | name             | quantity | price |
#            | bread            | 2        | 0.5   |
#            | 12-pack of eggs  | 2        | 0.5   |
#            | milk (1L)        | 2        | 0.5   |
#            | coca cola (33cl) | 2        | 0.5   |
#        When we compute the similarity index
#        Then we will have a similarity index of 0.5
