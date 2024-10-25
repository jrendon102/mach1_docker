#######################################################
############## DEPRECATED #############################
#######################################################

# # Use the ROS Noetic base image as the starting point
# FROM ros:noetic-robot

# # This step is placed first since it takes a long time to build.
# # Install essential dependencies required for building and installing OpenCV4 (C++)
# RUN apt-get update && \
#   apt-get install -y \
#   git \
#   libavfilter-dev \
#   libfaac-dev \
#   libgstreamer-plugins-base1.0-dev \
#   libgtk2.0-dev \
#   libopencore-amrnb-dev \
#   libopencore-amrwb-dev \
#   libtheora-dev \
#   libtiff5-dev \
#   libvorbis-dev \
#   libx264-dev \
#   libxvidcore-dev && \
#   cd /opt && \
#   git clone https://github.com/Itseez/opencv.git && \
#   git clone https://github.com/Itseez/opencv_contrib.git && \
#   cd opencv && \
#   mkdir release && \
#   cd release && \
#   cmake -D BUILD_TIFF=ON \
#   -D WITH_CUDA=OFF \
#   -D ENABLE_AVX=OFF \
#   -D WITH_OPENGL=OFF \
#   -D WITH_OPENCL=OFF \
#   -D WITH_IPP=OFF \
#   -D WITH_TBB=ON \
#   -D BUILD_TBB=ON \
#   -D WITH_EIGEN=OFF \
#   -D WITH_V4L=OFF \
#   -D WITH_VTK=OFF \
#   -D BUILD_TESTS=OFF \
#   -D BUILD_PERF_TESTS=OFF \
#   -D CMAKE_BUILD_TYPE=RELEASE \
#   -D CMAKE_INSTALL_PREFIX=/usr/local \
#   -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
#   /opt/opencv/ && \
#   make -j4 && \
#   make install && \
#   ldconfig

# # Separate installation of additional packages for easier updates
# RUN apt-get install -y \
#   dos2unix \
#   python3-catkin-tools \
#   python3-opencv \
#   python3-pip \
#   ros-noetic-compressed-image-transport \
#   ros-noetic-cv-bridge \
#   ros-noetic-image-transport \
#   ros-noetic-joy \
#   ros-noetic-joy-teleop \
#   ros-noetic-teleop-twist-joy \
#   ros-noetic-rplidar-ros \
#   ros-noetic-teleop-twist-keyboard \
#   sphinx-common \
#   unzip \
#   vim \
#   wget \
#   yasm && \
#   apt-get clean && \
#   # Install gpiozero using pip to avoid issues when importing the library
#   # without the pigpiod daemon running
#   pip install gpiozero

# # Download and Install PIGPIO LIB
# RUN cd /opt && \
#   wget https://github.com/joan2937/pigpio/archive/master.zip && \
#   unzip master.zip && \
#   rm master.zip && \
#   cd pigpio-master && \
#   make && \
#   make install   

# # Create a new user (default username is docker1)
# ARG NEW_USER=docker
# RUN useradd -m $NEW_USER

# # Switch to the new user's home directory
# USER $NEW_USER

# # Set the working directory to the new user's home directory
# WORKDIR /home/$NEW_USER
