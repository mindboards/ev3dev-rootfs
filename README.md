This repository contains the build scripts for ev3dev.

If you just want to use ev3dev, please see the
[main ev3dev repository](https://github.com/mindboards/ev3dev).

If you want to build the ev3dev kernel or root file system, read on.

ev3dev-rootfs
=============

These are the scripts used to compile the ev3dev kernel and build the root
file system.

System Requirements
-------------------
* Debian or derivative OS (Ubuntu, Mint, etc.)
* User account with ```sudo``` enabled

Scripts
-------

```build-kernel```               Used to build the kernel.

```install-kernel-build-tools``` Installs the prerequisite tools required
                                 to build the kernel.

```menuconfig```                 Runs the menu configuration tool for the
                                 kernel configuration.

```update-defconfig```           Updates the ev3dev_defconfig file with the
                                 current configuration.


First time kernel build
-----------------------

1.  If you don't have ```git``` already, then we need to install it.

        ~ $ sudo apt-get install git

2.  Create a working directory somewhere. For this tutorial, we are using
    ```~/work```. The build scripts will generate extra subdirectories here
    so we suggest creating a new directory instead of using an existing one.

        ~ $ mkdir work
        ~ $ cd work

3.  Clone the kernel and root file system repos.

        ~/work $ git clone git://github.com/mindboards/ev3dev-kernel
        ~/work $ git clone git://github.com/mindboards/ev3dev-rootfs

4.  Change to the ```ev3dev-rootfs``` director and have a look around.

        ~/work $ cd ev3dev-rootfs
        ~/work/ev3dev-rootfs $ ls
        build_ev3dev_setup          menuconfig         sdcard-img-mount
        build_extras                multistrap.conf    sdcard-img-populate
        build-kernel                README.md          update-defconfig
        install-kernel-build-tools  rootfs-create
        LICENSE                     sdcard-img-create


5.  Now we need to install the required tool. TO do this, just run the
    ```install-kernel-build-tools``` script. (You only need to run this once.)

        ~/work/ev3dev-rootfs $ ./install-kernel-build-tools

6.  Create a ```local-env``` to make use of all of your processing power. See the
    [Faster Builds and Custom Locations](#faster-builds-and-custom-locations)
    section below.

        ~/work/ev3dev-rootfs $ echo " #!/bin/sh
        
        export AM1808_MAKE_ARGS=-j4" > local-env

7.  Now we can compile the kernel.

        ~/work/ev3dev-rootfs $ ./build_kernel

8.  That's it! The uImage and kernel modules you just built are saved in
    ``../dist```. You just need to copy the files to your
    already formatted SD card.

        ~/work/ev3dev-rootfs $ cd ../dist
        ~/work/dist $ cp uImage <path-to-boot-partition>/uImage
        ~/work/dist $ sudo cp -r lib/ <path-to-file-system-partition>


Faster Builds and Custom Locations
----------------------------------

By default the locations of the kernel source tree and the toolchain used
to build the kernel are expected to be in certain directories relative to
the ev3dev-rootfs repo directory.

You can override these locations by creating a file called ```local-env```
in the ev3dev-rootfs directory or ```~/.ev3dev-env``` (in your home directory).
It should look like this:

    #!/bin/sh
    
    export AM1808_MAKE_ARGS=-j4
    
    # override any AM1808_* variables from setup-env script.
    #export AM1808_XXX=/custom/path

The ```-j4``` is for faster builds. It allows make to compile files in
in parallel. You should replace 4 with the number of processor cores that
you want to devote to building the kernel.

