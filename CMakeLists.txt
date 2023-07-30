# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.12)

# ...
set(PROJECT_NAME "test")
project(${PROJECT_NAME} C CXX)
SET(CMAKE_BUILD_TYPE RelWithDebInfo)

# ...
find_package(PkgConfig)
pkg_check_modules(LIBCAMERA REQUIRED IMPORTED_TARGET libcamera)
pkg_check_modules(OPENCV REQUIRED IMPORTED_TARGET opencv4)
pkg_check_modules(ZMQ REQUIRED IMPORTED_TARGET libzmq)

# ...
file(GLOB SOURCES
  "hello.cpp"
)

# ...
add_executable(${PROJECT_NAME} ${SOURCES})

# ...
target_link_libraries(${PROJECT_NAME} PUBLIC
  PkgConfig::LIBCAMERA
  PkgConfig::OPENCV
  PkgConfig::ZMQ
  opencv_core
)
