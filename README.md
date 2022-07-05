# Ryder Simulator

The Ryder simulator is a tool to experience Ryder as software. It uses the same firmware as the device.

## Instruction
1. Download the latest release from [github](https://github.com/Light-Labs/ryder-prototype-firmware-releases/releases/latest).
2. Unpack the zip archive.
3. Start the application.

The simulator is ready to use. 

You should see a window of the simulator and a message with the port that can be used to connect to the simulator:
```
RyderProto_V2 Simulator starting.
Opened virtual serialport on: **your local port** 
```

![Screenshot from 2022-07-05 11-25-26](https://user-images.githubusercontent.com/1449049/177296556-0965779f-bbde-491a-8f11-5b4a9ef2dfec.png)



## Connecting to the simulator

### Command line 
The command line tool with instructions is available at the [cli repo](https://github.com/Light-Labs/ryder-cli-proto).

### Hiro Wallet (extension)
In order to use the Hiro Wallet, [the Ryder bridge](https://github.com/Light-Labs/ryder-bridge-rust) is required. The bridge translates messages from the wallet through a web socket to serial communication with the simulator. The bridge needs to launched with the local port of the simulator and the url `localhost:8080` that the wallet will use for connecting to the bridge.

The custom version of the Hiro wallet is available at this git repo: https://github.com/Light-Labs/stacks-wallet-web


