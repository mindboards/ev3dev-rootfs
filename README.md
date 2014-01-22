This repository contains the build scripts for ev3dev.

If you just want to use ev3dev, please see the
[main ev3dev repository](https://github.com/mindboards/ev3dev).

If you want to build the ev3dev kernel or root file system, read on.

ev3dev-rootfs
=============

These are the scripts used to compile the ev3dev kernel and build the root
file system.

Scirpts
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

1.  Create a working directory somewhere. For this tutorial, we are using
    ```~/work```.

        ~ $ mkdir work
        ~ $ cd work

2.  Clone the kernel and root file system repos.

        ~/work $ git clone git://github.com/mindboards/ev3dev-kernel
        ~/work $ git clone git://github.com/mindboards/ev3dev-rootfs

3.  Find something to do while the kernel is cloning. It is 15 million lines
    of code!

4.  Change to the ```ev3dev-rootfs``` director and have a look around.

        ~/work $ cd ev3dev-rootfs
        ~/work/ev3dev-rootfs $ ls
        build_ev3dev_setup          menuconfig         sdcard-img-mount
        build_extras                multistrap.conf    sdcard-img-populate
        build-kernel                README.md          update-defconfig
        install-kernel-build-tools  rootfs-create
        LICENSE                     sdcard-img-create


5.  Now we need to install the required tool. That is the
    ```install-kernel-build-tools``` script. (You only need to run this once.)

        ~/work/ev3dev-rootfs $ ./install-kernel-build-tools

6.  Now find something else to do again because we are about to compile
    the kernel.

        ~/work/ev3dev-rootfs $ ./build_kernel

7.  That's it! Now you just need to copy the files in ```kernel``` to your
    already formatted SD card.

        ~/work/ev3dev-rootfs $ cp kernel/uImage <path-to-boot-partition>/uImage
        ~/work/ev3dev-rootfs $ sudo cp -r kernel/lib/ <path-to-file-system-partition>





