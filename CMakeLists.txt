cmake_minimum_required(VERSION 3.23)
project(tui-tutorial
        VERSION 0.0.1
        DESCRIPTION "Playing with some stuff"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(NoInSourceBuilds)
include(ClangFormat)
include(ClangTidy)

find_package(ftxui)
find_package(Boost)

include(BoostApplication)
include(BoostDI)

add_executable(${PROJECT_NAME}
                src/main.cpp)

ClangFormat(${PROJECT_NAME} src)
ClangTidy(${PROJECT_NAME} src)

target_link_libraries(${PROJECT_NAME} ftxui::ftxui Boost.Application Boost.DI boost::boost)
