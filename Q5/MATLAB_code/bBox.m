imageDirectoryName = 'another';
matName = 'bBox.mat';
fileName = 'another.csv';

imageDirectory = [dir(strcat(imageDirectoryName, '/*.jpeg')); dir(strcat(imageDirectoryName, '/*.jpg')); dir(strcat(imageDirectoryName, '/*.png'))];
imageStructDim = size(imageDirectory);
imageCount = imageStructDim(1);

try
  matFile = load('bBox.mat');
  results = matFile.results;
catch
  results = cell([imageCount, 10]);
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
    
    labelSplit = strsplit(fileSplit{2}, '.');
    label = labelSplit{1}
    
    strcat(imageDirectoryName, '/', imageFile);
    imshow(imread(strcat(imageDirectoryName, '/', imageFile)));
    topL = drawcrosshair();
    botR = drawcrosshair();
    topLeft = topL.Position;
    bottomRight = botR.Position;

    
    results{i,1} = imageNum; 
    results{i,2} = label;
    results{i,3} = topLeft(1);
    results{i,4} = topLeft(2);
    results{i,5} = bottomRight(1);
    results{i,6} = topLeft(2);
    results{i,7} = bottomRight(1);
    results{i,8} = bottomRight(2);
    results{i,9} = topLeft(1);
    results{i,10} = bottomRight(2);
      
    save(matName, 'results');
end

bBoxTable = cell2table(results);
bBoxTable.Properties.VariableNames = {'Image Number' 'Label' 'x1' 'y1' 'x2' 'y2' 'x3' 'y3' 'x4' 'y4'};
bBoxTable = sortrows(bBoxTable, [1], {'ascend'})

writetable(bBoxTable, fileName)