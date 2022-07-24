# Project config
PROJ := ws2812-blink

PROJ_DEPS :=
PROJ_RTL_SRCS := $(addprefix rtl/, \
	ws2812.v \
)
PROJ_TOP_SRC := rtl/top_leds.v
# PROJ_TOP_SRC := rtl/ws2812_blink.v
PROJ_TOP_MOD := top

# Include default rules
include ../_common/build.mk
