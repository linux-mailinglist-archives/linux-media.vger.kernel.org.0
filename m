Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8EC258013
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 20:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgHaSCT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 14:02:19 -0400
Received: from mga11.intel.com ([192.55.52.93]:9386 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgHaSCK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 14:02:10 -0400
IronPort-SDR: fcmymSdEVjbFYxyjp9vERZPUdVjiz7Zgg9BrNSml2OUTyi0P5eQ2R2dLrvh47GRQXBdfTP1KNz
 5ZWGpIet3guQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="154550198"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="154550198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 10:41:04 -0700
IronPort-SDR: Nvmq9UfQt0auKySPFHi6UqKMflodhp0gK2p32jb1kcN4u3KFgnzgt6Ula3Ewl4V2yue5BWqiIX
 tPFk4LLuReUg==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="333423139"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 10:40:59 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 53A0720623; Mon, 31 Aug 2020 20:40:57 +0300 (EEST)
Date:   Mon, 31 Aug 2020 20:40:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Xingyu Wu <wuxy@bitland.com.cn>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, davem@davemloft.net,
        shawnx.tu@intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, manivannan.sadhasivam@linaro.org,
        bingbu.cao@intel.com, tfiga@chromium.org, drinkcat@chromium.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dongchun.zhu@mediatek.com,
        sj.huang@mediatek.com, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        hao.he@bitland.com.cn
Subject: Re: [PATCH V3 3/3] media: i2c: gc5035: Add GC5035 image sensor driver
Message-ID: <20200831174057.GO31019@paasikivi.fi.intel.com>
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
 <1597380295-6297-5-git-send-email-wuxy@bitland.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597380295-6297-5-git-send-email-wuxy@bitland.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xingyu,

Thanks for the update. I've got a few more comments below.

Do you happen to have some insight on what the OTP data contains and what
does the driver do with it?

At least in principle the OTP data may be programmed for the customer so
the same sensor could contain something else what the driver expects to
find there.

On Fri, Aug 14, 2020 at 12:44:55PM +0800, Xingyu Wu wrote:
> From: Hao He <hao.he@bitland.com.cn>
> 
> Add a V4L2 sub-device driver for GC5035 image sensor.
> 
> Signed-off-by: Hao He <hao.he@bitland.com.cn>
> Signed-off-by: Xingyu Wu <wuxy@bitland.com.cn>
> ---
>  .../bindings/media/i2c/galaxycore,gc5035.yaml      |    6 +-
>  MAINTAINERS                                        |    1 +
>  drivers/media/i2c/Kconfig                          |   12 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/gc5035.c                         | 1953 ++++++++++++++++++++
>  5 files changed, 1970 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/i2c/gc5035.c
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml
> index aa681f7..7df94dd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml
> @@ -52,9 +52,9 @@ properties:
>  
>    reset-gpios:
>      description:
> -      The phandle and specifier for the GPIO that controls sensor reset.
> -      This pin need to be low for the reset to be active, it should be
> -      marked GPIO_ACTIVE_LOW.
> +      Reference to the GPIO connected to the RESET pin, if any. This
> +      pin is active-low.

This goes to the DT binding patch.

Active polarity is a property of the GPIO, it does not go to bindings.

> +    maxItems: 1
>  
>    port:
>      type: object
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 386c7a2..db0663f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7116,6 +7116,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc5035.yaml
> +F:	drivers/media/i2c/gc5035.c
>  
>  GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
>  M:	Tim Harvey <tharvey@gateworks.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index da11036..aeaf594 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -712,6 +712,18 @@ config VIDEO_APTINA_PLL
>  config VIDEO_SMIAPP_PLL
>  	tristate
>  
> +config VIDEO_GC5035
> +	tristate "Galaxycore GC5035 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API

Add:

	V4L2_FWNODE
	OF

> +	help
> +	  This is a Video4Linux2 sensor driver for the Galaxycore
> +	  GC5035 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gc5035.
> +
>  config VIDEO_HI556
>  	tristate "Hynix Hi-556 sensor support"
>  	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 993acab..22fa6ab 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -119,5 +119,6 @@ obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> +obj-$(CONFIG_VIDEO_GC5035) += gc5035.o
>  
>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> diff --git a/drivers/media/i2c/gc5035.c b/drivers/media/i2c/gc5035.c
> new file mode 100644
> index 0000000..b54512b
> --- /dev/null
> +++ b/drivers/media/i2c/gc5035.c
> @@ -0,0 +1,1953 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Bitland Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* Chip ID */
> +#define CHIP_ID						0x5035
> +#define GC5035_REG_CHIP_ID_H				0xf0
> +#define GC5035_REG_CHIP_ID_L				0xf1
> +#define GC5035_ID(_msb, _lsb)				((_msb) << 8 | (_lsb))
> +
> +/* Page mode control */
> +#define GC5035_PAGE_REG					0xfe
> +#define GC5035_PAGE_MODE_0				0x00
> +#define GC5035_PAGE_MODE_1				0x01
> +#define GC5035_PAGE_MODE_2				0x02
> +#define GC5035_PAGE_MODE_3				0x03
> +
> +/* Exposure control */
> +#define GC5035_REG_EXPOSURE_H				0x03
> +#define GC5035_REG_EXPOSURE_L				0x04
> +#define GC5035_EXPOSURE_MIN				4
> +#define GC5035_EXPOSURE_STEP				1
> +
> +/* Analog gain control */
> +#define GC5035_REG_ANALOG_GAIN				0xb6
> +#define ANALOG_GAIN_MIN					0x0
> +#define ANALOG_GAIN_MAX					0x1f
> +#define ANALOG_GAIN_STEP				1
> +#define ANALOG_GAIN_DEFAULT				0
> +
> +/* Digital gain control */
> +#define GC5035_REG_DIGI_GAIN_H				0xb1
> +#define GC5035_REG_DIGI_GAIN_L				0xb2
> +#define GC5035_DIGI_GAIN_MIN				0
> +#define GC5035_DIGI_GAIN_MAX				0x3ff
> +#define GC5035_DIGI_GAIN_STEP				1
> +#define GC5035_DIGI_GAIN_DEFAULT			1023
> +
> +/* Test pattern control */
> +#define GC5035_REG_TEST_PATTERN				0x8c
> +#define GC5035_TEST_PATTERN_ENABLE			0x11
> +#define GC5035_TEST_PATTERN_DISABLE			0x10
> +
> +/* Vblank control */
> +#define GC5035_REG_VTS_H				0x41
> +#define GC5035_REG_VTS_L				0x42
> +#define GC5035_VTS_MAX					0x3fff
> +#define MARGIN						16
> +#define REG_NULL					0xff
> +
> +/* OTP flag */
> +#define GC5035_OTP_FLAG_EMPTY				0x00
> +#define GC5035_OTP_FLAG_VALID				0x01
> +#define GC5035_OTP_FLAG_INVALID				0x02
> +#define GC5035_CHECK_FLAG(flag, bit)			(((flag) >> (bit)) & 0x01)
> +#define GC5035_GET_2BIT_FLAG(flag, bit)			(((flag) >> (bit)) & 0x03)
> +
> +#define GC5035_OTP_ID_SIZE				9
> +#define GC5035_OTP_ID_DATA_OFFSET			0x0020
> +#define GC5035_OTP_DATA_LENGTH				1024
> +
> +/* OTP DPC parameters */
> +#define GC5035_OTP_DPC_FLAG_OFFSET			0x0068
> +#define GC5035_OTP_DPC_TOTAL_NUMBER_OFFSET		0x0070
> +#define GC5035_OTP_DPC_ERROR_NUMBER_OFFSET		0x0078
> +
> +/* OTP register parameters */
> +#define GC5035_OTP_REG_FLAG_OFFSET			0x0880
> +#define GC5035_OTP_REG_DATA_OFFSET			0x0888
> +#define GC5035_OTP_REG_ADDR_OFFSET			1
> +#define GC5035_OTP_REG_VAL_OFFSET			2
> +#define GC5035_OTP_PAGE_FLAG_OFFSET			3
> +#define GC5035_OTP_PER_PAGE_SIZE			4
> +#define GC5035_OTP_REG_PAGE_MASK			0x07
> +#define GC5035_OTP_REG_MAX_GROUP			5
> +#define GC5035_OTP_REG_BYTE_PER_GROUP			5
> +#define GC5035_OTP_REG_PER_GROUP			2
> +#define GC5035_OTP_REG_BYTE_PER_REG			2
> +#define GC5035_OTP_REG_DATA_SIZE			25
> +#define GC5035_OTP_REG_SIZE				10
> +
> +#define GC5035_OTP_MODE_REG				0xf3
> +#define GC5035_OTP_PRE_READ				0x20
> +#define GC5035_OTP_READ_MODE				0x12
> +#define GC5035_OTP_READ_DONE				0x00
> +#define GC5035_OTP_DATA_REG				0x6c
> +#define GC5035_OTP_ADDR_MASK				0x1fff
> +#define GC5035_OTP_ADDR_OFFSET				3
> +#define GC5035_OTP_ACCESS_ADDR_H			0x69
> +#define GC5035_OTP_ACCESS_ADDR_L			0x6a
> +#define GC5035_READ_ONE_BYTE				1
> +#define GC5035_OTP_BIT_LOAD				0
> +#define GC5035_REG_DD_TOTALNUM_H			0x01
> +#define GC5035_REG_DD_TOTALNUM_L			0x02
> +#define GC5035_DD_DELAY_US				(10 * 1000)
> +#define GC5035_MAX_RETRY				3
> +
> +/* Shift and mask constants */
> +#define GC5035_SHIFT_8_BITS				8
> +#define GC5035_SHIFT_2_BITS				8
> +#define GC5035_MASK_LSB_3_BITS				0x07
> +#define GC5035_MASK_LSB_5_BITS				0x1f
> +#define GC5035_MASK_LSB_6_BITS				0x3f
> +#define GC5035_MASK_LSB_8_BITS				0xff
> +#define GC5035_MASK_DGAIN_REG_H				0x0f
> +#define GC5035_MASK_DGAIN_REG_L				0xfc
> +
> +#define HZ_PER_MHZ					1000000L
> +#define GC5035_BASE_LINK				438
> +#define GC5035_BASE_XVCLK				24
> +#define GC5035_LINK_FREQ_438MHZ				(GC5035_BASE_LINK * HZ_PER_MHZ)
> +#define GC5035_XVCLK_FREQ				(GC5035_BASE_XVCLK * HZ_PER_MHZ)

I'd use plain number without macros here.

> +#define GC5035_DATA_LANES				2
> +#define GC5035_BITS_PER_SAMPLE				10
> +
> +#define GC5035_REG_CTRL_MODE				0x3e
> +#define GC5035_MODE_SW_STANDBY				0x01
> +#define GC5035_MODE_STREAMING				0x91
> +
> +static const char * const gc5035_supply_names[] = {
> +	"iovdd",	/* Power supply for I/O circuits */
> +	"dvdd",		/* Digital core power */
> +	"avdd",		/* Analog power */
> +};
> +
> +#define GC5035_NUM_SUPPLIES ARRAY_SIZE(gc5035_supply_names)
> +
> +struct regval {
> +	u8 addr;
> +	u8 val;
> +};
> +
> +struct gc5035_reg {
> +	u8 page;
> +	struct regval regval;
> +};
> +
> +struct gc5035_otp_regs {
> +	u8 flag;
> +	u8 cnt;
> +	struct gc5035_reg reg[GC5035_OTP_REG_SIZE];
> +};
> +
> +struct gc5035_dpc {
> +	u8 flag;
> +	u16 total_num;
> +};
> +
> +struct gc5035_otp {
> +	u8 otp_id[GC5035_OTP_ID_SIZE];
> +	struct gc5035_dpc dpc;
> +	struct gc5035_otp_regs regs;
> +} gc5035_otp_data;
> +
> +struct gc5035_mode {
> +	u32 width;
> +	u32 height;
> +	u32 max_fps;
> +	u32 hts_def;
> +	u32 vts_def;
> +	u32 exp_def;
> +	const struct regval *reg_list;
> +};
> +
> +struct gc5035 {
> +	struct i2c_client	*client;
> +	struct clk		*xvclk;
> +	struct gpio_desc	*reset_gpio;
> +	struct regulator_bulk_data supplies[GC5035_NUM_SUPPLIES];
> +
> +	struct v4l2_subdev	subdev;
> +	struct media_pad	pad;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl	*exposure;
> +	struct v4l2_ctrl	*again;
> +	struct v4l2_ctrl	*dgain;
> +	struct v4l2_ctrl	*hblank;
> +	struct v4l2_ctrl	*vblank;
> +	struct v4l2_ctrl	*test_pattern;

Please only keep the controls you really need to refer directly. Storing
the pointer here isn't otherwise needed, nor the field.

> +
> +	/*
> +	 * Serialize control access, get/set format, get selection
> +	 * and start streaming.
> +	 */
> +	struct mutex		mutex;
> +	bool			streaming;
> +	const struct gc5035_mode *cur_mode;
> +};
> +
> +static inline struct gc5035 *to_gc5035(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct gc5035, subdev);
> +}
> +
> +static const struct regval gc5035_otp_init_regs[] = {
> +	{0xfc, 0x01},
> +	{0xf4, 0x40},
> +	{0xf5, 0xe9},
> +	{0xf6, 0x14},
> +	{0xf8, 0x49},
> +	{0xf9, 0x82},
> +	{0xfa, 0x00},
> +	{0xfc, 0x81},
> +	{0xfe, 0x00},
> +	{0x36, 0x01},
> +	{0xd3, 0x87},
> +	{0x36, 0x00},
> +	{0x33, 0x00},
> +	{0xf7, 0x01},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xee, 0x30},
> +	{0xfa, 0x10},
> +	{0xf5, 0xe9},
> +	{0xfe, 0x02},
> +	{0x67, 0xc0},
> +	{0x59, 0x3f},
> +	{0x55, 0x84},
> +	{0x65, 0x80},
> +	{0x66, 0x03},
> +	{0xfe, 0x00},
> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct regval gc5035_otp_exit_regs[] = {
> +	{0xfe, 0x02},
> +	{0x67, 0x00},
> +	{0xfe, 0x00},
> +	{0xfa, 0x00},
> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct regval gc5035_dd_auto_load_regs[] = {
> +	{0xfe, 0x02},
> +	{0xbe, 0x00},
> +	{0xa9, 0x01},
> +	{0x09, 0x33},
> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct regval gc5035_otp_dd_regs[] = {
> +	{0x03, 0x00},
> +	{0x04, 0x80},
> +	{0x95, 0x0a},
> +	{0x96, 0x30},
> +	{0x97, 0x0a},
> +	{0x98, 0x32},
> +	{0x99, 0x07},
> +	{0x9a, 0xa9},
> +	{0xf3, 0x80},
> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct regval gc5035_otp_dd_enable_regs[] = {
> +	{0xbe, 0x01},
> +	{0x09, 0x00},
> +	{0xfe, 0x01},
> +	{0x80, 0x02},
> +	{0xfe, 0x00},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * Pclk 87.6Mhz
> + * grabwindow_width 2592
> + * grabwindow_height 1944
> + * max_framerate 30fps
> + * mipi_datarate per lane 876Mbps
> + */
> +static const struct regval gc5035_global_regs[] = {
> +	/*init*/
> +	{0xfc, 0x01},
> +	{0xf4, 0x40},
> +	{0xf5, 0xe9},
> +	{0xf6, 0x14},
> +	{0xf8, 0x49},
> +	{0xf9, 0x82},
> +	{0xfa, 0x00},
> +	{0xfc, 0x81},
> +	{0xfe, 0x00},
> +	{0x36, 0x01},
> +	{0xd3, 0x87},
> +	{0x36, 0x00},
> +	{0x33, 0x00},
> +	{0xfe, 0x03},
> +	{0x01, 0xe7},
> +	{0xf7, 0x01},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xee, 0x30},
> +	{0x87, 0x18},
> +	{0xfe, 0x01},
> +	{0x8c, 0x90},
> +	{0xfe, 0x00},
> +
> +	/* Analog & CISCTL */
> +	{0xfe, 0x00},
> +	{0x05, 0x02},
> +	{0x06, 0xda},
> +	{0x9d, 0x0c},
> +	{0x09, 0x00},
> +	{0x0a, 0x04},
> +	{0x0b, 0x00},
> +	{0x0c, 0x03},
> +	{0x0d, 0x07},
> +	{0x0e, 0xa8},
> +	{0x0f, 0x0a},
> +	{0x10, 0x30},
> +	{0x11, 0x02},
> +	{0x17, 0x80},
> +	{0x19, 0x05},
> +	{0xfe, 0x02},
> +	{0x30, 0x03},
> +	{0x31, 0x03},
> +	{0xfe, 0x00},
> +	{0xd9, 0xc0},
> +	{0x1b, 0x20},
> +	{0x21, 0x48},
> +	{0x28, 0x22},
> +	{0x29, 0x58},
> +	{0x44, 0x20},
> +	{0x4b, 0x10},
> +	{0x4e, 0x1a},
> +	{0x50, 0x11},
> +	{0x52, 0x33},
> +	{0x53, 0x44},
> +	{0x55, 0x10},
> +	{0x5b, 0x11},
> +	{0xc5, 0x02},
> +	{0x8c, 0x1a},
> +	{0xfe, 0x02},
> +	{0x33, 0x05},
> +	{0x32, 0x38},
> +	{0xfe, 0x00},
> +	{0x91, 0x80},
> +	{0x92, 0x28},
> +	{0x93, 0x20},
> +	{0x95, 0xa0},
> +	{0x96, 0xe0},
> +	{0xd5, 0xfc},
> +	{0x97, 0x28},
> +	{0x16, 0x0c},
> +	{0x1a, 0x1a},
> +	{0x1f, 0x11},
> +	{0x20, 0x10},
> +	{0x46, 0x83},
> +	{0x4a, 0x04},
> +	{0x54, 0x02},
> +	{0x62, 0x00},
> +	{0x72, 0x8f},
> +	{0x73, 0x89},
> +	{0x7a, 0x05},
> +	{0x7d, 0xcc},
> +	{0x90, 0x00},
> +	{0xce, 0x18},
> +	{0xd0, 0xb2},
> +	{0xd2, 0x40},
> +	{0xe6, 0xe0},
> +	{0xfe, 0x02},
> +	{0x12, 0x01},
> +	{0x13, 0x01},
> +	{0x14, 0x01},
> +	{0x15, 0x02},
> +	{0x22, 0x7c},
> +	{0x91, 0x00},
> +	{0x92, 0x00},
> +	{0x93, 0x00},
> +	{0x94, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +
> +	/* Gain */
> +	{0xfe, 0x00},
> +	{0xb0, 0x6e},
> +	{0xb1, 0x01},
> +	{0xb2, 0x00},
> +	{0xb3, 0x00},
> +	{0xb4, 0x00},
> +	{0xb6, 0x00},
> +
> +	/* ISP */
> +	{0xfe, 0x01},
> +	{0x53, 0x00},
> +	{0x89, 0x03},
> +	{0x60, 0x40},
> +
> +	/* BLK */
> +	{0xfe, 0x01},
> +	{0x42, 0x21},
> +	{0x49, 0x03},
> +	{0x4a, 0xff},
> +	{0x4b, 0xc0},
> +	{0x55, 0x00},
> +
> +	/* Anti_blooming */
> +	{0xfe, 0x01},
> +	{0x41, 0x28},
> +	{0x4c, 0x00},
> +	{0x4d, 0x00},
> +	{0x4e, 0x3c},
> +	{0x44, 0x08},
> +	{0x48, 0x02},
> +
> +	/* Crop */
> +	{0xfe, 0x01},
> +	{0x91, 0x00},
> +	{0x92, 0x08},
> +	{0x93, 0x00},
> +	{0x94, 0x07},
> +	{0x95, 0x07},
> +	{0x96, 0x98},
> +	{0x97, 0x0a},
> +	{0x98, 0x20},
> +	{0x99, 0x00},
> +
> +	/* MIPI */
> +	{0xfe, 0x03},
> +	{0x02, 0x57},
> +	{0x03, 0xb7},
> +	{0x15, 0x14},
> +	{0x18, 0x0f},
> +	{0x21, 0x22},
> +	{0x22, 0x06},
> +	{0x23, 0x48},
> +	{0x24, 0x12},
> +	{0x25, 0x28},
> +	{0x26, 0x08},
> +	{0x29, 0x06},
> +	{0x2a, 0x58},
> +	{0x2b, 0x08},
> +	{0xfe, 0x01},
> +	{0x8c, 0x10},
> +
> +	{0xfe, 0x00},
> +	{0x3e, 0x01},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * Pclk 87.6Mhz
> + * grabwindow_width 2592
> + * grabwindow_height 1944
> + * max_framerate 30fps
> + * mipi_datarate per lane 876Mbps
> + */
> +static const struct regval gc5035_2592x1944_regs[] = {
> +	/* System */
> +	{0xfe, 0x00},
> +	{0x3e, 0x01},
> +	{0xfc, 0x01},
> +	{0xf4, 0x40},
> +	{0xf5, 0xe9},
> +	{0xf6, 0x14},
> +	{0xf8, 0x49},
> +	{0xf9, 0x82},
> +	{0xfa, 0x00},
> +	{0xfc, 0x81},
> +	{0xfe, 0x00},
> +	{0x36, 0x01},
> +	{0xd3, 0x87},
> +	{0x36, 0x00},
> +	{0x33, 0x00},
> +	{0xfe, 0x03},
> +	{0x01, 0xe7},
> +	{0xf7, 0x01},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xee, 0x30},
> +	{0x87, 0x18},
> +	{0xfe, 0x01},
> +	{0x8c, 0x90},
> +	{0xfe, 0x00},
> +
> +	/* Analog & CISCTL */
> +	{0xfe, 0x00},
> +	{0x05, 0x02},
> +	{0x06, 0xda},
> +	{0x9d, 0x0c},
> +	{0x09, 0x00},
> +	{0x0a, 0x04},
> +	{0x0b, 0x00},
> +	{0x0c, 0x03},
> +	{0x0d, 0x07},
> +	{0x0e, 0xa8},
> +	{0x0f, 0x0a},
> +	{0x10, 0x30},
> +	{0x21, 0x48},
> +	{0x29, 0x58},
> +	{0x44, 0x20},
> +	{0x4e, 0x1a},
> +	{0x8c, 0x1a},
> +	{0x91, 0x80},
> +	{0x92, 0x28},
> +	{0x93, 0x20},
> +	{0x95, 0xa0},
> +	{0x96, 0xe0},
> +	{0xd5, 0xfc},
> +	{0x97, 0x28},
> +	{0x1f, 0x11},
> +	{0xce, 0x18},
> +	{0xd0, 0xb2},
> +	{0xfe, 0x02},
> +	{0x14, 0x01},
> +	{0x15, 0x02},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +
> +	/* BLK */
> +	{0xfe, 0x01},
> +	{0x49, 0x03},
> +	{0x4a, 0xff},
> +	{0x4b, 0xc0},
> +
> +	/* Anti_blooming */
> +	{0xfe, 0x01},
> +	{0x4e, 0x3c},
> +	{0x44, 0x08},
> +
> +	/* Crop */
> +	{0xfe, 0x01},
> +	{0x91, 0x00},
> +	{0x92, 0x08},
> +	{0x93, 0x00},
> +	{0x94, 0x07},
> +	{0x95, 0x07},
> +	{0x96, 0x98},
> +	{0x97, 0x0a},
> +	{0x98, 0x20},
> +	{0x99, 0x00},
> +
> +	/* MIPI */
> +	{0xfe, 0x03},
> +	{0x02, 0x57},
> +	{0x22, 0x06},
> +	{0x26, 0x08},
> +	{0x29, 0x06},
> +	{0x2b, 0x08},
> +	{0xfe, 0x01},
> +	{0x8c, 0x10},
> +
> +	{0xfe, 0x00},
> +	{0x3e, 0x91},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * Pclk 87.6Mhz
> + * grabwindow_width 1296
> + * grabwindow_height 972
> + * mipi_datarate per lane 876Mbps
> + */
> +static const struct regval gc5035_1296x972_regs[] = {
> +	/*NULL*/
> +	{0xfe, 0x00},
> +	{0x3e, 0x01},
> +	{0xfc, 0x01},
> +	{0xf4, 0x40},
> +	{0xf5, 0xe4},
> +	{0xf6, 0x14},
> +	{0xf8, 0x49},
> +	{0xf9, 0x12},
> +	{0xfa, 0x01},
> +	{0xfc, 0x81},
> +	{0xfe, 0x00},
> +	{0x36, 0x01},
> +	{0xd3, 0x87},
> +	{0x36, 0x00},
> +	{0x33, 0x20},
> +	{0xfe, 0x03},
> +	{0x01, 0x87},
> +	{0xf7, 0x11},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xee, 0x30},
> +	{0x87, 0x18},
> +	{0xfe, 0x01},
> +	{0x8c, 0x90},
> +	{0xfe, 0x00},
> +
> +	/* Analog & CISCTL */
> +	{0xfe, 0x00},
> +	{0x05, 0x02},
> +	{0x06, 0xda},
> +	{0x9d, 0x0c},
> +	{0x09, 0x00},
> +	{0x0a, 0x04},
> +	{0x0b, 0x00},
> +	{0x0c, 0x03},
> +	{0x0d, 0x07},
> +	{0x0e, 0xa8},
> +	{0x0f, 0x0a},
> +	{0x10, 0x30},
> +	{0x21, 0x60},
> +	{0x29, 0x30},
> +	{0x44, 0x18},
> +	{0x4e, 0x20},
> +	{0x8c, 0x20},
> +	{0x91, 0x15},
> +	{0x92, 0x3a},
> +	{0x93, 0x20},
> +	{0x95, 0x45},
> +	{0x96, 0x35},
> +	{0xd5, 0xf0},
> +	{0x97, 0x20},
> +	{0x1f, 0x19},
> +	{0xce, 0x18},
> +	{0xd0, 0xb3},
> +	{0xfe, 0x02},
> +	{0x14, 0x02},
> +	{0x15, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +
> +	/* BLK */
> +	{0xfe, 0x01},
> +	{0x49, 0x00},
> +	{0x4a, 0x01},
> +	{0x4b, 0xf8},
> +
> +	/* Anti_blooming */
> +	{0xfe, 0x01},
> +	{0x4e, 0x06},
> +	{0x44, 0x02},
> +
> +	/* Crop */
> +	{0xfe, 0x01},
> +	{0x91, 0x00},
> +	{0x92, 0x04},
> +	{0x93, 0x00},
> +	{0x94, 0x03},
> +	{0x95, 0x03},
> +	{0x96, 0xcc},
> +	{0x97, 0x05},
> +	{0x98, 0x10},
> +	{0x99, 0x00},
> +
> +	/* MIPI */
> +	{0xfe, 0x03},
> +	{0x02, 0x58},
> +	{0x22, 0x03},
> +	{0x26, 0x06},
> +	{0x29, 0x03},
> +	{0x2b, 0x06},
> +	{0xfe, 0x01},
> +	{0x8c, 0x10},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * Pclk 87.6Mhz
> + * linelength 672{0x2a0)
> + * framelength 2232{0x8b8)
> + * grabwindow_width 1280
> + * grabwindow_height 720
> + * max_framerate 30fps
> + * mipi_datarate per lane 876Mbps
> + */
> +static const struct regval gc5035_1280x720_regs[] = {
> +	/* System */
> +	{0xfe, 0x00},
> +	{0x3e, 0x01},
> +	{0xfc, 0x01},
> +	{0xf4, 0x40},
> +	{0xf5, 0xe4},
> +	{0xf6, 0x14},
> +	{0xf8, 0x49},
> +	{0xf9, 0x12},
> +	{0xfa, 0x01},
> +	{0xfc, 0x81},
> +	{0xfe, 0x00},
> +	{0x36, 0x01},
> +	{0xd3, 0x87},
> +	{0x36, 0x00},
> +	{0x33, 0x20},
> +	{0xfe, 0x03},
> +	{0x01, 0x87},
> +	{0xf7, 0x11},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8f},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xee, 0x30},
> +	{0x87, 0x18},
> +	{0xfe, 0x01},
> +	{0x8c, 0x90},
> +	{0xfe, 0x00},
> +
> +	/* Analog & CISCTL */
> +	{0xfe, 0x00},
> +	{0x05, 0x02},
> +	{0x06, 0xda},
> +	{0x9d, 0x0c},
> +	{0x09, 0x00},
> +	{0x0a, 0x04},
> +	{0x0b, 0x00},
> +	{0x0c, 0x03},
> +	{0x0d, 0x07},
> +	{0x0e, 0xa8},
> +	{0x0f, 0x0a},
> +	{0x10, 0x30},
> +	{0x21, 0x60},
> +	{0x29, 0x30},
> +	{0x44, 0x18},
> +	{0x4e, 0x20},
> +	{0x8c, 0x20},
> +	{0x91, 0x15},
> +	{0x92, 0x3a},
> +	{0x93, 0x20},
> +	{0x95, 0x45},
> +	{0x96, 0x35},
> +	{0xd5, 0xf0},
> +	{0x97, 0x20},
> +	{0x1f, 0x19},
> +	{0xce, 0x18},
> +	{0xd0, 0xb3},
> +	{0xfe, 0x02},
> +	{0x14, 0x02},
> +	{0x15, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfe, 0x00},
> +	{0xfc, 0x88},
> +	{0xfe, 0x10},
> +	{0xfe, 0x00},
> +	{0xfc, 0x8e},
> +
> +	/* BLK */
> +	{0xfe, 0x01},
> +	{0x49, 0x00},
> +	{0x4a, 0x01},
> +	{0x4b, 0xf8},
> +
> +	/* Anti_blooming */
> +	{0xfe, 0x01},
> +	{0x4e, 0x06},
> +	{0x44, 0x02},
> +
> +	/* Crop */
> +	{0xfe, 0x01},
> +	{0x91, 0x00},
> +	{0x92, 0x0a},
> +	{0x93, 0x00},
> +	{0x94, 0x0b},
> +	{0x95, 0x02},
> +	{0x96, 0xd0},
> +	{0x97, 0x05},
> +	{0x98, 0x00},
> +	{0x99, 0x00},
> +
> +	/* MIPI */
> +	{0xfe, 0x03},
> +	{0x02, 0x58},
> +	{0x22, 0x03},
> +	{0x26, 0x06},
> +	{0x29, 0x03},
> +	{0x2b, 0x06},
> +	{0xfe, 0x01},
> +	{0x8c, 0x10},
> +	{0xfe, 0x00},
> +	{0x3e, 0x91},
> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct gc5035_mode supported_modes[] = {
> +	{
> +		.width = 2592,
> +		.height = 1944,
> +		.max_fps = 30,
> +		.exp_def = 0x258,
> +		.hts_def = 2920,
> +		.vts_def = 2008,
> +		.reg_list = gc5035_2592x1944_regs,
> +	},
> +	{
> +		.width = 1296,
> +		.height = 972,
> +		.max_fps = 30,
> +		.exp_def = 0x258,
> +		.hts_def = 1460,
> +		.vts_def = 2008,
> +		.reg_list = gc5035_1296x972_regs,
> +	},
> +	{
> +		.width = 1280,
> +		.height = 720,
> +		.max_fps = 60,
> +		.exp_def = 0x258,
> +		.hts_def = 1896,
> +		.vts_def = 1536,
> +		.reg_list = gc5035_1280x720_regs,
> +	},
> +};
> +
> +static const char * const gc5035_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bar",
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +	GC5035_LINK_FREQ_438MHZ
> +};
> +
> +static u64 to_pixel_rate(u32 f_index)
> +{
> +	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * GC5035_DATA_LANES;
> +
> +	do_div(pixel_rate, GC5035_BITS_PER_SAMPLE);
> +
> +	return pixel_rate;
> +}
> +
> +static int gc5035_write_reg(struct gc5035 *gc5035, u8 reg, u8 val)
> +{
> +	return i2c_smbus_write_byte_data(gc5035->client, reg, val);
> +}
> +
> +static int gc5035_write_array(struct gc5035 *gc5035,
> +			      const struct regval *regs)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; regs[i].addr != REG_NULL; i++) {
> +		ret = gc5035_write_reg(gc5035, regs[i].addr, regs[i].val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gc5035_read_reg(struct gc5035 *gc5035, u8 reg, u8 *val)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(gc5035->client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = (unsigned char)ret;
> +
> +	return 0;
> +}
> +
> +static int gc5035_otp_read_data(struct gc5035 *gc5035, u16 addr, u8 *data,
> +				int length)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if ((((addr & GC5035_OTP_ADDR_MASK) >> GC5035_OTP_ADDR_OFFSET) + length)
> +	    > GC5035_OTP_DATA_LENGTH) {
> +		dev_err(dev, "out of range, start addr: 0x%.4x, length = %d\n",
> +			addr & GC5035_OTP_ADDR_MASK, length);
> +		return -EINVAL;
> +	}
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_2);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_OTP_ACCESS_ADDR_H,
> +			       (addr >> GC5035_SHIFT_8_BITS) &
> +			       GC5035_MASK_LSB_5_BITS);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_OTP_ACCESS_ADDR_L,
> +			       addr & GC5035_MASK_LSB_8_BITS);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_OTP_MODE_REG,
> +			       GC5035_OTP_PRE_READ);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_OTP_MODE_REG,
> +			       GC5035_OTP_READ_MODE);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < length; i++) {
> +		ret = gc5035_read_reg(gc5035, GC5035_OTP_DATA_REG, &data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return gc5035_write_reg(gc5035, GC5035_OTP_MODE_REG,
> +				GC5035_OTP_READ_DONE);
> +}
> +
> +static void gc5035_store_otp_regs(struct gc5035 *gc5035,
> +				  struct gc5035_otp_regs *otp_regs, u8 *reg)
> +{
> +	unsigned int i, j;
> +	int base_group;
> +
> +	for (i = 0; i < GC5035_OTP_REG_MAX_GROUP; i++) {
> +		base_group = i * GC5035_OTP_REG_BYTE_PER_GROUP;
> +		for (j = 0; j < GC5035_OTP_REG_PER_GROUP; j++) {
> +			if (GC5035_CHECK_FLAG(reg[base_group],
> +					      (GC5035_OTP_PER_PAGE_SIZE * j +
> +					      GC5035_OTP_PAGE_FLAG_OFFSET))) {

struct gc5035_reg *reg;

if (!...)
	continue;

reg = &otp_regs->reg[ntp_regs->cnt];

reg->... = ...;
...;

> +				otp_regs->reg[otp_regs->cnt].page =
> +					(reg[base_group] >>
> +					 (GC5035_OTP_PER_PAGE_SIZE * j)) &
> +					GC5035_OTP_REG_PAGE_MASK;
> +				otp_regs->reg[otp_regs->cnt].regval.addr =
> +					reg[base_group +
> +					j * GC5035_OTP_REG_BYTE_PER_REG +
> +					GC5035_OTP_REG_ADDR_OFFSET];
> +				otp_regs->reg[otp_regs->cnt].regval.val =
> +					reg[base_group +
> +					j * GC5035_OTP_REG_BYTE_PER_REG +
> +					GC5035_OTP_REG_VAL_OFFSET];
> +				otp_regs->cnt++;
> +			}
> +		}
> +	}
> +}
> +
> +static int gc5035_read_otp_regs(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	struct gc5035_otp_regs *otp_regs = &gc5035_otp_data.regs;
> +	u8 reg[GC5035_OTP_REG_DATA_SIZE] = {0};
> +	int ret;
> +
> +	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_REG_FLAG_OFFSET,
> +				   &otp_regs->flag, GC5035_READ_ONE_BYTE);
> +	if (ret) {
> +		dev_err(dev, "failed to read otp reg flag\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "register update flag = 0x%x\n", otp_regs->flag);
> +	if (otp_regs->flag == GC5035_OTP_FLAG_VALID) {
> +		ret = gc5035_otp_read_data(gc5035, GC5035_OTP_REG_DATA_OFFSET,
> +					   &reg[0], GC5035_OTP_REG_DATA_SIZE);
> +		if (ret) {
> +			dev_err(dev, "failed to read otp reg data\n");
> +			return ret;
> +		}
> +
> +		gc5035_store_otp_regs(gc5035, otp_regs, reg);
> +	}
> +
> +	return 0;
> +}
> +
> +static int gc5035_read_dpc(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	struct gc5035_dpc *dpc = &gc5035_otp_data.dpc;
> +	u8 dpc_flag = 0;
> +	u8 error_number = 0;
> +	u8 total_number = 0;
> +	int ret;
> +
> +	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_DPC_FLAG_OFFSET,
> +				   &dpc_flag, GC5035_READ_ONE_BYTE);
> +	if (ret) {
> +		dev_err(dev, "failed to read dpc flag\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "dpc flag = 0x%x\n", dpc_flag);
> +	switch (GC5035_GET_2BIT_FLAG(dpc_flag, 0)) {
> +	case GC5035_OTP_FLAG_EMPTY:
> +		dev_dbg(dev, "dpc info is empty!!\n");
> +		dpc->flag = GC5035_OTP_FLAG_EMPTY;
> +		break;
> +
> +	case GC5035_OTP_FLAG_VALID:
> +		dev_dbg(dev, "dpc info is valid!\n");
> +		ret = gc5035_otp_read_data(gc5035,
> +					   GC5035_OTP_DPC_TOTAL_NUMBER_OFFSET,
> +					   &total_number, GC5035_READ_ONE_BYTE);
> +		if (ret) {
> +			dev_err(dev, "failed to read dpc total number\n");
> +			return ret;
> +		}
> +
> +		ret = gc5035_otp_read_data(gc5035,
> +					   GC5035_OTP_DPC_ERROR_NUMBER_OFFSET,
> +					   &error_number, GC5035_READ_ONE_BYTE);
> +		if (ret) {
> +			dev_err(dev, "failed to read dpc error number\n");
> +			return ret;
> +		}
> +
> +		dpc->total_num = total_number + error_number;
> +		dpc->flag = GC5035_OTP_FLAG_VALID;
> +		dev_dbg(dev, "total_num = %d\n", dpc->total_num);
> +		break;
> +
> +	default:
> +		dpc->flag = GC5035_OTP_FLAG_INVALID;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int gc5035_otp_read_sensor_info(struct gc5035 *gc5035)
> +{
> +	int ret;
> +
> +	ret = gc5035_read_dpc(gc5035);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_read_otp_regs(gc5035);

return ...;

> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static int gc5035_check_dd_load_status(struct gc5035 *gc5035)
> +{
> +	u8 status = 0;
> +	int ret;
> +
> +	ret = gc5035_read_reg(gc5035, 0x06, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (!GC5035_CHECK_FLAG(status, GC5035_OTP_BIT_LOAD))
> +		return 0;
> +	else
> +		return status;
> +}
> +
> +static int gc5035_otp_update_dd(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	struct gc5035_dpc *dpc = &gc5035_otp_data.dpc;
> +	int val, ret;
> +
> +	if (dpc->flag != GC5035_OTP_FLAG_VALID) {
> +		dev_dbg(dev, "Do not need to update dd!\n");
> +		return 0;
> +	}
> +	dev_dbg(dev, "DD auto load start!\n");
> +	ret = gc5035_write_array(gc5035, gc5035_dd_auto_load_regs);
> +	if (ret) {
> +		dev_err(dev, "failed to write dd auto load reg\n");
> +		return ret;
> +	}
> +
> +		ret = gc5035_write_reg(gc5035, GC5035_REG_DD_TOTALNUM_H,
> +				(dpc->total_num >> GC5035_SHIFT_8_BITS) &
> +				GC5035_MASK_LSB_3_BITS);
> +		if (ret)
> +			return ret;

Indentation.

> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_DD_TOTALNUM_L,
> +			      dpc->total_num & GC5035_MASK_LSB_8_BITS);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_array(gc5035, gc5035_otp_dd_regs);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for DD to finish loading automatically */
> +	ret = readx_poll_timeout(gc5035_check_dd_load_status, gc5035,
> +				val, val <= 0, GC5035_DD_DELAY_US,
> +				GC5035_MAX_RETRY * GC5035_DD_DELAY_US);
> +	if (ret || val) {
> +		dev_err(dev, "DD load timeout\n");
> +		return -EBUSY;
> +	}
> +
> +		ret = gc5035_write_array(gc5035, gc5035_otp_dd_enable_regs);
> +		if (ret)
> +			return ret;

Same here.

> +
> +	return 0;
> +}
> +
> +static int gc5035_otp_update_regs(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	struct gc5035_otp_regs *otp_regs = &gc5035_otp_data.regs;
> +	unsigned int i;
> +	int ret;
> +
> +	dev_err(dev, "reg count = %d\n", otp_regs->cnt);
> +
> +	if (GC5035_CHECK_FLAG(otp_regs->flag, 0)) {

if (!...)
	return 0;

for (...) {
	...;
}

return 0;

> +		for (i = 0; i < otp_regs->cnt; i++) {
> +			ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG,
> +					       otp_regs->reg[i].page);
> +			if (ret)
> +				return ret;
> +
> +			ret = gc5035_write_reg(gc5035,
> +					       otp_regs->reg[i].regval.addr,
> +					       otp_regs->reg[i].regval.val);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int gc5035_otp_update(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	int ret;
> +
> +	ret = gc5035_otp_update_dd(gc5035);
> +	if (ret) {
> +		dev_err(dev, "failed to update otp dd\n");
> +		return ret;
> +	}
> +
> +	ret = gc5035_otp_update_regs(gc5035);
> +	if (ret) {
> +		dev_err(dev, "failed to update otp regs\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int gc5035_otp_identify(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	int ret = 0;
> +
> +	memset(&gc5035_otp_data, 0, sizeof(gc5035_otp_data));
> +
> +	ret = gc5035_write_array(gc5035, gc5035_otp_init_regs);
> +	if (ret) {
> +		dev_err(dev, "failed to write otp init reg\n");
> +		return ret;
> +	}
> +
> +	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_ID_DATA_OFFSET,
> +				   &gc5035_otp_data.otp_id[0],
> +				   GC5035_OTP_ID_SIZE);
> +	if (ret)
> +		dev_err(dev, "failed to read otp id\n");
> +
> +	ret = gc5035_otp_read_sensor_info(gc5035);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to read otp sensor info\n");
> +		return ret;
> +	}
> +
> +	ret = gc5035_write_array(gc5035, gc5035_otp_exit_regs);
> +	if (ret) {
> +		dev_err(dev, "failed to write otp exit reg\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int gc5035_otp_function(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	u8 otp_id[GC5035_OTP_ID_SIZE] = {0};
> +	unsigned int i;
> +	int ret = 0;
> +
> +	ret = gc5035_write_array(gc5035, gc5035_otp_init_regs);
> +	if (ret) {
> +		dev_err(dev, "failed to write otp init reg\n");
> +		return ret;
> +	}
> +
> +	ret = gc5035_otp_read_data(gc5035, GC5035_OTP_ID_DATA_OFFSET,
> +				   &otp_id[0], GC5035_OTP_ID_SIZE);
> +	if (ret) {
> +		dev_err(dev, "failed to read otp id\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < GC5035_OTP_ID_SIZE; i++) {
> +		if (otp_id[i] != gc5035_otp_data.otp_id[i]) {
> +			dev_dbg(dev, "otp id mismatch, read again.\n");
> +			memset(&gc5035_otp_data, 0, sizeof(gc5035_otp_data));
> +
> +			for (i = 0; i < GC5035_OTP_ID_SIZE; i++)
> +				gc5035_otp_data.otp_id[i] = otp_id[i];
> +
> +			ret = gc5035_otp_read_sensor_info(gc5035);
> +			if (ret < 0) {
> +				dev_err(dev, "failed to read otp info\n");
> +				return ret;
> +			}
> +
> +			break;
> +		}
> +	}
> +
> +	ret = gc5035_otp_update(gc5035);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gc5035_write_array(gc5035, gc5035_otp_exit_regs);
> +	if (ret) {
> +		dev_err(dev, "failed to write otp exit reg\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gc5035_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +	const struct gc5035_mode *mode;
> +	s64 h_blank, vblank_def;
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +		ARRAY_SIZE(supported_modes), width,

Please align the beginning of the line just right of the opening
parenthesis.

> +		height, fmt->format.width,
> +		fmt->format.height);
> +
> +	fmt->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;

Acquire the mutex here, too, as you do below in gc5035_get_fmt().

> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> +	} else {
> +		gc5035->cur_mode = mode;
> +		h_blank = mode->hts_def - mode->width;
> +		__v4l2_ctrl_modify_range(gc5035->hblank, h_blank,
> +					 h_blank, 1, h_blank);
> +		vblank_def = mode->vts_def - mode->height;
> +		__v4l2_ctrl_modify_range(gc5035->vblank, vblank_def,
> +					 GC5035_VTS_MAX - mode->height,
> +					 1, vblank_def);
> +	}
> +
> +	return 0;
> +}
> +
> +static int gc5035_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +	const struct gc5035_mode *mode = gc5035->cur_mode;
> +
> +	mutex_lock(&gc5035->mutex);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	} else {
> +		fmt->format.width = mode->width;
> +		fmt->format.height = mode->height;
> +		fmt->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +		fmt->format.field = V4L2_FIELD_NONE;
> +	}
> +	mutex_unlock(&gc5035->mutex);
> +
> +	return 0;
> +}
> +
> +static int gc5035_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index != 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +
> +	return 0;
> +}
> +
> +static int gc5035_enum_frame_sizes(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fse->code != MEDIA_BUS_FMT_SRGGB10_1X10)
> +		return -EINVAL;
> +
> +	fse->min_width  = supported_modes[fse->index].width;
> +	fse->max_width  = supported_modes[fse->index].width;
> +	fse->max_height = supported_modes[fse->index].height;
> +	fse->min_height = supported_modes[fse->index].height;
> +
> +	return 0;
> +}
> +
> +static int __gc5035_start_stream(struct gc5035 *gc5035)
> +{
> +	int ret;
> +
> +	ret = gc5035_write_array(gc5035, gc5035_global_regs);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_otp_function(gc5035);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_array(gc5035, gc5035->cur_mode->reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* In case these controls are set before streaming */
> +	ret = __v4l2_ctrl_handler_setup(&gc5035->ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	return gc5035_write_reg(gc5035, GC5035_REG_CTRL_MODE,
> +				GC5035_MODE_STREAMING);
> +}
> +
> +static int __gc5035_stop_stream(struct gc5035 *gc5035)
> +{
> +	int ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	return gc5035_write_reg(gc5035, GC5035_REG_CTRL_MODE,
> +				GC5035_MODE_SW_STANDBY);
> +}
> +
> +static int gc5035_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +	struct i2c_client *client = gc5035->client;
> +	int ret = 0;
> +
> +	mutex_lock(&gc5035->mutex);
> +	on = !!on;
> +	if (on == gc5035->streaming)
> +		goto unlock_and_return;
> +
> +	if (on) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		ret = __gc5035_start_stream(gc5035);
> +		if (ret) {
> +			dev_err(&client->dev, "start stream failed\n");
> +			pm_runtime_put(&client->dev);
> +			goto unlock_and_return;
> +		}
> +	} else {
> +		__gc5035_stop_stream(gc5035);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	gc5035->streaming = on;
> +
> +unlock_and_return:
> +	mutex_unlock(&gc5035->mutex);
> +
> +	return ret;
> +}
> +
> +static int __gc5035_power_on(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	int i, ret;
> +
> +	ret = clk_prepare_enable(gc5035->xvclk);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(gc5035->reset_gpio, 1);
> +
> +	for (i = 0; i < GC5035_NUM_SUPPLIES; i++) {
> +		ret = regulator_enable(gc5035->supplies[i].consumer);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable %s: %d\n",
> +				gc5035->supplies[i].supply, ret);
> +			goto disable_reg_clk;

Please use regulator_bulk_enable() here, and regulator_bulk_disable()
below.

> +		}
> +	}
> +
> +	gpiod_set_value_cansleep(gc5035->reset_gpio, 0);
> +
> +	usleep_range(1000, 1200);
> +
> +	return 0;
> +
> +disable_reg_clk:
> +	for (--i; i >= 0; i--)
> +		regulator_disable(gc5035->supplies[i].consumer);
> +	clk_disable_unprepare(gc5035->xvclk);
> +
> +	return ret;
> +}
> +
> +static void __gc5035_power_off(struct gc5035 *gc5035)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	int i, ret;
> +
> +	clk_disable_unprepare(gc5035->xvclk);
> +	gpiod_set_value_cansleep(gc5035->reset_gpio, 1);
> +
> +	for (i = GC5035_NUM_SUPPLIES - 1; i >= 0; i--) {
> +		ret = regulator_disable(gc5035->supplies[i].consumer);
> +		if (ret)
> +			dev_err(dev, "Failed to disable %s: %d\n",
> +				gc5035->supplies[i].supply, ret);
> +	}
> +}
> +
> +static int __maybe_unused gc5035_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +
> +	return __gc5035_power_on(gc5035);

Please move the code from __gc5035_power_on() here, same below for
gc5035_runtime_suspend().

> +}
> +
> +static int __maybe_unused gc5035_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +
> +	__gc5035_power_off(gc5035);
> +
> +	return 0;
> +}
> +
> +static int gc5035_entity_init_cfg(struct v4l2_subdev *subdev,
> +				struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = { 0 };
> +
> +	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.format.width = 2592;
> +	fmt.format.height = 1944;
> +
> +	gc5035_set_fmt(subdev, cfg, &fmt);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops gc5035_pm_ops = {
> +	SET_RUNTIME_PM_OPS(gc5035_runtime_suspend,
> +			   gc5035_runtime_resume, NULL)
> +};
> +
> +static const struct v4l2_subdev_video_ops gc5035_video_ops = {
> +	.s_stream = gc5035_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops gc5035_pad_ops = {
> +	.init_cfg = gc5035_entity_init_cfg,
> +	.enum_mbus_code = gc5035_enum_mbus_code,
> +	.enum_frame_size = gc5035_enum_frame_sizes,
> +	.get_fmt = gc5035_get_fmt,
> +	.set_fmt = gc5035_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops gc5035_subdev_ops = {
> +	.video	= &gc5035_video_ops,
> +	.pad	= &gc5035_pad_ops,
> +};
> +
> +static int gc5035_set_exposure(struct gc5035 *gc5035, int val)
> +{
> +	int ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_EXPOSURE_H,
> +			       (val >> GC5035_SHIFT_8_BITS) &
> +			       GC5035_MASK_LSB_6_BITS);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_EXPOSURE_L,
> +			       val & GC5035_MASK_LSB_8_BITS);

You can return right here without the assignment.

Same for the below functions.

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int gc5035_set_analogue_gain(struct gc5035 *gc5035, int val)
> +{
> +	int ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_ANALOG_GAIN, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int gc5035_set_digital_gain(struct gc5035 *gc5035, int val)
> +{
> +	int ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_DIGI_GAIN_H,
> +			       (val >> GC5035_SHIFT_8_BITS) &
> +			       GC5035_MASK_DGAIN_REG_H);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_DIGI_GAIN_L, val &
> +			       GC5035_MASK_DGAIN_REG_L);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int gc5035_set_vblank(struct gc5035 *gc5035, int val)
> +{
> +	int frame_length = 0;
> +	int ret;
> +
> +	frame_length = val + gc5035->cur_mode->height;
> +	frame_length = frame_length >> GC5035_SHIFT_2_BITS;
> +	frame_length = frame_length << GC5035_SHIFT_2_BITS;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_VTS_H,
> +			       (frame_length >> GC5035_SHIFT_8_BITS) &
> +			       GC5035_MASK_LSB_6_BITS);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_VTS_L,
> +			       frame_length & GC5035_MASK_LSB_8_BITS);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int gc5035_enable_test_pattern(struct gc5035 *gc5035, int pattern)
> +{
> +	int ret;
> +
> +	if (pattern)
> +		pattern = GC5035_TEST_PATTERN_ENABLE;
> +	else
> +		pattern = GC5035_TEST_PATTERN_DISABLE;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_1);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_write_reg(gc5035, GC5035_REG_TEST_PATTERN, pattern);
> +	if (ret)
> +		return ret;
> +
> +	return gc5035_write_reg(gc5035, GC5035_PAGE_REG, GC5035_PAGE_MODE_0);
> +}
> +
> +static int gc5035_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct gc5035 *gc5035 = container_of(ctrl->handler,
> +					     struct gc5035, ctrl_handler);
> +	struct i2c_client *client = gc5035->client;
> +	s64 max;
> +	int ret = 0;

No need to assign ret here.

Please add a newline.

> +	/* Propagate change of current control to all related controls */
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update max exposure while meeting expected vblanking */
> +		max = gc5035->cur_mode->height + ctrl->val - MARGIN;//margin
> +		__v4l2_ctrl_modify_range(gc5035->exposure,
> +					 gc5035->exposure->minimum, max,
> +					 gc5035->exposure->step,
> +					 gc5035->exposure->default_value);
> +		break;
> +	}
> +
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret = gc5035_set_exposure(gc5035, ctrl->val);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = gc5035_set_analogue_gain(gc5035, ctrl->val);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = gc5035_set_digital_gain(gc5035, ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = gc5035_set_vblank(gc5035, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = gc5035_enable_test_pattern(gc5035, ctrl->val);
> +		break;
> +	default:
> +		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);

This should be an error.

> +		break;
> +	};
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops gc5035_ctrl_ops = {
> +	.s_ctrl = gc5035_set_ctrl,
> +};
> +
> +static int gc5035_initialize_controls(struct gc5035 *gc5035)
> +{
> +	const struct gc5035_mode *mode;
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	u64 exposure_max, pixel_rate;
> +	u32 h_blank, vblank_def;
> +	int ret;
> +
> +	handler = &gc5035->ctrl_handler;
> +	mode = gc5035->cur_mode;
> +	ret = v4l2_ctrl_handler_init(handler, 8);
> +	if (ret)
> +		return ret;
> +
> +	handler->lock = &gc5035->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> +				      0, 0, link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate = to_pixel_rate(0);
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  0, pixel_rate, 1, pixel_rate);
> +
> +	h_blank = mode->hts_def - mode->width;
> +	gc5035->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> +					   h_blank, h_blank, 1, h_blank);
> +	if (gc5035->hblank)
> +		gc5035->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	gc5035->vblank = v4l2_ctrl_new_std(handler, &gc5035_ctrl_ops,
> +					   V4L2_CID_VBLANK, vblank_def,
> +					   GC5035_VTS_MAX - mode->height,
> +					   1, vblank_def);
> +
> +	exposure_max = mode->vts_def - MARGIN;
> +	gc5035->exposure = v4l2_ctrl_new_std(handler, &gc5035_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     GC5035_EXPOSURE_MIN, exposure_max,
> +					     GC5035_EXPOSURE_STEP,
> +					     mode->exp_def);
> +
> +	gc5035->again = v4l2_ctrl_new_std(handler, &gc5035_ctrl_ops,
> +					      V4L2_CID_ANALOGUE_GAIN,
> +					      ANALOG_GAIN_MIN, ANALOG_GAIN_MAX,
> +					      ANALOG_GAIN_STEP,
> +					      ANALOG_GAIN_DEFAULT);
> +
> +	gc5035->dgain = v4l2_ctrl_new_std(handler, &gc5035_ctrl_ops,
> +					      V4L2_CID_DIGITAL_GAIN,
> +					      GC5035_DIGI_GAIN_MIN,
> +					      GC5035_DIGI_GAIN_MAX,
> +					      GC5035_DIGI_GAIN_STEP,
> +					      GC5035_DIGI_GAIN_DEFAULT);
> +
> +	gc5035->test_pattern = v4l2_ctrl_new_std_menu_items(handler,
> +				&gc5035_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +				ARRAY_SIZE(gc5035_test_pattern_menu) - 1,
> +				0, 0, gc5035_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(&gc5035->client->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	gc5035->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int gc5035_check_sensor_id(struct gc5035 *gc5035,
> +				  struct i2c_client *client)
> +{
> +	struct device *dev = &gc5035->client->dev;
> +	u16 id;
> +	u8 pid = 0;
> +	u8 ver = 0;
> +	int ret;
> +
> +	ret = gc5035_read_reg(gc5035, GC5035_REG_CHIP_ID_H, &pid);
> +	if (ret)
> +		return ret;
> +
> +	ret = gc5035_read_reg(gc5035, GC5035_REG_CHIP_ID_L, &ver);
> +	if (ret)
> +		return ret;
> +
> +	id = GC5035_ID(pid, ver);
> +	if (id != CHIP_ID) {
> +		dev_err(dev, "Unexpected sensor id(%04x)\n", id);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(dev, "Detected GC%04x sensor\n", id);
> +
> +	return 0;
> +}
> +
> +static int gc5035_configure_regulators(struct gc5035 *gc5035)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < GC5035_NUM_SUPPLIES; i++)
> +		gc5035->supplies[i].supply = gc5035_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&gc5035->client->dev,
> +				       GC5035_NUM_SUPPLIES,
> +				       gc5035->supplies);
> +}
> +
> +static int gc5035_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct gc5035 *gc5035;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	gc5035 = devm_kzalloc(dev, sizeof(*gc5035), GFP_KERNEL);
> +	if (!gc5035)
> +		return -ENOMEM;
> +
> +	gc5035->client = client;
> +	gc5035->cur_mode = &supported_modes[0];
> +
> +	gc5035->xvclk = devm_clk_get(dev, "xvclk");
> +	if (IS_ERR(gc5035->xvclk)) {
> +		dev_err(dev, "Failed to get xvclk\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_set_rate(gc5035->xvclk, GC5035_XVCLK_FREQ);

Could you add "clock-frequency" property to bindings and use that, please?

Please also add "link-frequencies" endpoint property. See e.g.
drivers/media/i2c/imx319.c for an example.

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
> +		return ret;
> +	}
> +	if (clk_get_rate(gc5035->xvclk) != GC5035_XVCLK_FREQ)
> +		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> +
> +	gc5035->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(gc5035->reset_gpio)) {
> +		dev_err(dev, "Failed to get reset-gpios\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = gc5035_configure_regulators(gc5035);
> +	if (ret) {
> +		dev_err(dev, "Failed to get power regulators\n");
> +		return ret;
> +	}
> +
> +	mutex_init(&gc5035->mutex);
> +
> +	sd = &gc5035->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &gc5035_subdev_ops);
> +	ret = gc5035_initialize_controls(gc5035);
> +	if (ret)
> +		goto err_destroy_mutex;
> +
> +	ret = __gc5035_power_on(gc5035);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret = gc5035_check_sensor_id(gc5035, client);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = gc5035_otp_identify(gc5035);
> +	if (ret)
> +		goto err_power_off;
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	gc5035->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sd->entity, 1, &gc5035->pad);
> +	if (ret < 0)
> +		goto err_power_off;
> +
> +	ret = v4l2_async_register_subdev_sensor_common(sd);
> +	if (ret) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_entity;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +err_clean_entity:
> +	media_entity_cleanup(&sd->entity);
> +err_power_off:
> +	__gc5035_power_off(gc5035);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&gc5035->ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&gc5035->mutex);
> +
> +	return ret;
> +}
> +
> +static int gc5035_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct gc5035 *gc5035 = to_gc5035(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&gc5035->ctrl_handler);
> +	mutex_destroy(&gc5035->mutex);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		__gc5035_power_off(gc5035);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id gc5035_of_match[] = {
> +	{ .compatible = "galaxycore,gc5035" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, gc5035_of_match);
> +
> +static struct i2c_driver gc5035_i2c_driver = {
> +	.driver = {
> +		.name = "gc5035",
> +		.pm = &gc5035_pm_ops,
> +		.of_match_table = gc5035_of_match,
> +	},
> +	.probe_new	= &gc5035_probe,
> +	.remove		= &gc5035_remove,
> +};
> +
> +module_i2c_driver(gc5035_i2c_driver);
> +
> +MODULE_AUTHOR("Hao He <hao.he@bitland.com.cn>");
> +MODULE_AUTHOR("Xingyu Wu <wuxy@bitland.com.cn>");
> +MODULE_DESCRIPTION("GalaxyCore gc5035 sensor driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus
