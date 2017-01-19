# Import data and merge
playDF <- read.csv("analysis/csv/PLAY-data-collection-geolocations.csv", header=TRUE)
zipDF2 <- read.csv("analysis/csv/zip_code_database.csv", header=TRUE)
zipDF2$Zip5 <- as.numeric(formatC(zipDF2$zip, width = 5, format = "d", flag = "0"))

playMergeDF <- merge(playDF, zipDF2, by.x = "Zip_codes_recruited_from", by.y = "Zip5")

# Get county demographics from chorplethr package
library(choroplethr)
library(dplyr)

data(df_county_demographics)
head(df_county_demographics)

# Get Census data to match FIPS and merge
censusDF <- read.csv("analysis/csv/census-fips.csv", header=TRUE)
head(censusDF)
censusDF$region <- censusDF$State_FIPS*1000 + censusDF$County_FIPS
countyDemoDF <- merge(df_county_demographics, censusDF, by="region")

playMergeAllDF <- merge(playMergeDF, countyDemoDF, by.x = "county", by.y = "County")

# Clean-up 
drops <- c('State.x', 'Zip_codes_recruited_from', 'world_region', 'decommissioned', 'State.y', 'notes')
PLAYDemog <- playMergeAllDF[,!(names(playMergeAllDF) %in% drops)]
# PLAYDemog$region <- formatC(PLAYDemog$region, width = 5, format = "d", flag = "0")


# Reports

library(knitr)
PLAYDemog %>% 
  group_by(PI_Last, county) %>%
  summarize(tot_pop = mean(total_population),
            pct_white = mean(percent_white),
            pct_black = mean(percent_black),
            pct_asian = mean(percent_asian),
            pct_hispanic = mean(percent_hispanic),
            per_capita_income = mean(per_capita_income),
            med_rent = mean(median_rent)) %>%
  kable()

# Export

write.csv(x = PLAYDemog, file = "analysis/csv/PLAY-demog.csv", row.names = FALSE)

# Plots

pctWhite <- PLAYDemog %>%
  select(region, value = percent_white) %>%
  unique()
pctBlack <- PLAYDemog %>%
  select(region, value = percent_black) %>%
  unique()
pctAsian <- PLAYDemog %>%
  select(region, value = percent_asian) %>%
  unique()
pctHispanic <- PLAYDemog %>%
  select(region, value = percent_hispanic) %>%
  unique()

county_choropleth(pctWhite, 
                  title = "Percent White",
                  state_zoom = c("tennessee"))

county_choropleth(pctBlack, 
                  title = "Percent Black",
                  state_zoom = c("tennessee"))

county_choropleth(pctHispanic, 
                  title = "Percent Hispanic",
                  state_zoom = c("tennessee"))
