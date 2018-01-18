# auto-detect subdirs
ifeq ($(CONFIG_BOARD_B1C1), y)
include $(srctree)/techpack/audio/config/b1c1auto.conf
export $(shell sed 's/=.*//' $(srctree)/techpack/audio/config/b1c1auto.conf)
else
ifeq ($(CONFIG_ARCH_SDM845), y)
include $(srctree)/techpack/audio/config/sdm845auto.conf
export $(shell sed 's/=.*//' $(srctree)/techpack/audio/config/sdm845auto.conf)
endif
ifeq ($(CONFIG_ARCH_SDM670), y)
include $(srctree)/techpack/audio/config/sdm670auto.conf
export $(shell sed 's/=.*//' $(srctree)/techpack/audio/config/sdm670auto.conf)
endif
ifeq ($(CONFIG_ARCH_SDXPOORWILLS), y)
include $(srctree)/techpack/audio/config/sdxpoorwillsauto.conf
export $(shell sed 's/=.*//' $(srctree)/techpack/audio/config/sdxpoorwillsauto.conf)
endif
endif # CONFIG_BOARD_B1C1

# Use USERINCLUDE when you must reference the UAPI directories only.
USERINCLUDE     += \
                -I$(srctree)/techpack/audio/include/uapi \

# Use LINUXINCLUDE when you must reference the include/ directory.
# Needed to be compatible with the O= option
LINUXINCLUDE    += \
                -I$(srctree)/techpack/audio/include/uapi \
                -I$(srctree)/techpack/audio/include
ifeq ($(CONFIG_BOARD_B1C1), y)
LINUXINCLUDE    += \
		-include $(srctree)/techpack/audio/config/b1c1autoconf.h
else
ifeq ($(CONFIG_ARCH_SDM845), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sdm845autoconf.h
endif
ifeq ($(CONFIG_ARCH_SDM670), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sdm670autoconf.h
endif
ifeq ($(CONFIG_ARCH_SDXPOORWILLS), y)
LINUXINCLUDE    += \
                -include $(srctree)/techpack/audio/config/sdxpoorwillsautoconf.h
endif
endif # CONFIG_BOARD_B1C1

obj-y += asoc/
obj-y += dsp/
obj-y += ipc/
obj-y += soc/
