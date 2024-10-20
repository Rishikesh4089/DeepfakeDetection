% Load data and variables
load('models/deepfake_detection_model.mat', 'trainedNet');
imageFolder = 'test_images/';  % Make sure this folder contains both the real and deepfake images
testImages = imageDatastore(imageFolder, 'IncludeSubfolders', false, 'LabelSource', 'none');
inputSize = [224 224 3]; 
testImages.ReadFcn = @(filename) imresize(imread(filename), inputSize(1:2));
predictions = classify(trainedNet, testImages);
numImages = length(testImages.Files);

% Initialise table and display image and classification
figure('Name', 'Deepfake Detection Results', 'NumberTitle', 'off');
sgtitle('Deepfake Detection Results');
for i = 1:numImages
    subplot(numImages, 2, (i-1)*2 + 1); 
    originalImage = imread(testImages.Files{i});
    imshow(originalImage);
    title('Original Image');
    subplot(numImages, 2, (i-1)*2 + 2);
    text(0.5, 0.5, ['Classification: ', string(predictions(i))], ...
        'FontSize', 12, 'HorizontalAlignment', 'center');
    axis off; 
end
