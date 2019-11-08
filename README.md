# JetsonTX2 Object Detection Setup
A hassle free setup for the jetson

## Boot from SSD
A good recomendation is to backup all your data and then do a fresh install.
After the initial setup create a GPT and partition with gdisk on the ssd
```
sudo gdisk /dev/${drive}
```
Check and copy that partition UUID
```
sudo blkid /dev/${drive}${partition_number}
```
Copy that PARTUUID over to l4t-rootfs-uuid.txt
```
sudo nano /Linux_for_Tegra/bootloader/l4t-rootfs-uuid.txt
```
Check the PARTUUID again
```
sudo mkfs.ext4 /dev/${drive}${partition_number}
```
Copy the rootfs folder over to the SSD using rsync
```
sudo apt-get update
sudo apt-get install rsync

rsync -av --progress '/rootfs/location' '/mnt/yourssd'
```
Once the copy has been completed cd over to the rootfs folder located in your ssd partition and flash
```
sudo ./flash jetson-tx2 external
```
Once this is all completed and the jetson boots up, use the sdkmanager to ONLY install SDK components

## Install A Jetson Monitoring Tool (Optional)
Jetson Stats provides general information for all your jetson needs!
```
sudo -H pip install jetson-stats
```
To run write
```
sudo jtop
```

## Install Tensor Flow
First install the required system packages
```
sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev
```
Then install and upgrade pip, the python package manager
```
sudo apt-get install python3-pip
sudo pip3 install -U pip
```
Using pip, install the required libraries in their according versions
```
sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.6 enum34 futures testresources setuptools protobuf
```
Then install the latest compiled tensorflow-gpu package for Jetpack 4.2.0
```
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
```

## Install Tensor RT
Tensor RT is a compiled library for tensorflow that improves NeuralNet efficiency
First install some python dependencies
```
sudo apt-get install python-pip python-matplotlib python-pil
```
Clone and cd to the Tensor RT repository
```
git clone --recursive https://github.com/NVIDIA-Jetson/tf_trt_models.git
cd tf_trt_models
```
Run the instalation script and specify the python interpreter
```
./install.sh python3
```

## Install OpenCV
Run the provided script
```
sudo bash opencv-4-tx2.sh
```
