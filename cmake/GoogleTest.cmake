macro(EnableGTest)
    enable_testing()

    include(GoogleTest)
    include(Coverage)
    include(Memcheck)
    include(CTest)
endmacro(EnableGTest)


macro(AddTests target)
  AddCoverage(${target})
  target_link_libraries(${target} PRIVATE gtest_main gmock)
  gtest_discover_tests(${target})
  AddMemcheck(${target})
endmacro()
