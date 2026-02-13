# Author: Wouter van Dongen
# Date: 13-02-2026

#library(tidyverse)
#library(ggplot2)

mpg_df <- mpg
ggplot(mpg_df) +
  geom_boxplot(aes(y = displ, x = class)) + geom_jitter(aes(y = displ, x = class)) + 
  labs(y = "Displ", x = "Class") + theme_classic()
