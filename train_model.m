% train_model.m - Script for training deepfake detection model

% Load the preprocessed dataset
load('models/augmentedImds.mat');  % Ensure the preprocessed dataset is saved in 'augmentedImds.mat'

% Step 1: Load the ResNet-50 architecture
net = resnet50;  % Ensure you have installed the Deep Learning Toolbox ResNet-50 model

% Step 2: Modify the network for binary classification (deepfake vs real)
lgraph = layerGraph(net);  % Convert the pretrained network into a layer graph

% Step 3: Remove the last three layers (1000-class classification layers)
lgraph = removeLayers(lgraph, {'fc1000', 'fc1000_softmax', 'ClassificationLayer_fc1000'});

% Step 4: Add new layers for binary classification (2 classes: real and deepfake)
numClasses = 2;  % Real and Deepfake
newLayers = [
    fullyConnectedLayer(numClasses, 'Name', 'fc', 'WeightLearnRateFactor', 10, 'BiasLearnRateFactor', 10)
    softmaxLayer('Name', 'softmax')
    classificationLayer('Name', 'classification')];

% Step 5: Connect the new layers to the layer graph
lgraph = addLayers(lgraph, newLayers);
lgraph = connectLayers(lgraph, 'avg_pool', 'fc');  % Connect the new fully connected layer to 'avg_pool'

% Step 6: Set training options
options = trainingOptions('adam', ...  % You can switch to 'sgdm' or 'rmsprop' if needed
    'MiniBatchSize', 16, ...           % Adjust this if memory is insufficient
    'MaxEpochs', 5, ...                % You can increase this if you want to train longer
    'InitialLearnRate', 1e-4, ...      % Adjust learning rate if needed
    'Shuffle', 'every-epoch', ...
    'Verbose', false, ...
    'Plots', 'training-progress', ...
    'ExecutionEnvironment', 'auto');   % Use GPU if available, or CPU otherwise

% Step 7: Train the network with the modified architecture
trainedNet = trainNetwork(augmentedImds, lgraph, options);

% Step 8: Save the trained model
save('models/deepfake_detection_model.mat', 'trainedNet');

disp('Model training complete, and the model has been saved.');
