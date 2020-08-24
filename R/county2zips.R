#' county2zips()
#'
#' Filter zipcodes to certain state
#' @param county city as city name i.e. "Austin" or "Los Angeles" any capitalization but including spaces
#' @param cfips optional county as 5 digit fips code i.e. "08005" for Arapahoe County, Colorado
#' @param state state to return zips for as two character abb i.e. "CA", "TX", or "NY"
#' @param append_county append county name to dataset as column countyname
#' @param append_state append state name to dataset as column statename
#' @export
county2zips <-function(county,state,cfips=NA, append_county=TRUE,append_state=TRUE){
  if(!require(noncensus)){remotes::install_github("CRAN/noncensus")}
  library(noncensus)
  if(is.na(cfips)){
    if(!require(usmap)){remotes::install_github("CRAN/usmap")}
    library(usmap)
    cfips <- fips(state=state, county=county)
  }else{
    cfips <- as.character(cfips)
  }
  data("zip_codes")
  zip_codes$fips <- sprintf("%05d",as.numeric(zip_codes$fips))
  zipcounty <- zip_codes[as.character(zip_codes$fips)==cfips,]
  if(nrow(zipcounty)>0){
    if(isTRUE(append_county)){
      zipcounty$countyname <- county
    }
    if(isTRUE(append_state)){
      zipcounty$statename <- state
    }
  }
  return(zipcounty)
}


