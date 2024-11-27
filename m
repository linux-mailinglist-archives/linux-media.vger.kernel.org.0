Return-Path: <linux-media+bounces-22137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E89DA467
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259D116638A
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A00D1917E7;
	Wed, 27 Nov 2024 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IgqqDEAg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626418F2C3;
	Wed, 27 Nov 2024 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698205; cv=none; b=e9j7aEIiejmxZ1Zt8oIzrBsemDsLuWoxoln/Vt7OLBoz3pptTxPSi5BBXP0yMBxsen8dG6KmLuXaG/bt0m7Y28YrDnzLXUPD/S+4QvJMYcO+rtB/ggMGDZm9g4+P9BPKkA1RdTQKWrIdbCk7yWWz9Ldw20a03284DFrDS4lfmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698205; c=relaxed/simple;
	bh=m8cHY5AozLRGFnYdkFuaIeLM8awdMh8pyAuOEAqpHOo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Lu4wfhT+A5bWDeKmPe3hbjcEtCNjahGWtmgmzy834d7DCQIrC3aNo0/qCZh+O/yz1qMTFiCwjCtQQq9jlFmUXvsPgfXX27lwcNIltLlU+kayjMQp50/ouIGgbrI6g8J1Ur4gAHG/h06jz6pvu4+0NtAovsNOnabXZ+Ybcan2PQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IgqqDEAg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93FCB792;
	Wed, 27 Nov 2024 10:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732698177;
	bh=m8cHY5AozLRGFnYdkFuaIeLM8awdMh8pyAuOEAqpHOo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IgqqDEAgpUTvT9O5fJruNK1tvm7CVEL99gqFvDZvMvBs/FBlXXXZycEsod9kAHwjk
	 awZn+o/lkcPYHhxciwhBiOPKNon4po8DGsJabP2Um4niZ8d7vMxlWu7Zdy+4Z2BbB3
	 u11ZtTDw6sPGQ7FDcZZf7+NnhiOz+EsDPb+dzz1k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241126155100.1263946-3-mirela.rabulea@nxp.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com> <20241126155100.1263946-3-mirela.rabulea@nxp.com>
Subject: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, hdegoede@redhat.com, dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
To: Mirela Rabulea <mirela.rabulea@nxp.com>, bryan.odonoghue@linaro.org, hverkuil-cisco@xs4all.nl, krzk+dt@kernel.org, laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com, mchehab@kernel.org, robert.chiras@nxp.com, robh@kernel.org, sakari.ailus@linux.intel.com
Date: Wed, 27 Nov 2024 09:03:16 +0000
Message-ID: <173269819694.1605529.2093961032702466504@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Mirela,

Quoting Mirela Rabulea (2024-11-26 15:50:58)
> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>=20
> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> active array size of 2592 x 1944.
>=20
> The following features are supported for OX05B1S:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>=20
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>=20
> Changes in v2:
>         Use dev_err_probe for missing clock, since it is now required pro=
perty, and use NULL for devm_clk_get (no name for single clock), remove che=
ck for non NULL sensor->sensor_clk
>         Remove dev_err message for devm_regmap_init_i2c allocation error
>         Added spaces inside brackets, wrap lines to 80
>         Remove some redundant initializations
>         Add regulators
>         Make "sizes" a pointer
>                 Use struct v4l2_area instead of u32[2] array
>                 Remove the count for supported_modes[] and supported_code=
s[], instead use sentinel element at the end
>                 Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum=
_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
>         Remove .h files for modes, however did not move this code in the =
driver file but added a separate c file for all supported modes
>         Refactor register lists to allow multiple register arrays per mode
>         Use GPL-2.0-only instead of GPL-2.0
>=20
>  drivers/media/i2c/Kconfig                 |    1 +
>  drivers/media/i2c/Makefile                |    1 +
>  drivers/media/i2c/ox05b1s/Kconfig         |   10 +
>  drivers/media/i2c/ox05b1s/Makefile        |    2 +
>  drivers/media/i2c/ox05b1s/ox05b1s.h       |   22 +
>  drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 1001 ++++++++++++++++++
>  drivers/media/i2c/ox05b1s/ox05b1s_modes.c | 1171 +++++++++++++++++++++
>  7 files changed, 2208 insertions(+)
>  create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
>  create mode 100644 drivers/media/i2c/ox05b1s/Makefile
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>  create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..5cda062c0463 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -700,6 +700,7 @@ config VIDEO_VGXY61
> =20
>  source "drivers/media/i2c/ccs/Kconfig"
>  source "drivers/media/i2c/et8ek8/Kconfig"
> +source "drivers/media/i2c/ox05b1s/Kconfig"
> =20
>  endif
> =20
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fbb988bd067a..028eb08e648c 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -114,6 +114,7 @@ obj-$(CONFIG_VIDEO_OV9282) +=3D ov9282.o
>  obj-$(CONFIG_VIDEO_OV9640) +=3D ov9640.o
>  obj-$(CONFIG_VIDEO_OV9650) +=3D ov9650.o
>  obj-$(CONFIG_VIDEO_OV9734) +=3D ov9734.o
> +obj-$(CONFIG_VIDEO_OX05B1S) +=3D ox05b1s/
>  obj-$(CONFIG_VIDEO_RDACM20) +=3D rdacm20.o
>  obj-$(CONFIG_VIDEO_RDACM21) +=3D rdacm21.o
>  obj-$(CONFIG_VIDEO_RJ54N1) +=3D rj54n1cb0c.o
> diff --git a/drivers/media/i2c/ox05b1s/Kconfig b/drivers/media/i2c/ox05b1=
s/Kconfig
> new file mode 100644
> index 000000000000..48fcd04b20d5
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/Kconfig
> @@ -0,0 +1,10 @@
> +config VIDEO_OX05B1S
> +       tristate "OmniVision raw sensor support OX05B1S"
> +       depends on OF
> +       depends on GPIOLIB
> +       select REGMAP_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Omnivision OX05B1S=
 RGB-IR sensor.
> +         This is a 1/2.5-Inch CMOS image sensor with an active array siz=
e of 2592 x 1944.
> +         It is programmable through I2C interface.
> +         The output is on MIPI CSI-2 interface.
> diff --git a/drivers/media/i2c/ox05b1s/Makefile b/drivers/media/i2c/ox05b=
1s/Makefile
> new file mode 100644
> index 000000000000..0b38dbf98bcd
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/Makefile
> @@ -0,0 +1,2 @@
> +ox05b1s-objs :=3D ox05b1s_modes.o ox05b1s_mipi.o
> +obj-$(CONFIG_VIDEO_OX05B1S) +=3D ox05b1s.o
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05=
b1s/ox05b1s.h
> new file mode 100644
> index 000000000000..a893c65894f3
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, NXP
> + */
> +
> +#ifndef OX05B1S_H
> +#define OX05B1S_H
> +
> +#include <linux/types.h>
> +
> +struct ox05b1s_reg {
> +       u32 addr;
> +       u32 data;
> +};
> +
> +struct ox05b1s_reglist {
> +       struct ox05b1s_reg *regs;
> +};
> +
> +extern struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
> +
> +#endif /* OX05B1S_H */
> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c=
/ox05b1s/ox05b1s_mipi.c
> new file mode 100644
> index 000000000000..0f5e2a946e4f
> --- /dev/null
> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
> @@ -0,0 +1,1001 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
> + * Copyright (C) 2024, NXP
> + *
> + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>

If you add

#include <media/v4l2-cci.h>

here you can use lots of nice helpers to abstract the size of the
registers.

I'm surprised this didn't come up in v1 already, I see there were lots
of dicussionss on that thread.



> +#include "ox05b1s.h"
> +
> +#define OX05B1S_SENS_PAD_SOURCE        0
> +#define OX05B1S_SENS_PADS_NUM  1
> +
> +#define OX05B1S_REG_SW_STB 0x0100


#define OX05B1S_REG_SW_STB 	CCI_REG8(0x0100)

> +#define OX05B1S_REG_SW_RST 0x0103
> +#define OX05B1S_REG_CHIP_ID_23_16 0x300a
> +#define OX05B1S_REG_CHIP_ID_15_8 0x300b
> +#define OX05B1S_REG_CHIP_ID_7_0 0x300c
> +#define OX05B1S_REG_TIMING_HTS_H 0x380c
> +#define OX05B1S_REG_TIMING_HTS_L 0x380d

And then these become
#define OX05B1S_REG_TIMING_HTS	CCI_REG16(0x380c)
#define OX05B1S_REG_TIMING_VTS	CCI_REG16(0x380e)

without needing to have custom functions to split and re-arrange the
register.

The functionality already works with regmap that you're already using so
it should be an easy change.

The only thing to check/watch out for is which endianness the registers
are.

(There's a CCI_REG16_LE if it's little endian).


> +#define OX05B1S_REG_TIMING_VTS_H 0x380e
> +#define OX05B1S_REG_TIMING_VTS_L 0x380f
> +#define OX05B1S_REG_EXPOSURE_H 0x3501
> +#define OX05B1S_REG_EXPOSURE_L 0x3502
> +#define OX05B1S_REG_GAIN_H 0x3508
> +#define OX05B1S_REG_GAIN_L 0x3509
> +
> +#define client_to_ox05b1s(client)\
> +       container_of(i2c_get_clientdata(client), struct ox05b1s, subdev)
> +
> +struct ox05b1s_sizes {
> +       u32     code;
> +       const struct v4l2_area *sizes;
> +};
> +
> +struct ox05b1s_plat_data {
> +       char                            name[20];
> +       u32                             chip_id;
> +       u32                             native_width;
> +       u32                             native_height;
> +       u32                             active_top;
> +       u32                             active_left;
> +       u32                             active_width;
> +       u32                             active_height;
> +       const struct ox05b1s_mode       *supported_modes;
> +       u32                             default_mode_index;
> +       const struct ox05b1s_sizes      *supported_codes;
> +};
> +
> +struct ox05b1s_ctrls {
> +       struct v4l2_ctrl_handler handler;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *gain;
> +       struct v4l2_ctrl *exposure;
> +};
> +
> +struct ox05b1s_mode {
> +       u32 index;
> +       u32 width;
> +       u32 height;
> +       u32 code;
> +       u32 bpp;
> +       u32 vts; /* default VTS */
> +       u32 hts; /* default HTS */
> +       u32 exp; /* max exposure */
> +       bool h_bin; /* horizontal binning */
> +       u32 fps;
> +       struct ox05b1s_reglist *reg_data;
> +};
> +
> +/* regulator supplies */
> +static const char * const ox05b1s_supply_name[] =3D {
> +       "AVDD",  /* Analog voltage supply, 2.8 volts */
> +       "DVDD",  /* Digital I/O voltage supply, 1.8 volts */
> +       "DOVDD", /* Digital voltage supply, 1.2 volts */
> +};
> +
> +#define OX05B1S_NUM_SUPPLIES ARRAY_SIZE(ox05b1s_supply_name)
> +
> +struct ox05b1s {
> +       struct i2c_client *i2c_client;
> +       struct regmap *regmap;
> +       struct gpio_desc *rst_gpio;
> +       struct regulator_bulk_data supplies[OX05B1S_NUM_SUPPLIES];
> +       struct clk *sensor_clk;
> +       const struct ox05b1s_plat_data *model;
> +       struct v4l2_subdev subdev;
> +       struct media_pad pads[OX05B1S_SENS_PADS_NUM];
> +       const struct ox05b1s_mode *mode;
> +       struct mutex lock; /* sensor lock */
> +       u32 stream_status;
> +       struct ox05b1s_ctrls ctrls;
> +};
> +
> +static struct ox05b1s_mode ox05b1s_supported_modes[] =3D {
> +       {
> +               .index          =3D 0,
> +               .width          =3D 2592,
> +               .height         =3D 1944,
> +               .code           =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +               .bpp            =3D 10,
> +               .vts            =3D 0x850,
> +               .hts            =3D 0x2f0,
> +               .exp            =3D 0x850 - 8,
> +               .h_bin          =3D false,
> +               .fps            =3D 30,
> +               .reg_data       =3D ox05b1s_reglist_2592x1944,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +/* keep in sync with ox05b1s_supported_modes*/
> +static const struct v4l2_area ox05b1s_sgrbg10_sizes[] =3D {
> +       {
> +               .width =3D 2592,
> +               .height =3D 1944,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static const struct ox05b1s_sizes ox05b1s_supported_codes[] =3D {
> +       {
> +               .code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +               .sizes =3D ox05b1s_sgrbg10_sizes,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static const struct regmap_config ox05b1s_regmap_config =3D {
> +       .reg_bits =3D 16,
> +       .val_bits =3D 8,
> +       .cache_type =3D REGCACHE_RBTREE,
> +};
> +
> +static int ox05b1s_power_on(struct ox05b1s *sensor)
> +{
> +       struct device *dev =3D &sensor->i2c_client->dev;
> +       int ret =3D 0;
> +
> +       ret =3D regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->suppl=
ies);
> +       if (ret) {
> +               dev_err(dev, "Failed to enable regulators\n");
> +               return ret;
> +       }
> +
> +       /* get out of powerdown and reset */
> +       gpiod_set_value_cansleep(sensor->rst_gpio, 0);
> +
> +       ret =3D clk_prepare_enable(sensor->sensor_clk);
> +       if (ret < 0) {
> +               dev_err(dev, "Enable sensor clk fail ret=3D%d\n", ret);
> +               goto reg_off;
> +       }
> +
> +       /* with XVCLK@24MHz, t2 =3D 6ms required delay for ox05b1s before=
 first SCCB transaction */
> +       fsleep(6000);
> +
> +       return ret;
> +
> +reg_off:
> +       regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> +
> +       return ret;
> +}
> +
> +static int ox05b1s_power_off(struct ox05b1s *sensor)
> +{
> +       gpiod_set_value_cansleep(sensor->rst_gpio, 1);
> +
> +       /* XVCLK must be active for 512 cycles (0.34 ms at 24MHz) after l=
ast SCCB transaction */
> +       fsleep(350);
> +       clk_disable_unprepare(sensor->sensor_clk);
> +
> +       regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> +
> +       return 0;
> +}
> +
> +static int ox05b1s_runtime_suspend(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +       struct ox05b1s *sensor =3D client_to_ox05b1s(client);
> +
> +       return ox05b1s_power_off(sensor);
> +}
> +
> +static int ox05b1s_runtime_resume(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +       struct ox05b1s *sensor =3D client_to_ox05b1s(client);
> +
> +       return ox05b1s_power_on(sensor);
> +}
> +
> +static int ox05b1s_write_reg(struct ox05b1s *sensor, u16 reg, u8 val)
> +{
> +       struct device *dev =3D &sensor->i2c_client->dev;
> +       int ret;
> +
> +       ret =3D regmap_write(sensor->regmap, reg, val);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to write reg addr 0x%04x with 0x%02x=
\n", reg, val);
> +
> +       return ret;
> +}
> +
> +static int ox05b1s_read_reg(struct ox05b1s *sensor, u16 reg, u8 *val)
> +{
> +       struct device *dev =3D &sensor->i2c_client->dev;
> +       int ret;
> +
> +       ret =3D regmap_raw_read(sensor->regmap, reg, val, 1);
> +       if (ret)
> +               dev_err(dev, "Read reg error: reg=3D%x, val=3D%x\n", reg,=
 *val);
> +
> +       return ret;
> +}

This would be removed entirely and you can just use cci_write()

> +
> +#define OX05B1S_MAX_REG_BULK 16
> +static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
> +                                  struct ox05b1s_reg *reg_array)
> +{
> +       struct device *dev =3D &sensor->i2c_client->dev;
> +       struct ox05b1s_reg *table =3D reg_array;
> +       u8 vals[OX05B1S_MAX_REG_BULK];
> +       int i;
> +       int ret;
> +
> +       while (table->addr) {
> +               for (i =3D 0; i < OX05B1S_MAX_REG_BULK; i++) {
> +                       if (table[i].addr !=3D (table[0].addr + i))
> +                               break;
> +                       vals[i] =3D table[i].data;
> +               }
> +               ret =3D regmap_bulk_write(sensor->regmap, table->addr, va=
ls, i);
> +               if (ret) {
> +                       dev_err(dev, "Failed to write reg addr=3D%x, coun=
t %d\n", table->addr, i);
> +                       return ret;
> +               }
> +               table +=3D i;
> +       }
> +
> +       return 0;
> +}

and cci_multi_reg_write() (but not needed for writing two consecutive
registers anymore with CCI_REG16)

> +
> +static int ox05b1s_set_hts(struct ox05b1s *sensor, u32 hts)
> +{
> +       u8 values[2] =3D { (u8)(hts >> 8) & 0xff, (u8)(hts & 0xff) };
> +
> +       return regmap_bulk_write(sensor->regmap, OX05B1S_REG_TIMING_HTS_H=
, values, 2);
> +}

And set_hts becomes:

	ret =3D cci_write(sensor->regmap, OX05B1S_REG_TIMING_HTS, hts, &ret);

which can be done inline at the caller of this.

Regards
--
Kieran

