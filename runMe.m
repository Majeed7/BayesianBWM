clear
close
clc

%% An Example of Bayesian BWM; 8 Criteria and 6 Decision makers
%A_B is the matrix whose rows are the best-to-others vector of each
%           decision maker

nameOfCriteria = {'Cost of delivery','Lead time','Non-competitor','Price','Production fac.','Quality','Compliance','Sus. per'};
A_B = [3 4 6 1 5 2 9 7 ;
       1 2 8 4 5 3 9 6;
       2 2 3 1 5 5 9 8 ;
       2 1 8 2 9 3 8 8 ;
       2 4 9 1 4 3 5 5 ;
       1 2 9 1 3 5 5 4 ;];

%A_B is the matrix whose rows are the others-to-worst vector of each
%decision maker
A_W = [ 7     6     4     9     5     8     1     3;
        9     8     2     5     4     5     1     3;
        8     8     5     9     5     5     1     2;
        8     9     2     8     1     8     2     2;
        8     6     1     9     6     7     4     4;
        9     8     1     9     7     5     5     6;];
    
    
 [w_final,wall] = BayesianBWM(A_B,A_W);
 
 averageWeight = mean(w_final)
 
 probability = plotGraph(w_final,nameOfCriteria)