#include <iostream>
#include <netcdf>
#include <gdal_priv.h>

int main() {
    GDALAllRegister();

	OGRSpatialReference ref1, ref2;
	ref1.importFromEPSG(4326);
	ref2.importFromEPSG(2033);

	OGRPoint p(0, 0);
	p.assignSpatialReference(&ref1);
	p.transformTo(&ref2);
}
