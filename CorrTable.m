%clear 
%clc 
load('Resu.mat');
CorrelationsTable=table(Resu.MOS50,Resu.Psnr,Resu.Ssim); 
CorrelationsTable.Properties.VariableNames= {'MOS50' , 'PSNR', 'SSIM'}; %auto
for i=2:size(CorrelationsTable,2)
Values(i-1)= corr(CorrelationsTable.MOS50,table2array( CorrelationsTable(:,i))); %1st corr

end

%corr(CorrelationsTable.MOS50, CorrelationsTable.PSNR,'type','kendall')
%plot(CorrelationsTable.MOS50, CorrelationsTable.PSNR,'o');