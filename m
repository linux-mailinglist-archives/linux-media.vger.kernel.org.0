Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4AB2B1DE7
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 16:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgKMPAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 10:00:25 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34847 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgKMPAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 10:00:24 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D1C3E4001B;
        Fri, 13 Nov 2020 15:00:16 +0000 (UTC)
Date:   Fri, 13 Nov 2020 16:00:16 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <20201113150016.GA2027644@aptenodytes>
References: <20201113134417.471445-1-maxime.chevallier@bootlin.com>
 <20201113134417.471445-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20201113134417.471445-4-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 13 Nov 20, 14:44, Maxime Chevallier wrote:
> The Techwell video decoder supports PAL, NTSC and SECAM input formats,
> and outputs a BT.656 signal.
>=20
> This commit adds support for this device, with basic support for NTSC
> and PAL, along with brightness and contrast controls.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v1 -> v2: Set the media entity type to decoder, and implement the
> s_std/g_std ops
>=20
>  MAINTAINERS                |   6 +
>  drivers/media/i2c/Kconfig  |   9 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/tw9900.c | 661 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 677 insertions(+)
>  create mode 100644 drivers/media/i2c/tw9900.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da6d8c154e4..2890862a8285 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17160,6 +17160,12 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/rc/ttusbir.c
> =20
> +TECHWELL TW9900 VIDEO DECODER
> +M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/tw9900.c
> +
>  TECHWELL TW9910 VIDEO DECODER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 878f66ef2719..ea55aea4d949 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -426,6 +426,15 @@ config VIDEO_TW2804
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called tw2804.
> =20
> +config VIDEO_TW9900
> +	tristate "Techwell TW9900 video decoder"
> +	depends on VIDEO_V4L2 && I2C
> +	help
> +	  Support for the Techwell tw9900 multi-standard video decoder.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called tw9900.
> +
>  config VIDEO_TW9903
>  	tristate "Techwell TW9903 video decoder"
>  	depends on VIDEO_V4L2 && I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index f0a77473979d..cbc1d9aedd38 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_VIDEO_TVP5150) +=3D tvp5150.o
>  obj-$(CONFIG_VIDEO_TVP514X) +=3D tvp514x.o
>  obj-$(CONFIG_VIDEO_TVP7002) +=3D tvp7002.o
>  obj-$(CONFIG_VIDEO_TW2804) +=3D tw2804.o
> +obj-$(CONFIG_VIDEO_TW9900) +=3D tw9900.o
>  obj-$(CONFIG_VIDEO_TW9903) +=3D tw9903.o
>  obj-$(CONFIG_VIDEO_TW9906) +=3D tw9906.o
>  obj-$(CONFIG_VIDEO_TW9910) +=3D tw9910.o
> diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
> new file mode 100644
> index 000000000000..2075c3c120af
> --- /dev/null
> +++ b/drivers/media/i2c/tw9900.c
> @@ -0,0 +1,661 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Techwell TW9900 multi-standard video decoder.
> + *
> + * Copyright (C) 2018 Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/sysfs.h>
> +#include <linux/timer.h>
> +#include <linux/delay.h>

This header is not sorted.

> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define TW9900_REG_CHIP_ID	0x00
> +#define TW9900_REG_CHIP_STATUS  0x01

You have whitespaces here for alignment, not tabs.
Same goes for the various other values below.

> +#define		TW9900_REG_CHIP_STATUS_VLOCK	0x08
> +#define		TW9900_REG_CHIP_STATUS_VDLOSS	0x80

Looks like you have two tabs here instead of a whitespace.

> +#define TW9900_REG_OUT_FMT_CTL  0x03
> +#define TW9900_REG_CKHY_HSDLY   0x04
> +#define TW9900_REG_OUT_CTRL_I	0x05
> +#define TW9900_REG_ANALOG_CTL   0x06
> +#define TW9900_REG_CROP_HI	0x07
> +#define TW9900_REG_VDELAY_LO    0x08
> +#define TW9900_REG_VACTIVE_LO   0x09
> +#define TW9900_REG_HACTIVE_LO	0x0B
> +#define TW9900_REG_CNTRL1	0x0C
> +#define TW9900_REG_BRIGHT_CTL   0x10
> +#define TW9900_REG_CONTRAST_CTL 0x11
> +#define TW9900_REG_VBI_CNTL	0x19
> +#define TW9900_REG_ANAL_CTL_II  0x1A
> +#define TW9900_REG_OUT_CTRL_II	0x1B
> +#define TW9900_REG_STD_SEL      0x1C
> +#define TW9900_REG_MISSCNT      0x26
> +#define TW9900_REG_MISC_CTL_II  0x2F
> +#define TW9900_REG_VVBI         0x55
> +
> +#define TW9900_CHIP_ID		0x00
> +
> +#define REG_SC_CTRL_MODE		TW9900_REG_OUT_FMT_CTL

Why redeefine this here?

> +#define     SC_CTRL_MODE_STANDBY	0xA7
> +#define     SC_CTRL_MODE_STREAMING	0xA0

YOu have a bunch of whitespaces after define here.

> +
> +#define REG_NULL			0xFF

Maybe an explicit name like END or TERMINATOR would be more useful.

You could also avoid using a terminator by passing explicit array sizes,
which I find more elegant, but it's a personal taste.

> +
> +#define VSYNC_POLL_INTERVAL_MS  20
> +#define VSYNC_WAIT_MAX_POLLS    50
> +
> +static const char * const tw9900_supply_names[] =3D {
> +	"vdd",
> +};
> +
> +#define TW9900_NUM_SUPPLIES ARRAY_SIZE(tw9900_supply_names)

Why use the regulator bulk API here if there's only one regulator?
Also, it could be nice to have static declarations after struct definitions.

> +
> +struct regval {
> +	u8 addr;
> +	u8 val;
> +};
> +
> +struct tw9900_mode {
> +	u32 width;
> +	u32 height;
> +	u32 skip_top;
> +	u32 std;
> +	u32 field;
> +	const struct regval *reg_list;
> +};
> +
> +struct tw9900 {
> +	struct i2c_client	*client;
> +	struct gpio_desc	*reset_gpio;
> +	struct regulator_bulk_data supplies[TW9900_NUM_SUPPLIES];
> +
> +	bool			streaming;
> +
> +	struct v4l2_subdev	subdev;
> +	struct v4l2_ctrl_handler hdl;
> +	struct media_pad	pad;
> +
> +	struct timer_list timer;
> +	struct work_struct work_i2c_poll;
> +
> +	const struct tw9900_mode *cur_mode;
> +};

Alignment in the structure above is inconsistent.

> +
> +#define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
> +
> +static const struct regval tw9900_init_regs[] =3D {
> +	{TW9900_REG_MISC_CTL_II,	0xE6},
> +	{TW9900_REG_MISSCNT,		0x24},
> +	{TW9900_REG_OUT_FMT_CTL,	0xA7},
> +	{TW9900_REG_ANAL_CTL_II,	0x0A},
> +	{TW9900_REG_VDELAY_LO,		0x19},
> +	{TW9900_REG_STD_SEL,		0x00},
> +	{TW9900_REG_VACTIVE_LO,		0xF0},
> +	{TW9900_REG_STD_SEL,		0x07},
> +	{TW9900_REG_CKHY_HSDLY,		0x40},
> +	{TW9900_REG_ANALOG_CTL,		0x80},
> +	{TW9900_REG_CNTRL1,		0xdc},
> +	{TW9900_REG_OUT_CTRL_I,		0x98},
> +	{REG_NULL, 0x0},

Maybe add whitespaces after { and before } and pad the final entry too.

> +};
> +
> +static const struct regval tw9900_pal_regs[] =3D {
> +	{TW9900_REG_STD_SEL, 0x01},
> +	{REG_NULL, 0x0},
> +};
> +
> +static const struct regval tw9900_ntsc_regs[] =3D {
> +	{TW9900_REG_OUT_FMT_CTL, 0xA4},
> +	{TW9900_REG_VDELAY_LO, 0x12},
> +	{TW9900_REG_VACTIVE_LO, 0xf0},
> +	{TW9900_REG_CROP_HI, 0x02},
> +	{TW9900_REG_HACTIVE_LO, 0xD0},
> +	{TW9900_REG_VBI_CNTL, 0x01},
> +	{TW9900_REG_STD_SEL, 0x00},
> +	{REG_NULL, 0x0},
> +};

And ditto for the above.

> +
> +static const struct tw9900_mode supported_modes[] =3D {
> +	{
> +		.width =3D 720,
> +		.height =3D 576,
> +		.skip_top =3D 0,
> +		.std =3D V4L2_STD_PAL,
> +		.field =3D V4L2_FIELD_NONE,
> +		.reg_list =3D tw9900_pal_regs,
> +	},
> +	{
> +		.width =3D 720,
> +		.height =3D 480,
> +		.skip_top =3D 0,
> +		.std =3D V4L2_STD_NTSC,
> +		.field =3D V4L2_FIELD_NONE,
> +		.reg_list =3D tw9900_ntsc_regs,
> +	},
> +};
> +
> +static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_write_byte_data(client, reg, val);
> +
> +	if (ret < 0)
> +		dev_err(&client->dev, "write reg error: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int tw9900_write_array(struct i2c_client *client,
> +			      const struct regval *regs)
> +{
> +	int i, ret =3D 0;
> +
> +	for (i =3D 0; ret =3D=3D 0 && regs[i].addr !=3D REG_NULL; i++)
> +		ret =3D tw9900_write_reg(client, regs[i].addr, regs[i].val);
> +
> +	return ret;
> +}
> +
> +static inline u8 tw9900_read_reg(struct i2c_client *client, u8 reg)
> +{
> +	return i2c_smbus_read_byte_data(client, reg);
> +}
> +
> +static void tw9900_fill_fmt(const struct tw9900_mode *mode,
> +			    struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt->width =3D mode->width;
> +	fmt->height =3D mode->height;
> +	fmt->field =3D mode->field;
> +	fmt->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> +}
> +
> +static int tw9900_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt =3D &fmt->format;
> +
> +	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
> +
> +	mbus_fmt->width =3D tw9900->cur_mode->width;
> +	mbus_fmt->height =3D tw9900->cur_mode->height;
> +
> +	return 0;
> +}
> +
> +static int tw9900_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt =3D &fmt->format;
> +
> +	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
> +
> +	return 0;
> +}
> +
> +static int tw9900_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index >=3D ARRAY_SIZE(supported_modes))
> +		return -EINVAL;

This check looks unrelated to the mbus code. If only one code is supported,
the check should be index >=3D 1.

> +
> +	code->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +
> +	return 0;
> +}
> +
> +static int tw9900_enum_frame_sizes(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	u32 index =3D fse->index;
> +
> +	if (index >=3D ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	fse->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +
> +	fse->min_width  =3D supported_modes[index].width;
> +	fse->max_width  =3D supported_modes[index].width;
> +	fse->max_height =3D supported_modes[index].height;
> +	fse->min_height =3D supported_modes[index].height;
> +
> +	return 0;
> +}
> +
> +static int __tw9900_power_on(struct tw9900 *tw9900)

Why the heading __ ?

> +{
> +	int ret;
> +	struct device *dev =3D &tw9900->client->dev;
> +
> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
> +
> +	ret =3D regulator_bulk_enable(TW9900_NUM_SUPPLIES, tw9900->supplies);
> +	if (ret < 0)
> +		goto error;

Same comment about using the regulator bulk API in this case.

> +
> +	usleep_range(50000, 52000);
> +
> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
> +
> +	usleep_range(1000, 2000);
> +
> +	ret =3D tw9900_write_array(tw9900->client, tw9900_init_regs);
> +	if (ret) {
> +		dev_err(dev, "Failed to init tw9900\n");
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +
> +	return ret;
> +}
> +
> +static void __tw9900_power_off(struct tw9900 *tw9900)

Ditto about __.

> +{
> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
> +
> +	regulator_bulk_disable(TW9900_NUM_SUPPLIES, tw9900->supplies);
> +}
> +
> +static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct tw9900 *tw9900 =3D container_of(ctrl->handler, struct tw9900, hd=
l);
> +
> +	if (pm_runtime_suspended(&tw9900->client->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_BRIGHTNESS:
> +		tw9900_write_reg(tw9900->client, 0x10, (u8)ctrl->val);
> +		break;
> +	case V4L2_CID_CONTRAST:
> +		tw9900_write_reg(tw9900->client, 0x11, (u8)ctrl->val);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct i2c_client *client =3D tw9900->client;
> +	int i, ret =3D 0;
> +
> +	on =3D !!on;
> +	if (on =3D=3D tw9900->streaming)
> +		goto unlock_and_return;
> +
> +	if (on) {
> +		ret =3D pm_runtime_get_sync(&tw9900->client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		ret =3D v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +		if (ret) {
> +			pm_runtime_put(&client->dev);

Maybe add a label at the end with pm_runtime_put instead of duplicating it
everywhere?

> +			goto unlock_and_return;
> +		}
> +
> +		ret =3D tw9900_write_array(tw9900->client,
> +					 tw9900->cur_mode->reg_list);
> +		if (ret) {
> +			pm_runtime_put(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		/* Wait for VSync lock */
> +		for (i =3D 0; i < VSYNC_WAIT_MAX_POLLS; i++) {
> +			u8 status =3D tw9900_read_reg(tw9900->client,
> +						    TW9900_REG_CHIP_STATUS);
> +			if (!(status & TW9900_REG_CHIP_STATUS_VDLOSS) &&
> +			    (status & TW9900_REG_CHIP_STATUS_VLOCK))
> +				break;
> +
> +			msleep(VSYNC_POLL_INTERVAL_MS);
> +		}
> +
> +		ret =3D tw9900_write_reg(client, REG_SC_CTRL_MODE,
> +				       SC_CTRL_MODE_STREAMING);
> +		if (ret) {
> +			pm_runtime_put(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +	} else {
> +		tw9900_write_reg(client, REG_SC_CTRL_MODE,
> +				 SC_CTRL_MODE_STANDBY);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	tw9900->streaming =3D on;
> +
> +unlock_and_return:
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

You might want to make this a requirement of the driver and avoid the ifdefs
for now.

> +static int tw9900_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct v4l2_mbus_framefmt *try_fmt;
> +
> +	try_fmt =3D v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +
> +	/* Initialize try_fmt */
> +	tw9900_fill_fmt(tw9900->cur_mode, try_fmt);
> +
> +	return 0;
> +}
> +#endif
> +
> +static int tw9900_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	return __tw9900_power_on(tw9900);
> +}
> +
> +static int tw9900_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	__tw9900_power_off(tw9900);
> +
> +	return 0;
> +}
> +
> +static int tw9900_subscribe_event(struct v4l2_subdev *sd,
> +				  struct v4l2_fh *fh,
> +				  struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subdev_subscribe(sd, fh, sub);
> +	case V4L2_EVENT_CTRL:
> +		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct tw9900_mode *tw9900_get_mode_from_std(v4l2_std_id st=
d)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supported_modes); i++) {
> +		if (supported_modes[i].std =3D=3D std)
> +			return &supported_modes[i];
> +	}

You can avoid the { } if you want.

> +
> +	return NULL;
> +}
> +
> +static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id norm)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	const struct tw9900_mode *mode;
> +	int ret;
> +
> +	if (!(norm & (V4L2_STD_NTSC | V4L2_STD_PAL)))
> +		return -EINVAL;
> +
> +	mode =3D tw9900_get_mode_from_std(norm);
> +	if (!mode)
> +		return -EINVAL;
> +
> +	ret =3D tw9900_write_array(tw9900->client, mode->reg_list);
> +
> +	if (ret)
> +		return ret;
> +
> +	tw9900->cur_mode =3D mode;
> +
> +	return 0;
> +}
> +
> +static int tw9900_g_std(struct v4l2_subdev *sd, v4l2_std_id *norm)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	*norm =3D tw9900->cur_mode->std;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops tw9900_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(tw9900_runtime_suspend,
> +			   tw9900_runtime_resume, NULL)
> +};
> +
> +static const struct v4l2_subdev_core_ops tw9900_core_ops =3D {
> +	.subscribe_event =3D tw9900_subscribe_event,
> +	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};

This struct would look nicer with tab-padding before the =3D.

> +
> +static const struct v4l2_subdev_video_ops tw9900_video_ops =3D {
> +	.s_std		=3D tw9900_s_std,
> +	.g_std		=3D tw9900_g_std,
> +	.s_stream	=3D tw9900_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops tw9900_pad_ops =3D {
> +	.enum_mbus_code =3D tw9900_enum_mbus_code,
> +	.enum_frame_size =3D tw9900_enum_frame_sizes,
> +	.get_fmt =3D tw9900_get_fmt,
> +	.set_fmt =3D tw9900_set_fmt,
> +};

Same here,

> +
> +static const struct v4l2_subdev_ops tw9900_subdev_ops =3D {
> +	.core	=3D &tw9900_core_ops,
> +	.video	=3D &tw9900_video_ops,
> +	.pad	=3D &tw9900_pad_ops,
> +};
> +
> +static const struct v4l2_ctrl_ops tw9900_ctrl_ops =3D {
> +	.s_ctrl =3D tw9900_s_ctrl,
> +};

here,

> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +static const struct v4l2_subdev_internal_ops tw9900_internal_ops =3D {
> +	.open =3D tw9900_open,

and here.

> +};
> +#endif
> +
> +static int tw9900_check_id(struct tw9900 *tw9900,
> +			   struct i2c_client *client)
> +{
> +	struct device *dev =3D &tw9900->client->dev;
> +	u8 id;
> +
> +	id =3D tw9900_read_reg(client, TW9900_CHIP_ID);
> +
> +	if (id !=3D TW9900_CHIP_ID) {
> +		dev_err(dev, "Unexpected decoder id(%04x)\n", id);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(dev, "Detected TW9900 (%04x) decoder\n", TW9900_CHIP_ID);
> +
> +	return 0;
> +}
> +
> +static int tw9900_configure_regulators(struct tw9900 *tw9900)
> +{
> +	u32 i;
> +
> +	for (i =3D 0; i < TW9900_NUM_SUPPLIES; i++)
> +		tw9900->supplies[i].supply =3D tw9900_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&tw9900->client->dev,
> +				       TW9900_NUM_SUPPLIES,
> +				       tw9900->supplies);
> +}
> +
> +static int tw9900_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct v4l2_ctrl_handler *hdl;
> +	struct tw9900 *tw9900;
> +	int ret;
> +
> +	tw9900 =3D devm_kzalloc(dev, sizeof(*tw9900), GFP_KERNEL);
> +	if (!tw9900)
> +		return -ENOMEM;
> +
> +	tw9900->client =3D client;
> +	tw9900->cur_mode =3D &supported_modes[0];
> +
> +	tw9900->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(tw9900->reset_gpio))
> +		tw9900->reset_gpio =3D NULL;
> +
> +	ret =3D tw9900_configure_regulators(tw9900);
> +	if (ret) {
> +		dev_err(dev, "Failed to get power regulators\n");
> +		return ret;
> +	}
> +
> +	v4l2_i2c_subdev_init(&tw9900->subdev, client, &tw9900_subdev_ops);
> +	tw9900->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_H=
AS_EVENTS;

Break this like.

> +
> +	hdl =3D &tw9900->hdl;
> +
> +	v4l2_ctrl_handler_init(hdl, 2);
> +
> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_BRIGHTNESS,
> +			  -128, 127, 1, 0);
> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
> +			  0, 255, 1, 0x60);
> +
> +	tw9900->subdev.ctrl_handler =3D hdl;
> +	if (hdl->error) {
> +		int err =3D hdl->error;
> +
> +		v4l2_ctrl_handler_free(hdl);
> +		return err;
> +	}
> +
> +	ret =3D __tw9900_power_on(tw9900);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tw9900_check_id(tw9900, client);
> +	if (ret)
> +		goto err_power_off;
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +	tw9900->subdev.internal_ops =3D &tw9900_internal_ops;
> +	tw9900->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +#endif
> +#if defined(CONFIG_MEDIA_CONTROLLER)

If you're going to keep this conditional instead of a requirement of the dr=
iver,
it would look nicer with ifdef instead of if defined() like the block just
before.

> +	tw9900->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	tw9900->subdev.entity.function =3D MEDIA_ENT_F_DV_DECODER;
> +
> +	ret =3D media_entity_pads_init(&tw9900->subdev.entity, 1, &tw9900->pad);
> +	if (ret < 0)
> +		goto err_power_off;
> +#endif
> +
> +	ret =3D v4l2_async_register_subdev(&tw9900->subdev);
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
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&tw9900->subdev.entity);
> +#endif
> +err_power_off:
> +	__tw9900_power_off(tw9900);
> +
> +	return ret;
> +}
> +
> +static int tw9900_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&sd->entity);
> +#endif
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		__tw9900_power_off(tw9900);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id tw9900_id[] =3D {
> +	{"tw9900", 0},
> +	{},
> +};

I was told recently that using i2c_device_id tables is deprecated unless
there's a realy need for it.

> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id tw9900_of_match[] =3D {
> +	{ .compatible =3D "techwell,tw9900" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tw9900_of_match);
> +#endif
> +
> +static struct i2c_driver tw9900_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "tw9900",
> +		.pm =3D &tw9900_pm_ops,
> +		.of_match_table =3D tw9900_of_match

Tab-padding before =3D would look nicer here.

> +	},
> +	.probe		=3D tw9900_probe,
> +	.remove		=3D tw9900_remove,
> +	.id_table	=3D tw9900_id,
> +};
> +
> +module_i2c_driver(tw9900_i2c_driver);
> +
> +MODULE_DESCRIPTION("tw9900 decoder driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.25.4

Cheers,

Paul


--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+un4AACgkQ3cLmz3+f
v9EOZQf9EnK7y237I9yB1Z2gZkKkk4jDzbZQesSk6MWTapGESrEeyaQRcyODRqWt
VrWlaHzwnRefEaQynBEPYFTUELvmg4q1865Qx8OSXU1BnxJ64eekoJ5yG4Gf1H3J
R5OUO6kKGWiQykQ74cz8Q0OkOg2Epi1OVc3RhJYWN0+ONljFn6EP4b5Sux1CaCq1
uS6SOouwKbBmSEq6yDX4JyRaqWx2PHKHqw4SqCf7LmhM9ahy5RWhAkMohNloE0Wx
CKMWJXwmBfrV5xyGOXL6t1RPvYZrheK1gUrbIhyBjfcgiZlJaHjOZMNenH6CkGZM
4bTf4dc3VidzTMoR3Eq3nKVqYpiAKw==
=km//
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
