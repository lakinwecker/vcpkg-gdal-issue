#include <iostream>
#include <netcdf>
#include <gdal_priv.h>

// Set to 1 and it will trigger the copy of the proj4 DLL, but this only
// works in Release mode because gdal always loads proj.dll, not proj_d.dll.
// (also requires set(LIBRARIES ${LIBRARIES} PROJ4::proj) in CMakeLists.txt)
#if 0
#define PROJ_MSVC_DLL_IMPORT
#include <proj/common.hpp>
osgeo::proj::common::Measure dummy_measure;
#endif

int main() {
    GDALAllRegister();

	OGRSpatialReference ref1, ref2;
	ref1.importFromEPSG(4326);
	ref2.importFromEPSG(2033);

	OGRPoint p(0, 0);
	p.assignSpatialReference(&ref1);
	p.transformTo(&ref2);
}
