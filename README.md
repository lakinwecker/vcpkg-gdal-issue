On Linux:


```
gdal-example on  master [?]
➜ cd ~/software/vcpkg

vcpkg on  master
➜ git rev-parse HEAD
f07efb4a1dfebf4f9d55308785e65c74b68de269

vcpkg on  master
➜ ./bootstrap-vcpkg.sh
-- The C compiler identification is GNU 9.2.0
-- The CXX compiler identification is GNU 9.2.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/g++
-- Check for working CXX compiler: /usr/bin/g++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Looking for pthread_create
-- Looking for pthread_create - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - yes
-- Found Threads: TRUE
-- Configuring done
-- Generating done
-- Build files have been written to: /home/lakin/software/vcpkg/toolsrc/build.rel
[0/2] Re-checking globbed directories...
[66/66] Linking CXX executable vcpkg

vcpkg on  master took 33s
➜ ./vcpkg install gdal netcdf-c netcdf-cxx4 proj4
The following packages are already installed:
    gdal[core]:x64-linux
    netcdf-c[core]:x64-linux
    netcdf-cxx4[core]:x64-linux
    proj4[core,database]:x64-linux
Starting package 1/4: proj4:x64-linux
Package proj4:x64-linux is already installed
Elapsed time for package proj4:x64-linux: 30.83 us
Starting package 2/4: netcdf-cxx4:x64-linux
Package netcdf-cxx4:x64-linux is already installed
Elapsed time for package netcdf-cxx4:x64-linux: 17.95 us
Starting package 3/4: gdal:x64-linux
Package gdal:x64-linux is already installed
Elapsed time for package gdal:x64-linux: 21.7 us
Starting package 4/4: netcdf-c:x64-linux
Package netcdf-c:x64-linux is already installed
Elapsed time for package netcdf-c:x64-linux: 17.51 us

Total elapsed time: 132.6 us

The package proj4:x64-linux provides CMake targets:

    find_package(proj4 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE proj PROJ4::proj)

The package netcdf-c provides CMake targets:

    find_package(netCDF CONFIG REQUIRED)
    target_link_libraries(main PRIVATE netcdf)

vcpkg on  master
➜ cd ~/school-repos/gdal-example

gdal-example on  master [?]
➜ mkdir .release

gdal-example on  master [?]
➜ cd .release

gdal-example/.release on  master [?]
➜ cat ~/bin/cmake-release
#!/bin/bash
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_TOOLCHAIN_FILE=/home/lakin/software/vcpkg/scripts/buildsystems/vcpkg.cmake ..


gdal-example/.release on  master [?]
➜ cmake-release
-- The C compiler identification is Clang 9.0.0
-- The CXX compiler identification is Clang 9.0.0
-- Check for working C compiler: /usr/bin/clang
-- Check for working C compiler: /usr/bin/clang -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/clang++
-- Check for working CXX compiler: /usr/bin/clang++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found OpenSSL: /home/lakin/software/vcpkg/installed/x64-linux/lib/libcrypto.a (found version "1.0.2s")
-- Found GDAL: /home/lakin/software/vcpkg/installed/x64-linux/lib/libgdal.so (found version "2.4.1")
-- Reading /home/lakin/software/vcpkg/installed/x64-linux/share/proj4/proj4-config.cmake
-- PROJ4 configuration, version 6.2.0
-- Configuring done
-- Generating done
-- Build files have been written to: /home/lakin/school-repos/gdal-example/.release
gdal-example/.release on  master [?]
➜ make

Scanning dependencies of target example
[ 50%] Building CXX object CMakeFiles/example.dir/example.cpp.o
[100%] Linking CXX executable example
[100%] Built target example

gdal-example/.release on  master [?]
➜ ./example
ERROR 6: Unable to load PROJ.4 library (libproj.so), creation of OGRCoordinateTransformation failed.

gdal-example/.release on  master [?]
➜ ls -la
total 21572
drwxr-xr-x 3 lakin lakin     4096 Nov 21 11:26 .
drwxr-xr-x 4 lakin lakin     4096 Nov 21 11:25 ..
-rw-r--r-- 1 lakin lakin    17711 Nov 21 11:26 CMakeCache.txt
drwxr-xr-x 5 lakin lakin     4096 Nov 21 11:26 CMakeFiles
-rw-r--r-- 1 lakin lakin     1543 Nov 21 11:26 cmake_install.cmake
-rw-r--r-- 1 lakin lakin      445 Nov 21 11:26 compile_commands.json
-rwxr-xr-x 1 lakin lakin 22040368 Nov 21 11:26 example
-rw-r--r-- 1 lakin lakin     4870 Nov 21 11:26 Makefile

gdal-example/.release on  master [?]
➜ find ~/software/vcpkg/installed -name "*proj.so"

gdal-example/.release on  master [?]
➜
```
