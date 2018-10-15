# twrp_device_motorola_ali

Device Tree for Moto G6 (Ali)
===========================================

The Motorola Moto G6 (codenamed _"ali"_) is a mid-range smartphone from Motorola mobility.
It was announced on April 2018.

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 2.0 GHz Cortex-A53
Chipset | Qualcomm SDM450
GPU     | Adreno 506
Memory  | 3 GB RAM
Shipped Android Version | 8.0.0
Storage | 32 GB
MicroSD | Up to 256 GB
Battery | Li-Ion 3000mAh battery
Display | 1080 x 2160 pixels, 5.7 inches, 18:9 ratio (~424 ppi density)
Camera  | Dual - 12 MP, f/1.8, 1/2.55", 1.4µm, PDAF & 5 MP, f/2.2, depth sensor

Copyright 2018 - The LineageOS Project.

![Moto G6](https://cdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g6-2.jpg "Moto G6")


===========================================
Device tree for building TWRP for the Moto G6 (ALI): Files have been modified from TWRPBuilder script and device tree from ADDISON---then modified much much more.

Decryption is currently in testing phase.  For decryption to work you must flash this image.  If you want to test, please make whatever backups you think you'll want before hand.
===========================================
You can test building 64bit/prebuilt kernels or building by changing 
'ARCH_TYPE' and 'KERNEL_PREBUILT' variables in BoardConfig.mk


===========================================
This should build using minimal TWRP manifest:

$ breakfast ali

$ mka recoveryimage

