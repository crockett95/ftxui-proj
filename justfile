default:
    @echo 'Hello, world!'

init:
    conan install . --build=missing
    cmake --preset conan-release

build: init
    cmake --build --preset conan-release

test: build
    ctest --preset conan-release
