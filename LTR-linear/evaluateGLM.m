function [auc,graph] = evaluateGLM(glm, test_file, nrun)
global test_metrics;
[m,~]=size(test_metrics);

prediction=glmval(glm,test_metrics,'identity');
file_split = strsplit(test_file, '/');
file_name = file_split(8) + '_' + nrun;
dlmwrite(test_file + ".ltrLinear." + nrun +  ".score", prediction);
end


