imageDirectoryName = 'output_images';
outputDirectoryName = 'text_images_0.7';
resultsFile = 'results.csv';
threshold = 0.7;

imageDirectory = [dir(strcat(imageDirectoryName, '/*.jpeg')); dir(strcat(imageDirectoryName, '/*.jpg')); dir(strcat(imageDirectoryName, '/*.png'))];
imageStructDim = size(imageDirectory);
imageCount = imageStructDim(1);

t = readtable(resultsFile);




for i = 1:imageCount
    imageFile = imageDirectory(i).name;
    
    
    fileSplit = strsplit(imageFile,'.');
    
    type = strsplit(fileSplit{2}, '_');
    type = type{2};
    
    image_name = strcat(fileSplit{1},'.',fileSplit{3});
    row = t(string(t.image_name)==image_name, :);
    row = row(row.threshold == threshold, :);
    
    label = '';
    labelIdx = 0;
    accuracy = 0;
    wholeImage = 0; 
    
    if strcmp(type,'deit')
        labelIdx = 13;
    end
    if strcmp(type,'resnet')
        labelIdx = 10;
    end
    if strcmp(type,'detr')
        labelIdx = 7;
    end
    if strcmp(type,'yolo')
        labelIdx = 4;
    end
    
    label = row{1,labelIdx};
    label = label{1};
    accuracy = row{1, labelIdx + 1};
    wholeImage = row{1, labelIdx + 2};
    

    I = imread(strcat(imageDirectoryName, '/' ,imageFile));
    [rows, columns, numberOfColorChannels] = size(I);
    offset = ceil(columns/3);
    position =  [1 50; offset 50];
    value = [accuracy wholeImage];
    RGB = insertText(I,position,value,'AnchorPoint','LeftBottom');
    RGB = insertText(RGB, [offset*2, 50], label, 'AnchorPoint', 'LeftBottom');
    imwrite(RGB, strcat(outputDirectoryName, '/', imageFile));
end
%     
%     imageNum = str2double(fileSplit{1});
%     left = str2double(fileSplit{2});
%     right = str2double(fileSplit{3});
%     sameClassSplit = strsplit(fileSplit{4}, '.');
%     sameClass = str2double(sameClassSplit{1});
%     
%     strcat(imageDirectoryName, '/', imageFile);
%     imshow(imread(strcat(imageDirectoryName, '/', imageFile)));
%     
%     
%     topL = drawcrosshair();
%     botR = drawcrosshair();
%     topLeft = topL.Position;
%     bottomRight = botR.Position;
%     
%     results{i,1} = imageNum; 
%     results{i,2} = left;
%     results{i,3} = topLeft(1);
%     results{i,4} = topLeft(2);
%     results{i,5} = bottomRight(1);
%     results{i,6} = topLeft(2);
%     results{i,7} = bottomRight(1);
%     results{i,8} = bottomRight(2);
%     results{i,9} = topLeft(1);
%     results{i,10} = bottomRight(2);
% 
%     
%     imshow(imread(strcat(imageDirectoryName, '/', imageFile)));
%     
%     topL = drawcrosshair();
%     botR = drawcrosshair();
%     topLeft = topL.Position;
%     bottomRight = botR.Position;
%     
%     results{i,11} = right;
%     results{i,12} = topLeft(1);
%     results{i,13} = topLeft(2);
%     results{i,14} = bottomRight(1);
%     results{i,15} = topLeft(2);
%     results{i,16} = bottomRight(1);
%     results{i,17} = bottomRight(2);
%     results{i,18} = topLeft(1);
%     results{i,19} = bottomRight(2);
%     results{i,20} = sameClass;
%     
%       
%     save(matName, 'results');
% end
% 
% bBoxTable = cell2table(results);
% bBoxTable.Properties.VariableNames = {'Image Number' 'Left' 'x1L' 'y1L' 'x2L' 'y2L' 'x3L' 'y3L' 'x4L' 'y4L' 'Right' 'x1R' 'y1R' 'x2R' 'y2R' 'x3R' 'y3R' 'x4R' 'y4R' 'SameClass'};
% bBoxTable = sortrows(bBoxTable, [1], {'ascend'})
% 
% writetable(bBoxTable, fileName)