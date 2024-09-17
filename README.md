# **Deepfake Detection**

This project focuses on identifying the real image from a deepfake image using a Convolutional Neural Network (CNN) model trained in MATLAB. The goal is to classify images as either real or deepfake, and the trained model is integrated into an Android Studio app.

## **Table of Contents**

- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Dataset](#dataset)
- [Training the Model](#training-the-model)
- [Using the Model](#using-the-model)
- [How to Use in Android App](#how-to-use-in-android-app)
- [Contributing](#contributing)

---

## **Project Overview**

Deepfake images are artificially generated images, often indistinguishable from real ones. This project provides a trained model that can differentiate between real and deepfake images using a CNN-based architecture (ResNet-50).

## **Prerequisites**

Before you begin, ensure you have the following installed:

- MATLAB with Deep Learning Toolbox
- Git for version control
- Basic knowledge of Android Studio (for app integration)

## **Installation**

1. Clone the repository:

    ```bash
    git clone https://github.com/Rishikesh4089/DeepfakeDetection.git
    cd DeepfakeDetection
    ```

2. Open MATLAB, and navigate to the `DeepfakeDetection` folder.

3. Install necessary MATLAB Add-Ons:
   - Go to **Add-On Explorer** in MATLAB.
   - Search for **ResNet-50** and install the **Deep Learning Toolbox Model for ResNet-50 Network**.
   
4. Ensure the `prepare_data.m`, `train_model.m`, and `classify_image.m` scripts are in the correct directories.

## **Dataset**

This project works with an image dataset for training and testing deepfake detection. Make sure you have your dataset in the following structure:

