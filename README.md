TWRP Device Tree for X96 Max (u212)
===================================

The X96 Max (codenamed _"u211/212"_ or _"franklin"_) have following parameters:

Basic                   | Spec Sheet
-----------------------:|:-------------------------
CPU                     | Octa-core Amlogic S905X2
GPU                     | Mali-G31 MP2 Dvalin
Shipped Android Version | Android 8.1
Memory                  | 32 or 64 GB + 4GB LPDDR3 RAM
MicroSD                 | microSD, up to 512 GB (dedicated slot)
Network                 | Gigabit Ethernet, WIFI 802.11 b/g/n/ac, Bluetooth 4.0
Video                   | HDMI 2.1 to 4K with 75 Hz + HDR, AV 3,5mm.
USB                     | USB 3,0x1, USB 2,0x1
Power Supply            | 5V/2A
Misc                    | IR-port, and microSD Slot

![X96 Max](https://imgaz3.staticbg.com/thumb/large/oaupload/banggood/images/D0/6D/44667003-0534-4050-9249-6ab6dff88431.jpg "X96 Max")

## Compile

First checkout Minimal TWRP with OmniROM Tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
repo sync
```

And execute these:

```
export ALLOW_MISSING_DEPENDENCIES=true # Only if using Minimal TWRP Tree
. build/envsetup.sh
lunch omni_u212-eng
mka recoveryimage
```

After compilation, recovery image will be located in:
```
out/target/product/u212
```

## Installing:
> [!NOTE]
> I will only cover the UART + Fastboot way here, though you can use Official TWRP App (If you have root access on your device), or through any temporary TWRP.

Preparations:
```
- Find UART pins on your device (GND, TX, RX, 3.3V)
- Connect wires to them (You don't need to connect 3.3V pin anywhere)
- Connect this wires to UART -> USB adapter (RX/TX pins on device should be connected in reverse to TX/RX on adapter)
- Now connect to UART inteface through software like Minicom or Putty
- After you connected to UART interface, start your device and hit Enter or Space or Ctrl-C to stop booting into system
- You will be in u-boot command prompt now. Enter 'fastboot' command and connect with USB->USB cable to your device. Now you can enter fastboot commands in your PC system's terminal or command prompt
```

> [!NOTE]
> You can either flash TWRP to recovery partition, or just boot to it for one time, if you don't want to replace your recovery
> Downwards you will see fastboot commands for this

Testing it:
```
fastboot boot recovery.img
```

Flashing it:
```
fastboot flash recovery recovery.img
```
