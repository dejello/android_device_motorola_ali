# twrp_device_motorola_ali

Device tree for building TWRP for the Moto G6 (ALI): Files have been modified from TWRPBuilder script and device tree from ADDISON---then modified much much more.

Decryption is currently in testing phase.  It works with OPSS27.104-15-10 for sure.  If you want to test, please make whatever backups you think you'll want before hand.



You can test building 64bit/prebuilt kernel or building by changing 
'ARCH_TYPE' and 'KERNEL_PREBUILT' variables in BoardConfig.mk



This should build using minimal TWRP manifest:

$ breakfast ali

$ mka recoveryimage
