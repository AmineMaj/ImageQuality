load Resu.mat;
MOS = 1; % 1 : 50 ou 0: 100
varNames={'Ref','test'};
if MOS
    
    varNames{3}=Resu.Properties.VariableNames{3};
else
    varNames{3}=Resu.Properties.VariableNames{4};
end

for i=5:size(Resu,2)
varNames{i-1}=Resu.Properties.VariableNames{i};
end

A = nan(size(Resu,1),size(varNames,2));
for i=varNames
A.Properties.VariableNames{i}=Resu.Properties.VariableNames{i};
A.(i-)=Resu.(i);
end
varTypes{1}='string';
for i =2:size(Resu,2)-3
varTypes{i}='double';
end

Correlations1=table('Size',[3,size(Resu,2)-4],'VariableTypes',varTypes);

Correlations1.Properties.VariableNames{1}='CorrType';
%% sec
Correlations1=table('Size',[3,size(Resu,2)-4],'VariableTypes',varTypes);

Correlations1.Properties.VariableNames{1}='CorrType';


indice = 3; %data base : CIDIQ50:3 ; CIDIQ100:4
C{1,1}='Pearson';
C{2,1}='Spearman';
C{3,1}='Kendall';
for i=5:size(Resu,2)
    C{1,i-3} =corr(Resu{:,indice},Resu{:,i},'type','Pearson');
    C{2,i-3} =corr(Resu{:,indice},Resu{:,i},'type','Spearman');
    C{3,i-3} =corr(Resu{:,indice},Resu{:,i},'type','Kendall');
end

% for i =1:size(C,1)
%     for j =1:size(C,2)
%         Correlations1{i,j}=C{i,j};
%     end 
% end


%%
for i =2:size(Resu,2)-3
Correlations1.Properties.VariableNames{i}=Resu.Properties.VariableNames{i+3};%
end

E={'Pearson','Spearman','Kendall'};
Correlations1.CorrType=E';
%CORR2
Correlations2=table('Size',[3,size(Resu,2)],'VariableTypes',varTypes);

    Correlations2.Properties.VariableNames{1}='CorrType';
    

for i =2:size(Resu,2)
Correlations2.Properties.VariableNames{i}=Resu.Properties.VariableNames{i+3};%
end
E={'Pearson','Spearman','Kendall'};
Correlations2.CorrType=E';



% T=table('Size',[2,3],'VariableTypes',{'string','double','double'});
%T.Properties.VariableNames(1:3)={'DataBaseName',Resu.Properties.VariableNames{5},Resu.Properties.VariableNames{6}};
%E={Resu.Properties.VariableNames{3},Resu.Properties.VariableNames{4}};
%T.DataBaseName=E';
%C2={corr(Resu.MOS50,Resu.Psnr),corr(Resu.MOS100,Resu.Psnr)};
%T.Psnr=C2';
%C1={corr(Resu.MOS50,Resu.Ssim),corr(Resu.MOS100,Resu.Ssim)};
%T.Ssim=C1';
