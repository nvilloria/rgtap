#' Extract variables for GEMPACK solution file(s).
#'
#' \code{extractvar} uses GEMPACK's \code{sltoht} to extract the
#' variables defined in var.map from a GEMPACK solution file (SL4:
#' suffixed .sl4) and writes them to a HAR file (generally suffixed
#' .sol).
#'
#' @param solution.dir Directory where the solution file SL4 is stored.
#' @param solution.name Name of the solution file SL4, without a suffix.
#' @param var.map A GEMPACK variable map to be used with
#' \code{sltoht}. See
#' \url{http://www.copsmodels.com/gpmanual.htm#gpd4.8} for details
#' about \code{sltoht}.
#' @param solution.out Path and name of the HAR with the variables
#' from var.map. Must include a suffix, preferable .sol.
#' @return A HAR file with variables in var.map.
#' @export
#' @examples Examples:
#' \dontrun{ extractvar(solution.dir = "d:/nvilloria/Dropbox/papers/lusupply/SC2010Biofuels/",
#' solution.name = "Long",
#' var.map = "SC2010Biofuels.map",
#' solution.out = "../Results/Long.sol")
#' }
extractvar <- function (solution.dir, solution.name, var.map, solution.out){
    system(
           paste("sltoht",
                 paste(solution.dir,solution.name,sep=""),
                 paste("-map=",var.map,sep=""),solution.out),
        ignore.stdout = TRUE
           )
}


#' Read specific header of solution files, convert them into CSV files,
#' and read them into R.
#'
#' @param solution.dir Directory where the solution file SL4 is stored.
#' @param solution.out Path and name of the HAR with the variables
#' from var.map. Must include a suffix, e.g., .sol or .har.
#' @param csv.out name of the csv file to which header is written to. The resulting csv file will be also read back in R using \code{read.csv()}.
#' @param header number of the header in the map file used in var.map.
#' @export
#' @examples Examples
#' readsol()
readsol <- function (solution.dir, solution.out, csv.out, header){
    har2csv.status <- system(
        paste("har2csv",
              paste(solution.dir,solution.out, sep=""),
              csv.out, header, sep=" "),
        ignore.stdout = TRUE
        )
    if( har2csv.status == 0){
        y  <- read.csv(csv.out)
    }else{
        y <- NA
    }
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
