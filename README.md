# JetsonTX2 Object Detection Setup
A hassle free setup for the jetson

## Boot from SSD
A good recomendation is to backup all your data and then do a fresh install.
After the initial setup create a GPT and partition with gdisk on the ssd
```
sudo gdisk /dev/${drive}
```
Format and copy that PARTUUID
```
sudo mkfs.ext4 /dev/${drive}${partition_number}
sudo blkid /dev/${drive}${partition_number}
```

In the computer you installed the SDK files, head over to the download location and extract the downloaded release package
https://developer.nvidia.com/embedded/linux-tegra
Download Sample Root Filesystem of the specified SDK version and extract them over to ${L4T_RELEASE_PACKAGE}/Linux_for_Tegra/rootfs/
Copy that PARTUUID over to ${L4T_RELEASE_PACKAGE}/Linux_for_Tegra/bootloader/l4t-rootfs-uuid.txt (if file not present then create it)
```
sudo nano /Linux_for_Tegra/bootloader/l4t-rootfs-uuid.txt

sudo tar xpf ${L4T_RELEASE_PACKAGE}
cd Linux_for_Tegra/rootfs/
sudo tar xpf ../../${SAMPLE_FS_PACKAGE}
cd ..
sudo ./apply_binaries.sh
```
After this copy the rootfs/ contents to the SSD and boot Jetson in recovery mode
Head over to the Linux_for_Tegra file and flash
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
