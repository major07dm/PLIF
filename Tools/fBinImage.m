function BinImage=fBinImage(A,n,m)
% It takes an image/matrix A anc divides it in to bins of size m x n and
% replaces and compute the median and mean in each bin. The output is a
% binned image

% Developed by Dawid Majewski & Rui Aleixo, June 2026

B=zeros(size(A));
nx=size(A,2); ny=size(A,1);

Nbinx=floor(nx/n);
Nbiny=floor(ny/m);

for i=1:Nbinx
    for j=1:Nbiny
        i0=1
        B(1:,i)=
    


