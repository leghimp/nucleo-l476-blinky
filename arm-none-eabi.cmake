# --- 1. Target System Information ---
# 'Generic' is the CMake keyword for "no Operating System" (Bare Metal)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# --- 2. Compiler Paths ---
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# --- 3. The "Magic" Fix ---
# This tells CMake: "When testing the compiler, just make an object file, 
# don't try to link a full Windows .exe". This bypasses your specific error.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# --- 4. Search Behavior ---
# Don't look for libraries or programs in the Windows host folders
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
