library(Zelig)

data(turnout)

# Estimate the effect of on race, age, education, and income on voting behavior

# Baseline model
v.model1 <- zelig(vote ~ race + age, data=turnout, model="logit")

summary(v.model1)

# Model with education
v.model2 <- zelig(vote ~ race + age + educate, data=turnout, model="logit")

summary(v.model2)

# Model with education and income
v.model3 <- zelig(vote ~ race + age + educate + income, data=turnout, model="logit")

summary(v.model3)

# Show all three models in one table
library(texreg)

tr.result <- screenreg(list(v.model1, v.model2, v.model3))

library(stargazer)

sg.result <- stargazer(v.model1, v.model2, v.model3, type="text")

