% prepare_data.m

% Define the dataset path
datasetPath = fullfile('data'); % Adjust the path if necessary

% Create an imageDatastore for the dataset
imds = imageDatastore(datasetPath, ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% Display the number of images
countEachLabel(imds)

% Resize the images to match the input size of the pre-trained network
inputSize = [224 224]; % This size depends on the network (e.g., ResNet50 expects 224x224)
augmentedImds = augmentedImageDatastore(inputSize, imds);
save(fullfile('models', 'augmentedImds.mat'), 'augmentedImds');
