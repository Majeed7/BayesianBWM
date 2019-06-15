# Bayesian Best-Worst Method

This repository contains the MATLAB implementation of the Bayesian Best-Worst Method. You need to have JAGS installed on your machine. See the following link to download JAGS:
http://mcmc-jags.sourceforge.net/

(Make sure that the JAGS bin directory is placed in the Windows path. For example, if your computer is a Windows 7 system, you can do as following: Go to Control Panel, System and Security, System and click on "Advanced System Settings" followed by "Environment Variables". Under System variables, click on Path, and add the jags path to the string. This could look something like "C:\Program Files\JAGS\JAGS-3.3.0\x64\bin" or whatever the path is. Note that you should put a semicolon at the end of the existing path before pasting in the JAGS path. If you have Matlab up and running already, quit Matlab and start it again to make sure that the new path is used by Matlab.)

## Getting Started

To run your example, open runme.m and replace the following three variable with your own data
```
nameOfCriteria: This variable contains the name of Criteria
A_B: contains the best-to-others vectors of all decision-makers. Each row is dedicated to a best-to-others vector from a decision-maker.
A_W: contains the worst-to-other vectors of all decision-makers. Each row is dedicated to a others-to-worst vector from a decision-maker.
```


### Prerequisites

You need to have JAGS installed on your machine. See the following link to download JAGS:
http://mcmc-jags.sourceforge.net/


## Reference

If you use this implementation, you can cite our paper:
M. Mohammadi, J. Rezaei, Bayesian Best-Worst Method: A Probabilistic Group Decision Making Model, Omega, 2019.

## Contact

If you have any problem executing the code, contact Majid Mohammadi, m.mohammadi@tudelft.nl
