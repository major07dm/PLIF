function [xscale,yscale,x0,y0]=fSpatialCalibration(seq)
% Function to compute the spatial calibration of PLIF images
% for now just linear calibration works. Further models to be implemented
% soon.
% Developed by Dawid Majewski, June 2026

imagename=[seq.calibrationpath seq.calibrationname seq.calibrationformat];

A=imread(imagename);
nx=size(A,2);
ny=size(A,1);


figure(1), imagesc(A); hold on;
set(gcf, 'Position', get(0, 'Screensize'));
axis image;
f = msgbox('Please select the origin');
pause(0.5);
delete(f);
[x0,y0]=ginput(1);

% plot the point in the image
plot(x0,y0,'yo','MarkerSize',12)


% select another point of knonw coordinates
f = msgbox('Please select a point of known coordinates');
pause(0.5);
delete(f);
[x1,y1]=ginput(1);
plot(x1,y1,'ro','MarkerSize',12)

%input the coordinates of select point
r1 = inputdlg({'x1 (m)','y1 (m)'},...
              'Input the coordinates', [1 20; 1 20;]); 

x1w=r1{1};
y1w=r1{2};

% calculate the distance in pixels
dpixel=(x0-x1)*(x0-x1)+(y0-y1)*(y0-y1);

% calculate the distance in world coordinates
dworld =(x1w-0)*(x1w-0)+(y1w-0)*(y1w-0);

xscale=dworld/dpixel;
yscale=xscale;

%show calibrated image
xcalibrated=((1:nx)-x0)*xscale;
ycalibrated=((1:ny)-y0)*yscale;

figure(2), imagesc(xcalibrated,ycalibrated,A), axis image



% seqplif.calibrationpath='C:\RAleixo\IBW\Proposals\MiniaturaDawid\PLIFTool\Images\Calibration\';
% seqplif.calibrationname = 'CalibrationImage';
% seqplif.format='.jpg';