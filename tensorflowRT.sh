echo "Installing tensorflow dependencies"
sudo apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev
sudo apt-get install -y python3-pip
sudo pip3 install -U pip

echo "Installing Python dependencies"
sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.6 enum34 futures testresources setuptools protobuf

echo "Installing the latest compiled tensorflow-gpu package for Jetpack 4.2.0"
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu

echo "Tensorflow has been installed!"

echo "Installing Tensorflow RT"

echo "Installing python deps"
echo "Check if this is needed"
sudo apt-get install -y python-pip python-matplotlib python-pil

echo "Downloading Tensorflow RT from github"
git clone --recursive https://github.com/NVIDIA-Jetson/tf_trt_models.git
cd tf_trt_models

echo "Installing Tensorflow RT"
./install.sh python3

echo "Tensorflow RT has been downloaded"
echo "Finished!"
