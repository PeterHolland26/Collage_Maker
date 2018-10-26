function [] = CollageTest()
disp('MakeCollage')
%this function will eventually take a directory of images and make a
%collage of all other images to match a test image as closely as possible
disp('Hello')
disp('1')
disp('Select Image Folder')

imageDir = 'F:\Win10 Data\pics\wedding photos\Wedding_Day';

targetImage = 'Cindy _ Peter-1161.jpg';

targetArray = imread([imageDir filesep targetImage]);

imageList = dir([imageDir filesep '*.jpg']);

%now we want to exclude the target image from that list
imageList(strcmpi(targetImage,{imageList.name})) = [];

%now we need to calculate the grid size we are going to use based on the
%number of images we have, we want to keep the aspect ratio the same
aspectRatio = size(targetArray,1)/size(targetArray,2);

numImages = numel(imageList);

dim1 = floor(sqrt(numImages/aspectRatio));
dim2 = floor(dim1*aspectRatio);


dsArray = imresize(targetArray,[dim2 dim1]);


%now we want to loop over all images in the list and get an average value
%for rgb
avgRgbs = nan(numImages,3);
for imageNum = 1:numImages
    tempImage = imread([imageList(imageNum).folder filesep imageList(imageNum).name]);
   avgRgbs(imageNum,:) = squeeze(mean(mean(tempImage)));
end


%now we want to do some kind of optimisation to find the order of points in avgGrbs
%that minimises the overall euclidean distance between avgRgbs and dsArray 


end