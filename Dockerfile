FROM python:3.8-slim-buster
ENV REPO "https://github.com/exitdoorgames/godot-agones.git"

RUN apt-get update && apt-get install -y --no-install-recommends git scons g++ make g++-multilib cmake

WORKDIR /godot
RUN git clone --recurse-submodules $REPO .

RUN export MAKEFLAGS="$MAKEFLAGS -j$(nproc)"

RUN mkdir /godot/agones/sdks/cpp/.build
RUN mkdir /godot/agones/sdks/cpp/.install
RUN cd /godot/agones/sdks/cpp/.build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -G "Unix Makefiles" -Wno-dev -DCMAKE_INSTALL_PREFIX=.install
RUN cd /godot/agones/sdks/cpp/.build && cmake --build . --target install
RUN cd /godot/godot-cpp && scons bits=64 generate_bindings=yes platform=linux target=release
RUN cd /godot

RUN scons platform=linux bits=64 target=release bits=64
RUN files="$(ls -1 /godot/)" && echo $files
