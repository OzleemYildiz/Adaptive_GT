

%% Generalized Parallel Hwang's GBS
%method =6; %1-5, GBS, GT1(both ack), GT3(seperate), GT2 (One ack), Exhaustive Hybrid, Exhaustive
n =8:150;
m =[2,5,10]; %defective
P= 2:5;

n_test_Hwang_general_parallel =zeros(length(m), length(n), length(P));   



trial = 100;
tic



rng(1);
for tr = 1:trial
    for j = 1:length(m)        
        for i = 1:length(n)
            for k =1:length(P)
                location = [ones(1,m(j)), zeros(1,n(i)-m(j))];
                location = location(randperm(length(location))); 

%                 location = histcounts(rand(1, m(j)), 2*pi/n(i) * (0:n(i)))>=1;
                true_loc = find(location == 1 );
%                 true_loc = unique(randi(n(i), 1, m(j)));
%                 location = zeros(1, n(i));
%                 location(true_loc) =1;
   
                [beam_loc, n_steps, ~] = hwang_parallel_generalized(n(i), m(j),1:n(i),{}, location, 0,  P(k));
                n_test_Hwang_general_parallel(j,i,k) = n_test_Hwang_general_parallel(j,i,k) + n_steps;

                
                res_beam = cell2mat(beam_loc);
                res_beam = unique(res_beam);
 
                if sum(true_loc == res_beam', 'all') ~= length(true_loc)
                    error =1 ;
                end
                
            end
        end
    end
end






n_test_Hwang_general_parallel = n_test_Hwang_general_parallel./trial;
save("n_test_Hwang_general_parallel" + m+ ".mat", 'n_test_Hwang_general_parallel')

toc




