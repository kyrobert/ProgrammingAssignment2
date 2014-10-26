## Below are two functions that are used to create a special object that stores
## a matrix and caches its inverse

## The first function is to create a matrix, which is a list containing a function to set the matrix,
## get the matrix, set the inverse of the matrix and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

  m<-NULL
   set<-function(y){
      x<<-y
     m<<-NULL
 }
get<-function() x
setInverse<-function(inverse) m<<-inverse
getInverse<-function() m
list(set=set, get=get,setInverse=setInverse,getInverse=getInverse)

}


## The second function is to calculate the inverse of the special matrix created with the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   m<-x$getInverse()
   if(!is.null(m)){
		message("getting cached data")
		return(m)
   }
   matrix<-x$get()
   m<-solve(matrix, ...)
   x$setInverse(m)
   m
}