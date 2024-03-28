#!/bin/bash

# Conan
conan config install -t dir .conan
conan install .

# Pre-commit
pre-commit install

# Submodules
git submodule update --init
