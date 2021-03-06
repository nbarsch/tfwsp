#' state2counties()
#'
#' Get all counties for a state
#' @param state state to return counties for, may be two character "CO" or full name "Colorado"
#' @param tfwformat return simple formatting
#' @export
state2counties <- function(state,tfwformat=FALSE){
  library(noncensus)
  data(counties)
  if(nchar(state)>2){
    stateabb <- state.abb[which(toupper(state.name)==toupper(state))]
  }else{
    stateabb <- toupper(state)
  }
  if(tfwformat==FALSE){
    return(counties[counties$state==stateabb,])
  }else{
    tdata <- counties[counties$state==stateabb,]
    names(tdata)[names(tdata)=="state"]<-"stateabb"
    names(tdata)[names(tdata)=="county_name"]<-"countyname"
    tdata <- tdata[,c("countyname","stateabb","state_fips","county_fips")]
    rownames(tdata)<-c(1:nrow(tdata))
    return(tdata)
  }
}
