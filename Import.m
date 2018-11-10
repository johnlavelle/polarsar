files = dir

ls=[]
for i=6:12%length(files)
    currD = files(i).name
    cd(currD)
    fList = dir;
    
    file_hhhh = fopen(fList(3).name,'r', 'b')     
    hhhh=fread(file_hhhh,[1,inf],'float32');
    fclose(file_hhhh);

    file_hhhv = fopen(fList(4).name,'r','b');     
    hhhv0=fread(file_hhhv,[2,inf],'float32');
    hhhv=hhhv0(1,:)+j*hhhv0(2,:);
    fclose(file_hhhv);

    file_hhvv = fopen(fList(5).name,'r','b');     
    hhvv0=fread(file_hhvv,[2,inf],'float32');
    hhvv=hhvv0(1,:)+j*hhvv0(2,:);
    fclose(file_hhvv);
    
    file_hvhv = fopen(fList(6).name,'r','b');     
    hvhv=fread(file_hvhv,[1,inf],'float32');
    fclose(file_hvhv);
    
    file_hvvv = fopen(fList(7).name,'r','b');     
    hvvv0=fread(file_hvvv,[2,inf],'float32');
    hvvv=hvvv0(1,:)+j*hvvv0(2,:);
    fclose(file_hvvv);

    file_vvvv = fopen(fList(8).name,'r','b');     
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

    CovMat{i-5}=CM;
    ls=[ls,[currD]];
    cd ..
end


%%
