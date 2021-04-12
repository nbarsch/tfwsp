#' fcty()
#'
#' Get all counties for a state
#' @param state state to return counties for, may be two character "CO" or full name "Colorado"
#' @param cname countyname to find
#' @param tfwformat return simple format
#' @export
fcty <- function(state,cname,tfwformat=TRUE){
  library(noncensus)
  data(counties)
  if(nchar(state)>2){
    stateabb <- state.abb[which(toupper(state.name)==toupper(state))]
  }else{
    stateabb <- toupper(state)
  }
  if(tfwformat==FALSE){
    cdf <- counties[counties$state==stateabb,]
    cdf <- cdf[grep(tolower(cname),tolower(cdf$county_name)),]
    return(cdf)
  }else{
    tdata <- counties[counties$state==stateabb,]
    tdata <- tdata[grep(tolower(cname),tolower(tdata$county_name)),]
    names(tdata)[names(tdata)=="state"]<-"stateabb"
    names(tdata)[names(tdata)=="county_name"]<-"countyname"
    tdata <- tdata[,c("countyname","stateabb","state_fips","county_fips")]
    rownames(tdata)<-c(1:nrow(tdata))
    return(tdata)
  }
}
