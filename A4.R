pacman::p_load(tidyverse, rio, GGally)

file = "https://raw.githubusercontent.com/ucf2022/COP4283/main/social%20media%20influencers%20-%20Tiktok%20sep%202022.csv"

df = import(file) %>%
  as_tibble()
View(df)

pat = '([+-]?(?=\\.\\d|\\d)(?:\\d+)?(?:\\.?\\d*))(?:[eE]([+-]?\\d+))?'

df1 = df %>%
  transmute(Subscribers = str_extract(df$Subscribers, pat),
            `Views avg.` = str_extract(df$`Views avg.`, pat),
            `Likes avg.` = str_extract(df$`Likes avg.`, pat),
            `Comments avg.` = str_extract(df$`Comments avg.`, pat),
            `Shares avg.` = str_extract(df$`Shares avg.`, pat)
            ) %>%
  sapply(as.numeric)

df1 %>%
  cor() %>%
  round(2) %>%
  print()

ggcorr(df1)

