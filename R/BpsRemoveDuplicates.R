##This code takes the bps csv and filters for 1) unique bps (by bps code) & 2) unique bps models (by bps_model)

library("tidyverse")
library("readr")

#bring in the bps csv
bps_all1 <- read_csv("Input/LF16_BPS_200.csv")
bps_all2 <- bps_all1 #duplicate the bps csv for the 2nd subset of data

#filter for unique BpS (by bps_code) and keep desired columns
bps_all1 <- bps_all1 %>%
  distinct(BPS_CODE, .keep_all = TRUE) %>%
  select(VALUE, BPS_CODE, BPS_NAME, GROUPVEG)
write_csv(bps_all1, "Output/uniquebpscode.csv") #write the output

#filter for unique BpS Model (by model_code) and remove unwanted rows
bps_all2 <- bps_all2 %>%
  distinct(BPS_MODEL, .keep_all = TRUE) %>%
  select(-c(ZONE, R, G, B, RED, GREEN, BLUE))
write_csv(bps_all2, "Output/uniquebpsmodel.csv") #write the output
