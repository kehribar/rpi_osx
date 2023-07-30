# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------
set(CLANG_PATH "/opt/homebrew/opt/llvm/bin")
set(CMAKE_SYSROOT "${CMAKE_CURRENT_LIST_DIR}/../sysroot")
set(PKG_CONFIG_EXECUTABLE "${CMAKE_CURRENT_LIST_DIR}/../util/pkg-config-custom")
set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN "/opt/homebrew/opt/arm-linux-gnueabihf-binutils")
set(CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN})

# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------

# ..
set(CROSS_COMPILE 1)
set(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_SYSTEM_PROCESSOR arm)

# ...
include_directories(${CMAKE_SYSROOT}/usr/include/c++/10)
include_directories(${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf)
include_directories(${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf/c++/10)

# ...
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-a53")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfpu=neon-vfpv4 -mfloat-abi=hard")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -B${CMAKE_SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/10")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -L${CMAKE_SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/10")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,-rpath-link=${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wl,-rpath-link=${CMAKE_SYSROOT}/usr/lib")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-command-line-argument")

# ...
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")

# ...
set(CLANG_TARGET_TRIPLE arm-linux-gnueabihf)
set(GCC_ARM_TOOLCHAIN_PREFIX ${CLANG_CLANG_TARGET_TRIPLE})

# ...
set(CMAKE_C_COMPILER ${CLANG_PATH}/clang)
set(CMAKE_ASM_COMPILER ${CLANG_PATH}/clang)
set(CMAKE_CXX_COMPILER ${CLANG_PATH}/clang++)

# ...
set(CMAKE_C_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})
set(CMAKE_CXX_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})
set(CMAKE_ASM_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})
