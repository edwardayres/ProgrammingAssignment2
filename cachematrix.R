## These function create a special "matrix" object that can cache its inverse and also either get the
## inverse matrix from the cache (if it has already been calculated) or calculate the inverse matrix 
## (if it hasn't been calculated since the matrix last changed).

## This function creates a special "matrix" object that can cache its inverse


## Create a matrix
makeCacheMatrix <- function(x = matrix()) {

    ##set the inverse of the matriz to NULL
    inverse <- NULL
    set <- function(y){
        x <<- y
        inverse <<- NULL
    }

    ## Get the value of the matrix
    get <- function() x
    
    ## Set the value of the inverse of the matrix
    setinverse <- function(solve) inverse <<- solve
    
    ## Get the value of the inverse of the matrix
    getinverse <- function() inverse
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}



## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If 
## the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    ## Get the cached inverse of the matrix
    inverse <- x$getinverse()
    
    ## If the cached inverse of the matrix is not NULL, then do...
    if(!is.null(inverse)){
        
        ## Output a message saying "getting cached data" and get the inverse from the cache
        message("getting cached data")
        return(inverse)
    }
    
    ## If the cached inverse of the matrix is NULL, get the matrix
    data <- x$get()
    
    ## calculate the inverse of the matrix
    inverse <- solve(data, ...)
    
    ## Set the cached inverse of the matrix based on previous calculation
    x$setinverse(inverse)
    
    ## Output the inverse of the matrix
    inverse
}
