# rpi_osx

Cross compile Raspberry PI OS (aka Raspbian) applications from MacOS systems.

## Why?

Based on the complexity of your project, compiling C++ applications natively on Raspberry PI can be quite slow.

You want to compile C++ applications for your Raspberry Pi from your MacOS computer for faster iteration cycles.

Also, you want to use whatever library (like OpenCV, ZeroMQ, libcamera etc.) you installed to your Raspberry Pi from `apt-get` while developing C++ applications.

## How?

* Install llvm, binutils and rsync via homebrew to your MacOS system.
	- `brew install arm-linux-gnueabihf-binutils llvm rsync`
	- The ones come with the operating system is not capable for this task.
* Make sure your Raspberry Pi is connected to your network and SSH is enabled.
* Edit Makefile and change your Raspberry Pi username and network address.
* Hit `make sysroot_update` and download *neccessary* folders from your Raspberry Pi.
	- You need to update this each time you install another package to your Raspberry Pi via `apt install`
* Then, hit `make project` and create a Makefile based on your CMake file.
	- This example assumes you already installed `libopencv-dev` to your Raspberry Pi via `apt install`
* Go to `build` folder, hit `make all` and see that `cv_test` binary is generated.
	- Transfer this file to your Raspberry Pi using `scp`
* Profit.

## Where is the detailed tutorial?

I don't have time to write one ...

## Why not buildroot?

If you have buildroot and custom OS, then this approach is irrelevant. Buildroot already comes with cross compiling support etc.

This project is for raspbian based systems.

## Reference

This project is based on the following articles and many others:

*  <https://medium.com/@haraldfernengel/cross-compiling-c-c-from-macos-to-raspberry-pi-in-2-easy-steps-23f391a8c63>
* <https://medium.com/@zw3rk/making-a-raspbian-cross-compilation-sdk-830fe56d75ba>
* <https://stackoverflow.com/questions/9221236/pkg-config-fails-to-find-package-under-sysroot-directory>