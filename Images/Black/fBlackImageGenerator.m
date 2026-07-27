function fBlackImageGenerator(imagename,format,leadzeros,N,n,m,L0,NoiseL,display)
% creates N images with size n x m and a base level of black of L0
% a random number generator is used to create a noise overlaped at L0



for i=1:N
    A=L0*ones(m,n)+NoiseL*rand(m,n);
    imwrite(uint8(A),[imagename sprintf(['%0'  num2str(leadzeros)  'd'], i)  format])
end

if display
    figure, imagesc(uint8(A)), colormap('gray'), colorbar
end

