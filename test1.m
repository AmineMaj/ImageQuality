clear 
load('MOS50.mat');
load('MOS100.mat');
load('LiveMos');
dirMetrics = dir('Metrics'); %Folder where metrics are placed
%%%Experimental parameters%%% 
viewingDistance = 50; %Viewing distance in CM
dpi = 90; %DPI of monitor

Names=strings([1,690]); %creat string
InfoImages=dir('Images\Reproduction\1_JPEG2000_Compression');
for i=1:115 
    Names(i,1)=InfoImages(i+2,1).name; %fill names with images names
end

%Sec
InfoImages=dir('Images\Reproduction\2_JPEG_Compression');
for i=116:230 
    Names(i,1)=InfoImages(i-115+2,1).name;
end
%3th
InfoImages=dir('Images\Reproduction\3_Poisson_Noise');
for i=231:345 
    Names(i,1)=InfoImages(i-230+2,1).name;
end
%4th
InfoImages=dir('Images\Reproduction\4_Gaussian_Blur');
for i=346:460 
    Names(i,1)=InfoImages(i-345+2,1).name;
end
%5th
InfoImages=dir('Images\Reproduction\5_SGCK_Gamut_Mapping');
for i=461:575 
    Names(i,1)=InfoImages(i-460+2,1).name;
end
%6th
InfoImages=dir('Images\Reproduction\6_DeltaE_Gamut_Mapping');
for i=576:690 
    Names(i,1)=InfoImages(i-575+2,1).name;
end
%Names is full
MOS50L=[];
for i=1:690
    MOS50L(1,i)=MOS50(i); 
end 
Names = Names(1:690,1); %names is 690x690 -> 690x1
Resu=table(Names); %creat the table
Original=dir('Images\Original\'); %originals path
Original=Original(3:25,1);
Fields={'folder','date','bytes','isdir','datenum'};
Original = rmfield(Original, Fields); %Original Done

ImgAdr=strcat('Images\Original\',InfoImages(3,1).name(1:7),'.bmp'); %C:\Users\anous\Documents\Internship\CIDIQ
Resu.OriginalName=Names;
Resu.MOS50=MOS50;
Resu.MOS100=MOS100;
Resu.LiveMos=LiveMos;
for i=1:690
    Resu.OriginalName{i} = [Resu.OriginalName{i}(1:7),'.bmp'];
end

  f = waitbar(0,'Please wait... calculating quality score for  image');%waitbar; %waitbar
for i=1:690
   if i==1 
ImgAdr=strcat('Images\Original\',Resu.OriginalName(i));
ReferenceImg=imread(ImgAdr); %read Reference image
   elseif Resu.OriginalName(i)==Resu.OriginalName(i-1)
   else 
       ImgAdr=strcat('Images\Original\',Resu.OriginalName(i));
       ReferenceImg=imread(ImgAdr); %read Reference image
   end
addpath(genpath('Images\Reproduction\'));
TestImg=imread(Resu.Names(i)); %read test image
%%
for j=8:8
    %size(dirMetrics,1)
 %looping through all metrics 
    waitbar(i./690,f,'Please wait... calculating quality score for  image');%waitbar; %waitbar
    pause(0.1);
    addpath(genpath(['Metrics\',dirMetrics(j).name])); % Restore original folder, required to some metrics to run
    Resu.(dirMetrics(j).name)(i) = Run(ReferenceImg,TestImg,viewingDistance,dpi); %Call function to calculate metric
    rmpath(genpath(['Metrics\',dirMetrics(j).name])); % Remove path of first functionName from search path.
    %dirMetrics(j).name
end


%%
%Q3(i)=psnr(ReferenceImg,TestImg); %auto this by getting the name from user
%Q4(i)=ssim(ReferenceImg,TestImg);
end
%REQ='Metric to use:1-Pnsr , 2-Ssim  ';
%x = input(REQ);
%if x==1
   % Resu.Psnr=Q3';
%elseif x==2
   % Resu.Ssim=Q4';
%else 
    %disp('Pls choose from choices below');
%end
%Resu.Fsiq=rand(690,1);
%Resu.Metric4=rand(690,1);
%Resu.Metric5=rand(690,1);
%Resu.Metric6=rand(690,1);



