Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFCC63A0BF
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 06:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiK1FQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 00:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiK1FQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 00:16:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600AF13D13
        for <linux-media@vger.kernel.org>; Sun, 27 Nov 2022 21:16:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC62955A;
        Mon, 28 Nov 2022 06:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669612598;
        bh=ADkWKO0QvL59LoTN4YpOn1Xt3TEMcyroKnL3xjqt13Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZG1b9B7f5oEiumyqiEIxx5hxSoFZee82szSOmX2fecpv595J5VtR17Cf6i39lsjQ
         /NR1Lsad9Gzh90CRxiclZdRMb0wwaUdTcIsOPF2h5ZVv1E28VwggptCh+PNZVpRAsQ
         kNyyTOT5WcEeA8kqtgH2+alzreEANoyyvRHD+BmA=
Date:   Mon, 28 Nov 2022 07:16:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v1 3/5] media: i2c: imx492: driver's source
Message-ID: <Y4REJnVbzKjbgJv6@pendragon.ideasonboard.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-4-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125153120.541298-4-petko.manolov@konsulko.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Thank you for the patch.

On Fri, Nov 25, 2022 at 05:31:18PM +0200, Petko Manolov wrote:
> imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> monochrome square pixel array and approximately 47.08 M effective pixels. 12-bit
> digital output makes it possible to output the signals with high definition for
> moving pictures. It is programmable through I2C interface. The I2C client
> address can be either 0x10 or 0x1a depending on SLASEL pin. Image data is sent
> through MIPI CSI-2.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  drivers/media/i2c/imx492.c | 1092 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 1092 insertions(+)
>  create mode 100644 drivers/media/i2c/imx492.c
> 
> diff --git a/drivers/media/i2c/imx492.c b/drivers/media/i2c/imx492.c
> new file mode 100644
> index 000000000000..0713256b4b63
> --- /dev/null
> +++ b/drivers/media/i2c/imx492.c
> @@ -0,0 +1,1092 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sony imx492 Camera Sensor Driver (based on imx412.c source);
> + *
> + * Copyright (C) 2022 Petko Manolov <petko.manolov@konsulko.com>
> + */
> +
> +#include <asm/unaligned.h>
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>

There are missing headers, at least for GPIO. Please check if anything
else is missing.

> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "imx492.h"
> +
> +/* Streaming Mode */
> +#define IMX492_REG_MODE_SELECT	0x3000
> +
> +/* Chip ID */
> +#define IMX492_ID		0x13
> +
> +/* Analog gain control */
> +#define IMX492_REG_AGAIN	0x300a
> +#define IMX492_AGAIN_MIN	0
> +#define IMX492_AGAIN_MAX	978
> +#define IMX492_AGAIN_STEP	1
> +#define IMX492_AGAIN_DEFAULT	0
> +
> +/* Group hold register */
> +#define IMX492_REG_HOLD		0x302b
> +#define	IMX492_REG_XMSTA	0x3033
> +#define	IMX492_REG_SYSCLKEN	0x35e5

You can replace the first tab (just after #define) with a space.

> +
> +/* CSI2 HW configuration */
> +#define IMX492_LINK_FREQ	745000000
> +#define IMX492_NUM_DATA_LANES	4
> +
> +#define IMX492_REG_MIN		0x3000
> +#define IMX492_REG_MAX		0xffff
> +
> +/* *** */
> +
> +#define IMX492_REG_STANDBY	IMX492_REG_MODE_SELECT

No aliases for register names please, that's confusing.

> +#define IMX492_BIT_STANDBY	0x01
> +#define IMX492_BIT_STBLOGIC	0x02
> +#define IMX492_BIT_STBDV	0x10
> +
> +#define IMX492_MODE_STANDBY	(IMX492_BIT_STBDV | IMX492_BIT_STBLOGIC | IMX492_BIT_STANDBY)
> +#define IMX492_MODE_STREAMING	0x00
> +
> +#define IMX492_REG_TESTPTRN	0x303A
> +#define IMX492_BIT_CLKEN	0x01
> +#define IMX492_BIT_TESTPTRN	0x10
> +#define IMX492_BITS_TPTRN_ON	(IMX492_BIT_TESTPTRN | IMX492_BIT_CLKEN)
> +#define IMX492_BITS_TPTRN_OFF	0x00
> +
> +#define IMX492_REG_TESTPATSEL	0x303B
> +#define IMX492_BIT_TPAT00	0x00
> +#define IMX492_BIT_TPAT01	0x01
> +#define IMX492_BIT_TPAT02	0x02
> +#define IMX492_BIT_TPAT03	0x03
> +#define IMX492_BIT_TPAT0A	0x0A
> +#define IMX492_BIT_TPAT0B	0x0B
> +
> +#define IMX492_EXPOSURE_MIN		8
> +#define IMX492_EXPOSURE_OFFSET		22
> +#define IMX492_EXPOSURE_STEP		1
> +#define IMX492_EXPOSURE_DEFAULT		0x0648
> +
> +#define	DEFAULT_FPS		6
> +
> +/**
> + * struct imx492_reg_list - imx492 sensor register list
> + * @num_of_regs: Number of registers in the list
> + * @regs: Pointer to register list
> + */
> +struct imx492_reg_list {
> +	u32 num_of_regs;
> +	const struct imx492_reg *regs;
> +};
> +
> +/**
> + * struct imx492_mode - imx492 sensor mode structure
> + * @width: Frame width
> + * @height: Frame height
> + * @code: Format code
> + * @hblank: Horizontal blanking in lines
> + * @vblank: Vertical blanking in lines
> + * @vblank_min: Minimum vertical blanking in lines
> + * @vblank_max: Maximum vertical blanking in lines
> + * @pclk: Sensor pixel clock
> + * @link_freq_idx: Link frequency index
> + * @reg_list: Register list for sensor mode
> + */
> +struct imx492_mode {
> +	u32 width;
> +	u32 height;
> +	u32 code;
> +	u32 hblank;
> +	u32 hblank_min;
> +	u32 hblank_max;
> +	u32 vblank;
> +	u32 vblank_min;
> +	u32 vblank_max;
> +	u64 pclk;
> +	u32 link_freq_idx;
> +	struct imx492_reg_list reg_list;
> +};
> +
> +/**
> + * struct imx492 - imx492 sensor device structure
> + * @dev: Pointer to generic device
> + * @client: Pointer to i2c client
> + * @sd: V4L2 sub-device
> + * @pad: Media pad. Only one pad supported
> + * @reset_gpio: Sensor reset gpio
> + * @reset_gpio: Sensor power gpio
> + * @inclk: Sensor input clock
> + * @supplies: Regulator supplies
> + * @ctrl_handler: V4L2 control handler
> + * @link_freq_ctrl: Pointer to link frequency control
> + * @pclk_ctrl: Pointer to pixel clock control
> + * @hblank_ctrl: Pointer to horizontal blanking control
> + * @vblank_ctrl: Pointer to vertical blanking control
> + * @exp_ctrl: Pointer to exposure control
> + * @again_ctrl: Pointer to analog gain control
> + * @vblank: Vertical blanking in lines
> + * @cur_mode: Pointer to current selected sensor mode
> + * @mutex: Mutex for serializing sensor controls

Please use the same order for fields in the documentation and the
structure defininition.

> + * @streaming: Flag indicating streaming state
> + */
> +struct imx492 {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_captureparm scap;

This is set but never used. You can drop it.

> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *power_gpio;
> +	struct gpio_desc *oscen_gpio;
> +	struct clk *inclk;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *link_freq_ctrl;
> +	struct v4l2_ctrl *pclk_ctrl;
> +	struct v4l2_ctrl *hblank_ctrl;
> +	struct v4l2_ctrl *vblank_ctrl;
> +	struct v4l2_ctrl *exp_ctrl;
> +	struct v4l2_ctrl *again_ctrl;
> +	const struct imx492_mode *cur_mode;
> +	struct mutex mutex;
> +	u32 tpatt;

Not used, drop it.

> +	u32 vblank;
> +	bool streaming;
> +};
> +
> +static const s64 link_freq[] = {
> +	IMX492_LINK_FREQ,
> +};
> +
> +
> +/* Supported sensor mode configurations */
> +static const struct imx492_mode supported_modes[] = {
> +	{
> +		.width = 8192,
> +		.height = 4320,
> +		.hblank = 1108,
> +		.hblank_min = 1102,
> +		.hblank_max = 32768,
> +		.vblank = 5728,
> +		.vblank_min = 4428,
> +		.vblank_max = 32768,
> +		.pclk = 745000000,
> +		.link_freq_idx = 0,
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_17to9_regs),
> +			.regs = mode_17to9_regs,
> +		},
> +	}, {
> +		.width = 8192,
> +		.height = 5556,
> +		.hblank = 1108,
> +		.hblank_min = 1102,
> +		.hblank_max = 32768,
> +		.vblank = 5728,
> +		.vblank_min = 4428,
> +		.vblank_max = 32768,
> +		.pclk = 745000000,
> +		.link_freq_idx = 0,
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_all_regs),
> +			.regs = mode_all_regs,
> +		},
> +	},
> +};
> +
> +static const char * const imx492_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid black",
> +	"Solid white",
> +	"Solid dark grey",
> +	"Solid light gray",
> +	"None",
> +	"None",
> +	"None",
> +	"None",
> +	"None",
> +	"None",

Menu controls shouldn't have entries with identical names. All these
should be dropped if they're not implemented by the sensor, or given a
proper name.

> +	"Vertical color bars",
> +	"Horizontal color bars",
> +};
> +
> +/**
> + * to_imx492() - imx492 V4L2 sub-device to imx492 device.
> + * @subdev: pointer to imx492 V4L2 sub-device
> + *
> + * Return: pointer to imx492 device
> + */
> +static inline struct imx492 *to_imx492(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct imx492, sd);
> +}
> +
> +/**
> + * imx492_read_reg() - Read registers.
> + * @imx492: pointer to imx492 device
> + * @reg: register address
> + * @len: length of bytes to read. Max supported bytes is 4
> + * @val: pointer to register value to be filled.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_read_reg(struct imx492 *imx492, u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx492->sd);
> +	struct i2c_msg msgs[2] = {0};
> +	u8 addr_buf[2] = {0};
> +	u8 data_buf[4] = {0};
> +	int ret;
> +
> +	if (WARN_ON(len > 4))
> +		return -EINVAL;
> +
> +	put_unaligned_be16(reg, addr_buf);
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
> + * imx492_write_reg() - Write register
> + * @imx492: pointer to imx492 device
> + * @reg: register address
> + * @len: length of bytes. Max supported bytes is 4
> + * @val: register value
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_write_reg(struct imx492 *imx492, u16 reg, u32 len, u32 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx492->sd);
> +	u8 buf[6] = {0};
> +
> +	if (WARN_ON(len > 4))
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
> +/**
> + * imx492_write_regs() - Write a list of registers
> + * @imx492: pointer to imx492 device
> + * @regs: list of registers to be written
> + * @len: length of registers array
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_write_regs(struct imx492 *imx492,
> +			     const struct imx492_reg *regs, u32 len)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = imx492_write_reg(imx492, regs[i].address, 1, regs[i].val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 imx492_get_format_code(struct imx492 *imx492, u32 code)
> +{
> +	/* for now this is the only format we support */
> +	return MEDIA_BUS_FMT_SGBRG12_1X12;
> +}
> +
> +/**
> + * imx492_update_controls() - Update control ranges based on streaming mode
> + * @imx492: pointer to imx492 device
> + * @mode: pointer to imx492_mode sensor mode
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_update_controls(struct imx492 *imx492,
> +				  const struct imx492_mode *mode)
> +{
> +	int ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(imx492->link_freq_ctrl, mode->link_freq_idx);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(imx492->hblank_ctrl, mode->hblank);
> +	if (ret)
> +		return ret;
> +
> +	return __v4l2_ctrl_modify_range(imx492->vblank_ctrl, mode->vblank_min,
> +					mode->vblank_max, 1, mode->vblank);
> +}
> +
> +/**
> + * imx492_update_exp_gain() - Set updated exposure and gain
> + * @imx492: pointer to imx492 device
> + * @exposure: updated exposure value
> + * @gain: updated analog gain value
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_update_exp_gain(struct imx492 *imx492, u32 exposure, u32 gain)
> +{
> +	u32 lpfr, shutter;
> +	int ret;
> +
> +	lpfr = imx492->vblank + imx492->cur_mode->height;
> +	shutter = lpfr - exposure;
> +
> +	ret = imx492_write_reg(imx492, IMX492_REG_HOLD, 1, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx492_write_reg(imx492, IMX492_REG_AGAIN, 2, gain);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx492_set_ctrl() - Set subdevice control
> + * @ctrl: pointer to v4l2_ctrl structure
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx492 *imx492 =
> +		container_of(ctrl->handler, struct imx492, ctrl_handler);
> +	u32 analog_gain;
> +	u32 exposure;
> +	int ret;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		imx492->vblank = imx492->vblank_ctrl->val;
> +
> +		ret = __v4l2_ctrl_modify_range(imx492->exp_ctrl,
> +					       IMX492_EXPOSURE_MIN,
> +					       imx492->vblank +
> +					       imx492->cur_mode->height -
> +					       IMX492_EXPOSURE_OFFSET,
> +					       1, IMX492_EXPOSURE_DEFAULT);

It looks like you forgot to write the corresponding registers.

> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		/* Set controls only if sensor is in power on state */
> +		if (!pm_runtime_get_if_in_use(imx492->dev))
> +			return 0;
> +		exposure = ctrl->val;
> +		analog_gain = imx492->again_ctrl->val;
> +		ret = imx492_update_exp_gain(imx492, exposure, analog_gain);
> +		pm_runtime_put(imx492->dev);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val) {
> +			imx492_write_reg(imx492, IMX492_REG_TESTPATSEL, 1, ctrl->val - 1);
> +			imx492_write_reg(imx492, IMX492_REG_TESTPTRN, 1, IMX492_BITS_TPTRN_ON);
> +		} else {
> +			imx492_write_reg(imx492, IMX492_REG_TESTPTRN, 1, IMX492_BITS_TPTRN_OFF);
> +		}

Don't you need the same pm_runtime_get_if_in_use() dance as for
V4L2_CID_EXPOSURE ?

> +		ret = 0;
> +		break;

Missing V4L2_CID_ANALOGUE_GAIN.

> +	default:
> +		dev_err(imx492->dev, "Invalid control %d", ctrl->id);

This shouldn't happen if you correctly handle all the controls you have
instanciated in imx492_init_controls().

> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +/* V4l2 subdevice control ops*/
> +static const struct v4l2_ctrl_ops imx492_ctrl_ops = {
> +	.s_ctrl = imx492_set_ctrl,
> +};
> +
> +/**
> + * imx492_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> + * @sd: pointer to imx492 V4L2 sub-device structure
> + * @sd_state: V4L2 sub-device configuration
> + * @code: V4L2 sub-device code enumeration need to be filled
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	code->code = supported_modes[code->index].code;

All modes have the same media bus code, you shouldn't report duplicated
values.

> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
> + * @sd: pointer to imx492 V4L2 sub-device structure
> + * @sd_state: V4L2 sub-device configuration
> + * @fsize: V4L2 sub-device size enumeration need to be filled
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fsize)
> +{
> +	if (fsize->index > ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fsize->code != supported_modes[fsize->index].code)
> +		return -EINVAL;
> +
> +	fsize->max_width = supported_modes[fsize->index].width;
> +	fsize->min_width = fsize->max_width;
> +	fsize->max_height = supported_modes[fsize->index].height;
> +	fsize->min_height = fsize->max_height;
> +
> +	return 0;
> +}
> +
> +/**
> +n * imx492_fill_pad_format() - Fill subdevice pad format
> + *                            from selected sensor mode
> + * @imx492: pointer to imx492 device
> + * @mode: pointer to imx492_mode sensor mode
> + * @fmt: V4L2 sub-device format need to be filled
> + */
> +static void imx492_fill_pad_format(struct imx492 *imx492,
> +				   const struct imx492_mode *mode,
> +				   struct v4l2_subdev_format *fmt)
> +{
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.code = mode->code;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;

You can use V4L2_QUANTIZATION_FULL_RANGE.

> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +}
> +
> +/**
> + * imx492_get_pad_format() - Get subdevice pad format
> + * @sd: pointer to imx492 V4L2 sub-device structure
> + * @sd_state: V4L2 sub-device configuration
> + * @fmt: V4L2 sub-device format need to be set
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_get_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx492 *imx492 = to_imx492(sd);
> +
> +	mutex_lock(&imx492->mutex);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *framefmt;
> +
> +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		fmt->format = *framefmt;
> +	} else {
> +		imx492_fill_pad_format(imx492, imx492->cur_mode, fmt);
> +	}
> +
> +	mutex_unlock(&imx492->mutex);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_set_pad_format() - Set subdevice pad format
> + * @sd: pointer to imx492 V4L2 sub-device structure
> + * @sd_state: V4L2 sub-device configuration
> + * @fmt: V4L2 sub-device format need to be set
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx492 *imx492 = to_imx492(sd);
> +	const struct imx492_mode *mode;
> +	int ret = 0;
> +
> +	mutex_lock(&imx492->mutex);
> +
> +	fmt->format.code = imx492_get_format_code(imx492, 0);
> +	mode = v4l2_find_nearest_size(supported_modes,
> +					ARRAY_SIZE(supported_modes),
> +					width, height,
> +					fmt->format.width, fmt->format.height);
> +	imx492_fill_pad_format(imx492, mode, fmt);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *framefmt;
> +
> +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		*framefmt = fmt->format;
> +	} else {
> +		ret = imx492_update_controls(imx492, mode);
> +		if (!ret)
> +			imx492->cur_mode = mode;
> +	}
> +
> +	mutex_unlock(&imx492->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx492_init_pad_cfg() - Initialize sub-device pad configuration
> + * @sd: pointer to imx492 V4L2 sub-device structure
> + * @sd_state: V4L2 sub-device configuration
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_init_pad_cfg(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state)
> +{
> +	struct imx492 *imx492 = to_imx492(sd);
> +	struct v4l2_subdev_format fmt = { 0 };
> +
> +	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;

When using the active state API you will never get a null state here, so
you can set this to

	struct v4l2_subdev_format fmt = { .which = V4L2_SUBDEV_FORMAT_TRY, };

unconditionally.

> +	imx492_fill_pad_format(imx492, &supported_modes[0], &fmt);
> +
> +	return imx492_set_pad_format(sd, sd_state, &fmt);
> +}
> +
> +/**
> + * imx492_start_streaming() - Start sensor stream
> + * @imx492: pointer to imx492 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_start_streaming(struct imx492 *imx492)
> +{
> +	const struct imx492_reg_list *reg_list;
> +	int ret;
> +
> +	/* Write sensor mode registers */
> +	reg_list = &imx492->cur_mode->reg_list;
> +	ret = imx492_write_regs(imx492, reg_list->regs,
> +				reg_list->num_of_regs);
> +	if (ret) {
> +		dev_err(imx492->dev, "fail to write initial registers");
> +		return ret;
> +	}
> +
> +	/* Setup handler will write actual exposure and gain */
> +	ret = __v4l2_ctrl_handler_setup(imx492->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(imx492->dev, "fail to setup handler");
> +		return ret;
> +	}
> +
> +	/* 1st stabilization period */
> +	usleep_range(10000, 11000);
> +	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, 0x02);
> +	imx492_write_reg(imx492, IMX492_REG_SYSCLKEN, 1, 0x92);
> +	imx492_write_reg(imx492, IMX492_REG_SYSCLKEN, 1, 0x9a);
> +	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, IMX492_MODE_STREAMING);
> +
> +	/* 2nd stabilization period */
> +	usleep_range(7000, 8000);
> +
> +	/* Start streaming */
> +	ret = imx492_write_reg(imx492, IMX492_REG_XMSTA, 1, 0x20);
> +
> +	if (ret) {
> +		dev_err(imx492->dev, "fail to start streaming");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_stop_streaming() - Stop sensor stream
> + * @imx492: pointer to imx492 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static void imx492_stop_streaming(struct imx492 *imx492)
> +{
> +	imx492_write_reg(imx492, IMX492_REG_MODE_SELECT, 1, IMX492_MODE_STANDBY);
> +	imx492_write_reg(imx492, IMX492_REG_XMSTA, 1, 0x10);
> +}
> +
> +/**
> + * imx492_set_stream() - Enable sensor streaming
> + * @sd: pointer to imx492 subdevice
> + * @enable: set to enable sensor streaming
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct imx492 *imx492 = to_imx492(sd);
> +	int ret;
> +
> +	mutex_lock(&imx492->mutex);
> +
> +	if (imx492->streaming == enable) {

This should never happen. You can drop imx492->streaming.

> +		mutex_unlock(&imx492->mutex);
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(imx492->dev);
> +		if (ret)
> +			goto error_unlock;
> +		ret = imx492_start_streaming(imx492);
> +		if (ret)
> +			goto error_power_off;
> +	} else {
> +		imx492_stop_streaming(imx492);
> +		pm_runtime_put(imx492->dev);
> +	}
> +
> +	imx492->streaming = enable;
> +
> +	mutex_unlock(&imx492->mutex);
> +
> +	return 0;
> +
> +error_power_off:
> +	pm_runtime_put(imx492->dev);
> +error_unlock:
> +	mutex_unlock(&imx492->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx492_detect() - Detect imx492 sensor
> + * @imx492: pointer to imx492 device
> + *
> + * Return: 0 if successful, -EIO if sensor id does not match
> + */
> +static int imx492_detect(struct imx492 *imx492)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = imx492_read_reg(imx492, IMX492_REG_STANDBY, 1, &val);

Is the chip ID really stored in that register ?

> +	if (ret)
> +		return ret;
> +
> +	if (val != IMX492_ID) {
> +		dev_err(imx492->dev, "chip id mismatch: %x!=%x", IMX492_ID, val);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_parse_hw_config() - Parse HW configuration and check if supported
> + * @imx492: pointer to imx492 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_parse_hw_config(struct imx492 *imx492)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(imx492->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	imx492->power_gpio = devm_gpiod_get(imx492->dev, "power", GPIOD_OUT_HIGH);

Not listed in the DT binding.

> +	if (IS_ERR(imx492->power_gpio)) {
> +		dev_err(imx492->dev, "failed to get power gpio %ld",
> +			PTR_ERR(imx492->power_gpio));
> +		return PTR_ERR(imx492->power_gpio);
> +	}
> +
> +	imx492->oscen_gpio = devm_gpiod_get(imx492->dev, "oscen", GPIOD_OUT_HIGH);

Not listed in the DT binding.

You should also handle regulators in the driver.

> +	if (IS_ERR(imx492->oscen_gpio)) {
> +		dev_err(imx492->dev, "failed to get oscen gpio %ld",
> +			PTR_ERR(imx492->oscen_gpio));
> +		return PTR_ERR(imx492->oscen_gpio);
> +	}
> +
> +	imx492->reset_gpio = devm_gpiod_get(imx492->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx492->reset_gpio)) {
> +		dev_err(imx492->dev, "failed to get reset gpio %ld",
> +			PTR_ERR(imx492->reset_gpio));
> +		return PTR_ERR(imx492->reset_gpio);
> +	}
> +
> +	if (gpiod_direction_output(imx492->power_gpio, 1) ||
> +	    gpiod_direction_output(imx492->oscen_gpio, 1) ||
> +	    gpiod_direction_output(imx492->reset_gpio, 0)) {

This is done by devm_gpiod_get().

> +		dev_err(imx492->dev, "failed to change gpio direction");
> +		return -EINVAL;
> +	}
> +
> +	/* Get sensor input clock */
> +	imx492->inclk = devm_clk_get(imx492->dev, NULL);
> +	if (IS_ERR(imx492->inclk)) {
> +		dev_err(imx492->dev, "could not get inclk");
> +		return PTR_ERR(imx492->inclk);
> +	}
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep) {
> +		dev_err(imx492->dev, "next endpoint?");
> +		return -ENXIO;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		dev_err(imx492->dev, "endpoint alloc parse");
> +		return ret;
> +	}
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX492_NUM_DATA_LANES) {
> +		dev_err(imx492->dev, "number of CSI2 data lanes %d is not supported",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		ret = -EINVAL;
> +		goto done_endpoint_free;
> +	}
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(imx492->dev, "no link frequencies defined");
> +		ret = -EINVAL;
> +		goto done_endpoint_free;
> +	}
> +
> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +		if (bus_cfg.link_frequencies[i] == IMX492_LINK_FREQ)
> +			goto done_endpoint_free;
> +	}
> +
> +	ret = -EINVAL;
> +
> +done_endpoint_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +/* V4l2 subdevice ops */
> +static const struct v4l2_subdev_video_ops imx492_video_ops = {
> +	.s_stream = imx492_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx492_pad_ops = {
> +	.init_cfg = imx492_init_pad_cfg,
> +	.enum_mbus_code = imx492_enum_mbus_code,
> +	.enum_frame_size = imx492_enum_frame_size,
> +	.get_fmt = imx492_get_pad_format,

Please use the subdev active state API. You need to call
v4l2_subdev_init_finalize() at probe time, and you can set this to

	.get_fmt = v4l2_subdev_get_fmt,

Then, in imx492_set_pad_format() (and elsewhere as needed), you can use
v4l2_subdev_get_pad_format() to replace v4l2_subdev_get_try_format().
This helps making code paths identical for the TRY and ACTIVE cases, the
only exception being the update of controls in .set_fmt() in the ACTIVE
case.

> +	.set_fmt = imx492_set_pad_format,

Please also implement the .get_selection operation to report the
V4L2_SEL_TGT_CROP, V4L2_SEL_TGT_CROP_BOUNDS, V4L2_SEL_TGT_CROP_DEFAULT
and V4L2_SEL_TGT_NATIVE_SIZE values.

> +};
> +
> +static const struct v4l2_subdev_ops imx492_subdev_ops = {
> +	.video = &imx492_video_ops,
> +	.pad = &imx492_pad_ops,
> +};
> +
> +/**
> + * imx492_power_on() - Sensor power on sequence
> + * @dev: pointer to i2c device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx492 *imx492 = to_imx492(sd);
> +
> +	gpiod_set_value_cansleep(imx492->power_gpio, 1);
> +	msleep(1);
> +	gpiod_set_value_cansleep(imx492->reset_gpio, 1);
> +	msleep(1);
> +	gpiod_set_value_cansleep(imx492->oscen_gpio, 1);
> +	msleep(1);

How about regulators and clock ?

> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_power_off() - Sensor power off sequence
> + * @dev: pointer to i2c device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx492 *imx492 = to_imx492(sd);
> +
> +	gpiod_set_value_cansleep(imx492->oscen_gpio, 0);
> +	gpiod_set_value_cansleep(imx492->reset_gpio, 0);
> +	gpiod_set_value_cansleep(imx492->power_gpio, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_init_controls() - Initialize sensor subdevice controls
> + * @imx492: pointer to imx492 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_init_controls(struct imx492 *imx492)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr = &imx492->ctrl_handler;
> +	const struct imx492_mode *mode = imx492->cur_mode;
> +	u32 lpfr;
> +	int ret;
> +
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 6);
> +	if (ret)
> +		return ret;
> +
> +	/* Serialize controls with sensor device */
> +	ctrl_hdlr->lock = &imx492->mutex;
> +	/* Initialize exposure and gain */
> +	lpfr = mode->vblank + mode->height;
> +	imx492->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					     &imx492_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX492_EXPOSURE_MIN,
> +					     lpfr - IMX492_EXPOSURE_OFFSET,
> +					     IMX492_EXPOSURE_STEP,
> +					     IMX492_EXPOSURE_DEFAULT);
> +
> +	imx492->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					       &imx492_ctrl_ops,
> +					       V4L2_CID_ANALOGUE_GAIN,
> +					       IMX492_AGAIN_MIN,
> +					       IMX492_AGAIN_MAX,
> +					       IMX492_AGAIN_STEP,
> +					       IMX492_AGAIN_DEFAULT);
> +
> +	v4l2_ctrl_cluster(2, &imx492->exp_ctrl);
> +
> +	imx492->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +						&imx492_ctrl_ops,
> +						V4L2_CID_VBLANK,
> +						mode->vblank_min,
> +						mode->vblank_max,
> +						1, mode->vblank);
> +	/* Read only controls */
> +	imx492->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +						&imx492_ctrl_ops,
> +						V4L2_CID_HBLANK,
> +						mode->hblank_min,
> +						mode->hblank_max,
> +						1, mode->hblank);
> +	if (imx492->hblank_ctrl)
> +		imx492->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	imx492->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> +					      &imx492_ctrl_ops,
> +					      V4L2_CID_PIXEL_RATE,
> +					      mode->pclk, mode->pclk,
> +					      1, mode->pclk);

Shouldn't this be read-only ?

> +
> +	imx492->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +							&imx492_ctrl_ops,
> +							V4L2_CID_LINK_FREQ,
> +							ARRAY_SIZE(link_freq) -
> +							1,
> +							mode->link_freq_idx,
> +							link_freq);
> +	if (imx492->link_freq_ctrl)
> +		imx492->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx492_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx492_test_pattern_menu) - 1,
> +				     0, 0, imx492_test_pattern_menu);
> +
> +	if (ctrl_hdlr->error) {
> +		dev_err(imx492->dev, "control init failed: %d",	ctrl_hdlr->error);
> +		v4l2_ctrl_handler_free(ctrl_hdlr);
> +		return ctrl_hdlr->error;
> +	}
> +
> +	imx492->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +}
> +
> +/**
> + * imx492_probe() - I2C client device binding
> + * @client: pointer to i2c client device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx492_probe(struct i2c_client *client)
> +{
> +	struct imx492 *imx492;
> +	int ret;
> +
> +	imx492 = devm_kzalloc(&client->dev, sizeof(*imx492), GFP_KERNEL);
> +	if (!imx492)
> +		return -ENOMEM;
> +
> +	imx492->dev = &client->dev;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&imx492->sd, client, &imx492_subdev_ops);
> +
> +	ret = imx492_parse_hw_config(imx492);
> +	if (ret) {
> +		dev_err(imx492->dev, "HW configuration is not supported");
> +		return ret;
> +	}
> +
> +	mutex_init(&imx492->mutex);
> +
> +	ret = imx492_power_on(imx492->dev);
> +	if (ret) {
> +		dev_err(imx492->dev, "failed to power-on the sensor");
> +		goto error_mutex_destroy;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx492_detect(imx492);
> +	if (ret) {
> +		dev_err(imx492->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Set default mode to max resolution */
> +	imx492->cur_mode = &supported_modes[0];
> +	imx492->vblank = imx492->cur_mode->vblank;
> +
> +	ret = imx492_init_controls(imx492);
> +	if (ret) {
> +		dev_err(imx492->dev, "failed to init controls: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	imx492->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx492->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	imx492->scap.capability = V4L2_MODE_HIGHQUALITY | V4L2_CAP_TIMEPERFRAME;
> +	imx492->scap.capturemode = 0;
> +	imx492->scap.timeperframe.denominator = DEFAULT_FPS;
> +	imx492->scap.timeperframe.numerator = 1;
> +
> +	/* Initialize source pad */
> +	imx492->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx492->sd.entity, 1, &imx492->pad);
> +	if (ret) {
> +		dev_err(imx492->dev, "failed to init entity pads: %d", ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev(&imx492->sd);
> +	if (ret < 0) {
> +		dev_err(imx492->dev, "failed to register async subdev: %d", ret);
> +		goto error_media_entity;
> +	}

This should be done at the very end of probe(), as the sensor can be
used right after it gets registered, so it should be fully operational.

> +
> +	pm_runtime_set_active(imx492->dev);
> +	pm_runtime_enable(imx492->dev);
> +	pm_runtime_idle(imx492->dev);

While at it, I would also implement autosuspend. You should then add a
call to pm_runtime_get_noresume() before pm_runtime_enable(), drop the
pm_runtime_idle() call, and add

	pm_runtime_set_autosuspend_delay(imx492->dev, 1000);
	pm_runtime_use_autosuspend(imx492->dev);
	pm_runtime_put_autosuspend(imx492->dev);

You will also need to replace pm_runtime_put() with
pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend() above.

> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx492->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(imx492->sd.ctrl_handler);
> +error_power_off:
> +	imx492_power_off(imx492->dev);
> +error_mutex_destroy:
> +	mutex_destroy(&imx492->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx492_remove() - I2C client device unbinding
> + * @client: pointer to I2C client device
> + */
> +static void imx492_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx492 *imx492 = to_imx492(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		imx492_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +	mutex_destroy(&imx492->mutex);
> +}
> +
> +static const struct dev_pm_ops imx492_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx492_power_off, imx492_power_on, NULL)
> +};
> +
> +static const struct of_device_id imx492_of_match[] = {
> +	{ .compatible = "sony,imx492_mipi" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx492_of_match);
> +
> +static struct i2c_driver imx492_driver = {
> +	.probe_new = imx492_probe,
> +	.remove = imx492_remove,
> +	.driver = {
> +		.name = "imx492",
> +		.pm = &imx492_pm_ops,
> +		.of_match_table = imx492_of_match,
> +	},
> +};
> +
> +module_i2c_driver(imx492_driver);
> +
> +MODULE_DESCRIPTION("Sony imx492 sensor driver");
> +MODULE_AUTHOR("Petko Manolov <petko.manolov@konsulko.com>");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart
