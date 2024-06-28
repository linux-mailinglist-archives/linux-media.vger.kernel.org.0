Return-Path: <linux-media+bounces-14305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58F91B6F8
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 08:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20DA61C232E4
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 06:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281D4548EE;
	Fri, 28 Jun 2024 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="e0TZUn0I";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AoXWg/0A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32855C29
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719555860; cv=none; b=BuOdBmGvv7wUe+WWupQxbLaFZnpnzadjjw8G6hFKAqjWhBtiiSDMNwVZoEOm/M/rMXhlxWlnvN/WZWh9y6ZXObkuYl5PnOTOPA5hfwthtg1EwdK8yvYMfgGySzEljWX7BrzBGcEMvqdVYmy5dk2Zhrfz71c8OfPa4bNG79Wbhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719555860; c=relaxed/simple;
	bh=WNBFbkofjDyWet9n62JuW28B/p7mnZFRNdIkrNHdTbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LypT/J2FUBAbPE9QtyXBqBBcnycmlO2E98JfSaWOIlqS75vt5mg6E64L4O1LsQ1/EpUE1112p/ZYiBuGqQMF9OqCz6C70d92wNcs5dlySutqNEgcj8zNOyli5GsrdKEuviJc9L5Mssh4CuqUniRJT+6JzobyihONIr5EYFN+rBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=e0TZUn0I; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AoXWg/0A reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719555856; x=1751091856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtlBiisdVMMOO1L3wvwbgsSKau9YdSxDE49jWDiG04Y=;
  b=e0TZUn0It6VOKpZrtN77P6xw/2rMJlU65gn7SQ96wdHdEc+mApoIDqyd
   YKgchsT0eN+x8Xqi92ArQULk5YgaBiDInpMho5yge3yhOm48DcUyX8/TQ
   HDj67fff+JE3O69JlOPjUNkmRQGp3P3AhGFti2dPzVdSIR9MBfPD88Wiy
   T6w+4THlO+ST0Mo7tJ9yvZi4TuUUi1Ke6z8PsdxXlAX3Qo/E3P3XlF7+8
   Wrz3bz/GLSWOvgDejTr6fW5BVVrnclAug3RPBuoOOu3vc9pj3UzMBDcHC
   M7yZjC6Ut1soK/BUQsSysauH4iCcpEGVa7xO+4memxoF3AKNFjMqZ9RxR
   w==;
X-CSE-ConnectionGUID: kyEQpuawTBiu1qirALraXw==
X-CSE-MsgGUID: 8qTuKb7sSlyfDlrB4LtHjg==
X-IronPort-AV: E=Sophos;i="6.09,168,1716242400"; 
   d="scan'208";a="37636780"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jun 2024 08:24:13 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26D11170EF1;
	Fri, 28 Jun 2024 08:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719555849;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rtlBiisdVMMOO1L3wvwbgsSKau9YdSxDE49jWDiG04Y=;
	b=AoXWg/0AOOU4siIL3JXnzxs2Z8My4WZGanC+n/uBBLlcX0Hm4YValA3xJ6qHR8BqbHdLpX
	z9IHSTCJX6+VlqaZoPGrE0BA9182MqDi6vTAqzUmSiyIRAmw1mY9aIzmvOq0uWZmg6/rEB
	KgpENNk+FLpREkimepI8U6v0/sqpMDEl4pYhbtzv7ACumRxoMfMKE53k6cW+/7dCOdmTWh
	Q1OQ0VbY9FURgwXxFJGQJ1qoiO7brqWIMB7jmAEbd7kkrUu1tLhNx2uRgOBgArPHGGQJdk
	X+9P4c1EhRfZdijsfX0fGaR0AeGD73ViD2wM5g6L8WxxCwSEcG1M86EUwWhPLg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Spencer Hill <shill@d3engineering.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, shill@d3engineering.com
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
Date: Fri, 28 Jun 2024 08:24:11 +0200
Message-ID: <2701531.q0ZmV6gNhb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Zn2xyPB3rDvSqssS@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com> <2688825.Isy0gbHreE@steina-w> <Zn2xyPB3rDvSqssS@D3418SH-L.d3.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 27. Juni 2024, 20:39:04 CEST schrieb Spencer Hill:
> On Thu, Jun 27, 2024 at 04:03:36PM +0200, Alexander Stein wrote:
> > Hi Spencer,
> >
> > thanks for the patch.
> >
> > Just having a glimpse and giving some feedback.
> >
> > Am Mittwoch, 26. Juni 2024, 23:15:28 CEST schrieb Spencer Hill:
> > > Add a driver for the Sony IMX728 image sensor.
> > >
> > > Signed-off-by: Spencer Hill <shill@d3engineering.com>
> > > ---
> > >  drivers/media/i2c/Kconfig  |   11 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/imx728.c | 1167 ++++++++++++
> > >  drivers/media/i2c/imx728.h | 3458 ++++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 4637 insertions(+)
> > >  create mode 100644 drivers/media/i2c/imx728.c
> > >  create mode 100644 drivers/media/i2c/imx728.h
> > >
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index c6d3ee472d81..46b6463c558a 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -233,6 +233,17 @@ config VIDEO_IMX415
> > >           To compile this driver as a module, choose M here: the
> > >           module will be called imx415.
> > >
> > > +config VIDEO_IMX728
> > > +       tristate "Sony IMX728 sensor support"
> > > +       depends on OF_GPIO
> > > +       select V4L2_CCI_I2C
> > > +       help
> > > +         This is a Video4Linux2 sensor driver for the Sony
> > > +         IMX728 camera.
> > > +
> > > +         To compile this driver as a module, choose M here: the
> > > +         module will be called imx728.
> > > +
> > >  config VIDEO_MAX9271_LIB
> > >         tristate
> > >
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index dfbe6448b549..1188420ee1b4 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> > >  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> > >  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> > >  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > > +obj-$(CONFIG_VIDEO_IMX728) +=3D imx728.o
> > >  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> > >  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> > >  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > > diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> > > new file mode 100644
> > > index 000000000000..b23359133a22
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx728.c
> > > @@ -0,0 +1,1167 @@
> [snip]
> > > +{
> > > +       int ret;
> > > +
> > > +       ret =3D regmap_multi_reg_write(imx728->regmap, regs, nr_regs);
> > > +       if (ret < 0)
> > > +               dev_err(imx728->dev,
> > > +                       "%s: failed to write reg table (%d)!\n", __fu=
nc__, ret);
> > > +       return ret;
> > > +}
> > > +
> > > +static int imx728_wait_for_state(struct imx728 *imx728, enum imx728_=
sensor_state state)
> > > +{
> > > +       int ret, i;
> > > +       u32 val;
> > > +
> > > +       for (i =3D 0; i < 50; i++) {
> > > +               ret =3D imx728_read(imx728, 0x2CAC, &val, 1);
> >
> > Please add proper register defines using CCI_REG* macros.
> >
>=20
> Is using those macros in place in these functions OK?

List the registers on top of file, see for example imx415.c or imx290.c

>=20
> > > +               if (ret =3D=3D 0 && val =3D=3D state) {
> > > +                       dev_info(imx728->dev, "%s: Enter state %u\n",=
 __func__, val);
> > > +                       return 0;
> > > +               }
> > > +               usleep_range(1000, 10000);
> > > +       }
> > > +
> > > +       return -EBUSY;
> > > +}
> > > +
> > > +static void imx728_init_formats(struct v4l2_subdev_state *state)
> > > +{
> > > +       struct v4l2_mbus_framefmt *format;
> > > +
> > > +       format =3D v4l2_subdev_state_get_format(state, 0, 0);
> > > +       format->code =3D imx728_mbus_formats[0];
> > > +       format->width =3D imx728_framesizes[0].width;
> > > +       format->height =3D imx728_framesizes[0].height;
> > > +       format->field =3D V4L2_FIELD_NONE;
> > > +       format->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> >
> > Are you sure about this colorspace? I would have expected
> > V4L2_COLORSPACE_RAW, but I don't know any details on this hardware.
> >
> > Also set ycbcr_enc, quantization and xfer_func.
> >
>=20
> V4L2_COLORSPACE_RAW is probably more correct.
> I am not sure what would be correct for the ycbcr_enc, similar drivers
> seem to use V4L2_YCBCR_ENC_601, would that be correct here?

AFAICS V4L2_MAP_YCBCR_ENC_DEFAULT() converts V4L2_COLORSPACE_RAW to
V4L2_YCBCR_ENC_601, so yes this seems correct. For the others use
V4L2_XFER_FUNC_NONE and V4L2_QUANTIZATION_DEFAULT.

> > > +}
> > > +
> > > +static int _imx728_set_routing(struct v4l2_subdev *sd,
> > > +                              struct v4l2_subdev_state *state)
> >
> > Why this special variant with a underscore? Just move the code
> > into imx728_set_routing.
> >
>=20
> I will put this into the other function.
>=20
> [snip]
> > > +
> > > +static int imx728_powerup_to_standby(struct imx728 *imx728)
> > > +{
> > > +       int ret;
> > > +
> > > +       dev_info(imx728->dev, "powerup -> standby...");
> > > +
> > > +       ret =3D imx728_reset(imx728);
> > > +       if (ret) {
> > > +               dev_err(imx728->dev, "Error resetting: %i", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_SLE=
EP);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Could not transition to Sleep s=
tate!");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_write(imx728, 0x1B20, imx728->clk_rate / 10000=
00, 1);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Couldn't write INCK frequency!"=
);
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_write(imx728, 0x1B1C, 0x1, 1);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Couldn't write INCK frequency!"=
);
> >
> > Error message doesn't seem to match. This is a fixed write, independent=
 from any frequency.
> >
>=20
> This write is the enable flag for the configured INCK frequency. By
> default the sensor ignores the user configured frequency until this is
> set.

Okay, I see. But if you use a sequence of cci_write() calls you can instead
raise an error message on call site, see imx290_set_clock() for that.

> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_write(imx728, 0x1B05, 0xFF, 1);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Couldn't write to CK_SLEEP!");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STA=
NDBY);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Couldn't transition from Sleep =
to Standby state!");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret =3D imx728_write(imx728, 0xFFFF, IMX728_REMAP_MODE_STANDB=
Y, 1);
> > > +       if (ret < 0) {
> > > +               dev_err(imx728->dev, "Couldn't write regmap mode!");
> > > +               return ret;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +

> [snip]

> > > diff --git a/drivers/media/i2c/imx728.h b/drivers/media/i2c/imx728.h
> > > new file mode 100644
> > > index 000000000000..6f320214b780
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx728.h
> >
> > There is only a single user of this header, move this into the c file.
> >
>=20
> I will combine these two files.
>=20
> > > @@ -0,0 +1,3458 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Sony IMX728 CMOS Image Sensor Driver
> > > + *
> > > + * Copyright (c) 2024 Define Design Deploy Corp
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#define IMX728_OUT_WIDTH               3840
> > > +#define IMX728_OUT_HEIGHT              2160
> > > +
> > > +#define IMX728_FRAMERATE_MAX           30
> > > +#define IMX728_FRAMERATE_DEFAULT       30
> > > +#define IMX728_FRAMERATE_MIN           10
> > > +
> > > +#define IMX728_PIXEL_RATE              225504000
> > > +#define IMX728_LINK_FREQ               800000000
> > > +
> > > +#define IMX728_EXPOSURE_DEFAULT                10000
> > > +
> > > +#define IMX728_PM_IDLE_TIMEOUT         1000
> > > +
> > > +
> > > +#define IMX728_REG_CTRL_POINT_X(i) (0xA198 + (i) * 8)
> > > +#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)
> > > +
> > > +enum imx728_sensor_state {
> > > +       IMX728_SENSOR_STATE_SLEEP               =3D 0x02,
> > > +       IMX728_SENSOR_STATE_STANDBY             =3D 0x04,
> > > +       IMX728_SENSOR_STATE_STREAMING           =3D 0x10,
> > > +       IMX728_SENSOR_STATE_SAFE                =3D 0x20,
> > > +};
> > > +
> > > +
> > > +enum imx728_remap_mode_id {
> > > +       IMX728_REMAP_MODE_STANDBY =3D 0x00,
> > > +       IMX728_REMAP_MODE_STANDBY_PIXEL_SHADING_COMPENSATION =3D 0x01,
> > > +       IMX728_REMAP_MODE_STANDBY_SPOT_PIXEL_COMPENSATION =3D 0x02,
> > > +       IMX728_REMAP_MODE_STREAMING =3D 0x04,
> > > +       IMX728_REMAP_MODE_STREAMING_PIXEL_SHADING_COMPENSATION =3D 0x=
05,
> > > +       IMX728_REMAP_MODE_STREAMING_SPOT_PIXEL_COMPENSATION =3D 0x06,
> > > +       IMX728_REMAP_MODE_SLEEP =3D 0x20,
> > > +};
> > > +
> > > +enum imx728_drive_mode {
> > > +       IMX728_MODE_3856x2176_45_4LANE_RAW10 =3D 0x01,
> > > +       IMX728_MODE_3856x2176_45_4LANE_RAW12 =3D 0x02,
> > > +       IMX728_MODE_3856x2176_45_4LANE_RAW16 =3D 0x03,
> > > +       IMX728_MODE_3856x2176_45_4LANE_RAW20 =3D 0x04,
> > > +       IMX728_MODE_3856x2176_45_4LANE_RAW12_HDR =3D 0x05,
> > > +       IMX728_MODE_3856x2176_40_4LANE_RAW10 =3D 0x11,
> > > +       IMX728_MODE_3856x2176_40_4LANE_RAW12 =3D 0x12,
> > > +       IMX728_MODE_3856x2176_40_4LANE_RAW16 =3D 0x13,
> > > +       IMX728_MODE_3856x2176_40_4LANE_RAW20 =3D 0x14,
> > > +       IMX728_MODE_3856x2176_40_4LANE_RAW12_HDR =3D 0x16,
> > > +};
> > > +
> > > +enum imx728_awbmode {
> > > +       IMX728_AWBMODE_ATW =3D 0,
> > > +       IMX728_AWBMODE_ALL_PULL_IN =3D 1,
> > > +       IMX728_AWBMODE_USER_PRESET =3D 2,
> > > +       IMX728_AWBMODE_FULL_MWB =3D 3,
> > > +       IMX728_AWBMODE_HOLD =3D 4,
> > > +};
> > > +
> > > +enum imx728_img_raw_mode {
> > > +       IMX728_IMG_MODE_LINEAR =3D 0x0,
> > > +       IMX728_IMG_MODE_LI =3D 0x1,
> > > +       IMX728_IMG_MODE_HDR =3D 0x2,
> > > +       IMX728_IMG_MODE_LI_HDR =3D 0x3,
> > > +};
> > > +
> > > +enum imx728_aemode {
> > > +       IMX728_AEMODE_AE_AUTO  =3D 0,
> > > +       IMX728_AEMODE_AE_HOLD  =3D 1,
> > > +       IMX728_AEMODE_SCALE_ME =3D 2,
> > > +       IMX728_AEMODE_FULL_ME  =3D 3,
> > > +};
> > > +
> > > +enum imx728_fme_shtval_unit {
> > > +       IMX728_FME_SHTVAL_UNIT_LINES            =3D 1,
> > > +       IMX728_FME_SHTVAL_UNIT_MICROSECONDS     =3D 3,
> > > +       IMX728_FME_SHTVAL_UNIT_FRAMES           =3D 4,
> > > +};
> > > +
> > > +enum imx728_linear_raw_sel {
> > > +       IMX728_RAW_SEL_SP1H =3D 0x0,
> > > +       IMX728_RAW_SEL_SP1L =3D 0x1,
> > > +       IMX728_RAW_SEL_SP1EC =3D 0x2,
> > > +       IMX728_RAW_SEL_SP2 =3D 0x3,
> > > +       IMX728_RAW_SEL_SP1VS =3D 0x4
> > > +};
> > > +
> > > +enum imx728_binn_avg {
> > > +       IMX728_BINN_SIMPLE_AVG,
> > > +       IMX728_BINN_WEIGHTED_AVG,
> > > +};
> > > +
> > > +struct imx728_ctrl {
> > > +       struct v4l2_ctrl_handler handler;
> > > +       struct v4l2_ctrl *wdr;
> > > +       struct v4l2_ctrl *exposure;
> > > +       struct v4l2_ctrl *again;
> > > +       struct v4l2_ctrl *h_flip;
> > > +       struct v4l2_ctrl *v_flip;
> > > +       struct v4l2_ctrl *pg_mode;
> > > +       struct v4l2_ctrl *pixel_rate;
> > > +       struct v4l2_ctrl *link_freq;
> > > +};
> > > +
> > > +struct imx728_ctrl_point {
> >
> > What does ctrl_point mean? What is x and y?
> >
>=20
> Control points are used internally by the sensor to adjust how the HDR
> data from the sensor is compressed into the output bit depth. The values
> used were provided by Sony.
>=20
> > > +       int x, y;
> > > +};
> > > +
> > > +/*
> > > + * struct imx728 - imx728 device structure
> > > + * @dev: Device handle
> > > + * @clk: Pointer to imx728 clock
> > > + * @client: Pointer to I2C client
> > > + * @regmap: Pointer to regmap structure
> > > + * @xclr_gpio: Pointer to XCLR gpio
> > > + * @subdev: V4L2 subdevice structure
> > > + * @format: V4L2 media bus frame format structure
> > > + *             (width and height are in sync with the compose rect)
> > > + * @pad: Media pad structure
> > > + * @ctrl: imx728 control structure
> > > + * @clk_rate: Frequency of imx728 clock
> > > + * @lock: Mutex structure for V4L2 ctrl handler
> > > + * @streaming: Flag to store streaming on/off status
> > > + */
> > > +struct imx728 {
> > > +       struct device *dev;
> > > +
> > > +       struct clk *clk;
> > > +       struct i2c_client *client;
> > > +       struct regmap *regmap;
> > > +       struct gpio_desc *xclr_gpio;
> > > +
> > > +       struct v4l2_subdev subdev;
> > > +       struct v4l2_mbus_framefmt format;
> > > +       struct media_pad pad;
> > > +
> > > +       struct imx728_ctrl ctrl;
> > > +
> > > +       unsigned long clk_rate;
> > > +       u32 fps;
> > > +
> > > +       struct mutex lock;
> > > +       bool streaming;
> > > +};
> > > +
> > > +static const struct v4l2_area imx728_framesizes[] =3D {
> > > +       {
> > > +               .width =3D IMX728_OUT_WIDTH,
> > > +               .height =3D IMX728_OUT_HEIGHT,
> > > +       },
> >
> > Are you sure this is the only supported resolution? I would prefer using
> > actual numbers here.
> >
>=20
> This is not the only supported resolution by the sensor, however it is
> the only resolution that I have a configuration for at the moment. I
> will remove the defines and switch to actual numbers to make supporting
> other resolutions easier in the future.

Nice, thanks.

Best regards,
Alexander

> > > +};
> > > +
> > > +static const u32 imx728_mbus_formats[] =3D {
> > > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > > +};
> > > +
> > > +static const s64 imx728_link_freq_menu[] =3D {
> > > +       IMX728_LINK_FREQ,
> > > +};
> > > +
> > > +static const struct regmap_config imx728_regmap_config =3D {
> > > +       .reg_bits =3D 16,
> > > +       .val_bits =3D 8,
> > > +};
> > > +
> > > +static const char *const imx728_ctrl_pg_qmenu[] =3D {
> > > +       "Disabled",
> > > +       "Horizontal Color Bars",
> > > +       "Vertical Color Bars",
> > > +};
> > > +
> > > +static struct imx728_ctrl_point imx728_hdr_20bit[] =3D {
> > > +       {0, 0},
> > > +       {1566 >> 4, 938},
> > > +       {105740 >> 4, 1863},
> > > +       {387380 >> 4, 2396},
> > > +       {3818601 >> 4, 3251},
> > > +       {16777215 >> 4, 4095},
> > > +       {-1, -1}
> > > +};
> > > +
> > > +static const struct reg_sequence imx728_3840x2160[] =3D {
> >
> > Please use struct cci_reg_sequence.
> >
> > Best regards,
> > Alexander
> >
>=20
> I will change this.
>=20
> > > +       {0xFFFF, 0x00, 1000},
> > > +       {0x1749, 0x01},
> > > +       {0x174B, 0x01},
> > > [snip]
> > > +};
> > > --
> > > 2.40.1
> > >
> > > Please be aware that this email includes email addresses outside of t=
he organization.
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
> Please be aware that this email includes email addresses outside of the o=
rganization.
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



