Remove.last.db.row.if.avg <- function(fn) {
  df <- read.csv(fn)
  if ("Average Decibels" %in% df$date) {
    df <- df[1:(dim(df)[1]-1),]
  }
  write.csv(x = df, file = fn, row.names = FALSE)
  df
}