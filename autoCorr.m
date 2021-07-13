load Resu.mat ;
index = 3; %first DB

    C{1,1}='Pearson';
    C{2,1}='Spearman';
    C{3,1}='Kendall';
    for i=5:size(Resu,2)
        C{1,i-3} =corr(Resu{:,index},Resu{:,i},'type','Pearson');
        C{2,i-3} =corr(Resu{:,index},Resu{:,i},'type','Spearman');
        C{3,i-3} =corr(Resu{:,index},Resu{:,i},'type','Kendall');
    end
    
    varNames={'Type'};
    
    for i=5:size(Resu,2)
        varNames{i-3}=Resu.Properties.VariableNames{i};
    end

%var names full
    if index==3
        CT50 = cell2table(C,'VariableNames',varNames); %corr table
    elseif index==4
        CT10 = cell2table(C,'VariableNames',varNames);
    end
    N=C;
    N(:,1) = [];
    M=cell2mat(N); %graph
    bar (M)
    legend(varNames{2:length(varNames)},'Position',[0.2 0.92 0.15 0.0869],'Orientation','horizontal');
