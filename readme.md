# Bayesian Best-Worst Method

This repository contains the MATLAB implementation of the Bayesian Best-Worst Method. You need to have JAGS installed on your machine. See the following link to download JAGS:
http://mcmc-jags.sourceforge.net/

For the **Python implementation**, go to https://colab.research.google.com/drive/1jJ_bNbA5NPSsPMfyZiMNIUdUPQCeNtBZ?usp=sharing. You can simply execute it through your browser without requiring to install anything, though you must have a Google account.

### Prerequisites

You need to have JAGS installed on your machine. For doing so, follow the steps below:
 1. Visit the jags development site at http://mcmc-jags.sourceforge.net/ and follow instructions to install the windows version of JAGS.

2. In Windows, go to Control Panel, "System and Security", "System", and click on "Advanced System Settings", followed by "Environment Variables" in the "advanced" tab. Under "System variables", click on Path, and add the jags path to the string. This could look something like "C:\Program Files\JAGS\JAGS-3.4.0\x64\bin" or whatever the path is.

3. If you have Matlab up and running already, quit MATLAB and start again to make sure that the new path is used by MATLAB.

## Run your example

To run your example, open runme.m and replace the following three variable with your own data
```
nameOfCriteria: This variable contains the name of Criteria
A_B: contains the best-to-others vectors of all decision-makers. Each row is dedicated to a best-to-others vector from a decision-maker.
A_W: contains the worst-to-other vectors of all decision-makers. Each row is dedicated to a others-to-worst vector from a decision-maker.
```

## Reference

If you use this implementation, you can cite our paper:
M. Mohammadi, J. Rezaei, Bayesian Best-Worst Method: A Probabilistic Group Decision Making Model, Omega, 2019.

## Contact

If you have any problem executing the code, contact Majid Mohammadi, majid.mohammadi690@gmail.com
