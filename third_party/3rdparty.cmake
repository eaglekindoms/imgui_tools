find_package(OpenGL REQUIRED)

# glad
set(GL_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/glad)
include_directories(${GL_INCLUDE})

# glfw
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)
option(GLFW_INSTALL OFF)
add_subdirectory(${CMAKE_SOURCE_DIR}/third_party/glfw)
set(GLFW_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/glfw/include)
set(GLFW_LIB ${GLFW_LIBRARIES} glfw)
include_directories(${GLFW_INCLUDE})

# sdl2
set(SDL2_DISABLE_UNINSTALL ON CACHE BOOL "Disable uninstallation of SDL2" FORCE)
set(SDL_SHARED ON)
set(SDL_STATIC OFF)
add_subdirectory(${CMAKE_SOURCE_DIR}/third_party/sdl2)
set(SDL2_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/sdl2/include)
include_directories(${SDL2_INCLUDE})

# imgui
set(IMGUI_PATH ${CMAKE_SOURCE_DIR}/third_party/imgui)
file(GLOB imgui_impl
        ${IMGUI_PATH}/*.cpp
        ${IMGUI_PATH}/backends/imgui_impl_glfw.cpp
        ${IMGUI_PATH}/backends/imgui_impl_sdl.cpp
        ${IMGUI_PATH}/backends/imgui_impl_opengl3.cpp
        )
add_library(IMGUI_LIB STATIC ${imgui_impl})
include_directories(
        ${IMGUI_PATH}
        ${IMGUI_PATH}/backends
)