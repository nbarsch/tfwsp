#' city2zips()
#'
#' Filter zipcodes to certain state
#' @param city city as city name i.e. "Austin" or "Los Angeles" any capitalization but including spaces
#' @param state state to return zips for as two character abb i.e. "CA", "TX", or "NY"
#' @export
city2zips <-function(city,state=NA){
  if(!require(remotes)){install.packages("remotes")}
  if(!require(zipcode)){remotes::install_github("CRAN/zipcode")}
  library(zipcode)
  data(zipcode)
  zipmatch <- zipcode[tolower(zipcode$city)==tolower(city),]
  if(!is.na(state)){
    zipmatch <- zipmatch[zipmatch$state==toupper(state),]
  }
  return(zipmatch)
}

