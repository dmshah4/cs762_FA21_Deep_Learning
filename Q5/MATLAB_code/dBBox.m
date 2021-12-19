imageDirectoryName = 'double';
matName = 'dBBox.mat';
fileName = 'double.csv';

imageDirectory = [dir(strcat(imageDirectoryName, '/*.jpeg')); dir(strcat(imageDirectoryName, '/*.jpg')); dir(strcat(imageDirectoryName, '/*.png'))];
imageStructDim = size(imageDirectory);
imageCount = imageStructDim(1);

try
  matFile = load('dBBox.mat');
  results = matFile.results;
catch
  results = cell([imageCount, 20]);
end


for i = 1:imageCount
    if ~isempty(results{i,1})
        continue
    end
    
    %If you type anything, end the script early
    str = input('Press enter to continue, or N to stop ','s');
    if ~isempty(str)
        return
    end
    
    imageFile = imageDirectory(i).name;
    fileSplit = strsplit(imageFile,'-');
    
    imageNum = str2double(fileSplit{1});
    left = str2double(fileSplit{2});
    right = str2double(fileSplit{3});
    sameClassSplit = strsplit(fileSplit{4}, '.');
    sameClass = str2double(sameClassSplit{1});
    
    strcat(imageDirectoryName, '/', imageFile);
    imshow(imread(strcat(imageDirectoryName, '/', imageFile)));
    
    
    topL = drawcrosshair();
    botR = drawcrosshair();
    topLeft = topL.Position;
    bottomRight = botR.Position;
    
    results{i,1} = imageNum; 
    results{i,2} = left;
    results{i,3} = topLeft(1);
    results{i,4} = topLeft(2);
    results{i,5} = bottomRight(1);
    results{i,6} = topLeft(2);
    results{i,7} = bottomRight(1);
    results{i,8} = bottomRight(2);
    results{i,9} = topLeft(1);
    results{i,10} = bottomRight(2);

    
    imshow(imread(strcat(imageDirectoryName, '/', imageFile)));
    
    topL = drawcrosshair();
    botR = drawcrosshair();
    topLeft = topL.Position;
    bottomRight = botR.Position;
    
    results{i,11} = right;
    results{i,12} = topLeft(1);
    results{i,13} = topLeft(2);
    results{i,14} = bottomRight(1);
    results{i,15} = topLeft(2);
    results{i,16} = bottomRight(1);
    results{i,17} = bottomRight(2);
    results{i,18} = topLeft(1);
    results{i,19} = bottomRight(2);
    results{i,20} = sameClass;
    
      
    save(matName, 'results');
end

bBoxTable = cell2table(results);
bBoxTable.Properties.VariableNames = {'Image Number' 'Left' 'x1L' 'y1L' 'x2L' 'y2L' 'x3L' 'y3L' 'x4L' 'y4L' 'Right' 'x1R' 'y1R' 'x2R' 'y2R' 'x3R' 'y3R' 'x4R' 'y4R' 'SameClass'};
bBoxTable = sortrows(bBoxTable, [1], {'ascend'})

writetable(bBoxTable, fileName)