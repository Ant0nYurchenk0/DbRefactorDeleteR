cmake_minimum_required(VERSION 3.0.0)
project(lab2 VERSION 0.1.0 LANGUAGES C)

include(CTest)
enable_testing()

add_executable(lab2 lex.yy.c parser.tab.c main.c)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
