cmake_minimum_required(VERSION 3.5.1)

project(gdal-example)

# Use modern C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


# netcdfxx
find_library(NetCDFCxx4 netcdf-cxx4)
#find_package(PkgConfig REQUIRED)
#pkg_check_modules(netcdf-cxx4 REQUIRED netcdf-cxx4)
set(LIBRARIES ${LIBRARIES} ${NetCDFCxx4})

#  netcdf
find_package(netCDF CONFIG REQUIRED)
set(LIBRARIES ${LIBRARIES} netcdf)

# openssl
find_package(OpenSSL REQUIRED)
set(LIBRARIES ${LIBRARIES} OpenSSL::SSL OpenSSL::Crypto)

# gdal
find_package(GDAL REQUIRED)
set(LIBRARIES ${LIBRARIES} GDAL::GDAL)

# proj4
find_package(PROJ4 REQUIRED)
#set(LIBRARIES ${LIBRARIES} PROJ4::proj)  # no need to link if you don't use it directly

get_target_property(PROJ4_RELEASE_DLL PROJ4::proj IMPORTED_LOCATION_RELEASE)
file(COPY ${PROJ4_RELEASE_DLL} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  get_filename_component(PROJ4_RELEASE_DLL_NAME ${PROJ4_RELEASE_DLL} NAME)  
  file(RENAME
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJ4_RELEASE_DLL_NAME}
    ${CMAKE_CURRENT_BINARY_DIR}/libproj.so)
endif()

add_executable(example example.cpp)
target_link_libraries(example ${LIBRARIES})
target_include_directories(example PRIVATE ${INCLUDES})
target_compile_definitions(example PRIVATE ${DEFINITIONS})
set_target_properties(example PROPERTIES INSTALL_RPATH "./" BUILD_RPATH "./")
