Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39E12E801D
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 13:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgLaMyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 07:54:40 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49121 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgLaMyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 07:54:39 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5D21540006;
        Thu, 31 Dec 2020 12:53:45 +0000 (UTC)
Date:   Thu, 31 Dec 2020 13:53:45 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add support for the OV5648 image
 sensor
Message-ID: <X+3J2YwbUVmoJ9y1@aptenodytes>
References: <20201211154027.153535-1-paul.kocialkowski@bootlin.com>
 <20201211154027.153535-3-paul.kocialkowski@bootlin.com>
 <20201220223948.GC26370@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kRAn/Z473XsBHAGq"
Content-Disposition: inline
In-Reply-To: <20201220223948.GC26370@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kRAn/Z473XsBHAGq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 21 Dec 20, 00:39, Sakari Ailus wrote:
> Hi Paul,
>=20
> Thanks for the update.
>=20
> A few more small issues below that I didn't notice earlier. The comments
> apply to the other driver as well I believe.

Thanks for the review, I'll address your comments in the next version for
both drivers!

Cheers,

Paul

> On Fri, Dec 11, 2020 at 04:40:27PM +0100, Paul Kocialkowski wrote:
> > The OV5648 is a 5 Mpx CMOS image sensor, connected via MIPI CSI-2
> > in a one or two lane configuration.
> >=20
> > Most of the features of the hardware are supported, including:
> > - Auto and manual exposition/gain
> > - Auto and manual white balance
> > - Horizontal and vertical flip
> > - Test patterns
> >=20
> > But the following are still missing:
> > - Debanding, based on power source frequency;
> > - Exposition setting correlated to time units.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   13 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/ov5648.c | 2638 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 2652 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov5648.c
> >=20
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 878f66ef2719..c0470a8b9a80 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -922,6 +922,19 @@ config VIDEO_OV5647
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called ov5647.
> > =20
> > +config VIDEO_OV5648
> > +	tristate "OmniVision OV5648 sensor support"
> > +	depends on I2C && PM && VIDEO_V4L2
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> > +	help
> > +	  This is a Video4Linux2 sensor driver for the OmniVision
> > +	  OV5648 camera.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called ov5648.
> > +
> >  config VIDEO_OV6650
> >  	tristate "OmniVision OV6650 sensor support"
> >  	depends on I2C && VIDEO_V4L2
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index f0a77473979d..15d4d6382582 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_VIDEO_OV2740) +=3D ov2740.o
> >  obj-$(CONFIG_VIDEO_OV5640) +=3D ov5640.o
> >  obj-$(CONFIG_VIDEO_OV5645) +=3D ov5645.o
> >  obj-$(CONFIG_VIDEO_OV5647) +=3D ov5647.o
> > +obj-$(CONFIG_VIDEO_OV5648) +=3D ov5648.o
> >  obj-$(CONFIG_VIDEO_OV5670) +=3D ov5670.o
> >  obj-$(CONFIG_VIDEO_OV5675) +=3D ov5675.o
> >  obj-$(CONFIG_VIDEO_OV5695) +=3D ov5695.o
> > diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> > new file mode 100644
> > index 000000000000..4ae6b65ec258
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov5648.c
> > @@ -0,0 +1,2638 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2020 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-image-sizes.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/* Clock rate */
> > +
> > +#define OV5648_XVCLK_RATE			24000000
> > +
> > +/* Register definitions */
> > +
> > +/* System */
> > +
> > +#define OV5648_SW_STANDBY_REG			0x100
> > +#define OV5648_SW_STANDBY_STREAM_ON		BIT(0)
> > +
> > +#define OV5648_SW_RESET_REG			0x103
> > +#define OV5648_SW_RESET_RESET			BIT(0)
> > +
> > +#define OV5648_PAD_OEN0_REG			0x3000
> > +#define OV5648_PAD_OEN1_REG			0x3001
> > +#define OV5648_PAD_OEN2_REG			0x3002
> > +#define OV5648_PAD_OUT0_REG			0x3008
> > +#define OV5648_PAD_OUT1_REG			0x3009
> > +
> > +#define OV5648_CHIP_ID_H_REG			0x300a
> > +#define OV5648_CHIP_ID_H_VALUE			0x56
> > +#define OV5648_CHIP_ID_L_REG			0x300b
> > +#define OV5648_CHIP_ID_L_VALUE			0x48
> > +
> > +#define OV5648_PAD_OUT2_REG			0x300d
> > +#define OV5648_PAD_SEL0_REG			0x300e
> > +#define OV5648_PAD_SEL1_REG			0x300f
> > +#define OV5648_PAD_SEL2_REG			0x3010
> > +#define OV5648_PAD_PK_REG			0x3011
> > +#define OV5648_PAD_PK_PD_DATO_EN		BIT(7)
> > +#define OV5648_PAD_PK_DRIVE_STRENGTH_1X		(0 << 5)
> > +#define OV5648_PAD_PK_DRIVE_STRENGTH_2X		(2 << 5)
> > +#define OV5648_PAD_PK_FREX_N			BIT(1)
> > +
> > +#define OV5648_A_PWC_PK_O0_REG			0x3013
> > +#define OV5648_A_PWC_PK_O0_BP_REGULATOR_N	BIT(3)
> > +#define OV5648_A_PWC_PK_O1_REG			0x3014
> > +
> > +#define OV5648_MIPI_PHY0_REG			0x3016
> > +#define OV5648_MIPI_PHY1_REG			0x3017
> > +#define OV5648_MIPI_SC_CTRL0_REG		0x3018
> > +#define OV5648_MIPI_SC_CTRL0_MIPI_LANES(v)	(((v) << 5) & GENMASK(7, 5))
> > +#define OV5648_MIPI_SC_CTRL0_PHY_HS_TX_PD	BIT(4)
> > +#define OV5648_MIPI_SC_CTRL0_PHY_LP_RX_PD	BIT(3)
> > +#define OV5648_MIPI_SC_CTRL0_MIPI_EN		BIT(2)
> > +#define OV5648_MIPI_SC_CTRL0_MIPI_SUSP		BIT(1)
> > +#define OV5648_MIPI_SC_CTRL0_LANE_DIS_OP	BIT(0)
> > +#define OV5648_MIPI_SC_CTRL1_REG		0x3019
> > +#define OV5648_MISC_CTRL0_REG			0x3021
> > +#define OV5648_MIPI_SC_CTRL2_REG		0x3022
> > +#define OV5648_SUB_ID_REG			0x302a
> > +
> > +#define OV5648_PLL_CTRL0_REG			0x3034
> > +#define OV5648_PLL_CTRL0_PLL_CHARGE_PUMP(v)	(((v) << 4) & GENMASK(6, 4=
))
> > +#define OV5648_PLL_CTRL0_BITS(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_PLL_CTRL1_REG			0x3035
> > +#define OV5648_PLL_CTRL1_SYS_DIV(v)		(((v) << 4) & GENMASK(7, 4))
> > +#define OV5648_PLL_CTRL1_MIPI_DIV(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_PLL_MUL_REG			0x3036
> > +#define OV5648_PLL_MUL(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_PLL_DIV_REG			0x3037
> > +#define OV5648_PLL_DIV_ROOT_DIV(v)		((((v) - 1) << 4) & BIT(4))
> > +#define OV5648_PLL_DIV_PLL_PRE_DIV(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_PLL_DEBUG_REG			0x3038
> > +#define OV5648_PLL_BYPASS_REG			0x3039
> > +
> > +#define OV5648_PLLS_BYPASS_REG			0x303a
> > +#define OV5648_PLLS_MUL_REG			0x303b
> > +#define OV5648_PLLS_MUL(v)			((v) & GENMASK(4, 0))
> > +#define OV5648_PLLS_CTRL_REG			0x303c
> > +#define OV5648_PLLS_CTRL_PLL_CHARGE_PUMP(v)	(((v) << 4) & GENMASK(6, 4=
))
> > +#define OV5648_PLLS_CTRL_SYS_DIV(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_PLLS_DIV_REG			0x303d
> > +#define OV5648_PLLS_DIV_PLLS_PRE_DIV(v)		(((v) << 4) & GENMASK(5, 4))
> > +#define OV5648_PLLS_DIV_PLLS_DIV_R(v)		((((v) - 1) << 2) & BIT(2))
> > +#define OV5648_PLLS_DIV_PLLS_SEL_DIV(v)		((v) & GENMASK(1, 0))
> > +
> > +#define OV5648_SRB_CTRL_REG			0x3106
> > +#define OV5648_SRB_CTRL_SCLK_DIV(v)		(((v) << 2) & GENMASK(3, 2))
> > +#define OV5648_SRB_CTRL_RESET_ARBITER_EN	BIT(1)
> > +#define OV5648_SRB_CTRL_SCLK_ARBITER_EN		BIT(0)
> > +
> > +/* Group Hold */
> > +
> > +#define OV5648_GROUP_ADR0_REG			0x3200
> > +#define OV5648_GROUP_ADR1_REG			0x3201
> > +#define OV5648_GROUP_ADR2_REG			0x3202
> > +#define OV5648_GROUP_ADR3_REG			0x3203
> > +#define OV5648_GROUP_LEN0_REG			0x3204
> > +#define OV5648_GROUP_LEN1_REG			0x3205
> > +#define OV5648_GROUP_LEN2_REG			0x3206
> > +#define OV5648_GROUP_LEN3_REG			0x3207
> > +#define OV5648_GROUP_ACCESS_REG			0x3208
> > +
> > +/* Exposure/gain/banding */
> > +
> > +#define OV5648_EXPOSURE_CTRL_HH_REG		0x3500
> > +#define OV5648_EXPOSURE_CTRL_HH(v)		(((v) & GENMASK(19, 16)) >> 16)
> > +#define OV5648_EXPOSURE_CTRL_HH_VALUE(v)	(((v) << 16) & GENMASK(19, 16=
))
> > +#define OV5648_EXPOSURE_CTRL_H_REG		0x3501
> > +#define OV5648_EXPOSURE_CTRL_H(v)		(((v) & GENMASK(15, 8)) >> 8)
> > +#define OV5648_EXPOSURE_CTRL_H_VALUE(v)		(((v) << 8) & GENMASK(15, 8))
> > +#define OV5648_EXPOSURE_CTRL_L_REG		0x3502
> > +#define OV5648_EXPOSURE_CTRL_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_EXPOSURE_CTRL_L_VALUE(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_MANUAL_CTRL_REG			0x3503
> > +#define OV5648_MANUAL_CTRL_FRAME_DELAY(v)	(((v) << 4) & GENMASK(5, 4))
> > +#define OV5648_MANUAL_CTRL_AGC_MANUAL_EN	BIT(1)
> > +#define OV5648_MANUAL_CTRL_AEC_MANUAL_EN	BIT(0)
> > +#define OV5648_GAIN_CTRL_H_REG			0x350a
> > +#define OV5648_GAIN_CTRL_H(v)			(((v) & GENMASK(9, 8)) >> 8)
> > +#define OV5648_GAIN_CTRL_H_VALUE(v)		(((v) << 8) & GENMASK(9, 8))
> > +#define OV5648_GAIN_CTRL_L_REG			0x350b
> > +#define OV5648_GAIN_CTRL_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_GAIN_CTRL_L_VALUE(v)		((v) & GENMASK(7, 0))
> > +
> > +#define OV5648_ANALOG_CTRL0_REG_BASE		0x3600
> > +#define OV5648_ANALOG_CTRL1_REG_BASE		0x3700
> > +
> > +#define OV5648_AEC_CTRL0_REG			0x3a00
> > +#define OV5648_AEC_CTRL0_DEBUG			BIT(6)
> > +#define OV5648_AEC_CTRL0_DEBAND_EN		BIT(5)
> > +#define OV5648_AEC_CTRL0_DEBAND_LOW_LIMIT_EN	BIT(4)
> > +#define OV5648_AEC_CTRL0_START_SEL_EN		BIT(3)
> > +#define OV5648_AEC_CTRL0_NIGHT_MODE_EN		BIT(2)
> > +#define OV5648_AEC_CTRL0_FREEZE_EN		BIT(0)
> > +#define OV5648_EXPOSURE_MIN_REG			0x3a01
> > +#define OV5648_EXPOSURE_MAX_60_H_REG		0x3a02
> > +#define OV5648_EXPOSURE_MAX_60_L_REG		0x3a03
> > +#define OV5648_AEC_CTRL5_REG			0x3a05
> > +#define OV5648_AEC_CTRL6_REG			0x3a06
> > +#define OV5648_AEC_CTRL7_REG			0x3a07
> > +#define OV5648_BANDING_STEP_50_H_REG		0x3a08
> > +#define OV5648_BANDING_STEP_50_L_REG		0x3a09
> > +#define OV5648_BANDING_STEP_60_H_REG		0x3a0a
> > +#define OV5648_BANDING_STEP_60_L_REG		0x3a0b
> > +#define OV5648_AEC_CTRLC_REG			0x3a0c
> > +#define OV5648_BANDING_MAX_60_REG		0x3a0d
> > +#define OV5648_BANDING_MAX_50_REG		0x3a0e
> > +#define OV5648_WPT_REG				0x3a0f
> > +#define OV5648_BPT_REG				0x3a10
> > +#define OV5648_VPT_HIGH_REG			0x3a11
> > +#define OV5648_AVG_MANUAL_REG			0x3a12
> > +#define OV5648_PRE_GAIN_REG			0x3a13
> > +#define OV5648_EXPOSURE_MAX_50_H_REG		0x3a14
> > +#define OV5648_EXPOSURE_MAX_50_L_REG		0x3a15
> > +#define OV5648_GAIN_BASE_NIGHT_REG		0x3a17
> > +#define OV5648_AEC_GAIN_CEILING_H_REG		0x3a18
> > +#define OV5648_AEC_GAIN_CEILING_L_REG		0x3a19
> > +#define OV5648_DIFF_MAX_REG			0x3a1a
> > +#define OV5648_WPT2_REG				0x3a1b
> > +#define OV5648_LED_ADD_ROW_H_REG		0x3a1c
> > +#define OV5648_LED_ADD_ROW_L_REG		0x3a1d
> > +#define OV5648_BPT2_REG				0x3a1e
> > +#define OV5648_VPT_LOW_REG			0x3a1f
> > +#define OV5648_AEC_CTRL20_REG			0x3a20
> > +#define OV5648_AEC_CTRL21_REG			0x3a21
> > +
> > +#define OV5648_AVG_START_X_H_REG		0x5680
> > +#define OV5648_AVG_START_X_L_REG		0x5681
> > +#define OV5648_AVG_START_Y_H_REG		0x5682
> > +#define OV5648_AVG_START_Y_L_REG		0x5683
> > +#define OV5648_AVG_WINDOW_X_H_REG		0x5684
> > +#define OV5648_AVG_WINDOW_X_L_REG		0x5685
> > +#define OV5648_AVG_WINDOW_Y_H_REG		0x5686
> > +#define OV5648_AVG_WINDOW_Y_L_REG		0x5687
> > +#define OV5648_AVG_WEIGHT00_REG			0x5688
> > +#define OV5648_AVG_WEIGHT01_REG			0x5689
> > +#define OV5648_AVG_WEIGHT02_REG			0x568a
> > +#define OV5648_AVG_WEIGHT03_REG			0x568b
> > +#define OV5648_AVG_WEIGHT04_REG			0x568c
> > +#define OV5648_AVG_WEIGHT05_REG			0x568d
> > +#define OV5648_AVG_WEIGHT06_REG			0x568e
> > +#define OV5648_AVG_WEIGHT07_REG			0x568f
> > +#define OV5648_AVG_CTRL10_REG			0x5690
> > +#define OV5648_AVG_WEIGHT_SUM_REG		0x5691
> > +#define OV5648_AVG_READOUT_REG			0x5693
> > +
> > +#define OV5648_DIG_CTRL0_REG			0x5a00
> > +#define OV5648_DIG_COMP_MAN_H_REG		0x5a02
> > +#define OV5648_DIG_COMP_MAN_L_REG		0x5a03
> > +
> > +#define OV5648_GAINC_MAN_H_REG			0x5a20
> > +#define OV5648_GAINC_MAN_L_REG			0x5a21
> > +#define OV5648_GAINC_DGC_MAN_H_REG		0x5a22
> > +#define OV5648_GAINC_DGC_MAN_L_REG		0x5a23
> > +#define OV5648_GAINC_CTRL0_REG			0x5a24
> > +
> > +#define OV5648_GAINF_ANA_NUM_REG		0x5a40
> > +#define OV5648_GAINF_DIG_GAIN_REG		0x5a41
> > +
> > +/* Timing */
> > +
> > +#define OV5648_CROP_START_X_H_REG		0x3800
> > +#define OV5648_CROP_START_X_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_CROP_START_X_L_REG		0x3801
> > +#define OV5648_CROP_START_X_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_CROP_START_Y_H_REG		0x3802
> > +#define OV5648_CROP_START_Y_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_CROP_START_Y_L_REG		0x3803
> > +#define OV5648_CROP_START_Y_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_CROP_END_X_H_REG			0x3804
> > +#define OV5648_CROP_END_X_H(v)			(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_CROP_END_X_L_REG			0x3805
> > +#define OV5648_CROP_END_X_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_CROP_END_Y_H_REG			0x3806
> > +#define OV5648_CROP_END_Y_H(v)			(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_CROP_END_Y_L_REG			0x3807
> > +#define OV5648_CROP_END_Y_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_OUTPUT_SIZE_X_H_REG		0x3808
> > +#define OV5648_OUTPUT_SIZE_X_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_OUTPUT_SIZE_X_L_REG		0x3809
> > +#define OV5648_OUTPUT_SIZE_X_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_OUTPUT_SIZE_Y_H_REG		0x380a
> > +#define OV5648_OUTPUT_SIZE_Y_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_OUTPUT_SIZE_Y_L_REG		0x380b
> > +#define OV5648_OUTPUT_SIZE_Y_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_HTS_H_REG			0x380c
> > +#define OV5648_HTS_H(v)				(((v) & GENMASK(12, 8)) >> 8)
> > +#define OV5648_HTS_L_REG			0x380d
> > +#define OV5648_HTS_L(v)				((v) & GENMASK(7, 0))
> > +#define OV5648_VTS_H_REG			0x380e
> > +#define OV5648_VTS_H(v)				(((v) & GENMASK(15, 8)) >> 8)
> > +#define OV5648_VTS_L_REG			0x380f
> > +#define OV5648_VTS_L(v)				((v) & GENMASK(7, 0))
> > +#define OV5648_OFFSET_X_H_REG			0x3810
> > +#define OV5648_OFFSET_X_H(v)			(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_OFFSET_X_L_REG			0x3811
> > +#define OV5648_OFFSET_X_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_OFFSET_Y_H_REG			0x3812
> > +#define OV5648_OFFSET_Y_H(v)			(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_OFFSET_Y_L_REG			0x3813
> > +#define OV5648_OFFSET_Y_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_SUB_INC_X_REG			0x3814
> > +#define OV5648_SUB_INC_X_ODD(v)			(((v) << 4) & GENMASK(7, 4))
> > +#define OV5648_SUB_INC_X_EVEN(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_SUB_INC_Y_REG			0x3815
> > +#define OV5648_SUB_INC_Y_ODD(v)			(((v) << 4) & GENMASK(7, 4))
> > +#define OV5648_SUB_INC_Y_EVEN(v)		((v) & GENMASK(3, 0))
> > +#define OV5648_HSYNCST_H_REG			0x3816
> > +#define OV5648_HSYNCST_H(v)			(((v) >> 8) & 0xf)
> > +#define OV5648_HSYNCST_L_REG			0x3817
> > +#define OV5648_HSYNCST_L(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_HSYNCW_H_REG			0x3818
> > +#define OV5648_HSYNCW_H(v)			(((v) >> 8) & 0xf)
> > +#define OV5648_HSYNCW_L_REG			0x3819
> > +#define OV5648_HSYNCW_L(v)			((v) & GENMASK(7, 0))
> > +
> > +#define OV5648_TC20_REG				0x3820
> > +#define OV5648_TC20_DEBUG			BIT(6)
> > +#define OV5648_TC20_FLIP_VERT_ISP_EN		BIT(2)
> > +#define OV5648_TC20_FLIP_VERT_SENSOR_EN		BIT(1)
> > +#define OV5648_TC20_BINNING_VERT_EN		BIT(0)
> > +#define OV5648_TC21_REG				0x3821
> > +#define OV5648_TC21_FLIP_HORZ_ISP_EN		BIT(2)
> > +#define OV5648_TC21_FLIP_HORZ_SENSOR_EN		BIT(1)
> > +#define OV5648_TC21_BINNING_HORZ_EN		BIT(0)
> > +
> > +/* Strobe/exposure */
> > +
> > +#define OV5648_STROBE_REG			0x3b00
> > +#define OV5648_FREX_EXP_HH_REG			0x3b01
> > +#define OV5648_SHUTTER_DLY_H_REG		0x3b02
> > +#define OV5648_SHUTTER_DLY_L_REG		0x3b03
> > +#define OV5648_FREX_EXP_H_REG			0x3b04
> > +#define OV5648_FREX_EXP_L_REG			0x3b05
> > +#define OV5648_FREX_CTRL_REG			0x3b06
> > +#define OV5648_FREX_MODE_SEL_REG		0x3b07
> > +#define OV5648_FREX_MODE_SEL_FREX_SA1		BIT(4)
> > +#define OV5648_FREX_MODE_SEL_FX1_FM_EN		BIT(3)
> > +#define OV5648_FREX_MODE_SEL_FREX_INV		BIT(2)
> > +#define OV5648_FREX_MODE_SEL_MODE1		0x0
> > +#define OV5648_FREX_MODE_SEL_MODE2		0x1
> > +#define OV5648_FREX_MODE_SEL_ROLLING		0x2
> > +#define OV5648_FREX_EXP_REQ_REG			0x3b08
> > +#define OV5648_FREX_SHUTTER_DLY_REG		0x3b09
> > +#define OV5648_FREX_RST_LEN_REG			0x3b0a
> > +#define OV5648_STROBE_WIDTH_HH_REG		0x3b0b
> > +#define OV5648_STROBE_WIDTH_H_REG		0x3b0c
> > +
> > +/* OTP */
> > +
> > +#define OV5648_OTP_DATA_REG_BASE		0x3d00
> > +#define OV5648_OTP_PROGRAM_CTRL_REG		0x3d80
> > +#define OV5648_OTP_LOAD_CTRL_REG		0x3d81
> > +
> > +/* PSRAM */
> > +
> > +#define OV5648_PSRAM_CTRL1_REG			0x3f01
> > +#define OV5648_PSRAM_CTRLF_REG			0x3f0f
> > +
> > +/* Black Level */
> > +
> > +#define OV5648_BLC_CTRL0_REG			0x4000
> > +#define OV5648_BLC_CTRL1_REG			0x4001
> > +#define OV5648_BLC_CTRL1_START_LINE(v)		((v) & GENMASK(5, 0))
> > +#define OV5648_BLC_CTRL2_REG			0x4002
> > +#define OV5648_BLC_CTRL2_AUTO_EN		BIT(6)
> > +#define OV5648_BLC_CTRL2_RESET_FRAME_NUM(v)	((v) & GENMASK(5, 0))
> > +#define OV5648_BLC_CTRL3_REG			0x4003
> > +#define OV5648_BLC_LINE_NUM_REG			0x4004
> > +#define OV5648_BLC_LINE_NUM(v)			((v) & GENMASK(7, 0))
> > +#define OV5648_BLC_CTRL5_REG			0x4005
> > +#define OV5648_BLC_CTRL5_UPDATE_EN		BIT(1)
> > +#define OV5648_BLC_LEVEL_REG			0x4009
> > +
> > +/* Frame */
> > +
> > +#define OV5648_FRAME_CTRL_REG			0x4200
> > +#define OV5648_FRAME_ON_NUM_REG			0x4201
> > +#define OV5648_FRAME_OFF_NUM_REG		0x4202
> > +
> > +/* MIPI CSI-2 */
> > +
> > +#define OV5648_MIPI_CTRL0_REG			0x4800
> > +#define OV5648_MIPI_CTRL0_CLK_LANE_AUTOGATE	BIT(5)
> > +#define OV5648_MIPI_CTRL0_LANE_SYNC_EN		BIT(4)
> > +#define OV5648_MIPI_CTRL0_LANE_SELECT_LANE1	0
> > +#define OV5648_MIPI_CTRL0_LANE_SELECT_LANE2	BIT(3)
> > +#define OV5648_MIPI_CTRL0_IDLE_LP00		0
> > +#define OV5648_MIPI_CTRL0_IDLE_LP11		BIT(2)
> > +
> > +#define OV5648_MIPI_CTRL1_REG			0x4801
> > +#define OV5648_MIPI_CTRL2_REG			0x4802
> > +#define OV5648_MIPI_CTRL3_REG			0x4803
> > +#define OV5648_MIPI_CTRL4_REG			0x4804
> > +#define OV5648_MIPI_CTRL5_REG			0x4805
> > +#define OV5648_MIPI_MAX_FRAME_COUNT_H_REG	0x4810
> > +#define OV5648_MIPI_MAX_FRAME_COUNT_L_REG	0x4811
> > +#define OV5648_MIPI_CTRL14_REG			0x4814
> > +#define OV5648_MIPI_DT_SPKT_REG			0x4815
> > +#define OV5648_MIPI_HS_ZERO_MIN_H_REG		0x4818
> > +#define OV5648_MIPI_HS_ZERO_MIN_L_REG		0x4819
> > +#define OV5648_MIPI_HS_TRAIN_MIN_H_REG		0x481a
> > +#define OV5648_MIPI_HS_TRAIN_MIN_L_REG		0x481b
> > +#define OV5648_MIPI_CLK_ZERO_MIN_H_REG		0x481c
> > +#define OV5648_MIPI_CLK_ZERO_MIN_L_REG		0x481d
> > +#define OV5648_MIPI_CLK_PREPARE_MIN_H_REG	0x481e
> > +#define OV5648_MIPI_CLK_PREPARE_MIN_L_REG	0x481f
> > +#define OV5648_MIPI_CLK_POST_MIN_H_REG		0x4820
> > +#define OV5648_MIPI_CLK_POST_MIN_L_REG		0x4821
> > +#define OV5648_MIPI_CLK_TRAIL_MIN_H_REG		0x4822
> > +#define OV5648_MIPI_CLK_TRAIL_MIN_L_REG		0x4823
> > +#define OV5648_MIPI_LPX_P_MIN_H_REG		0x4824
> > +#define OV5648_MIPI_LPX_P_MIN_L_REG		0x4825
> > +#define OV5648_MIPI_HS_PREPARE_MIN_H_REG	0x4826
> > +#define OV5648_MIPI_HS_PREPARE_MIN_L_REG	0x4827
> > +#define OV5648_MIPI_HS_EXIT_MIN_H_REG		0x4828
> > +#define OV5648_MIPI_HS_EXIT_MIN_L_REG		0x4829
> > +#define OV5648_MIPI_HS_ZERO_MIN_UI_REG		0x482a
> > +#define OV5648_MIPI_HS_TRAIL_MIN_UI_REG		0x482b
> > +#define OV5648_MIPI_CLK_ZERO_MIN_UI_REG		0x482c
> > +#define OV5648_MIPI_CLK_PREPARE_MIN_UI_REG	0x482d
> > +#define OV5648_MIPI_CLK_POST_MIN_UI_REG		0x482e
> > +#define OV5648_MIPI_CLK_TRAIL_MIN_UI_REG	0x482f
> > +#define OV5648_MIPI_LPX_P_MIN_UI_REG		0x4830
> > +#define OV5648_MIPI_HS_PREPARE_MIN_UI_REG	0x4831
> > +#define OV5648_MIPI_HS_EXIT_MIN_UI_REG		0x4832
> > +#define OV5648_MIPI_REG_MIN_H_REG		0x4833
> > +#define OV5648_MIPI_REG_MIN_L_REG		0x4834
> > +#define OV5648_MIPI_REG_MAX_H_REG		0x4835
> > +#define OV5648_MIPI_REG_MAX_L_REG		0x4836
> > +#define OV5648_MIPI_PCLK_PERIOD_REG		0x4837
> > +#define OV5648_MIPI_WKUP_DLY_REG		0x4838
> > +#define OV5648_MIPI_LP_GPIO_REG			0x483b
> > +#define OV5648_MIPI_SNR_PCLK_DIV_REG		0x4843
> > +
> > +/* ISP */
> > +
> > +#define OV5648_ISP_CTRL0_REG			0x5000
> > +#define OV5648_ISP_CTRL0_BLACK_CORRECT_EN	BIT(2)
> > +#define OV5648_ISP_CTRL0_WHITE_CORRECT_EN	BIT(1)
> > +#define OV5648_ISP_CTRL1_REG			0x5001
> > +#define OV5648_ISP_CTRL1_AWB_EN			BIT(0)
> > +#define OV5648_ISP_CTRL2_REG			0x5002
> > +#define OV5648_ISP_CTRL2_WIN_EN			BIT(6)
> > +#define OV5648_ISP_CTRL2_OTP_EN			BIT(1)
> > +#define OV5648_ISP_CTRL2_AWB_GAIN_EN		BIT(0)
> > +#define OV5648_ISP_CTRL3_REG			0x5003
> > +#define OV5648_ISP_CTRL3_BUF_EN			BIT(3)
> > +#define OV5648_ISP_CTRL3_BIN_MAN_SET		BIT(2)
> > +#define OV5648_ISP_CTRL3_BIN_AUTO_EN		BIT(1)
> > +#define OV5648_ISP_CTRL4_REG			0x5004
> > +#define OV5648_ISP_CTRL5_REG			0x5005
> > +#define OV5648_ISP_CTRL6_REG			0x5006
> > +#define OV5648_ISP_CTRL7_REG			0x5007
> > +#define OV5648_ISP_MAN_OFFSET_X_H_REG		0x5008
> > +#define OV5648_ISP_MAN_OFFSET_X_L_REG		0x5009
> > +#define OV5648_ISP_MAN_OFFSET_Y_H_REG		0x500a
> > +#define OV5648_ISP_MAN_OFFSET_Y_L_REG		0x500b
> > +#define OV5648_ISP_MAN_WIN_OFFSET_X_H_REG	0x500c
> > +#define OV5648_ISP_MAN_WIN_OFFSET_X_L_REG	0x500d
> > +#define OV5648_ISP_MAN_WIN_OFFSET_Y_H_REG	0x500e
> > +#define OV5648_ISP_MAN_WIN_OFFSET_Y_L_REG	0x500f
> > +#define OV5648_ISP_MAN_WIN_OUTPUT_X_H_REG	0x5010
> > +#define OV5648_ISP_MAN_WIN_OUTPUT_X_L_REG	0x5011
> > +#define OV5648_ISP_MAN_WIN_OUTPUT_Y_H_REG	0x5012
> > +#define OV5648_ISP_MAN_WIN_OUTPUT_Y_L_REG	0x5013
> > +#define OV5648_ISP_MAN_INPUT_X_H_REG		0x5014
> > +#define OV5648_ISP_MAN_INPUT_X_L_REG		0x5015
> > +#define OV5648_ISP_MAN_INPUT_Y_H_REG		0x5016
> > +#define OV5648_ISP_MAN_INPUT_Y_L_REG		0x5017
> > +#define OV5648_ISP_CTRL18_REG			0x5018
> > +#define OV5648_ISP_CTRL19_REG			0x5019
> > +#define OV5648_ISP_CTRL1A_REG			0x501a
> > +#define OV5648_ISP_CTRL1D_REG			0x501d
> > +#define OV5648_ISP_CTRL1F_REG			0x501f
> > +#define OV5648_ISP_CTRL1F_OUTPUT_EN		3
> > +#define OV5648_ISP_CTRL25_REG			0x5025
> > +
> > +#define OV5648_ISP_CTRL3D_REG			0x503d
> > +#define OV5648_ISP_CTRL3D_PATTERN_EN		BIT(7)
> > +#define OV5648_ISP_CTRL3D_ROLLING_BAR_EN	BIT(6)
> > +#define OV5648_ISP_CTRL3D_TRANSPARENT_MODE	BIT(5)
> > +#define OV5648_ISP_CTRL3D_SQUARES_BW_MODE	BIT(4)
> > +#define OV5648_ISP_CTRL3D_PATTERN_COLOR_BARS	0
> > +#define OV5648_ISP_CTRL3D_PATTERN_RANDOM_DATA	1
> > +#define OV5648_ISP_CTRL3D_PATTERN_COLOR_SQUARES	2
> > +#define OV5648_ISP_CTRL3D_PATTERN_INPUT		3
> > +
> > +#define OV5648_ISP_CTRL3E_REG			0x503e
> > +#define OV5648_ISP_CTRL4B_REG			0x504b
> > +#define OV5648_ISP_CTRL4B_POST_BIN_H_EN		BIT(5)
> > +#define OV5648_ISP_CTRL4B_POST_BIN_V_EN		BIT(4)
> > +#define OV5648_ISP_CTRL4C_REG			0x504c
> > +#define OV5648_ISP_CTRL57_REG			0x5057
> > +#define OV5648_ISP_CTRL58_REG			0x5058
> > +#define OV5648_ISP_CTRL59_REG			0x5059
> > +
> > +#define OV5648_ISP_WINDOW_START_X_H_REG		0x5980
> > +#define OV5648_ISP_WINDOW_START_X_L_REG		0x5981
> > +#define OV5648_ISP_WINDOW_START_Y_H_REG		0x5982
> > +#define OV5648_ISP_WINDOW_START_Y_L_REG		0x5983
> > +#define OV5648_ISP_WINDOW_WIN_X_H_REG		0x5984
> > +#define OV5648_ISP_WINDOW_WIN_X_L_REG		0x5985
> > +#define OV5648_ISP_WINDOW_WIN_Y_H_REG		0x5986
> > +#define OV5648_ISP_WINDOW_WIN_Y_L_REG		0x5987
> > +#define OV5648_ISP_WINDOW_MAN_REG		0x5988
> > +
> > +/* White Balance */
> > +
> > +#define OV5648_AWB_CTRL_REG			0x5180
> > +#define OV5648_AWB_CTRL_FAST_AWB		BIT(6)
> > +#define OV5648_AWB_CTRL_GAIN_FREEZE_EN		BIT(5)
> > +#define OV5648_AWB_CTRL_SUM_FREEZE_EN		BIT(4)
> > +#define OV5648_AWB_CTRL_GAIN_MANUAL_EN		BIT(3)
> > +
> > +#define OV5648_AWB_DELTA_REG			0x5181
> > +#define OV5648_AWB_STABLE_RANGE_REG		0x5182
> > +#define OV5648_AWB_STABLE_RANGE_WIDE_REG	0x5183
> > +#define OV5648_HSIZE_MAN_REG			0x5185
> > +
> > +#define OV5648_GAIN_RED_MAN_H_REG		0x5186
> > +#define OV5648_GAIN_RED_MAN_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_GAIN_RED_MAN_L_REG		0x5187
> > +#define OV5648_GAIN_RED_MAN_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_GAIN_GREEN_MAN_H_REG		0x5188
> > +#define OV5648_GAIN_GREEN_MAN_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_GAIN_GREEN_MAN_L_REG		0x5189
> > +#define OV5648_GAIN_GREEN_MAN_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_GAIN_BLUE_MAN_H_REG		0x518a
> > +#define OV5648_GAIN_BLUE_MAN_H(v)		(((v) & GENMASK(11, 8)) >> 8)
> > +#define OV5648_GAIN_BLUE_MAN_L_REG		0x518b
> > +#define OV5648_GAIN_BLUE_MAN_L(v)		((v) & GENMASK(7, 0))
> > +#define OV5648_GAIN_RED_LIMIT_REG		0x518c
> > +#define OV5648_GAIN_GREEN_LIMIT_REG		0x518d
> > +#define OV5648_GAIN_BLUE_LIMIT_REG		0x518e
> > +#define OV5648_AWB_FRAME_COUNT_REG		0x518f
> > +#define OV5648_AWB_BASE_MAN_REG			0x51df
> > +
> > +/* Macros */
> > +
> > +#define ov5648_subdev_sensor(subdev) \
> > +	container_of(subdev, struct ov5648_sensor, subdev)
>=20
> Please call the macro argument differently than the struct member. Now the
> argument may be only called "subdev".
>=20
> > +
> > +#define ov5648_ctrl_subdev(ctrl) \
> > +	(&container_of(ctrl->handler, struct ov5648_sensor, ctrls.handler)->s=
ubdev)
> > +
> > +/* Data structures */
> > +
> > +struct ov5648_register_value {
> > +	u16 address;
> > +	u8 value;
> > +	unsigned int delay_ms;
> > +};
> > +
> > +/*
> > + * PLL1 Clock Tree:
> > + *
> > + * +-< XVCLK
> > + * |
> > + * +-+ pll_pre_div (0x3037 [3:0], special values: 5: 1.5, 7: 2.5)
> > + *   |
> > + *   +-+ pll_mul (0x3036 [7:0])
> > + *     |
> > + *     +-+ sys_div (0x3035 [7:4])
> > + *       |
> > + *       +-+ mipi_div (0x3035 [3:0])
> > + *       | |
> > + *       | +-> MIPI_SCLK
> > + *       | |
> > + *       | +-+ mipi_phy_div (2)
> > + *       |   |
> > + *       |   +-> MIPI_CLK
> > + *       |
> > + *       +-+ root_div (0x3037 [4])
> > + *         |
> > + *         +-+ bit_div (0x3034 [3:0], 8 bits: 2, 10 bits: 2.5, other: =
1)
> > + *           |
> > + *           +-+ sclk_div (0x3106 [3:2])
> > + *             |
> > + *             +-> SCLK
> > + *             |
> > + *             +-+ mipi_div (0x3035, 1: PCLK =3D SCLK)
> > + *               |
> > + *               +-> PCLK
> > + */
> > +
> > +struct ov5648_pll1_config {
> > +	unsigned int pll_pre_div;
> > +	unsigned int pll_mul;
> > +	unsigned int sys_div;
> > +	unsigned int root_div;
> > +	unsigned int sclk_div;
> > +	unsigned int mipi_div;
> > +};
> > +
> > +/*
> > + * PLL2 Clock Tree:
> > + *
> > + * +-< XVCLK
> > + * |
> > + * +-+ plls_pre_div (0x303d [5:4], special values: 0: 1, 1: 1.5)
> > + *   |
> > + *   +-+ plls_div_r (0x303d [2])
> > + *     |
> > + *     +-+ plls_mul (0x303b [4:0])
> > + *       |
> > + *       +-+ sys_div (0x303c [3:0])
> > + *         |
> > + *         +-+ sel_div (0x303d [1:0], special values: 0: 1, 3: 2.5)
> > + *           |
> > + *           +-> ADCLK
> > + */
> > +
> > +struct ov5648_pll2_config {
> > +	unsigned int plls_pre_div;
> > +	unsigned int plls_div_r;
> > +	unsigned int plls_mul;
> > +	unsigned int sys_div;
> > +	unsigned int sel_div;
> > +};
> > +
> > +/*
> > + * General formulas for (array-centered) mode calculation:
> > + * - photo_array_width =3D 2624
> > + * - crop_start_x =3D (photo_array_width - output_size_x) / 2
> > + * - crop_end_x =3D crop_start_x + offset_x + output_size_x - 1
> > + *
> > + * - photo_array_height =3D 1956
> > + * - crop_start_y =3D (photo_array_height - output_size_y) / 2
> > + * - crop_end_y =3D crop_start_y + offset_y + output_size_y - 1
> > + */
> > +
> > +struct ov5648_mode {
> > +	unsigned int crop_start_x;
> > +	unsigned int offset_x;
> > +	unsigned int output_size_x;
> > +	unsigned int crop_end_x;
> > +	unsigned int hts;
> > +
> > +	unsigned int crop_start_y;
> > +	unsigned int offset_y;
> > +	unsigned int output_size_y;
> > +	unsigned int crop_end_y;
> > +	unsigned int vts;
> > +
> > +	bool binning_x;
> > +	bool binning_y;
> > +
> > +	unsigned int inc_x_odd;
> > +	unsigned int inc_x_even;
> > +	unsigned int inc_y_odd;
> > +	unsigned int inc_y_even;
> > +
> > +	/* 8-bit frame interval followed by 10-bit frame interval. */
> > +	struct v4l2_fract frame_interval[2];
> > +
> > +	/* 8-bit config followed by 10-bit config. */
> > +	const struct ov5648_pll1_config *pll1_config[2];
> > +	const struct ov5648_pll2_config *pll2_config;
> > +
> > +	const struct ov5648_register_value *register_values;
> > +	unsigned int register_values_count;
> > +};
> > +
> > +struct ov5648_state {
> > +	const struct ov5648_mode *mode;
> > +	u32 mbus_code;
> > +
> > +	bool streaming;
> > +};
> > +
> > +struct ov5648_ctrls {
> > +	struct v4l2_ctrl *exposure_auto;
> > +	struct v4l2_ctrl *exposure;
> > +
> > +	struct v4l2_ctrl *gain_auto;
> > +	struct v4l2_ctrl *gain;
> > +
> > +	struct v4l2_ctrl *white_balance_auto;
> > +	struct v4l2_ctrl *red_balance;
> > +	struct v4l2_ctrl *blue_balance;
> > +
> > +	struct v4l2_ctrl *link_freq;
> > +	struct v4l2_ctrl *pixel_rate;
> > +
> > +	struct v4l2_ctrl_handler handler;
> > +} __packed;
> > +
> > +struct ov5648_sensor {
> > +	struct device *dev;
> > +	struct i2c_client *i2c_client;
> > +	struct gpio_desc *reset;
> > +	struct gpio_desc *powerdown;
> > +	struct regulator *avdd;
> > +	struct regulator *dvdd;
> > +	struct regulator *dovdd;
> > +	struct clk *xvclk;
> > +
> > +	struct v4l2_fwnode_endpoint endpoint;
> > +	struct v4l2_subdev subdev;
> > +	struct media_pad pad;
> > +
> > +	struct mutex mutex;
> > +
> > +	struct ov5648_state state;
> > +	struct ov5648_ctrls ctrls;
> > +};
> > +
> > +/* Static definitions */
> > +
> > +/*
> > + * XVCLK =3D 24 MHz
> > + * SCLK  =3D 84 MHz
> > + * PCLK  =3D 84 MHz
> > + */
> > +static const struct ov5648_pll1_config ov5648_pll1_config_native_8_bit=
s =3D {
> > +	.pll_pre_div	=3D 3,
> > +	.pll_mul	=3D 84,
> > +	.sys_div	=3D 2,
> > +	.root_div	=3D 1,
> > +	.sclk_div	=3D 1,
> > +	.mipi_div	=3D 1,
> > +};
> > +
> > +/*
> > + * XVCLK =3D 24 MHz
> > + * SCLK  =3D 84 MHz
> > + * PCLK  =3D 84 MHz
> > + */
> > +static const struct ov5648_pll1_config ov5648_pll1_config_native_10_bi=
ts =3D {
> > +	.pll_pre_div	=3D 3,
> > +	.pll_mul	=3D 105,
> > +	.sys_div	=3D 2,
> > +	.root_div	=3D 1,
> > +	.sclk_div	=3D 1,
> > +	.mipi_div	=3D 1,
> > +};
> > +
> > +/*
> > + * XVCLK =3D 24 MHz
> > + * ADCLK =3D 200 MHz
> > + */
> > +static const struct ov5648_pll2_config ov5648_pll2_config_native =3D {
> > +	.plls_pre_div	=3D 3,
> > +	.plls_div_r	=3D 1,
> > +	.plls_mul	=3D 25,
> > +	.sys_div	=3D 1,
> > +	.sel_div	=3D 1,
> > +};
> > +
> > +static const struct ov5648_mode ov5648_modes[] =3D {
> > +	/* 2592x1944 */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 16,
> > +		.offset_x	=3D 0,
> > +		.output_size_x	=3D 2592,
> > +		.crop_end_x	=3D 2607,
> > +		.hts		=3D 2816,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 6,
> > +		.offset_y	=3D 0,
> > +		.output_size_y	=3D 1944,
> > +		.crop_end_y	=3D 1949,
> > +		.vts		=3D 1984,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 1,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 1,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	15 },
> > +			{ 1,	15 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +	/* 1600x1200 (UXGA) */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 512,
> > +		.offset_x	=3D 0,
> > +		.output_size_x	=3D 1600,
> > +		.crop_end_x	=3D 2111,
> > +		.hts		=3D 2816,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 378,
> > +		.offset_y	=3D 0,
> > +		.output_size_y	=3D 1200,
> > +		.crop_end_y	=3D 1577,
> > +		.vts		=3D 1984,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 1,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 1,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	15 },
> > +			{ 1,	15 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +	/* 1920x1080 (Full HD) */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 352,
> > +		.offset_x	=3D 0,
> > +		.output_size_x	=3D 1920,
> > +		.crop_end_x	=3D 2271,
> > +		.hts		=3D 2816,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 438,
> > +		.offset_y	=3D 0,
> > +		.output_size_y	=3D 1080,
> > +		.crop_end_y	=3D 1517,
> > +		.vts		=3D 1984,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 1,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 1,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	15 },
> > +			{ 1,	15 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +	/* 1280x960 */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 16,
> > +		.offset_x	=3D 8,
> > +		.output_size_x	=3D 1280,
> > +		.crop_end_x	=3D 2607,
> > +		.hts		=3D 1912,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 6,
> > +		.offset_y	=3D 6,
> > +		.output_size_y	=3D 960,
> > +		.crop_end_y	=3D 1949,
> > +		.vts		=3D 1496,
> > +
> > +		/* Binning */
> > +		.binning_x	=3D true,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 3,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 3,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	30 },
> > +			{ 1,	30 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +	/* 1280x720 (HD) */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 16,
> > +		.offset_x	=3D 8,
> > +		.output_size_x	=3D 1280,
> > +		.crop_end_x	=3D 2607,
> > +		.hts		=3D 1912,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 254,
> > +		.offset_y	=3D 2,
> > +		.output_size_y	=3D 720,
> > +		.crop_end_y	=3D 1701,
> > +		.vts		=3D 1496,
> > +
> > +		/* Binning */
> > +		.binning_x	=3D true,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 3,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 3,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	30 },
> > +			{ 1,	30 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +	/* 640x480 (VGA) */
> > +	{
> > +		/* Horizontal */
> > +		.crop_start_x	=3D 0,
> > +		.offset_x	=3D 8,
> > +		.output_size_x	=3D 640,
> > +		.crop_end_x	=3D 2623,
> > +		.hts		=3D 1896,
> > +
> > +		/* Vertical */
> > +		.crop_start_y	=3D 0,
> > +		.offset_y	=3D 2,
> > +		.output_size_y	=3D 480,
> > +		.crop_end_y	=3D 1953,
> > +		.vts		=3D 984,
> > +
> > +		/* Binning */
> > +		.binning_x	=3D true,
> > +
> > +		/* Subsample increase */
> > +		.inc_x_odd	=3D 7,
> > +		.inc_x_even	=3D 1,
> > +		.inc_y_odd	=3D 7,
> > +		.inc_y_even	=3D 1,
> > +
> > +		/* Frame Interval */
> > +		.frame_interval	=3D {
> > +			{ 1,	30 },
> > +			{ 1,	30 },
> > +		},
> > +
> > +		/* PLL */
> > +		.pll1_config	=3D {
> > +			&ov5648_pll1_config_native_8_bits,
> > +			&ov5648_pll1_config_native_10_bits,
> > +		},
> > +		.pll2_config	=3D &ov5648_pll2_config_native,
> > +	},
> > +};
> > +
> > +static const u32 ov5648_mbus_codes[] =3D {
> > +	MEDIA_BUS_FMT_SBGGR8_1X8,
> > +	MEDIA_BUS_FMT_SBGGR10_1X10,
> > +};
> > +
> > +static const struct ov5648_register_value ov5648_init_sequence[] =3D {
> > +	/* PSRAM */
> > +	{ OV5648_PSRAM_CTRL1_REG, 0x0d },
> > +	{ OV5648_PSRAM_CTRLF_REG, 0xf5 },
> > +};
> > +
> > +static const s64 ov5648_link_freq_menu[] =3D {
> > +	210000000,
> > +	168000000,
> > +};
> > +
> > +static const char *const ov5648_test_pattern_menu[] =3D {
> > +	"Disabled",
> > +	"Random data",
> > +	"Color bars",
> > +	"Color bars with rolling bar",
> > +	"Color squares",
> > +	"Color squares with rolling bar"
> > +};
> > +
> > +static const u8 ov5648_test_pattern_bits[] =3D {
> > +	0,
> > +	OV5648_ISP_CTRL3D_PATTERN_EN | OV5648_ISP_CTRL3D_PATTERN_RANDOM_DATA,
> > +	OV5648_ISP_CTRL3D_PATTERN_EN | OV5648_ISP_CTRL3D_PATTERN_COLOR_BARS,
> > +	OV5648_ISP_CTRL3D_PATTERN_EN | OV5648_ISP_CTRL3D_ROLLING_BAR_EN |
> > +	OV5648_ISP_CTRL3D_PATTERN_COLOR_BARS,
> > +	OV5648_ISP_CTRL3D_PATTERN_EN | OV5648_ISP_CTRL3D_PATTERN_COLOR_SQUARE=
S,
> > +	OV5648_ISP_CTRL3D_PATTERN_EN | OV5648_ISP_CTRL3D_ROLLING_BAR_EN |
> > +	OV5648_ISP_CTRL3D_PATTERN_COLOR_SQUARES,
> > +};
> > +
> > +/* Input/Output */
> > +
> > +static int ov5648_read(struct ov5648_sensor *sensor, u16 address, u8 *=
value)
> > +{
> > +	unsigned char data[2] =3D { address >> 8, address & 0xff };
> > +	struct i2c_client *client =3D sensor->i2c_client;
> > +	int ret;
> > +
> > +	ret =3D i2c_master_send(client, data, sizeof(data));
> > +	if (ret < 0) {
> > +		dev_dbg(&client->dev, "i2c send error at address %#04x\n",
> > +			address);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D i2c_master_recv(client, value, 1);
> > +	if (ret < 0) {
> > +		dev_dbg(&client->dev, "i2c recv error at address %#04x\n",
> > +			address);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_write(struct ov5648_sensor *sensor, u16 address, u8 =
value)
> > +{
> > +	unsigned char data[3] =3D { address >> 8, address & 0xff, value };
> > +	struct i2c_client *client =3D sensor->i2c_client;
> > +	int ret;
> > +
> > +	ret =3D i2c_master_send(client, data, sizeof(data));
> > +	if (ret < 0) {
> > +		dev_dbg(&client->dev, "i2c send error at address %#04x\n",
> > +			address);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_write_sequence(struct ov5648_sensor *sensor,
> > +				 const struct ov5648_register_value *sequence,
> > +				 unsigned int sequence_count)
> > +{
> > +	unsigned int i;
> > +	int ret =3D 0;
> > +
> > +	for (i =3D 0; i < sequence_count; i++) {
> > +		ret =3D ov5648_write(sensor, sequence[i].address,
> > +				   sequence[i].value);
> > +		if (ret)
> > +			break;
> > +
> > +		if (sequence[i].delay_ms)
> > +			msleep(sequence[i].delay_ms);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_update_bits(struct ov5648_sensor *sensor, u16 addres=
s,
> > +			      u8 mask, u8 bits)
> > +{
> > +	u8 value =3D 0;
> > +	int ret;
> > +
> > +	ret =3D ov5648_read(sensor, address, &value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	value &=3D ~mask;
> > +	value |=3D bits;
> > +
> > +	ret =3D ov5648_write(sensor, address, value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +/* Sensor */
> > +
> > +static int ov5648_sw_reset(struct ov5648_sensor *sensor)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_SW_RESET_REG, OV5648_SW_RESET_RES=
ET);
>=20
> return ov5648_write(...);
>=20
> There seem to be a few others like that left.
>=20
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_sw_standby(struct ov5648_sensor *sensor, int standby)
> > +{
> > +	u8 value =3D 0;
> > +	int ret;
> > +
> > +	if (!standby)
> > +		value =3D OV5648_SW_STANDBY_STREAM_ON;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_SW_STANDBY_REG, value);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_chip_id_check(struct ov5648_sensor *sensor)
> > +{
> > +	u16 regs[] =3D { OV5648_CHIP_ID_H_REG, OV5648_CHIP_ID_L_REG };
> > +	u8 values[] =3D { OV5648_CHIP_ID_H_VALUE, OV5648_CHIP_ID_L_VALUE };
> > +	unsigned int i;
> > +	u8 value;
> > +	int ret;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(regs); i++) {
> > +		ret =3D ov5648_read(sensor, regs[i], &value);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if (value !=3D values[i]) {
> > +			dev_err(sensor->dev,
> > +				"chip id value mismatch: %#x instead of %#x\n",
> > +				value, values[i]);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_avdd_internal_power(struct ov5648_sensor *sensor, in=
t on)
> > +{
> > +	return ov5648_write(sensor, OV5648_A_PWC_PK_O0_REG,
> > +			    on ? 0 : OV5648_A_PWC_PK_O0_BP_REGULATOR_N);
> > +}
> > +
> > +static int ov5648_pad_configure(struct ov5648_sensor *sensor)
> > +{
> > +	int ret;
> > +
> > +	/* Configure pads as input. */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PAD_OEN1_REG, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PAD_OEN2_REG, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable FREX pin. */
> > +
> > +	return ov5648_write(sensor, OV5648_PAD_PK_REG,
> > +			    OV5648_PAD_PK_DRIVE_STRENGTH_1X |
> > +			    OV5648_PAD_PK_FREX_N);
> > +}
> > +
> > +static int ov5648_mipi_configure(struct ov5648_sensor *sensor)
> > +{
> > +	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =3D
> > +		&sensor->endpoint.bus.mipi_csi2;
> > +	unsigned int lanes_count =3D bus_mipi_csi2->num_data_lanes;
> > +	int ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_MIPI_CTRL0_REG,
> > +			   OV5648_MIPI_CTRL0_CLK_LANE_AUTOGATE |
> > +			   OV5648_MIPI_CTRL0_LANE_SELECT_LANE1 |
> > +			   OV5648_MIPI_CTRL0_IDLE_LP11);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_MIPI_SC_CTRL0_REG,
> > +			    OV5648_MIPI_SC_CTRL0_MIPI_LANES(lanes_count) |
> > +			    OV5648_MIPI_SC_CTRL0_PHY_LP_RX_PD |
> > +			    OV5648_MIPI_SC_CTRL0_MIPI_EN);
> > +}
> > +
> > +static int ov5648_black_level_configure(struct ov5648_sensor *sensor)
> > +{
> > +	int ret;
> > +
> > +	/* Up to 6 lines are available for black level calibration. */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_BLC_CTRL1_REG,
> > +			   OV5648_BLC_CTRL1_START_LINE(2));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_BLC_CTRL2_REG,
> > +			   OV5648_BLC_CTRL2_AUTO_EN |
> > +			   OV5648_BLC_CTRL2_RESET_FRAME_NUM(5));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_BLC_LINE_NUM_REG,
> > +			   OV5648_BLC_LINE_NUM(4));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_update_bits(sensor, OV5648_BLC_CTRL5_REG,
> > +				  OV5648_BLC_CTRL5_UPDATE_EN,
> > +				  OV5648_BLC_CTRL5_UPDATE_EN);
> > +}
> > +
> > +static int ov5648_isp_configure(struct ov5648_sensor *sensor)
> > +{
> > +	u8 bits;
> > +	int ret;
> > +
> > +	/* Enable black and white level correction. */
> > +	bits =3D OV5648_ISP_CTRL0_BLACK_CORRECT_EN |
> > +	       OV5648_ISP_CTRL0_WHITE_CORRECT_EN;
> > +
> > +	ret =3D ov5648_update_bits(sensor, OV5648_ISP_CTRL0_REG, bits, bits);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable AWB. */
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL1_REG,
> > +			   OV5648_ISP_CTRL1_AWB_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable AWB gain and windowing. */
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL2_REG,
> > +			   OV5648_ISP_CTRL2_WIN_EN |
> > +			   OV5648_ISP_CTRL2_AWB_GAIN_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable buffering and auto-binning. */
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL3_REG,
> > +			   OV5648_ISP_CTRL3_BUF_EN |
> > +			   OV5648_ISP_CTRL3_BIN_AUTO_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL4_REG, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL1F_REG,
> > +			   OV5648_ISP_CTRL1F_OUTPUT_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable post-binning filters. */
> > +	ret =3D ov5648_write(sensor, OV5648_ISP_CTRL4B_REG,
> > +			   OV5648_ISP_CTRL4B_POST_BIN_H_EN |
> > +			   OV5648_ISP_CTRL4B_POST_BIN_V_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable debanding and night mode. Debug bit seems necessary. */
> > +	ret =3D ov5648_write(sensor, OV5648_AEC_CTRL0_REG,
> > +			   OV5648_AEC_CTRL0_DEBUG |
> > +			   OV5648_AEC_CTRL0_START_SEL_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_MANUAL_CTRL_REG,
> > +			    OV5648_MANUAL_CTRL_FRAME_DELAY(1));
> > +}
> > +
> > +static unsigned long ov5648_mode_pll1_rate(struct ov5648_sensor *senso=
r,
> > +					   const struct ov5648_pll1_config *config)
> > +{
> > +	unsigned long xvclk_rate;
> > +	unsigned long pll1_rate;
> > +
> > +	xvclk_rate =3D clk_get_rate(sensor->xvclk);
> > +	pll1_rate =3D xvclk_rate * config->pll_mul;
> > +
> > +	switch (config->pll_pre_div) {
> > +	case 5:
> > +		pll1_rate *=3D 3;
> > +		pll1_rate /=3D 2;
> > +		break;
> > +	case 7:
> > +		pll1_rate *=3D 5;
> > +		pll1_rate /=3D 2;
> > +		break;
> > +	default:
> > +		pll1_rate /=3D config->pll_pre_div;
> > +		break;
> > +	}
> > +
> > +	return pll1_rate;
> > +}
> > +
> > +static int ov5648_mode_pll1_configure(struct ov5648_sensor *sensor,
> > +				      const struct ov5648_mode *mode,
> > +				      u32 mbus_code)
> > +{
> > +	const struct ov5648_pll1_config *config;
> > +	u8 value;
> > +	int ret;
> > +
> > +	value =3D OV5648_PLL_CTRL0_PLL_CHARGE_PUMP(1);
> > +
> > +	switch (mbus_code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		config =3D mode->pll1_config[0];
> > +		value |=3D OV5648_PLL_CTRL0_BITS(8);
> > +		break;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		config =3D mode->pll1_config[1];
> > +		value |=3D OV5648_PLL_CTRL0_BITS(10);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLL_CTRL0_REG, value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLL_DIV_REG,
> > +			   OV5648_PLL_DIV_ROOT_DIV(config->root_div) |
> > +			   OV5648_PLL_DIV_PLL_PRE_DIV(config->pll_pre_div));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLL_MUL_REG,
> > +			   OV5648_PLL_MUL(config->pll_mul));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLL_CTRL1_REG,
> > +			   OV5648_PLL_CTRL1_SYS_DIV(config->sys_div) |
> > +			   OV5648_PLL_CTRL1_MIPI_DIV(config->mipi_div));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_SRB_CTRL_REG,
> > +			    OV5648_SRB_CTRL_SCLK_DIV(config->sclk_div) |
> > +			    OV5648_SRB_CTRL_SCLK_ARBITER_EN);
> > +}
> > +
> > +static int ov5648_mode_pll2_configure(struct ov5648_sensor *sensor,
> > +				      const struct ov5648_mode *mode)
> > +{
> > +	const struct ov5648_pll2_config *config =3D mode->pll2_config;
> > +	int ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLLS_DIV_REG,
> > +			   OV5648_PLLS_DIV_PLLS_PRE_DIV(config->plls_pre_div) |
> > +			   OV5648_PLLS_DIV_PLLS_DIV_R(config->plls_div_r) |
> > +			   OV5648_PLLS_DIV_PLLS_SEL_DIV(config->sel_div));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_PLLS_MUL_REG,
> > +			   OV5648_PLLS_MUL(config->plls_mul));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_PLLS_CTRL_REG,
> > +			    OV5648_PLLS_CTRL_PLL_CHARGE_PUMP(1) |
> > +			    OV5648_PLLS_CTRL_SYS_DIV(config->sys_div));
> > +}
> > +
> > +static int ov5648_mode_configure(struct ov5648_sensor *sensor,
> > +				 const struct ov5648_mode *mode, u32 mbus_code)
> > +{
> > +	int ret;
> > +
> > +	/* Crop Start X */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_START_X_H_REG,
> > +			   OV5648_CROP_START_X_H(mode->crop_start_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_START_X_L_REG,
> > +			   OV5648_CROP_START_X_L(mode->crop_start_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Offset X */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OFFSET_X_H_REG,
> > +			   OV5648_OFFSET_X_H(mode->offset_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OFFSET_X_L_REG,
> > +			   OV5648_OFFSET_X_L(mode->offset_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Output Size X */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OUTPUT_SIZE_X_H_REG,
> > +			   OV5648_OUTPUT_SIZE_X_H(mode->output_size_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OUTPUT_SIZE_X_L_REG,
> > +			   OV5648_OUTPUT_SIZE_X_L(mode->output_size_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Crop End X */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_END_X_H_REG,
> > +			   OV5648_CROP_END_X_H(mode->crop_end_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_END_X_L_REG,
> > +			   OV5648_CROP_END_X_L(mode->crop_end_x));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Horizontal Total Size */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_HTS_H_REG, OV5648_HTS_H(mode->hts=
));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_HTS_L_REG, OV5648_HTS_L(mode->hts=
));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Crop Start Y */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_START_Y_H_REG,
> > +			   OV5648_CROP_START_Y_H(mode->crop_start_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_START_Y_L_REG,
> > +			   OV5648_CROP_START_Y_L(mode->crop_start_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Offset Y */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OFFSET_Y_H_REG,
> > +			   OV5648_OFFSET_Y_H(mode->offset_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OFFSET_Y_L_REG,
> > +			   OV5648_OFFSET_Y_L(mode->offset_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Output Size Y */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OUTPUT_SIZE_Y_H_REG,
> > +			   OV5648_OUTPUT_SIZE_Y_H(mode->output_size_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_OUTPUT_SIZE_Y_L_REG,
> > +			   OV5648_OUTPUT_SIZE_Y_L(mode->output_size_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Crop End Y */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_END_Y_H_REG,
> > +			   OV5648_CROP_END_Y_H(mode->crop_end_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_CROP_END_Y_L_REG,
> > +			   OV5648_CROP_END_Y_L(mode->crop_end_y));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Vertical Total Size */
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_VTS_H_REG, OV5648_VTS_H(mode->vts=
));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_VTS_L_REG, OV5648_VTS_L(mode->vts=
));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Flip/Mirror/Binning */
> > +
> > +	/*
> > +	 * A debug bit is enabled by default and needs to be cleared for
> > +	 * subsampling to work.
> > +	 */
> > +	ret =3D ov5648_update_bits(sensor, OV5648_TC20_REG,
> > +				 OV5648_TC20_DEBUG |
> > +				 OV5648_TC20_BINNING_VERT_EN,
> > +				 mode->binning_y ? OV5648_TC20_BINNING_VERT_EN :
> > +				 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_update_bits(sensor, OV5648_TC21_REG,
> > +				 OV5648_TC21_BINNING_HORZ_EN,
> > +				 mode->binning_x ? OV5648_TC21_BINNING_HORZ_EN :
> > +				 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_SUB_INC_X_REG,
> > +			   OV5648_SUB_INC_X_ODD(mode->inc_x_odd) |
> > +			   OV5648_SUB_INC_X_EVEN(mode->inc_x_even));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_SUB_INC_Y_REG,
> > +			   OV5648_SUB_INC_Y_ODD(mode->inc_y_odd) |
> > +			   OV5648_SUB_INC_Y_EVEN(mode->inc_y_even));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* PLLs */
> > +
> > +	ret =3D ov5648_mode_pll1_configure(sensor, mode, mbus_code);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_mode_pll2_configure(sensor, mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Extra registers */
> > +
> > +	if (mode->register_values) {
> > +		ret =3D ov5648_write_sequence(sensor, mode->register_values,
> > +					    mode->register_values_count);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long ov5648_mode_mipi_clk_rate(struct ov5648_sensor *s=
ensor,
> > +					       const struct ov5648_mode *mode,
> > +					       u32 mbus_code)
> > +{
> > +	const struct ov5648_pll1_config *config;
> > +	unsigned long pll1_rate;
> > +
> > +	switch (mbus_code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		config =3D mode->pll1_config[0];
> > +		break;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		config =3D mode->pll1_config[1];
> > +		break;
> > +	default:
> > +		return 0;
> > +	}
> > +
> > +	pll1_rate =3D ov5648_mode_pll1_rate(sensor, config);
> > +
> > +	return pll1_rate / config->sys_div / config->mipi_div / 2;
> > +}
> > +
> > +/* Exposure */
> > +
> > +static int ov5648_exposure_auto_configure(struct ov5648_sensor *sensor,
> > +					  bool enable)
> > +{
> > +	return ov5648_update_bits(sensor, OV5648_MANUAL_CTRL_REG,
> > +				  OV5648_MANUAL_CTRL_AEC_MANUAL_EN,
> > +				  enable ? 0 : OV5648_MANUAL_CTRL_AEC_MANUAL_EN);
> > +}
> > +
> > +static int ov5648_exposure_configure(struct ov5648_sensor *sensor, u32=
 exposure)
> > +{
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	int ret;
> > +
> > +	if (ctrls->exposure_auto->val !=3D V4L2_EXPOSURE_MANUAL)
> > +		return -EINVAL;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_EXPOSURE_CTRL_HH_REG,
> > +			   OV5648_EXPOSURE_CTRL_HH(exposure));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_EXPOSURE_CTRL_H_REG,
> > +			   OV5648_EXPOSURE_CTRL_H(exposure));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_EXPOSURE_CTRL_L_REG,
> > +			    OV5648_EXPOSURE_CTRL_L(exposure));
> > +}
> > +
> > +static int ov5648_exposure_value(struct ov5648_sensor *sensor,
> > +				 u32 *exposure)
> > +{
> > +	u8 exposure_hh =3D 0, exposure_h =3D 0, exposure_l =3D 0;
> > +	int ret;
> > +
> > +	ret =3D ov5648_read(sensor, OV5648_EXPOSURE_CTRL_HH_REG, &exposure_hh=
);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_read(sensor, OV5648_EXPOSURE_CTRL_H_REG, &exposure_h);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_read(sensor, OV5648_EXPOSURE_CTRL_L_REG, &exposure_l);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*exposure =3D OV5648_EXPOSURE_CTRL_HH_VALUE((u32)exposure_hh) |
> > +		    OV5648_EXPOSURE_CTRL_H_VALUE((u32)exposure_h) |
> > +		    OV5648_EXPOSURE_CTRL_L_VALUE((u32)exposure_l);
> > +
> > +	return 0;
> > +}
> > +
> > +/* Gain */
> > +
> > +static int ov5648_gain_auto_configure(struct ov5648_sensor *sensor, bo=
ol enable)
> > +{
> > +	return ov5648_update_bits(sensor, OV5648_MANUAL_CTRL_REG,
> > +				  OV5648_MANUAL_CTRL_AGC_MANUAL_EN,
> > +				  enable ? 0 : OV5648_MANUAL_CTRL_AGC_MANUAL_EN);
> > +}
> > +
> > +static int ov5648_gain_configure(struct ov5648_sensor *sensor, u32 gai=
n)
> > +{
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	int ret;
> > +
> > +	if (ctrls->gain_auto->val)
> > +		return -EINVAL;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_GAIN_CTRL_H_REG,
> > +			   OV5648_GAIN_CTRL_H(gain));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_GAIN_CTRL_L_REG,
> > +			    OV5648_GAIN_CTRL_L(gain));
> > +}
> > +
> > +static int ov5648_gain_value(struct ov5648_sensor *sensor, u32 *gain)
> > +{
> > +	u8 gain_h =3D 0, gain_l =3D 0;
> > +	int ret;
> > +
> > +	ret =3D ov5648_read(sensor, OV5648_GAIN_CTRL_H_REG, &gain_h);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_read(sensor, OV5648_GAIN_CTRL_L_REG, &gain_l);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*gain =3D OV5648_GAIN_CTRL_H_VALUE((u32)gain_h) |
> > +		OV5648_GAIN_CTRL_L_VALUE((u32)gain_l);
> > +
> > +	return 0;
> > +}
> > +
> > +/* White Balance */
> > +
> > +static int ov5648_white_balance_auto_configure(struct ov5648_sensor *s=
ensor,
> > +					       bool enable)
> > +{
> > +	return ov5648_write(sensor, OV5648_AWB_CTRL_REG,
> > +			    enable ? 0 : OV5648_AWB_CTRL_GAIN_MANUAL_EN);
> > +}
> > +
> > +static int ov5648_white_balance_configure(struct ov5648_sensor *sensor,
> > +					  u32 red_balance, u32 blue_balance)
> > +{
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	int ret;
> > +
> > +	if (ctrls->white_balance_auto->val)
> > +		return -EINVAL;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_GAIN_RED_MAN_H_REG,
> > +			   OV5648_GAIN_RED_MAN_H(red_balance));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_GAIN_RED_MAN_L_REG,
> > +			   OV5648_GAIN_RED_MAN_L(red_balance));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ov5648_write(sensor, OV5648_GAIN_BLUE_MAN_H_REG,
> > +			   OV5648_GAIN_BLUE_MAN_H(blue_balance));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov5648_write(sensor, OV5648_GAIN_BLUE_MAN_L_REG,
> > +			    OV5648_GAIN_BLUE_MAN_L(blue_balance));
> > +}
> > +
> > +/* Flip */
> > +
> > +static int ov5648_flip_vert_configure(struct ov5648_sensor *sensor, bo=
ol enable)
> > +{
> > +	u8 bits =3D OV5648_TC20_FLIP_VERT_ISP_EN |
> > +		  OV5648_TC20_FLIP_VERT_SENSOR_EN;
> > +
> > +	return ov5648_update_bits(sensor, OV5648_TC20_REG, bits,
> > +				  enable ? bits : 0);
> > +}
> > +
> > +static int ov5648_flip_horz_configure(struct ov5648_sensor *sensor, bo=
ol enable)
> > +{
> > +	u8 bits =3D OV5648_TC21_FLIP_HORZ_ISP_EN |
> > +		  OV5648_TC21_FLIP_HORZ_SENSOR_EN;
> > +
> > +	return ov5648_update_bits(sensor, OV5648_TC21_REG, bits,
> > +				  enable ? bits : 0);
> > +}
> > +
> > +/* Test Pattern */
> > +
> > +static int ov5648_test_pattern_configure(struct ov5648_sensor *sensor,
> > +					 unsigned int index)
> > +{
> > +	if (index >=3D ARRAY_SIZE(ov5648_test_pattern_bits))
> > +		return -EINVAL;
> > +
> > +	return ov5648_write(sensor, OV5648_ISP_CTRL3D_REG,
> > +			    ov5648_test_pattern_bits[index]);
> > +}
> > +
> > +/* State */
> > +
> > +static int ov5648_state_mipi_configure(struct ov5648_sensor *sensor,
> > +				       const struct ov5648_mode *mode,
> > +				       u32 mbus_code)
> > +{
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =3D
> > +		&sensor->endpoint.bus.mipi_csi2;
> > +	unsigned long mipi_clk_rate;
> > +	unsigned int bits_per_sample;
> > +	unsigned int lanes_count;
> > +	unsigned int i, j;
> > +	s64 mipi_pixel_rate;
> > +
> > +	mipi_clk_rate =3D ov5648_mode_mipi_clk_rate(sensor, mode, mbus_code);
> > +	if (!mipi_clk_rate)
> > +		return -EINVAL;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(ov5648_link_freq_menu); i++) {
> > +		s64 freq =3D ov5648_link_freq_menu[i];
> > +
> > +		if (freq =3D=3D mipi_clk_rate)
> > +			break;
> > +	}
> > +
> > +	for (j =3D 0; j < sensor->endpoint.nr_of_link_frequencies; j++) {
> > +		u64 freq =3D sensor->endpoint.link_frequencies[j];
> > +
> > +		if (freq =3D=3D mipi_clk_rate)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D ARRAY_SIZE(ov5648_link_freq_menu)) {
> > +		dev_err(sensor->dev,
> > +			"failed to find %lu clk rate in link freq\n",
> > +			mipi_clk_rate);
> > +	} else if (j =3D=3D sensor->endpoint.nr_of_link_frequencies) {
> > +		dev_err(sensor->dev,
> > +			"failed to find %lu clk rate in endpoint link-frequencies\n",
> > +			mipi_clk_rate);
> > +	} else {
> > +		__v4l2_ctrl_s_ctrl(ctrls->link_freq, i);
> > +	}
> > +
> > +	switch (mbus_code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		bits_per_sample =3D 8;
> > +		break;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		bits_per_sample =3D 10;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	lanes_count =3D bus_mipi_csi2->num_data_lanes;
> > +	mipi_pixel_rate =3D mipi_clk_rate * 2 * lanes_count / bits_per_sample;
> > +
> > +	__v4l2_ctrl_s_ctrl_int64(ctrls->pixel_rate, mipi_pixel_rate);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_state_configure(struct ov5648_sensor *sensor,
> > +				  const struct ov5648_mode *mode,
> > +				  u32 mbus_code)
> > +{
> > +	int ret;
> > +
> > +	if (sensor->state.streaming)
> > +		return -EBUSY;
> > +
> > +	/* State will be configured at first power on otherwise. */
> > +	if (pm_runtime_enabled(sensor->dev) &&
> > +	    !pm_runtime_suspended(sensor->dev)) {
> > +		ret =3D ov5648_mode_configure(sensor, mode, mbus_code);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ov5648_state_mipi_configure(sensor, mode, mbus_code);
> > +	if (ret)
> > +		return ret;
> > +
> > +	sensor->state.mode =3D mode;
> > +	sensor->state.mbus_code =3D mbus_code;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_state_init(struct ov5648_sensor *sensor)
> > +{
> > +	return ov5648_state_configure(sensor, &ov5648_modes[0],
> > +				      ov5648_mbus_codes[0]);
> > +}
> > +
> > +/* Sensor Base */
> > +
> > +static int ov5648_sensor_init(struct ov5648_sensor *sensor)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ov5648_sw_reset(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to perform sw reset\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_sw_standby(sensor, 1);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to set sensor standby\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_chip_id_check(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to check sensor chip id\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_avdd_internal_power(sensor, !sensor->avdd);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to set internal avdd power\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_write_sequence(sensor, ov5648_init_sequence,
> > +				    ARRAY_SIZE(ov5648_init_sequence));
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to write init sequence\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_pad_configure(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to configure pad\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_mipi_configure(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to configure MIPI\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_isp_configure(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to configure ISP\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D ov5648_black_level_configure(sensor);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to configure black level\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Configure current mode. */
> > +	ret =3D ov5648_state_configure(sensor, sensor->state.mode,
> > +				     sensor->state.mbus_code);
> > +	if (ret) {
> > +		dev_err(sensor->dev, "failed to configure state\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_sensor_power(struct ov5648_sensor *sensor, bool on)
> > +{
> > +	/* Keep initialized to zero for disable label. */
> > +	int ret =3D 0;
> > +
> > +	/*
> > +	 * General notes about the power sequence:
> > +	 * - power-down GPIO must be active (low) during power-on;
> > +	 * - reset GPIO state does not matter during power-on;
> > +	 * - XVCLK must be provided 1 ms before register access;
> > +	 * - 10 ms are needed between power-down deassert and register access.
> > +	 */
> > +
> > +	/* Note that regulator-and-GPIO-based power is untested. */
> > +	if (on) {
> > +		gpiod_set_value_cansleep(sensor->reset, 1);
> > +		gpiod_set_value_cansleep(sensor->powerdown, 1);
> > +
> > +		ret =3D regulator_enable(sensor->dovdd);
> > +		if (ret) {
> > +			dev_err(sensor->dev,
> > +				"failed to enable DOVDD regulator\n");
> > +			goto disable;
> > +		}
> > +
> > +		if (sensor->avdd) {
> > +			ret =3D regulator_enable(sensor->avdd);
> > +			if (ret) {
> > +				dev_err(sensor->dev,
> > +					"failed to enable AVDD regulator\n");
> > +				goto disable;
> > +			}
> > +		}
> > +
> > +		ret =3D regulator_enable(sensor->dvdd);
> > +		if (ret) {
> > +			dev_err(sensor->dev,
> > +				"failed to enable DVDD regulator\n");
> > +			goto disable;
> > +		}
> > +
> > +		/* According to OV5648 power up diagram. */
> > +		usleep_range(5000, 10000);
> > +
> > +		ret =3D clk_prepare_enable(sensor->xvclk);
> > +		if (ret) {
> > +			dev_err(sensor->dev, "failed to enable XVCLK clock\n");
> > +			goto disable;
> > +		}
> > +
> > +		gpiod_set_value_cansleep(sensor->reset, 0);
> > +		gpiod_set_value_cansleep(sensor->powerdown, 0);
> > +
> > +		usleep_range(20000, 25000);
> > +	} else {
> > +disable:
> > +		gpiod_set_value_cansleep(sensor->powerdown, 1);
> > +		gpiod_set_value_cansleep(sensor->reset, 1);
> > +
> > +		clk_disable_unprepare(sensor->xvclk);
> > +
> > +		regulator_disable(sensor->dvdd);
> > +
> > +		if (sensor->avdd)
> > +			regulator_disable(sensor->avdd);
> > +
> > +		regulator_disable(sensor->dovdd);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/* Controls */
> > +
> > +static int ov5648_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct v4l2_subdev *subdev =3D ov5648_ctrl_subdev(ctrl);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	int ret;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE_AUTO:
> > +		ret =3D ov5648_exposure_value(sensor, &ctrls->exposure->val);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	case V4L2_CID_AUTOGAIN:
> > +		ret =3D ov5648_gain_value(sensor, &ctrls->gain->val);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct v4l2_subdev *subdev =3D ov5648_ctrl_subdev(ctrl);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	unsigned int index;
> > +	bool enable;
> > +	int ret;
> > +
> > +	/* Wait for the sensor to be on before setting controls. */
> > +	if (pm_runtime_suspended(sensor->dev))
> > +		return 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE_AUTO:
> > +		enable =3D ctrl->val =3D=3D V4L2_EXPOSURE_AUTO;
> > +
> > +		ret =3D ov5648_exposure_auto_configure(sensor, enable);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (!enable && ctrls->exposure->is_new) {
> > +			ret =3D ov5648_exposure_configure(sensor,
> > +							ctrls->exposure->val);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +		break;
> > +	case V4L2_CID_AUTOGAIN:
> > +		enable =3D !!ctrl->val;
> > +
> > +		ret =3D ov5648_gain_auto_configure(sensor, enable);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (!enable) {
> > +			ret =3D ov5648_gain_configure(sensor, ctrls->gain->val);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +		break;
> > +	case V4L2_CID_AUTO_WHITE_BALANCE:
> > +		enable =3D !!ctrl->val;
> > +
> > +		ret =3D ov5648_white_balance_auto_configure(sensor, enable);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (!enable) {
> > +			ret =3D ov5648_white_balance_configure(sensor,
> > +							     ctrls->red_balance->val,
> > +							     ctrls->blue_balance->val);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +		break;
> > +	case V4L2_CID_HFLIP:
> > +		enable =3D !!ctrl->val;
> > +		return ov5648_flip_horz_configure(sensor, enable);
> > +	case V4L2_CID_VFLIP:
> > +		enable =3D !!ctrl->val;
> > +		return ov5648_flip_vert_configure(sensor, enable);
> > +	case V4L2_CID_TEST_PATTERN:
> > +		index =3D (unsigned int)ctrl->val;
> > +		return ov5648_test_pattern_configure(sensor, index);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ov5648_ctrl_ops =3D {
> > +	.g_volatile_ctrl	=3D ov5648_g_volatile_ctrl,
> > +	.s_ctrl			=3D ov5648_s_ctrl,
> > +};
> > +
> > +static int ov5648_ctrls_init(struct ov5648_sensor *sensor)
> > +{
> > +	struct ov5648_ctrls *ctrls =3D &sensor->ctrls;
> > +	struct v4l2_ctrl_handler *handler =3D &ctrls->handler;
> > +	const struct v4l2_ctrl_ops *ops =3D &ov5648_ctrl_ops;
> > +	int ret;
> > +
> > +	v4l2_ctrl_handler_init(handler, 32);
> > +
> > +	/* Use our mutex for ctrl locking. */
> > +	handler->lock =3D &sensor->mutex;
> > +
> > +	/* Exposure */
> > +
> > +	ctrls->exposure_auto =3D v4l2_ctrl_new_std_menu(handler, ops,
> > +						      V4L2_CID_EXPOSURE_AUTO,
> > +						      V4L2_EXPOSURE_MANUAL, 0,
> > +						      V4L2_EXPOSURE_AUTO);
> > +
> > +	ctrls->exposure =3D v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE,
> > +					    16, 1048575, 16, 512);
> > +	ctrls->exposure->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
>=20
> ctrls->exposure may be NULL here.
>=20
> I'd move this after the handler's error check.
>=20
> > +
> > +	v4l2_ctrl_auto_cluster(2, &ctrls->exposure_auto, 1, true);
> > +
> > +	/* Gain */
> > +
> > +	ctrls->gain_auto =3D
> > +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_AUTOGAIN, 0, 1, 1, 1);
> > +
> > +	ctrls->gain =3D v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 16, 10=
23,
> > +					16, 16);
> > +	ctrls->gain->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
>=20
> Ditto.
>=20
> > +
> > +	v4l2_ctrl_auto_cluster(2, &ctrls->gain_auto, 0, true);
> > +
> > +	/* White Balance */
> > +
> > +	ctrls->white_balance_auto =3D
> > +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_AUTO_WHITE_BALANCE, 0,
> > +				  1, 1, 1);
> > +
> > +	ctrls->red_balance =3D v4l2_ctrl_new_std(handler, ops,
> > +					       V4L2_CID_RED_BALANCE, 0, 4095,
> > +					       1, 1024);
> > +
> > +	ctrls->blue_balance =3D v4l2_ctrl_new_std(handler, ops,
> > +						V4L2_CID_BLUE_BALANCE, 0, 4095,
> > +						1, 1024);
> > +
> > +	v4l2_ctrl_auto_cluster(3, &ctrls->white_balance_auto, 0, false);
> > +
> > +	/* Flip */
> > +
> > +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +	/* Test Pattern */
> > +
> > +	v4l2_ctrl_new_std_menu_items(handler, ops, V4L2_CID_TEST_PATTERN,
> > +				     ARRAY_SIZE(ov5648_test_pattern_menu) - 1,
> > +				     0, 0, ov5648_test_pattern_menu);
> > +
> > +	/* MIPI CSI-2 */
> > +
> > +	ctrls->link_freq =3D
> > +		v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> > +				       ARRAY_SIZE(ov5648_link_freq_menu) - 1,
> > +				       0, ov5648_link_freq_menu);
> > +
> > +	ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>=20
> Ditto.
>=20
> > +
> > +	ctrls->pixel_rate =3D
> > +		v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 1,
> > +				  INT_MAX, 1, 1);
> > +
> > +	ctrls->pixel_rate->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>=20
> Ditto.
>=20
> > +
> > +	if (handler->error) {
> > +		ret =3D handler->error;
> > +		goto error_ctrls;
> > +	}
> > +
> > +	sensor->subdev.ctrl_handler =3D handler;
> > +
> > +	return 0;
> > +
> > +error_ctrls:
> > +	v4l2_ctrl_handler_free(handler);
> > +
> > +	return ret;
> > +}
> > +
> > +/* Subdev Video Operations */
> > +
> > +static int ov5648_s_stream(struct v4l2_subdev *subdev, int enable)
> > +{
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct ov5648_state *state =3D &sensor->state;
> > +	int ret =3D 0;
>=20
> No need to initialise ret.
>=20
> > +
> > +	if (enable) {
> > +		ret =3D pm_runtime_get_sync(sensor->dev);
> > +		if (ret < 0) {
> > +			pm_runtime_put_noidle(sensor->dev);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	mutex_lock(&sensor->mutex);
> > +	ret =3D ov5648_sw_standby(sensor, !enable);
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	state->streaming =3D !!enable;
> > +
> > +	if (!enable)
> > +		pm_runtime_put(sensor->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_g_frame_interval(struct v4l2_subdev *subdev,
> > +				   struct v4l2_subdev_frame_interval *interval)
> > +{
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	const struct ov5648_mode *mode;
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +
> > +	mode =3D sensor->state.mode;
> > +
> > +	switch (sensor->state.mbus_code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		interval->interval =3D mode->frame_interval[0];
> > +		break;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		interval->interval =3D mode->frame_interval[1];
> > +		break;
> > +	default:
> > +		ret =3D -EINVAL;
> > +	}
> > +
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov5648_subdev_video_ops =3D {
> > +	.s_stream		=3D ov5648_s_stream,
> > +	.g_frame_interval	=3D ov5648_g_frame_interval,
> > +	.s_frame_interval	=3D ov5648_g_frame_interval,
> > +};
> > +
> > +/* Subdev Pad Operations */
> > +
> > +static int ov5648_enum_mbus_code(struct v4l2_subdev *subdev,
> > +				 struct v4l2_subdev_pad_config *config,
> > +				 struct v4l2_subdev_mbus_code_enum *code_enum)
> > +{
> > +	if (code_enum->index >=3D ARRAY_SIZE(ov5648_mbus_codes))
> > +		return -EINVAL;
> > +
> > +	code_enum->code =3D ov5648_mbus_codes[code_enum->index];
> > +
> > +	return 0;
> > +}
> > +
> > +static void ov5648_mbus_format_fill(struct v4l2_mbus_framefmt *mbus_fo=
rmat,
> > +				    u32 mbus_code,
> > +				    const struct ov5648_mode *mode)
> > +{
> > +	mbus_format->width =3D mode->output_size_x;
> > +	mbus_format->height =3D mode->output_size_y;
> > +	mbus_format->code =3D mbus_code;
> > +
> > +	mbus_format->field =3D V4L2_FIELD_NONE;
> > +	mbus_format->colorspace =3D V4L2_COLORSPACE_RAW;
> > +	mbus_format->ycbcr_enc =3D
> > +		V4L2_MAP_YCBCR_ENC_DEFAULT(mbus_format->colorspace);
> > +	mbus_format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +	mbus_format->xfer_func =3D
> > +		V4L2_MAP_XFER_FUNC_DEFAULT(mbus_format->colorspace);
> > +}
> > +
> > +static int ov5648_get_fmt(struct v4l2_subdev *subdev,
> > +			  struct v4l2_subdev_pad_config *config,
> > +			  struct v4l2_subdev_format *format)
> > +{
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +
> > +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +		*mbus_format =3D *v4l2_subdev_get_try_format(subdev, config,
> > +							   format->pad);
> > +	else
> > +		ov5648_mbus_format_fill(mbus_format, sensor->state.mbus_code,
> > +					sensor->state.mode);
> > +
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_set_fmt(struct v4l2_subdev *subdev,
> > +			  struct v4l2_subdev_pad_config *config,
> > +			  struct v4l2_subdev_format *format)
> > +{
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> > +	const struct ov5648_mode *mode;
> > +	u32 mbus_code =3D 0;
> > +	unsigned int index;
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +
> > +	if (sensor->state.streaming) {
> > +		ret =3D -EBUSY;
> > +		goto complete;
> > +	}
> > +
> > +	/* Try to find requested mbus code. */
> > +	for (index =3D 0; index < ARRAY_SIZE(ov5648_mbus_codes); index++) {
> > +		if (ov5648_mbus_codes[index] =3D=3D mbus_format->code) {
> > +			mbus_code =3D mbus_format->code;
> > +			break;
> > +		}
> > +	}
> > +
> > +	/* Fallback to default. */
> > +	if (!mbus_code)
> > +		mbus_code =3D ov5648_mbus_codes[0];
> > +
> > +	/* Find the mode with nearest dimensions. */
> > +	mode =3D v4l2_find_nearest_size(ov5648_modes, ARRAY_SIZE(ov5648_modes=
),
> > +				      output_size_x, output_size_y,
> > +				      mbus_format->width, mbus_format->height);
> > +	if (!mode)
>=20
> mutex is held here.
>=20
> > +		return -EINVAL;
> > +
> > +	ov5648_mbus_format_fill(mbus_format, mbus_code, mode);
> > +
> > +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +		*v4l2_subdev_get_try_format(subdev, config, format->pad) =3D
> > +			*mbus_format;
> > +	} else if (sensor->state.mode !=3D mode ||
> > +		   sensor->state.mbus_code !=3D mbus_code) {
> > +		ret =3D ov5648_state_configure(sensor, mode, mbus_code);
> > +		if (ret)
> > +			goto complete;
>=20
> The goto has no effect here.
>=20
> > +	}
> > +
> > +complete:
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_enum_frame_size(struct v4l2_subdev *subdev,
> > +				  struct v4l2_subdev_pad_config *config,
> > +				  struct v4l2_subdev_frame_size_enum *size_enum)
> > +{
> > +	const struct ov5648_mode *mode;
> > +
> > +	if (size_enum->index >=3D ARRAY_SIZE(ov5648_modes))
> > +		return -EINVAL;
> > +
> > +	mode =3D &ov5648_modes[size_enum->index];
> > +
> > +	size_enum->min_width =3D size_enum->max_width =3D mode->output_size_x;
> > +	size_enum->min_height =3D size_enum->max_height =3D mode->output_size=
_y;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov5648_enum_frame_interval(struct v4l2_subdev *subdev,
> > +				      struct v4l2_subdev_pad_config *config,
> > +				      struct v4l2_subdev_frame_interval_enum *interval_enum)
> > +{
> > +	const struct ov5648_mode *mode =3D NULL;
> > +	unsigned int mode_index;
> > +	unsigned int interval_index;
> > +
> > +	if (interval_enum->index > 0)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Multiple modes with the same dimensions may have different frame
> > +	 * intervals, so look up each relevant mode.
> > +	 */
> > +	for (mode_index =3D 0, interval_index =3D 0;
> > +	     mode_index < ARRAY_SIZE(ov5648_modes); mode_index++) {
> > +		mode =3D &ov5648_modes[mode_index];
> > +
> > +		if (mode->output_size_x =3D=3D interval_enum->width &&
> > +		    mode->output_size_y =3D=3D interval_enum->height) {
> > +			if (interval_index =3D=3D interval_enum->index)
> > +				break;
> > +
> > +			interval_index++;
> > +		}
> > +	}
> > +
> > +	if (mode_index =3D=3D ARRAY_SIZE(ov5648_modes) || !mode)
> > +		return -EINVAL;
> > +
> > +	switch (interval_enum->code) {
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +		interval_enum->interval =3D mode->frame_interval[0];
> > +		break;
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +		interval_enum->interval =3D mode->frame_interval[1];
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops ov5648_subdev_pad_ops =3D {
> > +	.enum_mbus_code		=3D ov5648_enum_mbus_code,
> > +	.get_fmt		=3D ov5648_get_fmt,
> > +	.set_fmt		=3D ov5648_set_fmt,
> > +	.enum_frame_size	=3D ov5648_enum_frame_size,
> > +	.enum_frame_interval	=3D ov5648_enum_frame_interval,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov5648_subdev_ops =3D {
> > +	.video		=3D &ov5648_subdev_video_ops,
> > +	.pad		=3D &ov5648_subdev_pad_ops,
> > +};
> > +
> > +static int ov5648_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct ov5648_state *state =3D &sensor->state;
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +
> > +	if (state->streaming) {
> > +		ret =3D ov5648_sw_standby(sensor, true);
> > +		if (ret)
> > +			goto complete;
> > +	}
> > +
> > +	ret =3D ov5648_sensor_power(sensor, false);
> > +	if (ret) {
> > +		ov5648_sw_standby(sensor, false);
> > +		goto complete;
>=20
> No need for goto.
>=20
> > +	}
> > +
> > +complete:
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +	struct ov5648_state *state =3D &sensor->state;
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +
> > +	ret =3D ov5648_sensor_power(sensor, true);
> > +	if (ret)
> > +		goto complete;
> > +
> > +	ret =3D ov5648_sensor_init(sensor);
> > +	if (ret)
> > +		goto error_power;
> > +
> > +	ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > +	if (ret)
> > +		goto error_power;
> > +
> > +	if (state->streaming) {
> > +		ret =3D ov5648_sw_standby(sensor, false);
> > +		if (ret)
> > +			goto error_power;
> > +	}
> > +
> > +	goto complete;
>=20
> This isn't really wrong, but the code might be easier to read if you
> unlocked the mutex here and returned zero.
>=20
> > +
> > +error_power:
> > +	ov5648_sensor_power(sensor, false);
> > +
> > +complete:
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct fwnode_handle *handle;
> > +	struct ov5648_sensor *sensor;
> > +	struct v4l2_subdev *subdev;
> > +	struct media_pad *pad;
> > +	unsigned long rate;
> > +	int ret;
> > +
> > +	sensor =3D devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	sensor->dev =3D dev;
> > +	sensor->i2c_client =3D client;
> > +
> > +	/* Graph Endpoint */
> > +
> > +	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > +	if (!handle) {
> > +		dev_err(dev, "unable to find enpoint node\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	sensor->endpoint.bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > +
> > +	ret =3D v4l2_fwnode_endpoint_alloc_parse(handle, &sensor->endpoint);
> > +	fwnode_handle_put(handle);
> > +	if (ret) {
> > +		dev_err(dev, "failed to parse endpoint node\n");
> > +		return ret;
> > +	}
> > +
> > +	/* GPIOs */
> > +
> > +	sensor->powerdown =3D devm_gpiod_get_optional(dev, "powerdown",
> > +						    GPIOD_OUT_HIGH);
> > +	if (IS_ERR(sensor->powerdown)) {
> > +		ret =3D PTR_ERR(sensor->powerdown);
> > +		goto error_endpoint;
> > +	}
> > +
> > +	sensor->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIG=
H);
> > +	if (IS_ERR(sensor->reset)) {
> > +		ret =3D PTR_ERR(sensor->reset);
> > +		goto error_endpoint;
> > +	}
> > +
> > +	/* Regulators */
> > +
> > +	/* DVDD: digital core */
> > +	sensor->dvdd =3D devm_regulator_get(dev, "dvdd");
> > +	if (IS_ERR(sensor->dvdd)) {
> > +		dev_err(dev, "cannot get DVDD (digital core) regulator\n");
> > +		ret =3D PTR_ERR(sensor->dvdd);
> > +		goto error_endpoint;
> > +	}
> > +
> > +	/* DOVDD: digital I/O */
> > +	sensor->dovdd =3D devm_regulator_get(dev, "dovdd");
> > +	if (IS_ERR(sensor->dvdd)) {
> > +		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
> > +		ret =3D PTR_ERR(sensor->dvdd);
> > +		goto error_endpoint;
> > +	}
> > +
> > +	/* AVDD: analog */
> > +	sensor->avdd =3D devm_regulator_get_optional(dev, "avdd");
> > +	if (IS_ERR(sensor->avdd)) {
> > +		dev_info(dev, "no AVDD regulator provided, using internal\n");
> > +		sensor->avdd =3D NULL;
> > +	}
> > +
> > +	/* External Clock */
> > +
> > +	sensor->xvclk =3D devm_clk_get(dev, NULL);
> > +	if (IS_ERR(sensor->xvclk)) {
> > +		dev_err(dev, "failed to get external clock\n");
> > +		ret =3D PTR_ERR(sensor->xvclk);
> > +		goto error_endpoint;
> > +	}
> > +
> > +	rate =3D clk_get_rate(sensor->xvclk);
> > +	if (rate !=3D OV5648_XVCLK_RATE) {
> > +		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
> > +		ret =3D -EINVAL;
> > +		goto error_endpoint;
> > +	}
> > +
> > +	/* Subdev, entity and pad */
> > +
> > +	subdev =3D &sensor->subdev;
> > +	v4l2_i2c_subdev_init(subdev, client, &ov5648_subdev_ops);
> > +
> > +	subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	subdev->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	pad =3D &sensor->pad;
> > +	pad->flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret =3D media_entity_pads_init(&subdev->entity, 1, pad);
> > +	if (ret)
> > +		goto error_entity;
> > +
> > +	/* Mutex */
> > +
> > +	mutex_init(&sensor->mutex);
> > +
> > +	/* Sensor */
> > +
> > +	ret =3D ov5648_ctrls_init(sensor);
> > +	if (ret)
> > +		goto error_mutex;
> > +
> > +	ret =3D ov5648_state_init(sensor);
> > +	if (ret)
> > +		goto error_ctrls;
> > +
> > +	/* Runtime PM */
> > +
> > +	pm_runtime_enable(sensor->dev);
> > +	pm_runtime_set_suspended(sensor->dev);
> > +
> > +	/* V4L2 subdev register */
> > +
> > +	ret =3D v4l2_async_register_subdev_sensor_common(subdev);
> > +	if (ret)
> > +		goto error_pm;
> > +
> > +	return 0;
> > +
> > +error_pm:
> > +	pm_runtime_disable(sensor->dev);
> > +
> > +error_ctrls:
> > +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +
> > +error_mutex:
> > +	mutex_destroy(&sensor->mutex);
> > +
> > +error_entity:
> > +	media_entity_cleanup(&sensor->subdev.entity);
> > +
> > +error_endpoint:
> > +	v4l2_fwnode_endpoint_free(&sensor->endpoint);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov5648_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
> > +	struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> > +
> > +	v4l2_async_unregister_subdev(subdev);
> > +	pm_runtime_disable(sensor->dev);
> > +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +	mutex_destroy(&sensor->mutex);
> > +	media_entity_cleanup(&subdev->entity);
> > +	v4l2_device_unregister_subdev(subdev);
>=20
> This needs to be done only for subdevs registered using
> v4l2_device_register_subdev(), i.e. not here.
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ov5648_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(ov5648_suspend, ov5648_resume, NULL)
> > +};
> > +
> > +static const struct of_device_id ov5648_of_match[] =3D {
> > +	{ .compatible =3D "ovti,ov5648" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov5648_of_match);
> > +
> > +static struct i2c_driver ov5648_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ov5648",
> > +		.of_match_table =3D ov5648_of_match,
> > +		.pm =3D &ov5648_pm_ops,
> > +	},
> > +	.probe_new =3D ov5648_probe,
> > +	.remove	 =3D ov5648_remove,
> > +};
> > +
> > +module_i2c_driver(ov5648_driver);
> > +
> > +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> > +MODULE_DESCRIPTION("V4L2 driver for the OmniVision OV5648 image sensor=
");
> > +MODULE_LICENSE("GPL v2");
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--kRAn/Z473XsBHAGq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/tydkACgkQ3cLmz3+f
v9ENaQgAmzW2gUOdkKghUgR0M8OrBe+B06qq//wUQ3WVi0qdD5unNy08bFD82wZ6
l/Xo4CRWFiCJYcsynp4Eq8Jb3v8N1V3K+oyCJGc0ntBzTzsG6pVPvnOrjcRgDVCa
FGLItqxpyD0SQLcpjNMxbySkKzgE/nwx0MNj5XaDwB88qrdt93jlW4y8QaggMwfQ
bti74Y926RLGESCv7m17Fcszh9p9PTdmSnPUcBRcW5ZcN7I3llW2DPsC2G7cymZk
Z7RfY5/hXDo5Rosj3fKXISSohqObQCevskOLGKp9UrQmrgDl87Rh2pGDKg4QyUZy
oOr+EXEk4jEj7FJAXRkPM/CW5Tvl8A==
=mD9y
-----END PGP SIGNATURE-----

--kRAn/Z473XsBHAGq--
