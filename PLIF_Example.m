% Application Example of the PLIFTool
% Dawid Majewski

clear all; close all; clc

% iniitalize the variables
PLIFtoolmain
%% input parameters

rho0 = 998.2;        % Reference density (kg/m^3)
% Calibration coefficients for linear calibration fucntion
% Example:
% C = a*I + b
a = 0.015;
b = 0.00;

% Density relationship
% rho = rho0 + beta*C

beta = 0.72;

ploter=1;  %1 for display individual figures
%% read auxiliary images for corrections

% Dark image for zero intensity correction
darkImage=[seqplif.blackpath seqplif.blackname seqplif.blackformat];
Idark = double(imread(darkImage));

% Background image for background removal
bckgroundImage=[seqplif.bckgroundpath seqplif.bckgroundname seqplif.bckgroundformat];
Ibckground = double(imread(bckgroundImage));

% laser intensity image for intensity correction
laserImage=[seqplif.laserpath seqplif.lasername seqplif.laserformat];
Ilaser= double(imread('LaserReference.tif'));

%% Processing

k=1;
for i=seqplif.begindex:seqplif.endindex

    Iraw  = double(imread([seqplif.path seqplif.name   sprintf(['%0'  num2str(seqplif.leadingzeros)  'd'], i)   seqplif.format] ));

    
    % STEP 1 : DARK SUBTRACTION 
    I1 = Iraw - Idark;
    
    I1(I1<0)=0;

    % STEP 2 : BACKGROUND SUBTRACTION 

    I2 = I1 - Ibg;

    I2(I2<0)=0;

    % STEP 3 : LASER SHEET CORRECTION 

    Ilaser = Ilaser - Idark;

    Ilaser(Ilaser<=0)=1;

    Inorm = I2 ./ Ilaser;

    % STEP 4 : NORMALIZATION -------------------------------

    Inorm = Inorm ./ max(Inorm(:));

    % STEP 5 : FILTERING ----------------------------------
    
    Inorm = medfilt2(Inorm,[3 3]);
    
    Inorm = imgaussfilt(Inorm,1.0);

    % STEP 6 : CALIBRATION --------------------------------
    % Linear calibration

    Concentration = a*Inorm + b;

    % Polynomial example
    %
    % Concentration = p1*Inorm.^2 + p2*Inorm + p3;

    % STEP 7 : DENSITY ------------------------------------

    Density = rho0 + beta*Concentration;

    CConcentration{k}=Concentration;
    DDensity{k}=Density;
    
    % DENSITY GRADIENT ------------------------------------

    [drhodx,drhody] = gradient(Density);

    GradMag = sqrt(drhodx.^2 + drhody.^2);
    
    GGradMag{k}=GradMag;
    
    % VISUALIZATION ----------------------------------------
    if plotter
        figure, imagesc(Concentration); axis image; colorbar
        title('Concentration Field')    
        xlabel('x'); ylabel('y')


        figure, imagesc(Density); axis image; colorbar
        title('Density Field')
        xlabel('x'); ylabel('y')
        
        figure, imagesc(GradMag), axis image; colorbar
        title('Density Gradient Magnitude')
        xlabel('x'); ylabel('y')
    end

    k=k+1;
% SAVE RESULTS ----------------------------------------
end

save(seqplif.savefile,...
    'CConcentration',...
    'DDensity',...
    'GradMag');