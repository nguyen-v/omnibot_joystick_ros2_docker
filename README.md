## Requirements
This docker container is meant to be used with the Logitech Attack 3 joystick. It was written to control an omnidirectional robot.

## Controls
The robot's linear velocity can be controlled with the joystick's handle (x-y velocity).

The robot's angular velocity can be controlled with the left and right buttons situated at the top of the handle.

To change the robot's speed, press on the button behind the handle and at the same time, turn the dial at the base of the joystick.

The commands are sent as a `TwistStamped` message.

## Building the docker image
```bash
docker build -t joystick_ros2:latest .
```

## Running the node
```bash
./docker-run.sh
```