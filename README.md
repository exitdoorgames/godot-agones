# Godot plugin for Agones

## Clone with submodules
`git clone --recurse-submodules https://github.com/exitdoorgames/godot-agones.git`

## Compile

### Option 1: Generate dynamic library with Docker
This is a better option if you're not using linux, but it takes a while (~ 1hr). Consider spinning up a container and using option 2 instead.
```
docker build -t libagones .
docker create --name export libagones
docker cp export:/godot/libagones.so .
docker rm export
```

### Option 2: Generate dynamic library with scons
This works on linux.
`export CXXFLAGS="$CXXFLAGS -fPIC"$`<br>
`export MAKEFLAGS="$MAKEFLAGS -j$(nproc)"`<br>
Run `make` in the `agones/sdks/cpp` folder.<br>
Run `scons bits=64 generate_bindings=yes platform=linux target=release` in the `godot-cpp` folder.<br>
`scons platform=linux bits=64 target=release bits=64`


## Create files for Godot in your project.
Godot uses `.gdnlib` and `.gdns` files to load the library dynamically.
Read more [here](https://docs.godotengine.org/en/3.0/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module).
