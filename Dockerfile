# Use ARM64-compatible ROS2 base image
FROM arm64v8/ros:jazzy
ENV ROS_DISTRO=jazzy
# WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3-colcon-common-extensions \
    python3-pip \
    ros-${ROS_DISTRO}-joy \
    && rm -rf /var/lib/apt/lists/*


# Set workspace directory
WORKDIR /app

# Clone the sllidar_ros2 repository
RUN mkdir -p src
WORKDIR /app/src
RUN git clone https://github.com/nguyen-v/omnibot_joystick_ros2.git

# Build the workspace with colcon
WORKDIR /app
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash && colcon build --symlink-install"

# Copy the entrypoint script and ensure it’s executable
COPY docker_entrypoint.sh /app/
RUN chmod +x /app/docker_entrypoint.sh

# Set the entrypoint and default command
ENTRYPOINT ["/app/docker_entrypoint.sh"]
CMD ["bash"]