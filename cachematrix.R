## Functions to calculate the inverse of matrix
## and cache result for faster retrieval
##
## 2014.06.13 v1.0  Per Zacho


## Create object holding matrix and cache of inverse
makeCacheMatrix <- function(m = matrix()) {
  ## Initialize inverse matrix cache
  im <- NULL
  ## Set matrix
  set <- function(newM) {
    m <<- newM
    c <- NULL
  }
  ## Get matrix
  get <- function() {
    m
  }
  ## Set inverse matrix
  setInv <- function(newIM) {
    im <<- newIM
  }
  ## Get inverse matrix
  getInv <- function() {
    im
  }
  ## define object methods
  list(
    set = set,
    get = get,
    setInv = setInv,
    getInv = getInv)
}


## Compute inverse of matrix and store in cache object
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  ## read cache, return if defined
  i <- x$getInv()
  if(!is.null(i)) {
    message("getting cache data")
    return(i)
  }
  ## compute inverse matrix
  i <- solve(x$get())
  ## store in cache object
  x$setInv(i)
  return(i)
}
