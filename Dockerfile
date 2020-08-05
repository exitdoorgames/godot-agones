FROM python:3.8-slim-buster
ENV REPO "https://github.com/exitdoorgames/godot-agones.git"
ENV AGONES_VERSION "1.7.0"

RUN apt-get update && apt-get install -y --no-install-recommends git scons g++ wget

WORKDIR /godot
RUN git clone --recurse-submodules $REPO .

RUN cd /godot/godot-cpp && scons bits=64 generate_bindings=yes platform=linux target=release
RUN cd /godot

RUN wget https://github.com/googleforgames/agones/releases/download/v${AGONES_VERSION}/agonessdk-${AGONES_VERSION}-linux-arch_64.tar.gz -O agones.tar.gz
RUN tar xf agones.tar.gz

RUN scons platform=linux target=release bits=32
RUN files="$(ls -1 /godot/)" && echo $files
