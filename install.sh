# Update the submodules [start with these -JB]
git submodule init
git submodule update

# Create the virtual environment
python3 -m venv --prompt SATINET venv
source venv/bin/activate

# Upgrade the pip and setuptools
# [these should not be necessary as you're installing requirements -JB]
pip install --upgrade pip


pip install tensorflow==1.14.0
pip install numpy==1.16.4
pip install opencv-contrib-python==3.4.2.16
pip install opencv-python==3.4.2.16
pip install tqdm==4.50.0
pip install matplotlib==3.3.2
pip install imageio==2.9.0
pip install scikit-image==0.17.2
pip install memory_profiler==0.58.0
pip install pandas==1.1.3
pip install openpyxl==3.0.5
pip install xlrd==1.2.0
pip install rasterio==1.1.8
pip install rpcm==1.4.7
pip install bs4==0.0.1
pip install ransac==1.0.2

pip install s2p==1.0b23

pip install silx==0.13.2
pip install ad==1.3.2
pip install ipywidgets==7.5.1
pip install numba==0.52.0

pip install progressist==0.1.0
pip install torch==1.8.0
pip install torchvision==0.9.0
pip install googledrivedownloader==0.4

# Installing the third party homography
make -C homography
ln -sf $(readlink -f homography/homography) "$VIRTUAL_ENV/bin/"

# Installing the third party sgbm
make -C s2p/3rdparty/sgbm/

# All done
echo "The envoronment was successfully installed!"
ln -sf $(readlink -f s2p/3rdparty/sgbm/sgbm) "$VIRTUAL_ENV/bin/"

# Download the pretrained models
./download_pretrained_models.py
