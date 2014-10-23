## Caching the Inverse of a Matrix (R Programming assignment 2)
## 
## Solution by Matthew Robinson
##
## Code below is my own work, but is based heavily on the example
## makeVector/cachemean functions given in the assignment

## makeCacheMatrix creates a special "CacheMatrix" which allows you to get/set:
##	  the value of the matrix
##      a cached value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL # initialise cache
		
        set <- function(value) {
                x <<- value
                inverse <<- NULL   # value changed, so cache no longer valid
        }

        get <- function() x

        setSolve <- function(solution) inverse <<- solution

        getSolve <- function() inverse

        # return a list of functions which can be used to 
        # manipulate the CacheMatrix
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
}



## cacheSolve takes a CacheMatrix and returns its inverse
## if a cached value exists then this is used
## otherwise the calculation is performed and the result is cached

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        # can we use the cached result?
        inverse <- x$getSolve()
        if(!is.null(inverse)) {
                # cached result is valid so use this
                return(inverse)
        }

        # otherwise: calculate the inverse; cache it; and return it
        matrix <- x$get()
        inverse <- solve(matrix, ...)
        x$setSolve(inverse)
        inverse
}
