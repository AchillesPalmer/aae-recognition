library(readr)
library(ggplot2)
library(broom)
library(pROC)

file_path <- file.path(getwd(), "gpt-results.csv")
df <- read_csv2(file_path)

# Accuracies
acc <- mean(df$result == 1)
print(paste("Accuracy:", round(acc, 3)))
predictors <- c("TAG_NUL", "TAG_NEG", "TAG_AIN",
                "TAG_HAB", "PRED_NUL", "PRED_AIN", "PRED_HAB")

for (predictor in predictors) {
  acc <- mean(df[[predictor]] == 1 & df$result == 1)
  print(paste("Accuracy, where", predictor, "= 1:", round(acc, 3)))
}

model <- glm(
  result ~ TAG_NUL * TAG_NEG * TAG_AIN * TAG_HAB
  # + PRED_NUL + PRED_AIN + PRED_HAB
  , 
  data = df, 
  family = binomial
)

summary(model)

# Coefficient Plot
coef_df <- tidy(model)
ggplot(coef_df, aes(x = term, y = estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = estimate - 1.96 * std.error, ymax = estimate + 1.96 * std.error), width = 0.2) +
  coord_flip() +  
  theme_minimal() +
  labs(title = "Logistic Regression Coefficients", x = "Predictor", y = "Coefficient Estimate") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# ROC Curve
pred_probs <- predict(model, type = "response")
roc_curve <- roc(df$result, pred_probs)
plot(roc_curve, main = "ROC Curve for Logistic Regression", col = "blue")
abline(a = 0, b = 1, col = "red", lty = 2)
