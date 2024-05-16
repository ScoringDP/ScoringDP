% Copiright (c) 2016 - A. Panichella

function xoverKids  = BLX(parents,options,GenomeLength,FitnessFcn,unused,thisPopulation)
% How many children to produce?
nKids = length(parents)/2;
% Allocate space for the kids
xoverKids = zeros(nKids,GenomeLength);
% To move through the parents twice as fast as the kids are
% being produced, a separate index for the parents is needed
index = 1;
[~,col]=size(parents(1));
% for each kid...
for i=1:nKids
    % get parents
    r1 = parents(index);
    index = index + 1;
    r2 = parents(index);
    index = index + 1;
    % Children are arithmetic mean of two parents
    alpha = 0.5;
    beta=(1-alpha);
    x1=min(thisPopulation(r1,:),thisPopulation(r2,:));
    x2=max(thisPopulation(r1,:),thisPopulation(r2,:));
    a=x1-alpha*(x2-x1);
    b=x2+beta*(x2-x1);
    %if i>1
    %    xoverKids(i,:)= mostDist(a,b,1,[a;b]);%rand()*(b-a)+a; %%   
    %else
         xoverKids(i,:)= rand()*(b-a)+a; %% 
    %end
end
[m,n]=size(xoverKids);
for i=1:m
    for j=1:n
        if xoverKids(i,j)< options.LinearConstr.lb(j,1)
           xoverKids(i,j)=options.LinearConstr.lb(j,1);
        end
        if xoverKids(i,j)> options.LinearConstr.ub(j,1)
           xoverKids(i,j)=options.LinearConstr.ub(j,1);
        end
    end
end
end
%min( min(xoverKids))
%max( max(xoverKids))
