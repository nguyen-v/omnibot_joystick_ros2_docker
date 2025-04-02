#!/bin/bash
docker run -it --rm \
  --privileged \
  --net=host \
  -v /dev:/dev/ \
  --user $(id -u):$(id -g) \
  -e HOME=/tmp \
  joystick_ros2:latest \
  ros2 launch joy_to_cmd_vel joy_to_cmd_vel_launch.py