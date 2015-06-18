## Overall method follows the implementation for vectors and their means
## described in the the coursera R programming course
## Implementation might have issues computing and storing large matrices



## Creates a list containing functions to get and set the values
## of the matrix and its inverse

makeCacheMatrix <- function(x = matrix) {
    inverse.matrix <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse.value) inverse.matrix <<- inverse.value
    getinverse <- function() inverse.matrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Relies on the cached inverse of a matrix or
## calculates inverse if required

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse.matrix <- x$getinverse()
    if (!is.null(inverse.matrix)) {
        message("getting cached data")
        return(inverse.matrix)
    }
    matrix <- x$get()
    inverse.matrix <- solve(matrix)
    x$setinverse(inverse.matrix)
    inverse.matrix
}
