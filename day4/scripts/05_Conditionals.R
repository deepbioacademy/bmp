# if else statement 
if (condition){
  # do something 
}

x <- -10
if(x > 0) {
  print("positive")
} else {
  print("negative")
}

# ifelse() function 
x <- 10
ifelse(x > 0, "positve", "negative")

ages <- c(12, 34, 15, 16, 22, 13, 16)
ifelse(ages > 18, "adult", "child")