#!python
import os

target = ARGUMENTS.get('target', 'release')
platform = ARGUMENTS.get('platform', 'linux')
bits = ARGUMENTS.get('bits', 64)

env = Environment()
env.Append(CCFLAGS = ['-fPIC', '-g','-O3', '-std=c++14'])
env.Append(LINKFLAGS = ['-ldl', '-lpthread', '-Wl,--no-undefined'])

def add_sources(sources, directory):
    for file in os.listdir(directory):
        if file.endswith('.cpp'):
            sources.append(directory + '/' + file)
agones_path = 'agones/sdks/cpp/.build/'
env.Append(CPPPATH=[
    '.',
    'src/',
    agones_path,
    agones_path+'gRPC/src/include',
    agones_path+'.install/Protobuf/include/',
    'agones/sdks/cpp/include',
    'godot-cpp/godot_headers/',
    'godot-cpp/include/',
    'godot-cpp/include/core/',
    'godot-cpp/include/gen/'
    ])
env.Append(LIBPATH=['godot-cpp/bin'] + [agones_path+lib for lib in ['', 'gRPC/.bin/', 'Protobuf/.bin/', 'zlib/.bin/', 'c-ares/.bin/lib/']])
env.Append(LIBS=['libgodot-cpp.linux.release.64'] + ['agones', 'grpc++', 'grpc',  'protobuf', 'z', 'gpr', 'address_sorting', 'cares'])

sources = []
add_sources(sources, 'src')

library = env.SharedLibrary(target='libagones', source=sources)
Default(library)
