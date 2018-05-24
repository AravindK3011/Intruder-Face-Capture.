% Code by Tejas K 
% June 2016


% Clean the MATLAB environment and get ready to execute the program
clear all
close all
clc

% Initialise the Viola Jones Face detector Object.
% If u want to detect oly eyes and crop them, just specify eyes as the parameter. 
% similarly for nose, mouth etc.
FDetect = vision.CascadeObjectDetector();

% If value is decreased to 5-10. Then lot of false matches (faces) will be seen in the image,
% similarly if it 1000 then actual face might also be ignored at situations. 
detector.MergeThreshold=100;

% Install the additional Hardware package in MATLAB (WEBCAMS) in order to activate the inbuilt webcam in your laptops.
% Else an error will pop up at this stage. 
% If you are using external webcams such as logitech then install respective hardware package in MATLAB.
% Not all webcams are compatible with MATLAB

cam=webcam();

count=0;

while(1)    % Start a forever loop.

I=snapshot(cam);              % take an image
BB = step(FDetect,I);         % Detect face in it
size(BB,1);                   % Draw a bounding box around the face in the form of a rectangle in color red
image(I); hold on             % on each image display the bounding box too
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

count=count+1;

for i=1:size(BB,1)             % crop the bounding box ( i.e the face)
    I2=imcrop(I,BB(i,:));
   imwrite(I2,sprintf('text%d.jpg' ,count)); % save it in the current directory under the name text1, text2, text3.
                                             % if its the same name, image gets overlapped, only the last image survives, rest get deleted.
   
end
end


