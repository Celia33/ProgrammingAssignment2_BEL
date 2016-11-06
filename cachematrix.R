## This function creates a special matrix, which enable to store in cache its inverse and 
##compute it just once

## Creates a "special" matrix which can cache its inverse

makeCacheMatrix <-function(x = matrix()) 
{
  Minv <- NULL
  set <- function(M) {
    x <<- M
    Minv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) Minv <<- solve
  getmean <- function() Minv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## Calculate the inverse of a "special" matrix, by checking before if it has been computed earlier
## in the cache

cacheSolve <- function(x, ...) {
  Minv <- x$getinv()
  if(!is.null(Minv)) {
    message("getting cached data")
    return(Minv)
  }
  data <- x$get()
  Minv <- solve(data, ...)
  x$setmean(Minv)
  m
}