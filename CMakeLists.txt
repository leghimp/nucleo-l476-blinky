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
    Drivers/STM32L4xx_HAL_Driver/Inc
    Drivers/CMSIS/Device/ST/STM32L4xx/Include
    Drivers/CMSIS/Include
)

# Source files
set(CORE_SOURCES
    Core/Src/main.c
    Core/Src/stm32l4xx_it.c
    Core/Src/system_stm32l4xx.c
)

set(HAL_SOURCES
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c
)

set(SOURCES
    ${CORE_SOURCES}
    ${HAL_SOURCES}
)

# Add executable
add_executable(${PROJECT_NAME}.elf ${SOURCES})

# Define the MCU and HAL macros
target_compile_definitions(${PROJECT_NAME}.elf PRIVATE STM32L476xx USE_HAL_DRIVER)
