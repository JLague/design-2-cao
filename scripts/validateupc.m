function valid = validateupc(codeArray)
    FACTORS = [3; 1; 3; 1; 3; 1; 3; 1; 3; 1; 3; 1];
    valid = mod(codeArray * FACTORS, 10) == 0;
end
