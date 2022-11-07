Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4D961F0D2
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 11:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiKGKf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 05:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbiKGKfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 05:35:47 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A266213F93
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 02:35:19 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4C3EDC0012;
        Mon,  7 Nov 2022 10:35:17 +0000 (UTC)
Date:   Mon, 7 Nov 2022 11:35:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicholas Roth <nicholas@rothemail.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov8858 Add driver for ov8858
Message-ID: <20221107103515.5gtc7s4jz7jrvlil@uno.localdomain>
References: <20221106171129.166892-1-nicholas@rothemail.net>
 <20221106171129.166892-2-nicholas@rothemail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221106171129.166892-2-nicholas@rothemail.net>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas,

On Sun, Nov 06, 2022 at 11:11:30AM -0600, Nicholas Roth wrote:
> Currently, the ov8858 image sensor is supported downstream in Manjaro
> [1], which depends on Megi's kernel [2].
>
> TL;DR: This enables the PinePhone Pro's cameras to work in Waydroid.
>
> This is the front-facing (selfie) sensor in the PinePhone Pro.
> Work is ongoing to support the PinePhone Pro and other FOSS phone
> cameras in Waydroid [4], but libcamera's [3] contributing guidelines
> require sensors to be upstreamed.

Not really something we might want in the kernel log, but I guess it
doesn't hurt.

However I would make the commit message a bit more sensor specific and
leave out the description of your specific use case

"Add support for Omnivision OV8858 image sensor. The OV8858 is an 8
mega pixel image sensor which provides images in RAW format over MIPI
CSI-2 data bus and is controlled through an I2C-compatibile SCCB bus.

This commit upports the driver from the PinePhone Pro BSP
https://megous.com/git/linux at revision
4f15e3e06e2ca498ecd91ec4fee7400997fc9053.

Tested on PinePhone Pro with Waydroi and libcamera HALv3.

Signed-off-by: Nicholas Roth <nicholas@rothemail.net>
"
>
> 1: https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephonepro/-/blob/6.0-megi/PKGBUILD
> 2: https://github.com/megous/linux
> 3: libcamera.org
> 4: https://github.com/waydroid/waydroid/issues/519
>
> Signed-off-by: Nicholas Roth <nicholas@rothemail.net>
> ---
>  .../bindings/i2c/ovti,ov8858-i2c.yaml         |   78 +

Bindings in a separate patch with devicetree@vger.kernel.org and DT
maintainers robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org in
CC, as they might get in through a different tree.

>  drivers/media/i2c/Kconfig                     |   13 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/ov8858.c                    | 2102 +++++++++++++++++

Please also add and entry to MAINTAINERS file

>  4 files changed, 2194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ovti,ov8858-i2c.yaml
>  create mode 100644 drivers/media/i2c/ov8858.c
>
> diff --git a/Documentation/devicetree/bindings/i2c/ovti,ov8858-i2c.yaml b/Documentation/devicetree/bindings/i2c/ovti,ov8858-i2c.yaml
> new file mode 100644
> index 000000000000..1300c1b6fa17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ovti,ov8858-i2c.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for OV8858

Please fix this and remove references to Freescale stuff.
Use as a reference bindings from some other image senso
This should be

$id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: Omnivision OV8858 raw image sensor


> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#

Unrelated, please drop.

> +
> +properties:
> +  compatible: ovti,ov8858
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Please use as starting point the bindings documentation for another
image sensor in Documentation/devicetree/bindings/media/i2c/ and not
an I2C controller chip.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xvclk
> +
> +  clock-frequency:
> +    minimum: 24000000
> +    default: 24000000
> +    maximum: 24000000

Bindings are about HW capabilities not what's implemented in the
driver.

The range of supported input clock frequencies, according to the
datasheet is [6,27]MHz

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +

Missing "ports" and "endpoints". Please read
Documentation/devicetree/bindings/media/video-interfaces.yaml

and check existing bindings to see how to reference
the video-interfaces.yaml properties supported by your sensor

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@ff110000 {
> +        status = "okay";
> +
> +        clock-frequency = <400000>;
> +        i2c-scl-rising-time-ns = <300>;
> +        i2c-scl-falling-time-ns = <15>;
> +
> +        pinctrl-0 = <&i2c1_xfer &cif_clkouta>;
> +
> +        assigned-clocks = <&cru SCLK_CIF_OUT &cru SCLK_CIF_OUT_SRC>;
> +        assigned-clock-parents = <&cru SCLK_CIF_OUT_SRC &cru PLL_GPLL>;
> +        assigned-clock-rates = <19200000 0>;
> +        ucam: camera@36 {
> +            compatible = "ovti,ov8858";
> +            reg = <0x36>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&ucam_pdn &ucam_rst>;
> +
> +            clocks = <&cru SCLK_CIF_OUT>;
> +            clock-names = "xvclk";
> +
> +            dovdd-supply = <&vcc1v8_dvp>;
> +            /*XXX: also depends on vcca1v8_codec for I2C bus power */
> +
> +            reset-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +
> +            rotation = <180>;
> +
> +            port {
> +                ucam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_ucam>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7806d4b81716..bca35574c5e3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -619,6 +619,19 @@ config VIDEO_OV8856
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov8856.
>
> +config VIDEO_OV8858
> +	tristate "OmniVision OV8858 sensor support"
> +	depends on I2C && VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV8858 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov8858.
> +
>  config VIDEO_OV8865
>  	tristate "OmniVision OV8865 sensor support"
>  	depends on I2C && PM && VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 0a2933103dd9..d44934fbb92b 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_VIDEO_OV7670) += ov7670.o
>  obj-$(CONFIG_VIDEO_OV772X) += ov772x.o
>  obj-$(CONFIG_VIDEO_OV7740) += ov7740.o
>  obj-$(CONFIG_VIDEO_OV8856) += ov8856.o
> +obj-$(CONFIG_VIDEO_OV8858) += ov8858.o
>  obj-$(CONFIG_VIDEO_OV8865) += ov8865.o
>  obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
>  obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> new file mode 100644
> index 000000000000..f74600ba7662
> --- /dev/null
> +++ b/drivers/media/i2c/ov8858.c
> @@ -0,0 +1,2102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ov8858 driver
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + * v0.1.0x00 : 1. create file.
> + * V0.0X01.0X02 fix mclk issue when probe multiple camera.
> + * V0.0X01.0X03 add enum_frame_interval function.

Maybe not necessary and please consider adding your copyright if you
think it's relevant


> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/sysfs.h>

What for ?

> +#include <linux/slab.h>

Is this required ?

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/version.h>

Also these two seems not necessary ?

> +
> +#include <media/v4l2-async.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-image-sizes.h>
> +#include <media/v4l2-mediabus.h>
> +#include <media/v4l2-subdev.h>
> +
> +#ifndef V4L2_CID_DIGITAL_GAIN
> +#define V4L2_CID_DIGITAL_GAIN		V4L2_CID_GAIN
> +#endif

Suspicious... Why are you re-defining this ? The driver will look like
it is operating V4L2_CID_DIGITAL_GAIN but userspace will see
V4L2_CID_GAIN. Why that ? Use V4L2_CID_GAIN directly, or if the driver
supports handling analogue and digital gain separately (something I
recall it did) use V4L2_CID_DIGITAL_GAIN


> +#define OV8858_PIXEL_RATE		(360000000LL * 2LL * 2LL / 10LL)

Carefull as this hardcodes operations with 2 data lanes

> +
> +#define MIPI_FREQ			360000000U
> +#define OV8858_XVCLK_FREQ		24000000
> +
> +#define CHIP_ID				0x008858
> +#define OV8858_REG_CHIP_ID		0x300a
> +
> +#define OV8858_REG_CTRL_MODE		0x0100
> +#define OV8858_MODE_SW_STANDBY		0x0
> +#define OV8858_MODE_STREAMING		0x1
> +
> +#define OV8858_REG_EXPOSURE		0x3500
> +#define	OV8858_EXPOSURE_MIN		4
> +#define	OV8858_EXPOSURE_STEP		1
> +#define OV8858_VTS_MAX			0x7fff
> +
> +#define OV8858_REG_GAIN_H		0x3508
> +#define OV8858_REG_GAIN_L		0x3509
> +#define OV8858_GAIN_H_MASK		0x07
> +#define OV8858_GAIN_H_SHIFT		8
> +#define OV8858_GAIN_L_MASK		0xff
> +#define OV8858_GAIN_MIN			0x0
> +#define OV8858_GAIN_MAX			0x7ff
> +#define OV8858_GAIN_STEP		1
> +#define OV8858_GAIN_DEFAULT		0x80
> +
> +#define OV8858_REG_DGAIN_H		0x350a
> +#define OV8858_REG_DGAIN_L		0x350b
> +#define OV8858_DGAIN_H_MASK		0xff
> +#define OV8858_DGAIN_H_SHIFT		6
> +#define OV8858_DGAIN_L_MASK		0x3f
> +#define OV8858_DGAIN_MIN		0x0
> +#define OV8858_DGAIN_MAX		0x3fff
> +#define OV8858_DGAIN_STEP		1
> +#define OV8858_DGAIN_DEFAULT		0x200
> +
> +#define OV8858_REG_TEST_PATTERN		0x5e00
> +#define	OV8858_TEST_PATTERN_ENABLE	0x80
> +#define	OV8858_TEST_PATTERN_DISABLE	0x0
> +
> +#define OV8858_REG_VTS			0x380e
> +
> +#define REG_NULL			0xFFFF
> +
> +#define OV8858_REG_VALUE_08BIT		1
> +#define OV8858_REG_VALUE_16BIT		2
> +#define OV8858_REG_VALUE_24BIT		3
> +
> +#define OV8858_LANES			2
> +#define OV8858_BITS_PER_SAMPLE		10
> +
> +#define OV8858_CHIP_REVISION_REG	0x302A
> +#define OV8858_R1A			0xb0
> +#define OV8858_R2A			0xb2
> +
> +#define OV8858_NAME			"ov8858"
> +#define OV8858_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
> +
> +#define ov8858_write_1byte(client, reg, val)	\
> +	ov8858_write_reg((client), (reg), OV8858_REG_VALUE_08BIT, (val))
> +
> +#define ov8858_read_1byte(client, reg, val)	\
> +	ov8858_read_reg((client), (reg), OV8858_REG_VALUE_08BIT, (val))
> +
> +static const struct regval *ov8858_global_regs;
> +
> +static const char * const ov8858_supply_names[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV8858_NUM_SUPPLIES ARRAY_SIZE(ov8858_supply_names)
> +
> +struct regval {
> +	u16 addr;
> +	u8 val;
> +};
> +
> +struct ov8858_mode {
> +	u32 width;
> +	u32 height;
> +	struct v4l2_fract max_fps;
> +	u32 hts_def;
> +	u32 vts_def;
> +	u32 exp_def;
> +	const struct regval *reg_list;
> +};
> +
> +struct ov8858 {
> +	struct i2c_client	*client;
> +	struct clk		*xvclk;
> +	struct gpio_desc	*reset_gpio;
> +	struct gpio_desc	*pwdn_gpio;
> +	struct regulator_bulk_data supplies[OV8858_NUM_SUPPLIES];
> +
> +	struct pinctrl		*pinctrl;
> +	struct pinctrl_state	*pins_default;
> +	struct pinctrl_state	*pins_sleep;
> +
> +	struct v4l2_subdev	subdev;
> +	struct media_pad	pad;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl	*exposure;
> +	struct v4l2_ctrl	*anal_gain;
> +	struct v4l2_ctrl	*digi_gain;
> +	struct v4l2_ctrl	*hblank;
> +	struct v4l2_ctrl	*vblank;
> +	struct v4l2_ctrl	*test_pattern;

Please only store references to controls that are used outside of the
control initialization routine (exposure hblank and vblank only, if I
read it right)

> +	struct mutex		mutex;

Please add a comment about what this mutex protects

> +	bool			streaming;
> +	const struct ov8858_mode *cur_mode;
> +	bool			is_r2a;
> +	unsigned int		lane_num;
> +	unsigned int		cfg_num;
> +	unsigned int		pixel_rate;

Suspicious as these parameters seems to be fixed in the driver

> +};
> +
> +#define to_ov8858(sd) container_of(sd, struct ov8858, subdev)
> +
> +/*
> + * Xclk 24Mhz
> + */

Fits on a single line

/* xclk 24MHz */

> +static const struct regval ov8858_global_regs_r1a[] = {

Do you know what r1a and r2a refers to and what version you are
testing with ?

> +	//@@5.1.1.1 Initialization (Global Setting)
> +	//; Slave_ID=0x6c;
> +	//{0x0103 ,0x01 }, software reset
> +	{0x0100, 0x00},
> +	{0x0100, 0x00},
> +	{0x0100, 0x00},
> +	{0x0100, 0x00},
> +	{0x0302, 0x1e},
> +	{0x0303, 0x00},
> +	{0x0304, 0x03},
> +	{0x030e, 0x00},
> +	{0x030f, 0x09},
> +	{0x0312, 0x01},
> +	{0x031e, 0x0c},
> +	{0x3600, 0x00},
> +	{0x3601, 0x00},
> +	{0x3602, 0x00},
> +	{0x3603, 0x00},
> +	{0x3604, 0x22},
> +	{0x3605, 0x30},
> +	{0x3606, 0x00},
> +	{0x3607, 0x20},
> +	{0x3608, 0x11},
> +	{0x3609, 0x28},
> +	{0x360a, 0x00},
> +	{0x360b, 0x06},
> +	{0x360c, 0xdc},
> +	{0x360d, 0x40},
> +	{0x360e, 0x0c},
> +	{0x360f, 0x20},
> +	{0x3610, 0x07},
> +	{0x3611, 0x20},
> +	{0x3612, 0x88},
> +	{0x3613, 0x80},
> +	{0x3614, 0x58},
> +	{0x3615, 0x00},
> +	{0x3616, 0x4a},
> +	{0x3617, 0xb0},
> +	{0x3618, 0x56},
> +	{0x3619, 0x70},
> +	{0x361a, 0x99},
> +	{0x361b, 0x00},
> +	{0x361c, 0x07},
> +	{0x361d, 0x00},
> +	{0x361e, 0x00},
> +	{0x361f, 0x00},
> +	{0x3638, 0xff},
> +	{0x3633, 0x0c},
> +	{0x3634, 0x0c},
> +	{0x3635, 0x0c},
> +	{0x3636, 0x0c},
> +	{0x3645, 0x13},
> +	{0x3646, 0x83},
> +	{0x364a, 0x07},
> +	{0x3015, 0x01},
> +	{0x3018, 0x32},
> +	{0x3020, 0x93},
> +	{0x3022, 0x01},
> +	{0x3031, 0x0a},
> +	{0x3034, 0x00},
> +	{0x3106, 0x01},
> +	{0x3305, 0xf1},
> +	{0x3308, 0x00},
> +	{0x3309, 0x28},
> +	{0x330a, 0x00},
> +	{0x330b, 0x20},
> +	{0x330c, 0x00},
> +	{0x330d, 0x00},
> +	{0x330e, 0x00},
> +	{0x330f, 0x40},
> +	{0x3307, 0x04},
> +	{0x3500, 0x00},
> +	{0x3501, 0x4d},
> +	{0x3502, 0x40},
> +	{0x3503, 0x00},
> +	{0x3505, 0x80},
> +	{0x3508, 0x04},
> +	{0x3509, 0x00},
> +	{0x350c, 0x00},
> +	{0x350d, 0x80},
> +	{0x3510, 0x00},
> +	{0x3511, 0x02},
> +	{0x3512, 0x00},
> +	{0x3700, 0x18},
> +	{0x3701, 0x0c},
> +	{0x3702, 0x28},
> +	{0x3703, 0x19},
> +	{0x3704, 0x14},
> +	{0x3705, 0x00},
> +	{0x3706, 0x35},
> +	{0x3707, 0x04},
> +	{0x3708, 0x24},
> +	{0x3709, 0x33},
> +	{0x370a, 0x00},
> +	{0x370b, 0xb5},
> +	{0x370c, 0x04},
> +	{0x3718, 0x12},
> +	{0x3719, 0x31},
> +	{0x3712, 0x42},
> +	{0x3714, 0x24},
> +	{0x371e, 0x19},
> +	{0x371f, 0x40},
> +	{0x3720, 0x05},
> +	{0x3721, 0x05},
> +	{0x3724, 0x06},
> +	{0x3725, 0x01},
> +	{0x3726, 0x06},
> +	{0x3728, 0x05},
> +	{0x3729, 0x02},
> +	{0x372a, 0x03},
> +	{0x372b, 0x53},
> +	{0x372c, 0xa3},
> +	{0x372d, 0x53},
> +	{0x372e, 0x06},
> +	{0x372f, 0x10},
> +	{0x3730, 0x01},
> +	{0x3731, 0x06},
> +	{0x3732, 0x14},
> +	{0x3733, 0x10},
> +	{0x3734, 0x40},
> +	{0x3736, 0x20},
> +	{0x373a, 0x05},
> +	{0x373b, 0x06},
> +	{0x373c, 0x0a},
> +	{0x373e, 0x03},
> +	{0x3755, 0x10},
> +	{0x3758, 0x00},
> +	{0x3759, 0x4c},
> +	{0x375a, 0x06},
> +	{0x375b, 0x13},
> +	{0x375c, 0x20},
> +	{0x375d, 0x02},
> +	{0x375e, 0x00},
> +	{0x375f, 0x14},
> +	{0x3768, 0x22},
> +	{0x3769, 0x44},
> +	{0x376a, 0x44},
> +	{0x3761, 0x00},
> +	{0x3762, 0x00},
> +	{0x3763, 0x00},
> +	{0x3766, 0xff},
> +	{0x376b, 0x00},
> +	{0x3772, 0x23},
> +	{0x3773, 0x02},
> +	{0x3774, 0x16},
> +	{0x3775, 0x12},
> +	{0x3776, 0x04},
> +	{0x3777, 0x00},
> +	{0x3778, 0x1b},
> +	{0x37a0, 0x44},
> +	{0x37a1, 0x3d},
> +	{0x37a2, 0x3d},
> +	{0x37a3, 0x00},
> +	{0x37a4, 0x00},
> +	{0x37a5, 0x00},
> +	{0x37a6, 0x00},
> +	{0x37a7, 0x44},
> +	{0x37a8, 0x4c},
> +	{0x37a9, 0x4c},
> +	{0x3760, 0x00},
> +	{0x376f, 0x01},
> +	{0x37aa, 0x44},
> +	{0x37ab, 0x2e},
> +	{0x37ac, 0x2e},
> +	{0x37ad, 0x33},
> +	{0x37ae, 0x0d},
> +	{0x37af, 0x0d},
> +	{0x37b0, 0x00},
> +	{0x37b1, 0x00},
> +	{0x37b2, 0x00},
> +	{0x37b3, 0x42},
> +	{0x37b4, 0x42},
> +	{0x37b5, 0x33},
> +	{0x37b6, 0x00},
> +	{0x37b7, 0x00},
> +	{0x37b8, 0x00},
> +	{0x37b9, 0xff},
> +	{0x3800, 0x00},
> +	{0x3801, 0x0c},
> +	{0x3802, 0x00},
> +	{0x3803, 0x0c},
> +	{0x3804, 0x0c},
> +	{0x3805, 0xd3},
> +	{0x3806, 0x09},
> +	{0x3807, 0xa3},
> +	{0x3808, 0x06},
> +	{0x3809, 0x60},
> +	{0x380a, 0x04},
> +	{0x380b, 0xc8},
> +	{0x380c, 0x07},
> +	{0x380d, 0x88},
> +	{0x380e, 0x04},
> +	{0x380f, 0xdc},
> +	{0x3810, 0x00},
> +	{0x3811, 0x04},
> +	{0x3813, 0x02},
> +	{0x3814, 0x03},
> +	{0x3815, 0x01},
> +	{0x3820, 0x00},
> +	{0x3821, 0x67},
> +	{0x382a, 0x03},
> +	{0x382b, 0x01},
> +	{0x3830, 0x08},
> +	{0x3836, 0x02},
> +	{0x3837, 0x18},
> +	{0x3841, 0xff},
> +	{0x3846, 0x48},
> +	{0x3d85, 0x14},
> +	{0x3f08, 0x08},
> +	{0x3f0a, 0x80},
> +	{0x4000, 0xf1},
> +	{0x4001, 0x10},
> +	{0x4005, 0x10},
> +	{0x4002, 0x27},
> +	{0x4009, 0x81},
> +	{0x400b, 0x0c},
> +	{0x401b, 0x00},
> +	{0x401d, 0x00},
> +	{0x4020, 0x00},
> +	{0x4021, 0x04},
> +	{0x4022, 0x04},
> +	{0x4023, 0xb9},
> +	{0x4024, 0x05},
> +	{0x4025, 0x2a},
> +	{0x4026, 0x05},
> +	{0x4027, 0x2b},
> +	{0x4028, 0x00},
> +	{0x4029, 0x02},
> +	{0x402a, 0x04},
> +	{0x402b, 0x04},
> +	{0x402c, 0x02},
> +	{0x402d, 0x02},
> +	{0x402e, 0x08},
> +	{0x402f, 0x02},
> +	{0x401f, 0x00},
> +	{0x4034, 0x3f},
> +	{0x403d, 0x04},
> +	{0x4300, 0xff},
> +	{0x4301, 0x00},
> +	{0x4302, 0x0f},
> +	{0x4316, 0x00},
> +	{0x4500, 0x38},
> +	{0x4503, 0x18},
> +	{0x4600, 0x00},
> +	{0x4601, 0xcb},
> +	{0x481f, 0x32},
> +	{0x4837, 0x16},
> +	{0x4850, 0x10},
> +	{0x4851, 0x32},
> +	{0x4b00, 0x2a},
> +	{0x4b0d, 0x00},
> +	{0x4d00, 0x04},
> +	{0x4d01, 0x18},
> +	{0x4d02, 0xc3},
> +	{0x4d03, 0xff},
> +	{0x4d04, 0xff},
> +	{0x4d05, 0xff},
> +	{0x5000, 0x7e},
> +	{0x5001, 0x01},
> +	{0x5002, 0x08},
> +	{0x5003, 0x20},
> +	{0x5046, 0x12},
> +	{0x5901, 0x00},
> +	{0x5e00, 0x00},
> +	{0x5e01, 0x41},
> +	{0x382d, 0x7f},
> +	{0x4825, 0x3a},
> +	{0x4826, 0x40},
> +	{0x4808, 0x25},
> +	//{0x0100, 0x01},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + */

Ditto

> +static const struct regval ov8858_global_regs_r2a_2lane[] = {
> +	// MIPI=720Mbps, SysClk=144Mhz,Dac Clock=360Mhz.
> +	//
> +	//
> +	// v00_01_00 (05/29/2014) : initial setting
> +	//
> +	// AM19 : 3617 <- 0xC0
> +	//
> +	// AM20 : change FWC_6K_EN to be default 0x3618=0x5a

I guess we can keep these comments around for reference..

> +	{0x0103, 0x01},// software reset for OVTATool only

Not going to ask to review the register tables, but this really seems
duplicated. As we have to resort to trusting this black magic blobs,
I'm fine if you don't want to change these

> +	{0x0103, 0x01},// software reset
> +	{0x0100, 0x00},// software standby
> +	{0x0302, 0x1e},// pll1_multi
> +	{0x0303, 0x00},// pll1_divm
> +	{0x0304, 0x03},// pll1_div_mipi
> +	{0x030e, 0x02},// pll2_rdiv
> +	{0x030f, 0x04},// pll2_divsp
> +	{0x0312, 0x03},// pll2_pre_div0, pll2_r_divdac
> +	{0x031e, 0x0c},// pll1_no_lat
> +	{0x3600, 0x00},
> +	{0x3601, 0x00},
> +	{0x3602, 0x00},
> +	{0x3603, 0x00},
> +	{0x3604, 0x22},
> +	{0x3605, 0x20},
> +	{0x3606, 0x00},
> +	{0x3607, 0x20},
> +	{0x3608, 0x11},
> +	{0x3609, 0x28},
> +	{0x360a, 0x00},
> +	{0x360b, 0x05},
> +	{0x360c, 0xd4},
> +	{0x360d, 0x40},
> +	{0x360e, 0x0c},
> +	{0x360f, 0x20},
> +	{0x3610, 0x07},
> +	{0x3611, 0x20},
> +	{0x3612, 0x88},
> +	{0x3613, 0x80},
> +	{0x3614, 0x58},
> +	{0x3615, 0x00},
> +	{0x3616, 0x4a},
> +	{0x3617, 0x90},
> +	{0x3618, 0x5a},
> +	{0x3619, 0x70},
> +	{0x361a, 0x99},
> +	{0x361b, 0x0a},
> +	{0x361c, 0x07},
> +	{0x361d, 0x00},
> +	{0x361e, 0x00},
> +	{0x361f, 0x00},
> +	{0x3638, 0xff},
> +	{0x3633, 0x0f},
> +	{0x3634, 0x0f},
> +	{0x3635, 0x0f},
> +	{0x3636, 0x12},
> +	{0x3645, 0x13},
> +	{0x3646, 0x83},
> +	{0x364a, 0x07},
> +	{0x3015, 0x00},
> +	{0x3018, 0x32}, // MIPI 2 lane
> +	{0x3020, 0x93}, // Clock switch output normal, pclk_div =/1
> +	{0x3022, 0x01}, // pd_mipi enable when rst_sync
> +	{0x3031, 0x0a}, // MIPI 10-bit mode
> +	{0x3034, 0x00}, //
> +	{0x3106, 0x01}, // sclk_div, sclk_pre_div
> +	{0x3305, 0xf1},
> +	{0x3308, 0x00},
> +	{0x3309, 0x28},
> +	{0x330a, 0x00},
> +	{0x330b, 0x20},
> +	{0x330c, 0x00},
> +	{0x330d, 0x00},
> +	{0x330e, 0x00},
> +	{0x330f, 0x40},
> +	{0x3307, 0x04},
> +	{0x3500, 0x00}, // exposure H
> +	{0x3501, 0x4d}, // exposure M
> +	{0x3502, 0x40}, // exposure L
> +	{0x3503, 0x80}, // gain delay ?, exposure delay 1 frame, real gain
> +	{0x3505, 0x80}, // gain option
> +	{0x3508, 0x02}, // gain H
> +	{0x3509, 0x00}, // gain L
> +	{0x350c, 0x00}, // short gain H
> +	{0x350d, 0x80}, // short gain L
> +	{0x3510, 0x00}, // short exposure H
> +	{0x3511, 0x02}, // short exposure M
> +	{0x3512, 0x00}, // short exposure L
> +	{0x3700, 0x18},
> +	{0x3701, 0x0c},
> +	{0x3702, 0x28},
> +	{0x3703, 0x19},
> +	{0x3704, 0x14},
> +	{0x3705, 0x00},
> +	{0x3706, 0x82},
> +	{0x3707, 0x04},
> +	{0x3708, 0x24},
> +	{0x3709, 0x33},
> +	{0x370a, 0x01},
> +	{0x370b, 0x82},
> +	{0x370c, 0x04},
> +	{0x3718, 0x12},
> +	{0x3719, 0x31},
> +	{0x3712, 0x42},
> +	{0x3714, 0x24},
> +	{0x371e, 0x19},
> +	{0x371f, 0x40},
> +	{0x3720, 0x05},
> +	{0x3721, 0x05},
> +	{0x3724, 0x06},
> +	{0x3725, 0x01},
> +	{0x3726, 0x06},
> +	{0x3728, 0x05},
> +	{0x3729, 0x02},
> +	{0x372a, 0x03},
> +	{0x372b, 0x53},
> +	{0x372c, 0xa3},
> +	{0x372d, 0x53},
> +	{0x372e, 0x06},
> +	{0x372f, 0x10},
> +	{0x3730, 0x01},
> +	{0x3731, 0x06},
> +	{0x3732, 0x14},
> +	{0x3733, 0x10},
> +	{0x3734, 0x40},
> +	{0x3736, 0x20},
> +	{0x373a, 0x05},
> +	{0x373b, 0x06},
> +	{0x373c, 0x0a},
> +	{0x373e, 0x03},
> +	{0x3750, 0x0a},
> +	{0x3751, 0x0e},
> +	{0x3755, 0x10},
> +	{0x3758, 0x00},
> +	{0x3759, 0x4c},
> +	{0x375a, 0x06},
> +	{0x375b, 0x13},
> +	{0x375c, 0x20},
> +	{0x375d, 0x02},
> +	{0x375e, 0x00},
> +	{0x375f, 0x14},
> +	{0x3768, 0x22},
> +	{0x3769, 0x44},
> +	{0x376a, 0x44},
> +	{0x3761, 0x00},
> +	{0x3762, 0x00},
> +	{0x3763, 0x00},
> +	{0x3766, 0xff},
> +	{0x376b, 0x00},
> +	{0x3772, 0x23},
> +	{0x3773, 0x02},
> +	{0x3774, 0x16},
> +	{0x3775, 0x12},
> +	{0x3776, 0x04},
> +	{0x3777, 0x00},
> +	{0x3778, 0x17},
> +	{0x37a0, 0x44},
> +	{0x37a1, 0x3d},
> +	{0x37a2, 0x3d},
> +	{0x37a3, 0x00},
> +	{0x37a4, 0x00},
> +	{0x37a5, 0x00},
> +	{0x37a6, 0x00},
> +	{0x37a7, 0x44},
> +	{0x37a8, 0x4c},
> +	{0x37a9, 0x4c},
> +	{0x3760, 0x00},
> +	{0x376f, 0x01},
> +	{0x37aa, 0x44},
> +	{0x37ab, 0x2e},
> +	{0x37ac, 0x2e},
> +	{0x37ad, 0x33},
> +	{0x37ae, 0x0d},
> +	{0x37af, 0x0d},
> +	{0x37b0, 0x00},
> +	{0x37b1, 0x00},
> +	{0x37b2, 0x00},
> +	{0x37b3, 0x42},
> +	{0x37b4, 0x42},
> +	{0x37b5, 0x31},
> +	{0x37b6, 0x00},
> +	{0x37b7, 0x00},
> +	{0x37b8, 0x00},
> +	{0x37b9, 0xff},
> +	{0x3800, 0x00}, // x start H
> +	{0x3801, 0x0c}, // x start L
> +	{0x3802, 0x00}, // y start H
> +	{0x3803, 0x0c}, // y start L
> +	{0x3804, 0x0c}, // x end H
> +	{0x3805, 0xd3}, // x end L
> +	{0x3806, 0x09}, // y end H
> +	{0x3807, 0xa3}, // y end L
> +	{0x3808, 0x06}, // x output size H
> +	{0x3809, 0x60}, // x output size L
> +	{0x380a, 0x04}, // y output size H
> +	{0x380b, 0xc8}, // y output size L
> +	{0x380c, 0x07}, // HTS H
> +	{0x380d, 0x88}, // HTS L
> +	{0x380e, 0x04}, // VTS H
> +	{0x380f, 0xdc}, // VTS L
> +	{0x3810, 0x00}, // ISP x win H
> +	{0x3811, 0x04}, // ISP x win L
> +	{0x3813, 0x02}, // ISP y win L
> +	{0x3814, 0x03}, // x odd inc
> +	{0x3815, 0x01}, // x even inc
> +	{0x3820, 0x00}, // vflip off
> +	{0x3821, 0x67}, // mirror on, bin on
> +	{0x382a, 0x03}, // y odd inc
> +	{0x382b, 0x01}, // y even inc
> +	{0x3830, 0x08}, //
> +	{0x3836, 0x02}, //
> +	{0x3837, 0x18}, //
> +	{0x3841, 0xff}, // window auto size enable
> +	{0x3846, 0x48}, //
> +	{0x3d85, 0x16}, // OTP power up load data enable with BIST
> +	{0x3d8c, 0x73}, // OTP setting start High
> +	{0x3d8d, 0xde}, // OTP setting start Low
> +	{0x3f08, 0x08}, //
> +	{0x3f0a, 0x00}, //
> +	{0x4000, 0xf1}, // out_range_trig, format_chg_trig
> +	{0x4001, 0x10}, // total 128 black column
> +	{0x4005, 0x10}, // BLC target L
> +	{0x4002, 0x27}, // value used to limit BLC offset
> +	{0x4009, 0x81}, // final BLC offset limitation enable
> +	{0x400b, 0x0c}, // DCBLC on, DCBLC manual mode on
> +	{0x401b, 0x00}, // zero line R coefficient
> +	{0x401d, 0x00}, // zoro line T coefficient
> +	{0x4020, 0x00}, // Anchor left start H
> +	{0x4021, 0x04}, // Anchor left start L
> +	{0x4022, 0x06}, // Anchor left end H
> +	{0x4023, 0x00}, // Anchor left end L
> +	{0x4024, 0x0f}, // Anchor right start H
> +	{0x4025, 0x2a}, // Anchor right start L
> +	{0x4026, 0x0f}, // Anchor right end H
> +	{0x4027, 0x2b}, // Anchor right end L
> +	{0x4028, 0x00}, // top zero line start
> +	{0x4029, 0x02}, // top zero line number
> +	{0x402a, 0x04}, // top black line start
> +	{0x402b, 0x04}, // top black line number
> +	{0x402c, 0x00}, // bottom zero line start
> +	{0x402d, 0x02}, // bottom zoro line number
> +	{0x402e, 0x04}, // bottom black line start
> +	{0x402f, 0x04}, // bottom black line number
> +	{0x401f, 0x00}, // interpolation x/y disable, Anchor one disable
> +	{0x4034, 0x3f}, //
> +	{0x403d, 0x04}, // md_precision_en
> +	{0x4300, 0xff}, // clip max H
> +	{0x4301, 0x00}, // clip min H
> +	{0x4302, 0x0f}, // clip min L, clip max L
> +	{0x4316, 0x00}, //
> +	{0x4500, 0x58}, //
> +	{0x4503, 0x18}, //
> +	{0x4600, 0x00}, //
> +	{0x4601, 0xcb}, //
> +	{0x481f, 0x32}, // clk prepare min
> +	{0x4837, 0x16}, // global timing
> +	{0x4850, 0x10}, // lane 1 = 1, lane 0 = 0
> +	{0x4851, 0x32}, // lane 3 = 3, lane 2 = 2
> +	{0x4b00, 0x2a}, //
> +	{0x4b0d, 0x00}, //
> +	{0x4d00, 0x04}, // temperature sensor
> +	{0x4d01, 0x18}, //
> +	{0x4d02, 0xc3}, //
> +	{0x4d03, 0xff}, //
> +	{0x4d04, 0xff}, //
> +	{0x4d05, 0xff}, // temperature sensor
> +	{0x5000, 0xfe}, // lenc on, slave/master AWB gain/statistics enable
> +	{0x5001, 0x01}, // BLC on
> +	{0x5002, 0x08}, // H scale off, WBMATCH off, OTP_DPC
> +	{0x5003, 0x20}, // DPC_DBC buffer control enable, WB
> +	{0x501e, 0x93}, // enable digital gain
> +	{0x5046, 0x12}, //
> +	{0x5780, 0x3e}, // DPC
> +	{0x5781, 0x0f}, //
> +	{0x5782, 0x44}, //
> +	{0x5783, 0x02}, //
> +	{0x5784, 0x01}, //
> +	{0x5785, 0x00}, //
> +	{0x5786, 0x00}, //
> +	{0x5787, 0x04}, //
> +	{0x5788, 0x02}, //
> +	{0x5789, 0x0f}, //
> +	{0x578a, 0xfd}, //
> +	{0x578b, 0xf5}, //
> +	{0x578c, 0xf5}, //
> +	{0x578d, 0x03}, //
> +	{0x578e, 0x08}, //
> +	{0x578f, 0x0c}, //
> +	{0x5790, 0x08}, //
> +	{0x5791, 0x04}, //
> +	{0x5792, 0x00}, //
> +	{0x5793, 0x52}, //
> +	{0x5794, 0xa3}, // DPC
> +	{0x5871, 0x0d}, // Lenc
> +	{0x5870, 0x18}, //
> +	{0x586e, 0x10}, //
> +	{0x586f, 0x08}, //
> +	{0x58f7, 0x01}, //
> +	{0x58f8, 0x3d}, // Lenc
> +	{0x5901, 0x00}, // H skip off, V skip off
> +	{0x5b00, 0x02}, // OTP DPC start address
> +	{0x5b01, 0x10}, // OTP DPC start address
> +	{0x5b02, 0x03}, // OTP DPC end address
> +	{0x5b03, 0xcf}, // OTP DPC end address
> +	{0x5b05, 0x6c}, // recover method = 2b11,
> +	{0x5e00, 0x00}, // use 0x3ff to test pattern off
> +	{0x5e01, 0x41}, // window cut enable
> +	{0x382d, 0x7f}, //
> +	{0x4825, 0x3a}, // lpx_p_min
> +	{0x4826, 0x40}, // hs_prepare_min
> +	{0x4808, 0x25}, // wake up delay in 1/1024 s
> +	{0x3763, 0x18}, //
> +	{0x3768, 0xcc}, //
> +	{0x470b, 0x28}, //
> +	{0x4202, 0x00}, //
> +	{0x400d, 0x10}, // BLC offset trigger L
> +	{0x4040, 0x04}, // BLC gain th2
> +	{0x403e, 0x04}, // BLC gain th1
> +	{0x4041, 0xc6}, // BLC
> +	{0x3007, 0x80},
> +	{0x400a, 0x01},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 30fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_1632x1224_regs_2lane[] = {
> +	// MIPI=720Mbps, SysClk=144Mhz,Dac Clock=360Mhz.
> +	//
> +	// MIPI=720Mbps, SysClk=144Mhz,Dac Clock=360Mhz.
> +	//
> +	//
> +	// v00_01_00 (05/29/2014) : initial setting
> +	//
> +	// AM19 : 3617 <- 0xC0
> +	//
> +	// AM20 : change FWC_6K_EN to be default 0x3618=0x5a
> +	{0x0100, 0x00},
> +	{0x3501, 0x4d}, // exposure M
> +	{0x3502, 0x40}, // exposure L
> +	{0x3778, 0x17}, //
> +	{0x3808, 0x06}, // x output size H
> +	{0x3809, 0x60}, // x output size L
> +	{0x380a, 0x04}, // y output size H
> +	{0x380b, 0xc8}, // y output size L
> +	{0x380c, 0x07}, // HTS H
> +	{0x380d, 0x88}, // HTS L
> +	{0x380e, 0x04}, // VTS H
> +	{0x380f, 0xdc}, // VTS L
> +	{0x3814, 0x03}, // x odd inc
> +	{0x3821, 0x67}, // mirror on, bin on
> +	{0x382a, 0x03}, // y odd inc
> +	{0x3830, 0x08},
> +	{0x3836, 0x02},
> +	{0x3f0a, 0x00},
> +	{0x4001, 0x10}, // total 128 black column
> +	{0x4022, 0x06}, // Anchor left end H
> +	{0x4023, 0x00}, // Anchor left end L
> +	{0x4025, 0x2a}, // Anchor right start L
> +	{0x4027, 0x2b}, // Anchor right end L
> +	{0x402b, 0x04}, // top black line number
> +	{0x402f, 0x04}, // bottom black line number
> +	{0x4500, 0x58},
> +	{0x4600, 0x00},
> +	{0x4601, 0xcb},
> +	{0x382d, 0x7f},
> +	{0x0100, 0x01},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 15fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_3264x2448_regs_2lane[] = {
> +	{0x0100, 0x00},
> +	{0x3501, 0x9a},// exposure M
> +	{0x3502, 0x20},// exposure L
> +	{0x3778, 0x1a},//
> +	{0x3808, 0x0c},// x output size H
> +	{0x3809, 0xc0},// x output size L
> +	{0x380a, 0x09},// y output size H
> +	{0x380b, 0x90},// y output size L
> +	{0x380c, 0x07},// HTS H
> +	{0x380d, 0x94},// HTS L
> +	{0x380e, 0x09},// VTS H
> +	{0x380f, 0xaa},// VTS L
> +	{0x3814, 0x01},// x odd inc
> +	{0x3821, 0x46},// mirror on, bin off
> +	{0x382a, 0x01},// y odd inc
> +	{0x3830, 0x06},
> +	{0x3836, 0x01},
> +	{0x3f0a, 0x00},
> +	{0x4001, 0x00},// total 256 black column
> +	{0x4022, 0x0c},// Anchor left end H
> +	{0x4023, 0x60},// Anchor left end L
> +	{0x4025, 0x36},// Anchor right start L
> +	{0x4027, 0x37},// Anchor right end L
> +	{0x402b, 0x08},// top black line number
> +	{0x402f, 0x08},// bottom black line number
> +	{0x4500, 0x58},
> +	{0x4600, 0x01},
> +	{0x4601, 0x97},
> +	{0x382d, 0xff},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + */
> +static const struct regval ov8858_global_regs_r2a_4lane[] = {

Ah so there's 4 lanes mode support. Careful about the above mentioned
PIXEL_RATE calculation


> +	//
> +	// MIPI=720Mbps, SysClk=144Mhz,Dac Clock=360Mhz.
> +	//
> +	// v00_01_00 (05/29/2014) : initial setting
> +	//
> +	// AM19 : 3617 <- 0xC0
> +	//
> +	// AM20 : change FWC_6K_EN to be default 0x3618=0x5a
> +	{0x0103, 0x01}, // software reset for OVTATool only
> +	{0x0103, 0x01}, // software reset
> +	{0x0100, 0x00}, // software standby
> +	{0x0302, 0x1e}, // pll1_multi
> +	{0x0303, 0x00}, // pll1_divm
> +	{0x0304, 0x03}, // pll1_div_mipi
> +	{0x030e, 0x00}, // pll2_rdiv
> +	{0x030f, 0x04}, // pll2_divsp
> +	{0x0312, 0x01}, // pll2_pre_div0, pll2_r_divdac
> +	{0x031e, 0x0c}, // pll1_no_lat
> +	{0x3600, 0x00},
> +	{0x3601, 0x00},
> +	{0x3602, 0x00},
> +	{0x3603, 0x00},
> +	{0x3604, 0x22},
> +	{0x3605, 0x20},
> +	{0x3606, 0x00},
> +	{0x3607, 0x20},
> +	{0x3608, 0x11},
> +	{0x3609, 0x28},
> +	{0x360a, 0x00},
> +	{0x360b, 0x05},
> +	{0x360c, 0xd4},
> +	{0x360d, 0x40},
> +	{0x360e, 0x0c},
> +	{0x360f, 0x20},
> +	{0x3610, 0x07},
> +	{0x3611, 0x20},
> +	{0x3612, 0x88},
> +	{0x3613, 0x80},
> +	{0x3614, 0x58},
> +	{0x3615, 0x00},
> +	{0x3616, 0x4a},
> +	{0x3617, 0x90},
> +	{0x3618, 0x5a},
> +	{0x3619, 0x70},
> +	{0x361a, 0x99},
> +	{0x361b, 0x0a},
> +	{0x361c, 0x07},
> +	{0x361d, 0x00},
> +	{0x361e, 0x00},
> +	{0x361f, 0x00},
> +	{0x3638, 0xff},
> +	{0x3633, 0x0f},
> +	{0x3634, 0x0f},
> +	{0x3635, 0x0f},
> +	{0x3636, 0x12},
> +	{0x3645, 0x13},
> +	{0x3646, 0x83},
> +	{0x364a, 0x07},
> +	{0x3015, 0x01}, //
> +	{0x3018, 0x72}, // MIPI 4 lane
> +	{0x3020, 0x93}, // Clock switch output normal, pclk_div =/1
> +	{0x3022, 0x01}, // pd_mipi enable when rst_sync
> +	{0x3031, 0x0a}, // MIPI 10-bit mode
> +	{0x3034, 0x00}, //
> +	{0x3106, 0x01}, // sclk_div, sclk_pre_div
> +	{0x3305, 0xf1},
> +	{0x3308, 0x00},
> +	{0x3309, 0x28},
> +	{0x330a, 0x00},
> +	{0x330b, 0x20},
> +	{0x330c, 0x00},
> +	{0x330d, 0x00},
> +	{0x330e, 0x00},
> +	{0x330f, 0x40},
> +	{0x3307, 0x04},
> +	{0x3500, 0x00}, // exposure H
> +	{0x3501, 0x4d}, // exposure M
> +	{0x3502, 0x40}, // exposure L
> +	{0x3503, 0x80}, // gain delay ?, exposure delay 1 frame, real gain
> +	{0x3505, 0x80}, // gain option
> +	{0x3508, 0x04}, // gain H
> +	{0x3509, 0x00}, // gain L
> +	{0x350c, 0x00}, // short gain H
> +	{0x350d, 0x80}, // short gain L
> +	{0x3510, 0x00}, // short exposure H
> +	{0x3511, 0x02}, // short exposure M
> +	{0x3512, 0x00}, // short exposure L
> +	{0x3700, 0x30},
> +	{0x3701, 0x18},
> +	{0x3702, 0x50},
> +	{0x3703, 0x32},
> +	{0x3704, 0x28},
> +	{0x3705, 0x00},
> +	{0x3706, 0x82},
> +	{0x3707, 0x08},
> +	{0x3708, 0x48},
> +	{0x3709, 0x66},
> +	{0x370a, 0x01},
> +	{0x370b, 0x82},
> +	{0x370c, 0x07},
> +	{0x3718, 0x14},
> +	{0x3719, 0x31},
> +	{0x3712, 0x44},
> +	{0x3714, 0x24},
> +	{0x371e, 0x31},
> +	{0x371f, 0x7f},
> +	{0x3720, 0x0a},
> +	{0x3721, 0x0a},
> +	{0x3724, 0x0c},
> +	{0x3725, 0x02},
> +	{0x3726, 0x0c},
> +	{0x3728, 0x0a},
> +	{0x3729, 0x03},
> +	{0x372a, 0x06},
> +	{0x372b, 0xa6},
> +	{0x372c, 0xa6},
> +	{0x372d, 0xa6},
> +	{0x372e, 0x0c},
> +	{0x372f, 0x20},
> +	{0x3730, 0x02},
> +	{0x3731, 0x0c},
> +	{0x3732, 0x28},
> +	{0x3733, 0x10},
> +	{0x3734, 0x40},
> +	{0x3736, 0x30},
> +	{0x373a, 0x0a},
> +	{0x373b, 0x0b},
> +	{0x373c, 0x14},
> +	{0x373e, 0x06},
> +	{0x3750, 0x0a},
> +	{0x3751, 0x0e},
> +	{0x3755, 0x10},
> +	{0x3758, 0x00},
> +	{0x3759, 0x4c},
> +	{0x375a, 0x0c},
> +	{0x375b, 0x26},
> +	{0x375c, 0x20},
> +	{0x375d, 0x04},
> +	{0x375e, 0x00},
> +	{0x375f, 0x28},
> +	{0x3768, 0x22},
> +	{0x3769, 0x44},
> +	{0x376a, 0x44},
> +	{0x3761, 0x00},
> +	{0x3762, 0x00},
> +	{0x3763, 0x00},
> +	{0x3766, 0xff},
> +	{0x376b, 0x00},
> +	{0x3772, 0x46},
> +	{0x3773, 0x04},
> +	{0x3774, 0x2c},
> +	{0x3775, 0x13},
> +	{0x3776, 0x08},
> +	{0x3777, 0x00},
> +	{0x3778, 0x17},
> +	{0x37a0, 0x88},
> +	{0x37a1, 0x7a},
> +	{0x37a2, 0x7a},
> +	{0x37a3, 0x00},
> +	{0x37a4, 0x00},
> +	{0x37a5, 0x00},
> +	{0x37a6, 0x00},
> +	{0x37a7, 0x88},
> +	{0x37a8, 0x98},
> +	{0x37a9, 0x98},
> +	{0x3760, 0x00},
> +	{0x376f, 0x01},
> +	{0x37aa, 0x88},
> +	{0x37ab, 0x5c},
> +	{0x37ac, 0x5c},
> +	{0x37ad, 0x55},
> +	{0x37ae, 0x19},
> +	{0x37af, 0x19},
> +	{0x37b0, 0x00},
> +	{0x37b1, 0x00},
> +	{0x37b2, 0x00},
> +	{0x37b3, 0x84},
> +	{0x37b4, 0x84},
> +	{0x37b5, 0x60},
> +	{0x37b6, 0x00},
> +	{0x37b7, 0x00},
> +	{0x37b8, 0x00},
> +	{0x37b9, 0xff},
> +	{0x3800, 0x00}, // x start H
> +	{0x3801, 0x0c}, // x start L
> +	{0x3802, 0x00}, // y start H
> +	{0x3803, 0x0c}, // y start L
> +	{0x3804, 0x0c}, // x end H
> +	{0x3805, 0xd3}, // x end L
> +	{0x3806, 0x09}, // y end H
> +	{0x3807, 0xa3}, // y end L
> +	{0x3808, 0x06}, // x output size H
> +	{0x3809, 0x60}, // x output size L
> +	{0x380a, 0x04}, // y output size H
> +	{0x380b, 0xc8}, // y output size L
> +	{0x380c, 0x07}, // HTS H
> +	{0x380d, 0x88}, // HTS L
> +	{0x380e, 0x04}, // VTS H
> +	{0x380f, 0xdc}, // VTS L
> +	{0x3810, 0x00}, // ISP x win H
> +	{0x3811, 0x04}, // ISP x win L
> +	{0x3813, 0x02}, // ISP y win L
> +	{0x3814, 0x03}, // x odd inc
> +	{0x3815, 0x01}, // x even inc
> +	{0x3820, 0x00}, // vflip off
> +	{0x3821, 0x67}, // mirror on, bin o
> +	{0x382a, 0x03}, // y odd inc
> +	{0x382b, 0x01}, // y even inc
> +	{0x3830, 0x08},
> +	{0x3836, 0x02},
> +	{0x3837, 0x18},
> +	{0x3841, 0xff}, // window auto size enable
> +	{0x3846, 0x48}, //
> +	{0x3d85, 0x16}, // OTP power up load data/setting enable enable
> +	{0x3d8c, 0x73}, // OTP setting start High
> +	{0x3d8d, 0xde}, // OTP setting start Low
> +	{0x3f08, 0x10}, //
> +	{0x3f0a, 0x00}, //
> +	{0x4000, 0xf1}, // out_range/format_chg/gain/exp_chg trig enable
> +	{0x4001, 0x10}, // total 128 black column
> +	{0x4005, 0x10}, // BLC target L
> +	{0x4002, 0x27}, // value used to limit BLC offset
> +	{0x4009, 0x81}, // final BLC offset limitation enable
> +	{0x400b, 0x0c}, // DCBLC on, DCBLC manual mode on
> +	{0x401b, 0x00}, // zero line R coefficient
> +	{0x401d, 0x00}, // zoro line T coefficient
> +	{0x4020, 0x00}, // Anchor left start H
> +	{0x4021, 0x04}, // Anchor left start L
> +	{0x4022, 0x06}, // Anchor left end H
> +	{0x4023, 0x00}, // Anchor left end L
> +	{0x4024, 0x0f}, // Anchor right start H
> +	{0x4025, 0x2a}, // Anchor right start L
> +	{0x4026, 0x0f}, // Anchor right end H
> +	{0x4027, 0x2b}, // Anchor right end L
> +	{0x4028, 0x00}, // top zero line start
> +	{0x4029, 0x02}, // top zero line number
> +	{0x402a, 0x04}, // top black line start
> +	{0x402b, 0x04}, // top black line number
> +	{0x402c, 0x00}, // bottom zero line start
> +	{0x402d, 0x02}, // bottom zoro line number
> +	{0x402e, 0x04}, // bottom black line start
> +	{0x402f, 0x04}, // bottom black line number
> +	{0x401f, 0x00}, // interpolation x/y disable, Anchor one disable
> +	{0x4034, 0x3f},
> +	{0x403d, 0x04}, // md_precision_en
> +	{0x4300, 0xff}, // clip max H
> +	{0x4301, 0x00}, // clip min H
> +	{0x4302, 0x0f}, // clip min L, clip max L
> +	{0x4316, 0x00},
> +	{0x4500, 0x58},
> +	{0x4503, 0x18},
> +	{0x4600, 0x00},
> +	{0x4601, 0xcb},
> +	{0x481f, 0x32}, // clk prepare min
> +	{0x4837, 0x16}, // global timing
> +	{0x4850, 0x10}, // lane 1 = 1, lane 0 = 0
> +	{0x4851, 0x32}, // lane 3 = 3, lane 2 = 2
> +	{0x4b00, 0x2a},
> +	{0x4b0d, 0x00},
> +	{0x4d00, 0x04}, // temperature sensor
> +	{0x4d01, 0x18}, //
> +	{0x4d02, 0xc3}, //
> +	{0x4d03, 0xff}, //
> +	{0x4d04, 0xff}, //
> +	{0x4d05, 0xff}, // temperature sensor
> +	{0x5000, 0xfe}, // lenc on, slave/master AWB gain/statistics enable
> +	{0x5001, 0x01}, // BLC on
> +	{0x5002, 0x08}, // WBMATCH sensor's gain, H scale/WBMATCH/OTP_DPC off
> +	{0x5003, 0x20}, // DPC_DBC buffer control enable, WB
> +	{0x501e, 0x93}, // enable digital gain
> +	{0x5046, 0x12}, //
> +	{0x5780, 0x3e}, // DPC
> +	{0x5781, 0x0f}, //
> +	{0x5782, 0x44}, //
> +	{0x5783, 0x02}, //
> +	{0x5784, 0x01}, //
> +	{0x5785, 0x00}, //
> +	{0x5786, 0x00}, //
> +	{0x5787, 0x04}, //
> +	{0x5788, 0x02}, //
> +	{0x5789, 0x0f}, //
> +	{0x578a, 0xfd}, //
> +	{0x578b, 0xf5}, //
> +	{0x578c, 0xf5}, //
> +	{0x578d, 0x03}, //
> +	{0x578e, 0x08}, //
> +	{0x578f, 0x0c}, //
> +	{0x5790, 0x08}, //
> +	{0x5791, 0x04}, //
> +	{0x5792, 0x00}, //
> +	{0x5793, 0x52}, //
> +	{0x5794, 0xa3}, // DPC
> +	{0x5871, 0x0d}, // Lenc
> +	{0x5870, 0x18}, //
> +	{0x586e, 0x10}, //
> +	{0x586f, 0x08}, //
> +	{0x58f7, 0x01}, //
> +	{0x58f8, 0x3d}, // Lenc
> +	{0x5901, 0x00}, // H skip off, V skip off
> +	{0x5b00, 0x02}, // OTP DPC start address
> +	{0x5b01, 0x10}, // OTP DPC start address
> +	{0x5b02, 0x03}, // OTP DPC end address
> +	{0x5b03, 0xcf}, // OTP DPC end address
> +	{0x5b05, 0x6c}, // recover method = 2b11
> +	{0x5e00, 0x00}, // use 0x3ff to test pattern off
> +	{0x5e01, 0x41}, // window cut enable
> +	{0x382d, 0x7f}, //
> +	{0x4825, 0x3a}, // lpx_p_min
> +	{0x4826, 0x40}, // hs_prepare_min
> +	{0x4808, 0x25}, // wake up delay in 1/1024 s
> +	{0x3763, 0x18},
> +	{0x3768, 0xcc},
> +	{0x470b, 0x28},
> +	{0x4202, 0x00},
> +	{0x400d, 0x10}, // BLC offset trigger L
> +	{0x4040, 0x04}, // BLC gain th2
> +	{0x403e, 0x04}, // BLC gain th1
> +	{0x4041, 0xc6}, // BLC
> +	{0x3007, 0x80},
> +	{0x400a, 0x01},
> +	{REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 30fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_3264x2448_regs_4lane[] = {

It would be ideal to compare the tables from the 2 lanes and 4 lanes
version as I presume they only change in the part that sets up the
lane number, possibily the PLL calculation and a few other things.

The parts common to the mode (resolution etc) should be factored out
and only the lane-specific parts should be kept separate.

Quite an invasive change, and I guess we can live with the current
implementation for a first submission.

> +	{0x0100, 0x00},
> +	{0x3501, 0x9a}, // exposure M
> +	{0x3502, 0x20}, // exposure L
> +	{0x3508, 0x02}, // gain H

This register changes between 3264x2448_2 lanes, which also set the
undocumented 0x3778 register

> +	{0x3808, 0x0c}, // x output size H
> +	{0x3809, 0xc0}, // x output size L
> +	{0x380a, 0x09}, // y output size H
> +	{0x380b, 0x90}, // y output size L
> +	{0x380c, 0x07}, // HTS H
> +	{0x380d, 0x94}, // HTS L
> +	{0x380e, 0x09}, // VTS H
> +	{0x380f, 0xaa}, // VTS L
> +	{0x3814, 0x01}, // x odd inc
> +	{0x3821, 0x46}, // mirror on, bin off
> +	{0x382a, 0x01}, // y odd inc
> +	{0x3830, 0x06},
> +	{0x3836, 0x01},
> +	{0x3f0a, 0x00},
> +	{0x4001, 0x00}, // total 256 black column
> +	{0x4022, 0x0c}, // Anchor left end H
> +	{0x4023, 0x60}, // Anchor left end L
> +	{0x4025, 0x36}, // Anchor right start L
> +	{0x4027, 0x37}, // Anchor right end L
> +	{0x402b, 0x08}, // top black line number
> +	{0x402f, 0x08}, // interpolation x/y disable, Anchor one disable
> +	{0x4500, 0x58},
> +	{0x4600, 0x01},
> +	{0x4601, 0x97},
> +	{0x382d, 0xff},

All of these are equal between the two modes and could be factored out
eventually.

> +	{REG_NULL, 0x00},
> +};
> +
> +static const struct ov8858_mode supported_modes_2lane[] = {
> +	{
> +		.width = 3264,
> +		.height = 2448,
> +		.max_fps = {
> +			.numerator = 10000,
> +			.denominator = 150000,
> +		},
> +		.exp_def = 0x09a0,
> +		.hts_def = 0x0794 * 2,
> +		.vts_def = 0x09aa,
> +		.reg_list = ov8858_3264x2448_regs_2lane,
> +	},
> +	{
> +		.width = 1632,
> +		.height = 1224,
> +		.max_fps = {
> +			.numerator = 10000,
> +			.denominator = 300000,
> +		},
> +		.exp_def = 0x04d0,
> +		.hts_def = 0x0788,

Is this missing a * 2 ?

All other modes have the HTS default value size multipled by 2 here,
which seems to suggest the HTS register should be programmed with half
the number of of pixels in a line.

The value reported in the  the 3264x2448 2 lanes mode seems to confirm this as
the numbers match the reported FPS

        0x794 * 2 * 0x9aa / OV8858_PIXEL_RATE = 0,066 msec = 15 FPS

For this mode instead

        0x788 * 0x04dc / OV8858_PIXEL_RATE = 0,016 msec = 60 FSP

Which seems to be two times the reported 30FPS rate.

As hts_def is used to populate the CID_HBLANK control and userspace
will use it to calculate the frame duration, I think the above value
should be multiplied by 2 as well ? The reister values seems fine..

Could you check how many FPS do you get with this mode, if it works ?

> +		.vts_def = 0x04dc,
> +		.reg_list = ov8858_1632x1224_regs_2lane,
> +	},
> +};
> +
> +static const struct ov8858_mode supported_modes_4lane[] = {
> +	{
> +		.width = 3264,
> +		.height = 2448,
> +		.max_fps = {
> +			.numerator = 10000,
> +			.denominator = 300000,
> +		},
> +		.exp_def = 0x09a0,
> +		.hts_def = 0x0794 * 2,
> +		.vts_def = 0x09aa,
> +		.reg_list = ov8858_3264x2448_regs_4lane,
> +	},
> +};

Give how small are the differences between the full res 2 lanes and 4
lanes mode I would try to move the two register differences in the
general 2_lanes and 4_lanes register blobs and remove
supported_modes_4lane[]

> +
> +static const struct ov8858_mode *supported_modes;

So that you can remove this one as well

> +
> +static const s64 link_freq_menu_items[] = {
> +	MIPI_FREQ
> +};
> +
> +static const char * const ov8858_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color Bar Type 1",
> +	"Vertical Color Bar Type 2",
> +	"Vertical Color Bar Type 3",
> +	"Vertical Color Bar Type 4"
> +};
> +
> +/* Write registers up to 4 at a time */
> +static int ov8858_write_reg(struct i2c_client *client, u16 reg,
> +			    u32 len, u32 val)
> +{
> +	u32 buf_i, val_i;
> +	u8 buf[6];
> +	u8 *val_p;
> +	__be32 val_be;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	buf[0] = reg >> 8;
> +	buf[1] = reg & 0xff;
> +
> +	val_be = cpu_to_be32(val);
> +	val_p = (u8 *)&val_be;
> +	buf_i = 2;
> +	val_i = 4 - len;
> +
> +	while (val_i < 4)
> +		buf[buf_i++] = val_p[val_i++];
> +
> +	if (i2c_master_send(client, buf, len + 2) != len + 2)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int ov8858_write_array(struct i2c_client *client,
> +			      const struct regval *regs)
> +{
> +	u32 i;
> +	int ret = 0;
> +
> +	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
> +		ret = ov8858_write_reg(client, regs[i].addr,
> +					OV8858_REG_VALUE_08BIT,
> +					regs[i].val);
> +
> +	return ret;
> +}
> +
> +/* Read registers up to 4 at a time */
> +static int ov8858_read_reg(struct i2c_client *client, u16 reg,
> +			   unsigned int len, u32 *val)
> +{
> +	struct i2c_msg msgs[2];
> +	u8 *data_be_p;
> +	__be32 data_be = 0;
> +	__be16 reg_addr_be = cpu_to_be16(reg);
> +	int ret;
> +
> +	if (len > 4 || !len)
> +		return -EINVAL;
> +
> +	data_be_p = (u8 *)&data_be;
> +	/* Write register address */
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 2;
> +	msgs[0].buf = (u8 *)&reg_addr_be;
> +
> +	/* Read data from register */
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_be_p[4 - len];
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	*val = be32_to_cpu(data_be);
> +
> +	return 0;
> +}
> +
> +static int ov8858_get_reso_dist(const struct ov8858_mode *mode,
> +				struct v4l2_mbus_framefmt *framefmt)
> +{
> +	return abs(mode->width - framefmt->width) +
> +	       abs(mode->height - framefmt->height);
> +}
> +
> +static const struct ov8858_mode *
> +ov8858_find_best_fit(struct ov8858 *ov8858,
> +		     struct v4l2_subdev_format *fmt)

v4l2 has v4l2_find_nearest_size().
It would be nice to see if it can be used to reduce the amount of
driver-specific code

> +{
> +	struct v4l2_mbus_framefmt *framefmt = &fmt->format;
> +	int dist;
> +	int cur_best_fit = 0;
> +	int cur_best_fit_dist = -1;
> +	unsigned int i;
> +
> +	for (i = 0; i < ov8858->cfg_num; i++) {
> +		dist = ov8858_get_reso_dist(&supported_modes[i], framefmt);
> +		if (cur_best_fit_dist == -1 || dist < cur_best_fit_dist) {
> +			cur_best_fit_dist = dist;
> +			cur_best_fit = i;
> +		}
> +	}
> +
> +	return &supported_modes[cur_best_fit];
> +}
> +
> +static int ov8858_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +	const struct ov8858_mode *mode;
> +	s64 h_blank, vblank_def;
> +
> +	mutex_lock(&ov8858->mutex);
> +
> +	mode = ov8858_find_best_fit(ov8858, fmt);
> +	fmt->format.code = OV8858_MEDIA_BUS_FMT;

As there's a single mbus code supported, I would use it directly and
remove the #define

> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, state, fmt->pad) = fmt->format;

Nit:
                mutex_unlock(&ov8858->mutex);
                return 0;
        }

And you can remove else {} and reduce indentation

> +	} else {
> +		ov8858->cur_mode = mode;
> +		h_blank = mode->hts_def - mode->width;
> +		__v4l2_ctrl_modify_range(ov8858->hblank, h_blank,
> +					 h_blank, 1, h_blank);
> +		vblank_def = mode->vts_def - mode->height;
> +		__v4l2_ctrl_modify_range(ov8858->vblank, vblank_def,
> +					 OV8858_VTS_MAX - mode->height,
> +					 1, vblank_def);
> +	}
> +
> +	mutex_unlock(&ov8858->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov8858_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +	const struct ov8858_mode *mode = ov8858->cur_mode;
> +
> +	mutex_lock(&ov8858->mutex);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		fmt->format = *v4l2_subdev_get_try_format(sd, state, fmt->pad);

same here

> +	} else {
> +		fmt->format.width = mode->width;
> +		fmt->format.height = mode->height;
> +		fmt->format.code = OV8858_MEDIA_BUS_FMT;
> +		fmt->format.field = V4L2_FIELD_NONE;
> +	}
> +	mutex_unlock(&ov8858->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov8858_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index != 0)
> +		return -EINVAL;
> +	code->code = OV8858_MEDIA_BUS_FMT;
> +
> +	return 0;
> +}
> +
> +static int ov8858_enum_frame_sizes(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	if (fse->index >= ov8858->cfg_num)
> +		return -EINVAL;
> +
> +	if (fse->code != OV8858_MEDIA_BUS_FMT)
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
> +static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
> +{
> +	u32 val;
> +
> +	if (pattern)
> +		val = (pattern - 1) | OV8858_TEST_PATTERN_ENABLE;
> +	else
> +		val = OV8858_TEST_PATTERN_DISABLE;
> +
> +	return ov8858_write_reg(ov8858->client,
> +				 OV8858_REG_TEST_PATTERN,
> +				 OV8858_REG_VALUE_08BIT,
> +				 val);
> +}
> +
> +static int ov8858_g_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +	const struct ov8858_mode *mode = ov8858->cur_mode;
> +
> +	mutex_lock(&ov8858->mutex);
> +	fi->interval = mode->max_fps;
> +	mutex_unlock(&ov8858->mutex);
> +
> +	return 0;
> +}

s/g_frame_interval() are deprecated. Frame duration should be
configured using blankings.

> +
> +static int __ov8858_start_stream(struct ov8858 *ov8858)
> +{
> +	int ret;
> +
> +	ret = ov8858_write_array(ov8858->client, ov8858_global_regs);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov8858_write_array(ov8858->client, ov8858->cur_mode->reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* In case these controls are set before streaming */
> +	mutex_unlock(&ov8858->mutex);
> +	ret = v4l2_ctrl_handler_setup(&ov8858->ctrl_handler);
> +	mutex_lock(&ov8858->mutex);

Maybe the unlocked __v42l_ctrl_handler_setup() version would prevent
this unlock/lock sequence

> +	if (ret)
> +		return ret;
> +
> +	return ov8858_write_reg(ov8858->client,
> +				OV8858_REG_CTRL_MODE,
> +				OV8858_REG_VALUE_08BIT,
> +				OV8858_MODE_STREAMING);
> +}
> +
> +static int __ov8858_stop_stream(struct ov8858 *ov8858)
> +{
> +	return ov8858_write_reg(ov8858->client,
> +				OV8858_REG_CTRL_MODE,
> +				OV8858_REG_VALUE_08BIT,
> +				OV8858_MODE_SW_STANDBY);
> +}
> +
> +static int ov8858_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +	struct i2c_client *client = ov8858->client;
> +	int ret = 0;
> +
> +	mutex_lock(&ov8858->mutex);
> +	on = !!on;
> +	if (on == ov8858->streaming)
> +		goto unlock_and_return;
> +
> +	if (on) {
> +		ret = pm_runtime_get_sync(&client->dev);

pm_runtime_resume_and_get() should be used to avoid decresing the pm
usage count in case of errors

See as an example
a959a7bf3b93 ("media: i2c: video-i2c: use pm_runtime_resume_and_get()")

> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		ret = __ov8858_start_stream(ov8858);
> +		if (ret) {
> +			v4l2_err(sd, "start stream failed while write regs\n");

Please move to use dev_dbg/dev_err as AFAIK v4l2_dbg/v4l2_err are
deprecated

> +			pm_runtime_put(&client->dev);
> +			goto unlock_and_return;
> +		}
> +	} else {
> +		__ov8858_stop_stream(ov8858);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov8858->streaming = on;
> +
> +unlock_and_return:
> +	mutex_unlock(&ov8858->mutex);
> +
> +	return ret;
> +}
> +
> +/* Calculate the delay in us by clock rate and clock cycles */
> +static inline u32 ov8858_cal_delay(u32 cycles)
> +{
> +	return DIV_ROUND_UP(cycles, OV8858_XVCLK_FREQ / 1000 / 1000);
> +}
> +
> +static int __ov8858_power_on(struct ov8858 *ov8858)
> +{
> +	int ret;
> +	u32 delay_us;
> +	struct device *dev = &ov8858->client->dev;
> +
> +	if (!IS_ERR_OR_NULL(ov8858->pins_default)) {

As far as I can see pins_default is never set and should probably not
be here as pinmuxing should be handled by device tree. Please drop
this part.

> +		ret = pinctrl_select_state(ov8858->pinctrl,
> +					   ov8858->pins_default);
> +		if (ret < 0)
> +			dev_err(dev, "could not set pins\n");
> +	}
> +
> +	ret = clk_set_rate(ov8858->xvclk, OV8858_XVCLK_FREQ);
> +	if (ret < 0)
> +		dev_warn(dev, "Failed to set xvclk rate (24MHz)\n");
> +	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
> +		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> +
> +	ret = clk_prepare_enable(ov8858->xvclk);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(OV8858_NUM_SUPPLIES, ov8858->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	mdelay(20);

That's a large delay!
Unfortunately the timing constrains in "table 2-4
power up sequence timing constraints" for the power-on/standby timings
are not characterized.

There's however a fixed 10msec delay before streaming start that
should probably be considered
> +
> +	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov8858->pwdn_gpio, 0);
> +
> +	/* 8192 cycles prior to first SCCB transaction */
> +	//delay_us = ov8858_cal_delay(8192);
> +	//usleep_range(delay_us, delay_us * 2);

This is characterized in the datasheet as 8192 clk pulses between the
reset exit and the first SCCB transaction.

> +	mdelay(10);

Could this be removed and the actual delay be used instead ?

> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(ov8858->xvclk);
> +
> +	return ret;
> +}
> +
> +static void __ov8858_power_off(struct ov8858 *ov8858)
> +{
> +	int ret;
> +	struct device *dev = &ov8858->client->dev;
> +
> +	gpiod_set_value_cansleep(ov8858->pwdn_gpio, 1);
> +	clk_disable_unprepare(ov8858->xvclk);
> +	gpiod_set_value_cansleep(ov8858->reset_gpio, 1);
> +
> +	if (!IS_ERR_OR_NULL(ov8858->pins_sleep)) {
> +		ret = pinctrl_select_state(ov8858->pinctrl,
> +					   ov8858->pins_sleep);
> +		if (ret < 0)
> +			dev_dbg(dev, "could not set pins\n");
> +	}

Please drop for the above mentioned reason

> +
> +	regulator_bulk_disable(OV8858_NUM_SUPPLIES, ov8858->supplies);
> +}
> +
> +static int ov8858_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	return __ov8858_power_on(ov8858);
> +}
> +
> +static int ov8858_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	__ov8858_power_off(ov8858);
> +
> +	return 0;
> +}
> +
> +static int ov8858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +	struct v4l2_mbus_framefmt *try_fmt =
> +				v4l2_subdev_get_try_format(sd, fh->state, 0);
> +	const struct ov8858_mode *def_mode = &supported_modes[0];
> +
> +	mutex_lock(&ov8858->mutex);
> +	/* Initialize try_fmt */
> +	try_fmt->width = def_mode->width;
> +	try_fmt->height = def_mode->height;
> +	try_fmt->code = OV8858_MEDIA_BUS_FMT;
> +	try_fmt->field = V4L2_FIELD_NONE;
> +
> +	mutex_unlock(&ov8858->mutex);
> +	/* No crop or compose */

They should probably be added, but I'm fine doing it on top

> +
> +	return 0;
> +}
> +
> +static int ov8858_enum_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_frame_interval_enum *fie)
> +{
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	if (fie->index >= ov8858->cfg_num)
> +		return -EINVAL;
> +
> +	if (fie->code != OV8858_MEDIA_BUS_FMT)
> +		return -EINVAL;
> +
> +	fie->width = supported_modes[fie->index].width;
> +	fie->height = supported_modes[fie->index].height;
> +	fie->interval = supported_modes[fie->index].max_fps;
> +	return 0;
> +}

Let alone the function definition is a bit out of place, as callbacks
for the subdev operations are above defined, but I would drop this for
the reasons explained in s/g_frame_interval

> +
> +static const struct dev_pm_ops ov8858_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov8858_runtime_suspend,
> +			   ov8858_runtime_resume, NULL)
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov8858_internal_ops = {
> +	.open = ov8858_open,
> +};
> +
> +static const struct v4l2_subdev_video_ops ov8858_video_ops = {
> +	.s_stream = ov8858_s_stream,
> +	.g_frame_interval = ov8858_g_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov8858_pad_ops = {
> +	.enum_mbus_code = ov8858_enum_mbus_code,
> +	.enum_frame_size = ov8858_enum_frame_sizes,
> +	.enum_frame_interval = ov8858_enum_frame_interval,
> +	.get_fmt = ov8858_get_fmt,
> +	.set_fmt = ov8858_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops ov8858_subdev_ops = {
> +	.video	= &ov8858_video_ops,
> +	.pad	= &ov8858_pad_ops,
> +};
> +
> +static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov8858 *ov8858 = container_of(ctrl->handler,
> +					     struct ov8858, ctrl_handler);
> +	struct i2c_client *client = ov8858->client;
> +	s64 max;
> +	int ret = 0;

No need to initialize

> +
> +	/* Propagate change of current control to all related controls */
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update max exposure while meeting expected vblanking */
> +		max = ov8858->cur_mode->height + ctrl->val - 4;
> +		__v4l2_ctrl_modify_range(ov8858->exposure,
> +					 ov8858->exposure->minimum, max,
> +					 ov8858->exposure->step,
> +					 ov8858->exposure->default_value);
> +		break;
> +	}
> +
> +	if (pm_runtime_get(&client->dev) <= 0)
> +		return 0;

Please do not power up the device when a control is set.

You should here use

        if (!pm_runtime_get_if_in_use(&client->dev))
                return 0;

The controls values are retained by the v4l2 core, and you will call
__v4l2_ctrl_handler_setup() at s_stream() time when the device has
already been powered up and you'll setup controls just before starting
the streaming.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		/* 4 least significant bits of expsoure are fractional part */
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_EXPOSURE,
> +					OV8858_REG_VALUE_24BIT,
> +					ctrl->val << 4);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_GAIN_H,
> +					OV8858_REG_VALUE_08BIT,
> +					(ctrl->val >> OV8858_GAIN_H_SHIFT) &
> +					OV8858_GAIN_H_MASK);
> +		ret |= ov8858_write_reg(ov8858->client,
> +					OV8858_REG_GAIN_L,
> +					OV8858_REG_VALUE_08BIT,
> +					ctrl->val & OV8858_GAIN_L_MASK);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_DGAIN_H,
> +					OV8858_REG_VALUE_08BIT,
> +					(ctrl->val >> OV8858_DGAIN_H_SHIFT) &
> +					OV8858_DGAIN_H_MASK);
> +		ret |= ov8858_write_reg(ov8858->client,
> +					OV8858_REG_DGAIN_L,
> +					OV8858_REG_VALUE_08BIT,
> +					ctrl->val & OV8858_DGAIN_L_MASK);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_VTS,
> +					OV8858_REG_VALUE_16BIT,
> +					ctrl->val + ov8858->cur_mode->height);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov8858_enable_test_pattern(ov8858, ctrl->val);
> +		break;
> +	default:

                ret = -EINVAL;

> +		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov8858_ctrl_ops = {
> +	.s_ctrl = ov8858_set_ctrl,
> +};
> +
> +static int ov8858_initialize_controls(struct ov8858 *ov8858)
> +{
> +	const struct ov8858_mode *mode;
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	s64 exposure_max, vblank_def;
> +	u32 h_blank;
> +	int ret;
> +
> +	handler = &ov8858->ctrl_handler;
> +	mode = ov8858->cur_mode;
> +	ret = v4l2_ctrl_handler_init(handler, 8);
> +	if (ret)
> +		return ret;
> +	handler->lock = &ov8858->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> +				      0, 0, link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  0, ov8858->pixel_rate, 1, ov8858->pixel_rate);
> +
> +	h_blank = mode->hts_def - mode->width;
> +	ov8858->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> +				h_blank, h_blank, 1, h_blank);
> +	if (ov8858->hblank)
> +		ov8858->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	ov8858->vblank = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_VBLANK, vblank_def,
> +				OV8858_VTS_MAX - mode->height,
> +				1, vblank_def);
> +
> +	exposure_max = mode->vts_def - 4;
> +	ov8858->exposure = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_EXPOSURE, OV8858_EXPOSURE_MIN,
> +				exposure_max, OV8858_EXPOSURE_STEP,
> +				mode->exp_def);
> +
> +	ov8858->anal_gain = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_ANALOGUE_GAIN, OV8858_GAIN_MIN,
> +				OV8858_GAIN_MAX, OV8858_GAIN_STEP,
> +				OV8858_GAIN_DEFAULT);
> +
> +	ov8858->digi_gain = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_DIGITAL_GAIN, OV8858_DGAIN_MIN,
> +				OV8858_DGAIN_MAX, OV8858_DGAIN_STEP,
> +				OV8858_DGAIN_DEFAULT);
> +
> +	ov8858->test_pattern = v4l2_ctrl_new_std_menu_items(handler,
> +				&ov8858_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +				ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> +				0, 0, ov8858_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(&ov8858->client->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	ov8858->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int ov8858_check_sensor_id(struct ov8858 *ov8858,
> +				   struct i2c_client *client)
> +{
> +	struct device *dev = &ov8858->client->dev;
> +	u32 id = 0;
> +	int ret;
> +
> +	ret = ov8858_read_reg(client, OV8858_REG_CHIP_ID,
> +			      OV8858_REG_VALUE_24BIT, &id);
> +	if (id != CHIP_ID) {
> +		dev_err(dev, "Unexpected sensor id(%06x), ret(%d)\n", id, ret);
> +		return ret;
> +	}
> +
> +	ret = ov8858_read_reg(client, OV8858_CHIP_REVISION_REG,
> +			      OV8858_REG_VALUE_08BIT, &id);
> +	if (ret) {
> +		dev_err(dev, "Read chip revision register error\n");
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Detected OV%06x sensor, REVISION 0x%x\n", CHIP_ID, id);
> +
> +	if (id == OV8858_R2A) {
> +		if (4 == ov8858->lane_num) {
> +			ov8858_global_regs = ov8858_global_regs_r2a_4lane;
> +		} else {
> +			ov8858_global_regs = ov8858_global_regs_r2a_2lane;
> +		}
> +
> +		ov8858->is_r2a = true;

is_r2a is never used

> +	} else {
> +		ov8858_global_regs = ov8858_global_regs_r1a;
> +		ov8858->is_r2a = false;
> +		dev_warn(dev, "R1A may not work well current!\n");

Ouch, do we even want it in this driver then ?

> +	}
> +
> +	return 0;
> +}
> +
> +static int ov8858_configure_regulators(struct ov8858 *ov8858)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < OV8858_NUM_SUPPLIES; i++)
> +		ov8858->supplies[i].supply = ov8858_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&ov8858->client->dev,
> +				       OV8858_NUM_SUPPLIES,
> +				       ov8858->supplies);
> +}
> +
> +static int ov8858_parse_of(struct ov8858 *ov8858)
> +{
> +	struct device *dev = &ov8858->client->dev;
> +	struct device_node *endpoint;
> +	struct fwnode_handle *fwnode;
> +	int rval;
> +
> +	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "Failed to get endpoint\n");
> +		return -EINVAL;
> +	}
> +
> +	fwnode = of_fwnode_handle(endpoint);
> +	rval = fwnode_property_read_u32_array(fwnode, "data-lanes", NULL, 0);

Please use

        v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), &vep)

With
        struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };

and use:
        num_lanes = vep.bus.mipi_csi2.num_data_lanes;

to know the number of lanes using standard kAPIs

Also
        of_node_put(endpoint);
after v4l2_fwnode_endpoint_parse() to balance the above get.

Many examples are available in drivers/media/i2c/


> +	if (rval <= 0) {
> +		dev_warn(dev, " Get mipi lane num failed!\n");
> +		return -1;
> +	}
> +
> +	ov8858->lane_num = rval;
> +	if (4 == ov8858->lane_num) {
> +		ov8858->cur_mode = &supported_modes_4lane[0];
> +		supported_modes = supported_modes_4lane;
> +		ov8858->cfg_num = ARRAY_SIZE(supported_modes_4lane);
> +
> +		/* pixel rate = link frequency * 2 * lanes / BITS_PER_SAMPLE */
> +		ov8858->pixel_rate = MIPI_FREQ * 2U * ov8858->lane_num / 10U;

Ah ok, OV8858_PIXEL_RATE is adjusted. The number of lanes could be
made a macro parameter then

> +		dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",
> +				 ov8858->lane_num, ov8858->pixel_rate);

dev_dbg please

> +	} else {

"else" could very well be 1 or even 3 I guess.

Please make sure the number of lanes is 2 or 4 if that's what your
driver supports.

> +		ov8858->cur_mode = &supported_modes_2lane[0];
> +		supported_modes = supported_modes_2lane;
> +		ov8858->cfg_num = ARRAY_SIZE(supported_modes_2lane);
> +
> +		/*pixel rate = link frequency * 2 * lanes / BITS_PER_SAMPLE */
> +		ov8858->pixel_rate = MIPI_FREQ * 2U * (ov8858->lane_num) / 10U;

Ah ok, OV8858_PIXEL_RATE is not even used here.

Please drop it then or make it accept the number of lanes as parameter

> +		dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",

ditto

> +				 ov8858->lane_num, ov8858->pixel_rate);
> +	}
> +	return 0;
> +}
> +
> +static int ov8858_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)

Please use .probe_new so you can remove const struct i2c_device_id
*id

> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct ov8858 *ov8858;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	ov8858 = devm_kzalloc(dev, sizeof(*ov8858), GFP_KERNEL);
> +	if (!ov8858)
> +		return -ENOMEM;
> +
> +	ov8858->client = client;
> +
> +	ov8858->xvclk = devm_clk_get(dev, "xvclk");
> +	if (IS_ERR(ov8858->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
> +				     "Failed to get xvclk\n");
> +
> +	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov8858->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	ov8858->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov8858->pwdn_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->pwdn_gpio),
> +				     "Failed to get powerdown gpio\n");
> +
> +	ret = ov8858_configure_regulators(ov8858);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get power regulators\n");
> +
> +	ret = ov8858_parse_of(ov8858);
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	mutex_init(&ov8858->mutex);
> +
> +	sd = &ov8858->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &ov8858_subdev_ops);
> +	ret = ov8858_initialize_controls(ov8858);
> +	if (ret)
> +		goto err_destroy_mutex;
> +
> +	ret = __ov8858_power_on(ov8858);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret = ov8858_check_sensor_id(ov8858, client);
> +	if (ret)
> +		goto err_power_off;
> +
> +	sd->internal_ops = &ov8858_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov8858->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sd->entity, 1, &ov8858->pad);
> +	if (ret < 0)
> +		goto err_power_off;
> +
> +	ret = v4l2_async_register_subdev_sensor(sd);
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
> +	__ov8858_power_off(ov8858);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&ov8858->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov8858_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +#ifdef CONFIG_MEDIA_CONTROLLER

You select this symbol, you can drop this

> +	media_entity_cleanup(&sd->entity);
> +#endif
> +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +	mutex_destroy(&ov8858->mutex);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		__ov8858_power_off(ov8858);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)

Should we depend on CONFIG_OF ?

> +static const struct of_device_id ov8858_of_match[] = {
> +	{ .compatible = "ovti,ov8858" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ov8858_of_match);
> +#endif
> +
> +static const struct i2c_device_id ov8858_match_id[] = {
> +	{ "ovti,ov8858", 0 },
> +	{ },
> +};

I think you can drop this one if we depend on CONFIG_OF ?

> +
> +static struct i2c_driver ov8858_i2c_driver = {
> +	.driver = {
> +		.name = OV8858_NAME,
> +		.pm = &ov8858_pm_ops,
> +		.of_match_table = of_match_ptr(ov8858_of_match),
> +	},
> +	.probe		= &ov8858_probe,

Here
        .probe_new

Thanks, lot of comments, but mostly cleanups, nothing huge or
blocking!

Thanks
  j


> +	.remove		= &ov8858_remove,
> +	.id_table	= ov8858_match_id,
> +};
> +
> +module_i2c_driver(ov8858_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov8858 sensor driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.34.1
>
