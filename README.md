# Docker Image: Ergodox_Compiler #

This image is used to compile QMK ergodox C files.

## Requirement ##
* docker
* File named keymap.c

## Usage ##

Run the following command:

``` 
    docker run -it -v /PATH_TO_KEYMAP.c_FILE:/keymaps elaurendeau/ergodox_compiler 
```

Within the container, you can use the following commands:
* full (does everything)
* copy (copy your keymap.c to the qmk directory)
* run (compile your keymap.c into the hex file)
* get (bring the keymap.hex into the keymap directory)

## Docker hub repository ##

A [link](https://hub.docker.com/r/elaurendeau/ergodox_compiler "here").
