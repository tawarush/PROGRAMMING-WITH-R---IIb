##Create an m x n matrix with replicate(m, rnorm(n)) with m=10 column vectors of n=10 elements each, constructed with rnorm(n), which creates random normal numbers.

set.seed(42);
m=10; n=10;
mymat<-replicate(m, rnorm(n)) # create matrix of normal random numbers
mydframe=data.frame(mymat) # transform into data frame

##Then we transform it into a dataframe (thus 10 observations of 10 variables) and perform an algebraic operation on each element using a nested for loop: at each iteration, every element referred by the two indexes is incremented by a sinusoidal function

for (i in 1:m) {
  for (j in 1:n) {
    mydframe[i,j]<-mydframe[i,j] + 10*sin(0.75*pi)
    print(mydframe)
  }
}
##A vectorized solution looks like:
  #### vectorized version
  set.seed(42);
m=10; n=10;
mymat<-replicate(m, rnorm(n))
mydframe=data.frame(mymat)
mydframe<-mydframe + 10*sin(0.75*pi)
## To quantify the execution time for the two solutions.
# measure loop execution
system.time(
  for (i in 1:m) {
    for (j in 1:n) {
      mydframe[i,j]<-mydframe[i,j] + 10*sin(0.75*pi)
    }
  }
)

# measure vectorized execution
system.time(
  mydframe<-mydframe + 10*sin(0.75*pi)
)


