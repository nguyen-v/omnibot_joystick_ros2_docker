#!/bin/bash
docker run -it --rm \
  --privileged \
  --net=host \
  --device=/dev/input/js0 \
  joystick_ros2:latest \
  ros2 launch joy_to_cmd_vel joy_to_cmd_vel_launch.py