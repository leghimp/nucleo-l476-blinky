cmake_minimum_required(VERSION 3.22)

# Project name and languages
project(nucleo-l476-blinky C ASM)

# Tell CMake which compiler to use
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Compiler flags for Cortex-M4
set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -O0 -g3 -Wall")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

# Include directories for headers
include_directories(
    Core/Inc
)

# Source files
set(SOURCES
    Core/Src/main.c
)

# Add executable
add_executable(${PROJECT_NAME}.elf ${SOURCES})
