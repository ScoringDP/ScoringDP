% Copiright (c) 2016 - A. Panichella

function [mutationChildren] = mutationpolynomial(parents,options,GenomeLength,FitnessFcn,state,thisScore,thisPopulation,mutationRate)

range = options.PopInitRange;
lower = range(1,:);
upper = range(2,:);
nm=20;
mutationChildren = zeros(length(parents),GenomeLength);

for i=1:length(parents)
        child = thisPopulation(parents(i),:);
        for var = 1:GenomeLength
            if rand <= 1/GenomeLength;
                % *** APPLY MUTATION ***
                % Obtain the necessary variables.
                r = rand;
                oldVal = child(var);
                lBound = lower(var);
                uBound = upper(var);
                % Do the mutation, ensuring that variable bounds are not breached.
                if(r < 0.5)
                    delta = realpow(2.0 * r, 1.0 / (nm + 1.0)) - 1.0;
                    mutationChildren(i,var) = oldVal + (oldVal - lBound) * delta;
                else
                    delta = 1 - realpow(2.0 * (1.0 - r), 1.0 / (nm + 1.0));
                    mutationChildren(i,var) = oldVal + (uBound - oldVal) * delta;
                end
            end
        end
end
    