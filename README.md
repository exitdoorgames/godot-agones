# Agones client for Godot
** Unfortunately I could not overcome an issue with newer agonessdk libs having non-PIC code :(
Leaving this up even though it doesn't work.

## Clone
`git clone https://github.com/exitdoorgames/godot-agones.git`

## Compile

### Generate dynamic library using Docker
```
docker build -t libagones .
docker create --name export libagones
docker cp export:/godot/libagones.so .
docker rm export
```

## Create files for Godot in your project.
Godot uses `.gdnlib` and `.gdns` files to load the library dynamically.
Read more [here](https://docs.godotengine.org/en/3.0/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module).
