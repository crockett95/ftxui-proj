include(FetchContent)
FetchContent_Declare(Boost.Application
  GIT_REPOSITORY  https://github.com/retf/Boost.Application.git
  GIT_TAG 4d0cf24587694a67a58bb20614d035e059f103c8
)
FetchContent_Populate(Boost.Application)
message(DEBUG "Boost.Application ${boost.application_POPULATED}")
add_library(Boost.Application INTERFACE)
target_include_directories(
    Boost.Application SYSTEM INTERFACE
    "${boost.application_SOURCE_DIR}/include")
