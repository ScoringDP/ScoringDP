% Copiright (c) 2016 - A. Panichella

function [auc] = fitnessGLM(x)
global train_metrics train_oracle;
[m,~]=size(train_metrics);
prediction=glmval(x',train_metrics,'identity');
data = [prediction, train_oracle, train_metrics(:,11)];
data = sortrows(data,-1);

cumulative_bug = 0;
fitness = 0;
for i=1:m
   cumulative_bug = cumulative_bug + data(i,2); 
   fitness = fitness + cumulative_bug * data(i,3);
end
auc = -fitness;
end
