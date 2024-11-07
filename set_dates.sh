#!/bin/bash

first_day_of_current_month=$(date +%Y-%m-01)

previous_month_end=$(date -j -v-1d -f "%Y-%m-%d" "$first_day_of_current_month" +%Y%m%d)
previous_month_start=$(date -j -v-1m -f "%Y-%m-%d" "$first_day_of_current_month" +%Y%m01)

# Writing the variables to the .env file
echo "PREVIOUS_MONTH_START=$previous_month_start" > .env
echo "PREVIOUS_MONTH_END=$previous_month_end" >> .env
