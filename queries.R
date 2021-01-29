library(DBI)
library(RMySQL)
MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(DataDB)

library(dplyr)
español <-  DataDB %>% filter(Language == "Spanish")   # Ciudades del país de México con más de 50,000 habitantes
head(español)
class(español)

library(ggplot2)
ggplot(español, aes(x=CountryCode, y=Percentage))+ geom_col() + 
  labs(x = "Lengua",  y = "Pais", title="reto 1")

