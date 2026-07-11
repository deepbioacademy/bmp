# Vector 
# 1. Create vector using c() function 
ages <- c(12, 34, 15, 16)
ages

# 2. Create vector using : (colon operator)
range <- 1:10
range

# Create vector using seq(start, end, step) function 
seq_vector <- seq(1, 20, 2)
seq_vector

# Subset of a vector 
ages <- c(12, 34, 15, 16, 22, 13, 16)

ages[2]
ages[1:3]

# Factor 
gender <- factor(c("female", "male", "female", "male"))
levels(gender)
class(gender)

# Matrix 
matrix(1:9)
matrix(1:9, nrow = 3)
mat <- matrix(1:9, nrow = 3, ncol = 4)
class(mat)

dim(mat)

# Data Frame 
df <- data.frame(
  "age" = c(21, 22, 14, 15, 16, 23), 
  "sex" = c("male", "female", "male", "female", "male", "female")
)

df 

