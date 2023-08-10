echo "==============================================================================="
echo "=============================EXAMPLES=========================================="
echo 'Example file was taken from: https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.20230809/conus/hrrr.t00z.wrfnatf00.grib2'
echo 'export DIR=abs_path_to/apps/Library'
echo "***NOTE: The compiled 'lib' directory must be appended to 'LD_LIBRARY_PATH!'"
echo "         Otherwise, the wgrib2 executable will not work."
echo "         '$DIR' is the same variable defined in the previous step. '$LD_LIBRARY_PATH' shouldn't be changed. Enter as is..."
echo 'export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH'
echo "***Note: The following makes wgrib2 callable at any location. 'PATH' is the absolute path to the wgrib2 executable."
echo 'export PATH="abs_path_to/grib2/wgrib2:$PATH"'
echo "==============================================================================="
export HOME=/home/walters.michael@corp.weatherconsultants.com/tools
export DIR=${HOME}/apps/Library
export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH
echo $DIR/lib
export PATH=$HOME/grib2/wgrib2:$PATH
echo "==============================================================================="
echo "=============================EXAMPLE 01========================================"
echo "***Subset specific grib2 fields.***"
echo "wgrib2 hrrr.grib2 -s | egrep ':TMP:2 m|UGRD:10 m|VGRD:10 m' | wgrib2 -i hrrr.grib2 -grib subset.grib2"
wgrib2 hrrr.grib2 -s | egrep ':TMP:2 m|UGRD:10 m|VGRD:10 m' | wgrib2 -i hrrr.grib2 -grib subset.grib2
sleep 5
echo "==============================================================================="
echo "=============================EXAMPLE 02========================================"
echo "***Get a list of all available variables in grib2 file.***"
echo "wgrib2 -var subset.grib2"
wgrib2 -var hrrr.grib2
sleep 5
echo "==============================================================================="
echo "=============================EXAMPLE 03========================================"
echo "***Determine nearest n-bor value at lon,lat.***"
echo "wgrib2 subset.grib2 -s -lon -71.0589 42.3601"
wgrib2 subset.grib2 -s -lon -71.0589 42.3601
sleep 5
echo "==============================================================================="
echo "=============================EXAMPLE 04========================================"
echo "***Subset grid based on N,E,S,W bounds.***"
echo "wgrib2 subset.grib2 -small_grib -80:-60 35:45 subset-domain.grib2"
wgrib2 subset.grib2 -small_grib -80:-60 35:45 subset-domain.grib2
sleep 5
echo "==============================================================================="
echo "=============================EXAMPLE 05========================================"
echo "***Convert grib2 to netcdf4 file.***"
echo "wgrib2 subset.grib2 -netcdf subset.nc"
wgrib2 subset.grib2 -netcdf subset.nc
