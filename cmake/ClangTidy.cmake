function(ClangTidy target directory)
  find_program(CLANG-TIDY_PATH clang-tidy REQUIRED)
  set(EXPRESSION h hpp hh c cc cxx cpp)
  list(TRANSFORM EXPRESSION PREPEND "${directory}/*.")
  file(GLOB_RECURSE SOURCE_FILES FOLLOW_SYMLINKS
       LIST_DIRECTORIES false ${EXPRESSION}
  )
  add_custom_command(TARGET ${target} PRE_BUILD COMMAND
    ${CLANG-TIDY_PATH} --fix -p ${CMAKE_BINARY_DIR}/compile_commands.json ${SOURCE_FILES}
  )
endfunction()
