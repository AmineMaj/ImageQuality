load Resu.mat;
T=table('Size',[2,3],'VariableTypes',{'string','double','double'});   
for i=0:2
    T.Properties.VariableNames(1:3)={'DataBaseName',Resu.Properties.VariableNames{i+3}}; 
end
        