cmake_minimum_required(VERSION 3.20)
project(imgui_test)

set(CMAKE_CXX_STANDARD 11)
include(third_party/3rdparty.cmake)

include_directories(
        ${IMGUI_PATH}
        ${IMGUI_PATH}/backends
        ${GLFW_INCLUDE}
        ${GL_INCLUDE}
)

add_executable(imgui_test main.cpp)

target_link_libraries(imgui_test
        imgui_lib
        ${GLFW_LIB}
        ${OPENGL_gl_LIBRARY})

#set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "" FORCE)
#-DCMAKE_TOOLCHAIN_FILE=D:/sourcecode/vcpkg/scripts/buildsystems/vcpkg.cmake