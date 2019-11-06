# JetsonTX2 Object Detection Setup
A hassle free setup for the jetson

## Standard Linux Setup
'''
sudo apt-get update
'''

## Install Jetpack
TODO: Setup the install jetpack instructions in the weekend by recording my experience on my server

## Install Tensor Flow
First install the required system packages
'''
sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev
'''
Then install and upgrade pip, the python package manager
'''
sudo apt-get install python3-pip
sudo pip3 install -U pip
'''
Using pip, install the required libraries in their according versions
'''
sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.6 enum34 futures testresources setuptools protobuf
'''
Then install the latest compiled tensorflow-gpu package for Jetpack 4.2.0
'''
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
'''

## Install Tensor RT
Tensor RT is a compiled library for tensorflow that improves NeuralNet efficiency
First install some python dependencies
'''
sudo apt-get install python-pip python-matplotlib python-pil
'''
Clone and cd to the Tensor RT repository
'''
git clone --recursive https://github.com/NVIDIA-Jetson/tf_trt_models.git
cd tf_trt_models
'''
Run the instalation script and specify the python interpreter
'''
./install.sh python3
'''

## Install OpenCV
TODO: actually get opencv to install...
