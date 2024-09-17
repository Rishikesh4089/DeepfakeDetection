% test_model.m - Script to test the trained model on unseen images

% Step 1: Load the trained model
load('models/deepfake_detection_model.mat', 'trainedNet');

% Step 2: Specify the path to the folder containing the test images
imageFolder = 'test_images/';  % Make sure this folder contains both the real and deepfake images

% Step 3: Load the test images
testImages = imageDatastore(imageFolder, 'IncludeSubfolders', false, 'LabelSource', 'none');

% Step 4: Resize the images to match the input size of ResNet-50 (224x224 pixels)
inputSize = [224 224 3];  % ResNet-50 expects 224x224 RGB images

% Resize all test images
testImages.ReadFcn = @(filename)imresize(imread(filename), inputSize(1:2));

% Step 5: Classify the images using the trained model
predictions = classify(trainedNet, testImages);

% Step 6: Display the results
for i = 1:length(testImages.Files)
    [~, imageName, ext] = fileparts(testImages.Files{i});
    fprintf('Image %s%s is classified as: %s\n', imageName, ext, string(predictions(i)));
end
