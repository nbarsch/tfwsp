#' state2counties()
#'
#' Get all counties for a state
#' @param state state to return counties for, may be two character "CO" or full name "Colorado"
#' @export
state2counties <- function(state){
  library(noncensus)
  data(counties)
  if(nchar(state)>2){
    stateabb <- state.abb[which(toupper(state.name)==toupper(state))]
  }else{
    stateabb <- toupper(state)
  }
  return(counties[counties$state==stateabb,])
}
