# Godot plugin for Agones

## Clone with submodules
`git clone --recurse-submodules https://github.com/exitdoorgames/godot-agones.git`

## Download Agones
Somewhere else: `git clone https://github.com/googleforgames/agones.git`
Copy the folder `cp -r sdks/cpp <this_repo>/agones`

## Compile
Run `make` in the `agones` folder and in the `godot-cpp` folder to generate extra header files.

### Generate dynamic library with scons

`scons platform=linux bits=64 target=release bits=64`


## Create `.gdn` and `.gdns` files
Read more [here](https://docs.godotengine.org/en/3.0/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module).
