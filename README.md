# Analysis-and-prediction-of-defect-data
Software Analytics - Analysis and prediction of defect data using projection methods

Check out the paper.pdf in this repo.

In spite of diligent planning, good documentation and proper process control during software development, appear- ance of defects are inevitable. 
These software defects may lead to degradation of the quality and even sometimes extremely serious problems. it is important to make conscious efforts to control and minimize these defects by using techniques to allow in-process quality monitoring and control. 
In this paper, I compared Weibull, Rayleigh and Gamma models to check the goodness of the fit for the defect curses in the taken datasets and prediction accuracy with defect curves of prior release and using defect curves of other projects. 

Data - 

Three datasets for this project are used including Eclipse (files E1-E6.txt), OpenBSD (files B1-B7.txt), and Tomcat (files T1-T4.txt). Each file contains a defect curve, i.e. a sequence of numbers of post-release defects per quarter reported for the corresponding version (release) of those software products.

Prepared three other datasets for this project. Each dataset should contain at least three defect curves of releases of a software product of your choice.

You might collected data for projects from Apache and Eclipse foundations. Raw bug data of Apache projects could be collected here https://issues.apache.org. Raw bug data of Eclipse projects could be collected here: http://goo.gl/MPM3B0

2. Research questions

Performed data analysis and machine learning to answer the following research questions for each dataset.

a. How are defect curves of the same product similar to each other?

b. What are the modeling quality (i.e. the goodness of fit) of the defect curves using Weibull, Rayleigh, and Gamma models? To measure modeling quality, we use R^2 and AIC score. What is the best model?

c. What are the prediction accuracy of the defect volume (for each time unit and for the whole reporting time) when using i) only defect curves of prior releases as training data, and ii) only defect curves of other projects?
