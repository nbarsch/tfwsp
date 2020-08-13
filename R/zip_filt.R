#' zip_filt()
#'
#' Filter zipcodes to certain state
#' @param state state as two character abb i.e. "CA", "TX", or "NY"
#' @param indata data.frame object to filter
#' @param zipcol column name of zipcode column in indata, default="zipcode"
#' @export
zip_filt <-function(indata,state, zipcol="zipcode"){
  if(!require(remotes)){install.packages("remotes")}
  if(!require(zipcode)){remotes::install_github("CRAN/zipcode")}
  library(zipcode)
  data(zipcode)
  zipstate <- zipcode[zipcode$state==state,]
  zipstate <- data.frame(zipstate,stringsAsFactors = F)
  indata <- data.frame(indata,stringsAsFactors = F)
  indata$teczip <- indata[,paste0(zipcol)]
  indata <- indata[indata$teczip%in%zipstate$zip,]
  indata$teczip <- NULL
  return(indata)
}
