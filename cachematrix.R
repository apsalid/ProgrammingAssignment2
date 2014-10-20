## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        #variable to store the cached inverse of the matrix
        m <- NULL
	#set function for the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
	#get function for the matrix
        get <- function() x
	#set function for the inverse matrix
        setinversematrix <- function(inversematrix) m <<- inversematrix
	#get function for the inverse matrix
        getinversematrix <- function() m
        list(set = set, get = get,
             setinversematrix = setinversematrix,
             getinversematrix = getinversematrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinversematrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinversematrix(m)
        m




}
