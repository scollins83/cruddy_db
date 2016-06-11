library('sqldf')
library('RPostgreSQL')

# This would be better as a hidden file, but this is just a very quick example.
pw <- "password"

# Connect to the database
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname="cruddy_db", host="host",
                 port=port, user="user", password=pw)

# Remove password
rm(pw)

# Function to log a sample row to the database
log_sample <- function(connection, name, desc){
  # This pgsql function already handles potential duplication.
  logger <- sprintf("SELECT cruddy_create_sample('%s','%s')", name, desc)
  print(logger)
  x <- dbGetQuery(connection, logger)
  x
}

result <- log_sample(con, 'RTester', 'Testing from R')

print(result)