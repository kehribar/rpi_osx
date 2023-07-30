# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.12)

# ...
set(PROJECT_NAME "cv_test")
project(${PROJECT_NAME} C CXX)
SET(CMAKE_BUILD_TYPE RelWithDebInfo)

# ...
find_package(PkgConfig)
pkg_check_modules(OPENCV REQUIRED IMPORTED_TARGET opencv4)

# ...
include_directories("./src")
file(GLOB SOURCES
  "./src/main.cpp"
)

# ...
add_executable(${PROJECT_NAME} ${SOURCES})

# ...
target_link_libraries(${PROJECT_NAME} PUBLIC
  PkgConfig::OPENCV
)
