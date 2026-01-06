

### making data for logistic regression
set.seed(69)

length = sample(x = 1:23, size = 150, replace = TRUE)
immature = as.data.frame(length)
immature <- immature %>%
  mutate(maturity = 0)

length = sample(x = 24:45, size = 200, replace = TRUE)
mature = as.data.frame(length)
mature <- mature %>%
  mutate(maturity = 1)

length = sample (x = 22:26, size = 50, replace = TRUE)
maturity = sample(x = 0:1, size = 50, replace = TRUE)
inbetween = data.frame(length, maturity)


fish_maturity <- bind_rows(immature, mature, inbetween)


data("PimaIndiansDiabetes2", package = "mlbench")
PimaIndiansDiabetes2 <- na.omit(PimaIndiansDiabetes2)
# Inspect the data
sample_n(PimaIndiansDiabetes2, 3)
training.samples <- PimaIndiansDiabetes2$diabetes %>% 
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- PimaIndiansDiabetes2[training.samples, ]
test.data <- PimaIndiansDiabetes2[-training.samples, ]