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

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
