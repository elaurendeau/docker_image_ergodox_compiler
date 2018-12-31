#!/bin/bash
set -e

export WORKDIR_PATH=/tmp/qmk_firmware
export SOURCE_PATH=/keymap
export SOURCE_FILE=$SOURCE_PATH/keymap.c
export TARGET_FILE=$SOURCE_PATH/keymap.hex

if [ ! -f "$SOURCE_FILE" ]; then
	echo "File '$SOURCE_FILE' not found."
	exit 1
fi

git clone https://github.com/qmk/qmk_firmware.git $WORKDIR_PATH
sudo yes Y | $WORKDIR_PATH/util/qmk_install.sh

cp $SOURCE_PATH/keymap.c $WORKDIR_PATH/keyboards/ergodox_ez/keymaps/default/keymap.c

(cd $WORKDIR_PATH; make git-submodule; make ergodox_ez:default)

cp $WORKDIR_PATH/ergodox_ez_default.hex $TARGET_FILE

echo "Sucess: compiled file has been copied at '$TARGET_FILE'."
exit 0
