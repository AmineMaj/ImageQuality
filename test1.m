clear 
clc 
load('MOS50.mat');
load('MOS100.mat');
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
Original=dir('C:\Users\anous\Documents\Internship\CIDIQ\Images\Original\');
Original=Original(3:25,1);
Fields={'folder','date','bytes','isdir','datenum'};
Original = rmfield(Original, Fields); %Original Done
%solution 1
ImgAdr=strcat('C:\Users\anous\Documents\Internship\CIDIQ\Images\Original\',InfoImages(3,1).name(1:7),'.bmp');
%img=imread(ImAdr); %read image
%ImAdr=strcat('C:\Users\anous\Documents\Internship\CIDIQ\Images\Reproduction\6_DeltaE_Gamut_Mapping\',InfoImages(3).name);
%test=imread(ImAdr);
%Q=psnr(img,test);
%solution 2 
%reference image in Original and test image in Names !
Resu.OriginalName=Names;
Resu.MOS50=MOS50;
Resu.MOS100=MOS100;
for i=1:690
    Resu.OriginalName{i} = [Resu.OriginalName{i}(1:7),'.bmp'];
end

for i=1:690
   
ImgAdr=strcat('C:\Users\anous\Documents\Internship\CIDIQ\Images\Original\',Resu.OriginalName(i));
ReferenceImg=imread(ImgAdr); %read Reference image
addpath(genpath('C:\Users\anous\Documents\Internship\CIDIQ\Images\Reproduction\'));
TestImg=imread(Resu.Names(i)); %read test image

Q3(i)=psnr(ReferenceImg,TestImg); %auto this by getting the name from user
Q4(i)=ssim(ReferenceImg,TestImg);
end
REQ='Metric to use:1-Pnsr , 2-Ssim  ';
x = input(REQ);
if x==1
    Resu.Psnr=Q3';
elseif x==2
    Resu.Ssim=Q4';
else 
    disp('Pls choose from choices below');
end



