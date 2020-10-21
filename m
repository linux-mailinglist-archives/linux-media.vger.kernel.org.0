Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B57294AC1
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441506AbgJUJu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:50:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:62466 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438182AbgJUJu3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:50:29 -0400
IronPort-SDR: dnhpMxXLY8E4XTCgBId1g0sF4yvSq9V0DH4kOyfWJaflZSOf2l/W5q/oVitjbMhq7NxjgJpB4W
 3SoCMp1L5rxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="231533995"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="231533995"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:50:27 -0700
IronPort-SDR: QBG4TOloYWOoDM1HZXQ9J5hhZvlUPpfRNLJhKeaLLZTyo8IN1id5heQenwjjL/g5wTfKdZ/3n+
 F7Hhd4ek2NNg==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="320962492"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:50:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C6E7120815; Wed, 21 Oct 2020 12:50:23 +0300 (EEST)
Date:   Wed, 21 Oct 2020 12:50:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [RFC PATCH] media: new driver mt9m02x for Onsemi MT9M024 and
 AR0141CS
Message-ID: <20201021095023.GE2703@paasikivi.fi.intel.com>
References: <20201020092732.GA30983@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020092732.GA30983@laureti-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helmut,

Thanks for the patch.

In general it seems fairly clean and it's nice to see PLL calculators being
used instead of hard-coding configuration, plus having support for multiple
devices. There's also obviously some work to be done still.

On Tue, Oct 20, 2020 at 11:27:33AM +0200, Helmut Grohne wrote:
> Add basic support for Onsemi (formerly Aptina) image sensors MT9M024 and
> AR0141CS.
>  * Absolute exposure
>  * Analogue gain as iso sensitivity
>  * Digital gain
>  * HDR (MT9M024)
>  * Temperature sensor (MT9M024)
>  * Support for monochrome/color models
>  * Vertical/horziontal flip
>  * Binning
>  * Reset via GPIO or I2C.
> 
> Signed-off-by: Helmut Grohne <helmut.grohne@intenta.de>
> Signed-off-by: Ringo Schulz <ringo.schulz@intenta.de>
> Signed-off-by: Peter Will <peter.will@intenta.de>
> ---
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/mt9m02x.c | 1596 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1607 insertions(+)
>  create mode 100644 drivers/media/i2c/mt9m02x.c
> 
> Hi,
> 
> I've promised this RFC patch quite a while ago. In the mean time, legal
> did catch up and we're entitled to publish it.
> 
> This goes as far back as 2018, where I proposed[1] changing the
> aptina_pll_calculate function to solve the pix_clock approximately
> instead of giving up.

Yes, I remember this discussion. Perhaps we should get back to that, if
issues remain.

I can't answer for aptina-pll, but in general, if the link frequency is
achievable (as within hardware specific limits) with a given external clock
frequency and the PLL calculator doesn't give you a valid PLL
configuration, it's a bug.

If so, another question is then how to fix it.

> 
> The driver is in practical use. It mostly passes checkpatch.pl. Known
> issues:
>  * It presently defines 3 custom V4L2 CIDs inside the .c file. Those
>    will need a proper place. Possibly, there is some standard CID that
>    could replace them. Suggestions welcome.

I suppose the HDR ratios are the ratios between exposure times?

>  * There is no streaming functionality yet. In our use, the imager is
>    triggered externally.
>  * The driver needs the modified aptina_pll_calculate[1] to work in our
>    setting. Otherwise probing fails finding a valid pix_clock.
>  * For similarity with other drivers, I added mt9m02x_platform_data. For
>    actually using it, it needs to be moved to a header.
> 
> Questions:
>  * What are the big issues that need to be solved before considering the
>    driver for merging?
>  * Would it be useful to use the regmap framework?
>  * The analogue gain is mapped to V4L2_CID_ISO_SENSITIVITY. That's not a
>    perfect match, but it is a menu with scale. Is there something better
>    with these properties?
>  * Should I keep the MT9M024 and AR0141CS drivers fused like this or
>    separate them? If fused, is the current naming ok? It originated from
>    a brief period of looking into MT9M021 before adding AR0141CS
>    support.
>  * Is mt9m02x_platform_data (i.e. support for non-DT configurations)
>    worth keeping?
> 
> Please save a detailed review for a later iteration. I do expect
> requests for structural changes that could easily render detailed
> changes irrelevant. Of course, if you spot repeated patterns of details
> that I got wrong, that's worth a mention still.
> 
> Thank you for looking into this
> 
> Helmut
> 
> [1] https://lore.kernel.org/linux-media/20180823075208.mqjctv4ax4dakfws@laureti-dev/#t
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c7ba76fee599..ddcec63ea531 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1245,6 +1245,16 @@ config VIDEO_S5C73M3
>  	  This is a V4L2 sensor driver for Samsung S5C73M3
>  	  8 Mpixel camera.
>  
> +config VIDEO_MT9M02X
> +	tristate "Aptina/Onsemi MT9M024 and AR0141CS sensor support"
> +	depends on HWMON && I2C && VIDEO_V4L2
> +	select V4L2_FWNODE
> +	select VIDEO_APTINA_PLL
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a V4L2 sensor driver for Onsemi (formerly Aptina)
> +	  image sensors MT9M024 and AR0141CS (monochrome/color).
> +
>  endmenu
>  
>  menu "Lens drivers"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index f0a77473979d..4023bea35c4f 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
>  obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
>  obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> +obj-$(CONFIG_VIDEO_MT9M02X) += mt9m02x.o
>  obj-$(CONFIG_VIDEO_MT9M032) += mt9m032.o
>  obj-$(CONFIG_VIDEO_MT9M111) += mt9m111.o
>  obj-$(CONFIG_VIDEO_MT9P031) += mt9p031.o
> diff --git a/drivers/media/i2c/mt9m02x.c b/drivers/media/i2c/mt9m02x.c
> new file mode 100644
> index 000000000000..d0eb5e4fc4ea
> --- /dev/null
> +++ b/drivers/media/i2c/mt9m02x.c
> @@ -0,0 +1,1596 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016-2020 Intenta GmbH
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/delay.h>
> +#include <linux/math64.h>
> +#include <linux/mutex.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +#include "aptina-pll.h"
> +
> +#define MT9M02X_V4L2_CID_USER_BASE	(V4L2_CID_USER_BASE + 0x1000)
> +#define MT9M02X_V4L2_CID_HDR_RATIO_T1T2	(MT9M02X_V4L2_CID_USER_BASE + 2)
> +#define MT9M02X_V4L2_CID_HDR_RATIO_T2T3	(MT9M02X_V4L2_CID_USER_BASE + 3)
> +
> +/* registers */
> +#define APT_CHIP_VERSION			0x3000
> +#define APT_Y_ADDR_START			0x3002
> +#define APT_X_ADDR_START			0x3004
> +#define APT_Y_ADDR_END				0x3006
> +#define APT_X_ADDR_END				0x3008
> +#define APT_LINE_LENGTH_PCK			0x300C
> +#define		APT_LINE_LENGTH_PCK_VALUE	0x0672
> +#define APT_FRAME_LENGTH_LINES			0x300A
> +#define		APT_FRAME_LENGTH_LINES_VALUE	0x08CA
> +#define APT_COARSE_INTEGRATION_TIME		0x3012
> +#define		APT_COARSE_INTEGRATION_TIME_DEFAULT 0x0384
> +#define APT_FINE_INTEGRATION_TIME		0x3014
> +#define		APT_FINE_INTEGRATION_TIME_VALUE	0
> +
> +#define APT_RESET_REGISTER			0x301A
> +#define		APT_RESET_DO_RESET		BIT(0)
> +#define		APT_RESET_ENABLE_STREAMING	BIT(2)
> +/* Can be cleared to make some registers writeable. Not recommended. */
> +#define		APT_RESET_LOCK_REG		BIT(3)
> +/* When switching between serial vs. parallel output, a few bits are dependent.
> + * 6 -> drive the parallel pins
> + * 7 -> enable the parallel interface
> + * 12 -> disable the serializer
> + */
> +#define		APT_RESET_PARALLEL_MODE		(BIT(6) | BIT(7) | BIT(12))
> +/* Enable a number of input pins including OE_BAR, TRIGGER and STANDBY. */
> +#define		APT_RESET_GPI_ENABLE		BIT(8)
> +
> +#define APT_ROW_SPEED				0x3028
> +#define APT_VT_PIX_CLK_DIV			0x302A
> +#define APT_VT_SYS_CLK_DIV			0x302C
> +#define APT_PRE_PLL_CLK_DIV			0x302E
> +#define APT_PLL_MULTIPLIER			0x3030
> +#define APT_DIGITAL_BINNING			0x3032
> +
> +#define APT_READ_MODE				0x3040
> +/* row + column binning: (context B at bits 10:11) */
> +#define		APT_READ_MODE_BINNING		(BIT(12) | BIT(13))
> +#define		APT_READ_MODE_HFLIP		BIT(14)
> +#define		APT_READ_MODE_VFLIP		BIT(15)
> +
> +#define APT_FLASH				0x3046
> +#define		APT_FLASH_ENABLED		0x0100
> +
> +#define APT_GLOBAL_GAIN				0x305E
> +#define AR0141CS_ANALOG_GAIN			0x3060
> +
> +#define APT_EMBEDDED_DATA_CTRL			0x3064
> +
> +#define APT_OPERATION_MODE_CTRL			0x3082
> +#define APT_X_ODD_INC				0x30A2
> +#define APT_Y_ODD_INC				0x30A6
> +
> +#define APT_DIGITAL_TEST			0x30B0
> +/* MT9M02X-only: analogue gain at 5:4 (A) and 9:8 (B) */
> +#define		APT_DIGITAL_TEST_MONOCHROME	BIT(7)
> +
> +#define APT_TEMP_VALUE				0x30B2
> +#define APT_TEMP				0x30B4
> +#define APT_TEMP_CALIB1				0x30C6
> +#define APT_TEMP_CALIB2				0x30C8
> +#define APT_HISPI_CONTROL_STATUS		0x31C6
> +#define APT_HDR_COMPANDING			0x31D0
> +#define APT_COLUMN_CORRECTION			0x30D4
> +
> +#define APT_DIGITAL_CTRL			0x30BA
> +#define		APT_DIGITAL_CTRL_DITHERING	BIT(5)
> +
> +#define APT_DIGITAL_LATERAL			0x3190
> +
> +#define APT_DARK_CONTROL			0x3044
> +#define		APT_DARK_CONTROL_ROW_NOISE	BIT(10)
> +
> +#define APT_SEQ_CTRL_PORT			0x3088
> +/* GENMASK(8, 0): Sequencer RAM address. Number of bits depends on chip. */
> +/* BIT(14): defines whether reading APT_SEQ_DATA_PORT advances position */
> +#define		APT_SEQ_CTRL_PORT_STOPPED	BIT(15)
> +
> +#define APT_SEQ_DATA_PORT			0x3086
> +#define APT_ERS_PROG_START_ADDR			0x309E
> +#define APT_DATA_PEDESTAL			0x301E
> +#define APT_DAC_LD_14_15			0x3EDA
> +#define APT_DAC_LD_18_19			0x3EDE
> +#define APT_DAC_LD_12_13			0x3ED8
> +#define APT_DAC_LD_22_23			0x3EE2
> +#define APT_DAC_LD_20_21			0x3EE0
> +#define APT_DAC_LD_16_17			0x3EDC
> +#define APT_DAC_LD_26_27			0x3EE6
> +#define APT_DAC_LD_24_25			0x3EE4
> +#define APT_DAC_LD_10_11			0x3ED6
> +#define APT_ADC_BITS_6_7			0x30E4
> +#define APT_ADC_BITS_4_5			0x30E2
> +#define APT_ADC_BITS_2_3			0x30E0
> +#define APT_ADC_CONFIG1				0x30E6
> +#define APT_ADC_CONFIG2				0x30E8
> +
> +/* can be supplied via struct i2c_client ->dev.platform_data or device tree.
> + * TODO(mainline): Move this structure to a header such that another driver
> + *      can supply it. Though one only needs that when not using DT.
> + */
> +struct mt9m02x_platform_data {
> +	unsigned int ext_freq; /* in Hz */
> +	unsigned int pix_clock; /* in Hz */
> +};
> +
> +struct mt9m02x_state;
> +
> +/**
> + * struct reg_entry - a configuration option for an imager
> + * @reg:   The register id. Must be a valid u16 or the special value MSLEEP.
> + * @value: The value to write into the register or the duration of MSLEEP in ms.
> + */
> +struct reg_entry {
> +	s32 reg;
> +	u16 value;
> +};
> +
> +#define MSLEEP -1
> +
> +struct chip_info {
> +	u16 version;
> +
> +	const struct aptina_pll_limits *pll_limits;
> +	/* Number of ext_clock cycles to wait after lifting reset_gpio. */
> +	unsigned int reset_wait_cycles;
> +
> +	/* Initialization of the sequencer RAM */
> +	const u16 *sequencer;
> +	size_t sequencer_length;
> +	const u16 *linear_sequencer;
> +	size_t linear_sequencer_length;
> +	/* Static configuration */
> +	const struct reg_entry *configuration;
> +	size_t configuration_length;
> +
> +	u16 width, height;
> +	u16 xstart, ystart;
> +
> +	/* Digital gain is a fixed-point number with chip-dependent number of
> +	 * bits before and after the point. The v4l2 ctrl expects 8 bits after
> +	 * the point. v4l2value >> digital_gain_shift gives the register value.
> +	 * digital_gain_min is the minimum v4l2 value.
> +	 * (1 << digital_gain_bits) - 1 is the maximum register value.
> +	 */
> +	u16 digital_gain_shift, digital_gain_min, digital_gain_bits;
> +
> +	/* Array of valid V4L2_CID_ISO_SENSITIVITY values sized
> +	 * again_menu_length.
> +	 */
> +	const s64 *again_menu;
> +	size_t again_menu_length;
> +	/* Given a valid index into again_menu, set the corresponding gain. */
> +	int (*again_set)(struct mt9m02x_state *state, s32 index);
> +
> +	/* Temperature sensor calibration */
> +	long temp_point1, temp_point2; /* milli degree C */
> +	u16 temp_mask; /* register mask, 0 -> disable temperature sensor */
> +};
> +
> +struct model_info {
> +	const struct chip_info *chip;
> +	bool monochrome;
> +};
> +
> +struct mt9m02x_state {
> +	struct i2c_client *client;
> +	struct gpio_desc *reset_gpio, *standby_gpio;
> +
> +	/* Only written to while probing: */
> +	const struct model_info *model;
> +	struct aptina_pll pll;
> +	/* register values, equal points -> disabled */
> +	u16 temp_value1, temp_value2;
> +
> +	/* Protected by ctrls.lock: */
> +	bool binning;
> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_ctrl_handler ctrls;
> +	struct {
> +		struct v4l2_ctrl *hflip, *vflip;
> +	} mode_cluster;
> +	struct {
> +		struct v4l2_ctrl *wdr, *ratio_t1t2, *ratio_t2t3;
> +	} opmode_cluster;
> +	struct v4l2_ctrl *digital_gain_ctrl;
> +	struct v4l2_ctrl *exposure_ctrl;
> +};
> +
> +static const u16 ar0141cs_sequencer[] = {
> +	0x4558, 0x6E9B, 0x4A31, 0x4342, 0x8E03, 0x2714, 0x4578, 0x7B3D,
> +	0xFF3D, 0xFF3D, 0xEA27, 0x043D, 0x1027, 0x0527, 0x1535, 0x2705,
> +	0x3D10, 0x4558, 0x2704, 0x2714, 0x3DFF, 0x3DFF, 0x3DEA, 0x2704,
> +	0x6227, 0x288E, 0x0036, 0x2708, 0x3D64, 0x7A3D, 0x0444, 0x2C4B,
> +	0x8F01, 0x4372, 0x719F, 0x4643, 0x166F, 0x9F92, 0x1244, 0x1646,
> +	0x4316, 0x9326, 0x0426, 0x848E, 0x0327, 0xFC5C, 0x0D57, 0x5417,
> +	0x0955, 0x5649, 0x5F53, 0x0553, 0x0728, 0x6C4C, 0x0928, 0x2C72,
> +	0xA37C, 0x9728, 0xA879, 0x6026, 0x9C5C, 0x1B45, 0x4845, 0x0845,
> +	0x8826, 0xBE8E, 0x0127, 0xF817, 0x0227, 0xFA17, 0x095C, 0x0B17,
> +	0x1026, 0xBA5C, 0x0317, 0x1026, 0xB217, 0x065F, 0x2888, 0x9060,
> +	0x27F2, 0x1710, 0x26A2, 0x26A3, 0x5F4D, 0x2808, 0x1A27, 0xFA84,
> +	0x69A0, 0x785D, 0x2888, 0x8710, 0x8C82, 0x8926, 0xB217, 0x036B,
> +	0x9C60, 0x9417, 0x2926, 0x8345, 0xA817, 0x0727, 0xFB17, 0x2945,
> +	0x8820, 0x1708, 0x27FA, 0x5D87, 0x108C, 0x8289, 0x170E, 0x4826,
> +	0x9A28, 0x884C, 0x0B79, 0x1730, 0x2692, 0x1709, 0x9160, 0x27F2,
> +	0x1710, 0x2682, 0x2683, 0x5F4D, 0x2808, 0x1A27, 0xFA84, 0x69A1,
> +	0x785D, 0x2888, 0x8710, 0x8C80, 0x8A26, 0x9217, 0x036B, 0x9D95,
> +	0x2603, 0x5C01, 0x4558, 0x8E00, 0x2798, 0x170A, 0x4A0A, 0x4316,
> +	0x0B43, 0x5B43, 0x1659, 0x4316, 0x8E03, 0x279C, 0x4578, 0x1707,
> +	0x279D, 0x1722, 0x5D87, 0x1028, 0x0853, 0x0D8C, 0x808A, 0x4558,
> +	0x1708, 0x8E01, 0x2798, 0x8E00, 0x76A2, 0x77A2, 0x4644, 0x1616,
> +	0x967A, 0x2644, 0x5C05, 0x1244, 0x4B71, 0x759E, 0x8B86, 0x184A,
> +	0x0343, 0x1606, 0x4316, 0x0743, 0x1604, 0x4316, 0x5843, 0x165A,
> +	0x4316, 0x4558, 0x8E03, 0x279C, 0x4578, 0x7B17, 0x0727, 0x9D17,
> +	0x2245, 0x5822, 0x1710, 0x8E01, 0x2798, 0x8E00, 0x1710, 0x1244,
> +	0x4B8D, 0x602C, 0x2C2C, 0x2C00,
> +};
> +
> +// A-1000 Hidy and linear sequencer load August 2 2011
> +static const u16 sequencer_mt9m024[] = {
> +	0x0025, 0x5050, 0x2D26, 0x0828, 0x0D17, 0x0926, 0x0028, 0x0526,
> +	0xA728, 0x0725, 0x8080, 0x2925, 0x0040, 0x2702, 0x1616, 0x2706,
> +	0x1F17, 0x3626, 0xA617, 0x0326, 0xA417, 0x1F28, 0x0526, 0x2028,
> +	0x0425, 0x2020, 0x2700, 0x171D, 0x2500, 0x2017, 0x1219, 0x1703,
> +	0x2706, 0x1728, 0x2805, 0x171A, 0x2660, 0x175A, 0x2317, 0x1122,
> +	0x1741, 0x2500, 0x9027, 0x0026, 0x1828, 0x002E, 0x2A28, 0x081C,
> +	0x1470, 0x7003, 0x1470, 0x7004, 0x1470, 0x7005, 0x1470, 0x7009,
> +	0x170C, 0x0014, 0x0020, 0x0014, 0x0050, 0x0314, 0x0020, 0x0314,
> +	0x0050, 0x0414, 0x0020, 0x0414, 0x0050, 0x0514, 0x0020, 0x2405,
> +	0x1400, 0x5001, 0x2550, 0x502D, 0x2608, 0x280D, 0x1709, 0x2600,
> +	0x2805, 0x26A7, 0x2807, 0x2580, 0x8029, 0x2500, 0x4027, 0x0216,
> +	0x1627, 0x0620, 0x1736, 0x26A6, 0x1703, 0x26A4, 0x171F, 0x2805,
> +	0x2620, 0x2804, 0x2520, 0x2027, 0x0017, 0x1D25, 0x0020, 0x1712,
> +	0x1A17, 0x0327, 0x0617, 0x2828, 0x0517, 0x1A26, 0x6017, 0xAE25,
> +	0x0090, 0x2700, 0x2618, 0x2800, 0x2E2A, 0x2808, 0x1D05, 0x1470,
> +	0x7009, 0x1720, 0x1400, 0x2024, 0x1400, 0x5002, 0x2550, 0x502D,
> +	0x2608, 0x280D, 0x1709, 0x2600, 0x2805, 0x26A7, 0x2807, 0x2580,
> +	0x8029, 0x2500, 0x4027, 0x0216, 0x1627, 0x0617, 0x3626, 0xA617,
> +	0x0326, 0xA417, 0x1F28, 0x0526, 0x2028, 0x0425, 0x2020, 0x2700,
> +	0x171D, 0x2500, 0x2021, 0x1712, 0x1B17, 0x0327, 0x0617, 0x2828,
> +	0x0517, 0x1A26, 0x6017, 0xAE25, 0x0090, 0x2700, 0x2618, 0x2800,
> +	0x2E2A, 0x2808, 0x1E17, 0x0A05, 0x1470, 0x7009, 0x1616, 0x1616,
> +	0x1616, 0x1616, 0x1616, 0x1616, 0x1616, 0x1616, 0x1616, 0x1616,
> +	0x1616, 0x1616, 0x1616, 0x1614, 0x0020, 0x2414, 0x0050, 0x2B2B,
> +	0x2C2C, 0x2C2C, 0x2C00,
> +};
> +
> +static const u16 sequencer_mt9m024_linear[] = {
> +	0x0225, 0x5050, 0x2D26, 0x0828, 0x0D17, 0x0926, 0x0028, 0x0526,
> +	0xA728, 0x0725, 0x8080, 0x2917, 0x0525, 0x0040, 0x2702, 0x1616,
> +	0x2706, 0x1736, 0x26A6, 0x1703, 0x26A4, 0x171F, 0x2805, 0x2620,
> +	0x2804, 0x2520, 0x2027, 0x0017, 0x1E25, 0x0020, 0x2117, 0x1028,
> +	0x051B, 0x1703, 0x2706, 0x1703, 0x1747, 0x2660, 0x17AE, 0x2500,
> +	0x9027, 0x0026, 0x1828, 0x002E, 0x2A28, 0x081E, 0x0831, 0x1440,
> +	0x4014, 0x2020, 0x1410, 0x1034, 0x1400, 0x1014, 0x0020, 0x1400,
> +	0x4013, 0x1802, 0x1470, 0x7004, 0x1470, 0x7003, 0x1470, 0x7017,
> +	0x2002, 0x1400, 0x2002, 0x1400, 0x5004, 0x1400, 0x2004, 0x1400,
> +	0x5022, 0x0314, 0x0020, 0x0314, 0x0050, 0x2C2C, 0x2C2C,
> +};
> +
> +static const struct reg_entry ar0141cs_configuration[] = {
> +	/* Optimized and Sequencer settings (referenced by AR0141CS-REV1.ini) */
> +	{APT_DARK_CONTROL,		APT_DARK_CONTROL_ROW_NOISE},
> +	{0x3052,			0xA124},
> +	{0x3092,			0x010F},
> +	{0x30FE,			0x0080},
> +	{0x3ECE,			0x40FF},
> +	{0x3ED0,			0xFF40},
> +	{0x3ED2,			0xA906},
> +	{0x3ED4,			0x001F},
> +	{0x3ED6,			0x638F},
> +	{0x3ED8,			0xCC99},
> +	{0x3EDA,			0x0888},
> +	{0x3EDE,			0x8878},
> +	{0x3EE0,			0x7744},
> +	{0x3EE2,			0x4463},
> +	{0x3EE4,			0xAAE0},
> +	{0x3EE6,			0x1400},
> +	{0x3EEA,			0xA4FF},
> +	{0x3EEC,			0x80F0},
> +	{0x3EEE,			0x0000},
> +	{0x31E0,			0x1701},
> +	{0x304C,			0x2000},
> +	{0x304A,			0x0210},
> +	/* It's not clear why and how long we need to sleep here. If we don't,
> +	 * i2c writes start to fail.
> +	 */
> +	{MSLEEP,			200},
> +	/* imager configuration */
> +	{APT_ROW_SPEED,			0x0010},
> +	{APT_HDR_COMPANDING,		0x0000},
> +	{APT_DIGITAL_CTRL,		APT_DIGITAL_CTRL_DITHERING | 0x010C},
> +	{0x31AC,			0x0C0C}, /* data_format_bits */
> +	/* serial format:
> +	 * GENMASK(9, 8) must be 3, selects HiSPi if serial interface is enabled
> +	 * GENMASK(2, 0) line-count, 1 -> parallel
> +	 */
> +	{0x31AE,			0x0301},
> +	{APT_FRAME_LENGTH_LINES,	APT_FRAME_LENGTH_LINES_VALUE},
> +	{APT_LINE_LENGTH_PCK,		APT_LINE_LENGTH_PCK_VALUE},
> +	{APT_EMBEDDED_DATA_CTRL,	0x1802},
> +};
> +
> +static const struct reg_entry mt9m024_configuration[] = {
> +	/* OnSemi A-1000ERS Optimized settings (August 2 2011),
> +	 * but with a reduced pedestal for better black level
> +	 */
> +	{APT_DATA_PEDESTAL,		0x00A8},
> +	{APT_DAC_LD_14_15,		0x0F03},
> +	{APT_DAC_LD_18_19,		0xC005},
> +	{APT_DAC_LD_12_13,		0x09EF},
> +	{APT_DAC_LD_22_23,		0xA46B},
> +	{APT_DAC_LD_20_21,		0x067D},
> +	{APT_DAC_LD_16_17,		0x0070},
> +	{APT_DAC_LD_26_27,		0x8303},
> +	{APT_DAC_LD_24_25,		0xD208},
> +	{APT_DAC_LD_10_11,		0x00BD},
> +	{APT_ADC_BITS_6_7,		0x6372},
> +	{APT_ADC_BITS_4_5,		0x7253},
> +	{APT_ADC_BITS_2_3,		0x5470},
> +	{APT_ADC_CONFIG1,		0xC4CC},
> +	{APT_ADC_CONFIG2,		0x8050},
> +	/* imager configuration */
> +	{APT_ROW_SPEED,			0x0010},
> +	{APT_DIGITAL_BINNING,		0x0000},
> +	{APT_COLUMN_CORRECTION,		0xE007},
> +	{APT_DIGITAL_CTRL,		0x0008},
> +	{APT_FRAME_LENGTH_LINES,	APT_FRAME_LENGTH_LINES_VALUE},
> +	{APT_LINE_LENGTH_PCK,		APT_LINE_LENGTH_PCK_VALUE},
> +	{APT_FINE_INTEGRATION_TIME,	APT_FINE_INTEGRATION_TIME_VALUE},
> +	{APT_Y_ODD_INC,			0x0001},
> +	{APT_EMBEDDED_DATA_CTRL,	0x1802},
> +	{APT_HISPI_CONTROL_STATUS,	0x8008},
> +	{APT_DARK_CONTROL,		APT_DARK_CONTROL_ROW_NOISE | 4},
> +	/* BIT(0): off/on
> +	 * BIT(1): 12bit/14bit
> +	 */
> +	{APT_HDR_COMPANDING,		BIT(0)}, /* 12bit enabled */
> +};
> +
> +static const struct aptina_pll_limits ar0141cs_limits = {
> +	.ext_clock_min = 6000000,
> +	.ext_clock_max = 50000000,
> +	/* The int_clock is not bounded by the data sheet. */
> +	.int_clock_min = 1,
> +	.int_clock_max = 50000000,
> +	.out_clock_min = 384000000,
> +	.out_clock_max = 768000000,
> +	.pix_clock_max = 74250000,
> +
> +	.n_min = 1,
> +	.n_max = 63,
> +	.m_min = 32,
> +	/* The data sheet revision 7 page 16 says that the maximum multiplier
> +	 * is 384. However the register reference revision 3 page 6 say that
> +	 * the corresponding register has only 8 bits.
> +	 */
> +	.m_max = 255,
> +	/* We fix p1 = 1 and control p2 here. */
> +	.p1_min = 4,
> +	.p1_max = 16,
> +};
> +
> +static const struct aptina_pll_limits mt9m024_limits = {
> +	.ext_clock_min = 6000000,
> +	.ext_clock_max = 50000000,
> +	.int_clock_min = 2000000,
> +	.int_clock_max = 24000000,
> +	.out_clock_min = 384000000,
> +	.out_clock_max = 768000000,
> +	.pix_clock_max = 74250000,
> +
> +	.n_min = 1,
> +	.n_max = 63,
> +	.m_min = 32,
> +	.m_max = 255,
> +	/* We fix p1 = 1 and control p2 here. */
> +	.p1_min = 4,
> +	.p1_max = 16,
> +};
> +
> +static int read_word_from_i2c_device(struct i2c_client *client, u16 register_id,
> +				     u16 *return_value)
> +{
> +	__be16 reg_buffer, val_buffer;
> +	int ret = 0;
> +	struct i2c_msg msg[2];
> +
> +	if (!client || !return_value)
> +		return -EINVAL;
> +
> +	reg_buffer = cpu_to_be16(register_id);
> +
> +	msg[0].addr  = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].buf   = (u8 *)&reg_buffer;
> +	msg[0].len   = sizeof(reg_buffer);
> +
> +	msg[1].addr  = client->addr;
> +	msg[1].flags = I2C_M_RD;
> +	msg[1].buf   = (u8 *)&val_buffer;
> +	msg[1].len   = sizeof(val_buffer);
> +
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +
> +	if (ret == 2) {
> +		*return_value = be16_to_cpu(val_buffer);
> +		return 0;
> +	} else if (ret >= 0) {
> +		return -EINTR;
> +	}
> +	return ret;
> +}
> +
> +static int write_word_to_i2c_device(struct i2c_client *client, u16 register_id,
> +				    u16 value)
> +{
> +	__be16 buffer[2];
> +	int ret;
> +
> +	if (!client)
> +		return -EINVAL;
> +
> +	buffer[0] = cpu_to_be16(register_id);
> +	buffer[1] = cpu_to_be16(value);
> +
> +	ret = i2c_master_send(client, (const char *)&buffer, sizeof(buffer));
> +	if (ret == 4)
> +		return 0;
> +	else if (ret >= 0)
> +		return -EINTR;
> +	return ret;
> +}
> +
> +static int write_i2c_word_sequence(struct i2c_client *client,
> +				   const struct reg_entry *data,
> +				   size_t count)
> +{
> +	while (count) {
> +		if (data->reg == MSLEEP) {
> +			msleep(data->value);
> +		} else if (data->reg >= 0 && data->reg <= 0xffff) {
> +			int ret = write_word_to_i2c_device(client, data->reg,
> +							   data->value);
> +			if (ret) {
> +				dev_err(&client->dev,
> +					"write register of image sensor failed (reg=0x%x value=0x%x, err=%d)!\n",
> +					data->reg, data->value, ret);
> +				return ret;
> +			}
> +		} else {
> +			return -EINVAL;
> +		}
> +
> +		--count;
> +		++data;
> +	}
> +	return 0;
> +}
> +
> +/* Refer to the AR0141CS data sheet revision 7 page 15 for details on
> + * the gain computation. The following macro is another way of writing:
> + * 100000 * pow(2, coarse) * (1 + fine/16)
> + */
> +#define G2ISO(coarse, fine) \
> +	((1 << (coarse)) * (100000 + (100000 / 16) * (fine)))
> +static const s64 ar0141cs_again_menu[] = {
> +	G2ISO(0, 0),  G2ISO(0, 1),  G2ISO(0, 2),  G2ISO(0, 3),
> +	G2ISO(0, 4),  G2ISO(0, 5),  G2ISO(0, 6),  G2ISO(0, 7),
> +	G2ISO(0, 8),  G2ISO(0, 9),  G2ISO(0, 10), G2ISO(0, 11),
> +	G2ISO(0, 12), G2ISO(0, 13), G2ISO(0, 14), G2ISO(0, 15),
> +	G2ISO(1, 0),  G2ISO(1, 1),  G2ISO(1, 2),  G2ISO(1, 3),
> +	G2ISO(1, 4),  G2ISO(1, 5),  G2ISO(1, 6),  G2ISO(1, 7),
> +	G2ISO(1, 8),  G2ISO(1, 9),  G2ISO(1, 10), G2ISO(1, 11),
> +	G2ISO(1, 12), G2ISO(1, 13), G2ISO(1, 14), G2ISO(1, 15),
> +	G2ISO(2, 0),  G2ISO(2, 1),  G2ISO(2, 2),  G2ISO(2, 3),
> +	G2ISO(2, 4),  G2ISO(2, 5),  G2ISO(2, 6),  G2ISO(2, 7),
> +	G2ISO(2, 8),  G2ISO(2, 9),  G2ISO(2, 10), G2ISO(2, 11),
> +	G2ISO(2, 12), G2ISO(2, 13), G2ISO(2, 14), G2ISO(2, 15),
> +	G2ISO(3, 0),  G2ISO(3, 1),  G2ISO(3, 2),  G2ISO(3, 3),
> +	G2ISO(3, 4),  G2ISO(3, 5),  G2ISO(3, 6),  G2ISO(3, 7),
> +	G2ISO(3, 8),
> +	/* The last gain corresponds to 12x (8x coarse times 1.5x fine). It is
> +	 * the maximum recommended gain in the AR0141CS data sheet revision 7
> +	 * page 15.
> +	 */
> +};
> +#undef G2I

No need to #undef.

> +
> +static int ar0141cs_again_set(struct mt9m02x_state *state, s32 index)
> +{
> +	/* The 4 low bits of index hold the fine gain. The next 3 bits hold the
> +	 * coarse gain. That means we're lucky. Context A uses exactly the same
> +	 * layout. Context B has the same representation shifted by 8.
> +	 */
> +	return write_word_to_i2c_device(state->client, AR0141CS_ANALOG_GAIN,
> +					index);
> +}
> +
> +static const s64 mt9m02x_again_menu[] = {
> +	100000, /* 1x */
> +	125000, /* 1.25x */
> +	200000, /* 2x */
> +	250000, /* 2.5x */
> +	400000, /* 4x */
> +	500000, /* 5x */
> +	800000, /* 8x */
> +	1000000, /* 10x */

I guess you could remove three zeros from right as they're the same for
all.

> +};
> +
> +static int mt9m02x_again_set(struct mt9m02x_state *state, s32 index)
> +{
> +	int ret;
> +	u16 v = BIT(12);
> +
> +	if (state->model->monochrome)
> +		v |= APT_DIGITAL_TEST_MONOCHROME;
> +
> +	/* Bank A, ignore bank B (shift 8 instead of 4) for now. */
> +	v &= ~(3 << 4);
> +	/* index >> 1 is the stage1 gain in powers of 2. */
> +	v |= (index >> 1) << 4;
> +	ret = write_word_to_i2c_device(state->client, APT_DIGITAL_TEST, v);
> +	if (ret)
> +		return ret;
> +
> +	/* set stage2, multiplier */
> +	ret = read_word_from_i2c_device(state->client, APT_DAC_LD_24_25, &v);
> +	if (ret)
> +		return ret;
> +
> +	/* The least significant bit controls the 1.25x amplifier,
> +	 * which is bank-independent.
> +	 */
> +	if (index & 1)
> +		v |= BIT(8);
> +	else
> +		v &= ~BIT(8);
> +	v |= BIT(9);
> +
> +	return write_word_to_i2c_device(state->client, APT_DAC_LD_24_25, v);
> +}
> +
> +static const struct chip_info chip_ar0141cs = {
> +	.version = 0x0151,
> +	.pll_limits = &ar0141cs_limits,
> +	.reset_wait_cycles = 1800,
> +	.sequencer = ar0141cs_sequencer,
> +	.sequencer_length = ARRAY_SIZE(ar0141cs_sequencer),
> +	.configuration = ar0141cs_configuration,
> +	.configuration_length = ARRAY_SIZE(ar0141cs_configuration),
> +	.width = 1280,
> +	.height = 800,
> +	.xstart = 32,
> +	.ystart = 24,
> +	.digital_gain_shift = 8 - 7,
> +	/* When setting a gain below 1.375, we see static noise. */
> +	.digital_gain_min = 0x160, /* 1.375 * BIT(8) */
> +	.digital_gain_bits = 11,
> +	.again_menu = ar0141cs_again_menu,
> +	.again_menu_length = ARRAY_SIZE(ar0141cs_again_menu),
> +	.again_set = &ar0141cs_again_set,
> +};
> +
> +static const struct model_info model_ar0141cs = {
> +	.chip = &chip_ar0141cs,
> +	.monochrome = false,
> +};
> +
> +static const struct model_info model_ar0141csm = {
> +	.chip = &chip_ar0141cs,
> +	.monochrome = true,
> +};
> +
> +static const struct chip_info chip_mt9m024 = {
> +	.version = 0x2400,
> +	.pll_limits = &mt9m024_limits,
> +	.sequencer = sequencer_mt9m024,
> +	.sequencer_length = ARRAY_SIZE(sequencer_mt9m024),
> +	.linear_sequencer = sequencer_mt9m024_linear,
> +	.linear_sequencer_length = ARRAY_SIZE(sequencer_mt9m024_linear),
> +	.configuration = mt9m024_configuration,
> +	.configuration_length = ARRAY_SIZE(mt9m024_configuration),
> +	.width = 1280,
> +	.height = 960,
> +	.digital_gain_shift = 8 - 5,
> +	.digital_gain_bits = 8,
> +	.again_menu = mt9m02x_again_menu,
> +	.again_menu_length = ARRAY_SIZE(mt9m02x_again_menu),
> +	.again_set = &mt9m02x_again_set,
> +	.temp_point1 = 70000,
> +	.temp_point2 = 55000,
> +	.temp_mask = GENMASK(10, 0),
> +};
> +
> +static const struct model_info model_mt9m024 = {
> +	.chip = &chip_mt9m024,
> +	.monochrome = false,
> +};
> +
> +static const struct model_info model_mt9m024m = {
> +	.chip = &chip_mt9m024,
> +	.monochrome = true,
> +};
> +
> +static int write_sequencer(struct i2c_client *client, const u16 *data,
> +			   size_t length)
> +{
> +	int ret;
> +
> +	while (length > 0) {
> +		ret = write_word_to_i2c_device(client, APT_SEQ_DATA_PORT,
> +					       *data);
> +		if (ret)
> +			return ret;
> +		++data;
> +		--length;
> +	}
> +	return 0;
> +}
> +
> +static int initialize_sequencer(struct mt9m02x_state *state)
> +{
> +	u16 temp_value;
> +	int ret;
> +	const struct chip_info *chip = state->model->chip;

A reverse Christmas tree form would be nicer.

(In fact I think what a variable is used for makes more difference but
usually the result is the same.)

> +
> +	if (!chip->sequencer && !chip->linear_sequencer)
> +		return 0;
> +
> +	ret = read_word_from_i2c_device(state->client, APT_SEQ_CTRL_PORT,
> +					&temp_value);
> +	if (ret)
> +		return ret;
> +	if ((temp_value & APT_SEQ_CTRL_PORT_STOPPED) == 0) {
> +		dev_err(&state->client->dev,
> +			"attempt to write sequencer without standby.\n");
> +		return -EIO;
> +	}
> +
> +	/* Rewind sequencer RAM address. */
> +	if (temp_value != APT_SEQ_CTRL_PORT_STOPPED) {
> +		ret = write_word_to_i2c_device(state->client, APT_SEQ_CTRL_PORT,
> +					       APT_SEQ_CTRL_PORT_STOPPED);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (chip->sequencer) {
> +		ret = write_sequencer(state->client, chip->sequencer,
> +				      chip->sequencer_length);
> +		if (ret)
> +			return ret;
> +	}
> +	if (chip->linear_sequencer) {
> +		ret = write_sequencer(state->client, chip->linear_sequencer,
> +				      chip->linear_sequencer_length);
> +		if (ret)
> +			return ret;
> +		/* Write start address of the linear sequencer in bytes. */
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_ERS_PROG_START_ADDR,
> +					       2 * chip->sequencer_length);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int mt9m02x_update_read_mode(struct mt9m02x_state *state)
> +{
> +	u16 v = 0;
> +
> +	if (state->binning)
> +		v |= APT_READ_MODE_BINNING;
> +	if (state->mode_cluster.hflip->val)
> +		v |= APT_READ_MODE_HFLIP;
> +	if (state->mode_cluster.vflip->val)
> +		v |= APT_READ_MODE_VFLIP;
> +	return write_word_to_i2c_device(state->client, APT_READ_MODE, v);
> +}
> +
> +static int ar0141cs_update_odd_inc(struct mt9m02x_state *state)
> +{
> +	u16 inc = state->binning ? 3 : 1;
> +	int ret = write_word_to_i2c_device(state->client, APT_X_ODD_INC, inc);
> +
> +	if (ret)
> +		return ret;
> +	return write_word_to_i2c_device(state->client, APT_Y_ODD_INC, inc);
> +}
> +
> +static int initialize_temperature_sensor(struct mt9m02x_state *state)
> +{
> +	int ret;
> +	u16 reg;
> +
> +	if (!state->model->chip->temp_mask)
> +		return -EINVAL;
> +
> +	ret = read_word_from_i2c_device(state->client, APT_TEMP, &reg);
> +	if (ret) {
> +		dev_err(&state->client->dev,
> +			"reading from temperature register failed (%d)", ret);
> +		return ret;
> +	}
> +
> +	ret = write_word_to_i2c_device(state->client, APT_TEMP, reg | 0x11);
> +	if (ret) {
> +		dev_err(&state->client->dev,
> +			"writing to temperature register failed (%d)", ret);
> +		return ret;
> +	}
> +
> +	ret = read_word_from_i2c_device(state->client, APT_TEMP_CALIB1,
> +					&state->temp_value1);
> +
> +	if (!ret)
> +		ret = read_word_from_i2c_device(state->client, APT_TEMP_CALIB2,
> +						&state->temp_value2);
> +
> +	if (ret) {
> +		dev_err(&state->client->dev,
> +			"reading temperature calibration values failed (%d)",
> +			ret);
> +
> +		/* disable */
> +		state->temp_value1 = 0;
> +		state->temp_value2 = 0;
> +		return ret;
> +	}
> +
> +	dev_dbg(&state->client->dev, "temp calib: %ldmC -> %u, %ldmC -> %u",
> +		state->model->chip->temp_point1,
> +		(unsigned int)state->temp_value1,
> +		state->model->chip->temp_point2,
> +		(unsigned int)state->temp_value2);
> +
> +	if (state->temp_value1 == state->temp_value2) {
> +		dev_err(&state->client->dev,
> +			"bad temperature calibration values");
> +		return -EIO;
> +	}
> +
> +	dev_dbg(&state->client->dev, "temperature sensor enabled");

Add "\n". Same for the rest.

> +	return 0;
> +}
> +
> +static void sleep_extcycles(const struct mt9m02x_state *state,
> +			    unsigned long cycles,
> +			    unsigned long us)
> +{
> +	/* We'd want mult_frac(cycles, 1000000, ext_clock), but that can cause
> +	 * an integer overflow.
> +	 */
> +	WARN_ON(cycles >= ~0UL / 1000);
> +	us += mult_frac(cycles, 1000, state->pll.ext_clock / 1000);
> +	usleep_range(us, us + 1000);
> +}
> +
> +static void hard_reset(struct mt9m02x_state *state)
> +{
> +	/* MT9M024 datasheet rev G: see page 59
> +	 * AR0141CS datasheet rev 7: see page 45
> +	 */
> +	gpiod_set_value_cansleep(state->reset_gpio, 1);
> +	/* MT9M024 and AR0141CS need at least 1ms. */
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(state->reset_gpio, 0);
> +	/* Give an additional 1ms for the GPIO to settle. */
> +	sleep_extcycles(state, state->model->chip->reset_wait_cycles, 1000);
> +}
> +
> +static int init_image_sensor(struct mt9m02x_state *state)
> +{
> +	int ret = 0;
> +	u16 temp_value;
> +
> +	if (state->standby_gpio)
> +		gpiod_set_value_cansleep(state->standby_gpio, 0);
> +	if (state->reset_gpio)
> +		hard_reset(state);
> +
> +	// init image sensor

/* comment, please */

> +	ret = read_word_from_i2c_device(state->client, APT_CHIP_VERSION,
> +					&temp_value);
> +	if (ret != 0) {
> +		dev_err(&state->client->dev,
> +			"read from chip version register failed\n");
> +
> +		return ret;
> +	}
> +
> +	/* AR0141CS has a documented value of 0x151, but it sometimes reports
> +	 * 0x51. It is unclear why, but this is even the case for the reference
> +	 * design. Assumption: Hardware bug.
> +	 */
> +	if (temp_value == 0x51)
> +		temp_value = 0x151;
> +
> +	if (temp_value != state->model->chip->version) {
> +		dev_err(&state->client->dev, "expected chip %x found %x\n",
> +			state->model->chip->version, temp_value);
> +		return -ENODEV;
> +	}
> +
> +	ret = aptina_pll_calculate(&state->client->dev,
> +				   state->model->chip->pll_limits,
> +				   &state->pll);
> +	if (ret)
> +		return ret;
> +
> +	if (!state->reset_gpio) {
> +		// reset_register_reset (full reset)
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_RESET_REGISTER,
> +					       APT_RESET_DO_RESET);
> +		if (ret != 0) {
> +			dev_err(&state->client->dev,
> +				"resetting image sensor failed\n");
> +			return ret;
> +		}
> +
> +		// wait for imager go out of reset
> +		msleep(200);
> +	}
> +
> +	// configure register_reset
> +	ret = write_word_to_i2c_device(state->client, APT_RESET_REGISTER,
> +				       APT_RESET_LOCK_REG |
> +				       APT_RESET_PARALLEL_MODE |
> +				       APT_RESET_GPI_ENABLE);
> +	if (ret != 0) {
> +		dev_err(&state->client->dev,
> +			"configuring of imager \"register_reset\" failed\n");
> +		return ret;
> +	}
> +
> +	if (!state->reset_gpio)
> +		// wait for imager go out of reset
> +		msleep(200);
> +
> +	ret = initialize_sequencer(state);
> +	if (ret)
> +		return ret;
> +
> +	ret = write_i2c_word_sequence(state->client,
> +				      state->model->chip->configuration,
> +				      state->model->chip->configuration_length);
> +	if (ret)
> +		return ret;
> +
> +	if (state->model->chip == &chip_ar0141cs) {
> +		ret = ar0141cs_update_odd_inc(state);
> +		if (ret)
> +			return ret;
> +		ret = write_word_to_i2c_device(state->client, APT_DIGITAL_TEST,
> +					       state->model->monochrome ?
> +					       APT_DIGITAL_TEST_MONOCHROME : 0);
> +		if (ret)
> +			return ret;
> +
> +		/* AR0141CS datasheet rev 7 page 45:
> +		 * Wait for OTPM after writing 0x304A.
> +		 */
> +		sleep_extcycles(state, 185135, 0);
> +	} else if (state->model->chip == &chip_mt9m024) {
> +		ret = read_word_from_i2c_device(state->client,
> +						APT_DIGITAL_LATERAL,
> +						&temp_value);
> +		if (ret)
> +			return ret;
> +		// Bit 13 -> disable/enable dlo,
> +		// Bit 14 -> disable/enable noise filter
> +		temp_value |= BIT(13) | BIT(14);
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_DIGITAL_LATERAL,
> +					       temp_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	{
> +		struct reg_entry values[] = {
> +			{ APT_X_ADDR_START, state->model->chip->xstart },
> +			{ APT_Y_ADDR_START, state->model->chip->ystart },
> +			{ APT_X_ADDR_END,
> +			  state->model->chip->xstart +
> +			  state->model->chip->width - 1 },
> +			{ APT_Y_ADDR_END,
> +			  state->model->chip->ystart +
> +			  state->model->chip->height - 1 },
> +		};
> +		ret = write_i2c_word_sequence(state->client, values,
> +					      ARRAY_SIZE(values));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	{
> +		struct reg_entry values[] = {
> +			{ APT_VT_PIX_CLK_DIV, state->pll.p1 },
> +			{ APT_VT_SYS_CLK_DIV, 1 },
> +			{ APT_PRE_PLL_CLK_DIV, state->pll.n },
> +			{ APT_PLL_MULTIPLIER, state->pll.m },
> +		};
> +		ret = write_i2c_word_sequence(state->client, values,
> +					      ARRAY_SIZE(values));
> +		if (ret)
> +			return ret;
> +
> +		/* AR0141CS datasheet rev 7 page 45
> +		 * MT9M024 datasheet rev G page 59
> +		 */
> +		usleep_range(1000, 2000);
> +	}
> +
> +	/* Enable flash strobe pin. Actual flash is activated/deactivated
> +	 * elsewhere.
> +	 */
> +	ret = read_word_from_i2c_device(state->client, APT_FLASH, &temp_value);
> +	if (ret)
> +		return ret;
> +	temp_value |= APT_FLASH_ENABLED;
> +	ret = write_word_to_i2c_device(state->client, APT_FLASH, temp_value);
> +	if (ret)
> +		return ret;
> +
> +	/* Perform column correction triggering on startup (see datasheet
> +	 * "AR0132AT-D.pdf" p.34).
> +	 */
> +	ret = read_word_from_i2c_device(state->client, APT_RESET_REGISTER,
> +					&temp_value);
> +	if (ret == 0) {
> +		temp_value |= APT_RESET_ENABLE_STREAMING;
> +
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_RESET_REGISTER, temp_value);
> +		if (ret != 0)
> +			dev_err(&state->client->dev,
> +				"write to reset register failed (value=%u)\n",
> +				(u32)temp_value);
> +	} else {
> +		dev_err(&state->client->dev,
> +			"read from reset register failed\n");
> +	}
> +
> +	if (ret != 0)
> +		return ret;
> +
> +	// wait for 500ms -> 10 frames
> +	msleep(500);
> +
> +	ret = read_word_from_i2c_device(state->client, APT_RESET_REGISTER,
> +					&temp_value);
> +	if (ret == 0) {
> +		temp_value &= ~APT_RESET_ENABLE_STREAMING;
> +
> +		// stop sensor streaming
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_RESET_REGISTER, temp_value);
> +		if (ret != 0)
> +			dev_err(&state->client->dev,
> +				"write to reset register failed (value=%u)\n",
> +				(u32)temp_value);
> +	} else {
> +		dev_err(&state->client->dev,
> +			"read from reset register failed\n");
> +	}
> +
> +	if (ret != 0)
> +		return ret;
> +
> +	/* optional, continue in the presence of errors */
> +	initialize_temperature_sensor(state);
> +
> +	return 0;
> +}
> +
> +static umode_t mt9m02x_hwmon_is_visible(const void *private_data,
> +					enum hwmon_sensor_types type, u32 attr,
> +					int channel)
> +{
> +	return type == hwmon_temp && attr == hwmon_temp_input ? 0444 : 0;
> +}
> +
> +static int mt9m02x_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct mt9m02x_state *state = dev_get_drvdata(dev);
> +	const struct chip_info *chip = state->model->chip;
> +	int ret;
> +	u16 reg_value;
> +
> +	if (type != hwmon_temp || attr != hwmon_temp_input)
> +		return -EINVAL;
> +
> +	ret = read_word_from_i2c_device(state->client, APT_TEMP_VALUE,
> +					&reg_value);
> +	if (ret)
> +		return ret;
> +	reg_value &= chip->temp_mask;
> +	/* reg_value is temp_valueX at temp_pointX milli degree C with linear
> +	 * interpolation.
> +	 */
> +	*val = (((long)reg_value - (long)state->temp_value2) *
> +		(chip->temp_point1 - chip->temp_point2)) /
> +	       ((long)state->temp_value1 - (long)state->temp_value2) +
> +	       chip->temp_point2;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops mt9m02x_hwmon_ops = {
> +	.is_visible = &mt9m02x_hwmon_is_visible,
> +	.read = &mt9m02x_hwmon_read,
> +};
> +
> +static const u32 mt9m02x_hwmon_temp_config[] = {
> +	HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info mt9m02x_hwmon_temp_channel = {
> +	.type = hwmon_temp,
> +	.config = mt9m02x_hwmon_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *mt9m02x_hwmon_channel_info[] = {
> +	&mt9m02x_hwmon_temp_channel,
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info mt9m02x_hwmon_info = {
> +	.ops = &mt9m02x_hwmon_ops,
> +	.info = mt9m02x_hwmon_channel_info,
> +};
> +
> +static bool mt9m02x_is_wdr(struct mt9m02x_state *state)
> +{
> +	return state->model->chip == &chip_mt9m024 &&
> +	       state->opmode_cluster.wdr->val;
> +}
> +
> +static u32 mt9m02x_exposure_100us_to_coarse(struct mt9m02x_state *state, u32 v)
> +{
> +	u64 t = mul_u32_u32(v, state->pll.pix_clock);
> +
> +	/* ctrl->val is s/10000 and pix_clock is Hz. */
> +	do_div(t, 10000);
> +
> +	/* MT9M024 datasheet rev. G page 24:
> +	 * When HDR is enabled, fine integration time is ignored.
> +	 */
> +	if (!mt9m02x_is_wdr(state))
> +		t -= APT_FINE_INTEGRATION_TIME_VALUE;
> +	do_div(t, APT_LINE_LENGTH_PCK_VALUE);
> +	dev_dbg(&state->client->dev,
> +		"exposure = %u -> coarse integration = %llu\n", v, t);
> +	return t;
> +}
> +
> +static u32 mt9m02x_exposure_coarse_to_100us(struct mt9m02x_state *state, u32 v)
> +{
> +	u64 t = mul_u32_u32(v, APT_LINE_LENGTH_PCK_VALUE);
> +
> +	/* MT9M024 datasheet rev. G page 24:
> +	 * When HDR is enabled, fine integration time is ignored.
> +	 */
> +	if (!mt9m02x_is_wdr(state))
> +		t += APT_FINE_INTEGRATION_TIME_VALUE;
> +	t = mul_u64_u32_div(t, 10000, state->pll.pix_clock);
> +	dev_dbg(&state->client->dev,
> +		"coarse integration = %u -> exposure = %llu\n", v, t);
> +	return t;
> +}
> +
> +static int mt9m02x_update_exposure_range(struct mt9m02x_state *state)
> +{
> +	u32 low, high, def;
> +
> +	if (mt9m02x_is_wdr(state)) {
> +		/* MT9M024 datasheet rev. G, page 24:
> +		 * t1/t2 = 4 << ratio_t1t2
> +		 * t2/t3 = 4 << ratio_t2t3
> +		 * low >= (t1/t2) * (t2/t3) * 0.5
> +		 */
> +		low = 8 << (state->opmode_cluster.ratio_t1t2->val +
> +			    state->opmode_cluster.ratio_t2t3->val);
> +		/* high <= 42 * (t1/t2) */
> +		high = min(APT_FRAME_LENGTH_LINES_VALUE - 45,
> +			   42 * 4 << state->opmode_cluster.ratio_t1t2->val);
> +	} else {
> +		/* MT9M024 datasheet rev. G, page 21: */
> +		low = 2;
> +		/* MT9M024 datasheet rev. G, page 24: */
> +		high = APT_FRAME_LENGTH_LINES_VALUE - 1;
> +	}
> +	WARN_ON(low > high);
> +
> +	low = max_t(u32, 1, mt9m02x_exposure_coarse_to_100us(state, low));
> +	high = mt9m02x_exposure_coarse_to_100us(state, high);
> +	def = mt9m02x_exposure_coarse_to_100us(
> +		state, APT_COARSE_INTEGRATION_TIME_DEFAULT);
> +
> +	return __v4l2_ctrl_modify_range(state->exposure_ctrl, low, high, 1,
> +					clamp(def, low, high));
> +}
> +
> +static int mt9m02x_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mt9m02x_state *state =
> +		container_of(ctrl->handler, struct mt9m02x_state, ctrls);
> +	int ret;
> +	u16 temp_value;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ISO_SENSITIVITY:
> +		return state->model->chip->again_set(state, ctrl->val);
> +
> +	case V4L2_CID_DIGITAL_GAIN:
> +		if (mt9m02x_is_wdr(state))
> +			return 0; /* see V4L2_CID_WIDE_DYNAMIC_RANGE */
> +
> +		return write_word_to_i2c_device(
> +			state->client, APT_GLOBAL_GAIN,
> +			ctrl->val >> state->model->chip->digital_gain_shift);
> +
> +	case V4L2_CID_HFLIP:
> +	/* case V4L2_CID_VFLIP: cluster */

One stop right, please, and the same for the rest of such comments.

> +		return mt9m02x_update_read_mode(state);
> +
> +	case V4L2_CID_EXPOSURE_ABSOLUTE:
> +		return write_word_to_i2c_device(
> +			state->client, APT_COARSE_INTEGRATION_TIME,
> +			mt9m02x_exposure_100us_to_coarse(state, ctrl->val));
> +
> +	case V4L2_CID_WIDE_DYNAMIC_RANGE:
> +	/* case MT9M02X_V4L2_CID_HDR_RATIO_T1T2: cluster */
> +	/* case MT9M02X_V4L2_CID_HDR_RATIO_T2T3: cluster */
> +		if (state->model->chip != &chip_mt9m024)
> +			return -EOPNOTSUPP;
> +		/* Bits:
> +		 * 0: 0 = HDR, 1 = linear
> +		 * 1: fixed 0
> +		 * 2-3: ratio_t1t2
> +		 * 4-5: ratio_t2t3
> +		 * 6-15: fixed 0
> +		 */
> +		temp_value =
> +			(state->opmode_cluster.wdr->val ? 0 : 1) |
> +			(state->opmode_cluster.ratio_t1t2->val << 2) |
> +			(state->opmode_cluster.ratio_t2t3->val << 4);
> +		ret = write_word_to_i2c_device(state->client,
> +					       APT_OPERATION_MODE_CTRL,
> +					       temp_value);
> +		if (ret)
> +			return ret;
> +
> +		ret = mt9m02x_update_exposure_range(state);
> +		if (ret)
> +			return ret;
> +
> +		/* Ratios are only active when HDR is enabled. */
> +		v4l2_ctrl_activate(state->opmode_cluster.ratio_t1t2,
> +				   state->opmode_cluster.wdr->val);
> +		v4l2_ctrl_activate(state->opmode_cluster.ratio_t2t3,
> +				   state->opmode_cluster.wdr->val);
> +
> +		/* When HDR is enabled, digital gain is dependent on ratios
> +		 * and cannot be controlled otherwise.
> +		 */
> +		v4l2_ctrl_activate(state->digital_gain_ctrl,
> +				   !state->opmode_cluster.wdr->val);
> +		if (state->opmode_cluster.wdr->val)
> +			/* MT9M024 datasheet rev. G, table 7 */
> +			temp_value = 1 << (1 +
> +				state->opmode_cluster.ratio_t1t2->val +
> +				state->opmode_cluster.ratio_t2t3->val);
> +		else
> +			temp_value = state->digital_gain_ctrl->val >>
> +				state->model->chip->digital_gain_shift;
> +		return write_word_to_i2c_device(state->client, APT_GLOBAL_GAIN,
> +						temp_value);
> +	}
> +	return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops mt9m02x_ctrl_ops = {
> +	.s_ctrl = mt9m02x_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config mt9m02x_hdr_ratio_t1t2_ctrl = {
> +	.ops = &mt9m02x_ctrl_ops,
> +	.id = MT9M02X_V4L2_CID_HDR_RATIO_T1T2,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.name = "HDR ratio T1T2",
> +	.min = 0,
> +	.max = 2,
> +	.step = 1,
> +	.def = 0,
> +	.flags = 0,
> +};
> +
> +static const struct v4l2_ctrl_config mt9m02x_hdr_ratio_t2t3_ctrl = {
> +	.ops = &mt9m02x_ctrl_ops,
> +	.id = MT9M02X_V4L2_CID_HDR_RATIO_T2T3,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.name = "HDR ratio T2T3",
> +	.min = 0,
> +	.max = 2,
> +	.step = 1,
> +	.def = 0,
> +	.flags = 0,
> +};
> +
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int mt9m02x_g_register(struct v4l2_subdev *sd,
> +			      struct v4l2_dbg_register *reg)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	u16 value;
> +	int ret;
> +
> +	if (reg->reg < 0x3000 || reg->reg > 0x3FFF)
> +		return -EINVAL;
> +
> +	ret = read_word_from_i2c_device(client, reg->reg, &value);
> +	if (ret)
> +		return ret;
> +
> +	reg->val = value;
> +	reg->size = 2;
> +	return 0;
> +}
> +
> +static int mt9m02x_s_register(struct v4l2_subdev *sd,
> +			      const struct v4l2_dbg_register *reg)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +
> +	if (reg->reg < 0x3000 || reg->reg > 0x3FFF)
> +		return -EINVAL;
> +
> +	return write_word_to_i2c_device(client, reg->reg, reg->val);
> +}
> +#endif
> +
> +static const struct v4l2_subdev_core_ops mt9m02x_v4l2_subdev_core_ops = {
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.g_register = &mt9m02x_g_register,
> +	.s_register = &mt9m02x_s_register,
> +#endif
> +};
> +
> +static inline u32 get_mbus_code(struct mt9m02x_state *state)
> +{
> +	return state->model->monochrome ? MEDIA_BUS_FMT_Y12_1X12 :
> +					  MEDIA_BUS_FMT_SGRBG12_1X12;
> +}
> +
> +static int mt9m02x_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct mt9m02x_state *state = container_of(sd, struct mt9m02x_state,
> +						   sd);
> +
> +	if (code->pad || code->index)
> +		return -EINVAL;
> +	code->code = get_mbus_code(state);
> +	return 0;
> +}
> +
> +static int mt9m02x_enum_frame_size(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct mt9m02x_state *state = container_of(sd, struct mt9m02x_state,
> +						   sd);
> +
> +	if (fse->pad || fse->code != get_mbus_code(state) || fse->index > 1)
> +		return -EINVAL;
> +	fse->min_width = state->model->chip->width / (fse->index + 1);
> +	fse->max_width = fse->min_width;
> +	fse->min_height = state->model->chip->height / (fse->index + 1);
> +	fse->max_height = fse->min_height;
> +	return 0;
> +}
> +
> +static int mt9m02x_get_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *format)
> +{
> +	struct mt9m02x_state *state = container_of(sd, struct mt9m02x_state,
> +						   sd);
> +
> +	if (format->pad)
> +		return -EINVAL;
> +
> +	format->format.field = V4L2_FIELD_NONE;
> +	format->format.code = get_mbus_code(state);
> +	format->format.colorspace = V4L2_COLORSPACE_SRGB;
> +	mutex_lock(state->ctrls.lock);
> +	format->format.width = state->model->chip->width /
> +		(state->binning + 1);
> +	format->format.height = state->model->chip->height /
> +		(state->binning + 1);
> +	mutex_unlock(state->ctrls.lock);
> +	return 0;
> +}
> +
> +static int mt9m02x_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *format)
> +{
> +	struct mt9m02x_state *state = container_of(sd, struct mt9m02x_state,
> +						   sd);
> +	bool binning = false;
> +	int ret;
> +
> +	if (format->pad)
> +		return -EINVAL;
> +
> +	format->format.field = V4L2_FIELD_NONE;
> +	format->format.code = get_mbus_code(state);
> +	format->format.colorspace = V4L2_COLORSPACE_SRGB;
> +	if (format->format.width * 4 <= state->model->chip->width * 3 &&
> +	    format->format.height * 4 <= state->model->chip->height * 3)
> +		binning = true;
> +	format->format.width = state->model->chip->width / (binning + 1);
> +	format->format.height = state->model->chip->height / (binning + 1);
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		cfg->try_fmt = format->format;
> +		return 0;
> +	}
> +	mutex_lock(state->ctrls.lock);
> +	state->binning = binning;
> +	ret = mt9m02x_update_read_mode(state);
> +	if (state->model->chip == &chip_ar0141cs && !ret)
> +		ret = ar0141cs_update_odd_inc(state);
> +	mutex_unlock(state->ctrls.lock);
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops mt9m02x_v4l2_subdev_pad_ops = {
> +	.enum_mbus_code = &mt9m02x_enum_mbus_code,
> +	.enum_frame_size = &mt9m02x_enum_frame_size,
> +	.get_fmt = &mt9m02x_get_fmt,
> +	.set_fmt = &mt9m02x_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops mt9m02x_v4l2_subdev_ops = {
> +	.core = &mt9m02x_v4l2_subdev_core_ops,
> +	.pad = &mt9m02x_v4l2_subdev_pad_ops,
> +};
> +
> +// read out device tree and probe driver
> +static int mt9m02x_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *did)
> +{
> +	int ret;
> +	struct mt9m02x_state *state;
> +	struct mt9m02x_platform_data pdatabuffer;
> +	struct mt9m02x_platform_data *pdata;
> +	struct v4l2_ctrl *ctrl;
> +
> +	dev_dbg(&client->dev, "start probing i2c device %s!\n", client->name);
> +
> +	if (client->dev.of_node) {
> +		if (of_property_read_u32(client->dev.of_node,
> +					 "input-clock-frequency",
> +					 &pdatabuffer.ext_freq)) {
> +			dev_err(&client->dev,
> +				"input-clock-frequency property missing");
> +			return -EINVAL;
> +		}
> +		if (of_property_read_u32(client->dev.of_node,
> +					 "pixel-clock-frequency",
> +					 &pdatabuffer.pix_clock)) {
> +			dev_err(&client->dev,
> +				"pixel-clock-frequency property missing");
> +			return -EINVAL;
> +		}
> +		pdata = &pdatabuffer;
> +	} else {
> +		pdata = client->dev.platform_data;
> +		if (!pdata) {
> +			dev_err(&client->dev, "No platform data found.");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->client = client;
> +	state->model = (const void *)did->driver_data;
> +	state->pll.ext_clock = pdata->ext_freq;
> +	dev_dbg(&client->dev, "ext_clock = %d\n", state->pll.ext_clock);
> +	state->pll.pix_clock = pdata->pix_clock;
> +	dev_dbg(&client->dev, "pix_clock = %d\n", state->pll.pix_clock);
> +
> +	state->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(state->reset_gpio))
> +		return PTR_ERR(state->reset_gpio);
> +	state->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(state->standby_gpio))
> +		return PTR_ERR(state->standby_gpio);
> +
> +	ret = init_image_sensor(state);
> +	if (ret) {
> +		dev_err(&client->dev, "init image sensor failed!\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(&client->dev, "initialization succeeded!\n");
> +
> +	v4l2_ctrl_handler_init(&state->ctrls,
> +			       state->model->chip == &chip_mt9m024 ? 9 : 6);
> +	/* Monotone mapping of available gains to 0..N. */
> +	v4l2_ctrl_new_int_menu(&state->ctrls, &mt9m02x_ctrl_ops,
> +			       V4L2_CID_ISO_SENSITIVITY,
> +			       state->model->chip->again_menu_length - 1, 0,
> +			       state->model->chip->again_menu);
> +	state->digital_gain_ctrl = v4l2_ctrl_new_std(
> +		&state->ctrls, &mt9m02x_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +		state->model->chip->digital_gain_min,
> +		GENMASK(state->model->chip->digital_gain_bits - 1, 0) *
> +		BIT(state->model->chip->digital_gain_shift),
> +		BIT(state->model->chip->digital_gain_shift),
> +		max_t(s64, BIT(8), state->model->chip->digital_gain_min));
> +	state->mode_cluster.hflip = v4l2_ctrl_new_std(
> +		&state->ctrls, &mt9m02x_ctrl_ops, V4L2_CID_HFLIP,
> +		0, 1, 1, 1);
> +	state->mode_cluster.vflip = v4l2_ctrl_new_std(
> +		&state->ctrls, &mt9m02x_ctrl_ops, V4L2_CID_VFLIP,
> +		0, 1, 1, 1);
> +	ctrl = v4l2_ctrl_new_std(&state->ctrls, &mt9m02x_ctrl_ops,
> +				 V4L2_CID_PIXEL_RATE, state->pll.pix_clock,
> +				 state->pll.pix_clock, 1,
> +				 state->pll.pix_clock);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	state->exposure_ctrl = v4l2_ctrl_new_std(
> +		&state->ctrls,
> +		&mt9m02x_ctrl_ops,
> +		V4L2_CID_EXPOSURE_ABSOLUTE,
> +		/* Actual range is set later. */
> +		mt9m02x_exposure_coarse_to_100us(
> +			state, APT_COARSE_INTEGRATION_TIME_DEFAULT),
> +		mt9m02x_exposure_coarse_to_100us(
> +			state, APT_COARSE_INTEGRATION_TIME_DEFAULT),
> +		1,
> +		mt9m02x_exposure_coarse_to_100us(
> +			state, APT_COARSE_INTEGRATION_TIME_DEFAULT));
> +
> +	if (state->model->chip == &chip_mt9m024) {
> +		state->opmode_cluster.wdr = v4l2_ctrl_new_std(
> +			&state->ctrls, &mt9m02x_ctrl_ops,
> +			V4L2_CID_WIDE_DYNAMIC_RANGE, 0, 1, 1, 0);
> +		state->opmode_cluster.ratio_t1t2 = v4l2_ctrl_new_custom(
> +			&state->ctrls, &mt9m02x_hdr_ratio_t1t2_ctrl,
> +			NULL);
> +		state->opmode_cluster.ratio_t2t3 = v4l2_ctrl_new_custom(
> +			&state->ctrls, &mt9m02x_hdr_ratio_t2t3_ctrl,
> +			NULL);
> +	}
> +
> +	if (state->ctrls.error) {
> +		dev_err(&client->dev,
> +			"v4l2 control handler registration failed!\n");
> +		return state->ctrls.error;
> +	}
> +	v4l2_ctrl_cluster(2, &state->mode_cluster.hflip);
> +	if (state->model->chip == &chip_mt9m024)
> +		v4l2_ctrl_cluster(3, &state->opmode_cluster.wdr);
> +
> +	state->sd.ctrl_handler = &state->ctrls;
> +
> +	ret = v4l2_ctrl_handler_setup(&state->ctrls);
> +	if (ret) {
> +		dev_err(&client->dev, "v4l2_ctrl_handler_setup failed!\n");
> +		return ret;
> +	}
> +
> +	v4l2_ctrl_lock(state->exposure_ctrl);
> +	ret = mt9m02x_update_exposure_range(state);
> +	v4l2_ctrl_unlock(state->exposure_ctrl);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_i2c_subdev_init(&state->sd, client, &mt9m02x_v4l2_subdev_ops);
> +
> +	state->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +
> +	state->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	state->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&state->sd.entity, 1, &state->pad);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_async_register_subdev(&state->sd);
> +	if (ret) {
> +		dev_err(&client->dev, "v4l2_async_register_subdev failed!\n");
> +		goto error_entity;
> +	}
> +
> +	if (state->temp_value1 != state->temp_value2) {
> +		struct device *hwmon_dev;
> +		/* Ignore errors from hwmon device as this functionality is
> +		 * optional.
> +		 */
> +		hwmon_dev = devm_hwmon_device_register_with_info(
> +			&client->dev, client->name, state,
> +			&mt9m02x_hwmon_info, NULL);
> +		if (IS_ERR(hwmon_dev))
> +			dev_warn(&client->dev,
> +				 "adding hwmon device failed (%ld).",
> +				 PTR_ERR(hwmon_dev));
> +	}
> +
> +	dev_dbg(&client->dev, "probing i2c device %s successful.\n",
> +		client->name);

Please add runtime PM support. See e.g. drivers/media/i2c/ov8856.c for an
example.

> +	return 0;
> +error_entity:
> +	media_entity_cleanup(&state->sd.entity);
> +	return ret;
> +}
> +
> +static int mt9m02x_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct mt9m02x_state *state =
> +		container_of(subdev, struct mt9m02x_state, sd);
> +
> +	v4l2_device_unregister_subdev(subdev);
> +	media_entity_cleanup(&subdev->entity);
> +
> +	if (state->standby_gpio)
> +		gpiod_set_value_cansleep(state->standby_gpio, 1);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id mt9m02x_id[] = {

Could you use of_device_id table instead? I suppose you don't really need
platform data?

Please also add DT bindings, and see existing bindings as well. There are
quite a few in YAML format already.

> +	{ "ar0141cs", (kernel_ulong_t)&model_ar0141cs },
> +	{ "ar0141csm", (kernel_ulong_t)&model_ar0141csm },
> +	{ "mt9m024", (kernel_ulong_t)&model_mt9m024 },
> +	{ "mt9m024m", (kernel_ulong_t)&model_mt9m024m },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mt9m02x_id);
> +
> +static struct i2c_driver mt9m02x_driver = {
> +	.driver = {
> +		.name = "mt9m02x",
> +	},
> +	.probe = mt9m02x_probe,
> +	.remove = mt9m02x_remove,
> +	.id_table = mt9m02x_id,
> +};
> +
> +module_i2c_driver(mt9m02x_driver);
> +
> +MODULE_AUTHOR("Helmut Grohne <helmut.grohne@intenta.de>");
> +MODULE_DESCRIPTION("mt9m024/ar0141cs imager driver");
> +MODULE_LICENSE("GPL");

"GPL v2"

-- 
Kind regards,

Sakari Ailus
