%clc ;
load Resu.mat;
varNames50 = {'Ref','Test','Mos50','Psnr','Ssim','FSIQ','metric4'};%first info table
CIDIQ50=table(Resu.OriginalName,Resu.Names,Resu.MOS50,Resu.Psnr, Resu.Ssim,rand(690,1),rand(690,1),'VariableNames',varNames50 );%database table
varNames1 = {'Ref','Test','Mos100','Psnr','Ssim','FSIQ','metric4'};%2nd table
CIDIQ100=table(Resu.OriginalName,Resu.Names,Resu.MOS100,Resu.Psnr, Resu.Ssim,rand(690,1),rand(690,1),'VariableNames',varNames1 );
Correlations1=table('Size',[3,5],'VariableTypes',{'string','double','double','double','double'});%1st corr table
Correlations1.Properties.VariableNames={'CorrType','Psnr','Ssim','FSIQ','metric4'};
E={'Pearson','Spearman','Kendall'};
Correlations1.CorrType=E'; %corr table is ready

%% sec
for i=4:size(CIDIQ50,2)
    C{1,i-3} =corr(CIDIQ50{:,3},CIDIQ50{:,i},'type','Pearson');
    C{2,i-3} =corr(CIDIQ50{:,3},CIDIQ50{:,i},'type','Spearman');
    C{3,i-3} =corr(CIDIQ50{:,3},CIDIQ50{:,i},'type','Kendall');
end
for i =1:size(C,1)
    for j =1:size(C,2)
        Correlations1{i,j}=C{i,j};
%% 
%correlation calc
C={corr(CIDIQ50.Mos50,CIDIQ50.Psnr,'type','Pearson'),corr(CIDIQ50.Mos50,CIDIQ50.Psnr,'type','Spearman'),corr(CIDIQ50.Mos50,CIDIQ50.Psnr,'type','Kendall')};
Correlations1.Psnr=C';
C={corr(CIDIQ50.Mos50,CIDIQ50.Ssim,'type','Pearson'),corr(CIDIQ50.Mos50,CIDIQ50.Ssim,'type','Spearman'),corr(CIDIQ50.Mos50,CIDIQ50.Ssim,'type','Kendall')};
Correlations1.Ssim=C';
C={corr(CIDIQ50.Mos50,CIDIQ50.FSIQ,'type','Pearson'),corr(CIDIQ50.Mos50,CIDIQ50.FSIQ,'type','Spearman'),corr(CIDIQ50.Mos50,CIDIQ50.FSIQ,'type','Kendall')};
Correlations1.FSIQ=C';
C={corr(CIDIQ50.Mos50,CIDIQ50.metric4,'type','Pearson'),corr(CIDIQ50.Mos50,CIDIQ50.metric4,'type','Spearman'),corr(CIDIQ50.Mos50,CIDIQ50.metric4,'type','Kendall')};
Correlations1.metric4=C';
%
Correlations2=table('Size',[3,5],'VariableTypes',{'string','double','double','double','double'});%2st corr table
Correlations2.Properties.VariableNames={'CorrType','Psnr','Ssim','FSIQ','metric4'};
Correlations2.CorrType=E';
%correlations calc
C={corr(CIDIQ100.Mos100,CIDIQ100.Psnr,'type','Pearson'),corr(CIDIQ100.Mos100,CIDIQ100.Psnr,'type','Spearman'),corr(CIDIQ100.Mos100,CIDIQ100.Psnr,'type','Kendall')};
Correlations2.Psnr=C'; %filling columns
C={corr(CIDIQ100.Mos100,CIDIQ100.Ssim,'type','Pearson'),corr(CIDIQ100.Mos100,CIDIQ100.Ssim,'type','Spearman'),corr(CIDIQ100.Mos100,CIDIQ100.Ssim,'type','Kendall')};
Correlations2.Ssim=C';
C={corr(CIDIQ100.Mos100,CIDIQ100.FSIQ,'type','Pearson'),corr(CIDIQ100.Mos100,CIDIQ100.FSIQ,'type','Spearman'),corr(CIDIQ100.Mos100,CIDIQ100.FSIQ,'type','Kendall')};
Correlations2.FSIQ=C';
C={corr(CIDIQ100.Mos100,CIDIQ100.metric4,'type','Pearson'),corr(CIDIQ100.Mos100,CIDIQ100.metric4,'type','Spearman'),corr(CIDIQ100.Mos100,CIDIQ100.metric4,'type','Kendall')};
Correlations2.metric4=C';
