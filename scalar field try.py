# -*- coding: utf-8 -*-
"""
Created on Thu Feb  4 14:52:28 2021

@author: edward
"""
import numpy as np
import matplotlib.pyplot as plt

H=1
phi=1
phidot=0.01
phidotdot=0.001
t=0
dt=0.001
V0=1
k=1
lmbda=1
dvdt=-lmbda*k*V0*np.exp(-lmbda*k*phi)

T=np.array([])
PHI=np.array([])

while t<20:
    phi=dt*phidot+phi
    phidot=phi-dt*(3*H*phidot+dvdt)
    t=t+dt
    T=np.append(T,t)
    PHI=np.append(PHI,phi)
    
plt.plot(T,PHI)
plt.ylabel('$\phi (t)$')
plt.xlabel('$t$')  
