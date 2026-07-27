% Initialize the data sequence for the PLIF
% run this first
% 
% prepared by Dawid Majewski and Rui Aleixo

clear all; close all; clc;

%% Parameters of the image sequence
seqplif.path='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\Data\';
seqplif.name = 'filename';
seqplif.format='.jpg';

seqplif.begindex = 1; 
seqplif.endindex = 30; % index of lasmage
seqplif.leadingzeros = 3;
seqplif.format = '.jpg'; % image format (valid formats include 'bmp', 'jpg', 'jpeg', 'gif', 'tiff', 'tif', 'pcx')

seqplif.window =  [1 848 -478 -1]; %[1000 2000 -1400 -400 ]; %
seqplif.calibz = 1; 
seqplif.calfreq = 1;
seqplif.dummydt = 1;
seqplif.display = 1; 

seqplif.calibrationpath='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\SpatialCalibration\';
seqplif.calibrationname = 'CalibrationExample';
seqplif.calibrationformat='.tiff';

seqplif.blackpath='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\Black\';
seqplif.blackname = 'filename';
seqplif.blacknumber = 5;
seqplif.blackformat = '.jpg'; % .jpg, .tif, .png, .bmp, etc

seqplif.bckgoundpath='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\Black\';
seqplif.bckgoundname = 'filename';
seqplif.bckgoundformat = '.jpg'; % .jpg, .tif, .png, .bmp, etc

seqplif.laserpath='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\Black\';
seqplif.lasername = 'filename';
seqplif.laserformat = '.jpg'; % .jpg, .tif, .png, .bmp, etc

seqplif.savefile='OutputData.mat';