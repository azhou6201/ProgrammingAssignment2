## The function below creates a list that stores a numeric matrix. 
## This vector is a list containing a function to
## set the value of the matrix, get the value of the matrix,
## set the value of the inverse, and get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, 
	setinverse = setinverse,
	getinverse = getinverse)
}


## This function calculates the inverse of the vector created
## with the above function. It first checks to see if the 
## inverse has already been calculated. If so, it gets the
## inverse from the cache and skips the computation. Otherwise,
## it calculates the inverse and sets the value of the inverse
## in the cache. 

cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return (m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
        ## Return a matrix that is the inverse of 'x'
}
