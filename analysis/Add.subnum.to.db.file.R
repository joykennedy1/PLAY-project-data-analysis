Add.subnum.to.db.file <- function(fn) {
  sub.num <- paste("nyu", substr(fn, 2, 3), sep="_")
  
  in.dat <- read.csv(fn, header = TRUE)
  
  out.dat <- data.frame(sub.num = sub.num,
                        date = in.dat$Date,
                        time = in.dat$Time,
                        db.avg = in.dat$Average,
                        db.peak = in.dat$Peak)
  
  write.csv(x = out.dat,
            file = paste(sub.num, "ambient_db.csv", sep = "_"),
            row.names = FALSE)
}