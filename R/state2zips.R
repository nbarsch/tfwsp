#' state2zips()
#'
#' Filter zipcodes to certain state
#' @param state state to return zips for as two character abb i.e. "CA", "TX", or "NY"
#' @export
state2zips <-function(state){
  if(!require(remotes)){install.packages("remotes")}
  if(!require(zipcode)){remotes::install_github("CRAN/zipcode")}
  library(zipcode)
  data(zipcode)
  zipmatch <- zipcode[toupper(zipcode$state)==toupper(state),]
  return(zipmatch)
}

