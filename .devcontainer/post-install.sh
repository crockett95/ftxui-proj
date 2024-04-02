#!/bin/bash

# Conan
conan config install -t dir .conan
conan install . --build=missing

# Pre-commit
pre-commit install

# Submodules
git submodule update --init
