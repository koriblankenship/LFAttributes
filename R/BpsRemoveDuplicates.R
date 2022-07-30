##This code takes the bps csv and filters for 1) unique bps (by bps code) & 2) unique bps models (by bps_model)

library("tidyverse")

#bring in the bps csv
bps_all <- read_csv("Input/LF16_BPS_200.csv")

#filter for unique BpS (by bps_code) and keep desired columns
uniquebpscode <- bps_all %>%
  distinct(BPS_CODE, .keep_all = TRUE) %>%
  select(VALUE, BPS_CODE, BPS_NAME, GROUPVEG) 
write_csv(uniquebpscode, "Output/uniquebpscode.csv")  #write2csv

#filter for unique BpS Model (by model_code) and remove unwanted rows
uniquebpsmodel <- bps_all %>%
  distinct(BPS_MODEL, .keep_all = TRUE) %>%
  select(-c(ZONE, R, G, B, RED, GREEN, BLUE))
write_csv(uniquebpsmodel, "Output/uniquebpsmodel.csv") #write2csv
