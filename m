Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B6D2C5E47
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 00:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388630AbgKZXn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 18:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388584AbgKZXnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 18:43:55 -0500
X-Greylist: delayed 2318 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Nov 2020 15:43:54 PST
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89691C0613D4;
        Thu, 26 Nov 2020 15:43:54 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CF6BB634C24;
        Fri, 27 Nov 2020 01:43:06 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kiQup-0001vm-AF; Fri, 27 Nov 2020 01:43:07 +0200
Date:   Fri, 27 Nov 2020 01:43:07 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     kholk11@gmail.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: Add driver for the Sony Exmor-RS
 IMX300 camera sensor
Message-ID: <20201126234306.GH4351@valkosipuli.retiisi.org.uk>
References: <20201029172947.34315-1-kholk11@gmail.com>
 <20201029172947.34315-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029172947.34315-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi AngeloGioacchino,

Thanks for the patchset.

On Thu, Oct 29, 2020 at 06:29:46PM +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> This is a custom multi-aspect 25MegaPixels sensor from Sony,
> found in many Sony Xperia smartphones from various eras.
> 
> The camera assembly for this sensor usually (at least in Xperia
> phones) has a lens that does not cover the entire sensor area,
> which means that the real corners are blind and that, in many
> lighting conditions, some more pixels in the corners are very
> getting obscured (as no decent amount of light can get in)...
> so, the maximum resolution that can produce a good image is:
> - In 4:3 aspect ratio, 5520x4160 (23.0MP)
> - In 16:9 aspect ratio, 5984x3392 (20.3MP).
> 
> This sensor supports high frame rates (>=60FPS) when in binning
> mode and both RAW8 and RAW10 output modes.
> In this version of the driver, support has been provided for the
> following resolutions:
>     W x H     SZ   MAX_FPS  BINNING
> - 5520x4160 23.0MP   23       No
> - 5984x3392 20.3MP   26       No
> - 2992x1696  3.8MP   60       Yes
> - 1424x800   1.2MP   120      Yes
> 
> Note 1: The "standard" camera assy for IMX300 also contains an
> actuator (to focus the image), but this driver only manages the
> actual image sensor.
> 
> Note 2: The command tables for this sensor were reverse
> engineered from a downstream "userspace driver" that has been
> released in various versions on various Xperia smartphones.
> Register layout seems to be only vaguely similar to IMX219,
> which has a public datasheet from where some names for the
> figured out registers were taken and added to the driver:
> these names are probably not the right ones, but they surely
> represent the intended thing.

Can I ask you have you tested the driver?

> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/media/i2c/Kconfig  |   13 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx300.c | 3089 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 3103 insertions(+)
>  create mode 100644 drivers/media/i2c/imx300.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 878f66ef2719..032f45dfed16 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -801,6 +801,19 @@ config VIDEO_IMX290
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx290.
>  
> +config VIDEO_IMX300
> +	tristate "Sony IMX300 Exmor RS sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX300 Exmor RS multi-aspect sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx300.
> +
>  config VIDEO_IMX319
>  	tristate "Sony IMX319 sensor support"
>  	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index f0a77473979d..8a3e003dea45 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -117,6 +117,7 @@ obj-$(CONFIG_VIDEO_IMX219)	+= imx219.o
>  obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
>  obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
>  obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
> +obj-$(CONFIG_VIDEO_IMX300)	+= imx300.o
>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> diff --git a/drivers/media/i2c/imx300.c b/drivers/media/i2c/imx300.c
> new file mode 100644
> index 000000000000..47de5fa3329c
> --- /dev/null
> +++ b/drivers/media/i2c/imx300.c
> @@ -0,0 +1,3089 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * A V4L2 driver for Sony IMX300 Exmor RS multi-aspect image sensors.
> + * Copyright (C) 2020, AngeloGioacchino Del Regno <kholk11@gmail.com>
> + *
> + * Based on Sony imx219 camera driver
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +#include <asm/unaligned.h>
> +
> +#define IMX300_REG_VALUE_08BIT		1
> +#define IMX300_REG_VALUE_16BIT		2
> +
> +/*
> + * Supported external clock frequency is from (around) 6 to 26MHz
> + * but there is no information about how to configure this sensor
> + * for anything else but 24MHz, since there is no datasheet...
> + */
> +#define IMX300_XCLK_FREQ_24M		24000000
> +
> +/* Delay after XCLK/RESET during power up for sensor boot/stabilization */
> +#define IMX300_XCLK_STABLE_DELAY_US	10000
> +#define IMX300_XCLK_DELAY_RANGE_US	1000
> +#define IMX300_XCLR_MIN_DELAY_US	25000
> +#define IMX300_XCLR_DELAY_RANGE_US	1000
> +
> +/*
> + * Pixel rates: max resolution + max FPS uses high bw; low resolution
> + * can use low bw in order to save power and limit sensor heating
> + */
> +#define IMX300_HIGH_BW_PIXEL_RATE	624000000
> +#define IMX300_LOW_BW_PIXEL_RATE	384000000
> +#define IMX300_HIGH_BW_LINK_FREQ	780000000
> +#define IMX300_LOW_BW_LINK_FREQ		480000000
> +
> +/*
> + * About the Chip ID:
> + *
> + * IMX300 seems to be sort of flawed... scanning the registers reveals
> + * that there's no reg having the expected 0x300 ChipID, like literally
> + * all of the other Sony IMX sensors.
> + * There seem to be no meaningful values and, even during reverse
> + * engineering of three "userspace drivers" for this sensor, found on
> + * three different series of smartphones, there is no trace of any ChipID.
> + * These userspace drivers seem to be reading the Sensor ID at register
> + * 0x0016 and comparing it to zero: it looks like being a dummy and not
> + * reliable at all, since I imagine that *many* camera sensors may contain
> + * zero at that register address, but that's still better than nothing...

Have you checked what's at 0x0 (16 bits)?

> + *
> + * After all, if you don't have this camera sensor attached to your board,
> + * you shouldn't be adding it in your DT... :(
> + */
> +#define IMX300_REG_CHIP_ID		0x0016
> +#define IMX300_CHIP_ID			0x0
> +
> +#define IMX300_REG_MODE_SELECT		0x0100
> +#define IMX300_MODE_STANDBY		0x00
> +#define IMX300_MODE_STREAMING		0x01
> +
> +/* Orientation: changes bayer order */
> +#define IMX300_REG_ORIENTATION		0x0101
> +
> +/* SW Reset: set to 1 to reset. Gets automatically set back to 0. */
> +#define IMX300_REG_SW_RESET		0x0103
> +
> +/* Data format */
> +#define IMX300_REG_CSI_DATA_FORMAT_HI	0x0112
> +#define IMX300_REG_CSI_DATA_FORMAT_LO	0x0113
> +#define IMX300_CSI_DATA_FMT_8BIT	8
> +#define IMX300_CSI_DATA_FMT_10BIT	10
> +
> +/* Output Set-up */
> +#define IMX300_REG_CSI_LANE_MODE	0x0114
> +#define IMX300_CSI_LANE_MODE_2LANE	BIT(0)
> +#define IMX300_CSI_LANE_MODE_4LANE	(BIT(0) | BIT(1))
> +
> +/* EXCK: Min 6MHz, Max 27MHz */
> +#define IMX300_REG_EXCK_FREQ_MHZ	0x0136
> +
> +/* Exposure control */
> +#define IMX300_REG_EXPOSURE		0x0202
> +#define IMX300_EXPOSURE_MIN		4
> +#define IMX300_EXPOSURE_STEP		1
> +#define IMX300_EXPOSURE_DEFAULT		3556
> +#define IMX300_EXPOSURE_MAX		65535
> +
> +/* Analog gain control */
> +#define IMX300_REG_ANALOG_GAIN		0x0204
> +#define IMX300_ANA_GAIN_MIN		0
> +#define IMX300_ANA_GAIN_MAX		0x1fff
> +#define IMX300_ANA_GAIN_STEP		1
> +#define IMX300_ANA_GAIN_DEFAULT		0x0
> +
> +/* Digital gain control */
> +#define IMX300_REG_GR_DIGITAL_GAIN	0x020e
> +#define IMX300_REG_R_DIGITAL_GAIN	0x0210
> +#define IMX300_REG_B_DIGITAL_GAIN	0x0212
> +#define IMX300_REG_GB_DIGITAL_GAIN	0x0214
> +#define IMX300_DGTL_GAIN_MIN		0
> +#define IMX300_DGTL_GAIN_MAX		4095
> +#define IMX300_DGTL_GAIN_DEFAULT	1024
> +#define IMX300_DGTL_GAIN_STEP		1
> +
> +/* Clock generator */
> +#define IMX300_REG_OP_PIX_CLK_DIV	0x0309
> +#define IMX300_REG_OP_SYS_CLK_DIV	0x030b
> +
> +/* V_TIMING internal */
> +#define IMX300_REG_VTS			0x0340
> +#define IMX300_VTS_MIN			41
> +#define IMX300_VTS_MAX			(131071 - IMX300_VTS_MIN)
> +
> +/* Line Length */
> +#define IMX300_REG_LINE_LEN_PCK		0x0342
> +#define IMX300_LINELEN_MIN		7000
> +#define IMX300_LINELEN_MAX		8230
> +#define IMX300_LINELEN_STEP		1
> +#define IMX300_LINELEN_DEFAULT		7096
> +
> +/* Output configuration */
> +#define IMX300_REG_X_ADDR_START		0x0344
> +#define IMX300_REG_Y_ADDR_START		0x0346
> +#define IMX300_REG_X_ADDR_END		0x0348
> +#define IMX300_REG_Y_ADDR_END		0x034a
> +#define IMX300_REG_X_OUTPUT_SIZE	0x034c
> +#define IMX300_REG_Y_OUTPUT_SIZE	0x034e
> +#define IMX300_REG_X_ODD_INC		0x0383
> +#define IMX300_REG_Y_ODD_INC		0x0387
> +
> +/* HBLANK control - read only */
> +#define IMX300_PPL_DEFAULT		8224
> +
> +/* Test Pattern Control */
> +#define IMX300_REG_TEST_PATTERN		0x0600
> +#define IMX300_REG_TEST_PATTERN_WIDTH	0x0624
> +#define IMX300_REG_TEST_PATTERN_HEIGHT	0x0626
> +#define IMX300_TEST_PATTERN_DISABLE	0
> +#define IMX300_TEST_PATTERN_SOLID_COLOR	1
> +#define IMX300_TEST_PATTERN_COLOR_BARS	2
> +#define IMX300_TEST_PATTERN_GREY_COLOR	3
> +#define IMX300_TEST_PATTERN_PN9		4
> +
> +/* Test pattern colour components */
> +#define IMX300_REG_TESTP_RED		0x0602
> +#define IMX300_REG_TESTP_GREENR		0x0604
> +#define IMX300_REG_TESTP_BLUE		0x0606
> +#define IMX300_REG_TESTP_GREENB		0x0608
> +#define IMX300_TESTP_COLOUR_MIN		0
> +#define IMX300_TESTP_COLOUR_MAX		0x03ff
> +#define IMX300_TESTP_COLOUR_STEP	1
> +#define IMX300_TESTP_RED_DEFAULT	IMX300_TESTP_COLOUR_MAX
> +#define IMX300_TESTP_GREENR_DEFAULT	0
> +#define IMX300_TESTP_BLUE_DEFAULT	0
> +#define IMX300_TESTP_GREENB_DEFAULT	0
> +
> +/* Binning */
> +#define IMX300_REG_BINNING_EN		0x0900
> +#define IMX300_REG_BINNING_TYPE		0x0902
> +
> +/*
> + * ** IMX300 native and active pixel array size **
> + *
> + * Being this a multi-aspect sensor, the following native W/H apply, but
> + * beware: the module assembly usually has a (round) lens that is shadowing
> + * or covering the corners of the (square) image sensor, so the maximum
> + * output resolution must be lower than the maximum sensor resolution
> + * otherwise we get something like a view from a porthole... :)
> + *
> + * For 4:3  aspect ratio, max is: 5984x4140 (25MP)
> + * For 16:9 aspect ratio, max is: 5984x3392 (20.3MP)
> + */
> +#define IMX300_NATIVE_WIDTH		5980U
> +#define IMX300_NATIVE_HEIGHT		4140U
> +#define IMX300_PIXEL_ARRAY_LEFT		0U
> +#define IMX300_PIXEL_ARRAY_TOP		0U
> +#define IMX300_PIXEL_ARRAY_WIDTH	5520U
> +#define IMX300_PIXEL_ARRAY_HEIGHT	4160U
> +
> +struct imx300_reg {
> +	u16 address;
> +	u16 val;
> +	u8 reg_len;
> +};
> +
> +struct imx300_reg_list {
> +	unsigned int num_of_regs;
> +	const struct imx300_reg *regs;
> +};
> +
> +/* Mode : resolution and related config&values */
> +struct imx300_mode {
> +	/* Frame width */
> +	unsigned int width;
> +	/* Frame height */
> +	unsigned int height;
> +	/* Maximum achievable FPS */
> +	unsigned int max_fps;
> +	/* Needs high data rate */
> +	bool high_bw;
> +	/* Needs binning setup */
> +	bool binned;
> +
> +	/* Analog crop rectangle. */
> +	struct v4l2_rect crop;
> +
> +	/* V-timing default */
> +	unsigned int vts_def;
> +
> +	/* Default register values */
> +	struct imx300_reg_list reg_list;
> +};
> +
> +/*
> + * I have no idea what this very long initialization sequence is for...
> + * but missing writes in this makes the sensor to output corrupted
> + * frames or nothing at all...
> + */
> +static const struct imx300_reg init_sequence[] = {
> +	{ IMX300_REG_EXCK_FREQ_MHZ, 24, IMX300_REG_VALUE_08BIT },
> +	{ 0x0137, 0x00, IMX300_REG_VALUE_08BIT },

This is part of the same 16-bit register.

> +	{ 0x0101, 0x03, IMX300_REG_VALUE_08BIT },

This enables horizontal and vertical flip. You could use the same macro for
the register address as in the common list.

What's the difference between the initial and common registers?

> +	{ 0x0138, 0x01, IMX300_REG_VALUE_08BIT },

And this one enables the temperature sensor.

> +	{ 0x3154, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3155, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x3156, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3157, 0x66, IMX300_REG_VALUE_08BIT },
> +	{ 0x305d, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b0, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3208, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3210, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x406c, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x406d, 0x39, IMX300_REG_VALUE_08BIT },
> +	{ 0x430d, 0xaa, IMX300_REG_VALUE_08BIT },
> +	{ 0x4313, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x431e, 0x88, IMX300_REG_VALUE_08BIT },
> +	{ 0x431f, 0x8f, IMX300_REG_VALUE_08BIT },
> +	{ 0x4321, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x4324, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x4325, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x4326, 0x28, IMX300_REG_VALUE_08BIT },
> +	{ 0x4328, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0x4329, 0x5b, IMX300_REG_VALUE_08BIT },
> +	{ 0x432c, 0x06, IMX300_REG_VALUE_08BIT },
> +	{ 0x432d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x432e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x4554, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x4811, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4819, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x481d, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x481f, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4838, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x4839, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x483a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x483b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x4871, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4877, 0x9b, IMX300_REG_VALUE_08BIT },
> +	{ 0x487d, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4883, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4891, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4893, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x48ad, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x48af, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x48b1, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x48b5, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x48bb, 0x9b, IMX300_REG_VALUE_08BIT },
> +	{ 0x48c1, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x48c7, 0x9b, IMX300_REG_VALUE_08BIT },
> +	{ 0x48c9, 0x95, IMX300_REG_VALUE_08BIT },
> +	{ 0x48cb, 0x94, IMX300_REG_VALUE_08BIT },
> +	{ 0x4bd7, 0x24, IMX300_REG_VALUE_08BIT },
> +	{ 0x48dd, 0x95, IMX300_REG_VALUE_08BIT },
> +	{ 0x48e5, 0x97, IMX300_REG_VALUE_08BIT },
> +	{ 0x49d1, 0x9a, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a00, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a01, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a02, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a03, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a1d, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a1f, 0x9b, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a27, 0x97, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a29, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a2f, 0x97, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a4d, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a4f, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a51, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a53, 0x99, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a6d, 0x9e, IMX300_REG_VALUE_08BIT },
> +	{ 0x4a6f, 0x9d, IMX300_REG_VALUE_08BIT },
> +	{ 0x4be7, 0x24, IMX300_REG_VALUE_08BIT },
> +	{ 0x4c07, 0x24, IMX300_REG_VALUE_08BIT },
> +	{ 0x4c17, 0x24, IMX300_REG_VALUE_08BIT },
> +	{ 0x4c97, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x4ca7, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x4cc7, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x4cd7, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x4d57, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x4d67, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x4d87, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x4d97, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x4db7, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x4dc7, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x4de7, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x4df7, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x4e15, 0x43, IMX300_REG_VALUE_08BIT },
> +	{ 0x4e25, 0x43, IMX300_REG_VALUE_08BIT },
> +	{ 0x4e45, 0x43, IMX300_REG_VALUE_08BIT },
> +	{ 0x4e55, 0x43, IMX300_REG_VALUE_08BIT },
> +	{ 0x4f40, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x4f42, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x4f48, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x4f4e, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x505c, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x505d, 0x36, IMX300_REG_VALUE_08BIT },
> +	{ 0x505f, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x5069, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x5e6a, 0xfe, IMX300_REG_VALUE_08BIT },
> +	{ 0x5e70, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6153, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6156, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x656a, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x656b, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x7300, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9006, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0xb000, 0x6e, IMX300_REG_VALUE_08BIT },
> +	{ 0xb001, 0xfd, IMX300_REG_VALUE_08BIT },
> +	{ 0xb002, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0xb003, 0x2a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb004, 0x83, IMX300_REG_VALUE_08BIT },
> +	{ 0xb005, 0x41, IMX300_REG_VALUE_08BIT },
> +	{ 0xb006, 0x83, IMX300_REG_VALUE_08BIT },
> +	{ 0xb007, 0x43, IMX300_REG_VALUE_08BIT },
> +	{ 0xb008, 0x82, IMX300_REG_VALUE_08BIT },
> +	{ 0xb009, 0x49, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00a, 0x82, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00b, 0x4a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00c, 0x6e, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00d, 0x93, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00e, 0x82, IMX300_REG_VALUE_08BIT },
> +	{ 0xb00f, 0x41, IMX300_REG_VALUE_08BIT },
> +	{ 0xb010, 0x82, IMX300_REG_VALUE_08BIT },
> +	{ 0xb011, 0x4b, IMX300_REG_VALUE_08BIT },
> +	{ 0xb100, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0xb101, 0x5e, IMX300_REG_VALUE_08BIT },
> +	{ 0xb102, 0x80, IMX300_REG_VALUE_08BIT },
> +	{ 0xb103, 0x9a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb104, 0xaf, IMX300_REG_VALUE_08BIT },
> +	{ 0xb105, 0xc0, IMX300_REG_VALUE_08BIT },
> +	{ 0xb106, 0xcd, IMX300_REG_VALUE_08BIT },
> +	{ 0xb107, 0xd7, IMX300_REG_VALUE_08BIT },
> +	{ 0xb123, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xb125, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xb127, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xb129, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xb12b, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xb136, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb137, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb138, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb139, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13a, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13b, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13c, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13d, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13e, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb13f, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb140, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xb141, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xb142, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xb143, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb144, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb145, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb146, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb147, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb148, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb149, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14a, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14b, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14c, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14d, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14e, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb14f, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb150, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb151, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb152, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb153, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xb154, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0xb155, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0xb156, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0xb157, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb158, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb159, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb15a, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb15b, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb15c, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb15d, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0xb210, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x313c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3198, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x31a0, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31a1, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31a2, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31a3, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x31a8, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x3290, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d20, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d22, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d26, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6d27, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6e07, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x6e35, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6e55, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6e7c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6e93, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6efb, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x7c68, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x845c, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x8469, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9257, 0x96, IMX300_REG_VALUE_08BIT },
> +	{ 0x9258, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x933a, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x933b, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x933d, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x933e, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x933f, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x934b, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x934c, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9356, 0x8c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9357, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9358, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9359, 0x8c, IMX300_REG_VALUE_08BIT },
> +	{ 0x935a, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x935b, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9360, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9361, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9362, 0x8c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9363, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9364, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9365, 0x8c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9366, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9367, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x940d, 0x07, IMX300_REG_VALUE_08BIT },
> +	{ 0x940e, 0x07, IMX300_REG_VALUE_08BIT },
> +	{ 0x9414, 0x06, IMX300_REG_VALUE_08BIT },
> +	{ 0x942b, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x942c, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x942d, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x942e, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x942f, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9430, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9431, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9432, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9433, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9434, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9435, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9436, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9437, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9438, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9439, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x943b, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x943d, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x943f, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9441, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9443, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9445, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9447, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9449, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x944b, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x944d, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x944f, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9451, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9452, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9454, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9456, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9457, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9458, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9459, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x945a, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x945b, 0x07, IMX300_REG_VALUE_08BIT },
> +	{ 0x945c, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x945d, 0x07, IMX300_REG_VALUE_08BIT },
> +	{ 0x945e, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x945f, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9460, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9461, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9462, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9463, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9464, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9465, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9466, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x947c, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x947d, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9480, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9481, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9503, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x9504, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x9505, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x9506, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9507, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9508, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9526, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9527, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9528, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9619, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x961b, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x961d, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x961f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9621, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9623, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9625, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9627, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9629, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x962b, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x962d, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x962f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9719, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x971b, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x971d, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x971f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9721, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9723, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9725, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9727, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9729, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x972b, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x972d, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x972f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9901, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9903, 0x23, IMX300_REG_VALUE_08BIT },
> +	{ 0x9905, 0x23, IMX300_REG_VALUE_08BIT },
> +	{ 0x9906, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9907, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9908, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9909, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x990a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x990b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x990d, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x990f, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9911, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9913, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9915, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9917, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9919, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x991b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x991d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x991f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9921, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9923, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9925, 0x23, IMX300_REG_VALUE_08BIT },
> +	{ 0x9927, 0x23, IMX300_REG_VALUE_08BIT },
> +	{ 0x9929, 0x23, IMX300_REG_VALUE_08BIT },
> +	{ 0x992b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x992d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x992f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9931, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9933, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9935, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9937, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9939, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x993b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9943, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9945, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9947, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9949, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x994b, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x994d, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x994f, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9951, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9953, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9955, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9957, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x9959, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x995a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x995b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x995c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x996b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x996d, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x996f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9971, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0x9973, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0x9975, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9976, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9979, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x997a, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x997b, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9981, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9983, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9985, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a4, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a5, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a6, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a7, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a8, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99a9, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99aa, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99ab, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99ac, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x99ad, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x99ae, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x99af, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b0, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b1, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b2, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b3, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b4, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x99b5, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x99bb, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99bd, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99bf, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c0, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c1, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c2, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c6, 0x3c, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c7, 0x3c, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c8, 0x3c, IMX300_REG_VALUE_08BIT },
> +	{ 0x99c9, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x99ca, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x99cb, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a01, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a07, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a09, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a0b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a0d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a0f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a11, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a13, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a15, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a17, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a19, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a1b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a1d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a1f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a25, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a27, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a29, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a2b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a2d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a2f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a31, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a33, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a35, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a37, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a39, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a3b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a3d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a3f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a41, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a4f, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a51, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a53, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a55, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a57, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a59, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a5a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a5b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a5c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a6b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a6d, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a6f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a71, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a73, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a75, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a79, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a7a, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a7b, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a81, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a83, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9a85, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa4, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa5, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa6, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa7, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa8, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aa9, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aaa, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aab, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aac, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aad, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aae, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aaf, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab0, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab1, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab2, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab3, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab4, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab5, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab6, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab7, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ab8, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9abb, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9abd, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9abf, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac0, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac1, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac2, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac6, 0x2d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac7, 0x2d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac8, 0x2d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ac9, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9aca, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9acb, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b01, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b07, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b08, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b09, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b0a, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b0b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b0d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b0f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b11, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b13, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b15, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b17, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b19, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b1b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b1d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b1f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b25, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b27, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b29, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b2b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b2d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b2f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b31, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b33, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b35, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b37, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b39, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b3b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b43, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b45, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b47, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b49, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b4b, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b4d, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b4f, 0x2d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b51, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b53, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b55, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b57, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b59, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b5a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b5b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b5c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b5d, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b5e, 0x0e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b60, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b61, 0x0e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b6b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b6d, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b6f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b71, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b73, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b75, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b76, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b79, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b7a, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b7b, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b81, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b83, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9b85, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb0, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb1, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb2, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb3, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb4, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bb5, 0x30, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bbb, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bbd, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bbf, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc0, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc1, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc2, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc6, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc7, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc8, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bc9, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bca, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bcb, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bcc, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bcd, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9bce, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c01, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c07, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c09, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c0b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c0d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c0f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c11, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c13, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c15, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c17, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c19, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c1b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c1d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c1f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c25, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c27, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c29, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c2b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c2d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c2f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c31, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c33, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c35, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c37, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c39, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c3b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c3d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c3f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c41, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c4f, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c51, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c53, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c55, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c57, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c59, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c5a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c5b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c5c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c6b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c6d, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c6f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c71, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c73, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c75, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c79, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c7a, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c7b, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c81, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c83, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c85, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c87, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c89, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0x9c8b, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca4, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca5, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca6, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca7, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ca9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9caa, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cab, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cac, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cad, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cae, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9caf, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb0, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb1, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb2, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb3, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb4, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cb5, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cbb, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cbd, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cbf, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc0, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc1, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc2, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc6, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc7, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc8, 0x18, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cc9, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9cca, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ccb, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d01, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d07, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d09, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d0b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d0d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d0f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d11, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d13, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d15, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d17, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d19, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d1b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d1d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d1f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d25, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d27, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d29, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d2b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d2d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d2f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d31, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d33, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d35, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d37, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d39, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d3b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d3d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d3f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d41, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d4f, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d50, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d51, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d53, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d55, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d57, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d59, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d5b, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d5d, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d5f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d61, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d63, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d65, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d67, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d69, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d6b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d6d, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d6f, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d71, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d73, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d75, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d77, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d79, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d7b, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d7d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d7f, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d81, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d83, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d85, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d87, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d89, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d8b, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d8d, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d8f, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d91, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d93, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d95, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d97, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d99, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d9b, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d9d, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9d9f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9da1, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e01, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e07, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e09, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e0b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e0d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e0f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e11, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e13, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e15, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e17, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e19, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e1b, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e1d, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e1f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e21, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e23, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e25, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e27, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e29, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e2b, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e2d, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e2f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e31, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e33, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e35, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e37, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e39, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e3b, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e3d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e3f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e41, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e4f, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e51, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e53, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e55, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e57, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e59, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e5b, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e5d, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e5f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e61, 0x35, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e63, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e65, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e67, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e69, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e6b, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e6d, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e6f, 0x1b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e71, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e73, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e75, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e77, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e79, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e7b, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e7d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e7f, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e81, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e83, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e85, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e87, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e89, 0x64, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e8b, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e8d, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e8f, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e91, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e93, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e95, 0x65, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e97, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e99, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e9b, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e9d, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9e9f, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9ea1, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f01, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f05, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f07, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f09, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f0b, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f0d, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f0f, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f11, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f13, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f15, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f17, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f19, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f1b, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f1d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f1f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f21, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f23, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f25, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f27, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f29, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f2b, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f2d, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f2f, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f31, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f33, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f35, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f37, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f39, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f3b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f3c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f3d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f3e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f41, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f43, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f45, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f47, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f49, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f4b, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f4d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f4f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f51, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f53, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f55, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f57, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f59, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f5b, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f5d, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f5f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f61, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f63, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f64, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f65, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f66, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6b, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6d, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f6f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f77, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f78, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f79, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f7b, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f7d, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f7e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f7f, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f81, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f83, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f85, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f87, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f89, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f8b, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f8d, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x9f8f, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fa6, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fa7, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fa8, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fa9, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9faa, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fab, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fac, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fad, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fae, 0x3f, IMX300_REG_VALUE_08BIT },
> +	{ 0x9faf, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fb0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x9fb1, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa001, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa003, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa005, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa007, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa009, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa00b, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa00d, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0xa00f, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa011, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa013, 0x2f, IMX300_REG_VALUE_08BIT },
> +	{ 0xa015, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa017, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa019, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa01b, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa01d, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa01f, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa021, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa023, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0xa025, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0xa027, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0xa029, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0xa02b, 0x6b, IMX300_REG_VALUE_08BIT },
> +	{ 0xa02d, 0x7c, IMX300_REG_VALUE_08BIT },
> +	{ 0xa02f, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0xa031, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa033, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa035, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa037, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa039, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa03b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa03c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa03d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa03e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa041, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa043, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa045, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa047, 0xc8, IMX300_REG_VALUE_08BIT },
> +	{ 0xa049, 0x32, IMX300_REG_VALUE_08BIT },
> +	{ 0xa04b, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xa04d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa04f, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa051, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa053, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa055, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa057, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0xa059, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0xa05b, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xa05d, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xa05f, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0xa061, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xa063, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0xa064, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0xa065, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0xa066, 0xe0, IMX300_REG_VALUE_08BIT },
> +	{ 0xa067, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0xa068, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0xa069, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0xa06b, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa06d, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa06f, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xa071, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0xa073, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0xa075, 0x48, IMX300_REG_VALUE_08BIT },
> +	{ 0xa077, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0xa079, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0xa07b, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0xa07d, 0x42, IMX300_REG_VALUE_08BIT },
> +	{ 0xa07f, 0x0b, IMX300_REG_VALUE_08BIT },
> +	{ 0xa081, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0xa083, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa085, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0xa087, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0xa089, 0x5a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa08b, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0xa08d, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0xa08f, 0xa0, IMX300_REG_VALUE_08BIT },
> +	{ 0xa091, 0x3a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa093, 0x3a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa095, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa097, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa099, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0a9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0aa, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0ab, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0af, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0b0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xa0b1, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xf800, 0x5c, IMX300_REG_VALUE_08BIT },
> +	{ 0xf801, 0x5c, IMX300_REG_VALUE_08BIT },
> +	{ 0xf802, 0x92, IMX300_REG_VALUE_08BIT },
> +	{ 0xf803, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xf804, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xf805, 0xbc, IMX300_REG_VALUE_08BIT },
> +	{ 0xf806, 0x22, IMX300_REG_VALUE_08BIT },
> +	{ 0xf807, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xf808, 0x1c, IMX300_REG_VALUE_08BIT },
> +	{ 0xf809, 0x80, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80a, 0xfa, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80b, 0x21, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80c, 0x55, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80d, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80e, 0xba, IMX300_REG_VALUE_08BIT },
> +	{ 0xf80f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0xf810, 0x81, IMX300_REG_VALUE_08BIT },
> +	{ 0xf811, 0xd1, IMX300_REG_VALUE_08BIT },
> +	{ 0xf812, 0x31, IMX300_REG_VALUE_08BIT },
> +	{ 0xf813, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x5869, 0x01, IMX300_REG_VALUE_08BIT },
> +};
> +
> +/*
> + * Magic registers sequence, common for all of the specified resolutions.
> + *
> + * Note: Binaries seem to send data to 0x0220, 0x0221 when enabling HDR mode...
> + */
> +static const struct imx300_reg mode_common_regs[] = {
> +	{ IMX300_REG_ORIENTATION, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_CSI_DATA_FORMAT_HI, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_CSI_DATA_FORMAT_LO, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_CSI_LANE_MODE, IMX300_CSI_LANE_MODE_4LANE,
> +	  IMX300_REG_VALUE_08BIT },
> +	{ 0x0221, 0x11, IMX300_REG_VALUE_08BIT },
> +	{ 0x0381, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0383, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0385, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0387, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0401, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0404, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0405, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0408, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0409, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040c, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x040d, 0x90, IMX300_REG_VALUE_08BIT },
> +	{ 0x040e, 0x10, IMX300_REG_VALUE_08BIT },
> +	{ 0x040f, 0x40, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e4, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e5, 0x90, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e6, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e7, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e8, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x30e9, 0x90, IMX300_REG_VALUE_08BIT },
> +	{ 0x30ea, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x30eb, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x30ec, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x30ed, 0x90, IMX300_REG_VALUE_08BIT },
> +	{ 0x30ee, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x30ef, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x30f4, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x30f5, 0x90, IMX300_REG_VALUE_08BIT },
> +	{ 0x30f6, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x30f7, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3294, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3295, 0xe8, IMX300_REG_VALUE_08BIT },
> +	{ 0x3296, 0x16, IMX300_REG_VALUE_08BIT },
> +	{ 0x3297, 0x77, IMX300_REG_VALUE_08BIT },
> +	{ 0x0210, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0211, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0212, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0213, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0214, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0215, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0216, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0217, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3220, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3006, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3007, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e0, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e1, 0xff, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e4, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x4301, 0x94, IMX300_REG_VALUE_08BIT },
> +	{ 0x4302, 0x15, IMX300_REG_VALUE_08BIT },
> +	{ 0x4303, 0x44, IMX300_REG_VALUE_08BIT },
> +	{ 0x4304, 0x09, IMX300_REG_VALUE_08BIT },
> +	{ 0x4305, 0x07, IMX300_REG_VALUE_08BIT },
> +	{ 0x4306, 0x87, IMX300_REG_VALUE_08BIT },
> +	{ 0x4307, 0x88, IMX300_REG_VALUE_08BIT },
> +	{ 0x4308, 0xba, IMX300_REG_VALUE_08BIT },
> +	{ 0x4309, 0x21, IMX300_REG_VALUE_08BIT },
> +	{ 0x4f7e, 0x12, IMX300_REG_VALUE_08BIT },
> +	{ 0x0220, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x0222, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0224, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0225, 0xf4, IMX300_REG_VALUE_08BIT },
> +	{ 0x3000, 0x54, IMX300_REG_VALUE_08BIT },
> +	{ 0x3001, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0600, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0601, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3022, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b05, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b06, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3018, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3019, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x301a, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3025, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3130, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3004, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x30a2, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b00, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3250, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3251, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3011, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3013, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3129, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3125, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3127, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3140, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3141, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3142, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x314f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b8e, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b8f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b90, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b91, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b92, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b93, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b94, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x0b95, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3121, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3123, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b0, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3158, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3159, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x315f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3160, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3161, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3162, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3163, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3164, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3165, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3166, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3167, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3168, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3169, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x316f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3170, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3171, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3172, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3173, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3174, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3175, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3176, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3177, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3178, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3179, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317b, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317c, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317d, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x317f, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3180, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3181, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3182, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3183, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3184, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3185, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3186, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3187, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b4, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b5, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b6, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b7, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31b9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31ba, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31bb, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3291, 0x01, IMX300_REG_VALUE_08BIT },
> +};
> +
> +/* Data rate configuration: HIGH (780MHz) */
> +static const struct imx300_reg mipi_data_rate_1560mbps[] = {
> +	{ 0x0301, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x0303, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x0305, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x0306, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0307, 0xbe, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_PIX_CLK_DIV, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_SYS_CLK_DIV, 1, IMX300_REG_VALUE_08BIT },
> +	{ 0x030d, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x030e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x030f, 0xbb, IMX300_REG_VALUE_08BIT },
> +};
> +
> +/* Data rate configuration: LOW (480MHz) */
> +static const struct imx300_reg mipi_data_rate_960mbps[] = {
> +	{ 0x0301, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x0303, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x0305, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x0306, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0307, 0xbe, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_PIX_CLK_DIV, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_SYS_CLK_DIV, 1, IMX300_REG_VALUE_08BIT },
> +	{ 0x030d, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x030e, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x030f, 0x4b, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const struct imx300_reg binning_mode_off[] = {
> +	{ IMX300_REG_BINNING_EN, 0, IMX300_REG_VALUE_08BIT },
> +	{ 0x0901, 0x11, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_BINNING_TYPE, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a00, 0x19, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a01, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a02, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a03, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a04, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a05, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a06, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a07, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a08, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc2, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc3, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc4, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc7, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dca, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dcb, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dcc, 0x01, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const struct imx300_reg binning_mode_2x2[] = {
> +	{ IMX300_REG_BINNING_EN, 1, IMX300_REG_VALUE_08BIT },
> +	{ 0x0901, 0x22, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_BINNING_TYPE, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a00, 0x19, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a01, 0x0a, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a02, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a03, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a04, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a05, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a06, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a07, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3a08, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc2, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc3, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc4, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dc7, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dca, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dcb, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x6dcc, 0x01, IMX300_REG_VALUE_08BIT },
> +};
> +
> +
> +/* Output resolution configuration */
> +static const struct imx300_reg mode_5520x4160[] = {
> +	{ IMX300_REG_EXPOSURE, 4230, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_ANALOG_GAIN, 0, IMX300_REG_VALUE_16BIT },
> +
> +	{ IMX300_REG_VTS, 4250, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_LINE_LEN_PCK, 8008, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_START, 232, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_START, 0, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_END, 5751, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_END, 4159, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_OUTPUT_SIZE, 5520, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_OUTPUT_SIZE, 4160, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x0408, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0409, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040b, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x040c, 5520, IMX300_REG_VALUE_16BIT },
> +	{ 0x040e, 4160, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x3150, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3151, 0x49, IMX300_REG_VALUE_08BIT },
> +	{ 0x3152, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3153, 0x20, IMX300_REG_VALUE_08BIT },
> +	{ 0x3154, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x3155, 0x9f, IMX300_REG_VALUE_08BIT },
> +	{ 0x3156, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x3157, 0xaa, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x31e8, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31ec, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f0, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f1, 0xbc, IMX300_REG_VALUE_08BIT },
> +	{ 0x3221, 0x01, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x7ea0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea3, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea5, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea6, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea9, 0x78, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eac, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb3, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb4, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb5, 0x00, IMX300_REG_VALUE_08BIT },
> +};
> +
> +
> +static const struct imx300_reg mode_5984x3392[] = {
> +	{ IMX300_REG_EXPOSURE, 3556, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_ANALOG_GAIN, 0, IMX300_REG_VALUE_16BIT },
> +
> +	{ IMX300_REG_VTS, 3576, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_LINE_LEN_PCK, 8224, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_START, 0, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_START, 384, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_END, 5751, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_END, 3775, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_OUTPUT_SIZE, 5984, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_OUTPUT_SIZE, 3392, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x0408, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0409, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040b, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x040c, 5984, IMX300_REG_VALUE_16BIT },
> +	{ 0x040e, 3392, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x3150, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3151, 0x50, IMX300_REG_VALUE_08BIT },
> +	{ 0x3152, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3153, 0x1a, IMX300_REG_VALUE_08BIT },
> +	{ 0x3154, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x3155, 0xd8, IMX300_REG_VALUE_08BIT },
> +	{ 0x3156, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x3157, 0x2c, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x31e8, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31ec, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f0, 0x03, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f1, 0x84, IMX300_REG_VALUE_08BIT },
> +	{ 0x3221, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x7ea0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea3, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea5, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea6, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea9, 0x78, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eac, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb3, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb4, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb5, 0x00, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const struct imx300_reg mode_2992x1696[] = {
> +	{ IMX300_REG_EXPOSURE, 3566, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_ANALOG_GAIN, 0, IMX300_REG_VALUE_16BIT },
> +
> +	{ IMX300_REG_VTS, 1772, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_LINE_LEN_PCK, 7064, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_START, 0, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_START, 384, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_END, 5983, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_END, 3775, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_OUTPUT_SIZE, 2992, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_OUTPUT_SIZE, 1696, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x0408, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0409, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040b, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x040c, 2992, IMX300_REG_VALUE_16BIT },
> +	{ 0x040e, 1696, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x3150, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3151, 0x28, IMX300_REG_VALUE_08BIT },
> +	{ 0x3152, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3153, 0x0d, IMX300_REG_VALUE_08BIT },
> +	{ 0x3154, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3155, 0x6c, IMX300_REG_VALUE_08BIT },
> +	{ 0x3156, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x3157, 0x16, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x31e8, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e9, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31ec, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f1, 0x14, IMX300_REG_VALUE_08BIT },
> +	{ 0x3221, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x7ea0, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea3, 0x05, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea5, 0x1e, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea6, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eac, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb3, 0x04, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb4, 0x0c, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb5, 0x10, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const struct imx300_reg mode_1424x800[] = {
> +	{ IMX300_REG_EXPOSURE, 3692, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_ANALOG_GAIN, 0, IMX300_REG_VALUE_16BIT },
> +
> +	{ IMX300_REG_VTS, 3712, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_LINE_LEN_PCK, 7064, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_START, 1568, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_START, 1280, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_ADDR_END, 4415, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_ADDR_END, 2879, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_X_OUTPUT_SIZE, 1424, IMX300_REG_VALUE_16BIT },
> +	{ IMX300_REG_Y_OUTPUT_SIZE, 800, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x0408, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x0409, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040a, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x040b, 0x00, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x040c, 1424, IMX300_REG_VALUE_16BIT },
> +	{ 0x040e, 800, IMX300_REG_VALUE_16BIT },
> +
> +	{ 0x3150, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3151, 0x13, IMX300_REG_VALUE_08BIT },
> +	{ 0x3152, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3153, 0x06, IMX300_REG_VALUE_08BIT },
> +	{ 0x3154, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3155, 0xad, IMX300_REG_VALUE_08BIT },
> +	{ 0x3156, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x3157, 0x83, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x31e8, 0x01, IMX300_REG_VALUE_08BIT },
> +	{ 0x31e9, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31ec, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f0, 0x02, IMX300_REG_VALUE_08BIT },
> +	{ 0x31f1, 0xbc, IMX300_REG_VALUE_08BIT },
> +	{ 0x3221, 0x01, IMX300_REG_VALUE_08BIT },
> +
> +	{ 0x7ea0, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea3, 0x08, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea5, 0x0f, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea6, 0x60, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea8, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7ea9, 0x78, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eac, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb3, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb4, 0x00, IMX300_REG_VALUE_08BIT },
> +	{ 0x7eb5, 0x00, IMX300_REG_VALUE_08BIT },
> +};
> +
> +/* Output bits per sample: This sensor support RAW8 and RAW10 */
> +static const struct imx300_reg raw8_framefmt_regs[] = {
> +	{ IMX300_REG_CSI_DATA_FORMAT_HI, 8, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_CSI_DATA_FORMAT_LO, 8, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_PIX_CLK_DIV, 8, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const struct imx300_reg raw10_framefmt_regs[] = {
> +	{ IMX300_REG_CSI_DATA_FORMAT_HI, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_CSI_DATA_FORMAT_LO, 10, IMX300_REG_VALUE_08BIT },
> +	{ IMX300_REG_OP_PIX_CLK_DIV, 10, IMX300_REG_VALUE_08BIT },
> +};
> +
> +static const char * const imx300_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Color",
> +	"Color Bars Solid",
> +	"Color Bars Fade To Gray",
> +	"Pseudorandom Sequence (PN9)"
> +};
> +
> +static const int imx300_test_pattern_val[] = {
> +	IMX300_TEST_PATTERN_DISABLE,
> +	IMX300_TEST_PATTERN_SOLID_COLOR,
> +	IMX300_TEST_PATTERN_COLOR_BARS,
> +	IMX300_TEST_PATTERN_GREY_COLOR,
> +	IMX300_TEST_PATTERN_PN9,
> +};
> +
> +/* regulator supplies */
> +static const char * const imx300_supply_name[] = {
> +	/* Supplies can be enabled in any order */
> +	"vana",  /* Analog (2.2V) supply */
> +	"vdig",  /* Digital Core (1.15-1.20V) supply */
> +	"vddl",  /* IF (1.8V) supply */
> +};
> +
> +#define IMX300_NUM_SUPPLIES ARRAY_SIZE(imx300_supply_name)
> +
> +/*
> + * The supported formats.
> + * This table MUST contain 4 entries per format, to cover the various flip
> + * combinations in the order
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h&v flips
> + */
> +static const u32 codes[] = {
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +};
> +
> +/* Mode configs */
> +static const struct imx300_mode supported_modes[] = {
> +	{
> +		/* 23MP 23fps mode */
> +		.width = 5520,
> +		.height = 4160,
> +		.max_fps = 23,
> +		.crop = {
> +			.left = 0,
> +			.top = 0,
> +			.width = 5520,
> +			.height = 4160
> +		},
> +		.vts_def = 4250,
> +		.high_bw = true,
> +		.binned = false,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_5520x4160),
> +			.regs = mode_5520x4160,
> +		},
> +	},
> +	{
> +		/* 20.3MP 26fps mode */
> +		.width = 5984,
> +		.height = 3392,
> +		.max_fps = 26,
> +		.crop = {
> +			.left = 0,
> +			.top = 384,
> +			.width = 5984,
> +			.height = 3392
> +		},
> +		.vts_def = 3576,
> +		.high_bw = true,
> +		.binned = false,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_5984x3392),
> +			.regs = mode_5984x3392,
> +		},
> +	},
> +	{
> +		/* 3.8MP 60fps 2x2 binning */
> +		.width = 2992,
> +		.height = 1696,
> +		.max_fps = 60,
> +		.crop = {
> +			.left = 0,
> +			.top = 384,
> +			.width = 2292,
> +			.height = 1696
> +		},
> +		.vts_def = 1792,
> +		.high_bw = true,
> +		.binned = true,
> +		.reg_list = {
> +			.num_of_regs =
> +				ARRAY_SIZE(mode_2992x1696),
> +			.regs = mode_2992x1696,
> +		},
> +	},
> +	{
> +		/* 1.2MP binned 120fps mode */
> +		.width = 1424,
> +		.height = 800,
> +		.max_fps = 120,
> +		.crop = {
> +			.left = 0,
> +			.top = 384,
> +			.width = 1424,
> +			.height = 800,
> +		},
> +		.vts_def = 896,
> +		.high_bw = false,
> +		.binned = true,
> +		.reg_list = {
> +			.num_of_regs =
> +				ARRAY_SIZE(mode_1424x800),
> +			.regs = mode_1424x800,
> +		},
> +	},
> +};
> +
> +struct imx300 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct v4l2_mbus_framefmt fmt;
> +
> +	struct clk *xclk; /* system clock to IMX300 */
> +	u32 xclk_freq;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[IMX300_NUM_SUPPLIES];
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +
> +	/* Frame rate */
> +	struct v4l2_fract frame_rate;
> +
> +	/* Current mode */
> +	const struct imx300_mode *mode;
> +	u32 cur_bps;
> +
> +	/*
> +	 * Mutex for serialized access:
> +	 * Protect sensor module set pad format and start/stop streaming safely.
> +	 */
> +	struct mutex mutex;
> +
> +	/* Streaming on/off */
> +	bool streaming;
> +};
> +
> +static inline struct imx300 *to_imx300(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct imx300, sd);
> +}
> +
> +static s64 get_pixel_rate(struct imx300 *imx300)
> +{
> +	s64 prate;
> +
> +	if (imx300->mode->high_bw)
> +		prate = IMX300_HIGH_BW_PIXEL_RATE;
> +	else
> +		prate = IMX300_LOW_BW_PIXEL_RATE;
> +
> +	/* Satisfy the settle time for 8bits */
> +	if (imx300->cur_bps == 8) {
> +		do_div(prate, 10);
> +		prate *= 12;
> +	}
> +
> +	return prate;
> +}
> +
> +/* Read registers up to 2 at a time */
> +static int imx300_read_reg(struct imx300 *imx300, u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	struct i2c_msg msgs[2];
> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> +	u8 data_buf[4] = { 0, };
> +	int ret;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	/* Write register address */
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = ARRAY_SIZE(addr_buf);
> +	msgs[0].buf = addr_buf;
> +
> +	/* Read data from register */
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_buf[4 - len];
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	*val = get_unaligned_be32(data_buf);
> +
> +	return 0;
> +}
> +
> +/* Write registers up to 4 at a time */
> +static int imx300_write_reg(struct imx300 *imx300, u16 reg, u32 len, u32 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	u8 buf[6];
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> +	if (i2c_master_send(client, buf, len + 2) != len + 2)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/* Write a list of registers */
> +static int imx300_write_regs(struct imx300 *imx300,
> +			     const struct imx300_reg *regs, u32 len)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = imx300_write_reg(imx300, regs[i].address,
> +				       regs[i].reg_len,
> +				       regs[i].val);
> +		if (ret) {
> +			dev_err_ratelimited(&client->dev,
> +					    "Cannot write reg 0x%4.4x. (%d)\n",
> +					    regs[i].address, ret);
> +
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Get bayer order based on flip setting. */
> +static u32 imx300_get_format_code(struct imx300 *imx300, u32 code)
> +{
> +	unsigned int i;
> +
> +	lockdep_assert_held(&imx300->mutex);
> +
> +	for (i = 0; i < ARRAY_SIZE(codes); i++)
> +		if (codes[i] == code)
> +			break;
> +
> +	if (i >= ARRAY_SIZE(codes))
> +		i = 0;
> +
> +	i = (i & ~3) | (imx300->vflip->val ? 2 : 0) |
> +	    (imx300->hflip->val ? 1 : 0);
> +
> +	return codes[i];
> +}
> +
> +static void imx300_set_default_format(struct imx300 *imx300)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = &imx300->fmt;
> +	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							  fmt->colorspace,
> +							  fmt->ycbcr_enc);
> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +	fmt->width = supported_modes[0].width;
> +	fmt->height = supported_modes[0].height;
> +	fmt->field = V4L2_FIELD_NONE;
> +}
> +
> +static int imx300_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +	struct v4l2_mbus_framefmt *try_fmt =
> +		v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +	struct v4l2_rect *try_crop;
> +
> +	mutex_lock(&imx300->mutex);
> +
> +	/* Initialize try_fmt */
> +	try_fmt->width = supported_modes[0].width;
> +	try_fmt->height = supported_modes[0].height;
> +	try_fmt->code = imx300_get_format_code(imx300,
> +					       MEDIA_BUS_FMT_SRGGB10_1X10);
> +	try_fmt->field = V4L2_FIELD_NONE;
> +
> +	/* Initialize try_crop rectangle. */
> +	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
> +	try_crop->top = IMX300_PIXEL_ARRAY_TOP;
> +	try_crop->left = IMX300_PIXEL_ARRAY_LEFT;
> +	try_crop->width = IMX300_PIXEL_ARRAY_WIDTH;
> +	try_crop->height = IMX300_PIXEL_ARRAY_HEIGHT;
> +
> +	mutex_unlock(&imx300->mutex);
> +
> +	return 0;
> +}
> +
> +static int imx300_update_digital_gain(struct imx300 *imx300, u32 gain)
> +{
> +	int ret;
> +
> +	ret = imx300_write_reg(imx300, IMX300_REG_GR_DIGITAL_GAIN,
> +				IMX300_REG_VALUE_16BIT,
> +				gain);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx300_write_reg(imx300, IMX300_REG_GB_DIGITAL_GAIN,
> +				IMX300_REG_VALUE_16BIT,
> +				gain);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx300_write_reg(imx300, IMX300_REG_R_DIGITAL_GAIN,
> +				IMX300_REG_VALUE_16BIT,
> +				gain);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx300_write_reg(imx300, IMX300_REG_B_DIGITAL_GAIN,

return ...

> +				IMX300_REG_VALUE_16BIT,
> +				gain);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int imx300_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx300 *imx300 =
> +		container_of(ctrl->handler, struct imx300, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	int ret;
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		int exposure_max, exposure_def;
> +
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = imx300->mode->height + ctrl->val - 10;
> +		exposure_def = (exposure_max < IMX300_EXPOSURE_DEFAULT) ?
> +			exposure_max : IMX300_EXPOSURE_DEFAULT;
> +		__v4l2_ctrl_modify_range(imx300->exposure,
> +					 imx300->exposure->minimum,
> +					 exposure_max, imx300->exposure->step,
> +					 exposure_def);
> +	}
> +
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming
> +	 */
> +	if (pm_runtime_get_if_in_use(&client->dev) == 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = imx300_write_reg(imx300, IMX300_REG_ANALOG_GAIN,
> +					      IMX300_REG_VALUE_16BIT,
> +					      ctrl->val);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		ret = imx300_write_reg(imx300, IMX300_REG_EXPOSURE,
> +					      IMX300_REG_VALUE_16BIT,
> +					      ctrl->val);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = imx300_update_digital_gain(imx300, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = imx300_write_reg(imx300, IMX300_REG_TEST_PATTERN,
> +				       IMX300_REG_VALUE_16BIT,
> +				       imx300_test_pattern_val[ctrl->val]);
> +		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = imx300_write_reg(imx300, IMX300_REG_ORIENTATION,
> +					      IMX300_REG_VALUE_08BIT,
> +					      imx300->hflip->val |
> +					      imx300->vflip->val << 1);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = imx300_write_reg(imx300, IMX300_REG_VTS,
> +					     IMX300_REG_VALUE_16BIT,
> +					     imx300->mode->height + ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_RED:
> +		ret = imx300_write_reg(imx300, IMX300_REG_TESTP_RED,
> +				       IMX300_REG_VALUE_16BIT, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_GREENR:
> +		ret = imx300_write_reg(imx300, IMX300_REG_TESTP_GREENR,
> +				       IMX300_REG_VALUE_16BIT, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_BLUE:
> +		ret = imx300_write_reg(imx300, IMX300_REG_TESTP_BLUE,
> +				       IMX300_REG_VALUE_16BIT, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_GREENB:
> +		ret = imx300_write_reg(imx300, IMX300_REG_TESTP_GREENB,
> +				       IMX300_REG_VALUE_16BIT, ctrl->val);
> +		break;
> +	default:
> +		dev_info(&client->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx300_ctrl_ops = {
> +	.s_ctrl = imx300_set_ctrl,
> +};
> +
> +static int imx300_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	if (code->index >= (ARRAY_SIZE(codes) / 4))
> +		return -EINVAL;
> +
> +	code->code = imx300_get_format_code(imx300, codes[code->index * 4]);

The should depend on the flip controls.

> +
> +	return 0;
> +}
> +
> +static int imx300_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fse->code != imx300_get_format_code(imx300, fse->code))
> +		return -EINVAL;
> +
> +	fse->min_width = supported_modes[fse->index].width;
> +	fse->max_width = fse->min_width;
> +	fse->min_height = supported_modes[fse->index].height;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +
> +static int imx300_enum_frame_interval(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_frame_interval_enum *fie)
> +{
> +	unsigned int i;
> +
> +	if (fie->pad || fie->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
> +		if (fie->width == supported_modes[i].width &&
> +		    fie->height == supported_modes[i].height)
> +			break;
> +
> +	if (i == ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	fie->interval.numerator = 1;
> +	fie->interval.denominator = supported_modes[i].max_fps;
> +
> +	return 0;
> +}
> +
> +static int imx300_g_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_frame_interval *ival)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	ival->interval.numerator = imx300->frame_rate.denominator;
> +	ival->interval.denominator = imx300->frame_rate.numerator;
> +
> +	return 0;
> +}
> +
> +static int imx300_s_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_frame_interval *ival)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +	const struct imx300_mode *cur_mode = imx300->mode;
> +	struct v4l2_fract *tpf = &ival->interval;
> +	int exposure_max, exposure_def;
> +	u32 new_vts;
> +	u32 vblank = 0;
> +
> +	if (tpf->numerator == 0 || tpf->denominator == 0 ||
> +	    (tpf->denominator > tpf->numerator * cur_mode->max_fps)) {
> +		/* reset to max frame rate */
> +		tpf->numerator = 1;
> +		tpf->denominator = cur_mode->max_fps;
> +		new_vts = cur_mode->vts_def;
> +	} else {
> +		/* Approximation of new VTS: recalculate default vblank */
> +		vblank = cur_mode->vts_def - cur_mode->height;
> +
> +		/* Avoid floating point */
> +		new_vts = vblank * 1000;
> +		new_vts = new_vts / cur_mode->max_fps;
> +		new_vts = (new_vts * tpf->denominator) / 1000;
> +		new_vts += vblank + cur_mode->height;
> +	}
> +
> +	imx300->frame_rate.numerator = tpf->numerator;
> +	imx300->frame_rate.denominator = tpf->denominator;
> +
> +	/*
> +	 * Note: VTS cannot be less than cur_mode->height, but that's useless
> +	 * to check at this point, since we are surely complying here.
> +	 *
> +	 * Now that we've got a new VTS, let's update the exposure control
> +	 * min/max in order to avoid impossible and/or useless combinations.
> +	 */
> +	exposure_max = new_vts - 4;
> +	exposure_def = (exposure_max < IMX300_EXPOSURE_DEFAULT) ?
> +			exposure_max : IMX300_EXPOSURE_DEFAULT;
> +	__v4l2_ctrl_modify_range(imx300->exposure,
> +				 imx300->exposure->minimum,
> +				 exposure_max, imx300->exposure->step,
> +				 exposure_def);
> +
> +	return imx300_write_reg(imx300, IMX300_REG_VTS,
> +				IMX300_REG_VALUE_16BIT,
> +				new_vts);
> +}
> +
> +static void imx300_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							  fmt->colorspace,
> +							  fmt->ycbcr_enc);
> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +}
> +
> +static void imx300_update_pad_format(struct imx300 *imx300,
> +				     const struct imx300_mode *mode,
> +				     struct v4l2_subdev_format *fmt)
> +{
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	imx300_reset_colorspace(&fmt->format);
> +}
> +
> +static int __imx300_get_pad_format(struct imx300 *imx300,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_format *fmt)
> +{
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *try_fmt =
> +			v4l2_subdev_get_try_format(&imx300->sd, cfg, fmt->pad);
> +		/* update the code which could change due to vflip or hflip: */
> +		try_fmt->code = imx300_get_format_code(imx300, try_fmt->code);
> +		fmt->format = *try_fmt;
> +	} else {
> +		imx300_update_pad_format(imx300, imx300->mode, fmt);
> +		fmt->format.code = imx300_get_format_code(imx300,
> +							  imx300->fmt.code);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx300_get_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +	int ret;
> +
> +	mutex_lock(&imx300->mutex);
> +	ret = __imx300_get_pad_format(imx300, cfg, fmt);
> +	mutex_unlock(&imx300->mutex);
> +
> +	return ret;
> +}
> +
> +static int imx300_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +	const struct imx300_mode *mode;
> +	struct v4l2_mbus_framefmt *framefmt;
> +	int exposure_max, exposure_def, hblank;
> +	unsigned int i;
> +
> +	mutex_lock(&imx300->mutex);
> +
> +	for (i = 0; i < ARRAY_SIZE(codes); i++)
> +		if (codes[i] == fmt->format.code)
> +			break;
> +	if (i >= ARRAY_SIZE(codes))
> +		i = 0;
> +
> +	/* Bayer order varies with flips */
> +	fmt->format.code = imx300_get_format_code(imx300, codes[i]);
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +	imx300_update_pad_format(imx300, mode, fmt);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +		*framefmt = fmt->format;
> +	} else if (imx300->mode != mode ||
> +		   imx300->fmt.code != fmt->format.code) {
> +		imx300->fmt = fmt->format;
> +		imx300->mode = mode;
> +		/* Update limits and set FPS to default */
> +		__v4l2_ctrl_modify_range(imx300->vblank, IMX300_VTS_MIN,
> +					 IMX300_VTS_MAX - mode->height, 1,
> +					 mode->vts_def - mode->height);
> +		__v4l2_ctrl_s_ctrl(imx300->vblank,
> +				   mode->vts_def - mode->height);
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = mode->vts_def - 4;
> +		exposure_def = (exposure_max < IMX300_EXPOSURE_DEFAULT) ?
> +			exposure_max : IMX300_EXPOSURE_DEFAULT;
> +		__v4l2_ctrl_modify_range(imx300->exposure,
> +					 imx300->exposure->minimum,
> +					 exposure_max, imx300->exposure->step,
> +					 exposure_def);
> +		/*
> +		 * Currently PPL is fixed to IMX300_PPL_DEFAULT, so hblank
> +		 * depends on mode->width only, and is not changeble in any
> +		 * way other than changing the mode.
> +		 */
> +		hblank = IMX300_PPL_DEFAULT - mode->width;
> +		__v4l2_ctrl_modify_range(imx300->hblank, hblank, hblank, 1,
> +					 hblank);
> +	}
> +
> +	mutex_unlock(&imx300->mutex);
> +
> +	return 0;
> +}
> +
> +static int imx300_set_framefmt(struct imx300 *imx300)
> +{
> +	int ret;
> +
> +	switch (imx300->fmt.code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fallthrough;

You can omit fallthrough here and below.

> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +		fallthrough;
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +		fallthrough;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		ret = imx300_write_regs(imx300, raw8_framefmt_regs,
> +					ARRAY_SIZE(raw8_framefmt_regs));
> +		if (ret)
> +			return ret;
> +		imx300->cur_bps = 8;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		fallthrough;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +		fallthrough;
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fallthrough;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +		ret = imx300_write_regs(imx300, raw10_framefmt_regs,
> +					ARRAY_SIZE(raw10_framefmt_regs));
> +		if (ret)
> +			return ret;
> +		imx300->cur_bps = 10;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Update the pixel rate to eventually save some power */

How is this related to any possible power savings?

> +	__v4l2_ctrl_s_ctrl_int64(imx300->pixel_rate, get_pixel_rate(imx300));
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_rect *
> +__imx300_get_pad_crop(struct imx300 *imx300, struct v4l2_subdev_pad_config *cfg,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&imx300->sd, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &imx300->mode->crop;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int imx300_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP: {
> +		struct imx300 *imx300 = to_imx300(sd);
> +
> +		mutex_lock(&imx300->mutex);
> +		sel->r = *__imx300_get_pad_crop(imx300, cfg, sel->pad,
> +						sel->which);
> +		mutex_unlock(&imx300->mutex);
> +
> +		return 0;
> +	}
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = IMX300_NATIVE_WIDTH;
> +		sel->r.height = IMX300_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = IMX300_PIXEL_ARRAY_TOP;
> +		sel->r.left = IMX300_PIXEL_ARRAY_LEFT;
> +		sel->r.width = IMX300_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX300_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int imx300_start_streaming(struct imx300 *imx300)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	const struct imx300_reg_list *reg_list;
> +	int ret;
> +
> +	ret = imx300_write_regs(imx300, init_sequence,
> +				ARRAY_SIZE(init_sequence));
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"Cannot write init sequence\n");
> +		return ret;
> +	}
> +
> +	if (imx300->mode->high_bw)
> +		ret = imx300_write_regs(imx300, mipi_data_rate_1560mbps,
> +					ARRAY_SIZE(mipi_data_rate_1560mbps));
> +	else
> +		ret = imx300_write_regs(imx300, mipi_data_rate_960mbps,
> +					ARRAY_SIZE(mipi_data_rate_960mbps));
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to set MIPI data rate\n");
> +		return ret;
> +	}
> +
> +	/* Common between all resolutions */
> +	ret = imx300_write_regs(imx300, mode_common_regs,
> +				ARRAY_SIZE(mode_common_regs));
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"Cannot write init sequence\n");
> +		return ret;
> +	}
> +
> +	/* Apply default values of the selected mode */
> +	reg_list = &imx300->mode->reg_list;
> +	ret = imx300_write_regs(imx300, reg_list->regs, reg_list->num_of_regs);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to set resolution\n");
> +		return ret;
> +	}
> +
> +	if (imx300->mode->binned)
> +		ret = imx300_write_regs(imx300, binning_mode_2x2,
> +					ARRAY_SIZE(binning_mode_2x2));
> +	else
> +		ret = imx300_write_regs(imx300, binning_mode_off,
> +					ARRAY_SIZE(binning_mode_off));
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to set binning mode\n");
> +		return ret;
> +	}
> +
> +	ret = imx300_set_framefmt(imx300);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set frame format: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(imx300->sd.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	/* set stream on register */
> +	return imx300_write_reg(imx300, IMX300_REG_MODE_SELECT,
> +				IMX300_REG_VALUE_08BIT, IMX300_MODE_STREAMING);
> +}
> +
> +static void imx300_stop_streaming(struct imx300 *imx300)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	int ret;
> +
> +	/* set stream off register */
> +	ret = imx300_write_reg(imx300, IMX300_REG_MODE_SELECT,
> +			       IMX300_REG_VALUE_08BIT, IMX300_MODE_STANDBY);
> +	if (ret)
> +		dev_err(&client->dev, "%s failed to set stream\n", __func__);
> +}
> +
> +static int imx300_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct imx300 *imx300 = to_imx300(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&imx300->mutex);
> +	if (imx300->streaming == enable) {
> +		mutex_unlock(&imx300->mutex);
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto err_unlock;
> +		}
> +
> +		/*
> +		 * Apply default & customized values
> +		 * and then start streaming.
> +		 */
> +		ret = imx300_start_streaming(imx300);
> +		if (ret)
> +			goto err_rpm_put;
> +	} else {
> +		imx300_stop_streaming(imx300);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	imx300->streaming = enable;
> +
> +	/* vflip and hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(imx300->vflip, enable);
> +	__v4l2_ctrl_grab(imx300->hflip, enable);
> +
> +	mutex_unlock(&imx300->mutex);
> +
> +	return ret;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +err_unlock:
> +	mutex_unlock(&imx300->mutex);
> +
> +	return ret;
> +}
> +
> +/* Power/clock management functions */
> +static int imx300_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx300 *imx300 = to_imx300(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(IMX300_NUM_SUPPLIES,
> +				    imx300->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx300->xclk);
> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to enable clock\n",
> +			__func__);
> +		goto reg_off;
> +	}
> +
> +	/* Wait for the internal PLLs stabilization time */
> +	usleep_range(IMX300_XCLK_STABLE_DELAY_US,
> +		     IMX300_XCLK_STABLE_DELAY_US + IMX300_XCLK_DELAY_RANGE_US);
> +
> +	/* PLLs are stable now: get out of reset! */
> +	gpiod_set_value_cansleep(imx300->reset_gpio, 1);
> +	usleep_range(IMX300_XCLR_MIN_DELAY_US,
> +		     IMX300_XCLR_MIN_DELAY_US + IMX300_XCLR_DELAY_RANGE_US);
> +
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(IMX300_NUM_SUPPLIES, imx300->supplies);
> +
> +	return ret;
> +}
> +
> +static int imx300_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	gpiod_set_value_cansleep(imx300->reset_gpio, 0);
> +	regulator_bulk_disable(IMX300_NUM_SUPPLIES, imx300->supplies);
> +	clk_disable_unprepare(imx300->xclk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx300_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	if (imx300->streaming)
> +		imx300_stop_streaming(imx300);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx300_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx300 *imx300 = to_imx300(sd);
> +	int ret;
> +
> +	if (imx300->streaming) {
> +		ret = imx300_start_streaming(imx300);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	imx300_stop_streaming(imx300);
> +	imx300->streaming = false;
> +
> +	return ret;
> +}
> +
> +static int imx300_get_regulators(struct imx300 *imx300)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	unsigned int i;
> +
> +	for (i = 0; i < IMX300_NUM_SUPPLIES; i++)
> +		imx300->supplies[i].supply = imx300_supply_name[i];
> +
> +	return devm_regulator_bulk_get(&client->dev,
> +				       IMX300_NUM_SUPPLIES,
> +				       imx300->supplies);
> +}
> +
> +/* Verify chip ID */
> +static int imx300_identify_module(struct imx300 *imx300)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	int ret;
> +	u32 val;
> +
> +	ret = imx300_read_reg(imx300, IMX300_REG_CHIP_ID,
> +			      IMX300_REG_VALUE_16BIT, &val);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read chip id %x\n",
> +			IMX300_CHIP_ID);
> +		return ret;
> +	}
> +
> +	if (val != IMX300_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> +			IMX300_CHIP_ID, val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx300_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx300_video_ops = {
> +	.s_stream = imx300_set_stream,
> +	.g_frame_interval = imx300_g_frame_interval,
> +	.s_frame_interval = imx300_s_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx300_pad_ops = {
> +	.enum_mbus_code = imx300_enum_mbus_code,
> +	.get_fmt = imx300_get_pad_format,
> +	.set_fmt = imx300_set_pad_format,
> +	.get_selection = imx300_get_selection,
> +	.enum_frame_size = imx300_enum_frame_size,
> +	.enum_frame_interval = imx300_enum_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_ops imx300_subdev_ops = {
> +	.core = &imx300_core_ops,
> +	.video = &imx300_video_ops,
> +	.pad = &imx300_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx300_internal_ops = {
> +	.open = imx300_open,
> +};
> +
> +/* Initialize control handlers */
> +static int imx300_init_controls(struct imx300 *imx300)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx300->sd);
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	unsigned int height = imx300->mode->height;
> +	struct v4l2_fwnode_device_properties props;
> +	int exposure_max, exposure_def, hblank;
> +	int i, ret;
> +
> +	ctrl_hdlr = &imx300->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&imx300->mutex);
> +	ctrl_hdlr->lock = &imx300->mutex;
> +
> +	/* By default, PIXEL_RATE is read only */
> +	imx300->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       IMX300_LOW_BW_PIXEL_RATE,
> +					       IMX300_HIGH_BW_PIXEL_RATE, 1,
> +					       IMX300_HIGH_BW_PIXEL_RATE);
> +
> +	/* Initial vblank/hblank/exposure parameters based on current mode */
> +	imx300->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					   V4L2_CID_VBLANK, IMX300_VTS_MIN,
> +					   IMX300_VTS_MAX - height, 1,
> +					   imx300->mode->vts_def - height);
> +	hblank = IMX300_PPL_DEFAULT - imx300->mode->width;
> +	imx300->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank, hblank,
> +					   1, hblank);
> +	if (imx300->hblank)
> +		imx300->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	exposure_max = imx300->mode->vts_def - 4;
> +	exposure_def = (exposure_max < IMX300_EXPOSURE_DEFAULT) ?
> +		exposure_max : IMX300_EXPOSURE_DEFAULT;
> +	imx300->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX300_EXPOSURE_MIN, exposure_max,
> +					     IMX300_EXPOSURE_STEP,
> +					     exposure_def);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX300_ANA_GAIN_MIN, IMX300_ANA_GAIN_MAX,
> +			  IMX300_ANA_GAIN_STEP, IMX300_ANA_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  IMX300_DGTL_GAIN_MIN, IMX300_DGTL_GAIN_MAX,
> +			  IMX300_DGTL_GAIN_STEP, IMX300_DGTL_GAIN_DEFAULT);
> +
> +	imx300->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (imx300->hflip)
> +		imx300->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	imx300->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (imx300->vflip)
> +		imx300->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx300_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx300_test_pattern_menu) - 1,
> +				     0, 0, imx300_test_pattern_menu);
> +	for (i = 0; i < 4; i++) {
> +		/*
> +		 * The assumption is that
> +		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
> +		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
> +		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
> +		 */
> +		v4l2_ctrl_new_std(ctrl_hdlr, &imx300_ctrl_ops,
> +				  V4L2_CID_TEST_PATTERN_RED + i,
> +				  IMX300_TESTP_COLOUR_MIN,
> +				  IMX300_TESTP_COLOUR_MAX,
> +				  IMX300_TESTP_COLOUR_STEP,
> +				  IMX300_TESTP_COLOUR_MAX);
> +		/* The "Solid color" pattern is white by default */
> +	}
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(&client->dev, "%s control init failed (%d)\n",
> +			__func__, ret);
> +		goto error;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx300_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
> +	imx300->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +	mutex_destroy(&imx300->mutex);
> +
> +	return ret;
> +}
> +
> +static void imx300_free_controls(struct imx300 *imx300)
> +{
> +	v4l2_ctrl_handler_free(imx300->sd.ctrl_handler);
> +	mutex_destroy(&imx300->mutex);
> +}
> +
> +static int imx300_match_link_freq(u64 link_freq)
> +{
> +	if (link_freq == IMX300_HIGH_BW_LINK_FREQ ||
> +	    link_freq == IMX300_LOW_BW_LINK_FREQ)
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static int imx300_check_hwcfg(struct device *dev, struct imx300 *imx300)
> +{
> +	struct fwnode_handle *endpoint;
> +	struct v4l2_fwnode_endpoint ep_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	int ret = -EINVAL;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> +		dev_err(dev, "Cannot parse endpoint\n");
> +		goto error_out;
> +	}
> +
> +	/* Check the link frequency set in device tree */
> +	if (ep_cfg.nr_of_link_frequencies != 2) {
> +		dev_err(dev, "This sensor uses two link frequencies.\n");

You could allow still using one frequency, assuming it's supported, but
that's checked below.

> +		goto error_out;
> +	}
> +
> +	/* Check the number of MIPI CSI2 data lanes */
> +	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(dev, "This sensor needs 4 MIPI Lanes!\n");
> +		goto error_out;
> +	}
> +
> +	if (imx300_match_link_freq(ep_cfg.link_frequencies[0]) ||
> +	    imx300_match_link_freq(ep_cfg.link_frequencies[1])) {
> +		dev_err(dev, "Unsupported link frequencies.\n");
> +		goto error_out;
> +	}
> +
> +	ret = 0;
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&ep_cfg);
> +	fwnode_handle_put(endpoint);
> +
> +	return ret;
> +}
> +
> +static int imx300_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct imx300 *imx300;
> +	int ret;
> +
> +	imx300 = devm_kzalloc(&client->dev, sizeof(*imx300), GFP_KERNEL);
> +	if (!imx300)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&imx300->sd, client, &imx300_subdev_ops);
> +
> +	/* Check the hardware configuration in device tree */
> +	if (imx300_check_hwcfg(dev, imx300))
> +		return -EINVAL;
> +
> +	/* Get system clock (xclk) */
> +	imx300->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(imx300->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(imx300->xclk);
> +	}
> +
> +	imx300->xclk_freq = clk_get_rate(imx300->xclk);
> +	if (imx300->xclk_freq != IMX300_XCLK_FREQ_24M) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			imx300->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = imx300_get_regulators(imx300);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	/* Request optional enable pin */
> +	imx300->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +
> +	/*
> +	 * The sensor must be powered for imx300_identify_module()
> +	 * to be able to read the CHIP_ID register
> +	 */
> +	ret = imx300_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx300_identify_module(imx300);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Set default mode to max resolution */
> +	imx300->mode = &supported_modes[0];
> +
> +	/* Default is 10 bits per sample */
> +	imx300->cur_bps = 10;

Could you move this information to the mode definition?

> +
> +	/*
> +	 * Sensor doesn't enter LP-11 state upon power up until and unless
> +	 * streaming is started, so upon power up switch the modes to:
> +	 * streaming -> standby
> +	 */
> +	ret = imx300_write_reg(imx300, IMX300_REG_MODE_SELECT,
> +			       IMX300_REG_VALUE_08BIT, IMX300_MODE_STREAMING);
> +	if (ret < 0)
> +		goto error_power_off;
> +
> +	/* put sensor back to standby mode */
> +	ret = imx300_write_reg(imx300, IMX300_REG_MODE_SELECT,
> +			       IMX300_REG_VALUE_08BIT, IMX300_MODE_STANDBY);
> +	if (ret < 0)
> +		goto error_power_off;
> +
> +	ret = imx300_init_controls(imx300);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	imx300->sd.internal_ops = &imx300_internal_ops;
> +	imx300->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx300->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx300->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	/* Initialize default format */
> +	imx300_set_default_format(imx300);

This is related to the mode set earlier. So please use either.

> +
> +	ret = media_entity_pads_init(&imx300->sd.entity, 1, &imx300->pad);
> +	if (ret) {
> +		dev_err(dev, "failed to init entity pads: %d\n", ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor_common(&imx300->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register sensor subdevice: %d\n", ret);
> +		goto error_media_entity;
> +	}
> +
> +	/* Enable runtime PM and turn off the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	/* Due to the sensor id being odd, let's inform about us... */
> +	dev_info(dev, "Sony Exmor-RS IMX300 camera sensor is up.\n");

I'd use dev_dbg().

> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx300->sd.entity);
> +
> +error_handler_free:
> +	imx300_free_controls(imx300);
> +
> +error_power_off:
> +	imx300_power_off(dev);
> +
> +	return ret;
> +}
> +
> +static int imx300_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx300 *imx300 = to_imx300(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	imx300_free_controls(imx300);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		imx300_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx300_dt_ids[] = {
> +	{ .compatible = "sony,imx300" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx300_dt_ids);
> +
> +static const struct dev_pm_ops imx300_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(imx300_suspend, imx300_resume)
> +	SET_RUNTIME_PM_OPS(imx300_power_off, imx300_power_on, NULL)
> +};
> +
> +static struct i2c_driver imx300_i2c_driver = {
> +	.driver = {
> +		.name = "imx300",
> +		.of_match_table	= imx300_dt_ids,
> +		.pm = &imx300_pm_ops,
> +	},
> +	.probe_new = imx300_probe,
> +	.remove = imx300_remove,
> +};
> +
> +module_i2c_driver(imx300_i2c_driver);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <kholk11@gmail.com>");
> +MODULE_DESCRIPTION("Sony Exmor-RS IMX300 camera sensor driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus
