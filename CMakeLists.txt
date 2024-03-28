cmake_minimum_required(VERSION 3.23)
project(tui-tutorial
        VERSION 0.0.1
        DESCRIPTION "Playing with some stuff"
        LANGUAGES CXX)

find_package(ftxui)

add_executable(${PROJECT_NAME}
                src/main.cpp)

target_link_libraries(${PROJECT_NAME} ftxui::ftxui)
