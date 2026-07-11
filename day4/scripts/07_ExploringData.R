# Load packages 
library(tidyverse)

# Load the data 
data <- read.csv("data/pulse_data.csv")

# Exploring data 
# see columns 
names(data)

# column selection 
data$Gender

# 1. examine first few rows 
head(data)
head(data, 10)

# 2. examine last few rows
tail(data)
tail(data, 10)

# 3. sampling 
sample(data)
sample_n(data, 20)
sample_frac(data, 0.25)

# 4. data types 
glimpse(data)

# 5. run summary 
summary(data)

# 6. convert data type 
data$Gender <- as.factor(data$Gender)
data$Smokes <- as.factor(data$Smokes)
data$Alcohol <- as.factor(data$Alcohol)
data$Exercise <- as.factor(data$Exercise)
data$Ran <- as.factor(data$Ran)


# Data manipulation 
# select columns 
# select single column using column name 
select(data, Gender)

# select multiple columns using column name 
select(data, Age, Gender, Height, Weight)

# select single column using column number 
select(data, 7)

# select multiple column using column number 
select(data, c(1, 3, 5))

# select range of columns 
select(data, 1:5)

# filter 
filter(data, Age > 18)
filter(data, Gender == "Male")
filter(data, Age > 18 & Gender == "Male")
filter(data, Age > 18 | Gender == "Male")

# pipe operator 
selected_data <- select(data, Age, Height, Weight)
filter(selected_data, Age > 18)

data |>
  select(Age, Height, Weight) |> 
  filter(Age > 18)

# New variable 
data <- data |> 
  mutate(bmi = Weight / Height ^ 2)

