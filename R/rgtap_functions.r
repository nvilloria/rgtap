#' Extract variables for GEMPACK solution files.
#'
#' @param solution.dir Directory where the solution file is stored.
#' @param solution.name Name of the solution, including suffix
#' @param var.map A GEMPACK variable map to be used with "sltoht". Need to add a reference to the GTAP manual.
#' @param solution.out It's the name (or directory?) where you put the solution
#' @export
#' @examples Examples
#' extractvar()
extractvar <- function (solution.dir, solution.name, var.map, solution.out){
    system(
           paste("sltoht",
                 paste(solution.dir,solution.name,sep=""),
                 paste("-map=",var.map,sep=""),solution.out)
           )
}


#' Read specific header of solution files, convert them into CSV files,
#' and read them into R.
#'
#' @param solution.out It's the name (or directory?) where you put the solution
#' @param csv.out name of the csv file you want to read from.
#' @param header header which is read.
#' @export
#' @examples Examples
#' readsol()
readsol <- function (solution.out, csv.out, header){
    system(
           paste("har2csv",solution.out,csv.out,header,sep=" ")
           )
    y  <- read.csv(csv.out)
}

#' Generates a random string of characters.
#'
#' @param solution.out It's the name (or directory?) where you put the solution
#' @param csv.out name of the csv file you want to read from.
#' @param header header which is read.
#' @export
#' @examples Examples
#' randomstring()
randomstring <- function(n=1, lenght=12)
{
  randomString <- c(1:n)                  # initialize vector
  for (i in 1:n)
  {
    randomString[i] <- paste(sample(c(0:9, letters, LETTERS),
                                    lenght, replace=TRUE),
                             collapse="")
  }
  return(randomString)
}
