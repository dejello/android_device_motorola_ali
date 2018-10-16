TWRP Device Tree for Moto G6 (Ali)
===========================================

The Motorola Moto G6 (codenamed _"ali"_) is a mid-range smartphone from Motorola mobility.
It was announced on April 2018.

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 1.8 GHz Cortex-A53
Chipset | Qualcomm SDM450
GPU     | Adreno 506
Memory  | 4 or 3 GB RAM
Shipped Android Version | 8.0.0
Storage | 64 or 32 GB
MicroSD | Up to 256 GB
Battery | Li-Ion 3000mAh battery
Display | 1080 x 2160 pixels, 5.7 inches, 18:9 ratio (~424 ppi density)
Camera  | Dual - 12 MP, f/1.8, 1/2.55", 1.4µm, PDAF & 5 MP, f/2.2, depth sensor

Copyright 2018 - The LineageOS Project.

![Moto G6](https://cdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g6-2.jpg "Moto G6")


## NOTES: ##
Decryption is currently working with VOLD_DECRYPT only.  For it to work you seem to need to flash this image.

Please make whatever backups you think you'll want before hand.

--------------

This should build using minimal TWRP manifest. After cloning this repo into _`device/motorola/ali`_

```sh
$ breakfast ali
$ mka recoveryimage
```

