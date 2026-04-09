clear all;
clc;
close all;

index='0';
mdir = './image2/';
pic_format='.jpg';
imgpath=strcat(mdir,index,'-0-1',pic_format);
img=imread(imgpath);
txt_path=strrep(imgpath,pic_format,'.txt');
if ~exist(txt_path,'file')==0
    rect=importdata(txt_path);
else
    fp=fopen(txt_path,'w');
    imshow(img,[])
    rect = getrect;  
    for i=1:1:4
        fprintf(fp,'%d ',rect(i));
    end
    fclose(fp);
end
x1 = round(rect(1));
y1 = round(rect(2));
w1 = round(rect(3));
h1 = round(rect(4));
I_0=0;
I_45=0;
I_90=0;
I_135=0;
for i=1:1:5
    I0name=strcat(mdir,index,'-0','-',num2str(i),pic_format);
    I_0=0.2*im2double(imread(I0name))+I_0;
    I45name=strcat(mdir,index,'-45','-',num2str(i),pic_format);
    I_45=0.2*im2double(imread(I45name))+I_45;
    I90name=strcat(mdir,index,'-90','-',num2str(i),pic_format);
    I_90=0.2*im2double(imread(I90name))+I_90;
    I135name=strcat(mdir,index,'-135','-',num2str(i),pic_format);
    I_135=0.2*im2double(imread(I135name))+I_135;
end
Z2 = main(I_0,I_45,I_90,I_135,x1,y1,w1,h1);