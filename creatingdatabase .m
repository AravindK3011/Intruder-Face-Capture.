clear all
clc
FDetect = vision.CascadeObjectDetector();
detector.MergeThreshold=100;
cam=webcam();

count=0;

while(1)
I=snapshot(cam);
BB = step(FDetect,I);
size(BB,1);  
image(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

count=count+1;

for i=1:size(BB,1)
    I2=imcrop(I,BB(i,:));
   imwrite(I2,sprintf('text%d.jpg' ,count));
   
end
end


