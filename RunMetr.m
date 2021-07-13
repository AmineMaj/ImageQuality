
dirMetrics = dir('Metrics'); %Folder where metrics are placed
%ori = imread('final01.bmp'); %Original image - just for testing 
%rep = imread('final01_d1_l3.bmp'); %reproduction image - just for testing 

%%%Experimental parameters%%% 
%viewingDistance = 50; %Viewing distance in CM
%dpi = 90; %DPI of monitor

for i=3:size(dirMetrics,1) %looping through all metrics 
    f = waitbar(i./size(dirMetrics,1),['Please wait... calculating quality score for ',dirMetrics(i).name]) %waitbar  
    addpath(genpath(['Metrics\',dirMetrics(i).name])); % Restore original folder, required to some metrics to run
    dirMetrics(i).name %Display metric name
    Results.(dirMetrics(i).name) = Run(ori,rep,viewingDistance,dpi) %Call function to calculate metric
    rmpath(genpath(['Metrics\',dirMetrics(i).name])); % Remove path of first functionName from search path.
end

save('MetricResults.mat','Results'); 