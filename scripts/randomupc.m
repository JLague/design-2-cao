function code = randomupc(seed)
    if(nargin == 1)
        rng(seed);
    end
    
    incompleteCode = incompleteRandomCode();
    digit = calcCheckDigit(incompleteCode);
    code = [incompleteCode digit];
end

function incompleteCode = incompleteRandomCode
    incompleteCode = randi([0,9], 1, 11);
end

function digit = calcCheckDigit(incompleteCode)
    FACTORS = [3; 1; 3; 1; 3; 1; 3; 1; 3; 1; 3];
    m = mod(incompleteCode * FACTORS(1:11), 10);
    
    if(m == 0)
        digit = 0;
    else
        digit = 10 - m;
    end
end
