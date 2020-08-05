# Godot plugin for Agones

## Clone with submodules
`git clone --recurse-submodules https://github.com/exitdoorgames/godot-agones.git`

## Compile

### Option 1: Generate dynamic library using Docker
This is a better option if you're not using linux, but it takes a while (~ 1hr). Consider spinning up a temporary cloud VM and using option 2 instead.
```
docker build -t libagones .
docker create --name export libagones
docker cp export:/godot/libagones.so .
docker rm export
```

### Option 2: Generate dynamic library using scons
Run on linux.<br>
This will compile the agones and godot cpp libs and then generate a shared lib from code in `src`.<br>
```
export MAKEFLAGS="$MAKEFLAGS -j$(nproc)"

mkdir agones/sdks/cpp/.build
cd agones/sdks/cpp/.build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -G "Unix Makefiles" -Wno-dev -DCMAKE_INSTALL_PREFIX=.install
cmake --build . --target install

cd ../../../../godot-cpp
scons bits=64 generate_bindings=yes platform=linux target=release
cd ..
scons platform=linux bits=64 target=release bits=64
```

## Create files for Godot in your project.
Godot uses `.gdnlib` and `.gdns` files to load the library dynamically.
Read more [here](https://docs.godotengine.org/en/3.0/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module).
