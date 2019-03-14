FROM ubuntu:19.04

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
 git \
 bash \
 sudo

RUN git clone https://github.com/qmk/qmk_firmware.git /tmp/qmk_firmware/ 
WORKDIR /tmp/qmk_firmware/util
RUN bash -c "yes | source ./qmk_install.sh"
RUN echo 'alias copy="cp /keymaps/keymap.c /tmp/qmk_firmware/keyboards/ergodox_ez/keymaps/default/keymap.c"' >> ~/.bashrc
RUN echo 'alias run="(cd /tmp/qmk_firmware; make git-submodule; make ergodox_ez:default)"' >> ~/.bashrc
RUN echo 'alias get="cp /tmp/qmk_firmware/ergodox_ez_default.hex keymap.hex"' >> ~/.bashrc
RUN echo 'alias full="copy && run && get"' >> ~/.bashrc

WORKDIR /keymaps

