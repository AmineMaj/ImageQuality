load Resu.mat;
T=table('Size',[2,3],'VariableTypes',{'string','double','double'});     
T.Properties.VariableNames(1:3)={'DataBaseName',Resu.Properties.VariableNames{5},Resu.Properties.VariableNames{6}};
E={Resu.Properties.VariableNames{3},Resu.Properties.VariableNames{4}};
T.DataBaseName=E';
C2={corr(Resu.MOS50,Resu.Psnr),corr(Resu.MOS100,Resu.Psnr)};
T.Psnr=C2';
C1={corr(Resu.MOS50,Resu.Ssim),corr(Resu.MOS100,Resu.Ssim)};
T.Ssim=C1';
