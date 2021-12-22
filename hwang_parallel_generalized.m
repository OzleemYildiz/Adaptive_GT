 % What if we use HWANG in P frequency with each having 2^{alpha} size
%Every ACK deserves split

%P = number of parallel tests
%No error probability for now

function [beam_loc, n_steps] = hwang_parallel_generalized(n,m, valid_loc, beam_loc, location, n_steps, P)
    
    if n == 0
        return
    end
    
    if m <= 0
        return
    end
    
    if P <= 0
        return
    end

%Exhaustive Search Condition
    if n <= 2*m-2
        %Exhaustive Search and I have P frequencies
        size_n = n;
        
        if size_n < P
            %P parallel tests and done, found the location 
            n_steps = n_steps +1;
            beam_loc = [beam_loc,valid_loc(location(valid_loc) ==1)];
        else
            
        end
    else
        
    end
end

