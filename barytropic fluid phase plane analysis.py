# -*- coding: utf-8 -*-
"""
Created on Mon Feb 15 10:54:58 2021

@author: edwar
"""


import numpy as np
import matplotlib.pyplot as plt
import math as mth

from scipy.integrate import odeint

lna=np.linspace(0,20)
x=1

# function that returns dy/dt
def model(y,lna):
    lmbda=1
    gamma=1
    xprime = - 3 * x + lmbda * mth.sqrt(3 / 2 ) * y ** 2 + (3 / 2) * x * (2 * x ** 2 + gamma * (1 - (x ** 2) - (y ** 2)))
    return xprime


y0 = 1
x0 = 1


# solve ODE
y = odeint(model,y0,lna)
# x = odeint(model,x0,lna)

plt.plot(lna,y)



#%%
x=np.arange(-1,1.1,0.1)
y=np.arange(0,2.1,0.1)

X,Y=np.meshgrid(x,y)

xprime= - 3 * X + lmbda * mth.sqrt(3 / 2 ) * y ** 2 + (3 / 2) * X * (2 * X ** 2 + gamma * (1 - (X ** 2) - (Y ** 2)))
yprime= - lmbda * mth.sqrt(3 / 2) * X * Y + (3 / 2) * Y * (2 * X ** 2 + gamma * (1 -  X ** 2 - Y ** 2))    

