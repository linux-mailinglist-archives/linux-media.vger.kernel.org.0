Return-Path: <linux-media+bounces-38023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A321B08EDB
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 16:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD5C562F83
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762452F6FAE;
	Thu, 17 Jul 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qO2FjPsd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EA1C84A8;
	Thu, 17 Jul 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752761407; cv=none; b=M+EtXBVjTFbW2QqOrBQtJK7YxM+HR+oKiEKiCq9Emb8ZgubssjwnohWPlz3HTCLzPYmrr2V1k4y5sudZjIPAXLCPg2Yp6FNDpqW36EtO9IXfG9r/mTvLS6tv67kvR9eCsIVG9CMQWf2UpL0FY+cW20+rY2V5WV3z4qdgPtgnFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752761407; c=relaxed/simple;
	bh=UfLOYC3WzAAzYSafTJcpDf5VHPbuPdW34ZZDA6ePfrA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=JNJbN79M171WrSLRzeBSessWHr9GT1qUbDf0VmmAtqCdcAuQmI9/ix6f7HsJSm43CVq9dI7LRD7mqfWzeDUT4KVlhJPZ96i/KSu60LDcRdgOrF0nNMlbpNp0XwArWPmq5FICzz23USozSEAviaNpcS6NUPbFf628kuGgA3vKjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qO2FjPsd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A817198D;
	Thu, 17 Jul 2025 16:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752761363;
	bh=UfLOYC3WzAAzYSafTJcpDf5VHPbuPdW34ZZDA6ePfrA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qO2FjPsdp3ymp601k5WFMdRqM4wrip9h+5Ji0vvCX7g1K/SA3Ik/hGanJnPAgO6YH
	 aBpxQJCNEOAZa8YAsFHxIshn+JqhIhefz7OYIRjVEIma3SsYrP/eLOD9uDmjtxQXVJ
	 +BpzA1ZxhCT5ESsM7xtCv+ds0nhjHnadFF7Zxc/k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org> <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date: Thu, 17 Jul 2025 15:09:55 +0100
Message-ID: <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Vladimir Zapolskiy (2025-07-17 13:40:01)
> OmniVision OV6211 is a monochrome image sensor, which produces frames in
> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
> output image resolution modes.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  MAINTAINERS                |   8 +
>  drivers/media/i2c/Kconfig  |   9 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ov6211.c | 877 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 895 insertions(+)
>  create mode 100644 drivers/media/i2c/ov6211.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1ef99240a57e..364914ca2d45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18433,6 +18433,14 @@ S:     Maintained
>  T:     git git://linuxtv.org/media.git
>  F:     drivers/media/i2c/ov5695.c
> =20
> +OMNIVISION OV6211 SENSOR DRIVER
> +M:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git
> +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
> +F:     drivers/media/i2c/ov6211.c
> +
>  OMNIVISION OV64A40 SENSOR DRIVER
>  M:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:     linux-media@vger.kernel.org
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 6237fe804a5c..2c54753e1b25 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -542,6 +542,15 @@ config VIDEO_OV5695
>           To compile this driver as a module, choose M here: the
>           module will be called ov5695.
> =20
> +config VIDEO_OV6211
> +       tristate "OmniVision OV6211 sensor support"
> +       help
> +         This is a Video4Linux2 sensor driver for the OmniVision
> +         OV6211 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ov6211.
> +
>  config VIDEO_OV64A40
>         tristate "OmniVision OV64A40 sensor support"
>         select V4L2_CCI_I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 5873d29433ee..03814fc8e2f7 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_VIDEO_OV5670) +=3D ov5670.o
>  obj-$(CONFIG_VIDEO_OV5675) +=3D ov5675.o
>  obj-$(CONFIG_VIDEO_OV5693) +=3D ov5693.o
>  obj-$(CONFIG_VIDEO_OV5695) +=3D ov5695.o
> +obj-$(CONFIG_VIDEO_OV6211) +=3D ov6211.o
>  obj-$(CONFIG_VIDEO_OV64A40) +=3D ov64a40.o
>  obj-$(CONFIG_VIDEO_OV6650) +=3D ov6650.o
>  obj-$(CONFIG_VIDEO_OV7251) +=3D ov7251.o
> diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
> new file mode 100644
> index 000000000000..f2a9daf40896
> --- /dev/null
> +++ b/drivers/media/i2c/ov6211.c
> @@ -0,0 +1,877 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2024-2025 Linaro Ltd
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define OV6211_REG_VALUE_08BIT         1
> +#define OV6211_REG_VALUE_16BIT         2
> +#define OV6211_REG_VALUE_24BIT         3
> +
> +#define OV6211_LINK_FREQ_240MHZ                240000000ULL
> +#define OV6211_MCLK_FREQ_24MHZ         24000000
> +#define OV6211_DATA_LANES              1
> +
> +#define OV6211_REG_CHIP_ID             0x300a
> +#define OV6211_CHIP_ID                 0x6710
> +
> +#define OV6211_REG_MODE_SELECT         0x0100
> +#define OV6211_MODE_STANDBY            0x00
> +#define OV6211_MODE_STREAMING          0x01
> +
> +/* Exposure controls from sensor */
> +#define OV6211_REG_EXPOSURE            0x3500
> +#define OV6211_EXPOSURE_MIN            1
> +#define OV6211_EXPOSURE_MAX_MARGIN     4
> +#define OV6211_EXPOSURE_STEP           1
> +#define OV6211_EXPOSURE_DEFAULT                210
> +
> +/* Analogue gain controls from sensor */
> +#define OV6211_REG_ANALOGUE_GAIN       0x350a
> +#define OV6211_ANALOGUE_GAIN_MIN       1
> +#define OV6211_ANALOGUE_GAIN_MAX       0x3ff
> +#define OV6211_ANALOGUE_GAIN_STEP      1
> +#define OV6211_ANALOGUE_GAIN_DEFAULT   0xa0
> +
> +#define to_ov6211(_sd)                 container_of(_sd, struct ov6211, =
sd)
> +
> +struct ov6211_reg {
> +       u16 address;
> +       u8 val;
> +};
> +
> +struct ov6211_reg_list {
> +       const struct ov6211_reg *regs;
> +       u32 num_of_regs;
> +};
> +
> +struct ov6211_mode {
> +       /* Frame width in pixels */
> +       u32 width;
> +
> +       /* Frame height in pixels */
> +       u32 height;
> +
> +       /* Horizontal timining size */
> +       u32 hts;
> +
> +       /* Default vertical timining size */
> +       u32 vts;
> +
> +       /* Sensor register settings for this resolution */
> +       const struct ov6211_reg_list reg_list;
> +};
> +
> +static const s64 link_freq_menu_items[] =3D {
> +       OV6211_LINK_FREQ_240MHZ,
> +};
> +
> +static const struct ov6211_reg mode_400x400_regs[] =3D {
> +       { 0x0103, 0x01 },
> +       { 0x0100, 0x00 },
> +       { 0x3005, 0x08 },
> +       { 0x3013, 0x12 },
> +       { 0x3014, 0x04 },
> +       { 0x3016, 0x10 },
> +       { 0x3017, 0x00 },
> +       { 0x3018, 0x00 },
> +       { 0x301a, 0x00 },
> +       { 0x301b, 0x00 },
> +       { 0x301c, 0x00 },
> +       { 0x3037, 0xf0 },
> +       { 0x3080, 0x01 },
> +       { 0x3081, 0x00 },
> +       { 0x3082, 0x01 },
> +       { 0x3098, 0x04 },
> +       { 0x3099, 0x28 },
> +       { 0x309a, 0x06 },
> +       { 0x309b, 0x04 },
> +       { 0x309c, 0x00 },
> +       { 0x309d, 0x00 },
> +       { 0x309e, 0x01 },
> +       { 0x309f, 0x00 },
> +       { 0x30b0, 0x08 },
> +       { 0x30b1, 0x02 },
> +       { 0x30b2, 0x00 },
> +       { 0x30b3, 0x28 },
> +       { 0x30b4, 0x02 },
> +       { 0x30b5, 0x00 },
> +       { 0x3106, 0xd9 },
> +       { 0x3500, 0x00 },
> +       { 0x3501, 0x0d },
> +       { 0x3502, 0x20 },
> +       { 0x3503, 0x07 },
> +       { 0x3509, 0x10 },
> +       { 0x350b, 0xa0 },
> +       { 0x3600, 0xfc },
> +       { 0x3620, 0xb7 },
> +       { 0x3621, 0x05 },
> +       { 0x3626, 0x31 },
> +       { 0x3627, 0x40 },
> +       { 0x3632, 0xa3 },
> +       { 0x3633, 0x34 },
> +       { 0x3634, 0x40 },
> +       { 0x3636, 0x00 },
> +       { 0x3660, 0x80 },
> +       { 0x3662, 0x03 },
> +       { 0x3664, 0xf0 },
> +       { 0x366a, 0x10 },
> +       { 0x366b, 0x06 },
> +       { 0x3680, 0xf4 },
> +       { 0x3681, 0x50 },
> +       { 0x3682, 0x00 },
> +       { 0x3708, 0x20 },
> +       { 0x3709, 0x40 },
> +       { 0x370d, 0x03 },
> +       { 0x373b, 0x02 },
> +       { 0x373c, 0x08 },
> +       { 0x3742, 0x00 },
> +       { 0x3744, 0x16 },
> +       { 0x3745, 0x08 },
> +       { 0x3781, 0xfc },
> +       { 0x3788, 0x00 },
> +       { 0x3800, 0x00 },
> +       { 0x3801, 0x04 },
> +       { 0x3802, 0x00 },
> +       { 0x3803, 0x04 },
> +       { 0x3804, 0x01 },
> +       { 0x3805, 0x9b },
> +       { 0x3806, 0x01 },
> +       { 0x3807, 0x9b },
> +       { 0x3808, 0x01 },
> +       { 0x3809, 0x90 },

0x190 =3D=3D 400;

> +       { 0x380a, 0x01 },
> +       { 0x380b, 0x90 },

So I bet these are the width and height registers.

Have you got a data sheet for this ? It would be /really/ far more
helpful to break out the specific register updates here for the mode
configuration at least.

> +       { 0x380c, 0x05 },
> +       { 0x380d, 0xf2 },
> +       { 0x380e, 0x01 },
> +       { 0x380f, 0xb6 },
> +       { 0x3810, 0x00 },
> +       { 0x3811, 0x04 },
> +       { 0x3812, 0x00 },
> +       { 0x3813, 0x04 },
> +       { 0x3814, 0x11 },
> +       { 0x3815, 0x11 },
> +       { 0x3820, 0x00 },
> +       { 0x3821, 0x00 },
> +       { 0x382b, 0xfa },
> +       { 0x382f, 0x04 },
> +       { 0x3832, 0x00 },
> +       { 0x3833, 0x05 },
> +       { 0x3834, 0x00 },
> +       { 0x3835, 0x05 },
> +       { 0x3882, 0x04 },
> +       { 0x3883, 0x00 },
> +       { 0x38a4, 0x10 },
> +       { 0x38a5, 0x00 },
> +       { 0x38b1, 0x03 },
> +       { 0x3b80, 0x00 },
> +       { 0x3b81, 0xff },
> +       { 0x3b82, 0x10 },
> +       { 0x3b83, 0x00 },
> +       { 0x3b84, 0x08 },
> +       { 0x3b85, 0x00 },
> +       { 0x3b86, 0x01 },
> +       { 0x3b87, 0x00 },
> +       { 0x3b88, 0x00 },
> +       { 0x3b89, 0x00 },
> +       { 0x3b8a, 0x00 },
> +       { 0x3b8b, 0x05 },
> +       { 0x3b8c, 0x00 },
> +       { 0x3b8d, 0x00 },
> +       { 0x3b8e, 0x01 },
> +       { 0x3b8f, 0xb2 },
> +       { 0x3b94, 0x05 },
> +       { 0x3b95, 0xf2 },
> +       { 0x3b96, 0xc0 },
> +       { 0x4004, 0x04 },
> +       { 0x404e, 0x01 },
> +       { 0x4801, 0x0f },
> +       { 0x4806, 0x0f },
> +       { 0x4837, 0x43 },
> +       { 0x5a08, 0x00 },
> +       { 0x5a01, 0x00 },
> +       { 0x5a03, 0x00 },
> +       { 0x5a04, 0x10 },
> +       { 0x5a05, 0xa0 },
> +       { 0x5a06, 0x0c },
> +       { 0x5a07, 0x78 },
> +};
> +
> +static const struct ov6211_mode supported_modes[] =3D {
> +       {
> +               .width =3D 400,
> +               .height =3D 400,
> +               .hts =3D 1522,
> +               .vts =3D 438,
> +               .reg_list =3D {
> +                       .regs =3D mode_400x400_regs,
> +                       .num_of_regs =3D ARRAY_SIZE(mode_400x400_regs),
> +               },
> +       },
> +};
> +
> +struct ov6211 {
> +       struct clk *xvclk;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator *avdd;
> +       struct regulator *dovdd;
> +       struct regulator *dvdd;
> +
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +
> +       /* V4L2 Controls */
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *exposure;
> +
> +       /* Current mode */
> +       const struct ov6211_mode *cur_mode;
> +
> +       /* To serialize asynchronous callbacks */
> +       struct mutex mutex;
> +};
> +
> +static int ov6211_read_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32 =
*val)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       u8 addr_buf[2], data_buf[4] =3D { 0 };
> +       struct i2c_msg msgs[2];
> +       int ret;
> +
> +       if (len > 4)
> +               return -EINVAL;
> +
> +       put_unaligned_be16(reg, addr_buf);
> +       msgs[0].addr =3D client->addr;
> +       msgs[0].flags =3D 0;
> +       msgs[0].len =3D sizeof(addr_buf);
> +       msgs[0].buf =3D addr_buf;
> +       msgs[1].addr =3D client->addr;
> +       msgs[1].flags =3D I2C_M_RD;
> +       msgs[1].len =3D len;
> +       msgs[1].buf =3D &data_buf[4 - len];
> +
> +       ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +       if (ret !=3D ARRAY_SIZE(msgs))
> +               return -EIO;
> +
> +       *val =3D get_unaligned_be32(data_buf);
> +
> +       return 0;
> +}
> +
> +static int ov6211_write_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32=
 val)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       u8 buf[6];
> +
> +       if (len > 4)
> +               return -EINVAL;
> +
> +       put_unaligned_be16(reg, buf);
> +       put_unaligned_be32(val << 8 * (4 - len), buf + 2);
> +       if (i2c_master_send(client, buf, len + 2) !=3D len + 2)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int ov6211_write_reg_list(struct ov6211 *ov6211,
> +                                const struct ov6211_reg_list *r_list)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < r_list->num_of_regs; i++) {
> +               ret =3D ov6211_write_reg(ov6211, r_list->regs[i].address,=
 1,
> +                                      r_list->regs[i].val);
> +               if (ret) {
> +                       dev_err_ratelimited(&client->dev,
> +                                           "failed to write reg 0x%4.4x.=
 error =3D %d\n",
> +                                           r_list->regs[i].address, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +

Please use CCI helpers now.



> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ov6211 *ov6211 =3D container_of(ctrl->handler, struct ov62=
11,
> +                                            ctrl_handler);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       int ret;
> +
> +       /* V4L2 controls values will be applied only when power is alread=
y up */
> +       if (!pm_runtime_get_if_in_use(&client->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret =3D ov6211_write_reg(ov6211, OV6211_REG_ANALOGUE_GAIN,
> +                                      OV6211_REG_VALUE_16BIT, ctrl->val);
> +               break;
> +       case V4L2_CID_EXPOSURE:
> +               ret =3D ov6211_write_reg(ov6211, OV6211_REG_EXPOSURE,
> +                                      OV6211_REG_VALUE_24BIT, ctrl->val =
<< 4);
> +               break;

What about V4L2_CID_HBLANK and V4L2_CID_VBLANK ?



> +       default:
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +       pm_runtime_put(&client->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov6211_ctrl_ops =3D {
> +       .s_ctrl =3D ov6211_set_ctrl,
> +};
> +
> +static int ov6211_init_controls(struct ov6211 *ov6211)
> +{
> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> +       s64 exposure_max;
> +       int ret;
> +
> +       ctrl_hdlr =3D &ov6211->ctrl_handler;
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 3);
> +       if (ret)
> +               return ret;
> +
> +       ctrl_hdlr->lock =3D &ov6211->mutex;
> +
> +       ov6211->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_c=
trl_ops,
> +                                       V4L2_CID_LINK_FREQ,
> +                                       ARRAY_SIZE(link_freq_menu_items) =
- 1,
> +                                       0, link_freq_menu_items);
> +       if (ov6211->link_freq)
> +               ov6211->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,
> +                         OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_=
MAX,
> +                         OV6211_ANALOGUE_GAIN_STEP,
> +                         OV6211_ANALOGUE_GAIN_DEFAULT);
> +
> +       exposure_max =3D (ov6211->cur_mode->vts - OV6211_EXPOSURE_MAX_MAR=
GIN);
> +       ov6211->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_op=
s,
> +                                            V4L2_CID_EXPOSURE,
> +                                            OV6211_EXPOSURE_MIN, exposur=
e_max,
> +                                            OV6211_EXPOSURE_STEP,
> +                                            OV6211_EXPOSURE_DEFAULT);
> +

As well as the blanking - I think this driver is missing reporting the
crop selection implementation to report the sensor crops.



> +       if (ctrl_hdlr->error)
> +               return ctrl_hdlr->error;
> +
> +       ov6211->sd.ctrl_handler =3D ctrl_hdlr;
> +
> +       return 0;
> +}
> +
> +static void ov6211_update_pad_format(const struct ov6211_mode *mode,
> +                                    struct v4l2_mbus_framefmt *fmt)
> +{
> +       fmt->width =3D mode->width;
> +       fmt->height =3D mode->height;
> +       fmt->code =3D MEDIA_BUS_FMT_Y8_1X8;
> +       fmt->field =3D V4L2_FIELD_NONE;
> +}
> +
> +static int ov6211_start_streaming(struct ov6211 *ov6211)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       const struct ov6211_reg_list *reg_list;
> +       int ret;
> +
> +       reg_list =3D &ov6211->cur_mode->reg_list;
> +       ret =3D ov6211_write_reg_list(ov6211, reg_list);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to set mode\n");
> +               return ret;
> +       }
> +
> +       ret =3D __v4l2_ctrl_handler_setup(ov6211->sd.ctrl_handler);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
> +                              OV6211_REG_VALUE_08BIT,
> +                              OV6211_MODE_STREAMING);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to start streaming\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void ov6211_stop_streaming(struct ov6211 *ov6211)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +
> +       if (ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
> +                            OV6211_REG_VALUE_08BIT, OV6211_MODE_STANDBY))
> +               dev_err(&client->dev, "failed to stop streaming\n");
> +}
> +
> +static int ov6211_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +       int ret =3D 0;
> +
> +       mutex_lock(&ov6211->mutex);
> +
> +       if (enable) {
> +               ret =3D pm_runtime_resume_and_get(&client->dev);
> +               if (ret) {
> +                       mutex_unlock(&ov6211->mutex);
> +                       return ret;
> +               }
> +
> +               ret =3D ov6211_start_streaming(ov6211);
> +               if (!ret) {
> +                       mutex_unlock(&ov6211->mutex);
> +                       return 0;
> +               }
> +       }
> +
> +       ov6211_stop_streaming(ov6211);
> +       pm_runtime_put(&client->dev);
> +
> +       mutex_unlock(&ov6211->mutex);
> +
> +       return ret;
> +}
> +
> +static int ov6211_set_format(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state,
> +                            struct v4l2_subdev_format *fmt)
> +{
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +       const struct ov6211_mode *mode;
> +
> +       mode =3D v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->format.width,
> +                                     fmt->format.height);
> +
> +       mutex_lock(&ov6211->mutex);
> +
> +       ov6211_update_pad_format(mode, &fmt->format);
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +               *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt=
->format;
> +       else
> +               ov6211->cur_mode =3D mode;
> +
> +       mutex_unlock(&ov6211->mutex);
> +
> +       return 0;
> +}
> +
> +static int ov6211_get_format(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *sd_state,
> +                            struct v4l2_subdev_format *fmt)
> +{
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +
> +       mutex_lock(&ov6211->mutex);
> +
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +               fmt->format =3D *v4l2_subdev_state_get_format(sd_state, f=
mt->pad);
> +       else
> +               ov6211_update_pad_format(ov6211->cur_mode, &fmt->format);
> +
> +       mutex_unlock(&ov6211->mutex);
> +
> +       return 0;
> +}
> +
> +static int ov6211_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *sd_state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index > 0)
> +               return -EINVAL;
> +
> +       code->code =3D MEDIA_BUS_FMT_Y8_1X8;
> +
> +       return 0;
> +}
> +
> +static int ov6211_enum_frame_size(struct v4l2_subdev *sd,
> +                                 struct v4l2_subdev_state *sd_state,
> +                                 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       if (fse->index >=3D ARRAY_SIZE(supported_modes))
> +               return -EINVAL;
> +
> +       if (fse->code !=3D MEDIA_BUS_FMT_Y8_1X8)
> +               return -EINVAL;
> +
> +       fse->min_width =3D supported_modes[fse->index].width;
> +       fse->max_width =3D fse->min_width;
> +       fse->min_height =3D supported_modes[fse->index].height;
> +       fse->max_height =3D fse->min_height;
> +
> +       return 0;
> +}
> +
> +static int ov6211_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +
> +       mutex_lock(&ov6211->mutex);
> +
> +       ov6211_update_pad_format(&supported_modes[0],
> +                                v4l2_subdev_state_get_format(fh->state, =
0));
> +
> +       mutex_unlock(&ov6211->mutex);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov6211_video_ops =3D {
> +       .s_stream =3D ov6211_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov6211_pad_ops =3D {
> +       .set_fmt =3D ov6211_set_format,
> +       .get_fmt =3D ov6211_get_format,
> +       .enum_mbus_code =3D ov6211_enum_mbus_code,
> +       .enum_frame_size =3D ov6211_enum_frame_size,
> +};
> +
> +static const struct v4l2_subdev_ops ov6211_subdev_ops =3D {
> +       .video =3D &ov6211_video_ops,
> +       .pad =3D &ov6211_pad_ops,
> +};
> +
> +static const struct media_entity_operations ov6211_subdev_entity_ops =3D=
 {
> +       .link_validate =3D v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov6211_internal_ops =3D {
> +       .open =3D ov6211_open,
> +};
> +
> +static int ov6211_identify_module(struct ov6211 *ov6211)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       int ret;
> +       u32 val;
> +
> +       ret =3D ov6211_read_reg(ov6211, OV6211_REG_CHIP_ID,
> +                             OV6211_REG_VALUE_16BIT, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val !=3D OV6211_CHIP_ID) {
> +               dev_err(&client->dev, "chip id mismatch: %x!=3D%x\n",
> +                       OV6211_CHIP_ID, val);
> +               return -ENXIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov6211_check_hwcfg(struct ov6211 *ov6211)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov6211->sd);
> +       struct device *dev =3D &client->dev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> +       };
> +       int ret;
> +
> +       if (!fwnode)
> +               return -ENXIO;
> +
> +       ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> +       if (!ep)
> +               return -ENXIO;
> +
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return ret;
> +
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes &&
> +           bus_cfg.bus.mipi_csi2.num_data_lanes !=3D OV6211_DATA_LANES) {
> +               dev_err(dev, "Invalid number of data lanes: %u\n",
> +                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> +               ret =3D -EINVAL;
> +               goto check_hwcfg_error;
> +       }
> +
> +       if (!bus_cfg.nr_of_link_frequencies) {
> +               dev_err(dev, "link-frequency property is not found\n");
> +               ret =3D -EINVAL;
> +               goto check_hwcfg_error;
> +       }
> +
> +       if (bus_cfg.nr_of_link_frequencies !=3D 1 ||
> +           bus_cfg.link_frequencies[0] !=3D link_freq_menu_items[0]) {
> +               dev_err(dev, "Unsupported link-frequency property is foun=
d\n");
> +               ret =3D -EINVAL;
> +               goto check_hwcfg_error;
> +       }
> +
> +check_hwcfg_error:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +       return ret;
> +}
> +
> +static int ov6211_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +       int ret;
> +
> +       if (ov6211->avdd) {
> +               ret =3D regulator_enable(ov6211->avdd);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (ov6211->dovdd) {
> +               ret =3D regulator_enable(ov6211->dovdd);
> +               if (ret)
> +                       goto avdd_disable;
> +       }
> +
> +       if (ov6211->dvdd) {
> +               ret =3D regulator_enable(ov6211->dvdd);
> +               if (ret)
> +                       goto dovdd_disable;
> +       }
> +
> +       gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
> +       usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
> +
> +       ret =3D clk_prepare_enable(ov6211->xvclk);
> +       if (ret)
> +               goto dvdd_disable;
> +
> +       return 0;
> +
> +dvdd_disable:
> +       if (ov6211->dvdd)
> +               regulator_disable(ov6211->dvdd);
> +dovdd_disable:
> +       if (ov6211->dovdd)
> +               regulator_disable(ov6211->dovdd);
> +avdd_disable:
> +       if (ov6211->avdd)
> +               regulator_disable(ov6211->avdd);
> +
> +       return ret;
> +}
> +
> +static int ov6211_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +
> +       clk_disable_unprepare(ov6211->xvclk);
> +
> +       gpiod_set_value_cansleep(ov6211->reset_gpio, 1);
> +
> +       if (ov6211->dvdd)
> +               regulator_disable(ov6211->dvdd);
> +
> +       if (ov6211->dovdd)
> +               regulator_disable(ov6211->dovdd);
> +
> +       if (ov6211->avdd)
> +               regulator_disable(ov6211->avdd);
> +
> +       return 0;
> +}
> +
> +static void ov6211_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct ov6211 *ov6211 =3D to_ov6211(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       media_entity_cleanup(&sd->entity);
> +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> +       pm_runtime_disable(&client->dev);
> +       mutex_destroy(&ov6211->mutex);
> +}
> +
> +static int ov6211_probe(struct i2c_client *client)
> +{
> +       struct ov6211 *ov6211;
> +       unsigned long freq;
> +       int ret;
> +
> +       ov6211 =3D devm_kzalloc(&client->dev, sizeof(*ov6211), GFP_KERNEL=
);
> +       if (!ov6211)
> +               return -ENOMEM;
> +
> +       v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
> +
> +       ov6211->xvclk =3D devm_clk_get_optional(&client->dev, NULL);
> +       if (IS_ERR(ov6211->xvclk)) {
> +               ret =3D PTR_ERR(ov6211->xvclk);
> +               dev_err(&client->dev, "failed to get XVCLK clock: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       freq =3D clk_get_rate(ov6211->xvclk);
> +       if (freq && freq !=3D OV6211_MCLK_FREQ_24MHZ)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                               "XVCLK clock frequency %lu is not support=
ed\n",
> +                               freq);
> +
> +       ret =3D ov6211_check_hwcfg(ov6211);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to check HW configuration: =
%d",
> +                       ret);
> +               return ret;
> +       }
> +
> +       ov6211->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "res=
et",
> +                                                    GPIOD_OUT_HIGH);
> +       if (IS_ERR(ov6211->reset_gpio)) {
> +               dev_err(&client->dev, "cannot get reset GPIO\n");
> +               return PTR_ERR(ov6211->reset_gpio);
> +       }
> +
> +       ov6211->avdd =3D devm_regulator_get_optional(&client->dev, "avdd"=
);
> +       if (IS_ERR(ov6211->avdd)) {
> +               ret =3D PTR_ERR(ov6211->avdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'avdd' regulator\n");
> +                       return ret;
> +               }
> +
> +               ov6211->avdd =3D NULL;
> +       }
> +
> +       ov6211->dovdd =3D devm_regulator_get_optional(&client->dev, "dovd=
d");
> +       if (IS_ERR(ov6211->dovdd)) {
> +               ret =3D PTR_ERR(ov6211->dovdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'dovdd' regulator\n"=
);
> +                       return ret;
> +               }
> +
> +               ov6211->dovdd =3D NULL;
> +       }
> +
> +       ov6211->dvdd =3D devm_regulator_get_optional(&client->dev, "dvdd"=
);
> +       if (IS_ERR(ov6211->dvdd)) {
> +               ret =3D PTR_ERR(ov6211->dvdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'dvdd' regulator\n");
> +                       return ret;
> +               }
> +
> +               ov6211->dvdd =3D NULL;
> +       }
> +
> +       /* The sensor must be powered on to read the CHIP_ID register */
> +       ret =3D ov6211_power_on(&client->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ov6211_identify_module(ov6211);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       mutex_init(&ov6211->mutex);
> +       ov6211->cur_mode =3D &supported_modes[0];
> +       ret =3D ov6211_init_controls(ov6211);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to init controls: %d\n", re=
t);
> +               goto probe_error_v4l2_ctrl_handler_free;
> +       }
> +
> +       ov6211->sd.internal_ops =3D &ov6211_internal_ops;
> +       ov6211->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       ov6211->sd.entity.ops =3D &ov6211_subdev_entity_ops;
> +       ov6211->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       ov6211->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&ov6211->sd.entity, 1, &ov6211->pa=
d);
> +       if (ret) {
> +               dev_err(&client->dev, "failed to init entity pads: %d\n",=
 ret);
> +               goto probe_error_v4l2_ctrl_handler_free;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&ov6211->sd);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to register V4L2 subdev: %d=
\n",
> +                       ret);
> +               goto probe_error_media_entity_cleanup;
> +       }
> +
> +       /* Enable runtime PM and turn off the device */
> +       pm_runtime_set_active(&client->dev);
> +       pm_runtime_enable(&client->dev);
> +       pm_runtime_idle(&client->dev);
> +
> +       return 0;
> +
> +probe_error_media_entity_cleanup:
> +       media_entity_cleanup(&ov6211->sd.entity);
> +
> +probe_error_v4l2_ctrl_handler_free:
> +       v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);
> +       mutex_destroy(&ov6211->mutex);
> +
> +power_off:
> +       ov6211_power_off(&client->dev);
> +
> +       return ret;
> +}
> +
> +static const struct dev_pm_ops ov6211_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(ov6211_power_off, ov6211_power_on, NULL)
> +};
> +
> +static const struct of_device_id ov6211_of_match[] =3D {
> +       { .compatible =3D "ovti,ov6211" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov6211_of_match);
> +
> +static struct i2c_driver ov6211_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "ov6211",
> +               .pm =3D &ov6211_pm_ops,
> +               .of_match_table =3D ov6211_of_match,
> +       },
> +       .probe =3D ov6211_probe,
> +       .remove =3D ov6211_remove,
> +};
> +
> +module_i2c_driver(ov6211_i2c_driver);
> +
> +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
> +MODULE_DESCRIPTION("OmniVision OV6211 sensor driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.49.0
>

