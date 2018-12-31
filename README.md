# Docker image: Ergodox_Compiler

This image is used to compile ergodox C files.

## Requirements

- Docker
- File named keymap.c

## Usage

Locate the folder of your keymap.c file

Run following command: 

```
	docker run --rm elaurendeau/ergodox_compiler -v /PATH_TO_keymap.c_FILE:/keymap
```

When the run is completed, you can retrieve the keymap.hex file located in the keymap.c directory.
