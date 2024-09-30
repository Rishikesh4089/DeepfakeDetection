load('models/deepfake_detection_model.mat', 'trainedNet');
imageFolder = 'test_images/';
testImages = imageDatastore(imageFolder, 'IncludeSubfolders', false, 'LabelSource', 'none');
inputSize = [224 224 3];  % ResNet-50 expects 224x224 RGB images
testImages.ReadFcn = @(filename)imresize(imread(filename), inputSize(1:2));
predictions = classify(trainedNet, testImages);
for i = 1:length(testImages.Files)
    [~, imageName, ext] = fileparts(testImages.Files{i});
    fprintf('Image %s%s is classified as: %s\n', imageName, ext, string(predictions(i)));
end
