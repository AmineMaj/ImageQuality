load Resu.mat ;
NumberDatapoints = 690; %the entire database contains 690 images,
CounterMetrics=6;
REQ='put column number of the chosen data base ( 3:CIDIQ50 ; 4:CIDIQ100)  '; %columns 3 and 4 : DataBases
index = input(REQ);
if index==3 || index ==4
  
    C{1,1}='Pearson';
    C{2,1}='Spearman';
    C{3,1}='Kendall';
    for i=5:size(Resu,2)
        C{1,i-3} =corr(Resu{:,index},Resu{:,i},'type','Pearson');
        C{2,i-3} =corr(Resu{:,index},Resu{:,i},'type','Spearman');
        C{3,i-3} =corr(Resu{:,index},Resu{:,i},'type','Kendall');
    end
    MOS = 1; % 1 : 50 ou 0: 100
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
    %% plot
    N=C;
    N(:,1) = [];
    M=cell2mat(N); %graph
    bar (M)
    legend(varNames{2:length(varNames)},'Position',[0.2 0.92 0.15 0.0869],'Orientation','horizontal');
    Linearcorr_coefPearson(CounterMetrics) = corr(Resu(:,3), Resu(:,5), 'type','Pearson'); 
   
    LinearHigh_limit_coefPearson(CounterMetrics) = ((exp(2*(1/2*log((1+Linearcorr_coefPearson(CounterMetrics))/(1-Linearcorr_coefPearson(CounterMetrics))) + 1.96*(1/(sqrt(NumberDatapoints-3)))))-1)/(exp(2*(1/2*log((1+Linearcorr_coefPearson(CounterMetrics))/(1-Linearcorr_coefPearson(CounterMetrics))) + 1.96*(1/(sqrt(NumberDatapoints-3)))))+1));
    LinearLow_limit_coefPearson(CounterMetrics) = (exp(2*(1/2*log((1+Linearcorr_coefPearson(CounterMetrics))/(1-Linearcorr_coefPearson(CounterMetrics))) - 1.96*(1/(sqrt(NumberDatapoints-3)))))-1)/(exp(2*(1/2*log((1+Linearcorr_coefPearson(CounterMetrics))/(1-Linearcorr_coefPearson(CounterMetrics))) - 1.96*(1/(sqrt(NumberDatapoints-3)))))+1);

    %
else % if index :=3 or 4
    disp('wrong choice');
end