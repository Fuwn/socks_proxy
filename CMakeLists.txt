cmake_minimum_required(VERSION 3.15)

project(proxy)

string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UPPER)

set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_COMPILER "gcc")
set(CMAKE_C_FLAGS "-c -pthread -Wno-unused-result -g -std=gnu99 -Wall")
set(CMAKE_EXE_LINKER_FLAGS "-pthread")

add_executable(${PROJECT_NAME} main.c)

install(TARGETS ${PROJECT_NAME})
