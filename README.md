Project Overview

Deepfake images are artificially generated images, often indistinguishable from real ones. This project provides a trained model that can differentiate between real and deepfake images using a CNN-based architecture (ResNet-50).

Prerequisites

Before you begin, ensure you have the following installed:

MATLAB with Deep Learning Toolbox
Git for version control
Basic knowledge of Android Studio (for app integration)
Installation

Clone the repository:
bash
Copy code
git clone https://github.com/Rishikesh4089/DeepfakeDetection.git
cd DeepfakeDetection
Open MATLAB, and navigate to the DeepfakeDetection folder.
Install necessary MATLAB Add-Ons:
Go to Add-On Explorer in MATLAB.
Search for ResNet-50 and install the Deep Learning Toolbox Model for ResNet-50 Network.
Ensure the prepare_data.m, train_model.m, and classify_image.m scripts are in the correct directories.
Dataset

This project works with an image dataset for training and testing deepfake detection. Make sure you have your dataset in the following structure:

go
Copy code
DeepfakeDetection
│
├── data/
│   ├── real/
│   └── deepfake/
The real/ folder contains real images.
The deepfake/ folder contains the fake images.
Training the Model

Run the prepare_data.m script to preprocess the dataset:
matlab
Copy code
prepare_data;
Run the train_model.m script to train the deepfake detection model:
matlab
Copy code
train_model;
After training, the model will be saved as deepfake_detection_model.mat.
Using the Model

Once you have the trained model, you can use classify_image.m to classify unseen images as real or deepfake:

Edit classify_image.m to input the image paths for the real and deepfake images you want to test.
Run the script:
matlab
Copy code
classify_image;
