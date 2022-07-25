# Project config
PROJ := nunchuck

PROJ_DEPS :=
PROJ_RTL_SRCS := $(addprefix rtl/, \
	I2C_master.v \
	draw_led.v \
	decoder_led.v \
	ws2812.v \
)
# PROJ_TOP_SRC := rtl/fading_white.v
PROJ_TOP_SRC := rtl/top_nunchuck.v
PROJ_TOP_MOD := top

# Include default rules
include ../_common/build.mk
