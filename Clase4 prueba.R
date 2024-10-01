install.packages("tidyverse")
install.packages("dplyr")
library(dplyr)
library(tidyverse)
data("iris")
library (datasets) 
# load package
data(iris) 
# import dataset
head (iris) 
# visualize 'head' dataset

summary(iris) #  object summary

str(iris) # examine the structure of the object

fix(iris) # spreadsheet

students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
str(students) 

iris$colors <- ifelse(iris$Species == 'setosa', 'purple', 
                      +                       ifelse(iris$Species == 'versicolor', 'blue', 'pink'))


library (tidyr)
TW_corals<-read.table('tw_corals.txt', header=T, sep='\t', dec='.') 
TW_corals

TW_corals_long <- TW_corals %>%
  pivot_longer(Southern_TW:Northern_Is, names_to = "Region", values_to = "Richness")
# TW_corals_long <-TW_corals %>% pivot_longer(cols = everything(), names_to = "Region", values_to = "Richness") 
TW_corals_long 

#The reverse operation can be made using pivot_wider in order to recreate the wide version of our table:

TW_corals_wide <- TW_corals_long %>%
  pivot_wider( names_from = Region, values_from = Richness) 
TW_corals_wide

#Me too data set 
# with missing data with replace with "n/a"
income<-read.table('metoo.txt',header=T, sep="\t", dec=".", na.strings = "n/a")
income

#the minus in state means that we dont want to do anything with it

income_long <- income %>%  pivot_longer(cols = -state, 
                                        names_to = c("gender","work"), 
                                        names_sep = "_", 
                                        values_to = "income")

income_long

#Obviously, the reverse is possible using pivot_wider:

income_long %>% pivot_wider(names_from = c(gender,work), 
                            values_from = income,
                            names_sep = ".")

#Let’s create a table with a variable called var1:
# Let's first create a delimited table
income_long_var <- income %>%  pivot_longer(cols = -1, 
                                            names_to = "var1", 
                                            values_to = "income")
income_long_var


# Split var1 column into two columns
income_sep <- income_long_var %>%  separate(col = var1, 
                                            sep = "_", 
                                            into = c("gender", "work"))
income_sep

#Row Split var1 into two rows, but that’s not very useful here - just for the demo:

income_long_var %>% separate_rows(var1, sep = "_")


iris$colors <- ifelse(iris$Species == 'setosa', 'purple', 
                                     ifelse(iris$Species == 'versicolor', 'blue', 'pink'))
iris$colors


iris[order(-iris$Sepal.Width),]

iris[order(iris$Sepal.Width),]

iris$colors<-NULL
iris


