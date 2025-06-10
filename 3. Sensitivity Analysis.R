# Load packages
library(dplyr)
library(ggplot2)
library(gridExtra)

# Load datasets
data <- read.csv("~/Documents/Cross_sell_view_700k.csv")
df <- na.omit(data)
is.na(df)

ncs <- read.csv("~/Documents/fleetcor/Non_Cross_Sell_View_700k.csv")
clean_ncs <- na.omit(ncs)
sum(is.na(clean_ncs))

#### Bad rate difference by different CLI% for the opt-in customers

# Create column for bad payment flag
df <- df %>%
  mutate(Bad_Payment_Flag = ifelse(DAYS_PAST_DUE > 30, 1, 0),
         Opt_In_Status = ifelse(!is.na(OPT_IN_DATE), 'Opt-In', 'Non-Opt-In'),
         CLI_Percentage = CLI_AMOUNT / CREDIT_LIMIT,
         CLI_Bin = cut(CLI_Percentage, breaks = c(0, 0.25, 0.5, 0.75, 1), labels = c('0-25%', '26-50%', '51-75%', '76-100%')))

# Opt-in vs Non-Opt-in Analysis
opt_in_analysis <- df %>%
  group_by(Opt_In_Status) %>%
  summarise(Bad_Rate = mean(Bad_Payment_Flag))

# CLI% Analysis
cli_analysis <- df %>%
  group_by(CLI_Bin) %>%
  summarise(Bad_Rate = mean(Bad_Payment_Flag))

# Plot
ggplot(cli_analysis, aes(x = CLI_Bin, y = Bad_Rate, fill = CLI_Bin)) +
  geom_bar(stat = "identity") +
  ggtitle("Bad Rate by CLI% for Opt-In Customers") +
  theme_minimal()

#### Bad rate difference between opt-in and non-opt-in customers with the same customer profile

# Non Cross Sell View - Non-Opt-In Customers

clean_ncs <- clean_ncs %>%
  mutate(Bad_Payment_Flag = ifelse(DAYS_PAST_DUE > 30, 1, 0))


clean_ncs <- clean_ncs %>%
  mutate(Credit_Limit_Bin = cut(CREDIT_LIMIT,
                                breaks = quantile(CREDIT_LIMIT, probs = seq(0, 1, by = 0.25), na.rm = TRUE),
                                include.lowest = TRUE,
                                labels = c('Low', 'Medium', 'High', 'Very High')))

# Calculate bad rate by Credit Limit Bin
credit_limit_analysis <- clean_ncs %>%
  group_by(Credit_Limit_Bin) %>%
  summarise(Bad_Rate = mean(Bad_Payment_Flag), .groups = 'drop')

# Plot
non_opt_in <- ggplot(credit_limit_analysis, aes(x = Credit_Limit_Bin, y = Bad_Rate, fill = Credit_Limit_Bin)) +
  geom_bar(stat = "identity") +
  labs(title = "Bad Rate by Credit Limit Category for Non-Opt-In",
       x = "Credit Limit Category",
       y = "Bad Rate") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()


# Cross Sell View - Opt-In Customers
df <- df %>%
  mutate(Credit_Limit_Bin1 = cut(CREDIT_LIMIT,
                                breaks = quantile(CREDIT_LIMIT, probs = seq(0, 1, by = 0.25), na.rm = TRUE),
                                include.lowest = TRUE,
                                labels = c('Low', 'Medium', 'High', 'Very High')))

# Calculate bad rate by Credit Limit Bin
credit_limit_analysis1 <- df %>%
  group_by(Credit_Limit_Bin1) %>%
  summarise(Bad_Rate = mean(Bad_Payment_Flag), .groups = 'drop')

# Plot
opt_in <- ggplot(credit_limit_analysis1, aes(x = Credit_Limit_Bin1, y = Bad_Rate, fill = Credit_Limit_Bin1)) +
  geom_bar(stat = "identity") +
  labs(title = "Bad Rate by Credit Limit Category for Opt-In",
       x = "Credit Limit Category",
       y = "Bad Rate") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

# Compare Bad Rate Difference Between Opt-In and Non-Opt-In Customers
grid.arrange(opt_in, non_opt_in, ncol = 2)
