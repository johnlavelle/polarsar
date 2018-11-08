%Function to read data from file and make the  matrices
%The function takes no arguments so the data must be placed in files called:
%hhhh.dat, hhhv.dat, hvhv.dat, hhvv.dat, hvvv.dat, vvvv.dat

function CovMat = get_data();


fn = strcat()
fn_full = fullfile('/data/jol/sat_data/sar_polar/fl063_l/','get_data.m')
file_hhhh = fopen('hhhh.d','r','b');     
hhhh=fread(file_hhhh,[1,inf],'float32');
fclose(file_hhhh);

file_hhhv = fopen('hhhv.dat','r','b');     
hhhv0=fread(file_hhhv,[2,inf],'float32');
hhhv=hhhv0(1,:)+j*hhhv0(2,:);
fclose(file_hhhv);

file_hvhv = fopen('hvhv.dat','r','b');     
hvhv=fread(file_hvhv,[1,inf],'float32');
fclose(file_hvhv);

file_hhvv = fopen('hhvv.dat','r','b');     
hhvv0=fread(file_hhvv,[2,inf],'float32');
hhvv=hhvv0(1,:)+j*hhvv0(2,:);
fclose(file_hhvv);

file_hvvv = fopen('hvvv.dat','r','b');     
hvvv0=fread(file_hvvv,[2,inf],'float32');
hvvv=hvvv0(1,:)+j*hvvv0(2,:);
fclose(file_hvvv);

file_vvvv = fopen('vvvv.dat','r','b');     
vvvv=fread(file_vvvv,[1,inf],'float32');
fclose(file_vvvv);

l=length(hhhh);
CM=zeros(3,3,l);

CM(1,1,:)=hhhh;
CM(1,2,:)=hhhv;
CM(1,3,:)=hhvv;
CM(2,1,:)=conj(hhhv);
CM(2,2,:)=hvhv;
CM(2,3,:)=hvvv;
CM(3,1,:)=conj(hhvv);
CM(3,2,:)=conj(hvvv);
CM(3,3,:)=vvvv;


CovMat=CM;




