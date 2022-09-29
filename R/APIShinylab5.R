install.packages(c("httr", "jsonlite"))
library("httr")
library("jsonlite")
library("dplyr")
library("ggplot2")
# access to the API's of KPIs on kolada.se
#' Title
#'
#' @return
#' @export koladaapi
#'
#' @examples
koladaapi <- function(){
 url <- "https://api.kolada.se/v2/data/kpi/N00053/municipality/1860"
 r <- httr::GET(url)
 
 muni <- jsonlite::fromJSON(url) # Read from Json format
 muni <- as.data.frame(muni)     # converting data to a data frame
 #muni$values.values
 
 #df_1 = as.data.frame(NA, ncol=3)

 #df = as.data.frame(NA, ncol=3)

  for (i in 1:14) {
   for (j in 1:3) {
     a <- cbind(muni$values.period[i], muni$values.values[[i]][c(2,4)][j,])
     df[nrow(df)+1,1:3] <- a
    }
    #df_1[nrow(df)+1,] <- df
  
  }
  df <- df[-1,]
 
  colnames(df) <- c('year','gender','value')
  return(df)
}
#str(df)
#female=df[df$gender=="K",]
#female
#male=df[df$gender=="M",]
#male
#total=df[df$gender=="T",]
#total


