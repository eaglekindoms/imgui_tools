cmake_minimum_required(VERSION 3.20)
project(imgui_test)

set(CMAKE_CXX_STANDARD 11)

set(IMGUI_PATH ./third_party/imgui)
set(GL_INCLUDE D:/SDK_PATH/glad)
set(GLFW_INCLUDE D:/SDK_PATH/GLFW_3_3_2/include)
set(GLFW_LIB D:/SDK_PATH/GLFW_3_3_2/lib-vc2019/static/glfw3.lib)

find_package(OpenGL REQUIRED)

include_directories(
        ${IMGUI_PATH}
        ${IMGUI_PATH}/backends
        ${GLFW_INCLUDE}
        ${GL_INCLUDE}
)
file(GLOB imgui_impl
        ${IMGUI_PATH}/*.cpp
        ${IMGUI_PATH}/backends/imgui_impl_glfw.cpp
        ${IMGUI_PATH}/backends/imgui_impl_opengl3.cpp
        )
add_library(imgui_lib STATIC ${imgui_impl})

add_executable(imgui_test main.cpp)

target_link_libraries(imgui_test
        imgui_lib
        ${GLFW_LIB}
        ${OPENGL_gl_LIBRARY})

#set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "" FORCE)
#-DCMAKE_TOOLCHAIN_FILE=D:/sourcecode/vcpkg/scripts/buildsystems/vcpkg.cmake