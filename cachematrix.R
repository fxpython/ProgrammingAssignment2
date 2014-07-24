## The first function creates an object out of a matrix that is capable of 
## caching its inverse.

## The second function takes an object created by the fist function as an argument
## and return the inverse of the matrix represented by the object.



makeCacheMatrix <- function(x = matrix()) {
  ## This function requires an invertible matrix as its argument
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(inverse) {
    m <<- inverse
  }
  getInverse <- function() {
    m
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
    ## Returns a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if (!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
