plot.state.demog.maps <- function(df, state="new york"){
  pctWhite <- df %>%
    select(region, value = percent_white) %>%
    unique()
  pctBlack <- df %>%
    select(region, value = percent_black) %>%
    unique()
  pctAsian <- df %>%
    select(region, value = percent_asian) %>%
    unique()
  pctHispanic <- df %>%
    select(region, value = percent_hispanic) %>%
    unique()
  
  county_choropleth(pctWhite, 
                    title = "Percent White",
                    state_zoom = state)
  
  county_choropleth(pctBlack, 
                    title = "Percent Black",
                    state_zoom = state)
  
  county_choropleth(pctHispanic, 
                    title = "Percent Hispanic",
                    state_zoom = state)
                    
}