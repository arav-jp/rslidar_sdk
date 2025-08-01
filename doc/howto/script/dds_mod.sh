# Copyright (c) 2020 RoboSense
# All rights reserved

# By downloading, copying, installing or using the software you agree to this license. If you do not agree to this
# license, do not download, install, copy or use the software.

# License Agreement
# For RoboSense LiDAR SDK Library
# (3-clause BSD License)

# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
# following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following
# disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided with the distribution.

# 3. Neither the names of the RoboSense, nor Suteng Innovation Technology, nor the names of other contributors may be used
# to endorse or promote products derived from this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#!/bin/bash

# Function to check if ROS 2 Humble is installed
check_ros2_humble_installed() {
    if [ -d "/opt/ros/humble" ]; then
        echo "ROS 2 Humble detected."
        return 0
    else
        echo "ROS 2 Humble not detected."
        return 1
    fi
}

# Change to the directory of the script
cd "$(dirname "$0")"

if check_ros2_humble_installed; then
    # Install Cyclone DDS implementation for ROS 2
    echo "Installing DDS..."
    sudo apt install ros-humble-rmw-cyclonedds-cpp
    #sudo apt install ros-rolling-rmw-cyclonedds-cpp
    
    # Set the RMW implementation environment variable
    export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    echo "Environment variable set"
else
    echo "Please ensure ROS 2 Humble is installed before proceeding."
fi
