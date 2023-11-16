Return-Path: <linux-media+bounces-452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D07EE493
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B15D1C209DA
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D64364D7;
	Thu, 16 Nov 2023 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bSDO4Rmh"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9746D101;
	Thu, 16 Nov 2023 07:47:59 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DC1EE000B;
	Thu, 16 Nov 2023 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700149677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2fBlT54bztwE/auyNh4WWfggJcwSGyk8XEpExHksgo=;
	b=bSDO4RmhY7iJ7uuXyvJF1IVXmQW51LeMotykQYh64j186tmHErT2VA5VztY0oL5sE/F5yR
	G/lN4xQ/UZ4ed/6Q2pIDGLSQYOFd7AozK5eMKU/9+AeNOOE4tAzIDNCI9GIVrh70OKoO2Z
	ZVEYQlPIXaowq4aK0rOKWYh0mBnLkM2O8zSnr0mS48vk8sS/k8s5VBD/gok93MDGhYHbef
	kkeNo+JwQy0QnuvUXpJvKHDDZg9TUv5OMypzW77fKGcax/XWpbdD3k13UBnGDyZ7gafAQM
	jOQkCf1Wc8Uic0BGAY/3puJ5Jss9D+6/eM3l49XqwAHF3FAaV+Ht/DeNllczRg==
Date: Thu, 16 Nov 2023 16:47:56 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com
Subject: Re: [PATCH v8 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <ZVY5rLHkf6OftO3w@aptenodytes>
References: <cover.1699449537.git.mehdi.djait@bootlin.com>
 <93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VPBetaUVKulHgPMq"
Content-Disposition: inline
In-Reply-To: <93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait@bootlin.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--VPBetaUVKulHgPMq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mehdi,

This is starting to look good! See more comments below.

On Wed 08 Nov 23, 14:27, Mehdi Djait wrote:
> The Techwell video decoder supports PAL, NTSC standards and
> has a parallel BT.656 output interface.
>=20
> This commit adds support for this device, with basic support
> for NTSC and PAL, along with brightness and contrast controls.
>=20
> The TW9900 is capable of automatic standard detection. This
> driver is implemented with support for PAL and NTSC
> autodetection.
>=20
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> ---
> V7->V8:=20
> - added a mutex to Serialize access to hardware and current mode configur=
ation
> - added back pm_runtime
> - split get_fmt and set_fmt callbacks=20
> - removed the tw9900_cancel_autodetect()
>=20
> V6->V7:=20
> - added #include <linux/bitfield.h> to fix a Warning from the kernel
>   robot
> - removed a dev_info and replaced a dev_err by dev_err_probe
>=20
> V5->V6:=20
> - dropped .skip_top and .field in the supported_modes
> - added error handling for the i2c writes/reads
> - added the colorimetry information to fill_fmt
> - removed pm_runtime
> - added the g_input_status callback
> - dropped SECAM
> - dropped the non-standard PAL/NTSC variants
>=20
> V4->V5:=20
> - Added .querystd() and .g_tvnorms(), dropped the .open() and
>   unified the g_fmt() / s_fmt().
>=20
> V3->V4:=20
> - Fix a warning about an uninitialized ret variable in probe()
>=20
> V2->V3:=20
> - Fix coding-style issues, and remove the use of the bulk API
>   for regulators. Make the driver select the media-controller and
>   V4L2-subdev APIs.
>=20
> V1->V2:=20
> - Set the media entity type to decoder, and implement the
>   s_std/g_std ops
>=20
>  MAINTAINERS                |   6 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/tw9900.c | 771 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 790 insertions(+)
>  create mode 100644 drivers/media/i2c/tw9900.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b47e0b56859..c2e69b642609 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21142,6 +21142,12 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/rc/ttusbir.c
> =20
> +TECHWELL TW9900 VIDEO DECODER
> +M:	Mehdi Djait <mehdi.djait@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/tw9900.c
> +
>  TECHWELL TW9910 VIDEO DECODER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 59ee0ca2c978..a9667428936e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1186,6 +1186,18 @@ config VIDEO_TW2804
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called tw2804.
> =20
> +config VIDEO_TW9900
> +	tristate "Techwell TW9900 video decoder"
> +	depends on VIDEO_DEV && I2C

You should also depend on PM and probably on GPIOLIB too.

> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API

Also select V4L2_ASYNC.

> +	help
> +	  Support for the Techwell tw9900 multi-standard video decoder.

Uppercase "TW9900" here.

> +	  It supports NTSC, PAL standards with auto-detection features.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called tw9900.
> +
>  config VIDEO_TW9903
>  	tristate "Techwell TW9903 video decoder"
>  	depends on VIDEO_DEV && I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index f5010f80a21f..a17ee899a859 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -136,6 +136,7 @@ obj-$(CONFIG_VIDEO_TVP514X) +=3D tvp514x.o
>  obj-$(CONFIG_VIDEO_TVP5150) +=3D tvp5150.o
>  obj-$(CONFIG_VIDEO_TVP7002) +=3D tvp7002.o
>  obj-$(CONFIG_VIDEO_TW2804) +=3D tw2804.o
> +obj-$(CONFIG_VIDEO_TW9900) +=3D tw9900.o
>  obj-$(CONFIG_VIDEO_TW9903) +=3D tw9903.o
>  obj-$(CONFIG_VIDEO_TW9906) +=3D tw9906.o
>  obj-$(CONFIG_VIDEO_TW9910) +=3D tw9910.o
> diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
> new file mode 100644
> index 000000000000..6aa585da0864
> --- /dev/null
> +++ b/drivers/media/i2c/tw9900.c
> @@ -0,0 +1,771 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Techwell TW9900 multi-standard video decoder.
> + *
> + * Copyright (C) 2018 Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/sysfs.h>
> +#include <linux/timer.h>

Not sure timer and sysfs are needed here.

> +#include <linux/delay.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define TW9900_REG_CHIP_ID	0x00
> +#define TW9900_REG_CHIP_STATUS	0x01
> +#define TW9900_REG_CHIP_STATUS_VDLOSS	BIT(7)
> +#define TW9900_REG_CHIP_STATUS_HLOCK	BIT(6)
> +#define TW9900_REG_OUT_FMT_CTL	0x03
> +#define TW9900_REG_OUT_FMT_CTL_STANDBY		0xA7
> +#define TW9900_REG_OUT_FMT_CTL_STREAMING	0xA0
> +#define TW9900_REG_CKHY_HSDLY	0x04
> +#define TW9900_REG_OUT_CTRL_I	0x05
> +#define TW9900_REG_ANALOG_CTL	0x06
> +#define TW9900_REG_CROP_HI	0x07
> +#define TW9900_REG_VDELAY_LO	0x08
> +#define TW9900_REG_VACTIVE_LO	0x09
> +#define TW9900_REG_HACTIVE_LO	0x0B
> +#define TW9900_REG_CNTRL1	0x0C
> +#define TW9900_REG_BRIGHT_CTL	0x10
> +#define TW9900_REG_CONTRAST_CTL	0x11
> +#define TW9900_REG_VBI_CNTL	0x19
> +#define TW9900_REG_ANAL_CTL_II	0x1A
> +#define TW9900_REG_OUT_CTRL_II	0x1B
> +#define TW9900_REG_STD_SEL	0x1C

This register covers both selection and detection so it would be better cal=
led
TW9900_REG_STD. The docs call it "SDT" but that's a really bad decision.

> +#define TW9900_REG_STD_SEL_AUTODETECT_IN_PROGRESS BIT(7)

And this one is a bit long without a good reason. You could call it:
TW9900_REG_STD_AUTO_PROGRESS

And please tab-align all the defines to the longest one (or don't tab-align
at all, but keep it consistent).

> +#define TW9900_STDNOW_MASK	GENMASK(6, 4)
> +#define TW9900_REG_STDR		0x1D
> +#define TW9900_REG_MISSCNT	0x26
> +#define TW9900_REG_MISC_CTL_II	0x2F
> +#define TW9900_REG_VVBI		0x55
> +
> +#define TW9900_CHIP_ID		0x00
> +
> +#define VSYNC_POLL_INTERVAL_MS	20
> +#define VSYNC_WAIT_MAX_POLLS	50
> +
> +#define TW9900_STD_NTSC_M	0
> +#define TW9900_STD_PAL_BDGHI	1
> +#define TW9900_STD_AUTO		7
> +
> +#define TW9900_VIDEO_POLL_TRIES 20

Same comment about tab-alignment.

> +
> +struct regval {
> +	u8 addr;
> +	u8 val;
> +};
> +
> +struct tw9900_mode {
> +	u32 width;
> +	u32 height;
> +	u32 std;
> +	const struct regval *reg_list;
> +	int n_regs;
> +};
> +
> +struct tw9900 {
> +	struct i2c_client *client;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator *regulator;
> +
> +	bool streaming;

This one should also be covered by the mutex. It's global state that needs
to be kept consistent across multiple users.

> +
> +	struct v4l2_subdev subdev;
> +	struct v4l2_ctrl_handler hdl;
> +	struct media_pad pad;
> +
> +	/* Serialize access to hardware and current mode configuration. */

You can mention "global state" instead of "current mode configuration".

> +	struct mutex mutex;
> +
> +	const struct tw9900_mode *cur_mode;
> +};
> +
> +#define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
> +
> +static const struct regval tw9900_init_regs[] =3D {
> +	{ TW9900_REG_MISC_CTL_II,	0xE6 },
> +	{ TW9900_REG_MISSCNT,		0x24 },
> +	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
> +	{ TW9900_REG_ANAL_CTL_II,	0x0A },
> +	{ TW9900_REG_VDELAY_LO,		0x19 },
> +	{ TW9900_REG_STD_SEL,		0x00 },
> +	{ TW9900_REG_VACTIVE_LO,	0xF0 },
> +	{ TW9900_REG_STD_SEL,		0x07 },
> +	{ TW9900_REG_CKHY_HSDLY,	0x00 },
> +	{ TW9900_REG_ANALOG_CTL,	0x80 },
> +	{ TW9900_REG_CNTRL1,		0xDC },
> +	{ TW9900_REG_OUT_CTRL_I,	0x98 },
> +};
> +
> +static const struct regval tw9900_pal_regs[] =3D {
> +	{ TW9900_REG_STD_SEL,		0x01 },
> +};
> +
> +static const struct regval tw9900_ntsc_regs[] =3D {
> +	{ TW9900_REG_OUT_FMT_CTL,	0xA4 },
> +	{ TW9900_REG_VDELAY_LO,		0x12 },
> +	{ TW9900_REG_VACTIVE_LO,	0xF0 },
> +	{ TW9900_REG_CROP_HI,		0x02 },
> +	{ TW9900_REG_HACTIVE_LO,	0xD0 },
> +	{ TW9900_REG_VBI_CNTL,		0x01 },
> +	{ TW9900_REG_STD_SEL,		0x00 },
> +};
> +
> +static const struct tw9900_mode supported_modes[] =3D {
> +	{
> +		.width =3D 720,
> +		.height =3D 480,
> +		.std =3D V4L2_STD_NTSC,
> +		.reg_list =3D tw9900_ntsc_regs,
> +		.n_regs =3D ARRAY_SIZE(tw9900_ntsc_regs),
> +	},
> +	{
> +		.width =3D 720,
> +		.height =3D 576,
> +		.std =3D V4L2_STD_PAL,
> +		.reg_list =3D tw9900_pal_regs,
> +		.n_regs =3D ARRAY_SIZE(tw9900_pal_regs),
> +	},
> +};
> +
> +static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_write_byte_data(client, reg, val);
> +	if (ret < 0)
> +		dev_err(&client->dev, "write reg error: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int tw9900_write_array(struct i2c_client *client,
> +			      const struct regval *regs, int n_regs)
> +{
> +	int i, ret =3D 0;
> +
> +	for (i =3D 0; i < n_regs; i++) {
> +		ret =3D tw9900_write_reg(client, regs[i].addr, regs[i].val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tw9900_read_reg(struct i2c_client *client, u8 reg)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_byte_data(client, reg);
> +	if (ret < 0)
> +		dev_err(&client->dev, "read reg error: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void tw9900_fill_fmt(const struct tw9900_mode *mode,
> +			    struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt->width =3D mode->width;
> +	fmt->height =3D mode->height;
> +	fmt->field =3D V4L2_FIELD_NONE;
> +	fmt->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +	fmt->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> +	fmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M=
);
> +	fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M=
);
> +}
> +
> +static int tw9900_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt =3D &fmt->format;
> +
> +	mutex_lock(&tw9900->mutex);
> +	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
> +	mutex_unlock(&tw9900->mutex);
> +
> +	return 0;
> +}
> +
> +static int tw9900_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	if (tw9900->streaming)
> +		return -EBUSY;

You need this check to be mutex-protected (so you should probably call
tw9900_fill_fmt locked directly here).

> +
> +	return tw9900_get_fmt(sd, sd_state, fmt);
> +}
> +
> +static int tw9900_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	code->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +
> +	return 0;
> +}
> +
> +static int tw9900_power_on(struct tw9900 *tw9900)

Move this to the resume rpm handler directly. No need to have a separate
function.

> +{
> +	int ret;
> +
> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
> +
> +	ret =3D regulator_enable(tw9900->regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(50000, 52000);
> +
> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
> +
> +	usleep_range(1000, 2000);
> +
> +	mutex_lock(&tw9900->mutex);

The mutex should apply to every operation done in this function (i.e. lock =
and
unlock should be the first and last things done) since it deals with global
hardware state.

> +	ret =3D tw9900_write_array(tw9900->client, tw9900_init_regs,
> +				 ARRAY_SIZE(tw9900_init_regs));
> +	mutex_unlock(&tw9900->mutex);
> +
> +	/* This sleep is needed for the Horizontal Sync PLL to lock. */
> +	msleep(300);
> +
> +	return ret;
> +}
> +
> +static void tw9900_power_off(struct tw9900 *tw9900)
> +{

Same comment about folding into rpm suspend and mutex protection.

> +	if (tw9900->reset_gpio)
> +		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
> +
> +	regulator_disable(tw9900->regulator);
> +}
> +
> +static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct tw9900 *tw9900 =3D container_of(ctrl->handler, struct tw9900, hd=
l);
> +	int ret;
> +
> +	if (pm_runtime_suspended(&tw9900->client->dev))
> +		return 0;
> +
> +	/* v4l2_ctrl_lock() locks tw9900->mutex. */
> +	switch (ctrl->id) {
> +	case V4L2_CID_BRIGHTNESS:
> +		ret =3D tw9900_write_reg(tw9900->client, TW9900_REG_BRIGHT_CTL,
> +				       (u8)ctrl->val);
> +		break;
> +	case V4L2_CID_CONTRAST:
> +		ret =3D tw9900_write_reg(tw9900->client, TW9900_REG_CONTRAST_CTL,
> +				       (u8)ctrl->val);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	struct i2c_client *client =3D tw9900->client;
> +	int ret;
> +
> +	if (tw9900->streaming =3D=3D on)
> +		return 0;

You need this check to be mutex-protected.

> +
> +	if (on) {
> +		ret =3D pm_runtime_get_sync(&client->dev);

You should use pm_runtime_resume_and_get instead...

> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);

=2E.. which will gracefull handle this too.

> +			return ret;
> +		}

> +
> +		mutex_lock(&tw9900->mutex);
> +
> +		ret =3D __v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +		if (ret)
> +			goto err_unlock;
> +
> +		ret =3D tw9900_write_array(tw9900->client,
> +					 tw9900->cur_mode->reg_list,
> +					 tw9900->cur_mode->n_regs);
> +		if (ret)
> +			goto err_unlock;
> +
> +		ret =3D tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
> +				       TW9900_REG_OUT_FMT_CTL_STREAMING);
> +		if (ret)
> +			goto err_unlock;
> +
> +	} else {
> +		mutex_lock(&tw9900->mutex);
> +
> +		ret =3D tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
> +				       TW9900_REG_OUT_FMT_CTL_STANDBY);
> +		if (ret)
> +			goto err_unlock;
> +
> +		pm_runtime_put(&client->dev);

You need to call this outside of the lock since it might call suspend (and
deadlock).

> +	}
> +
> +	tw9900->streaming =3D on;
> +	mutex_unlock(&tw9900->mutex);
> +
> +	return 0;
> +
> +err_unlock:
> +	mutex_unlock(&tw9900->mutex);
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static int tw9900_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	return tw9900_power_on(tw9900);
> +}
> +
> +static int tw9900_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	tw9900_power_off(tw9900);
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
> +static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	const struct tw9900_mode *mode;
> +	int i, ret =3D 0;
> +
> +	if (!(std & (V4L2_STD_NTSC | V4L2_STD_PAL)))
> +		return -EINVAL;
> +
> +	mutex_lock(&tw9900->mutex);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supported_modes); i++)
> +		if (supported_modes[i].std & std)
> +			mode =3D &supported_modes[i];
> +	if (!mode) {
> +		ret =3D -EINVAL;
> +		goto out_unlock;
> +	}

You can lock here, the list of supported modes is not going to change.

> +
> +	tw9900->cur_mode =3D mode;
> +
> +out_unlock:
> +	mutex_unlock(&tw9900->mutex);
> +
> +	return ret;
> +}
> +
> +static int tw9900_get_stream_std(struct tw9900 *tw9900,
> +				 v4l2_std_id *std)
> +{
> +	int cur_std, ret;
> +
> +	lockdep_assert_held(&tw9900->mutex);
> +
> +	ret =3D tw9900_read_reg(tw9900->client, TW9900_REG_STD_SEL);
> +	if (ret < 0) {
> +		*std =3D V4L2_STD_UNKNOWN;
> +		return ret;
> +	}
> +
> +	cur_std =3D FIELD_GET(TW9900_STDNOW_MASK, ret);
> +	switch (cur_std) {
> +	case TW9900_STD_NTSC_M:
> +		*std =3D V4L2_STD_NTSC;
> +		break;
> +	case TW9900_STD_PAL_BDGHI:
> +		*std =3D V4L2_STD_PAL;
> +		break;
> +	case TW9900_STD_AUTO:
> +		*std =3D V4L2_STD_UNKNOWN;
> +		break;
> +	default:
> +		*std =3D V4L2_STD_UNKNOWN;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tw9900_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	mutex_lock(&tw9900->mutex);
> +	*std =3D tw9900->cur_mode->std;
> +	mutex_unlock(&tw9900->mutex);
> +
> +	return 0;
> +}
> +
> +static int tw9900_start_autodetect(struct tw9900 *tw9900)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&tw9900->mutex);
> +
> +	ret =3D tw9900_write_reg(tw9900->client, TW9900_REG_STDR,
> +			       BIT(TW9900_STD_NTSC_M) |
> +			       BIT(TW9900_STD_PAL_BDGHI));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tw9900_write_reg(tw9900->client, TW9900_REG_STD_SEL,
> +			       TW9900_STD_AUTO);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tw9900_write_reg(tw9900->client, TW9900_REG_STDR,
> +			       BIT(TW9900_STD_NTSC_M) |
> +			       BIT(TW9900_STD_PAL_BDGHI) |
> +			       BIT(TW9900_STD_AUTO));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Autodetect takes a while to start, and during the starting sequence
> +	 * the autodetection status is reported as done.
> +	 */
> +	msleep(30);
> +
> +	return 0;
> +}
> +
> +static int tw9900_detect_done(struct tw9900 *tw9900, bool *done)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&tw9900->mutex);
> +
> +	ret =3D tw9900_read_reg(tw9900->client, TW9900_REG_STD_SEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	*done =3D !(ret & TW9900_REG_STD_SEL_AUTODETECT_IN_PROGRESS);
> +
> +	return 0;
> +}
> +
> +static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	bool done =3D false;
> +	int i, ret;
> +
> +	if (tw9900->streaming)
> +		return -EBUSY;

You need this to be locked.

> +
> +	ret =3D pm_runtime_get_sync(&tw9900->client->dev);

pm_runtime_resume_and_get here too.

> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&tw9900->client->dev);
> +		return ret;
> +	}
> +
> +	mutex_lock(&tw9900->mutex);
> +
> +	ret =3D tw9900_start_autodetect(tw9900);
> +	if (ret)
> +		goto out_unlock;
> +
> +	for (i =3D 0; i < TW9900_VIDEO_POLL_TRIES; i++) {
> +		ret =3D tw9900_detect_done(tw9900, &done);
> +		if (ret)
> +			goto out_unlock;
> +
> +		if (done)
> +			break;
> +
> +		msleep(20);
> +	}
> +
> +	if (!done) {
> +		ret =3D -ETIMEDOUT;
> +		goto out_unlock;
> +	}
> +
> +	ret =3D tw9900_get_stream_std(tw9900, std);
> +
> +out_unlock:
> +	mutex_unlock(&tw9900->mutex);
> +	pm_runtime_put(&tw9900->client->dev);
> +
> +	return ret;
> +}
> +
> +static int tw9900_g_tvnorms(struct v4l2_subdev *sd, v4l2_std_id *std)
> +{
> +	*std =3D V4L2_STD_NTSC | V4L2_STD_PAL;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops tw9900_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(tw9900_runtime_suspend,
> +			   tw9900_runtime_resume, NULL)

The macro is not useful as soon as you depend on PM, so you can just direct=
ly
register callbacks for runtime_suspend/runtime_resume here.

> +};

Also you should move the definition closer to the i2c_driver definition.

> +
> +static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
> +{
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +	int ret;
> +
> +	*status =3D V4L2_IN_ST_NO_SIGNAL;
> +
> +	ret =3D pm_runtime_get_sync(&tw9900->client->dev);

pm_runtime_resume_and_get here too.

> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&tw9900->client->dev);
> +		return ret;
> +	}
> +
> +	mutex_lock(&tw9900->mutex);
> +	ret =3D tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
> +	mutex_unlock(&tw9900->mutex);
> +

You can put the call to pm_runtime_put unconditionally here: the return code
value is not going to change because we cut power ;)

> +	if (ret < 0) {
> +		pm_runtime_put(&tw9900->client->dev);
> +		return ret;
> +	}
> +
> +	*status =3D ret & TW9900_REG_CHIP_STATUS_HLOCK ? 0 : V4L2_IN_ST_NO_SIGN=
AL;
> +
> +	pm_runtime_put(&tw9900->client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops tw9900_core_ops =3D {
> +	.subscribe_event	=3D tw9900_subscribe_event,
> +	.unsubscribe_event	=3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops tw9900_video_ops =3D {
> +	.s_std		=3D tw9900_s_std,
> +	.g_std		=3D tw9900_g_std,
> +	.querystd	=3D tw9900_querystd,
> +	.g_tvnorms	=3D tw9900_g_tvnorms,
> +	.g_input_status =3D tw9900_g_input_status,
> +	.s_stream	=3D tw9900_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops tw9900_pad_ops =3D {
> +	.enum_mbus_code		=3D tw9900_enum_mbus_code,

Looks like there's one not-needed tab for alignment here.

> +	.get_fmt		=3D tw9900_get_fmt,
> +	.set_fmt		=3D tw9900_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops tw9900_subdev_ops =3D {
> +	.core	=3D &tw9900_core_ops,
> +	.video	=3D &tw9900_video_ops,
> +	.pad	=3D &tw9900_pad_ops,
> +};
> +
> +static const struct v4l2_ctrl_ops tw9900_ctrl_ops =3D {
> +	.s_ctrl	=3D tw9900_s_ctrl,
> +};
> +
> +static int tw9900_check_id(struct tw9900 *tw9900,
> +			   struct i2c_client *client)
> +{
> +	struct device *dev =3D &tw9900->client->dev;
> +	int ret;
> +
> +	mutex_lock(&tw9900->mutex);
> +	ret =3D tw9900_read_reg(client, TW9900_CHIP_ID);
> +	mutex_unlock(&tw9900->mutex);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret !=3D TW9900_CHIP_ID) {
> +		dev_err(dev, "Unexpected decoder id %#x\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tw9900_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct v4l2_ctrl_handler *hdl;
> +	struct tw9900 *tw9900;
> +	int ret =3D 0;
> +
> +	tw9900 =3D devm_kzalloc(dev, sizeof(*tw9900), GFP_KERNEL);
> +	if (!tw9900)
> +		return -ENOMEM;
> +
> +	tw9900->client =3D client;
> +	tw9900->cur_mode =3D &supported_modes[0];
> +
> +	tw9900->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(tw9900->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(tw9900->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	tw9900->regulator =3D devm_regulator_get(&tw9900->client->dev, "vdd");
> +	if (IS_ERR(tw9900->regulator))
> +		return dev_err_probe(dev, PTR_ERR(tw9900->regulator),
> +				     "Failed to get power regulator\n");
> +
> +	v4l2_i2c_subdev_init(&tw9900->subdev, client, &tw9900_subdev_ops);
> +	tw9900->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +				V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	mutex_init(&tw9900->mutex);
> +
> +	hdl =3D &tw9900->hdl;
> +
> +	ret =3D v4l2_ctrl_handler_init(hdl, 2);
> +	if (ret)
> +		return ret;
> +
> +	hdl->lock =3D &tw9900->mutex;
> +
> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_BRIGHTNESS,
> +			  -128, 127, 1, 0);
> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
> +			  0, 255, 1, 0x60);
> +
> +	tw9900->subdev.ctrl_handler =3D hdl;
> +	if (hdl->error) {
> +		ret =3D hdl->error;
> +		goto err_free_handler;
> +	}
> +
> +	ret =3D tw9900_power_on(tw9900);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret =3D tw9900_check_id(tw9900, client);
> +	if (ret)
> +		goto err_power_off;

I would move this check after the rpm init so you can use the regular
pm_runtime_resume_and_get. Also don't forget to put because we still don't
want to keep the device powered at all times!

> +
> +	tw9900->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	tw9900->subdev.entity.function =3D MEDIA_ENT_F_DV_DECODER;
> +
> +	ret =3D media_entity_pads_init(&tw9900->subdev.entity, 1, &tw9900->pad);
> +	if (ret < 0)
> +		goto err_power_off;
> +
> +	ret =3D v4l2_async_register_subdev(&tw9900->subdev);
> +	if (ret) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_entity;
> +	}

But we still want to keep this at the end (after checking the chip id).

> +
> +	pm_runtime_set_active(dev);

Don't set it active, set it to suspended instead with pm_runtime_set_suspen=
ded.

> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);

No need for this.

> +
> +	return 0;
> +
> +err_clean_entity:
> +	media_entity_cleanup(&tw9900->subdev.entity);
> +err_power_off:
> +	tw9900_power_off(tw9900);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(hdl);
> +	mutex_destroy(&tw9900->mutex);
> +
> +	return ret;
> +}
> +
> +static void tw9900_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct tw9900 *tw9900 =3D to_tw9900(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		tw9900_power_off(tw9900);

If all calls are balanced you should not need this. You might still want to
call pm_runtime_suspend under this condition, but you need to do it before =
you
call pm_runtime_disable.

> +
> +	pm_runtime_set_suspended(&client->dev);

This is not useful, you can remove it.

> +	mutex_destroy(&tw9900->mutex);
> +}
> +
> +static const struct i2c_device_id tw9900_id[] =3D {
> +	{ "tw9900", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tw9900_id);
> +
> +static const struct of_device_id tw9900_of_match[] =3D {
> +	{ .compatible =3D "techwell,tw9900" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tw9900_of_match);
> +
> +static struct i2c_driver tw9900_i2c_driver =3D {
> +	.driver =3D {
> +		.name		=3D "tw9900",
> +		.pm		=3D &tw9900_pm_ops,
> +		.of_match_table	=3D tw9900_of_match,
> +	},
> +	.probe	  =3D tw9900_probe,
> +	.remove	  =3D tw9900_remove,
> +	.id_table =3D tw9900_id,
> +};
> +
> +module_i2c_driver(tw9900_i2c_driver);
> +
> +MODULE_DESCRIPTION("tw9900 decoder driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.41.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VPBetaUVKulHgPMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVWOawACgkQ3cLmz3+f
v9GsoQgAmvmRZBwBSDFzBB9V3rrkQk8I6bysKJWtERxQ/8k039I5SWoXFvNA0qGp
YcpFW5Svry4y5JtP6j3YQP9EOa6Cvxb1VhhzZinpwfBN8Pch7Y1yRvplvbzNRu8t
7qE1PH4WeJc3UwewFs1fP9jpg2nRdxmo29F9TQ3wfoW56pLwXSB7g6nZYxYH5XS6
BCSTJE+POgMBn+htHbmOmEteEz7tmYUqaJ7gYFdJFT/cjOLOkVh4bJjHtGzzQEYM
U0nQxad15ralpLiUsnceG2R1l8PLIAr2wak/zGDbSKsWaEk1jdPUuBy7esgz2k34
QoT/TE88PPEIBg26T/DAFVtwTW0Siw==
=0Ygt
-----END PGP SIGNATURE-----

--VPBetaUVKulHgPMq--

