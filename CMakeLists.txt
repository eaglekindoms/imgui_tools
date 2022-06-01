cmake_minimum_required(VERSION 3.20)
project(imgui_test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall -fexec-charset=GBK")
include(third_party/3rdparty.cmake)



add_executable(imgui_test src/imgui_test.cpp)
add_executable(sdl_test src/sdl_test.cpp)

target_link_libraries(imgui_test
        IMGUI_LIB
        ${GLFW_LIB}
        ${OPENGL_gl_LIBRARY})

target_link_libraries(sdl_test
        IMGUI_LIB
        SDL2::SDL2 SDL2::SDL2main
        ${OPENGL_gl_LIBRARY})
# copy sdl2 dll
file(GLOB SDL_DLL ${SDL2_BINARY_DIR}/*.dll)
file(COPY ${SDL_DLL} DESTINATION ${PROJECT_BINARY_DIR})
#set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "" FORCE)
#-DCMAKE_TOOLCHAIN_FILE=D:/sourcecode/vcpkg/scripts/buildsystems/vcpkg.cmake