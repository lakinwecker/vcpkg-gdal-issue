MAKEFLAGS += --no-print-directory

ifeq ($(OS),Windows_NT)
scripts	:= $(dir $(shell where vcpkg.exe))scripts
else
scripts	:= $(dir $(shell which vcpkg))scripts
endif

triplet	:= $(VCPKG_DEFAULT_TRIPLET)

options	:= -DCMAKE_INSTALL_PREFIX="$(CURDIR)/build/$(triplet)/install"
options	+= -DCMAKE_TOOLCHAIN_FILE="$(scripts)/buildsystems/vcpkg.cmake"
options	+= -DVCPKG_TARGET_TRIPLET="$(triplet)"

target	:= example

type	?= debug

all: build/$(triplet)/$(type)/CMakeCache.txt
	@cmake --build build/$(triplet)/$(type)

run: build/$(triplet)/$(type)/CMakeCache.txt
	@cmake --build build/$(triplet)/$(type) --target $(target)
	@cd build/$(triplet)/$(type) && ./$(target)

clean:
	@cmake -E remove_directory build/$(triplet)

build/$(triplet)/debug/CMakeCache.txt: CMakeLists.txt $(source)
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Debug $(options) -B build/$(triplet)/debug

build/$(triplet)/release/CMakeCache.txt: CMakeLists.txt $(source)
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Release $(options) -B build/$(triplet)/release

.PHONY: all run clean
