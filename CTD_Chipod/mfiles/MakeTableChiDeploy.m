function MakeTableChiDeploy(ChiInfo)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% MakeTableChiDeploy.m
%
% Make a summary table of chipods deployed during a cruise. Makes a latex
% table that can be copied into notes.
%
% Uses data from the 'Chipod_Deploy_Info_XXXX.m' file
%
% INPUT
% - ChiInfo (from Chipod_Deploy_Info_xxxx.m)
%
% OUTPUT
% - Latex table that can be copied and pasted into notes tex file
%
%-------------
% 06/10/16 - A.Pickering - apickering@coas.oregonstate.edu
%~~~~~~~~~~~~~~~~~~~~~~~~~~~
%%


Nsn=length(ChiInfo.SNs);
and=' & ';
lend=' \\ ';
clc
disp('\begin{table}[htdp]')
disp(['\caption{$\chi$pod Deployment Info for ' ChiInfo.Project '}'])
disp('\begin{center}')
disp('\begin{tabular}{|c|c|c|c|}')

disp('\hline')
disp(['SN' and 'Type' and 'Dir' and 'Sensor' lend])
disp('\hline')
disp('\hline')

for iSN=1:Nsn
    clear whSN InstDir sensorSN
    whSN=ChiInfo.SNs{iSN};
    InstDir=ChiInfo.(whSN).InstDir;
    sensorSN= ChiInfo.(whSN).sensorSN;
    if isstruct(sensorSN)
        sensorSN=sensorSN.T1;
    end
    if isstruct(InstDir)
        InstDir=InstDir.T1;
    end
    disp([whSN and ChiInfo.(whSN).InstType and InstDir and sensorSN lend])    
end

disp('\hline')
disp('\end{tabular}')
disp('\end{center}')
disp('\label{chidepinfo}')
disp('\end{table}')

%%