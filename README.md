# Ryder Prototype Firmware

Ryder Prototype Firmware is the firmware that eventually will run on the Ryder device. 

For testing without a device, the Ryder Simulator can be used. It uses the same firmware as the device.

![Ryder Simulator](https://user-images.githubusercontent.com/1449049/188822058-7ff5bd66-7c76-40d5-b805-c7bdf6b1379c.png)

## How to use the Firmware with the Ryder Simulator and the Ryder Edition of Hiro Stacks Wallet
1. Download the latest firmware (it contains the simulator) and launch the simulator from a terminal. Note down the serial port.        
```jsx
$ ./ryder-sim-v2-linux-x86_64
RyderProto_V2 Simulator starting.
Opened virtual serialport on: /dev/pts/4
idle
```  
The serial port in the example above is `/dev/pts/4`. It can differ per system.

You should see a window of the simulator.

2. The Ryder Bridge connects the simulator with the Stacks Wallet or other apps. Clone the [Ryder Bridge repo](https://github.com/Light-Labs/ryder-bridge-rust) in a new terminal and use the serial port of the simulator and `localhost:8888`. 
```jsx
$ cargo run /dev/pts/4 localhost:8888
Listening on: localhost:8888
Ryder port: /dev/pts/4
```
        
3. Launch the Ryder version of Stacks Wallet. Clone the [`feat/ryder-dev` branch of the Stacks wallet repository](https://github.com/Light-Labs/stacks-wallet-web) in a third terminal and launch the chrome extension.
        
```jsx
yarn dev
```
        
4. Load the unpacked extension in your Chrome browser from the `dist` folder.
    
![chrome extension](https://user-images.githubusercontent.com/1449049/188821791-01ff2f70-0a41-4b14-82b5-960677307b64.png)

## Using the Ryder Edition of Hiro Stacks Wallet (extension)
First time using the simulator, you need to setup the device with a Secret Key.



