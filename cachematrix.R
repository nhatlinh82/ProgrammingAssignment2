## This script contants 2 functions, one creates a special "matrix" object that can 
## cache its inverse. Another computes the inverse of the special "matrix" returned 
## by the first one. If the inverse has already been calculated (and the matrix has 
## not changed), then the cachesolve should retrieve the inverse from the cache.

## An matrix object assign with makeCacheMatrix function will have 4 functions within it.
## These functions helps cacheSolve to determine if the input matrix was inverted 
## before and return a cache instead of inverting it again.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL #Setting m value to NULL for new input
        set <- function(y) { 
                x <<- y #Substitute the matrix in the main function 
                m <<- NULL #Set m back to NULL
                #This function is used in cachSolve to store a new result of an inverse
        }
        get <- function() x # Returns the matrix x that stored in the main function
        setinverse <- function(inverse) m <<- inverse # Assign intput matrix to m in the main function 
        getinverse <- function() m #Return value of m from the cache
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) 
        #Stored list of function to assign to an object
}

## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
                m <- x$getinverse() #Return value of m from the cache 
                if(!is.null(m)) { #Check if cache data is empty
                        message("getting cached data") # if not empty, it prints out this message
                        return(m) #and print the stored inverse matrix
                }
                data <- x$get() #if the cache data is empty, the input matrix is assigned to this object
                m <- solve(data, ...) #the new matrix used in the solve function to inverse
                x$setinverse(m) #the inverse matrix is stored inside makeCacheMatrix main function
                m #the inverse result is printed
        }
