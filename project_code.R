library(tidyverse)

# Load the data 
df <- read.csv("test.csv")

# 1. Find and handle missing values
# Checking for NAs
colSums(is.na(df))
# Usually, 'Arrival Delay in Minutes' has NAs; we'll fill them with 0 or the median
df <- df %>% mutate(Arrival.Delay.in.Minutes = replace_na(Arrival.Delay.in.Minutes, 0))

# 2. Encode target column 'satisfaction' as binary
df <- df %>% 
  mutate(satisfaction = ifelse(satisfaction == "satisfied", 1, 0))

# 3. Check for class imbalance
prop.table(table(df$satisfaction))

# 4. Remove irrelevant columns
df <- df %>% select(-X, -id)

# 5. Normalize rating columns (scale 0-5) using Min-Max Scaling
# Formula: (x - min) / (max - min)
normalize <- function(x) { return((x - 0) / (5 - 0)) }
rating_cols <- c("Inflight.wifi.service", "Departure.Arrival.time.convenient", 
                 "Ease.of.Online.booking", "Gate.location", "Food.and.drink", 
                 "Online.boarding", "Seat.comfort", "Inflight.entertainment", 
                 "On.board.service", "Leg.room.service", "Baggage.handling", 
                 "Checkin.service", "Inflight.service", "Cleanliness")

df[rating_cols] <- lapply(df[rating_cols], normalize)

#Phase 2 EDA

# 1. Percentage of passengers satisfied
df %>% count(satisfaction) %>% mutate(pct = n / sum(n) * 100)


# 2. Average age by travel class
Avg_age <- df %>% group_by(Class) %>% summarise(avg_age = mean(Age, na.rm = TRUE))
Avg_age

# 3. Lowest average rating service column
c<- df %>% summarise(across(all_of(rating_cols), mean)) %>% 
  pivot_longer(everything()) %>% arrange(value)
c

# 4. Average Delays and 0 delay count
mean(df$Departure.Delay.in.Minutes)
mean(df$Arrival.Delay.in.Minutes)
sum(df$Departure.Delay.in.Minutes == 0)


# 5. Satisfaction across classes
df %>% group_by(Class) %>% summarise(satisfaction_rate = mean(satisfaction))

# 6. Loyal vs Disloyal satisfaction
df %>% group_by(Customer.Type) %>% summarise(satisfaction_rate = mean(satisfaction))


#Phase 3 Graphical report

# 1. Satisfaction rate by Customer Type (Bar Chart)
ggplot(df, aes(x = Customer.Type, fill = as.factor(satisfaction))) +
  geom_bar(position = "fill") + 
  labs(y = "Proportion", title = "Satisfaction by Customer Loyalty")

# 2. Satisfaction by Class (Grouped Bar Chart)
ggplot(df, aes(x = Class, fill = as.factor(satisfaction))) +
  geom_bar(position = "dodge") +
  labs(title = "Count of Satisfaction Levels by Class")

# 3. Heatmap of correlations
library(reshape2)
cor_matrix <- cor(df[rating_cols])
melted_cor <- melt(cor_matrix)
ggplot(melted_cor, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 4. Distribution of Flight Distance
ggplot(df, aes(x = Flight.Distance, fill = as.factor(satisfaction))) +
  geom_density(alpha = 0.5) +
  labs(title = "Flight Distance Distribution by Satisfaction")