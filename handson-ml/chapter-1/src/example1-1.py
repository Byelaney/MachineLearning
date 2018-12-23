import  matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import sklearn

# import os
# cwd = os.getcwd()

# Load the data
oecd_bli = pd.read_csv("../datasets/oecd_bli_2015.csv", thousands=',')
gdp_per_capita = pd.read_csv("../datasets/gdp_per_capita.csv", thousands=',', delimiter='\t', encoding='latin1', na_values="n/a")

# Prepare the data
country_stats = prepare_country_stats(oecd_bli, gdp_per_capita)
x = np.c_[country_stats["GDP per capita"]]
y = np.c_[country_stats["Life satisfaction"]]

# Visualize the data
country_stats.plot(kind='scatter', x="GDP per capita", y="Life satisfaction")
plt.show()

# Select a linear model
lin_reg_model = sklearn.linear_model.LinearRegression()

# Train the model
lin_reg_model.fit(x, y)

# Make a prediction for Cyprus
x_new = [[22587]] # Cyprus' GDP per capita
print(lin_reg_model.predict(x_new)) # outputs [[5.96242338]]