# Agones client for Godot

## Clone with submodules
`git clone --recurse-submodules https://github.com/exitdoorgames/godot-agones.git`

## Compile

### Generate dynamic library using Docker
This takes a while (~ 1hr).<br>
Consider running in the cloud if your machine isn't up to the task.
```
docker build -t libagones .
docker create --name export libagones
docker cp export:/godot/libagones.so .
docker rm export
```

## Create files for Godot in your project.
Godot uses `.gdnlib` and `.gdns` files to load the library dynamically.<br>
Read more [here](https://docs.godotengine.org/en/3.0/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module).
Sample `.gndlib` file below. Note the `Server` entry for loading libaries in the godot server.
```
[general]

singleton=false
load_once=true
symbol_prefix="godot_"
reloadable=true

[entry]

X11.64="res://libagonesclient.so"
Server="res://libagonesclient.so"

[dependencies]

X11.64=[  ]
Server=[  ]
```
