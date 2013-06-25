# Note that the bjam bootstrap doesn't work with a unicode console: type
# 	chcp 437
# And it will work.
#
# This file will by default build the whole thing, there are a couple libraries
# singled out though. See below for details.

include config.mk
-include ../config.mk
-include ../local-config.mk
-include local-config.mk

BUILD_BOOST = $(BJAM) --toolset=$(TOOLSET) address-model=$(ADDRESS_MODEL) --using-python=$(PYTHON_VERSION) stage link=static -j$(NUM_PROCESSORS)

.PHONY: bjam debug release

all: debug release

bjam: $(BOOST_PATH)/$(BJAM)

$(BOOST_PATH)/$(BJAM):
	cd $(BOOST_PATH)/tools/build/v2/engine && /bin/cmd /c "build.bat $(BJAMTOOLSET)"

debug: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) debug

release: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) release

serialization: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-serialization debug release stage

filesystem: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-filesystem debug release stage cxxflags=-Zc:wchar_t-

thread: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-thread debug release stage

system: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-system debug release stage

program_options: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-program_options debug release stage

date_time: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-date_time debug release stage

regex: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-regex debug release stage

chrono: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-chrono debug release stage

signals: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-signals debug release stage

unit_test_framework: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --with-test debug release stage

show: bjam
	cd $(BOOST_PATH) && $(BUILD_BOOST) --show-libraries

clean:
	cd $(BOOST_PATH) && $(RM) -r \
  bin.v2 \
  stage \
  tools/build/v2/engine/bin.ntx86/b2.exe \
  tools/build/v2/engine/bin.ntx86/bjam.exe \
  tools/build/v2/engine/bootstrap/jam0.exe
