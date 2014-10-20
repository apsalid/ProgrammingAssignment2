# To test the functions below after sourcing the .R file:
# > x <- matrix(4:7, 2,2) # Create the desired matrix x
# > mat <- makeCacheMatrix(x) # Use of the makeCacheMatrix function
# > mat$get() # Return the matrix
# > cacheSolve(mat) # This is the inverse
# > cacheSolve(mat) # One more time to check if the inverse matrix is from cache


# makeCacheMatrix: This function returns a list containing functions to:
# 1. Set the value of a matrix
# 2. Get the value of a matrix
# 3. Set the value of the inverse matrix
# 4. Get the value of the inverse matrix
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


# cacheSolve: This function computes the inverse of a matrix. If the 
# inverse of the matrix we want to calculate has been already calculated, 
# the computation won't be repeated and the inverse of the matrix we want will be 
# read from the cache.  
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
