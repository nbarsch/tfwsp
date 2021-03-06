#' abb2fips()
#'
#' Get fips code from state abbreviation
#' @param stateabb state abb as two character abb i.e. "CA", "TX", or "NY"
#' @export
abb2fips <-function(stateabb){

  
  stateabbs <- c("AL",
                  "AK",
                  "AZ",
                  "AR",
                  "CA",
                  "CO",
                  "CT",
                  "DE",
                  "DC",
                  "FL",
                  "GA",
                  "HI",
                  "ID",
                  "IL",
                  "IN",
                  "IA",
                  "KS",
                  "KY",
                  "LA",
                  "ME",
                  "MD",
                  "MA",
                  "MI",
                  "MN",
                  "MS",
                  "MO",
                  "MT",
                  "NE",
                  "NV",
                  "NH",
                  "NJ",
                  "NM",
                  "NY",
                  "NC",
                  "ND",
                  "OH",
                  "OK",
                  "OR",
                  "PA",
                  "RI",
                  "SC",
                  "SD",
                  "TN",
                  "TX",
                  "UT",
                  "VT",
                  "VA",
                  "WA",
                  "WV",
                  "WI",
                  "WY"
  )
  
  statefips <- c("01",
                 "02",
                 "04",
                 "05",
                 "06",
                 "08",
                 "09",
                 "10",
                 "11",
                 "12",
                 "13",
                 "15",
                 "16",
                 "17",
                 "18",
                 "19",
                 "20",
                 "21",
                 "22",
                 "23",
                 "24",
                 "25",
                 "26",
                 "27",
                 "28",
                 "29",
                 "30",
                 "31",
                 "32",
                 "33",
                 "34",
                 "35",
                 "36",
                 "37",
                 "38",
                 "39",
                 "40",
                 "41",
                 "42",
                 "44",
                 "45",
                 "46",
                 "47",
                 "48",
                 "49",
                 "50",
                 "51",
                 "53",
                 "54",
                 "55",
                 "56"
  )
  
  return(statefips[grep(stateabb,stateabbs)])
  
  
  
  

}

