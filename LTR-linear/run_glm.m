global train_metrics train_oracle;
training=readtable(train_file);
train_metrics=[training.wmc, training.dit, training.noc, training.cbo, training.rfc, training.lcom, training.ca, training.ce, training.npm, training.lcom3, training.loc, training.dam, training.moa, training.mfa, training.cam, training.ic, training.cbm, training.amc, training.max_cc, training.avg_cc];
train_oracle=training.bug;

global test_metrics test_oracle;
test=readtable(test_file);
test_metrics=[test.wmc, test.dit, test.noc, test.cbo, test.rfc, test.lcom, test.ca, test.ce, test.npm, test.lcom3, test.loc, test.dam, test.moa, test.mfa, test.cam, test.ic, test.cbm, test.amc, test.max_cc, test.avg_cc];
test_oracle=test.bug;


tot_runs=30;
nvar=21;
for nrun=1:tot_runs
    population = [];
    options = gaoptimset;
    options = gaoptimset(options,'PopulationSize', 200);
    options = gaoptimset(options,'EliteCount', 5);
    options = gaoptimset(options,'StallGenLimit', 100);
    options = gaoptimset(options,'TolFun', 0);
    options = gaoptimset(options,'TolCon', 0);
    options = gaoptimset(options,'InitialPopulation', population);
    options = gaoptimset(options,'SelectionFcn', {@selectionroulette});
    options = gaoptimset(options,'CrossoverFcn', @BLX);
    options = gaoptimset(options,'MutationFcn', {@mutationpolynomial});
    options = gaoptimset(options,'Display', 'none');
    options = gaoptimset(options,'Generations',400);
    [x,fval,exitflag,output,population,score] = ga(@fitnessGLM,nvar,[],[],[],[],[],[],[],[],options);
   
    result.solutions(nrun,:)=x;
    result.ga.fval(nrun,:)=fval;
    evaluateGLM(result.solutions(nrun,:)', test_file,nrun);
end