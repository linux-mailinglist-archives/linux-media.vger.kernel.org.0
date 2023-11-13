Return-Path: <linux-media+bounces-194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5197E98C3
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1951C2039E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB55618E27;
	Mon, 13 Nov 2023 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sth1kfz9"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708E18645
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 09:19:42 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0226810D2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 01:19:37 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C459229A;
	Mon, 13 Nov 2023 10:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699867150;
	bh=gohC99DqA9fTHIRbTTUZSN+gMAv+lOabNug3ixJ+KYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sth1kfz9ez022vWQBGELtRjjLNdSP6qLzXqIc0jUbaM5ATuvNcQrmDQ0NettxkW+I
	 V41QG676EB7L/cHZUtm7OwxbO3AgggFNLNJ7mIq2F2cRhgnBXADAeuLgjdrEm+yGbb
	 Og6lJgcMAvabZVl9HXKvdwnPi4B1T+Q5eonXnSCw=
Date: Mon, 13 Nov 2023 10:19:32 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <uk3jwwpwthl7es6gdfkremjf4wil5w4b2kd6amajmeigywa55f@qxsz33z5t6q6>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-3-jacopo.mondi@ideasonboard.com>
 <ZVHciyhWSogA4ckc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVHciyhWSogA4ckc@kekkonen.localdomain>

Hi Sakari,

On Mon, Nov 13, 2023 at 08:21:31AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Oct 10, 2023 at 05:12:08PM +0200, Jacopo Mondi wrote:
> > Add a driver for the OmniVision OV64A40 image sensor.
>
> Why are there so many different drivers for Omnivision sensor?
>

Why are there so many different sensors, I would say..

> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   10 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov64a40.c | 3537 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 3549 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov64a40.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index df089d68b58c..fd4beddeeed8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15827,6 +15827,7 @@ L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > +F:	drivers/media/i2c/ov64a40.c
> >
> >  OMNIVISION OV7670 SENSOR DRIVER
> >  L:	linux-media@vger.kernel.org
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 74ff833ff48c..b49a2dbd3612 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -444,6 +444,16 @@ config VIDEO_OV5695
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called ov5695.
> >
> > +config VIDEO_OV64A40
> > +	tristate "OmniVision OV64A40 sensor support"
> > +	select V4L2_CCI_I2C
> > +	help
> > +	  This is a Video4Linux2 sensor driver for the OmniVision
> > +	  OV64A40 camera.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called ov64a40.
> > +
> >  config VIDEO_OV6650
> >  	tristate "OmniVision OV6650 sensor support"
> >  	help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 80b00d39b48f..be378ec73b4e 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -91,6 +91,7 @@ obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
> >  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
> >  obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
> >  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
> > +obj-$(CONFIG_VIDEO_OV64A40) += ov64a40.o
> >  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
> >  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
> >  obj-$(CONFIG_VIDEO_OV7640) += ov7640.o
> > diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> > new file mode 100644
> > index 000000000000..6370d38e7403
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov64a40.c
> > @@ -0,0 +1,3537 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * V4L2 sensor driver for OmniVision OV64A40
> > + *
> > + * Copyright (C) 2023 Ideas On Board Oy
> > + * Copyright (C) 2023 Arducam
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mediabus.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define OV64A40_XCLK_FREQ		24000000
> > +
> > +#define OV64A40_NATIVE_WIDTH		9286
> > +#define OV64A40_NATIVE_HEIGHT		6976
> > +#define OV64A40_PIXEL_ARRAY_TOP		16
> > +#define OV64A40_PIXEL_ARRAY_LEFT	16
> > +#define OV64A40_PIXEL_ARRAY_WIDTH	9248
> > +#define OV64A40_PIXEL_ARRAY_HEIGHT	6944
> > +
> > +#define OV64A40_PIXEL_RATE		75000000
> > +#define OV64A40_LINK_FREQ_DEF		456000000
> > +
> > +/* FIXME: validate vblank_min! */
> > +#define OV64A40_VBLANK_MIN		128
> > +#define OV64A40_VTS_MAX			0xffff
> > +
> > +#define OV64A40_REG_MEC_LONG_EXPO	CCI_REG24(0x3500)
> > +#define OV64A40_EXPOSURE_MIN		16
> > +#define OV64A40_EXPOSURE_MARGIN		32
> > +
> > +#define OV64A40_REG_MEC_LONG_GAIN_COARSE	CCI_REG8(0x3508)
> > +#define OV64A40_REG_MEC_LONG_GAIN_FINE	CCI_REG8(0x3509)
> > +#define OV64A40_ANA_GAIN_MIN		0
> > +#define OV64A40_ANA_GAIN_MAX		0x3fff
> > +#define OV64A40_ANA_GAIN_DEFAULT	0x80
> > +
> > +#define OV64A40_REG_TIMING_CTRL0	CCI_REG16(0x3800)
> > +#define OV64A40_REG_TIMING_CTRL2	CCI_REG16(0x3802)
> > +#define OV64A40_REG_TIMING_CTRL4	CCI_REG16(0x3804)
> > +#define OV64A40_REG_TIMING_CTRL6	CCI_REG16(0x3806)
> > +#define OV64A40_REG_TIMING_CTRL8	CCI_REG16(0x3808)
> > +#define OV64A40_REG_TIMING_CTRLA	CCI_REG16(0x380a)
> > +#define OV64A40_REG_TIMING_CTRLC	CCI_REG16(0x380c)
> > +#define OV64A40_REG_TIMING_CTRLE	CCI_REG16(0x380e)
> > +#define OV64A40_REG_TIMING_CTRL10	CCI_REG16(0x3810)
> > +#define OV64A40_REG_TIMING_CTRL12	CCI_REG16(0x3812)
> > +
> > +/*
> > + * Careful: a typo in the datasheet calls this register
> > + * OV64A40_REG_TIMING_CTRL20.
> > + */
> > +#define OV64A40_REG_TIMING_CTRL14	CCI_REG8(0x3814)
> > +#define OV64A40_REG_TIMING_CTRL15	CCI_REG8(0x3815)
> > +#define OV64A40_ODD_INC_SHIFT		4
> > +#define OV64A40_SKIPPING_CONFIG(_odd, _even) \
> > +				(((_odd) << OV64A40_ODD_INC_SHIFT) | (_even))
> > +
> > +#define OV64A40_REG_TIMING_CTRL_20	CCI_REG8(0x3820)
> > +#define OV64A40_TIMING_CTRL_20_VFLIP	BIT(2)
> > +#define OV64A40_TIMING_CTRL_20_VBIN	BIT(1)
> > +
> > +#define OV64A40_REG_TIMING_CTRL_21	CCI_REG8(0x3821)
> > +#define OV64A40_TIMING_CTRL_21_HBIN	BIT(4)
> > +#define OV64A40_TIMING_CTRL_21_HFLIP	BIT(2)
> > +#define OV64A40_TIMING_CTRL_21_DSPEED	BIT(0)
> > +#define OV64A40_TIMING_CTRL_21_HBIN_CONF \
> > +					(OV64A40_TIMING_CTRL_21_HBIN | \
> > +					 OV64A40_TIMING_CTRL_21_DSPEED)
> > +
> > +#define OV64A40_REG_TIMINGS_VTS		CCI_REG16(0x380e)
> > +
> > +#define OV64A40_REG_CHIP_ID		CCI_REG24(0x300a)
> > +#define OV64A40_CHIP_ID			0x566441
> > +
> > +#define OV64A40_REG_SMIA		CCI_REG8(0x0100)
> > +#define OV64A40_REG_SMIA_STREAMING	BIT(0)
> > +
> > +static const s64 ov64a40_link_freq_menu[] = {
> > +	OV64A40_LINK_FREQ_DEF,
> > +};
> > +
> > +static const char * const ov64a40_supply_name[] = {
> > +	/* Supplies can be enabled in any order */
> > +	"avdd",		/* Analog (2.8V) supply */
> > +	"dovdd",	/* Digital Core (1.8V) supply */
> > +	"dvdd",		/* IF (1.1V) supply */
> > +};
> > +#define OV64A40_NUM_SUPPLIES ARRAY_SIZE(ov64a40_supply_name)
>
> Please just use ARRAY_SIZE(...) where you need this.
>
> > +
> > +static const unsigned int ov64a40_mbus_codes[] = {
> > +	MEDIA_BUS_FMT_SGBRG10_1X10,
> > +	MEDIA_BUS_FMT_SRGGB10_1X10,
> > +	MEDIA_BUS_FMT_SBGGR10_1X10,
> > +	MEDIA_BUS_FMT_SGRBG10_1X10,
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_init[] = {
> > +	{CCI_REG8(0x0103), 0x01}, {CCI_REG8(0x0301), 0x88},
>
> 	{ spaces inside braces, please },
>
[snip]

> > +
> > +struct ov64a40_reglist {
> > +	unsigned int num_regs;
> > +	const struct cci_reg_sequence *regvals;
> > +};
> > +
> > +struct ov64a40_subsampling {
> > +	unsigned int x_odd_inc;
> > +	unsigned int x_even_inc;
> > +	unsigned int y_odd_inc;
> > +	unsigned int y_even_inc;
>
> u16 or even u8 might suffice.
>

yup

> > +	bool vbin;
> > +	bool hbin;
>
> I recall bool is 32 bits on arm. Is it 64 bits on arm64? Just a note, I
> don't have a great suggestion here. :-)
>
> So only binning up to 2x2 is supported?
>

yes, further downscaling is obtained by skipping.

The 0x3820 register has BIT(1) "vbin_vc" than enables binning, so the
binning factor doesn't seem to be configurable. Of course there might
be other bits/registers to control this, but I'm not aware of those

> > +};
> > +
> > +static struct ov64a40_mode {
> > +	unsigned int width;
> > +	unsigned int height;
> > +	unsigned int vts_def;
> > +	unsigned int ppl;
> > +	const struct ov64a40_reglist reglist;
> > +	struct v4l2_rect analogue_crop;
> > +	struct v4l2_rect digital_crop;
> > +	struct ov64a40_subsampling subsampling;
> > +} ov64a40_modes[] = {
> > +	/* Full resolution */
> > +	{
> > +		.width = 9248,
> > +		.height = 6944,
> > +		.vts_def = 0x1ba0, /* 7072 */
> > +		.ppl = 0xfe8, /* 4072 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_9248x6944),
> > +			.regvals = ov64a40_9248x6944,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x0,
> > +			.top = 0x0,
> > +			.width = 0x243f, /* 9279 */
> > +			.height = 0x1b3f, /* 6975 */
>
> It's big, isn't it?
>

Indeed!

> > +		},
> > +		.digital_crop = {
> > +			.left = 0x11,
> > +			.top = 0x10,
> > +			.width = 9248,
> > +			.height = 6944,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x1,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x1,
> > +			.y_even_inc = 0x1,
> > +			.vbin = false,
> > +			.hbin = false,
> > +		},
> > +	},
> > +	/* 2x2 downscaled */
> > +	{
> > +		.width = 4624,
> > +		.height = 3472,
> > +		.vts_def = 0xdcd, /* 3533 */
> > +		.ppl = 0x840, /* 2112 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_4624_3472),
> > +			.regvals = ov64a40_4624_3472,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x0,
> > +			.top = 0x0,
> > +			.width = 0x243f, /* 9279 */
> > +			.height = 0x1b3f, /* 6975 */
> > +		},
> > +		.digital_crop = {
> > +			.left = 0x09,
> > +			.top = 0x08,
> > +			.width = 4624,
> > +			.height = 3472,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x3,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x1,
> > +			.y_even_inc = 0x1,
> > +			.vbin = true,
> > +			.hbin = false,
> > +		},
> > +	},
> > +	/* Analogue crop + 2x2 downscale + digital crop */
> > +	{
> > +		.width = 3840,
> > +		.height = 2160,
> > +		.vts_def = 0x8aa, /* 2218 */
> > +		.ppl = 0x69a, /* 1690 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_3840x2160),
> > +			.regvals = ov64a40_3840x2160,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x310, /* 784 */
> > +			.top = 0x520, /* 1312 */
> > +			.width = 0x212f, /* 8495 */
> > +			.height = 0x161f, /* 5663 */
> > +		},
> > +		.digital_crop = {
> > +			.left = 0x0f,
> > +			.top = 0x0e,
> > +			.width = 3840,
> > +			.height = 2160,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x3,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x1,
> > +			.y_even_inc = 0x1,
> > +			.vbin = true,
> > +			.hbin = false,
> > +		},
> > +	},
> > +	/* 4x4 downscaled */
> > +	{
> > +		.width = 2312,
> > +		.height = 1736,
> > +		.vts_def = 0x7ce, /* 1998 */
> > +		.ppl = 0x4e0, /* 1248 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_2312_1736),
> > +			.regvals = ov64a40_2312_1736,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x0,
> > +			.top = 0x0,
> > +			.width = 0x243f, /* 9279 */
> > +			.height = 0x1b3f, /* 6975 */
> > +		},
> > +		.digital_crop = {
> > +			.left = 0x05,
> > +			.top = 0x04,
> > +			.width = 2312,
> > +			.height = 1736,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x3,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x3,
> > +			.y_even_inc = 0x1,
> > +			.vbin = true,
> > +			.hbin = true,
> > +		},
> > +	},
> > +	/* Analogue crop + 4x4 downscale + digital crop */
> > +	{
> > +		.width = 1920,
> > +		.height = 1080,
> > +		.vts_def = 0x575, /* 1397 */
> > +		.ppl = 0x370, /* 880 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_1920x1080),
> > +			.regvals = ov64a40_1920x1080,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x310, /* 784 */
> > +			.top = 0x520, /* 1312 */
> > +			.width = 0x212f, /* 8495 */
> > +			.height = 0x161f, /* 5663 */
> > +		},
> > +		.digital_crop = {
> > +			.left = 0x07,
> > +			.top = 0x06,
> > +			.width = 1920,
> > +			.height = 1080,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x3,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x3,
> > +			.y_even_inc = 0x1,
> > +			.vbin = true,
> > +			.hbin = true,
> > +		},
> > +	},
> > +	/* Analogue crop + 4x4 downscale + digital crop */
> > +	{
> > +		.width = 1280,
> > +		.height = 720,
> > +		.vts_def = 0x3b6, /* 950 */
> > +		.ppl = 0x290, /* 656 */
> > +		.reglist = {
> > +			.num_regs = ARRAY_SIZE(ov64a40_1280x720),
> > +			.regvals = ov64a40_1280x720,
> > +		},
> > +		.analogue_crop = {
> > +			.left = 0x800, /* 2048 */
> > +			.top = 0x7f0, /* 2023 */
> > +			.width = 0x1c37, /* 7725 */
> > +			.height = 0x1357, /* 4953 */
> > +		},
> > +		.digital_crop = {
> > +			.left = 0x07,
> > +			.top = 0x06,
> > +			.width = 1280,
> > +			.height = 720,
> > +		},
> > +		.subsampling = {
> > +			.x_odd_inc = 0x3,
> > +			.x_even_inc = 0x1,
> > +			.y_odd_inc = 0x3,
> > +			.y_even_inc = 0x1,
> > +			.vbin = true,
> > +			.hbin = true,
> > +		},
> > +	},
> > +};
> > +
> > +struct ov64a40 {
> > +	struct device *dev;
> > +
> > +	struct v4l2_subdev sd;
> > +	struct media_pad pad;
> > +
> > +	struct regmap *cci;
> > +
> > +	struct ov64a40_mode *mode;
> > +
> > +	struct clk *xclk;
> > +
> > +	struct gpio_desc *reset_gpio;
> > +	struct regulator_bulk_data supplies[OV64A40_NUM_SUPPLIES];
> > +
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct v4l2_ctrl *exposure;
> > +	struct v4l2_ctrl *vblank;
> > +	struct v4l2_ctrl *hblank;
> > +	struct v4l2_ctrl *vflip;
> > +	struct v4l2_ctrl *hflip;
> > +};
> > +
> > +static inline struct ov64a40 *sd_to_ov64a40(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct ov64a40, sd);
>
> container_of_const(), please.
>

ack

> > +}
> > +
> > +static int ov64a40_program_geometry(struct ov64a40 *ov64a40)
> > +{
> > +	struct ov64a40_mode *mode = ov64a40->mode;
> > +	struct v4l2_rect *anacrop = &mode->analogue_crop;
> > +	struct v4l2_rect *digicrop = &mode->digital_crop;
> > +	int ret = 0;
> > +
> > +	/* Analogue crop. */
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL0,
> > +		  anacrop->left, &ret);
>
> You could assign ret here instead of in initialisation. Up to you. Same
> elsewhere.
>
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL2,
> > +		  anacrop->top, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL4,
> > +		  anacrop->width, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL6,
> > +		  anacrop->height, &ret);
> > +
> > +	/* ISP windowing. */
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL10,
> > +		  digicrop->left, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL12,
> > +		  digicrop->top, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL8,
> > +		  digicrop->width, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLA,
> > +		  digicrop->height, &ret);
> > +
> > +	/* Total timings. */
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLC,
> > +		  mode->ppl, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLE,
> > +		  mode->vts_def, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_program_subsampling(struct ov64a40 *ov64a40)
> > +{
> > +	struct ov64a40_subsampling *subsampling = &ov64a40->mode->subsampling;
> > +	int ret = 0;
> > +
> > +	/* Skipping configuration */
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL14,
> > +		  OV64A40_SKIPPING_CONFIG(subsampling->x_odd_inc,
> > +					  subsampling->x_even_inc), &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL15,
> > +		  OV64A40_SKIPPING_CONFIG(subsampling->y_odd_inc,
> > +					  subsampling->y_even_inc), &ret);
> > +
> > +	/* Binning configuration */
> > +	cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > +			OV64A40_TIMING_CTRL_20_VBIN,
> > +			subsampling->vbin ? OV64A40_TIMING_CTRL_20_VBIN : 0,
> > +			&ret);
> > +	cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > +			OV64A40_TIMING_CTRL_21_HBIN_CONF,
> > +			subsampling->hbin ?
> > +			OV64A40_TIMING_CTRL_21_HBIN_CONF : 0, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
> > +				   struct v4l2_subdev_state *state)
> > +{
> > +	const struct ov64a40_reglist *reglist = &ov64a40->mode->reglist;
> > +	unsigned long delay;
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(ov64a40->dev);
>
> You seem to be using autosuspend, but you still do not try to avoid writes
> of presumably the same register values if the sensor was powered on. The
> register writes usually take the most of the time there.

I'm not sure I get this comment. Are you afraid of multiple calls to
"start_streaming" being made ? Isn't it responsibility of the bridge
driver to handle this correctly ?

One thing for sure, I should grab a few controls (flips, link_freq)
avoid them being written to HW while the sensor is streaming.

>
> pm_runtime_get_sync() returns 1 if the sensor was already in active state.
>
> I'm about to send a patchset related to this actually, I can cc you...
>
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = cci_multi_reg_write(ov64a40->cci, ov64a40_init,
> > +				  ARRAY_SIZE(ov64a40_init), NULL);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret = cci_multi_reg_write(ov64a40->cci, reglist->regvals,
> > +				  reglist->num_regs, NULL);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret = ov64a40_program_geometry(ov64a40);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret = ov64a40_program_subsampling(ov64a40);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret =  __v4l2_ctrl_handler_setup(&ov64a40->ctrl_handler);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	ret = cci_write(ov64a40->cci, OV64A40_REG_SMIA,
> > +			OV64A40_REG_SMIA_STREAMING, NULL);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	/* delay: max(4096 xclk pulses, 150usec) + exposure time */
> > +	delay = DIV_ROUND_UP(4096, OV64A40_XCLK_FREQ / 1000 / 1000);
> > +	delay = max(delay, 150ul);
> > +	delay += DIV_ROUND_UP(ov64a40->mode->ppl * ov64a40->exposure->cur.val,
> > +			      OV64A40_PIXEL_RATE / 1000 / 1000);
> > +	fsleep(delay);
> > +
> > +	return 0;
> > +
> > +error_power_off:
> > +	pm_runtime_mark_last_busy(ov64a40->dev);
> > +	pm_runtime_put_autosuspend(ov64a40->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_stop_streaming(struct ov64a40 *ov64a40,
> > +				  struct v4l2_subdev_state *state)
> > +{
> > +	cci_update_bits(ov64a40->cci, OV64A40_REG_SMIA, BIT(0), 0, NULL);
> > +	pm_runtime_put(ov64a40->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +	struct v4l2_subdev_state *state;
> > +	int ret;
> > +
> > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > +	if (enable)
> > +		ret = ov64a40_start_streaming(ov64a40, state);
> > +	else
> > +		ret = ov64a40_stop_streaming(ov64a40, state);
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov64a40_video_ops = {
> > +	.s_stream = ov64a40_set_stream,
> > +};
> > +
> > +static u32 ov64a40_mbus_code(struct ov64a40 *ov64a40)
> > +{
> > +	unsigned int index = ov64a40->hflip->val << 1 | ov64a40->vflip->val;
> > +
> > +	return ov64a40_mbus_codes[index];
> > +}
> > +
> > +static void ov64a40_update_pad_fmt(struct ov64a40 *ov64a40,
> > +				   struct ov64a40_mode *mode,
> > +				   struct v4l2_mbus_framefmt *fmt)
> > +{
> > +	fmt->code = ov64a40_mbus_code(ov64a40);
> > +	fmt->width = mode->width;
> > +	fmt->height = mode->height;
> > +	fmt->field = V4L2_FIELD_NONE;
> > +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +}
> > +
> > +static int ov64a40_init_cfg(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *state)
> > +{
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +
> > +	format = v4l2_subdev_get_pad_format(sd, state, 0);
> > +	ov64a40_update_pad_fmt(ov64a40, &ov64a40_modes[0], format);
> > +
> > +	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> > +	crop->top = OV64A40_PIXEL_ARRAY_TOP;
> > +	crop->left = OV64A40_PIXEL_ARRAY_LEFT;
> > +	crop->width = OV64A40_PIXEL_ARRAY_WIDTH;
> > +	crop->height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *sd_state,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +
> > +	if (code->index >= ARRAY_SIZE(ov64a40_mbus_codes) / 4)
> > +		return -EINVAL;
>
> How about returning -EINVAL if index is non-zero? The function won't work
> correctly if you begin supporting more mbus codes so there's no reason to
> suggest it does.
>

Ack

> > +
> > +	code->code = ov64a40_mbus_code(ov64a40);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_enum_frame_size(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *sd_state,
> > +				   struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +	struct ov64a40_mode *mode;
> > +	u32 code;
> > +
> > +	if (fse->index >= ARRAY_SIZE(ov64a40_modes))
> > +		return -EINVAL;
> > +
> > +	code = ov64a40_mbus_code(ov64a40);
> > +	if (fse->code != code)
> > +		return -EINVAL;
> > +
> > +	mode = &ov64a40_modes[fse->index];
> > +	fse->min_width = fse->max_width = mode->width;
> > +	fse->min_height = fse->max_height = mode->height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_get_selection(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *sd_state,
> > +				 struct v4l2_subdev_selection *sel)
> > +{
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP: {
> > +		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > +		return 0;
> > +	}
>
> The braces are unnecessary here.
>
> > +
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = OV64A40_NATIVE_WIDTH;
> > +		sel->r.height = OV64A40_NATIVE_HEIGHT;
> > +
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		sel->r.top = OV64A40_PIXEL_ARRAY_TOP;
> > +		sel->r.left = OV64A40_PIXEL_ARRAY_LEFT;
> > +		sel->r.width = OV64A40_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int ov64a40_set_pad_format(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *sd_state,
> > +				  struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct ov64a40_mode *mode;
> > +
> > +	mode = v4l2_find_nearest_size(ov64a40_modes,
> > +				      ARRAY_SIZE(ov64a40_modes),
> > +				      width, height,
> > +				      fmt->format.width, fmt->format.height);
> > +
> > +	ov64a40_update_pad_fmt(ov64a40, mode, &fmt->format);
> > +
> > +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>
> Could you rebase this on my master branch? The function you'll need from
> now on is called v4l2_subdev_state_get_format(). Similarly for crop and
> compose.
>
> > +	if (ov64a40->mode == mode && format->code == fmt->format.code)
> > +		return 0;
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +		int vblank_max, vblank_def;
> > +		int hblank_val;
> > +		int exp_max;
> > +
> > +		ov64a40->mode = mode;
> > +		*v4l2_subdev_get_pad_crop(sd, sd_state, 0) = mode->analogue_crop;
> > +
> > +		/* Update control limits according to the new mode. */
> > +		vblank_max = OV64A40_VTS_MAX - mode->height;
> > +		vblank_def = mode->vts_def - mode->height;
> > +		__v4l2_ctrl_modify_range(ov64a40->vblank,
> > +					 OV64A40_VBLANK_MIN,
> > +					 vblank_max, 1, vblank_def);
> > +		__v4l2_ctrl_s_ctrl(ov64a40->vblank, vblank_def);
> > +
> > +		exp_max = mode->vts_def - OV64A40_EXPOSURE_MARGIN;
> > +		__v4l2_ctrl_modify_range(ov64a40->exposure,
> > +					 OV64A40_EXPOSURE_MIN, exp_max,
> > +					 1, OV64A40_EXPOSURE_MIN);
> > +
> > +		/* FIXME: see comment in init_ctrl about ppl multiplier. */
> > +		hblank_val = mode->ppl * 4 - mode->width;
> > +		__v4l2_ctrl_modify_range(ov64a40->hblank,
> > +					 hblank_val, hblank_val, 1, hblank_val);
> > +	}
> > +
> > +	*format = fmt->format;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> > +	.init_cfg = ov64a40_init_cfg,
> > +	.enum_mbus_code = ov64a40_enum_mbus_code,
> > +	.enum_frame_size = ov64a40_enum_frame_size,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> > +	.set_fmt = ov64a40_set_pad_format,
> > +	.get_selection = ov64a40_get_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops ov64a40_core_ops = {
> > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov64a40_subdev_ops = {
> > +	.core = &ov64a40_core_ops,
> > +	.video = &ov64a40_video_ops,
> > +	.pad = &ov64a40_pad_ops,
> > +};
> > +
> > +static int ov64a40_power_on(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(ov64a40->xclk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regulator_bulk_enable(OV64A40_NUM_SUPPLIES, ov64a40->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +		return ret;
>
> clk_disable_unprepare().
>

Upsie

> > +	}
> > +
> > +	gpiod_set_value_cansleep(ov64a40->reset_gpio, 0);
> > +
> > +	fsleep(5000);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_power_off(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +
> > +	gpiod_set_value_cansleep(ov64a40->reset_gpio, 1);
> > +	regulator_bulk_disable(OV64A40_NUM_SUPPLIES, ov64a40->supplies);
> > +	clk_disable_unprepare(ov64a40->xclk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_set_anagain(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct ov64a40 *ov64a40 = container_of(ctrl->handler, struct ov64a40,
> > +					       ctrl_handler);
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * COARSE GAIN[6:0] = ctrl->val >> 7
> > +	 * FINE_GAIN[7:1] = (ctrl->val & 0x7f) << 1;
> > +	 */
> > +	cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_GAIN_COARSE,
> > +		  ctrl->val >> 7, &ret);
> > +	cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_GAIN_FINE,
> > +		  (ctrl->val & 0x7f) << 1, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct ov64a40 *ov64a40 = container_of(ctrl->handler, struct ov64a40,
> > +					       ctrl_handler);
> > +	int ret;
> > +
> > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > +		int exp_max = ov64a40->mode->height + ctrl->val
> > +			    - OV64A40_EXPOSURE_MARGIN;
> > +		int exp_val = min(ov64a40->exposure->cur.val, exp_max);
> > +
> > +		__v4l2_ctrl_modify_range(ov64a40->exposure,
> > +					 ov64a40->exposure->minimum,
> > +					 exp_max, 1, exp_val);
> > +	}
> > +
> > +	if (pm_runtime_get_if_in_use(ov64a40->dev) == 0)
>
> The function you should use here is actually called
> pm_runtime_get_if_active(), but this change would better be postponed after
> my patchset.

  `int pm_runtime_get_if_in_use(struct device *dev);`
    - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
      runtime PM status is RPM_ACTIVE and the runtime PM usage counter is
      nonzero, increment the counter and return 1; otherwise return 0 without
      changing the counter

  `int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);`
    - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
      runtime PM status is RPM_ACTIVE, and either ign_usage_count is true
      or the device's usage_count is non-zero, increment the counter and
      return 1; otherwise return 0 without changing the counter


The only difference I see here is the additional 'ign_usage_count'
which allows to forcefully resume the device by ignoring the usage
counter ? Why would you forcefully resume the device here ? Don't we
actually want the opposite and use this check to only access the HW if
the device is powered already ?

>
> > +		return 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE:
> > +		ret = cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_EXPO,
> > +				ctrl->val, NULL);
> > +		break;
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		ret = ov64a40_set_anagain(ctrl);
> > +		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret = cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS,
> > +				ctrl->val + ov64a40->mode->height, NULL);
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > +				      OV64A40_TIMING_CTRL_20_VFLIP,
> > +				      ctrl->val << 2,
> > +				      NULL);
> > +		break;
> > +	case V4L2_CID_HFLIP:
> > +		ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > +				      OV64A40_TIMING_CTRL_21_HFLIP,
> > +				      ctrl->val << 2,
> > +				      NULL);
> > +		break;
> > +	default:
> > +		dev_err(ov64a40->dev, "Unhandled control: %#x\n", ctrl->id);
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	pm_runtime_put(ov64a40->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ov64a40_ctrl_ops = {
> > +	.s_ctrl = ov64a40_set_ctrl,
> > +};
> > +
> > +static int ov64a40_init_controls(struct ov64a40 *ov64a40)
> > +{
> > +	struct v4l2_ctrl_handler *hdlr = &ov64a40->ctrl_handler;
> > +	int exp_max, hblank_val, vblank_max, vblank_def;
> > +	struct v4l2_fwnode_device_properties props;
> > +	struct v4l2_ctrl *link_freq;
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(hdlr, 10);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * FIXME: When reporting HBLANK, we need to multiply PPL by 4 as the
> > +	 * sensor has an internal multiplier. Multiply PIXEL_RATE by 4 to
> > +	 * maintain a correct frame duration calculation.
> > +	 */
> > +	v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > +			  OV64A40_PIXEL_RATE * 4, OV64A40_PIXEL_RATE * 4, 1,
> > +			  OV64A40_PIXEL_RATE * 4);
> > +
> > +	link_freq = v4l2_ctrl_new_int_menu(hdlr, &ov64a40_ctrl_ops,
> > +					   V4L2_CID_LINK_FREQ,
> > +					   ARRAY_SIZE(ov64a40_link_freq_menu) - 1,
> > +					   0, ov64a40_link_freq_menu);
> > +	if (link_freq)
> > +		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	exp_max = ov64a40->mode->vts_def - OV64A40_EXPOSURE_MARGIN;
> > +	ov64a40->exposure = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +					      V4L2_CID_EXPOSURE,
> > +					      OV64A40_EXPOSURE_MIN, exp_max, 1,
> > +					      OV64A40_EXPOSURE_MIN);
> > +
> > +	hblank_val = ov64a40->mode->ppl * 4 - ov64a40->mode->width;
> > +	ov64a40->hblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +					    V4L2_CID_HBLANK, hblank_val,
> > +					    hblank_val, 1, hblank_val);
> > +
> > +	if (ov64a40->hblank)
> > +		ov64a40->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	vblank_def = ov64a40->mode->vts_def - ov64a40->mode->height;
> > +	vblank_max = OV64A40_VTS_MAX - ov64a40->mode->height;
> > +	ov64a40->vblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +					    V4L2_CID_VBLANK, OV64A40_VBLANK_MIN,
> > +					    vblank_max, 1, vblank_def);
> > +
> > +	v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> > +			  OV64A40_ANA_GAIN_MIN, OV64A40_ANA_GAIN_MAX, 1,
> > +			  OV64A40_ANA_GAIN_DEFAULT);
> > +
> > +	ov64a40->hflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +					   V4L2_CID_HFLIP, 0, 1, 1, 1);
> > +	if (ov64a40->hflip)
> > +		ov64a40->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +	ov64a40->vflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +	if (ov64a40->vflip)
> > +		ov64a40->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +	if (hdlr->error) {
> > +		ret = hdlr->error;
> > +		dev_err(ov64a40->dev, "control init failed: %d\n", ret);
> > +		goto error_free_hdlr;
> > +	}
> > +
> > +	ret = v4l2_fwnode_device_parse(ov64a40->dev, &props);
> > +	if (ret)
> > +		goto error_free_hdlr;
> > +
> > +	ret = v4l2_ctrl_new_fwnode_properties(hdlr, &ov64a40_ctrl_ops,
> > +					      &props);
> > +	if (ret)
> > +		goto error_free_hdlr;
> > +
> > +	ov64a40->sd.ctrl_handler = hdlr;
> > +
> > +	return 0;
> > +
> > +error_free_hdlr:
> > +	v4l2_ctrl_handler_free(hdlr);
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_identify(struct ov64a40 *ov64a40)
> > +{
> > +	int ret;
> > +	u64 id;
> > +
> > +	ret = cci_read(ov64a40->cci, OV64A40_REG_CHIP_ID, &id, NULL);
> > +	if (ret) {
> > +		dev_err(ov64a40->dev, "Failed to read chip id: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (id != OV64A40_CHIP_ID) {
> > +		dev_err(ov64a40->dev, "chip id mismatch: %#llx\n", id);
> > +		return -ENODEV;
> > +	}
> > +
> > +	dev_dbg(ov64a40->dev, "OV64A40 chip identified: %#llx\n", id);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov64a40_parse_dt(struct ov64a40 *ov64a40)
> > +{
> > +	struct v4l2_fwnode_endpoint v4l2_fwnode = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	struct fwnode_handle *endpoint;
> > +	int ret = -EINVAL;
> > +
> > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(ov64a40->dev),
> > +						  NULL);
> > +	if (!endpoint) {
> > +		dev_err(ov64a40->dev, "Failed to find endpoint\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &v4l2_fwnode)) {
> > +		dev_err(ov64a40->dev, "Failed to parse endpoint\n");
> > +		goto error_put_fwnode;
> > +	}
> > +
> > +	if (v4l2_fwnode.bus.mipi_csi2.num_data_lanes != 2) {
> > +		dev_err(ov64a40->dev, "Unsupported number of data lanes: %u\n",
> > +			v4l2_fwnode.bus.mipi_csi2.num_data_lanes);
> > +		goto error_free_fwnode;
> > +	}
> > +
> > +	if (v4l2_fwnode.nr_of_link_frequencies != 1 ||
>
> This is a bit simplistic. You could at least check if one of the provided
> frequencies is what you expect. Up to you though.

Yes, in v2 I will have more ore additional frequency to support and I
should rework this part and actually make sure that we restrict the
allowed link_frequencies to the ones specified in dtbs.
>
> > +	    v4l2_fwnode.link_frequencies[0] != OV64A40_LINK_FREQ_DEF) {
> > +		dev_err(ov64a40->dev, "Link frequency not supported: %lld\n",
> > +			v4l2_fwnode.link_frequencies[0]);
> > +		goto error_free_fwnode;
> > +	}
> > +
> > +	v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +
> > +	/* Register the subdev on the endpoint, so don't put it yet. */
> > +	ov64a40->sd.fwnode = endpoint;
>
> You should no longer assign this explicitly unless you have some very
> special needs.
>

Yup!

> > +
> > +	return 0;
> > +
> > +error_free_fwnode:
> > +	v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +error_put_fwnode:
> > +	fwnode_handle_put(endpoint);
> > +	return ret;
> > +}
> > +
> > +static int ov64a40_get_regulators(struct ov64a40 *ov64a40)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov64a40->sd);
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < OV64A40_NUM_SUPPLIES; i++)
> > +		ov64a40->supplies[i].supply = ov64a40_supply_name[i];
> > +
> > +	return devm_regulator_bulk_get(&client->dev, OV64A40_NUM_SUPPLIES,
> > +				       ov64a40->supplies);
> > +}
> > +
> > +static int ov64a40_probe(struct i2c_client *client)
> > +{
> > +	struct ov64a40 *ov64a40;
> > +	u32 xclk_freq;
> > +	int ret;
> > +
> > +	ov64a40 = devm_kzalloc(&client->dev, sizeof(*ov64a40), GFP_KERNEL);
> > +	if (!ov64a40)
> > +		return -ENOMEM;
> > +
> > +	ov64a40->dev = &client->dev;
> > +	v4l2_i2c_subdev_init(&ov64a40->sd, client, &ov64a40_subdev_ops);
> > +
> > +	ov64a40->cci = devm_cci_regmap_init_i2c(client, 16);
> > +	if (IS_ERR(ov64a40->cci)) {
> > +		dev_err(&client->dev, "Failed to initialize CCI\n");
> > +		return PTR_ERR(ov64a40->cci);
> > +	}
> > +
> > +	ov64a40->xclk = devm_clk_get(&client->dev, NULL);
> > +	if (!ov64a40->xclk)
> > +		return dev_err_probe(&client->dev, PTR_ERR(ov64a40->xclk),
> > +				     "Failed to get clock\n");
> > +
> > +	xclk_freq = clk_get_rate(ov64a40->xclk);
> > +	if (xclk_freq != OV64A40_XCLK_FREQ) {
> > +		dev_err(&client->dev, "Unsupported xclk frequency %u\n",
> > +			xclk_freq);
> > +		return -EINVAL;
>
> Feel free to handle this not as an error. Up to you.
>

Well, the driver won't work correctly if the clock is not running
at the expected frequency..

> > +	}
> > +
> > +	ret = ov64a40_get_regulators(ov64a40);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ov64a40->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > +						      GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov64a40->reset_gpio))
> > +		return dev_err_probe(&client->dev, PTR_ERR(ov64a40->reset_gpio),
> > +				     "Failed to get reset gpio\n");
> > +
> > +	ret = ov64a40_parse_dt(ov64a40);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov64a40_power_on(&client->dev);
> > +	if (ret)
> > +		goto error_put_fwnode;
> > +
> > +	ret = ov64a40_identify(ov64a40);
> > +	if (ret)
> > +		goto error_poweroff;
> > +
> > +	ov64a40->mode = &ov64a40_modes[0];
> > +
> > +	pm_runtime_set_active(&client->dev);
> > +	pm_runtime_get_noresume(&client->dev);
> > +	pm_runtime_enable(&client->dev);
> > +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +	pm_runtime_use_autosuspend(&client->dev);
> > +
> > +	ret = ov64a40_init_controls(ov64a40);
> > +	if (ret)
> > +		goto error_poweroff;
> > +
> > +	/* Initialize subdev */
> > +	ov64a40->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE
> > +			  | V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	ov64a40->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	ov64a40->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&ov64a40->sd.entity, 1, &ov64a40->pad);
> > +	if (ret) {
> > +		dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
> > +		goto error_handler_free;
> > +	}
> > +
> > +	ov64a40->sd.state_lock = ov64a40->ctrl_handler.lock;
> > +	ret = v4l2_subdev_init_finalize(&ov64a40->sd);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "subdev init error: %d\n", ret);
> > +		goto error_media_entity;
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev_sensor(&ov64a40->sd);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"failed to register sensor sub-device: %d\n", ret);
> > +		goto error_subdev_cleanup;
> > +	}
> > +
> > +	pm_runtime_mark_last_busy(&client->dev);
> > +	pm_runtime_put_autosuspend(&client->dev);
> > +
> > +	return 0;
> > +
> > +error_subdev_cleanup:
> > +	v4l2_subdev_cleanup(&ov64a40->sd);
> > +error_media_entity:
> > +	media_entity_cleanup(&ov64a40->sd.entity);
> > +error_handler_free:
> > +	v4l2_ctrl_handler_free(ov64a40->sd.ctrl_handler);
> > +error_poweroff:
> > +	ov64a40_power_off(&client->dev);
> > +error_put_fwnode:
> > +	fwnode_handle_put(ov64a40->sd.fwnode);
> > +
> > +	return ret;
> > +}
> > +
> > +void ov64a40_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	fwnode_handle_put(ov64a40->sd.fwnode);
>
> See my comment on assigning sd->fwnode.
>
> > +	v4l2_subdev_cleanup(sd);
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		ov64a40_power_off(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
>
> This also needs to be done in probe error handling --- the status check is
> unnecesary though.
>

Ack

> > +}
> > +
> > +static const struct of_device_id ov64a40_of_ids[] = {
> > +	{ .compatible = "ovti,ov64a40" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov64a40_of_ids);
> > +
> > +static const struct dev_pm_ops ov64a40_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(ov64a40_power_off, ov64a40_power_on, NULL)
> > +};
> > +
> > +static struct i2c_driver ov64a40_i2c_driver = {
> > +	.driver	= {
> > +		.name = "ov64a40",
> > +		.of_match_table	= ov64a40_of_ids,
> > +		.pm = &ov64a40_pm_ops,
> > +	},
> > +	.probe	= ov64a40_probe,
> > +	.remove	= ov64a40_remove,
> > +};
> > +
> > +module_i2c_driver(ov64a40_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
> > +MODULE_DESCRIPTION("OmniVision OV64A40 sensor driver");
> > +MODULE_LICENSE("GPL");
>
> --
> Kind regards,
>
> Sakari Ailus

