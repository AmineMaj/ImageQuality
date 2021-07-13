load Resu.mat;
T=table('Size',[2,3],'VariableTypes',{'string','double','double'});   
for i=0:2
    T.Properties.VariableNames(1:3)={'DataBaseName',Resu.Properties.VariableNames{i+3}}; 
end
CorrelationsTable=table(Resu.MOS50,Resu.Psnr,Resu.Ssim); 

for i=2:size(CorrelationsTable,2)
Values(i-1)= corr(CorrelationsTable.MOS50,table2array( CorrelationsTable(:,i))); %1st corr

end
%T(2)=Values'
        