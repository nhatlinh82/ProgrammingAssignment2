## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL # setting m value to NULL for new input
        set <- function(y) { #substitute the matrix in the main function 
                x <<- y #Substitute the matrix in the main function 
                m <<- NULL #Set m back to NULL
                #This function is used in cachSolve to store new computation
        }
        get <- function() x # Returns the matrix x that stored in the main function
        setinverse <- function(inverse) m <<- inverse # Assign intput matrix to m in the main function 
        getinverse <- function() m #Return value of m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) #Stored list of function to assign to an object
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                m <- x$getmean()
                if(!is.null(m)) {
                        message("getting cached data")
                        return(m)
                }
                data <- x$get()
                m <- mean(data, ...)
                x$setmean(m)
                m
        }
