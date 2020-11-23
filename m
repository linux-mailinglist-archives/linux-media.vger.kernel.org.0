Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6813A2C03DB
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgKWLKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:10:36 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:59351 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgKWLKf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:10:35 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B3E23240031;
        Mon, 23 Nov 2020 11:10:25 +0000 (UTC)
Date:   Mon, 23 Nov 2020 12:10:29 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 2/2] media: Add imx334 camera sensor driver
Message-ID: <20201123111029.rcoxchzj332tu6y4@uno.localdomain>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com>
 <20201120142803.308-3-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120142803.308-3-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,
   thanks, a few comments below quickly skimming through the driver

On Fri, Nov 20, 2020 at 02:28:03PM +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
>
> Add a v4l2 sub-device driver for the Sony imx334 image sensor.
> This is a camera sensor using the i2c bus for control and the
> csi-2 bus for data.
>
> The following features are supported:
> - manual exposure and analog gain control support
> - vblank/hblank/pixel rate control support
> - supported resolution:
>     - 3840x2160 @ 60fps
> - supported bayer order output:
>     - SRGGB12
>
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   14 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx334.c | 1089 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1105 insertions(+)
>  create mode 100644 drivers/media/i2c/imx334.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6cfce99be4bb..24438c53861b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16326,6 +16326,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +F:	drivers/media/i2c/imx334.c
>
>  SONY IMX355 SENSOR DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 878f66ef2719..f67b7e05b796 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -813,6 +813,20 @@ config VIDEO_IMX319
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx319.
>
> +config VIDEO_IMX334
> +	tristate "Sony IMX334 sensor support"
> +	depends on OF_GPIO
> +	depends on I2C && VIDEO_V4L2
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX334 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx334.
> +
>  config VIDEO_IMX355
>  	tristate "Sony IMX355 sensor support"
>  	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index f0a77473979d..aeaeaab3783c 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -118,6 +118,7 @@ obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
>  obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
>  obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> +obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
>  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
>  rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> new file mode 100644
> index 000000000000..8fd2c1c934fd
> --- /dev/null
> +++ b/drivers/media/i2c/imx334.c
> @@ -0,0 +1,1089 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sony imx334 sensor driver
> + *
> + * Copyright (C) 2019-2020 Intel Corporation
> + */
> +#include <asm/unaligned.h>
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>

Do you need this include ?

I think you also need:

#include <linux/gpio/consumer.h>
#include <linux/of.h>

> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>

I would replace v4l2-device.h with v4l2-subdev.h being this
effectively a subdev driver

> +#include <media/v4l2-fwnode.h>

You only use v4l2_async_register_subdev_sensor_common() from fwnde.h
If you think you can replace it with v4l2_async_register_subdev() (see
below comment) this should be changed in v4l2-async.h

> +
> +#define IMX334_DRV_NAME		"imx334"

Used in a single place, not sure it's worth it.

> +
> +/* Streaming Mode */
> +#define IMX334_REG_MODE_SELECT	0x3000
> +#define IMX334_MODE_STANDBY	0x01
> +#define IMX334_MODE_STREAMING	0x00
> +
> +/* Lines per frame */
> +#define IMX334_REG_LPFR		0x3030
> +
> +#define IMX334_LPFR_MIN		0x08ca
> +#define IMX334_LPFR_MAX		0x20f58
> +
> +/* Chip ID */
> +#define IMX334_REG_ID		0x3044
> +#define IMX334_ID		0x1e00
> +
> +/* Exposure control */
> +#define IMX334_REG_SHUTTER	0x3058
> +#define IMX334_EXPOSURE_MIN	1
> +#define IMX334_EXPOSURE_OFFSET	5
> +#define IMX334_EXPOSURE_STEP	1
> +#define IMX334_EXPOSURE_DEFAULT	0x0648
> +
> +/* Analog gain control */
> +#define IMX334_REG_AGAIN	0x30e8
> +#define IMX334_AGAIN_MIN	0
> +#define IMX334_AGAIN_MAX	240
> +#define IMX334_AGAIN_STEP	1
> +#define IMX334_AGAIN_DEFAULT	0
> +
> +/* Group hold register */
> +#define IMX334_REG_HOLD		0x3001
> +
> +/* Input clock rate */
> +#define IMX334_INCLK_RATE	24000000
> +
> +#define IMX334_REG_MIN		0x00
> +#define IMX334_REG_MAX		0xfffff
> +
> +/**
> + * struct imx334_reg - imx334 sensor register
> + * @address: Register address
> + * @val: Register value
> + */
> +struct imx334_reg {
> +	u16 address;
> +	u8 val;
> +};
> +
> +/**
> + * struct imx334_reg_list - imx334 sensor register list
> + * @num_of_regs: Number of registers in the list
> + * @regs: Pointer to register list
> + */
> +struct imx334_reg_list {
> +	u32 num_of_regs;
> +	const struct imx334_reg *regs;
> +};
> +
> +/**
> + * struct imx334_mode - imx334 sensor mode structure
> + * @width: Frame width
> + * @height: Frame height
> + * @code: Format code
> + * @ppln: Pixels per line
> + * @lpfr: Lines per frame
> + * @pclk: Sensor pixel clock
> + * @reg_list: Register list for sensor mode
> + */
> +struct imx334_mode {
> +	u32 width;
> +	u32 height;
> +	u32 code;
> +	u32 ppln;
> +	u32 lpfr;
> +	u64 pclk;
> +	struct imx334_reg_list reg_list;
> +};
> +
> +/**
> + * struct imx334 - imx334 sensor device structure
> + * @dev: Pointer to generic device
> + * @client: Pointer to i2c client
> + * @sd: V4L2 sub-device
> + * @pad: Media pad. Only one pad supported
> + * @reset_gpio: Sensor reset gpio
> + * @inclk: Sensor input clock
> + * @ctrl_handler: V4L2 control handler
> + * @pclk_ctrl: Pointer to pixel clock control
> + * @hblank_ctrl: Pointer to horizontal blanking control
> + * @vblank_ctrl: Pointer to vertical blanking control
> + * @exp_ctrl: Pointer to exposure control
> + * @again_ctrl: Pointer to analog gain control
> + * @exp1_ctrl: Pointer to short exposure control
> + * @again1_ctrl: Pointer to short analog gain control
> + * @exp2_ctrl: Pointer to very short exposure control
> + * @again2_ctrl: Pointer to very short analog gain control
> + * @lpfr: Lines per frame for long exposure frame
> + * @cur_mode: Pointer to current selected sensor mode
> + * @mutex: Mutex for serializing sensor controls
> + * @streaming: Flag indicating streaming state
> + */
> +struct imx334 {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct gpio_desc *reset_gpio;
> +	struct clk *inclk;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *pclk_ctrl;
> +	struct v4l2_ctrl *hblank_ctrl;
> +	struct v4l2_ctrl *vblank_ctrl;
> +	struct {
> +		struct v4l2_ctrl *exp_ctrl;
> +		struct v4l2_ctrl *again_ctrl;
> +	};
> +	u32 lpfr;

Can't you get lpfr from the current mode you have a pointer to here
below ?

> +	const struct imx334_mode *cur_mode;
> +	struct mutex mutex;

Checkpatch wants this mutex commented, but you have documentation so I
think it's fine

> +	bool streaming;
> +};
> +
> +/* Sensor mode registers */
> +static const struct imx334_reg mode_3840x2160_regs[] = {
> +	{0x3000, 0x01},
> +	{0x3002, 0x00},
> +	{0x3018, 0x04},
> +	{0x37b0, 0x36},
> +	{0x304c, 0x00},
> +	{0x300c, 0x3b},
> +	{0x300d, 0x2a},
> +	{0x3034, 0x26},
> +	{0x3035, 0x02},
> +	{0x314c, 0x29},
> +	{0x314d, 0x01},
> +	{0x315a, 0x02},
> +	{0x3168, 0xa0},
> +	{0x316a, 0x7e},
> +	{0x3288, 0x21},
> +	{0x328a, 0x02},
> +	{0x302c, 0x3c},
> +	{0x302e, 0x00},
> +	{0x302f, 0x0f},
> +	{0x3076, 0x70},
> +	{0x3077, 0x08},
> +	{0x3090, 0x70},
> +	{0x3091, 0x08},
> +	{0x30d8, 0x20},
> +	{0x30d9, 0x12},
> +	{0x3308, 0x70},
> +	{0x3309, 0x08},
> +	{0x3414, 0x05},
> +	{0x3416, 0x18},
> +	{0x35ac, 0x0e},
> +	{0x3648, 0x01},
> +	{0x364a, 0x04},
> +	{0x364c, 0x04},
> +	{0x3678, 0x01},
> +	{0x367c, 0x31},
> +	{0x367e, 0x31},
> +	{0x3708, 0x02},
> +	{0x3714, 0x01},
> +	{0x3715, 0x02},
> +	{0x3716, 0x02},
> +	{0x3717, 0x02},
> +	{0x371c, 0x3d},
> +	{0x371d, 0x3f},
> +	{0x372c, 0x00},
> +	{0x372d, 0x00},
> +	{0x372e, 0x46},
> +	{0x372f, 0x00},
> +	{0x3730, 0x89},
> +	{0x3731, 0x00},
> +	{0x3732, 0x08},
> +	{0x3733, 0x01},
> +	{0x3734, 0xfe},
> +	{0x3735, 0x05},
> +	{0x375d, 0x00},
> +	{0x375e, 0x00},
> +	{0x375f, 0x61},
> +	{0x3760, 0x06},
> +	{0x3768, 0x1b},
> +	{0x3769, 0x1b},
> +	{0x376a, 0x1a},
> +	{0x376b, 0x19},
> +	{0x376c, 0x18},
> +	{0x376d, 0x14},
> +	{0x376e, 0x0f},
> +	{0x3776, 0x00},
> +	{0x3777, 0x00},
> +	{0x3778, 0x46},
> +	{0x3779, 0x00},
> +	{0x377a, 0x08},
> +	{0x377b, 0x01},
> +	{0x377c, 0x45},
> +	{0x377d, 0x01},
> +	{0x377e, 0x23},
> +	{0x377f, 0x02},
> +	{0x3780, 0xd9},
> +	{0x3781, 0x03},
> +	{0x3782, 0xf5},
> +	{0x3783, 0x06},
> +	{0x3784, 0xa5},
> +	{0x3788, 0x0f},
> +	{0x378a, 0xd9},
> +	{0x378b, 0x03},
> +	{0x378c, 0xeb},
> +	{0x378d, 0x05},
> +	{0x378e, 0x87},
> +	{0x378f, 0x06},
> +	{0x3790, 0xf5},
> +	{0x3792, 0x43},
> +	{0x3794, 0x7a},
> +	{0x3796, 0xa1},
> +	{0x3e04, 0x0e},
> +	{0x3a00, 0x01},
> +};
> +
> +/* Supported sensor mode configurations */
> +static const struct imx334_mode supported_mode = {
> +	.width = 3840,
> +	.height = 2160,
> +	.ppln = 4400,
> +	.lpfr = 4500,
> +	.pclk = 594000000,
> +	.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +	.reg_list = {
> +		.num_of_regs = ARRAY_SIZE(mode_3840x2160_regs),
> +		.regs = mode_3840x2160_regs,
> +	},
> +};
> +
> +/**
> + * to_imx334() - imv334 V4L2 sub-device to imx334 device.
> + * @subdev: pointer to imx334 V4L2 sub-device
> + *
> + * Return: Pointer to imx334 device
> + */
> +static inline struct imx334 *to_imx334(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct imx334, sd);
> +}
> +
> +/**
> + * imx334_read_reg() - Read registers.
> + * @imx334: pointer to imx334 device
> + * @reg: Register address
> + * @len: Length of bytes to read. Max supported bytes is 4
> + * @val: Pointer to register value to be filled.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> +	struct i2c_msg msgs[2] = { 0 };
> +	u8 data_buf[4] = { 0 };
> +	int ret;
> +
> +	if (WARN_ON(len > 4))
> +		return -EINVAL;

This function (and the associated write_reg) are for internal use
only. This mean the only one that can get 'len' wrong is this driver
itself. Is it worth checking for that ?

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
> +/**
> + * imx334_write_reg() - Write register
> + * @imx334: pointer to imx334 device

writing kernel doc for functions with internal use only is sometimes
an effort which is nice to do but not required. If you want to go that
way try to stay consisitent, in this case you started the other
parameters descriptions with a capital letter.

Also if you want kernel doc to be generated I think you would need to
include this file in the Documentation build, otherwise doc does not
get build as far as I can tell. To be hones I would drop the double **
and make this regular documentation (I'm no expert on this, maybe wait
for maintainer's feedback).

> + * @reg: Register address
> + * @len: Length of bytes. Max supported bytes is 4
> + * @val: Register value
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_write_reg(struct imx334 *imx334, u16 reg, u32 len, u32 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> +	u8 buf[3] = {0};
> +	int ret;
> +	int i;
> +
> +	if (WARN_ON(len > 4))
> +		return -EINVAL;
> +
> +	/* Currently we can write to sensor only one byte at a time */

How so ?

> +	for (i = 0; i < len; i++) {
> +		put_unaligned_be16(reg + i, buf);
> +		buf[2] = (val >> (8 * i)) & 0xff;
> +		ret = i2c_master_send(client, buf, ARRAY_SIZE(buf));
> +		if (ret != ARRAY_SIZE(buf)) {
> +			dev_err_ratelimited(imx334->dev,
> +					    "write reg 0x%4.4x return err %d",
> +					    reg, ret);
> +			return -EIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_write_regs() - Write a list of registers
> + * @imx334: pointer to imx334 device
> + * @regs: List of registers to be written
> + * @len: Length of registers array
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_write_regs(struct imx334 *imx334,
> +			     const struct imx334_reg *regs, u32 len)
> +{
> +	int ret;
> +	unsigned int i;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = imx334_write_reg(imx334, regs[i].address, 1, regs[i].val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_update_controls() - Update control ranges based on streaming mode
> + * @imx334: pointer to imx334 device
> + * @mode: pointer to imx334_mode sensor mode
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_update_controls(struct imx334 *imx334,
> +				  const struct imx334_mode *mode)
> +{
> +	int ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(imx334->vblank_ctrl,
> +				 imx334->lpfr - mode->height);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(imx334->hblank_ctrl, mode->ppln - mode->width);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_modify_range(imx334->pclk_ctrl, mode->pclk,
> +				       mode->pclk, 1, mode->pclk);
> +	if (ret)
> +		return ret;

Does pclk change, as you support a single mode and a single format ?

> +
> +	ret = __v4l2_ctrl_modify_range(imx334->exp_ctrl, IMX334_EXPOSURE_MIN,
> +				       imx334->lpfr - IMX334_EXPOSURE_OFFSET,
> +				       1, IMX334_EXPOSURE_DEFAULT);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_update_exp_gain() - Set updated exposure and gain
> + * @imx334: pointer to imx334 device
> + * @exposure: updated exposure value
> + * @gain: updated analog gain value
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
> +{
> +	u32 shutter = 0;

No need for '= 0', it is immediately assigned below.

> +	int ret;
> +
> +	shutter = imx334->lpfr - exposure;
> +
> +	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u",
> +		exposure, gain, shutter, imx334->lpfr);
> +
> +	ret = imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx334_write_reg(imx334, IMX334_REG_LPFR, 3, imx334->lpfr);
> +	if (ret)
> +		goto error_release_group_hold;
> +
> +	ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
> +	if (ret)
> +		goto error_release_group_hold;
> +
> +	ret = imx334_write_reg(imx334, IMX334_REG_AGAIN, 1, gain);
> +	if (ret)
> +		goto error_release_group_hold;
> +
> +	imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 0);
> +
> +	return 0;
> +
> +error_release_group_hold:
> +	imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 0);
> +	return ret;
> +}
> +
> +/**
> + * imx334_set_ctrl() - Set subdevice control
> + * @ctrl: pointer to v4l2_ctrl structure
> + *
> + * Supported controls:
> + * - V4L2_CID_VBLANK
> + * - cluster controls:
> + *   - V4L2_CID_ANALOGUE_GAIN
> + *   - V4L2_CID_EXPOSURE
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx334 *imx334 =
> +		container_of(ctrl->handler, struct imx334, ctrl_handler);
> +	u32 analog_gain;
> +	u32 exposure;
> +	int ret;
> +
> +	/* Set controls only if sensor is in power on state */
> +	if (!pm_runtime_get_if_in_use(imx334->dev))
> +		return 0;
> +
> +	/* Handle the cluster for both controls */
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		imx334->lpfr = imx334->vblank_ctrl->val +
> +			imx334->cur_mode->height;
> +
> +		dev_dbg(imx334->dev, "Received vblank %u new lpfr %u",
> +			imx334->vblank_ctrl->val, imx334->lpfr);
> +
> +		ret = imx334_update_controls(imx334, imx334->cur_mode);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		exposure = ctrl->val;
> +		analog_gain = imx334->again_ctrl->val;
> +
> +		dev_dbg(imx334->dev, "Received exp %u analog gain %u",
> +			exposure, analog_gain);
> +
> +		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
> +		break;
> +	default:
> +		dev_err(imx334->dev, "Invalid control %d", ctrl->id);
> +		ret = -EINVAL;
> +	}
> +
> +	pm_runtime_put(imx334->dev);
> +
> +	return ret;
> +}
> +
> +/* V4l2 subdevice control ops*/
> +static const struct v4l2_ctrl_ops imx334_ctrl_ops = {
> +	.s_ctrl = imx334_set_ctrl,
> +};
> +
> +/**
> + * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> + * @sd: pointer to imx334 V4L2 sub-device structure
> + * @cfg: V4L2 sub-device pad configuration
> + * @code: V4L2 sub-device code enumeration need to be filled
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct imx334 *imx334 = to_imx334(sd);
> +
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&imx334->mutex);

Do you need to lock ?

> +	code->code = supported_mode.code;
> +	mutex_unlock(&imx334->mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> + * @sd: pointer to imx334 V4L2 sub-device structure
> + * @cfg: V4L2 sub-device pad configuration
> + * @fsize: V4L2 sub-device size enumeration need to be filled
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fsize)
> +{
> +	struct imx334 *imx334 = to_imx334(sd);
> +
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&imx334->mutex);

Same here, no other subdev IOCTL can interfere with this one.

> +	if (fsize->code != supported_mode.code) {
> +		mutex_unlock(&imx334->mutex);
> +		return -EINVAL;
> +	}
> +
> +	fsize->min_width = supported_mode.width;
> +	fsize->max_width = fsize->min_width;
> +	fsize->min_height = supported_mode.height;
> +	fsize->max_height = fsize->min_height;
> +	mutex_unlock(&imx334->mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_fill_pad_format() - Fill subdevice pad format
> + *                              from selected sensor mode
> + * @imx334: pointer to imx334 device
> + * @mode: Pointer to imx334_mode sensor mode
> + * @fmt: V4L2 sub-device format need to be filled
> + */
> +static void imx334_fill_pad_format(struct imx334 *imx334,
> +				   const struct imx334_mode *mode,
> +				   struct v4l2_subdev_format *fmt)
> +{
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.code = mode->code;
> +	fmt->format.field = V4L2_FIELD_NONE;

Running v4l2-compliance on this driver might report that you need to
set other fields of v4l2_subdev_format.format (at least the RAW colorspace
information. I wonder how encoding and quantization apply to a RAW sensor )

> +}
> +
> +/**
> + * imx334_get_pad_format() - Get subdevice pad format
> + * @sd: pointer to imx334 V4L2 sub-device structure
> + * @cfg: V4L2 sub-device pad configuration
> + * @fmt: V4L2 sub-device format need to be set
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_get_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx334 *imx334 = to_imx334(sd);
> +
> +	mutex_lock(&imx334->mutex);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *framefmt;
> +
> +		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +		fmt->format = *framefmt;
> +	} else {
> +		imx334_fill_pad_format(imx334, imx334->cur_mode, fmt);
> +	}
> +
> +	mutex_unlock(&imx334->mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_set_pad_format() - Set subdevice pad format
> + * @sd: pointer to imx334 V4L2 sub-device structure
> + * @cfg: V4L2 sub-device pad configuration
> + * @fmt: V4L2 sub-device format need to be set
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx334 *imx334 = to_imx334(sd);
> +	const struct imx334_mode *mode;
> +	int ret = 0;
> +
> +	mutex_lock(&imx334->mutex);
> +
> +	mode = &supported_mode;
> +	imx334_fill_pad_format(imx334, mode, fmt);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *framefmt;
> +
> +		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +		*framefmt = fmt->format;
> +	} else {
> +		ret = imx334_update_controls(imx334, mode);

How can controls change since you have a single supported format ?

I think with a single format get_pad_fmt and set_pad_fmt could be
implemented by a single function.

> +		if (ret)
> +			dev_err(imx334->dev, "failed to update ctls");
> +
> +		imx334->cur_mode = mode;
> +	}
> +
> +	mutex_unlock(&imx334->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_init_pad_cfg() - Initialize sub-device pad configuration
> + * @sd: pointer to imx334 V4L2 sub-device structure
> + * @cfg: V4L2 sub-device pad configuration
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_init_pad_cfg(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = { 0 };
> +
> +	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.format.width = supported_mode.width;
> +	fmt.format.height = supported_mode.height;
> +	fmt.format.code = supported_mode.code;
> +	fmt.format.field = V4L2_FIELD_NONE;

You don't use field in set_pad_format. Not a big deal though.

> +
> +	return imx334_set_pad_format(sd, cfg, &fmt);
> +}
> +
> +/**
> + * imx334_start_streaming() - Start sensor stream
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_start_streaming(struct imx334 *imx334)
> +{
> +	const struct imx334_reg_list *reg_list;
> +	int ret;
> +
> +	/* Write sensor mode registers */
> +	reg_list = &imx334->cur_mode->reg_list;
> +	ret = imx334_write_regs(imx334, reg_list->regs,
> +				reg_list->num_of_regs);
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to write initial registers");
> +		return ret;
> +	}
> +
> +	/* Setup handler will write actual exposure and gain */
> +	ret =  __v4l2_ctrl_handler_setup(imx334->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to setup handler");
> +		return ret;
> +	}
> +
> +	/* Start streaming */
> +	ret = imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
> +			       1, IMX334_MODE_STREAMING);
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to start streaming");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_stop_streaming() - Stop sensor stream
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_stop_streaming(struct imx334 *imx334)
> +{
> +	return imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
> +				1, IMX334_MODE_STANDBY);
> +}
> +
> +/**
> + * imx334_set_stream() - Enable sensor streaming
> + * @sd: pointer to imx334 subdevice
> + * @enable: Set to enable sensor streaming
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct imx334 *imx334 = to_imx334(sd);
> +	int ret;
> +
> +	mutex_lock(&imx334->mutex);
> +
> +	if (imx334->streaming == enable) {
> +		mutex_unlock(&imx334->mutex);
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(imx334->dev);
> +		if (ret)
> +			goto error_power_off;
> +
> +		ret = imx334_start_streaming(imx334);
> +		if (ret)
> +			goto error_power_off;
> +	} else {
> +		imx334_stop_streaming(imx334);
> +		pm_runtime_put(imx334->dev);
> +	}
> +
> +	imx334->streaming = enable;
> +
> +	mutex_unlock(&imx334->mutex);
> +
> +	return 0;
> +
> +error_power_off:
> +	pm_runtime_put(imx334->dev);
> +	mutex_unlock(&imx334->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_detect() - Detect imx334 sensor
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, -EIO if sensor id does not match
> + */
> +static int imx334_detect(struct imx334 *imx334)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = imx334_read_reg(imx334, IMX334_REG_ID, 2, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != IMX334_ID) {
> +		dev_err(imx334->dev, "chip id mismatch: %x!=%x",
> +			IMX334_ID, val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/* V4l2 subdevice ops */
> +static const struct v4l2_subdev_video_ops imx334_video_ops = {
> +	.s_stream = imx334_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx334_pad_ops = {
> +	.init_cfg = imx334_init_pad_cfg,
> +	.enum_mbus_code = imx334_enum_mbus_code,
> +	.enum_frame_size = imx334_enum_frame_size,
> +	.get_fmt = imx334_get_pad_format,
> +	.set_fmt = imx334_set_pad_format,
> +};
> +
> +static const struct v4l2_subdev_ops imx334_subdev_ops = {
> +	.video = &imx334_video_ops,
> +	.pad = &imx334_pad_ops,
> +};
> +
> +static const struct media_entity_operations imx334_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};

Is link_validate called on sensor subdev ? My understanding is that
they're called on the sink entity, but I might be mistaken.

> +
> +/**
> + * imx334_power_on() - Sensor power on sequence
> + * @dev: pointer to i2c device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx334 *imx334 = to_imx334(sd);
> +	int ret;
> +
> +	gpiod_set_value_cansleep(imx334->reset_gpio, 1);
> +
> +	ret = clk_prepare_enable(imx334->inclk);
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to enable inclk");
> +		goto error_reset;
> +	}
> +
> +	usleep_range(18000, 20000);
> +
> +	return 0;
> +
> +error_reset:
> +	gpiod_set_value_cansleep(imx334->reset_gpio, 0);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_power_off() - Sensor power off sequence
> + * @dev: pointer to i2c device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx334 *imx334 = to_imx334(sd);
> +
> +	gpiod_set_value_cansleep(imx334->reset_gpio, 0);
> +
> +	clk_disable_unprepare(imx334->inclk);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_init_controls() - Initialize sensor subdevice controls
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_init_controls(struct imx334 *imx334)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr = &imx334->ctrl_handler;
> +	const struct imx334_mode *mode = imx334->cur_mode;
> +	u32 hblank;
> +	u32 vblank;
> +	int ret;
> +
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 5);
> +	if (ret)
> +		return ret;
> +
> +	/* Serialize controls with sensor device */
> +	ctrl_hdlr->lock = &imx334->mutex;
> +
> +	/* Initialize exposure and gain */
> +	imx334->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					     &imx334_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX334_EXPOSURE_MIN,
> +					     mode->lpfr,
> +					     IMX334_EXPOSURE_STEP,
> +					     IMX334_EXPOSURE_DEFAULT);
> +
> +	imx334->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					       &imx334_ctrl_ops,
> +					       V4L2_CID_ANALOGUE_GAIN,
> +					       IMX334_AGAIN_MIN,
> +					       IMX334_AGAIN_MAX,
> +					       IMX334_AGAIN_STEP,
> +					       IMX334_AGAIN_DEFAULT);
> +
> +	v4l2_ctrl_cluster(2, &imx334->exp_ctrl);
> +
> +	vblank = mode->lpfr - mode->height;
> +	imx334->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +						&imx334_ctrl_ops,
> +						V4L2_CID_VBLANK,
> +						IMX334_LPFR_MIN - mode->height,
> +						IMX334_LPFR_MAX - mode->height,
> +						1, vblank);
> +
> +	/* Read only controls */
> +	imx334->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					      &imx334_ctrl_ops,
> +					      V4L2_CID_PIXEL_RATE,
> +					      mode->pclk, mode->pclk,
> +					      1, mode->pclk);
> +	if (imx334->pclk_ctrl)
> +		imx334->pclk_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

You can set the READ_ONLY flags after the below:
        if (ctrl_hdlr->error)

to avoid checking for the control validity here and below


> +
> +	hblank = mode->ppln - mode->width;
> +	imx334->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +						&imx334_ctrl_ops,
> +						V4L2_CID_HBLANK,
> +						IMX334_REG_MIN,
> +						IMX334_REG_MAX,
> +						1, hblank);
> +	if (imx334->hblank_ctrl)
> +		imx334->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(imx334->dev, "control init failed: %d", ret);
> +		goto error;

You can free the handler here and return cltr_hdlr->error directly
here.

> +	}
> +
> +	imx334->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_probe() - I2C client device binding
> + * @client: pointer to i2c client device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_probe(struct i2c_client *client)
> +{
> +	struct imx334 *imx334;
> +	unsigned long rate;
> +	int ret;
> +
> +	imx334 = devm_kzalloc(&client->dev, sizeof(*imx334), GFP_KERNEL);
> +	if (!imx334)
> +		return -ENOMEM;
> +
> +	mutex_init(&imx334->mutex);
> +
> +	imx334->dev = &client->dev;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&imx334->sd, client, &imx334_subdev_ops);
> +
> +	/* Request optional reset pin */
> +	imx334->reset_gpio = gpiod_get_optional(imx334->dev, "reset",
> +						GPIOD_OUT_LOW);

devm_ ?

> +	if (IS_ERR(imx334->reset_gpio)) {
> +		ret = PTR_ERR(imx334->reset_gpio);
> +		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> +		goto error_mutex_destroy;
> +	}
> +
> +	/* Get sensor input clock */
> +	imx334->inclk = devm_clk_get(imx334->dev, "inclk");
> +	if (IS_ERR(imx334->inclk)) {
> +		ret = PTR_ERR(imx334->inclk);
> +		dev_err(imx334->dev, "could not get inclk");
> +		goto error_mutex_destroy;
> +	}
> +
> +	rate = clk_get_rate(imx334->inclk);
> +	if (rate != IMX334_INCLK_RATE) {
> +		dev_err(imx334->dev, "inclk frequency mismatch");
> +		ret = -EINVAL;
> +		goto error_mutex_destroy;
> +	}

You can intialize the mutex here to avoid a few goto here above

> +
> +	ret = imx334_power_on(imx334->dev);
> +	if (ret) {
> +		dev_err(imx334->dev, "failed to power-on the sensor");
> +		goto error_mutex_destroy;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx334_detect(imx334);
> +	if (ret) {
> +		dev_err(imx334->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Set default mode to max resolution */
> +	imx334->cur_mode = &supported_mode;
> +	imx334->lpfr = imx334->cur_mode->lpfr;
> +
> +	ret = imx334_init_controls(imx334);
> +	if (ret) {
> +		dev_err(imx334->dev, "failed to init controls: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	imx334->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx334->sd.entity.ops = &imx334_subdev_entity_ops;
> +	imx334->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx334->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx334->sd.entity, 1, &imx334->pad);
> +	if (ret) {
> +		dev_err(imx334->dev, "failed to init entity pads: %d", ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor_common(&imx334->sd);

_sensor_common() tries to parse the firware interface to search for
lens and flash subdevices. I don't see them mentioned in bindings, do
you need them or should this just be v4l2_async_register_subdev() ?

Anyway, driver looks good, mostly minor comments
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +	if (ret < 0) {
> +		dev_err(imx334->dev,
> +			"failed to register async subdev: %d", ret);
> +		goto error_media_entity;
> +	}
> +
> +	pm_runtime_set_active(imx334->dev);
> +	pm_runtime_enable(imx334->dev);
> +	pm_runtime_idle(imx334->dev);
> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx334->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(imx334->sd.ctrl_handler);
> +error_power_off:
> +	imx334_power_off(imx334->dev);
> +error_mutex_destroy:
> +	mutex_destroy(&imx334->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx334_remove() - I2C client device unbinding
> + * @client: pointer to I2C client device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx334 *imx334 = to_imx334(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_suspended(&client->dev);
> +
> +	mutex_destroy(&imx334->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx334_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx334_power_off, imx334_power_on, NULL)
> +};
> +
> +static const struct of_device_id imx334_of_match[] = {
> +	{ .compatible = "sony,imx334" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx334_of_match);
> +
> +static struct i2c_driver imx334_driver = {
> +	.probe_new = imx334_probe,
> +	.remove = imx334_remove,
> +	.driver = {
> +		.name = IMX334_DRV_NAME,
> +		.pm = &imx334_pm_ops,
> +		.of_match_table = imx334_of_match,
> +	},
> +};
> +
> +module_i2c_driver(imx334_driver);
> +
> +MODULE_DESCRIPTION("Sony imx334 sensor driver");
> +MODULE_LICENSE("GPL");
> --
> 2.11.0
>
