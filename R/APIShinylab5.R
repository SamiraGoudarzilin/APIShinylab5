install.packages(c("httr", "jsonlite"))
library("httr")
library("jsonlite")
library("dplyr")
library("ggplot2")


url <- "https://api.kolada.se/v2/data/kpi/N00053/municipality/1860"
r <- httr::GET(url)
r$content

httr::status_code(r) # r$status_code
httr::headers(r)
#str(content(r))
#content(r, "text")
muni <- jsonlite::fromJSON(url)
muni <- as.data.frame(muni)
muni
muni$values.values



str(muni)
str(muni$values.values[[1]])
str(muni$values.values[[1]][c(2,4)])
muni$values.values[[1]][c(2,4)]
str(muni$values.period[1])
muni$values.values[[1]][c(2,4)]

#df = paste(muni$values.period[1], unlist(muni$values.values[1]) 
df_1 = as.data.frame(NA, ncol=3)
df = as.data.frame(NA, ncol=3)

for (i in 1:14) {
  for (j in 1:3) {
    a <- cbind(muni$values.period[i], muni$values.values[[i]][c(2,4)][j,])
    df[nrow(df)+1,1:3] <- a
  }
  #df_1[nrow(df)+1,] <- df
  
}
df <- df[-1,]
#rm(df_1)
colnames(df) <- c('year','gender','value')
df

str(df)
female=df[df$gender=="K",]
female
male=df[df$gender=="M",]
male
total=df[df$gender=="T",]
total

# Making a Line Graph with Multiple Lines
ggplot2::ggplot(df, aes(x = year, y = value , colour = gender, group = gender)) +
  geom_line()

ggplot2::ggplot(female, aes(x = year, y = value )) +  geom_line() + geom_point(size = 4, shape = 21, fill = "white")
ggplot2::ggplot(male, aes(x = year, y = value )) +  geom_line()+  geom_point(size = 4, shape = 21, fill = "blue")
ggplot2::ggplot(total, aes(x = year, y = value )) +  geom_line()+  geom_point(size = 4, shape = 21, fill = "black")
