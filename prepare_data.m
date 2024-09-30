datasetPath = fullfile('data'); % Adjust the path if necessary
imds = imageDatastore(datasetPath, ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');
countEachLabel(imds)
inputSize = [224 224]; % This size depends on the network (e.g., ResNet50 expects 224x224)
augmentedImds = augmentedImageDatastore(inputSize, imds);
save(fullfile('models', 'augmentedImds.mat'), 'augmentedImds');
