library(tidyverse)
library(here)

# Plot cumulative uploads to EDI for the NES-LTER project

csv_path <- here('knb-lter-nes_report_20220701.csv')

# This csv output is from the EDI PASTA Upload Report
# https://dashboard.edirepository.org/dashboard/reports/upload_report

df <- read.csv(csv_path)

df$Upload.Date.Time <- parse_datetime(df$Upload.Date.Time)

p <- ggplot(df, aes(x=Upload.Date.Time, y=Count,
                    xmin=as.POSIXct("2017-09-01", "%Y-%m-%d", tz="UTC"))) +
  geom_point() +
  geom_line() +
  xlab("") +
  ylab("Cumulative uploads to EDI")
p

