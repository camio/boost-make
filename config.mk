########################
# Choose your toolset
########################

# Visual studio.net 2003 is "msvc-7.1"
# Visual studio.net 2008 is "msvc-9.0"
# Visual studio.net 2010 is "msvc-10.0"
# Visual studio.net 2012 is "msvc-11.0"
# MinGW is gcc.
# Others: http://www.boost.org/doc/libs/1_46_0/more/getting_started/windows.html#identify-your-toolset
TOOLSET=msvc-10.0

########################
# Choose your bjam toolset
########################

# See the tools/build/v2/engine/src/build.bat script for this toolset
#     Examples: vc10, mingw
BJAMTOOLSET=mingw

PYTHON_VERSION=2.7
BJAM=tools/build/v2/engine/bin.ntx86/bjam.exe
ADDRESS_MODEL=64
#Change the -j option below for parallel builds.
NUM_PROCESSORS=4

BOOST_PATH=../boost
