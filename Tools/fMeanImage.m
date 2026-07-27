function MeanImage=fMeanImage(seq,black,display)
% creates the mean image from N images stored at the location indidcated in
% seq 
% Developed by Dawid Majewski, June 2026

if black
    disp('Creating an average of black images')
    mypath=seq.blackpath;
    imagename=seq.blackname;
    A0=imread([mypath imagename sprintf( ['%0' num2str(seq.leadingzeros) 'd'], 1 ) seq.blackformat]);
    
    MeanBlack=zeros(size(A0));
    N=seq.blacknumber;
    for i=1:N
        A0=double(imread([mypath imagename sprintf( ['%0' num2str(seq.leadingzeros) 'd'], i ) seq.blackformat]));
        MeanBlack=A0/N+MeanBlack;
    end
    MeanImage=MeanBlack;
    if display
        figure, imagesc(uint8(B))
    end
else
    disp('Creating an average image')

    A0=imread([seq.path seq.name sprintf( ['%0' num2str(seq.leadingzeros) 'd'], 1 ) seq.blackformat]);
    MeanImage=zeros(size(A0));
    n0=seq.begindex;
    n1=seq.endindex;
    N=(n1-n0)+1;
    
    for i=n0:n1
        A0=double(imread([seq.path seq.name sprintf( ['%0' num2str(seq.leadingzeros) 'd'], i ) '.' seq.format]));
        MeanImage=A0/N+MeanImage;
    end
    
    if display
        figure, imagesc(uint8(MeanImage))
    end
    
    
end