function row = upc2info(code)
    filename = "upcPrice.txt";
    
    opts = detectImportOptions(filename, 'NumVariables', 4);
    opts.VariableNames(1) = {'Code'};
    opts.VariableNames(2) = {'Quantite'};
    opts.VariableNames(3) = {'Desc'};
    opts.VariableNames(4) = {'Prix'};
    
    db = readtable(filename, opts);

    codeNum = str2double(strrep(num2str(code), ' ', ''));
    row = db(ismember(db.Code, codeNum),:);
end
    