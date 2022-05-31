find_package(OpenGL REQUIRED)

set(IMGUI_PATH ${CMAKE_SOURCE_DIR}/third_party/imgui)
set(GL_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/glad)

# glfw
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)
option(GLFW_INSTALL OFF)
add_subdirectory( ${CMAKE_SOURCE_DIR}/third_party/glfw)
set_target_properties(glfw PROPERTIES FOLDER 3rdparty) # Override standard 'GLFW3' subfolder
set(GLFW_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/glfw/include)
set(GLFW_DEFINITIONS -DGLFW_INCLUDE_NONE)
set(GLFW_LIB ${GLFW_LIBRARIES} glfw)

# sdl2
option(SDL2_DISABLE_INSTALL ON)
option(SDL2_DISABLE_UNINSTALL ON)
set(SDL_SHARED ON)
set(SDL_STATIC OFF)
add_subdirectory( ${CMAKE_SOURCE_DIR}/third_party/sdl2)
set(SDL2_INCLUDE ${CMAKE_SOURCE_DIR}/third_party/sdl2/include)


# imgui
file(GLOB imgui_impl
        ${IMGUI_PATH}/*.cpp
        ${IMGUI_PATH}/backends/imgui_impl_glfw.cpp
        ${IMGUI_PATH}/backends/imgui_impl_sdl.cpp
        ${IMGUI_PATH}/backends/imgui_impl_opengl3.cpp
        )
add_library(IMGUI_LIB STATIC ${imgui_impl})
