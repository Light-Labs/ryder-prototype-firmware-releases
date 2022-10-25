# Ryder Prototype Firmware

Ryder Prototype Firmware is the firmware that eventually will run on the Ryder device. 

For testing without a device, the Ryder Simulator can be used. It uses the same firmware as the device.

![Ryder Simulator](https://user-images.githubusercontent.com/1449049/188822058-7ff5bd66-7c76-40d5-b805-c7bdf6b1379c.png)

## How to get your Ryder Hardware up and running
This is only required if you're using the Ryder Hardware. For the Ryder Simulator these steps can be skipped.

<details>
	<summary>Updating your device</summary>

This requires Python and esptool to be installed. To install esptool, run "pip install esptool".

1. Download the latest firmware.
2. Plug in your device and find its serial port (COM Port on Windows).
3. Run the following command from Windows PowerShell to flash the latest firmware onto your device:
	```jsx
	esptool.py -p SERIAL_PORT write_flash 0x010000 FILE_NAME
	// Where SERIAL_PORT is the serial port (e.g. COM6).
	// And FILE_NAME is the path to the binary firmware file (e.g. firmware.bin).
	```
4. This starts flashing your device with the specified firmware. This might take a minute.

Your device should now be up-to-date.
</details>

<details>
	<summary>Setting up your device</summary>
	
<details>
	<summary>Windows</summary>

1. Download the "setup.ps1" script file from the "Commands/Windows" directory.
2. Plug in your device and find its serial port (COM Port on Windows).
3. Run the following command from Windows PowerShell to setup your device:
	```jsx
	setup.ps1 SERIAL_PORT
	// Where SERIAL_PORT is the serial port (e.g. COM6).
	```
4. This will prompt the setup process on your device. Follow all steps as displayed to complete the setup.

Your device should now be setup and ready to use.
</details>
	
<details>
	<summary>Linux/Mac</summary>
	
This will be added soon.
</details>
</details>


## How to use the Firmware with the Ryder Simulator and the Ryder Edition of Hiro Stacks Wallet
1. Download the latest firmware (it contains the simulator) and launch the simulator from a (Windows: PowerShell) terminal. Note down the serial port.

<details>
	<summary>Linux/Mac</summary>

```jsx
$ ./ryder-sim-v2-linux-x86_64

RyderProto_V2 Simulator starting.
Opened virtual serialport on: /dev/pts/4
idle
```

The serial port in the example above is `/dev/pts/4`. It can differ per system.

You should see a window of the simulator.
</details>

<details>
	<summary>Windows</summary>
	
For Windows users: use a virtual com driver (e.g. com0com) to create a com-port pair (for example: COM12 <-> COM13) and launch the Ryder Simulator from a PowerShell window:

```jsx
ryder-sim-v2-windows-x86_64.exe COM12

RyderProto_V2 Simulator starting.
Connected to \\.\COM12
idle
```

You should see a window of the simulator.
</details>


2. The Ryder Bridge connects the simulator with the Stacks Wallet or other apps. 
Clone the [Ryder Bridge repo](https://github.com/Light-Labs/ryder-bridge-rust) in a new (Windows: PowerShell) terminal and use the serial port of the simulator and `localhost:8888`. 

```jsx
$ cargo run /dev/pts/4 localhost:8888
Listening on: localhost:8888
Ryder port: /dev/pts/4
```


3. Launch the Ryder version of Stacks Wallet. 
Clone the [`feat/ryder-dev` branch of the Stacks wallet repository](https://github.com/Light-Labs/stacks-wallet-web). 
In a third (Windows: PowerShell) terminal build the extension.
   
```jsx
yarn build
```


4. Load the unpacked extension in your Chrome browser from the `dist` folder.
    
![chrome extension](https://user-images.githubusercontent.com/1449049/188821791-01ff2f70-0a41-4b14-82b5-960677307b64.png)

## Using the Ryder Edition of Hiro Stacks Wallet (extension)
First time using the simulator, you need to setup the device with a Secret Key. The simulator is not save, do not use the Secret Key for anything else than testing. Follow the flow on the device after clicking "Setup Ryder device".

Once the simulator is setup, use the "Connect your Ryder" link.
	
![image](https://user-images.githubusercontent.com/1449049/190499763-4c25a91c-752f-456b-969b-3a276d11a41d.png)
