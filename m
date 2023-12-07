Return-Path: <linux-media+bounces-1806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2FA808553
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842DC1F210B1
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796A036B00;
	Thu,  7 Dec 2023 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QLcBqS0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974D819A
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 02:19:51 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFA00669;
	Thu,  7 Dec 2023 11:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701944348;
	bh=JDuH89kWsK8jMKbfffn397cRZcKLhnNhmK1JKnTxe3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLcBqS0QxkNUAElyEpbCFjY5yckYokzNpoBkZ+F2itxVi7tx5Xgil+UU5aOyPsbXp
	 OgTlk08Om3yDNveRZRYC7lpdVqlr6FcJ/zgb1vD2zzmt8dzFaC81lk306kGbZZSG38
	 mjSXwX/sb5qsqT4ZfQLJM0zg9Gl9ek52fifeOou4=
Date: Thu, 7 Dec 2023 11:19:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <2hihggebhn7b7awj6dtgazjutgpc2cqwdrfyumuxoqgphefdqi@mo2kyol54j4f>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
 <20231206155900.123904-3-jacopo.mondi@ideasonboard.com>
 <CAPY8ntB9qWQQMRoVELczn_NJa2tP-=8zrH_s0zTSqgGu1YR+Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB9qWQQMRoVELczn_NJa2tP-=8zrH_s0zTSqgGu1YR+Kw@mail.gmail.com>

Hi Dave

On Wed, Dec 06, 2023 at 04:36:47PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Wed, 6 Dec 2023 at 15:59, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Add a driver for the OmniVision OV64A40 image sensor.
> >
> > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                 |    8 +
> >  drivers/media/i2c/Kconfig   |   11 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov64a40.c | 3686 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 3706 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov64a40.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 10a981abd6ec..95e4a1933665 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16021,6 +16021,14 @@ S:     Maintained
> >  T:     git git://linuxtv.org/media_tree.git
> >  F:     drivers/media/i2c/ov5695.c
> >
> > +OMNIVISION OV64A40 SENSOR DRIVER
> > +M:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +T:     git git://linuxtv.org/media_tree.git
> > +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > +F:     drivers/media/i2c/ov64a40.c
> > +
> >  OMNIVISION OV7670 SENSOR DRIVER
> >  L:     linux-media@vger.kernel.org
> >  S:     Orphan
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 59ee0ca2c978..7d5ec1017abb 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -455,6 +455,17 @@ config VIDEO_OV5695
> >           To compile this driver as a module, choose M here: the
> >           module will be called ov5695.
> >
> > +config VIDEO_OV64A40
> > +       tristate "OmniVision OV64A40 sensor support"
> > +       depends on I2C && VIDEO_DEV
> > +       select V4L2_CCI_I2C
> > +       help
> > +         This is a Video4Linux2 sensor driver for the OmniVision
> > +         OV64A40 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called ov64a40.
> > +
> >  config VIDEO_OV6650
> >         tristate "OmniVision OV6650 sensor support"
> >         help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index f5010f80a21f..feaf6b5556b7 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -92,6 +92,7 @@ obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
> >  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
> >  obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
> >  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
> > +obj-$(CONFIG_VIDEO_OV64A40) += ov64a40.o
> >  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
> >  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
> >  obj-$(CONFIG_VIDEO_OV7640) += ov7640.o
> > diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> > new file mode 100644
> > index 000000000000..7f68faf7011e
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov64a40.c
> > @@ -0,0 +1,3686 @@
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
> > +#define OV64A40_XCLK_FREQ              24000000
> > +
> > +#define OV64A40_NATIVE_WIDTH           9286
> > +#define OV64A40_NATIVE_HEIGHT          6976
> > +#define OV64A40_PIXEL_ARRAY_TOP                0
> > +#define OV64A40_PIXEL_ARRAY_LEFT       0
> > +#define OV64A40_PIXEL_ARRAY_WIDTH      9248
> > +#define OV64A40_PIXEL_ARRAY_HEIGHT     6944
> > +
> > +#define OV64A40_PIXEL_RATE             300000000
> > +
> > +#define OV64A40_LINK_FREQ_360M         360000000
> > +#define OV64A40_LINK_FREQ_456M         456000000
> > +
> > +#define OV64A40_PLL1_PRE_DIV0          CCI_REG8(0x0301)
> > +#define OV64A40_PLL1_PRE_DIV           CCI_REG8(0x0303)
> > +#define OV64A40_PLL1_MULTIPLIER                CCI_REG16(0x0304)
> > +#define OV64A40_PLL1_M_DIV             CCI_REG8(0x0307)
> > +#define OV64A40_PLL2_SEL_BAK_SA1       CCI_REG8(0x0320)
> > +#define OV64A40_PLL2_PRE_DIV           CCI_REG8(0x0323)
> > +#define OV64A40_PLL2_MULTIPLIER                CCI_REG16(0x0324)
> > +#define OV64A40_PLL2_PRE_DIV0          CCI_REG8(0x0326)
> > +#define OV64A40_PLL2_DIVDAC            CCI_REG8(0x0329)
> > +#define OV64A40_PLL2_DIVSP             CCI_REG8(0x032d)
> > +#define OV64A40_PLL2_DACPREDIV         CCI_REG8(0x032e)
> > +
> > +/* TODO: validate vblank_min, it's not characterized in the datasheet. */
> > +#define OV64A40_VBLANK_MIN             128
> > +#define OV64A40_VTS_MAX                        0xffffff
> > +
> > +#define OV64A40_REG_MEC_LONG_EXPO      CCI_REG24(0x3500)
> > +#define OV64A40_EXPOSURE_MIN           16
> > +#define OV64A40_EXPOSURE_MARGIN                32
> > +
> > +#define OV64A40_REG_MEC_LONG_GAIN      CCI_REG16(0x3508)
> > +#define OV64A40_ANA_GAIN_MIN           0x80
> > +#define OV64A40_ANA_GAIN_MAX           0x7ff
> > +#define OV64A40_ANA_GAIN_DEFAULT       0x80
> > +
> > +#define OV64A40_REG_TIMING_CTRL0       CCI_REG16(0x3800)
> > +#define OV64A40_REG_TIMING_CTRL2       CCI_REG16(0x3802)
> > +#define OV64A40_REG_TIMING_CTRL4       CCI_REG16(0x3804)
> > +#define OV64A40_REG_TIMING_CTRL6       CCI_REG16(0x3806)
> > +#define OV64A40_REG_TIMING_CTRL8       CCI_REG16(0x3808)
> > +#define OV64A40_REG_TIMING_CTRLA       CCI_REG16(0x380a)
> > +#define OV64A40_REG_TIMING_CTRLC       CCI_REG16(0x380c)
> > +#define OV64A40_REG_TIMING_CTRLE       CCI_REG16(0x380e)
> > +#define OV64A40_REG_TIMING_CTRL10      CCI_REG16(0x3810)
> > +#define OV64A40_REG_TIMING_CTRL12      CCI_REG16(0x3812)
> > +
> > +/*
> > + * Careful: a typo in the datasheet calls this register
> > + * OV64A40_REG_TIMING_CTRL20.
> > + */
> > +#define OV64A40_REG_TIMING_CTRL14      CCI_REG8(0x3814)
> > +#define OV64A40_REG_TIMING_CTRL15      CCI_REG8(0x3815)
> > +#define OV64A40_ODD_INC_SHIFT          4
> > +#define OV64A40_SKIPPING_CONFIG(_odd, _even) \
> > +                               (((_odd) << OV64A40_ODD_INC_SHIFT) | (_even))
> > +
> > +#define OV64A40_REG_TIMING_CTRL_20     CCI_REG8(0x3820)
> > +#define OV64A40_TIMING_CTRL_20_VFLIP   BIT(2)
> > +#define OV64A40_TIMING_CTRL_20_VBIN    BIT(1)
> > +
> > +#define OV64A40_REG_TIMING_CTRL_21     CCI_REG8(0x3821)
> > +#define OV64A40_TIMING_CTRL_21_HBIN    BIT(4)
> > +#define OV64A40_TIMING_CTRL_21_HFLIP   BIT(2)
> > +#define OV64A40_TIMING_CTRL_21_DSPEED  BIT(0)
> > +#define OV64A40_TIMING_CTRL_21_HBIN_CONF \
> > +                                       (OV64A40_TIMING_CTRL_21_HBIN | \
> > +                                        OV64A40_TIMING_CTRL_21_DSPEED)
> > +
> > +#define OV64A40_REG_TIMINGS_VTS_HIGH   CCI_REG8(0x3840)
> > +#define OV64A40_REG_TIMINGS_VTS_MID    CCI_REG8(0x380e)
> > +#define OV64A40_REG_TIMINGS_VTS_LOW    CCI_REG8(0x380f)
> > +
> > +/* The test pattern control is weirdly named PRE_ISP_2325_D2V2_TOP_1 in TRM. */
> > +#define OV64A40_REG_TEST_PATTERN       CCI_REG8(0x50c1)
> > +#define OV64A40_TEST_PATTERN_DISABLED  0x00
> > +#define OV64A40_TEST_PATTERN_TYPE1     BIT(0)
> > +#define OV64A40_TEST_PATTERN_TYPE2     (BIT(4) | BIT(0))
> > +#define OV64A40_TEST_PATTERN_TYPE3     (BIT(5) | BIT(0))
> > +#define OV64A40_TEST_PATTERN_TYPE4     (BIT(5) | BIT(4) | BIT(0))
> > +
> > +#define OV64A40_REG_CHIP_ID            CCI_REG24(0x300a)
> > +#define OV64A40_CHIP_ID                        0x566441
> > +
> > +#define OV64A40_REG_SMIA               CCI_REG8(0x0100)
> > +#define OV64A40_REG_SMIA_STREAMING     BIT(0)
> > +
> > +enum ov64a40_link_freq_ids {
> > +       OV64A40_LINK_FREQ_456M_ID,
> > +       OV64A40_LINK_FREQ_360M_ID,
> > +       OV64A40_NUM_LINK_FREQ,
> > +};
> > +
> > +static const char * const ov64a40_supply_names[] = {
> > +       /* Supplies can be enabled in any order */
> > +       "avdd",         /* Analog (2.8V) supply */
> > +       "dovdd",        /* Digital Core (1.8V) supply */
> > +       "dvdd",         /* IF (1.1V) supply */
> > +};
> > +
> > +static const char * const ov64a40_test_pattern_menu[] = {
> > +       "Disabled",
> > +       "Type1",
> > +       "Type2",
> > +       "Type3",
> > +       "Type4",
> > +};
> > +
> > +static const int ov64a40_test_pattern_val[] = {
> > +       OV64A40_TEST_PATTERN_DISABLED,
> > +       OV64A40_TEST_PATTERN_TYPE1,
> > +       OV64A40_TEST_PATTERN_TYPE2,
> > +       OV64A40_TEST_PATTERN_TYPE3,
> > +       OV64A40_TEST_PATTERN_TYPE4,
> > +};
> > +
> > +static const unsigned int ov64a40_mbus_codes[] = {
> > +       MEDIA_BUS_FMT_SBGGR10_1X10,
> > +       MEDIA_BUS_FMT_SGRBG10_1X10,
> > +       MEDIA_BUS_FMT_SGBRG10_1X10,
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_init[] = {
> > +       { CCI_REG8(0x0103), 0x01 }, { CCI_REG8(0x0301), 0x88 },
> > +       { CCI_REG8(0x0304), 0x00 }, { CCI_REG8(0x0305), 0x96 },
> > +       { CCI_REG8(0x0306), 0x03 }, { CCI_REG8(0x0307), 0x00 },
> > +       { CCI_REG8(0x0345), 0x2c }, { CCI_REG8(0x034a), 0x02 },
> > +       { CCI_REG8(0x034b), 0x02 }, { CCI_REG8(0x0350), 0xc0 },
> > +       { CCI_REG8(0x0360), 0x09 }, { CCI_REG8(0x3012), 0x31 },
> > +       { CCI_REG8(0x3015), 0xf0 }, { CCI_REG8(0x3017), 0xf0 },
> > +       { CCI_REG8(0x301d), 0xf6 }, { CCI_REG8(0x301e), 0xf1 },
> > +       { CCI_REG8(0x3022), 0xf0 }, { CCI_REG8(0x3400), 0x08 },
> > +       { CCI_REG8(0x3608), 0x41 }, { CCI_REG8(0x3421), 0x02 },
> > +       { CCI_REG8(0x3500), 0x00 }, { CCI_REG8(0x3501), 0x00 },
> > +       { CCI_REG8(0x3502), 0x18 }, { CCI_REG8(0x3504), 0x0c },
> > +       { CCI_REG8(0x3508), 0x01 }, { CCI_REG8(0x3509), 0x00 },
> > +       { CCI_REG8(0x350a), 0x01 }, { CCI_REG8(0x350b), 0x00 },
> > +       { CCI_REG8(0x350b), 0x00 }, { CCI_REG8(0x3540), 0x00 },
> > +       { CCI_REG8(0x3541), 0x00 }, { CCI_REG8(0x3542), 0x08 },
> > +       { CCI_REG8(0x3548), 0x01 }, { CCI_REG8(0x3549), 0xa0 },
> > +       { CCI_REG8(0x3549), 0x00 }, { CCI_REG8(0x3549), 0x00 },
> > +       { CCI_REG8(0x3549), 0x00 }, { CCI_REG8(0x3580), 0x00 },
> > +       { CCI_REG8(0x3581), 0x00 }, { CCI_REG8(0x3582), 0x04 },
> > +       { CCI_REG8(0x3588), 0x01 }, { CCI_REG8(0x3589), 0xf0 },
> > +       { CCI_REG8(0x3589), 0x00 }, { CCI_REG8(0x3589), 0x00 },
> > +       { CCI_REG8(0x3589), 0x00 }, { CCI_REG8(0x360d), 0x83 },
> > +       { CCI_REG8(0x3616), 0xa0 }, { CCI_REG8(0x3617), 0x31 },
> > +       { CCI_REG8(0x3623), 0x10 }, { CCI_REG8(0x3633), 0x03 },
> > +       { CCI_REG8(0x3634), 0x03 }, { CCI_REG8(0x3635), 0x77 },
> > +       { CCI_REG8(0x3640), 0x19 }, { CCI_REG8(0x3641), 0x80 },
> > +       { CCI_REG8(0x364d), 0x0f }, { CCI_REG8(0x3680), 0x80 },
> > +       { CCI_REG8(0x3682), 0x00 }, { CCI_REG8(0x3683), 0x00 },
> > +       { CCI_REG8(0x3684), 0x07 }, { CCI_REG8(0x3688), 0x01 },
> > +       { CCI_REG8(0x3689), 0x08 }, { CCI_REG8(0x368a), 0x26 },
> > +       { CCI_REG8(0x368b), 0xc8 }, { CCI_REG8(0x368e), 0x70 },
> > +       { CCI_REG8(0x368f), 0x00 }, { CCI_REG8(0x3692), 0x04 },
> > +       { CCI_REG8(0x3693), 0x00 }, { CCI_REG8(0x3696), 0xd1 },
> > +       { CCI_REG8(0x3697), 0xe0 }, { CCI_REG8(0x3698), 0x80 },
> > +       { CCI_REG8(0x3699), 0x2b }, { CCI_REG8(0x369a), 0x00 },
> > +       { CCI_REG8(0x369d), 0x00 }, { CCI_REG8(0x369e), 0x14 },
> > +       { CCI_REG8(0x369f), 0x20 }, { CCI_REG8(0x36a5), 0x80 },
> > +       { CCI_REG8(0x36a6), 0x00 }, { CCI_REG8(0x36a7), 0x00 },
> > +       { CCI_REG8(0x36a8), 0x00 }, { CCI_REG8(0x36b5), 0x17 },
> > +       { CCI_REG8(0x3701), 0x30 }, { CCI_REG8(0x3706), 0x2b },
> > +       { CCI_REG8(0x3709), 0x8d }, { CCI_REG8(0x370b), 0x4f },
> > +       { CCI_REG8(0x3711), 0x00 }, { CCI_REG8(0x3712), 0x01 },
> > +       { CCI_REG8(0x3713), 0x00 }, { CCI_REG8(0x3720), 0x08 },
> > +       { CCI_REG8(0x3727), 0x22 }, { CCI_REG8(0x3728), 0x01 },
> > +       { CCI_REG8(0x375e), 0x00 }, { CCI_REG8(0x3760), 0x08 },
> > +       { CCI_REG8(0x3761), 0x10 }, { CCI_REG8(0x3762), 0x08 },
> > +       { CCI_REG8(0x3765), 0x10 }, { CCI_REG8(0x3766), 0x18 },
> > +       { CCI_REG8(0x376a), 0x08 }, { CCI_REG8(0x376b), 0x00 },
> > +       { CCI_REG8(0x376d), 0x1b }, { CCI_REG8(0x3791), 0x2b },
> > +       { CCI_REG8(0x3793), 0x2b }, { CCI_REG8(0x3795), 0x2b },
> > +       { CCI_REG8(0x3797), 0x4f }, { CCI_REG8(0x3799), 0x4f },
> > +       { CCI_REG8(0x379b), 0x4f }, { CCI_REG8(0x37a0), 0x22 },
> > +       { CCI_REG8(0x37da), 0x04 }, { CCI_REG8(0x37f9), 0x02 },
> > +       { CCI_REG8(0x37fa), 0x02 }, { CCI_REG8(0x37fb), 0x02 },
> > +       { CCI_REG8(0x3814), 0x11 }, { CCI_REG8(0x3815), 0x11 },
> > +       { CCI_REG8(0x3820), 0x40 }, { CCI_REG8(0x3821), 0x04 },
> > +       { CCI_REG8(0x3822), 0x00 }, { CCI_REG8(0x3823), 0x04 },
> > +       { CCI_REG8(0x3827), 0x08 }, { CCI_REG8(0x3828), 0x00 },
> > +       { CCI_REG8(0x382a), 0x81 }, { CCI_REG8(0x382e), 0x70 },
> > +       { CCI_REG8(0x3837), 0x10 }, { CCI_REG8(0x3839), 0x00 },
> > +       { CCI_REG8(0x383b), 0x00 }, { CCI_REG8(0x383c), 0x00 },
> > +       { CCI_REG8(0x383d), 0x10 }, { CCI_REG8(0x383f), 0x00 },
> > +       { CCI_REG8(0x384c), 0x02 }, { CCI_REG8(0x384d), 0x8c },
> > +       { CCI_REG8(0x3852), 0x00 }, { CCI_REG8(0x3856), 0x10 },
> > +       { CCI_REG8(0x3857), 0x10 }, { CCI_REG8(0x3858), 0x20 },
> > +       { CCI_REG8(0x3859), 0x20 }, { CCI_REG8(0x3894), 0x00 },
> > +       { CCI_REG8(0x3895), 0x00 }, { CCI_REG8(0x3896), 0x00 },
> > +       { CCI_REG8(0x3897), 0x00 }, { CCI_REG8(0x3900), 0x40 },
> > +       { CCI_REG8(0x3aed), 0x6e }, { CCI_REG8(0x3af1), 0x73 },
> > +       { CCI_REG8(0x3d86), 0x12 }, { CCI_REG8(0x3d87), 0x30 },
> > +       { CCI_REG8(0x3d8c), 0xab }, { CCI_REG8(0x3d8d), 0xb0 },
> > +       { CCI_REG8(0x3f00), 0x12 }, { CCI_REG8(0x3f00), 0x12 },
> > +       { CCI_REG8(0x3f00), 0x12 }, { CCI_REG8(0x3f01), 0x03 },
> > +       { CCI_REG8(0x4009), 0x01 }, { CCI_REG8(0x400e), 0xc6 },
> > +       { CCI_REG8(0x400f), 0x00 }, { CCI_REG8(0x4010), 0x28 },
> > +       { CCI_REG8(0x4011), 0x01 }, { CCI_REG8(0x4012), 0x0c },
> > +       { CCI_REG8(0x4015), 0x00 }, { CCI_REG8(0x4016), 0x1f },
> > +       { CCI_REG8(0x4017), 0x00 }, { CCI_REG8(0x4018), 0x07 },
> > +       { CCI_REG8(0x401a), 0x40 }, { CCI_REG8(0x4028), 0x01 },
> > +       { CCI_REG8(0x4504), 0x00 }, { CCI_REG8(0x4506), 0x01 },
> > +       { CCI_REG8(0x4508), 0x00 }, { CCI_REG8(0x4509), 0x35 },
> > +       { CCI_REG8(0x450a), 0x08 }, { CCI_REG8(0x450c), 0x00 },
> > +       { CCI_REG8(0x450d), 0x20 }, { CCI_REG8(0x450e), 0x00 },
> > +       { CCI_REG8(0x450f), 0x20 }, { CCI_REG8(0x451e), 0x00 },
> > +       { CCI_REG8(0x451f), 0x00 }, { CCI_REG8(0x4523), 0x00 },
> > +       { CCI_REG8(0x4526), 0x00 }, { CCI_REG8(0x4527), 0x18 },
> > +       { CCI_REG8(0x4580), 0x01 }, { CCI_REG8(0x4583), 0x00 },
> > +       { CCI_REG8(0x4584), 0x00 }, { CCI_REG8(0x45c0), 0xa1 },
> > +       { CCI_REG8(0x4602), 0x08 }, { CCI_REG8(0x4603), 0x05 },
> > +       { CCI_REG8(0x4606), 0x12 }, { CCI_REG8(0x4607), 0x30 },
> > +       { CCI_REG8(0x460b), 0x00 }, { CCI_REG8(0x460d), 0x00 },
> > +       { CCI_REG8(0x4640), 0x00 }, { CCI_REG8(0x4641), 0x24 },
> > +       { CCI_REG8(0x4643), 0x08 }, { CCI_REG8(0x4645), 0x14 },
> > +       { CCI_REG8(0x4648), 0x0a }, { CCI_REG8(0x4649), 0x06 },
> > +       { CCI_REG8(0x464a), 0x00 }, { CCI_REG8(0x464b), 0x30 },
> > +       { CCI_REG8(0x4800), 0x04 }, { CCI_REG8(0x4802), 0x02 },
> > +       { CCI_REG8(0x480b), 0x10 }, { CCI_REG8(0x480c), 0x80 },
> > +       { CCI_REG8(0x480e), 0x04 }, { CCI_REG8(0x480f), 0x32 },
> > +       { CCI_REG8(0x481b), 0x12 }, { CCI_REG8(0x4833), 0x30 },
> > +       { CCI_REG8(0x4837), 0x08 }, { CCI_REG8(0x484b), 0x27 },
> > +       { CCI_REG8(0x4850), 0x42 }, { CCI_REG8(0x4851), 0xaa },
> > +       { CCI_REG8(0x4860), 0x01 }, { CCI_REG8(0x4861), 0xec },
> > +       { CCI_REG8(0x4862), 0x25 }, { CCI_REG8(0x4888), 0x00 },
> > +       { CCI_REG8(0x4889), 0x03 }, { CCI_REG8(0x488c), 0x60 },
> > +       { CCI_REG8(0x4910), 0x28 }, { CCI_REG8(0x4911), 0x01 },
> > +       { CCI_REG8(0x4912), 0x0c }, { CCI_REG8(0x491a), 0x40 },
> > +       { CCI_REG8(0x4915), 0x00 }, { CCI_REG8(0x4916), 0x0f },
> > +       { CCI_REG8(0x4917), 0x00 }, { CCI_REG8(0x4918), 0x07 },
> > +       { CCI_REG8(0x4a10), 0x28 }, { CCI_REG8(0x4a11), 0x01 },
> > +       { CCI_REG8(0x4a12), 0x0c }, { CCI_REG8(0x4a1a), 0x40 },
> > +       { CCI_REG8(0x4a15), 0x00 }, { CCI_REG8(0x4a16), 0x0f },
> > +       { CCI_REG8(0x4a17), 0x00 }, { CCI_REG8(0x4a18), 0x07 },
> > +       { CCI_REG8(0x4d00), 0x04 }, { CCI_REG8(0x4d01), 0x5a },
> > +       { CCI_REG8(0x4d02), 0xbb }, { CCI_REG8(0x4d03), 0x84 },
> > +       { CCI_REG8(0x4d04), 0xd1 }, { CCI_REG8(0x4d05), 0x68 },
> > +       { CCI_REG8(0xc4fa), 0x10 }, { CCI_REG8(0x3b56), 0x0a },
> > +       { CCI_REG8(0x3b57), 0x0a }, { CCI_REG8(0x3b58), 0x0c },
> > +       { CCI_REG8(0x3b59), 0x10 }, { CCI_REG8(0x3a1d), 0x30 },
> > +       { CCI_REG8(0x3a1e), 0x30 }, { CCI_REG8(0x3a21), 0x30 },
> > +       { CCI_REG8(0x3a22), 0x30 }, { CCI_REG8(0x3992), 0x02 },
> > +       { CCI_REG8(0x399e), 0x02 }, { CCI_REG8(0x39fb), 0x30 },
> > +       { CCI_REG8(0x39fc), 0x30 }, { CCI_REG8(0x39fd), 0x30 },
> > +       { CCI_REG8(0x39fe), 0x30 }, { CCI_REG8(0x3a6d), 0x83 },
> > +       { CCI_REG8(0x3a5e), 0x83 }, { CCI_REG8(0xc500), 0x12 },
> > +       { CCI_REG8(0xc501), 0x12 }, { CCI_REG8(0xc502), 0x12 },
> > +       { CCI_REG8(0xc503), 0x12 }, { CCI_REG8(0xc505), 0x12 },
> > +       { CCI_REG8(0xc506), 0x12 }, { CCI_REG8(0xc507), 0x12 },
> > +       { CCI_REG8(0xc508), 0x12 }, { CCI_REG8(0x3a77), 0x12 },
> > +       { CCI_REG8(0x3a73), 0x12 }, { CCI_REG8(0x3a7b), 0x12 },
> > +       { CCI_REG8(0x3a7f), 0x12 }, { CCI_REG8(0x3b2e), 0x13 },
> > +       { CCI_REG8(0x3b29), 0x13 }, { CCI_REG8(0xc439), 0x13 },
> > +       { CCI_REG8(0xc469), 0x13 }, { CCI_REG8(0xc41c), 0x89 },
> > +       { CCI_REG8(0x3618), 0x80 }, { CCI_REG8(0xc514), 0x51 },
> > +       { CCI_REG8(0xc515), 0x2c }, { CCI_REG8(0xc516), 0x16 },
> > +       { CCI_REG8(0xc517), 0x0d }, { CCI_REG8(0x3615), 0x7f },
> > +       { CCI_REG8(0x3632), 0x99 }, { CCI_REG8(0x3642), 0x00 },
> > +       { CCI_REG8(0x3645), 0x80 }, { CCI_REG8(0x3702), 0x2a },
> > +       { CCI_REG8(0x3703), 0x2a }, { CCI_REG8(0x3708), 0x2f },
> > +       { CCI_REG8(0x3721), 0x15 }, { CCI_REG8(0x3744), 0x28 },
> > +       { CCI_REG8(0x3991), 0x0c }, { CCI_REG8(0x371d), 0x24 },
> > +       { CCI_REG8(0x371f), 0x0c }, { CCI_REG8(0x374b), 0x03 },
> > +       { CCI_REG8(0x37d0), 0x00 }, { CCI_REG8(0x391d), 0x55 },
> > +       { CCI_REG8(0x391e), 0x52 }, { CCI_REG8(0x399d), 0x0c },
> > +       { CCI_REG8(0x3a2f), 0x01 }, { CCI_REG8(0x3a30), 0x01 },
> > +       { CCI_REG8(0x3a31), 0x01 }, { CCI_REG8(0x3a32), 0x01 },
> > +       { CCI_REG8(0x3a34), 0x01 }, { CCI_REG8(0x3a35), 0x01 },
> > +       { CCI_REG8(0x3a36), 0x01 }, { CCI_REG8(0x3a37), 0x01 },
> > +       { CCI_REG8(0x3a43), 0x01 }, { CCI_REG8(0x3a44), 0x01 },
> > +       { CCI_REG8(0x3a45), 0x01 }, { CCI_REG8(0x3a46), 0x01 },
> > +       { CCI_REG8(0x3a48), 0x01 }, { CCI_REG8(0x3a49), 0x01 },
> > +       { CCI_REG8(0x3a4a), 0x01 }, { CCI_REG8(0x3a4b), 0x01 },
> > +       { CCI_REG8(0x3a50), 0x14 }, { CCI_REG8(0x3a54), 0x14 },
> > +       { CCI_REG8(0x3a60), 0x20 }, { CCI_REG8(0x3a6f), 0x20 },
> > +       { CCI_REG8(0x3ac5), 0x01 }, { CCI_REG8(0x3ac6), 0x01 },
> > +       { CCI_REG8(0x3ac7), 0x01 }, { CCI_REG8(0x3ac8), 0x01 },
> > +       { CCI_REG8(0x3ac9), 0x01 }, { CCI_REG8(0x3aca), 0x01 },
> > +       { CCI_REG8(0x3acb), 0x01 }, { CCI_REG8(0x3acc), 0x01 },
> > +       { CCI_REG8(0x3acd), 0x01 }, { CCI_REG8(0x3ace), 0x01 },
> > +       { CCI_REG8(0x3acf), 0x01 }, { CCI_REG8(0x3ad0), 0x01 },
> > +       { CCI_REG8(0x3ad1), 0x01 }, { CCI_REG8(0x3ad2), 0x01 },
> > +       { CCI_REG8(0x3ad3), 0x01 }, { CCI_REG8(0x3ad4), 0x01 },
> > +       { CCI_REG8(0x3add), 0x1f }, { CCI_REG8(0x3adf), 0x24 },
> > +       { CCI_REG8(0x3aef), 0x1f }, { CCI_REG8(0x3af0), 0x24 },
> > +       { CCI_REG8(0x3b92), 0x08 }, { CCI_REG8(0x3b93), 0x08 },
> > +       { CCI_REG8(0x3b94), 0x08 }, { CCI_REG8(0x3b95), 0x08 },
> > +       { CCI_REG8(0x3be7), 0x1e }, { CCI_REG8(0x3be8), 0x26 },
> > +       { CCI_REG8(0xc44a), 0x20 }, { CCI_REG8(0xc44c), 0x20 },
> > +       { CCI_REG8(0xc483), 0x00 }, { CCI_REG8(0xc484), 0x00 },
> > +       { CCI_REG8(0xc485), 0x00 }, { CCI_REG8(0xc486), 0x00 },
> > +       { CCI_REG8(0xc487), 0x01 }, { CCI_REG8(0xc488), 0x01 },
> > +       { CCI_REG8(0xc489), 0x01 }, { CCI_REG8(0xc48a), 0x01 },
> > +       { CCI_REG8(0xc4c1), 0x00 }, { CCI_REG8(0xc4c2), 0x00 },
> > +       { CCI_REG8(0xc4c3), 0x00 }, { CCI_REG8(0xc4c4), 0x00 },
> > +       { CCI_REG8(0xc4c6), 0x10 }, { CCI_REG8(0xc4c7), 0x10 },
> > +       { CCI_REG8(0xc4c8), 0x10 }, { CCI_REG8(0xc4c9), 0x10 },
> > +       { CCI_REG8(0xc4ca), 0x10 }, { CCI_REG8(0xc4cb), 0x10 },
> > +       { CCI_REG8(0xc4cc), 0x10 }, { CCI_REG8(0xc4cd), 0x10 },
> > +       { CCI_REG8(0xc4ea), 0x07 }, { CCI_REG8(0xc4eb), 0x07 },
> > +       { CCI_REG8(0xc4ec), 0x07 }, { CCI_REG8(0xc4ed), 0x07 },
> > +       { CCI_REG8(0xc4ee), 0x07 }, { CCI_REG8(0xc4f6), 0x10 },
> > +       { CCI_REG8(0xc4f7), 0x10 }, { CCI_REG8(0xc4f8), 0x10 },
> > +       { CCI_REG8(0xc4f9), 0x10 }, { CCI_REG8(0xc518), 0x0e },
> > +       { CCI_REG8(0xc519), 0x0e }, { CCI_REG8(0xc51a), 0x0e },
> > +       { CCI_REG8(0xc51b), 0x0e }, { CCI_REG8(0xc51c), 0x0e },
> > +       { CCI_REG8(0xc51d), 0x0e }, { CCI_REG8(0xc51e), 0x0e },
> > +       { CCI_REG8(0xc51f), 0x0e }, { CCI_REG8(0xc520), 0x0e },
> > +       { CCI_REG8(0xc521), 0x0e }, { CCI_REG8(0xc522), 0x0e },
> > +       { CCI_REG8(0xc523), 0x0e }, { CCI_REG8(0xc524), 0x0e },
> > +       { CCI_REG8(0xc525), 0x0e }, { CCI_REG8(0xc526), 0x0e },
> > +       { CCI_REG8(0xc527), 0x0e }, { CCI_REG8(0xc528), 0x0e },
> > +       { CCI_REG8(0xc529), 0x0e }, { CCI_REG8(0xc52a), 0x0e },
> > +       { CCI_REG8(0xc52b), 0x0e }, { CCI_REG8(0xc52c), 0x0e },
> > +       { CCI_REG8(0xc52d), 0x0e }, { CCI_REG8(0xc52e), 0x0e },
> > +       { CCI_REG8(0xc52f), 0x0e }, { CCI_REG8(0xc530), 0x0e },
> > +       { CCI_REG8(0xc531), 0x0e }, { CCI_REG8(0xc532), 0x0e },
> > +       { CCI_REG8(0xc533), 0x0e }, { CCI_REG8(0xc534), 0x0e },
> > +       { CCI_REG8(0xc535), 0x0e }, { CCI_REG8(0xc536), 0x0e },
> > +       { CCI_REG8(0xc537), 0x0e }, { CCI_REG8(0xc538), 0x0e },
> > +       { CCI_REG8(0xc539), 0x0e }, { CCI_REG8(0xc53a), 0x0e },
> > +       { CCI_REG8(0xc53b), 0x0e }, { CCI_REG8(0xc53c), 0x0e },
> > +       { CCI_REG8(0xc53d), 0x0e }, { CCI_REG8(0xc53e), 0x0e },
> > +       { CCI_REG8(0xc53f), 0x0e }, { CCI_REG8(0xc540), 0x0e },
> > +       { CCI_REG8(0xc541), 0x0e }, { CCI_REG8(0xc542), 0x0e },
> > +       { CCI_REG8(0xc543), 0x0e }, { CCI_REG8(0xc544), 0x0e },
> > +       { CCI_REG8(0xc545), 0x0e }, { CCI_REG8(0xc546), 0x0e },
> > +       { CCI_REG8(0xc547), 0x0e }, { CCI_REG8(0xc548), 0x0e },
> > +       { CCI_REG8(0xc549), 0x0e }, { CCI_REG8(0xc57f), 0x22 },
> > +       { CCI_REG8(0xc580), 0x22 }, { CCI_REG8(0xc581), 0x22 },
> > +       { CCI_REG8(0xc582), 0x22 }, { CCI_REG8(0xc583), 0x22 },
> > +       { CCI_REG8(0xc584), 0x22 }, { CCI_REG8(0xc585), 0x22 },
> > +       { CCI_REG8(0xc586), 0x22 }, { CCI_REG8(0xc587), 0x22 },
> > +       { CCI_REG8(0xc588), 0x22 }, { CCI_REG8(0xc589), 0x22 },
> > +       { CCI_REG8(0xc58a), 0x22 }, { CCI_REG8(0xc58b), 0x22 },
> > +       { CCI_REG8(0xc58c), 0x22 }, { CCI_REG8(0xc58d), 0x22 },
> > +       { CCI_REG8(0xc58e), 0x22 }, { CCI_REG8(0xc58f), 0x22 },
> > +       { CCI_REG8(0xc590), 0x22 }, { CCI_REG8(0xc591), 0x22 },
> > +       { CCI_REG8(0xc592), 0x22 }, { CCI_REG8(0xc598), 0x22 },
> > +       { CCI_REG8(0xc599), 0x22 }, { CCI_REG8(0xc59a), 0x22 },
> > +       { CCI_REG8(0xc59b), 0x22 }, { CCI_REG8(0xc59c), 0x22 },
> > +       { CCI_REG8(0xc59d), 0x22 }, { CCI_REG8(0xc59e), 0x22 },
> > +       { CCI_REG8(0xc59f), 0x22 }, { CCI_REG8(0xc5a0), 0x22 },
> > +       { CCI_REG8(0xc5a1), 0x22 }, { CCI_REG8(0xc5a2), 0x22 },
> > +       { CCI_REG8(0xc5a3), 0x22 }, { CCI_REG8(0xc5a4), 0x22 },
> > +       { CCI_REG8(0xc5a5), 0x22 }, { CCI_REG8(0xc5a6), 0x22 },
> > +       { CCI_REG8(0xc5a7), 0x22 }, { CCI_REG8(0xc5a8), 0x22 },
> > +       { CCI_REG8(0xc5a9), 0x22 }, { CCI_REG8(0xc5aa), 0x22 },
> > +       { CCI_REG8(0xc5ab), 0x22 }, { CCI_REG8(0xc5b1), 0x2a },
> > +       { CCI_REG8(0xc5b2), 0x2a }, { CCI_REG8(0xc5b3), 0x2a },
> > +       { CCI_REG8(0xc5b4), 0x2a }, { CCI_REG8(0xc5b5), 0x2a },
> > +       { CCI_REG8(0xc5b6), 0x2a }, { CCI_REG8(0xc5b7), 0x2a },
> > +       { CCI_REG8(0xc5b8), 0x2a }, { CCI_REG8(0xc5b9), 0x2a },
> > +       { CCI_REG8(0xc5ba), 0x2a }, { CCI_REG8(0xc5bb), 0x2a },
> > +       { CCI_REG8(0xc5bc), 0x2a }, { CCI_REG8(0xc5bd), 0x2a },
> > +       { CCI_REG8(0xc5be), 0x2a }, { CCI_REG8(0xc5bf), 0x2a },
> > +       { CCI_REG8(0xc5c0), 0x2a }, { CCI_REG8(0xc5c1), 0x2a },
> > +       { CCI_REG8(0xc5c2), 0x2a }, { CCI_REG8(0xc5c3), 0x2a },
> > +       { CCI_REG8(0xc5c4), 0x2a }, { CCI_REG8(0xc5ca), 0x2a },
> > +       { CCI_REG8(0xc5cb), 0x2a }, { CCI_REG8(0xc5cc), 0x2a },
> > +       { CCI_REG8(0xc5cd), 0x2a }, { CCI_REG8(0xc5ce), 0x2a },
> > +       { CCI_REG8(0xc5cf), 0x2a }, { CCI_REG8(0xc5d0), 0x2a },
> > +       { CCI_REG8(0xc5d1), 0x2a }, { CCI_REG8(0xc5d2), 0x2a },
> > +       { CCI_REG8(0xc5d3), 0x2a }, { CCI_REG8(0xc5d4), 0x2a },
> > +       { CCI_REG8(0xc5d5), 0x2a }, { CCI_REG8(0xc5d6), 0x2a },
> > +       { CCI_REG8(0xc5d7), 0x2a }, { CCI_REG8(0xc5d8), 0x2a },
> > +       { CCI_REG8(0xc5d9), 0x2a }, { CCI_REG8(0xc5da), 0x2a },
> > +       { CCI_REG8(0xc5db), 0x2a }, { CCI_REG8(0xc5dc), 0x2a },
> > +       { CCI_REG8(0xc5dd), 0x2a }, { CCI_REG8(0xc5e8), 0x22 },
> > +       { CCI_REG8(0xc5ea), 0x22 }, { CCI_REG8(0x4540), 0x12 },
> > +       { CCI_REG8(0x4541), 0x30 }, { CCI_REG8(0x3d86), 0x12 },
> > +       { CCI_REG8(0x3d87), 0x30 }, { CCI_REG8(0x4606), 0x12 },
> > +       { CCI_REG8(0x4607), 0x30 }, { CCI_REG8(0x4648), 0x0a },
> > +       { CCI_REG8(0x4649), 0x06 }, { CCI_REG8(0x3220), 0x12 },
> > +       { CCI_REG8(0x3221), 0x30 }, { CCI_REG8(0x40c2), 0x12 },
> > +       { CCI_REG8(0x49c2), 0x12 }, { CCI_REG8(0x4ac2), 0x12 },
> > +       { CCI_REG8(0x40c3), 0x30 }, { CCI_REG8(0x49c3), 0x30 },
> > +       { CCI_REG8(0x4ac3), 0x30 }, { CCI_REG8(0x36b0), 0x12 },
> > +       { CCI_REG8(0x36b1), 0x30 }, { CCI_REG8(0x45cb), 0x12 },
> > +       { CCI_REG8(0x45cc), 0x30 }, { CCI_REG8(0x4585), 0x12 },
> > +       { CCI_REG8(0x4586), 0x30 }, { CCI_REG8(0x36b2), 0x12 },
> > +       { CCI_REG8(0x36b3), 0x30 }, { CCI_REG8(0x5a40), 0x75 },
> > +       { CCI_REG8(0x5a41), 0x75 }, { CCI_REG8(0x5a42), 0x75 },
> > +       { CCI_REG8(0x5a43), 0x75 }, { CCI_REG8(0x5a44), 0x75 },
> > +       { CCI_REG8(0x5a45), 0x75 }, { CCI_REG8(0x5a46), 0x75 },
> > +       { CCI_REG8(0x5a47), 0x75 }, { CCI_REG8(0x5a48), 0x75 },
> > +       { CCI_REG8(0x5a49), 0x75 }, { CCI_REG8(0x5a4a), 0x75 },
> > +       { CCI_REG8(0x5a4b), 0x75 }, { CCI_REG8(0x5a4c), 0x75 },
> > +       { CCI_REG8(0x5a4d), 0x75 }, { CCI_REG8(0x5a4e), 0x75 },
> > +       { CCI_REG8(0x5a4f), 0x75 }, { CCI_REG8(0x5a50), 0x75 },
> > +       { CCI_REG8(0x5a51), 0x75 }, { CCI_REG8(0x5a52), 0x75 },
> > +       { CCI_REG8(0x5a53), 0x75 }, { CCI_REG8(0x5a54), 0x75 },
> > +       { CCI_REG8(0x5a55), 0x75 }, { CCI_REG8(0x5a56), 0x75 },
> > +       { CCI_REG8(0x5a57), 0x75 }, { CCI_REG8(0x5a58), 0x75 },
> > +       { CCI_REG8(0x5a59), 0x75 }, { CCI_REG8(0x5a5a), 0x75 },
> > +       { CCI_REG8(0x5a5b), 0x75 }, { CCI_REG8(0x5a5c), 0x75 },
> > +       { CCI_REG8(0x5a5d), 0x75 }, { CCI_REG8(0x5a5e), 0x75 },
> > +       { CCI_REG8(0x5a5f), 0x75 }, { CCI_REG8(0x5a60), 0x75 },
> > +       { CCI_REG8(0x5a61), 0x75 }, { CCI_REG8(0x5a62), 0x75 },
> > +       { CCI_REG8(0x5a63), 0x75 }, { CCI_REG8(0x5a64), 0x75 },
> > +       { CCI_REG8(0x5a65), 0x75 }, { CCI_REG8(0x5a66), 0x75 },
> > +       { CCI_REG8(0x5a67), 0x75 }, { CCI_REG8(0x5a68), 0x75 },
> > +       { CCI_REG8(0x5a69), 0x75 }, { CCI_REG8(0x5a6a), 0x75 },
> > +       { CCI_REG8(0x5a6b), 0x75 }, { CCI_REG8(0x5a6c), 0x75 },
> > +       { CCI_REG8(0x5a6d), 0x75 }, { CCI_REG8(0x5a6e), 0x75 },
> > +       { CCI_REG8(0x5a6f), 0x75 }, { CCI_REG8(0x5a70), 0x75 },
> > +       { CCI_REG8(0x5a71), 0x75 }, { CCI_REG8(0x5a72), 0x75 },
> > +       { CCI_REG8(0x5a73), 0x75 }, { CCI_REG8(0x5a74), 0x75 },
> > +       { CCI_REG8(0x5a75), 0x75 }, { CCI_REG8(0x5a76), 0x75 },
> > +       { CCI_REG8(0x5a77), 0x75 }, { CCI_REG8(0x5a78), 0x75 },
> > +       { CCI_REG8(0x5a79), 0x75 }, { CCI_REG8(0x5a7a), 0x75 },
> > +       { CCI_REG8(0x5a7b), 0x75 }, { CCI_REG8(0x5a7c), 0x75 },
> > +       { CCI_REG8(0x5a7d), 0x75 }, { CCI_REG8(0x5a7e), 0x75 },
> > +       { CCI_REG8(0x5a7f), 0x75 }, { CCI_REG8(0x5a80), 0x75 },
> > +       { CCI_REG8(0x5a81), 0x75 }, { CCI_REG8(0x5a82), 0x75 },
> > +       { CCI_REG8(0x5a83), 0x75 }, { CCI_REG8(0x5a84), 0x75 },
> > +       { CCI_REG8(0x5a85), 0x75 }, { CCI_REG8(0x5a86), 0x75 },
> > +       { CCI_REG8(0x5a87), 0x75 }, { CCI_REG8(0x5a88), 0x75 },
> > +       { CCI_REG8(0x5a89), 0x75 }, { CCI_REG8(0x5a8a), 0x75 },
> > +       { CCI_REG8(0x5a8b), 0x75 }, { CCI_REG8(0x5a8c), 0x75 },
> > +       { CCI_REG8(0x5a8d), 0x75 }, { CCI_REG8(0x5a8e), 0x75 },
> > +       { CCI_REG8(0x5a8f), 0x75 }, { CCI_REG8(0x5a90), 0x75 },
> > +       { CCI_REG8(0x5a91), 0x75 }, { CCI_REG8(0x5a92), 0x75 },
> > +       { CCI_REG8(0x5a93), 0x75 }, { CCI_REG8(0x5a94), 0x75 },
> > +       { CCI_REG8(0x5a95), 0x75 }, { CCI_REG8(0x5a96), 0x75 },
> > +       { CCI_REG8(0x5a97), 0x75 }, { CCI_REG8(0x5a98), 0x75 },
> > +       { CCI_REG8(0x5a99), 0x75 }, { CCI_REG8(0x5a9a), 0x75 },
> > +       { CCI_REG8(0x5a9b), 0x75 }, { CCI_REG8(0x5a9c), 0x75 },
> > +       { CCI_REG8(0x5a9d), 0x75 }, { CCI_REG8(0x5a9e), 0x75 },
> > +       { CCI_REG8(0x5a9f), 0x75 }, { CCI_REG8(0x5aa0), 0x75 },
> > +       { CCI_REG8(0x5aa1), 0x75 }, { CCI_REG8(0x5aa2), 0x75 },
> > +       { CCI_REG8(0x5aa3), 0x75 }, { CCI_REG8(0x5aa4), 0x75 },
> > +       { CCI_REG8(0x5aa5), 0x75 }, { CCI_REG8(0x5aa6), 0x75 },
> > +       { CCI_REG8(0x5aa7), 0x75 }, { CCI_REG8(0x5aa8), 0x75 },
> > +       { CCI_REG8(0x5aa9), 0x75 }, { CCI_REG8(0x5aaa), 0x75 },
> > +       { CCI_REG8(0x5aab), 0x75 }, { CCI_REG8(0x5aac), 0x75 },
> > +       { CCI_REG8(0x5aad), 0x75 }, { CCI_REG8(0x5aae), 0x75 },
> > +       { CCI_REG8(0x5aaf), 0x75 }, { CCI_REG8(0x5ab0), 0x75 },
> > +       { CCI_REG8(0x5ab1), 0x75 }, { CCI_REG8(0x5ab2), 0x75 },
> > +       { CCI_REG8(0x5ab3), 0x75 }, { CCI_REG8(0x5ab4), 0x75 },
> > +       { CCI_REG8(0x5ab5), 0x75 }, { CCI_REG8(0x5ab6), 0x75 },
> > +       { CCI_REG8(0x5ab7), 0x75 }, { CCI_REG8(0x5ab8), 0x75 },
> > +       { CCI_REG8(0x5ab9), 0x75 }, { CCI_REG8(0x5aba), 0x75 },
> > +       { CCI_REG8(0x5abb), 0x75 }, { CCI_REG8(0x5abc), 0x75 },
> > +       { CCI_REG8(0x5abd), 0x75 }, { CCI_REG8(0x5abe), 0x75 },
> > +       { CCI_REG8(0x5abf), 0x75 }, { CCI_REG8(0x5ac0), 0x75 },
> > +       { CCI_REG8(0x5ac1), 0x75 }, { CCI_REG8(0x5ac2), 0x75 },
> > +       { CCI_REG8(0x5ac3), 0x75 }, { CCI_REG8(0x5ac4), 0x75 },
> > +       { CCI_REG8(0x5ac5), 0x75 }, { CCI_REG8(0x5ac6), 0x75 },
> > +       { CCI_REG8(0x5ac7), 0x75 }, { CCI_REG8(0x5ac8), 0x75 },
> > +       { CCI_REG8(0x5ac9), 0x75 }, { CCI_REG8(0x5aca), 0x75 },
> > +       { CCI_REG8(0x5acb), 0x75 }, { CCI_REG8(0x5acc), 0x75 },
> > +       { CCI_REG8(0x5acd), 0x75 }, { CCI_REG8(0x5ace), 0x75 },
> > +       { CCI_REG8(0x5acf), 0x75 }, { CCI_REG8(0x5ad0), 0x75 },
> > +       { CCI_REG8(0x5ad1), 0x75 }, { CCI_REG8(0x5ad2), 0x75 },
> > +       { CCI_REG8(0x5ad3), 0x75 }, { CCI_REG8(0x5ad4), 0x75 },
> > +       { CCI_REG8(0x5ad5), 0x75 }, { CCI_REG8(0x5ad6), 0x75 },
> > +       { CCI_REG8(0x5ad7), 0x75 }, { CCI_REG8(0x5ad8), 0x75 },
> > +       { CCI_REG8(0x5ad9), 0x75 }, { CCI_REG8(0x5ada), 0x75 },
> > +       { CCI_REG8(0x5adb), 0x75 }, { CCI_REG8(0x5adc), 0x75 },
> > +       { CCI_REG8(0x5add), 0x75 }, { CCI_REG8(0x5ade), 0x75 },
> > +       { CCI_REG8(0x5adf), 0x75 }, { CCI_REG8(0x5ae0), 0x75 },
> > +       { CCI_REG8(0x5ae1), 0x75 }, { CCI_REG8(0x5ae2), 0x75 },
> > +       { CCI_REG8(0x5ae3), 0x75 }, { CCI_REG8(0x5ae4), 0x75 },
> > +       { CCI_REG8(0x5ae5), 0x75 }, { CCI_REG8(0x5ae6), 0x75 },
> > +       { CCI_REG8(0x5ae7), 0x75 }, { CCI_REG8(0x5ae8), 0x75 },
> > +       { CCI_REG8(0x5ae9), 0x75 }, { CCI_REG8(0x5aea), 0x75 },
> > +       { CCI_REG8(0x5aeb), 0x75 }, { CCI_REG8(0x5aec), 0x75 },
> > +       { CCI_REG8(0x5aed), 0x75 }, { CCI_REG8(0x5aee), 0x75 },
> > +       { CCI_REG8(0x5aef), 0x75 }, { CCI_REG8(0x5af0), 0x75 },
> > +       { CCI_REG8(0x5af1), 0x75 }, { CCI_REG8(0x5af2), 0x75 },
> > +       { CCI_REG8(0x5af3), 0x75 }, { CCI_REG8(0x5af4), 0x75 },
> > +       { CCI_REG8(0x5af5), 0x75 }, { CCI_REG8(0x5af6), 0x75 },
> > +       { CCI_REG8(0x5af7), 0x75 }, { CCI_REG8(0x5af8), 0x75 },
> > +       { CCI_REG8(0x5af9), 0x75 }, { CCI_REG8(0x5afa), 0x75 },
> > +       { CCI_REG8(0x5afb), 0x75 }, { CCI_REG8(0x5afc), 0x75 },
> > +       { CCI_REG8(0x5afd), 0x75 }, { CCI_REG8(0x5afe), 0x75 },
> > +       { CCI_REG8(0x5aff), 0x75 }, { CCI_REG8(0x5b00), 0x75 },
> > +       { CCI_REG8(0x5b01), 0x75 }, { CCI_REG8(0x5b02), 0x75 },
> > +       { CCI_REG8(0x5b03), 0x75 }, { CCI_REG8(0x5b04), 0x75 },
> > +       { CCI_REG8(0x5b05), 0x75 }, { CCI_REG8(0x5b06), 0x75 },
> > +       { CCI_REG8(0x5b07), 0x75 }, { CCI_REG8(0x5b08), 0x75 },
> > +       { CCI_REG8(0x5b09), 0x75 }, { CCI_REG8(0x5b0a), 0x75 },
> > +       { CCI_REG8(0x5b0b), 0x75 }, { CCI_REG8(0x5b0c), 0x75 },
> > +       { CCI_REG8(0x5b0d), 0x75 }, { CCI_REG8(0x5b0e), 0x75 },
> > +       { CCI_REG8(0x5b0f), 0x75 }, { CCI_REG8(0x5b10), 0x75 },
> > +       { CCI_REG8(0x5b11), 0x75 }, { CCI_REG8(0x5b12), 0x75 },
> > +       { CCI_REG8(0x5b13), 0x75 }, { CCI_REG8(0x5b14), 0x75 },
> > +       { CCI_REG8(0x5b15), 0x75 }, { CCI_REG8(0x5b16), 0x75 },
> > +       { CCI_REG8(0x5b17), 0x75 }, { CCI_REG8(0x5b18), 0x75 },
> > +       { CCI_REG8(0x5b19), 0x75 }, { CCI_REG8(0x5b1a), 0x75 },
> > +       { CCI_REG8(0x5b1b), 0x75 }, { CCI_REG8(0x5b1c), 0x75 },
> > +       { CCI_REG8(0x5b1d), 0x75 }, { CCI_REG8(0x5b1e), 0x75 },
> > +       { CCI_REG8(0x5b1f), 0x75 }, { CCI_REG8(0x5b20), 0x75 },
> > +       { CCI_REG8(0x5b21), 0x75 }, { CCI_REG8(0x5b22), 0x75 },
> > +       { CCI_REG8(0x5b23), 0x75 }, { CCI_REG8(0x5b24), 0x75 },
> > +       { CCI_REG8(0x5b25), 0x75 }, { CCI_REG8(0x5b26), 0x75 },
> > +       { CCI_REG8(0x5b27), 0x75 }, { CCI_REG8(0x5b28), 0x75 },
> > +       { CCI_REG8(0x5b29), 0x75 }, { CCI_REG8(0x5b2a), 0x75 },
> > +       { CCI_REG8(0x5b2b), 0x75 }, { CCI_REG8(0x5b2c), 0x75 },
> > +       { CCI_REG8(0x5b2d), 0x75 }, { CCI_REG8(0x5b2e), 0x75 },
> > +       { CCI_REG8(0x5b2f), 0x75 }, { CCI_REG8(0x5b30), 0x75 },
> > +       { CCI_REG8(0x5b31), 0x75 }, { CCI_REG8(0x5b32), 0x75 },
> > +       { CCI_REG8(0x5b33), 0x75 }, { CCI_REG8(0x5b34), 0x75 },
> > +       { CCI_REG8(0x5b35), 0x75 }, { CCI_REG8(0x5b36), 0x75 },
> > +       { CCI_REG8(0x5b37), 0x75 }, { CCI_REG8(0x5b38), 0x75 },
> > +       { CCI_REG8(0x5b39), 0x75 }, { CCI_REG8(0x5b3a), 0x75 },
> > +       { CCI_REG8(0x5b3b), 0x75 }, { CCI_REG8(0x5b3c), 0x75 },
> > +       { CCI_REG8(0x5b3d), 0x75 }, { CCI_REG8(0x5b3e), 0x75 },
> > +       { CCI_REG8(0x5b3f), 0x75 }, { CCI_REG8(0x5b40), 0x75 },
> > +       { CCI_REG8(0x5b41), 0x75 }, { CCI_REG8(0x5b42), 0x75 },
> > +       { CCI_REG8(0x5b43), 0x75 }, { CCI_REG8(0x5b44), 0x75 },
> > +       { CCI_REG8(0x5b45), 0x75 }, { CCI_REG8(0x5b46), 0x75 },
> > +       { CCI_REG8(0x5b47), 0x75 }, { CCI_REG8(0x5b48), 0x75 },
> > +       { CCI_REG8(0x5b49), 0x75 }, { CCI_REG8(0x5b4a), 0x75 },
> > +       { CCI_REG8(0x5b4b), 0x75 }, { CCI_REG8(0x5b4c), 0x75 },
> > +       { CCI_REG8(0x5b4d), 0x75 }, { CCI_REG8(0x5b4e), 0x75 },
> > +       { CCI_REG8(0x5b4f), 0x75 }, { CCI_REG8(0x5b50), 0x75 },
> > +       { CCI_REG8(0x5b51), 0x75 }, { CCI_REG8(0x5b52), 0x75 },
> > +       { CCI_REG8(0x5b53), 0x75 }, { CCI_REG8(0x5b54), 0x75 },
> > +       { CCI_REG8(0x5b55), 0x75 }, { CCI_REG8(0x5b56), 0x75 },
> > +       { CCI_REG8(0x5b57), 0x75 }, { CCI_REG8(0x5b58), 0x75 },
> > +       { CCI_REG8(0x5b59), 0x75 }, { CCI_REG8(0x5b5a), 0x75 },
> > +       { CCI_REG8(0x5b5b), 0x75 }, { CCI_REG8(0x5b5c), 0x75 },
> > +       { CCI_REG8(0x5b5d), 0x75 }, { CCI_REG8(0x5b5e), 0x75 },
> > +       { CCI_REG8(0x5b5f), 0x75 }, { CCI_REG8(0x5b80), 0x75 },
> > +       { CCI_REG8(0x5b81), 0x75 }, { CCI_REG8(0x5b82), 0x75 },
> > +       { CCI_REG8(0x5b83), 0x75 }, { CCI_REG8(0x5b84), 0x75 },
> > +       { CCI_REG8(0x5b85), 0x75 }, { CCI_REG8(0x5b86), 0x75 },
> > +       { CCI_REG8(0x5b87), 0x75 }, { CCI_REG8(0x5b88), 0x75 },
> > +       { CCI_REG8(0x5b89), 0x75 }, { CCI_REG8(0x5b8a), 0x75 },
> > +       { CCI_REG8(0x5b8b), 0x75 }, { CCI_REG8(0x5b8c), 0x75 },
> > +       { CCI_REG8(0x5b8d), 0x75 }, { CCI_REG8(0x5b8e), 0x75 },
> > +       { CCI_REG8(0x5b8f), 0x75 }, { CCI_REG8(0x5b90), 0x75 },
> > +       { CCI_REG8(0x5b91), 0x75 }, { CCI_REG8(0x5b92), 0x75 },
> > +       { CCI_REG8(0x5b93), 0x75 }, { CCI_REG8(0x5b94), 0x75 },
> > +       { CCI_REG8(0x5b95), 0x75 }, { CCI_REG8(0x5b96), 0x75 },
> > +       { CCI_REG8(0x5b97), 0x75 }, { CCI_REG8(0x5b98), 0x75 },
> > +       { CCI_REG8(0x5b99), 0x75 }, { CCI_REG8(0x5b9a), 0x75 },
> > +       { CCI_REG8(0x5b9b), 0x75 }, { CCI_REG8(0x5b9c), 0x75 },
> > +       { CCI_REG8(0x5b9d), 0x75 }, { CCI_REG8(0x5b9e), 0x75 },
> > +       { CCI_REG8(0x5b9f), 0x75 }, { CCI_REG8(0x5ba0), 0x75 },
> > +       { CCI_REG8(0x5ba1), 0x75 }, { CCI_REG8(0x5ba2), 0x75 },
> > +       { CCI_REG8(0x5ba3), 0x75 }, { CCI_REG8(0x5ba4), 0x75 },
> > +       { CCI_REG8(0x5ba5), 0x75 }, { CCI_REG8(0x5ba6), 0x75 },
> > +       { CCI_REG8(0x5ba7), 0x75 }, { CCI_REG8(0x5ba8), 0x75 },
> > +       { CCI_REG8(0x5ba9), 0x75 }, { CCI_REG8(0x5baa), 0x75 },
> > +       { CCI_REG8(0x5bab), 0x75 }, { CCI_REG8(0x5bac), 0x75 },
> > +       { CCI_REG8(0x5bad), 0x75 }, { CCI_REG8(0x5bae), 0x75 },
> > +       { CCI_REG8(0x5baf), 0x75 }, { CCI_REG8(0x5bb0), 0x75 },
> > +       { CCI_REG8(0x5bb1), 0x75 }, { CCI_REG8(0x5bb2), 0x75 },
> > +       { CCI_REG8(0x5bb3), 0x75 }, { CCI_REG8(0x5bb4), 0x75 },
> > +       { CCI_REG8(0x5bb5), 0x75 }, { CCI_REG8(0x5bb6), 0x75 },
> > +       { CCI_REG8(0x5bb7), 0x75 }, { CCI_REG8(0x5bb8), 0x75 },
> > +       { CCI_REG8(0x5bb9), 0x75 }, { CCI_REG8(0x5bba), 0x75 },
> > +       { CCI_REG8(0x5bbb), 0x75 }, { CCI_REG8(0x5bbc), 0x75 },
> > +       { CCI_REG8(0x5bbd), 0x75 }, { CCI_REG8(0x5bbe), 0x75 },
> > +       { CCI_REG8(0x5bbf), 0x75 }, { CCI_REG8(0x5bc0), 0x75 },
> > +       { CCI_REG8(0x5bc1), 0x75 }, { CCI_REG8(0x5bc2), 0x75 },
> > +       { CCI_REG8(0x5bc3), 0x75 }, { CCI_REG8(0x5bc4), 0x75 },
> > +       { CCI_REG8(0x5bc5), 0x75 }, { CCI_REG8(0x5bc6), 0x75 },
> > +       { CCI_REG8(0x5bc7), 0x75 }, { CCI_REG8(0x5bc8), 0x75 },
> > +       { CCI_REG8(0x5bc9), 0x75 }, { CCI_REG8(0x5bca), 0x75 },
> > +       { CCI_REG8(0x5bcb), 0x75 }, { CCI_REG8(0x5bcc), 0x75 },
> > +       { CCI_REG8(0x5bcd), 0x75 }, { CCI_REG8(0x5bce), 0x75 },
> > +       { CCI_REG8(0x5bcf), 0x75 }, { CCI_REG8(0x5bd0), 0x75 },
> > +       { CCI_REG8(0x5bd1), 0x75 }, { CCI_REG8(0x5bd2), 0x75 },
> > +       { CCI_REG8(0x5bd3), 0x75 }, { CCI_REG8(0x5bd4), 0x75 },
> > +       { CCI_REG8(0x5bd5), 0x75 }, { CCI_REG8(0x5bd6), 0x75 },
> > +       { CCI_REG8(0x5bd7), 0x75 }, { CCI_REG8(0x5bd8), 0x75 },
> > +       { CCI_REG8(0x5bd9), 0x75 }, { CCI_REG8(0x5bda), 0x75 },
> > +       { CCI_REG8(0x5bdb), 0x75 }, { CCI_REG8(0x5bdc), 0x75 },
> > +       { CCI_REG8(0x5bdd), 0x75 }, { CCI_REG8(0x5bde), 0x75 },
> > +       { CCI_REG8(0x5bdf), 0x75 }, { CCI_REG8(0x5be0), 0x75 },
> > +       { CCI_REG8(0x5be1), 0x75 }, { CCI_REG8(0x5be2), 0x75 },
> > +       { CCI_REG8(0x5be3), 0x75 }, { CCI_REG8(0x5be4), 0x75 },
> > +       { CCI_REG8(0x5be5), 0x75 }, { CCI_REG8(0x5be6), 0x75 },
> > +       { CCI_REG8(0x5be7), 0x75 }, { CCI_REG8(0x5be8), 0x75 },
> > +       { CCI_REG8(0x5be9), 0x75 }, { CCI_REG8(0x5bea), 0x75 },
> > +       { CCI_REG8(0x5beb), 0x75 }, { CCI_REG8(0x5bec), 0x75 },
> > +       { CCI_REG8(0x5bed), 0x75 }, { CCI_REG8(0x5bee), 0x75 },
> > +       { CCI_REG8(0x5bef), 0x75 }, { CCI_REG8(0x5bf0), 0x75 },
> > +       { CCI_REG8(0x5bf1), 0x75 }, { CCI_REG8(0x5bf2), 0x75 },
> > +       { CCI_REG8(0x5bf3), 0x75 }, { CCI_REG8(0x5bf4), 0x75 },
> > +       { CCI_REG8(0x5bf5), 0x75 }, { CCI_REG8(0x5bf6), 0x75 },
> > +       { CCI_REG8(0x5bf7), 0x75 }, { CCI_REG8(0x5bf8), 0x75 },
> > +       { CCI_REG8(0x5bf9), 0x75 }, { CCI_REG8(0x5bfa), 0x75 },
> > +       { CCI_REG8(0x5bfb), 0x75 }, { CCI_REG8(0x5bfc), 0x75 },
> > +       { CCI_REG8(0x5bfd), 0x75 }, { CCI_REG8(0x5bfe), 0x75 },
> > +       { CCI_REG8(0x5bff), 0x75 }, { CCI_REG8(0x5c00), 0x75 },
> > +       { CCI_REG8(0x5c01), 0x75 }, { CCI_REG8(0x5c02), 0x75 },
> > +       { CCI_REG8(0x5c03), 0x75 }, { CCI_REG8(0x5c04), 0x75 },
> > +       { CCI_REG8(0x5c05), 0x75 }, { CCI_REG8(0x5c06), 0x75 },
> > +       { CCI_REG8(0x5c07), 0x75 }, { CCI_REG8(0x5c08), 0x75 },
> > +       { CCI_REG8(0x5c09), 0x75 }, { CCI_REG8(0x5c0a), 0x75 },
> > +       { CCI_REG8(0x5c0b), 0x75 }, { CCI_REG8(0x5c0c), 0x75 },
> > +       { CCI_REG8(0x5c0d), 0x75 }, { CCI_REG8(0x5c0e), 0x75 },
> > +       { CCI_REG8(0x5c0f), 0x75 }, { CCI_REG8(0x5c10), 0x75 },
> > +       { CCI_REG8(0x5c11), 0x75 }, { CCI_REG8(0x5c12), 0x75 },
> > +       { CCI_REG8(0x5c13), 0x75 }, { CCI_REG8(0x5c14), 0x75 },
> > +       { CCI_REG8(0x5c15), 0x75 }, { CCI_REG8(0x5c16), 0x75 },
> > +       { CCI_REG8(0x5c17), 0x75 }, { CCI_REG8(0x5c18), 0x75 },
> > +       { CCI_REG8(0x5c19), 0x75 }, { CCI_REG8(0x5c1a), 0x75 },
> > +       { CCI_REG8(0x5c1b), 0x75 }, { CCI_REG8(0x5c1c), 0x75 },
> > +       { CCI_REG8(0x5c1d), 0x75 }, { CCI_REG8(0x5c1e), 0x75 },
> > +       { CCI_REG8(0x5c1f), 0x75 }, { CCI_REG8(0x5c20), 0x75 },
> > +       { CCI_REG8(0x5c21), 0x75 }, { CCI_REG8(0x5c22), 0x75 },
> > +       { CCI_REG8(0x5c23), 0x75 }, { CCI_REG8(0x5c24), 0x75 },
> > +       { CCI_REG8(0x5c25), 0x75 }, { CCI_REG8(0x5c26), 0x75 },
> > +       { CCI_REG8(0x5c27), 0x75 }, { CCI_REG8(0x5c28), 0x75 },
> > +       { CCI_REG8(0x5c29), 0x75 }, { CCI_REG8(0x5c2a), 0x75 },
> > +       { CCI_REG8(0x5c2b), 0x75 }, { CCI_REG8(0x5c2c), 0x75 },
> > +       { CCI_REG8(0x5c2d), 0x75 }, { CCI_REG8(0x5c2e), 0x75 },
> > +       { CCI_REG8(0x5c2f), 0x75 }, { CCI_REG8(0x5c30), 0x75 },
> > +       { CCI_REG8(0x5c31), 0x75 }, { CCI_REG8(0x5c32), 0x75 },
> > +       { CCI_REG8(0x5c33), 0x75 }, { CCI_REG8(0x5c34), 0x75 },
> > +       { CCI_REG8(0x5c35), 0x75 }, { CCI_REG8(0x5c36), 0x75 },
> > +       { CCI_REG8(0x5c37), 0x75 }, { CCI_REG8(0x5c38), 0x75 },
> > +       { CCI_REG8(0x5c39), 0x75 }, { CCI_REG8(0x5c3a), 0x75 },
> > +       { CCI_REG8(0x5c3b), 0x75 }, { CCI_REG8(0x5c3c), 0x75 },
> > +       { CCI_REG8(0x5c3d), 0x75 }, { CCI_REG8(0x5c3e), 0x75 },
> > +       { CCI_REG8(0x5c3f), 0x75 }, { CCI_REG8(0x5c40), 0x75 },
> > +       { CCI_REG8(0x5c41), 0x75 }, { CCI_REG8(0x5c42), 0x75 },
> > +       { CCI_REG8(0x5c43), 0x75 }, { CCI_REG8(0x5c44), 0x75 },
> > +       { CCI_REG8(0x5c45), 0x75 }, { CCI_REG8(0x5c46), 0x75 },
> > +       { CCI_REG8(0x5c47), 0x75 }, { CCI_REG8(0x5c48), 0x75 },
> > +       { CCI_REG8(0x5c49), 0x75 }, { CCI_REG8(0x5c4a), 0x75 },
> > +       { CCI_REG8(0x5c4b), 0x75 }, { CCI_REG8(0x5c4c), 0x75 },
> > +       { CCI_REG8(0x5c4d), 0x75 }, { CCI_REG8(0x5c4e), 0x75 },
> > +       { CCI_REG8(0x5c4f), 0x75 }, { CCI_REG8(0x5c50), 0x75 },
> > +       { CCI_REG8(0x5c51), 0x75 }, { CCI_REG8(0x5c52), 0x75 },
> > +       { CCI_REG8(0x5c53), 0x75 }, { CCI_REG8(0x5c54), 0x75 },
> > +       { CCI_REG8(0x5c55), 0x75 }, { CCI_REG8(0x5c56), 0x75 },
> > +       { CCI_REG8(0x5c57), 0x75 }, { CCI_REG8(0x5c58), 0x75 },
> > +       { CCI_REG8(0x5c59), 0x75 }, { CCI_REG8(0x5c5a), 0x75 },
> > +       { CCI_REG8(0x5c5b), 0x75 }, { CCI_REG8(0x5c5c), 0x75 },
> > +       { CCI_REG8(0x5c5d), 0x75 }, { CCI_REG8(0x5c5e), 0x75 },
> > +       { CCI_REG8(0x5c5f), 0x75 }, { CCI_REG8(0x5c60), 0x75 },
> > +       { CCI_REG8(0x5c61), 0x75 }, { CCI_REG8(0x5c62), 0x75 },
> > +       { CCI_REG8(0x5c63), 0x75 }, { CCI_REG8(0x5c64), 0x75 },
> > +       { CCI_REG8(0x5c65), 0x75 }, { CCI_REG8(0x5c66), 0x75 },
> > +       { CCI_REG8(0x5c67), 0x75 }, { CCI_REG8(0x5c68), 0x75 },
> > +       { CCI_REG8(0x5c69), 0x75 }, { CCI_REG8(0x5c6a), 0x75 },
> > +       { CCI_REG8(0x5c6b), 0x75 }, { CCI_REG8(0x5c6c), 0x75 },
> > +       { CCI_REG8(0x5c6d), 0x75 }, { CCI_REG8(0x5c6e), 0x75 },
> > +       { CCI_REG8(0x5c6f), 0x75 }, { CCI_REG8(0x5c70), 0x75 },
> > +       { CCI_REG8(0x5c71), 0x75 }, { CCI_REG8(0x5c72), 0x75 },
> > +       { CCI_REG8(0x5c73), 0x75 }, { CCI_REG8(0x5c74), 0x75 },
> > +       { CCI_REG8(0x5c75), 0x75 }, { CCI_REG8(0x5c76), 0x75 },
> > +       { CCI_REG8(0x5c77), 0x75 }, { CCI_REG8(0x5c78), 0x75 },
> > +       { CCI_REG8(0x5c79), 0x75 }, { CCI_REG8(0x5c7a), 0x75 },
> > +       { CCI_REG8(0x5c7b), 0x75 }, { CCI_REG8(0x5c7c), 0x75 },
> > +       { CCI_REG8(0x5c7d), 0x75 }, { CCI_REG8(0x5c7e), 0x75 },
> > +       { CCI_REG8(0x5c7f), 0x75 }, { CCI_REG8(0x5c80), 0x75 },
> > +       { CCI_REG8(0x5c81), 0x75 }, { CCI_REG8(0x5c82), 0x75 },
> > +       { CCI_REG8(0x5c83), 0x75 }, { CCI_REG8(0x5c84), 0x75 },
> > +       { CCI_REG8(0x5c85), 0x75 }, { CCI_REG8(0x5c86), 0x75 },
> > +       { CCI_REG8(0x5c87), 0x75 }, { CCI_REG8(0x5c88), 0x75 },
> > +       { CCI_REG8(0x5c89), 0x75 }, { CCI_REG8(0x5c8a), 0x75 },
> > +       { CCI_REG8(0x5c8b), 0x75 }, { CCI_REG8(0x5c8c), 0x75 },
> > +       { CCI_REG8(0x5c8d), 0x75 }, { CCI_REG8(0x5c8e), 0x75 },
> > +       { CCI_REG8(0x5c8f), 0x75 }, { CCI_REG8(0x5c90), 0x75 },
> > +       { CCI_REG8(0x5c91), 0x75 }, { CCI_REG8(0x5c92), 0x75 },
> > +       { CCI_REG8(0x5c93), 0x75 }, { CCI_REG8(0x5c94), 0x75 },
> > +       { CCI_REG8(0x5c95), 0x75 }, { CCI_REG8(0x5c96), 0x75 },
> > +       { CCI_REG8(0x5c97), 0x75 }, { CCI_REG8(0x5c98), 0x75 },
> > +       { CCI_REG8(0x5c99), 0x75 }, { CCI_REG8(0x5c9a), 0x75 },
> > +       { CCI_REG8(0x5c9b), 0x75 }, { CCI_REG8(0x5c9c), 0x75 },
> > +       { CCI_REG8(0x5c9d), 0x75 }, { CCI_REG8(0x5c9e), 0x75 },
> > +       { CCI_REG8(0x5c9f), 0x75 }, { CCI_REG8(0x5ca0), 0x75 },
> > +       { CCI_REG8(0x5ca1), 0x75 }, { CCI_REG8(0x5ca2), 0x75 },
> > +       { CCI_REG8(0x5ca3), 0x75 }, { CCI_REG8(0x5ca4), 0x75 },
> > +       { CCI_REG8(0x5ca5), 0x75 }, { CCI_REG8(0x5ca6), 0x75 },
> > +       { CCI_REG8(0x5ca7), 0x75 }, { CCI_REG8(0x5ca8), 0x75 },
> > +       { CCI_REG8(0x5ca9), 0x75 }, { CCI_REG8(0x5caa), 0x75 },
> > +       { CCI_REG8(0x5cab), 0x75 }, { CCI_REG8(0x5cac), 0x75 },
> > +       { CCI_REG8(0x5cad), 0x75 }, { CCI_REG8(0x5cae), 0x75 },
> > +       { CCI_REG8(0x5caf), 0x75 }, { CCI_REG8(0x5cb0), 0x75 },
> > +       { CCI_REG8(0x5cb1), 0x75 }, { CCI_REG8(0x5cb2), 0x75 },
> > +       { CCI_REG8(0x5cb3), 0x75 }, { CCI_REG8(0x5cb4), 0x75 },
> > +       { CCI_REG8(0x5cb5), 0x75 }, { CCI_REG8(0x5cb6), 0x75 },
> > +       { CCI_REG8(0x5cb7), 0x75 }, { CCI_REG8(0x5cb8), 0x75 },
> > +       { CCI_REG8(0x5cb9), 0x75 }, { CCI_REG8(0x5cba), 0x75 },
> > +       { CCI_REG8(0x5cbb), 0x75 }, { CCI_REG8(0x5cbc), 0x75 },
> > +       { CCI_REG8(0x5cbd), 0x75 }, { CCI_REG8(0x5cbe), 0x75 },
> > +       { CCI_REG8(0x5cbf), 0x75 }, { CCI_REG8(0x5cc0), 0x75 },
> > +       { CCI_REG8(0x5cc1), 0x75 }, { CCI_REG8(0x5cc2), 0x75 },
> > +       { CCI_REG8(0x5cc3), 0x75 }, { CCI_REG8(0x5cc4), 0x75 },
> > +       { CCI_REG8(0x5cc5), 0x75 }, { CCI_REG8(0x5cc6), 0x75 },
> > +       { CCI_REG8(0x5cc7), 0x75 }, { CCI_REG8(0x5cc8), 0x75 },
> > +       { CCI_REG8(0x5cc9), 0x75 }, { CCI_REG8(0x5cca), 0x75 },
> > +       { CCI_REG8(0x5ccb), 0x75 }, { CCI_REG8(0x5ccc), 0x75 },
> > +       { CCI_REG8(0x5ccd), 0x75 }, { CCI_REG8(0x5cce), 0x75 },
> > +       { CCI_REG8(0x5ccf), 0x75 }, { CCI_REG8(0x5cd0), 0x75 },
> > +       { CCI_REG8(0x5cd1), 0x75 }, { CCI_REG8(0x5cd2), 0x75 },
> > +       { CCI_REG8(0x5cd3), 0x75 }, { CCI_REG8(0x5cd4), 0x75 },
> > +       { CCI_REG8(0x5cd5), 0x75 }, { CCI_REG8(0x5cd6), 0x75 },
> > +       { CCI_REG8(0x5cd7), 0x75 }, { CCI_REG8(0x5cd8), 0x75 },
> > +       { CCI_REG8(0x5cd9), 0x75 }, { CCI_REG8(0x5cda), 0x75 },
> > +       { CCI_REG8(0x5cdb), 0x75 }, { CCI_REG8(0x5cdc), 0x75 },
> > +       { CCI_REG8(0x5cdd), 0x75 }, { CCI_REG8(0x5cde), 0x75 },
> > +       { CCI_REG8(0x5cdf), 0x75 }, { CCI_REG8(0x5ce0), 0x75 },
> > +       { CCI_REG8(0x5ce1), 0x75 }, { CCI_REG8(0x5ce2), 0x75 },
> > +       { CCI_REG8(0x5ce3), 0x75 }, { CCI_REG8(0x5ce4), 0x75 },
> > +       { CCI_REG8(0x5ce5), 0x75 }, { CCI_REG8(0x5ce6), 0x75 },
> > +       { CCI_REG8(0x5ce7), 0x75 }, { CCI_REG8(0x5ce8), 0x75 },
> > +       { CCI_REG8(0x5ce9), 0x75 }, { CCI_REG8(0x5cea), 0x75 },
> > +       { CCI_REG8(0x5ceb), 0x75 }, { CCI_REG8(0x5cec), 0x75 },
> > +       { CCI_REG8(0x5ced), 0x75 }, { CCI_REG8(0x5cee), 0x75 },
> > +       { CCI_REG8(0x5cef), 0x75 }, { CCI_REG8(0x5cf0), 0x75 },
> > +       { CCI_REG8(0x5cf1), 0x75 }, { CCI_REG8(0x5cf2), 0x75 },
> > +       { CCI_REG8(0x5cf3), 0x75 }, { CCI_REG8(0x5cf4), 0x75 },
> > +       { CCI_REG8(0x5cf5), 0x75 }, { CCI_REG8(0x5cf6), 0x75 },
> > +       { CCI_REG8(0x5cf7), 0x75 }, { CCI_REG8(0x5cf8), 0x75 },
> > +       { CCI_REG8(0x5cf9), 0x75 }, { CCI_REG8(0x5cfa), 0x75 },
> > +       { CCI_REG8(0x5cfb), 0x75 }, { CCI_REG8(0x5cfc), 0x75 },
> > +       { CCI_REG8(0x5cfd), 0x75 }, { CCI_REG8(0x5cfe), 0x75 },
> > +       { CCI_REG8(0x5cff), 0x75 }, { CCI_REG8(0x5d00), 0x75 },
> > +       { CCI_REG8(0x5d01), 0x75 }, { CCI_REG8(0x5d02), 0x75 },
> > +       { CCI_REG8(0x5d03), 0x75 }, { CCI_REG8(0x5d04), 0x75 },
> > +       { CCI_REG8(0x5d05), 0x75 }, { CCI_REG8(0x5d06), 0x75 },
> > +       { CCI_REG8(0x5d07), 0x75 }, { CCI_REG8(0x5d08), 0x75 },
> > +       { CCI_REG8(0x5d09), 0x75 }, { CCI_REG8(0x5d0a), 0x75 },
> > +       { CCI_REG8(0x5d0b), 0x75 }, { CCI_REG8(0x5d0c), 0x75 },
> > +       { CCI_REG8(0x5d0d), 0x75 }, { CCI_REG8(0x5d0e), 0x75 },
> > +       { CCI_REG8(0x5d0f), 0x75 }, { CCI_REG8(0x5d10), 0x75 },
> > +       { CCI_REG8(0x5d11), 0x75 }, { CCI_REG8(0x5d12), 0x75 },
> > +       { CCI_REG8(0x5d13), 0x75 }, { CCI_REG8(0x5d14), 0x75 },
> > +       { CCI_REG8(0x5d15), 0x75 }, { CCI_REG8(0x5d16), 0x75 },
> > +       { CCI_REG8(0x5d17), 0x75 }, { CCI_REG8(0x5d18), 0x75 },
> > +       { CCI_REG8(0x5d19), 0x75 }, { CCI_REG8(0x5d1a), 0x75 },
> > +       { CCI_REG8(0x5d1b), 0x75 }, { CCI_REG8(0x5d1c), 0x75 },
> > +       { CCI_REG8(0x5d1d), 0x75 }, { CCI_REG8(0x5d1e), 0x75 },
> > +       { CCI_REG8(0x5d1f), 0x75 }, { CCI_REG8(0x5d20), 0x75 },
> > +       { CCI_REG8(0x5d21), 0x75 }, { CCI_REG8(0x5d22), 0x75 },
> > +       { CCI_REG8(0x5d23), 0x75 }, { CCI_REG8(0x5d24), 0x75 },
> > +       { CCI_REG8(0x5d25), 0x75 }, { CCI_REG8(0x5d26), 0x75 },
> > +       { CCI_REG8(0x5d27), 0x75 }, { CCI_REG8(0x5d28), 0x75 },
> > +       { CCI_REG8(0x5d29), 0x75 }, { CCI_REG8(0x5d2a), 0x75 },
> > +       { CCI_REG8(0x5d2b), 0x75 }, { CCI_REG8(0x5d2c), 0x75 },
> > +       { CCI_REG8(0x5d2d), 0x75 }, { CCI_REG8(0x5d2e), 0x75 },
> > +       { CCI_REG8(0x5d2f), 0x75 }, { CCI_REG8(0x5d30), 0x75 },
> > +       { CCI_REG8(0x5d31), 0x75 }, { CCI_REG8(0x5d32), 0x75 },
> > +       { CCI_REG8(0x5d33), 0x75 }, { CCI_REG8(0x5d34), 0x75 },
> > +       { CCI_REG8(0x5d35), 0x75 }, { CCI_REG8(0x5d36), 0x75 },
> > +       { CCI_REG8(0x5d37), 0x75 }, { CCI_REG8(0x5d38), 0x75 },
> > +       { CCI_REG8(0x5d39), 0x75 }, { CCI_REG8(0x5d3a), 0x75 },
> > +       { CCI_REG8(0x5d3b), 0x75 }, { CCI_REG8(0x5d3c), 0x75 },
> > +       { CCI_REG8(0x5d3d), 0x75 }, { CCI_REG8(0x5d3e), 0x75 },
> > +       { CCI_REG8(0x5d3f), 0x75 }, { CCI_REG8(0x5d40), 0x75 },
> > +       { CCI_REG8(0x5d41), 0x75 }, { CCI_REG8(0x5d42), 0x75 },
> > +       { CCI_REG8(0x5d43), 0x75 }, { CCI_REG8(0x5d44), 0x75 },
> > +       { CCI_REG8(0x5d45), 0x75 }, { CCI_REG8(0x5d46), 0x75 },
> > +       { CCI_REG8(0x5d47), 0x75 }, { CCI_REG8(0x5d48), 0x75 },
> > +       { CCI_REG8(0x5d49), 0x75 }, { CCI_REG8(0x5d4a), 0x75 },
> > +       { CCI_REG8(0x5d4b), 0x75 }, { CCI_REG8(0x5d4c), 0x75 },
> > +       { CCI_REG8(0x5d4d), 0x75 }, { CCI_REG8(0x5d4e), 0x75 },
> > +       { CCI_REG8(0x5d4f), 0x75 }, { CCI_REG8(0x5d50), 0x75 },
> > +       { CCI_REG8(0x5d51), 0x75 }, { CCI_REG8(0x5d52), 0x75 },
> > +       { CCI_REG8(0x5d53), 0x75 }, { CCI_REG8(0x5d54), 0x75 },
> > +       { CCI_REG8(0x5d55), 0x75 }, { CCI_REG8(0x5d56), 0x75 },
> > +       { CCI_REG8(0x5d57), 0x75 }, { CCI_REG8(0x5d58), 0x75 },
> > +       { CCI_REG8(0x5d59), 0x75 }, { CCI_REG8(0x5d5a), 0x75 },
> > +       { CCI_REG8(0x5d5b), 0x75 }, { CCI_REG8(0x5d5c), 0x75 },
> > +       { CCI_REG8(0x5d5d), 0x75 }, { CCI_REG8(0x5d5e), 0x75 },
> > +       { CCI_REG8(0x5d5f), 0x75 }, { CCI_REG8(0x5d60), 0x75 },
> > +       { CCI_REG8(0x5d61), 0x75 }, { CCI_REG8(0x5d62), 0x75 },
> > +       { CCI_REG8(0x5d63), 0x75 }, { CCI_REG8(0x5d64), 0x75 },
> > +       { CCI_REG8(0x5d65), 0x75 }, { CCI_REG8(0x5d66), 0x75 },
> > +       { CCI_REG8(0x5d67), 0x75 }, { CCI_REG8(0x5d68), 0x75 },
> > +       { CCI_REG8(0x5d69), 0x75 }, { CCI_REG8(0x5d6a), 0x75 },
> > +       { CCI_REG8(0x5d6b), 0x75 }, { CCI_REG8(0x5d6c), 0x75 },
> > +       { CCI_REG8(0x5d6d), 0x75 }, { CCI_REG8(0x5d6e), 0x75 },
> > +       { CCI_REG8(0x5d6f), 0x75 }, { CCI_REG8(0x5d70), 0x75 },
> > +       { CCI_REG8(0x5d71), 0x75 }, { CCI_REG8(0x5d72), 0x75 },
> > +       { CCI_REG8(0x5d73), 0x75 }, { CCI_REG8(0x5d74), 0x75 },
> > +       { CCI_REG8(0x5d75), 0x75 }, { CCI_REG8(0x5d76), 0x75 },
> > +       { CCI_REG8(0x5d77), 0x75 }, { CCI_REG8(0x5d78), 0x75 },
> > +       { CCI_REG8(0x5d79), 0x75 }, { CCI_REG8(0x5d7a), 0x75 },
> > +       { CCI_REG8(0x5d7b), 0x75 }, { CCI_REG8(0x5d7c), 0x75 },
> > +       { CCI_REG8(0x5d7d), 0x75 }, { CCI_REG8(0x5d7e), 0x75 },
> > +       { CCI_REG8(0x5d7f), 0x75 }, { CCI_REG8(0x5d80), 0x75 },
> > +       { CCI_REG8(0x5d81), 0x75 }, { CCI_REG8(0x5d82), 0x75 },
> > +       { CCI_REG8(0x5d83), 0x75 }, { CCI_REG8(0x5d84), 0x75 },
> > +       { CCI_REG8(0x5d85), 0x75 }, { CCI_REG8(0x5d86), 0x75 },
> > +       { CCI_REG8(0x5d87), 0x75 }, { CCI_REG8(0x5d88), 0x75 },
> > +       { CCI_REG8(0x5d89), 0x75 }, { CCI_REG8(0x5d8a), 0x75 },
> > +       { CCI_REG8(0x5d8b), 0x75 }, { CCI_REG8(0x5d8c), 0x75 },
> > +       { CCI_REG8(0x5d8d), 0x75 }, { CCI_REG8(0x5d8e), 0x75 },
> > +       { CCI_REG8(0x5d8f), 0x75 }, { CCI_REG8(0x5d90), 0x75 },
> > +       { CCI_REG8(0x5d91), 0x75 }, { CCI_REG8(0x5d92), 0x75 },
> > +       { CCI_REG8(0x5d93), 0x75 }, { CCI_REG8(0x5d94), 0x75 },
> > +       { CCI_REG8(0x5d95), 0x75 }, { CCI_REG8(0x5d96), 0x75 },
> > +       { CCI_REG8(0x5d97), 0x75 }, { CCI_REG8(0x5d98), 0x75 },
> > +       { CCI_REG8(0x5d99), 0x75 }, { CCI_REG8(0x5d9a), 0x75 },
> > +       { CCI_REG8(0x5d9b), 0x75 }, { CCI_REG8(0x5d9c), 0x75 },
> > +       { CCI_REG8(0x5d9d), 0x75 }, { CCI_REG8(0x5d9e), 0x75 },
> > +       { CCI_REG8(0x5d9f), 0x75 }, { CCI_REG8(0x5da0), 0x75 },
> > +       { CCI_REG8(0x5da1), 0x75 }, { CCI_REG8(0x5da2), 0x75 },
> > +       { CCI_REG8(0x5da3), 0x75 }, { CCI_REG8(0x5da4), 0x75 },
> > +       { CCI_REG8(0x5da5), 0x75 }, { CCI_REG8(0x5da6), 0x75 },
> > +       { CCI_REG8(0x5da7), 0x75 }, { CCI_REG8(0x5da8), 0x75 },
> > +       { CCI_REG8(0x5da9), 0x75 }, { CCI_REG8(0x5daa), 0x75 },
> > +       { CCI_REG8(0x5dab), 0x75 }, { CCI_REG8(0x5dac), 0x75 },
> > +       { CCI_REG8(0x5dad), 0x75 }, { CCI_REG8(0x5dae), 0x75 },
> > +       { CCI_REG8(0x5daf), 0x75 }, { CCI_REG8(0x5db0), 0x75 },
> > +       { CCI_REG8(0x5db1), 0x75 }, { CCI_REG8(0x5db2), 0x75 },
> > +       { CCI_REG8(0x5db3), 0x75 }, { CCI_REG8(0x5db4), 0x75 },
> > +       { CCI_REG8(0x5db5), 0x75 }, { CCI_REG8(0x5db6), 0x75 },
> > +       { CCI_REG8(0x5db7), 0x75 }, { CCI_REG8(0x5db8), 0x75 },
> > +       { CCI_REG8(0x5db9), 0x75 }, { CCI_REG8(0x5dba), 0x75 },
> > +       { CCI_REG8(0x5dbb), 0x75 }, { CCI_REG8(0x5dbc), 0x75 },
> > +       { CCI_REG8(0x5dbd), 0x75 }, { CCI_REG8(0x5dbe), 0x75 },
> > +       { CCI_REG8(0x5dbf), 0x75 }, { CCI_REG8(0x5dc0), 0x75 },
> > +       { CCI_REG8(0x5dc1), 0x75 }, { CCI_REG8(0x5dc2), 0x75 },
> > +       { CCI_REG8(0x5dc3), 0x75 }, { CCI_REG8(0x5dc4), 0x75 },
> > +       { CCI_REG8(0x5dc5), 0x75 }, { CCI_REG8(0x5dc6), 0x75 },
> > +       { CCI_REG8(0x5dc7), 0x75 }, { CCI_REG8(0x5dc8), 0x75 },
> > +       { CCI_REG8(0x5dc9), 0x75 }, { CCI_REG8(0x5dca), 0x75 },
> > +       { CCI_REG8(0x5dcb), 0x75 }, { CCI_REG8(0x5dcc), 0x75 },
> > +       { CCI_REG8(0x5dcd), 0x75 }, { CCI_REG8(0x5dce), 0x75 },
> > +       { CCI_REG8(0x5dcf), 0x75 }, { CCI_REG8(0x5dd0), 0x75 },
> > +       { CCI_REG8(0x5dd1), 0x75 }, { CCI_REG8(0x5dd2), 0x75 },
> > +       { CCI_REG8(0x5dd3), 0x75 }, { CCI_REG8(0x5dd4), 0x75 },
> > +       { CCI_REG8(0x5dd5), 0x75 }, { CCI_REG8(0x5dd6), 0x75 },
> > +       { CCI_REG8(0x5dd7), 0x75 }, { CCI_REG8(0x5dd8), 0x75 },
> > +       { CCI_REG8(0x5dd9), 0x75 }, { CCI_REG8(0x5dda), 0x75 },
> > +       { CCI_REG8(0x5ddb), 0x75 }, { CCI_REG8(0x5ddc), 0x75 },
> > +       { CCI_REG8(0x5ddd), 0x75 }, { CCI_REG8(0x5dde), 0x75 },
> > +       { CCI_REG8(0x5ddf), 0x75 }, { CCI_REG8(0x5de0), 0x75 },
> > +       { CCI_REG8(0x5de1), 0x75 }, { CCI_REG8(0x5de2), 0x75 },
> > +       { CCI_REG8(0x5de3), 0x75 }, { CCI_REG8(0x5de4), 0x75 },
> > +       { CCI_REG8(0x5de5), 0x75 }, { CCI_REG8(0x5de6), 0x75 },
> > +       { CCI_REG8(0x5de7), 0x75 }, { CCI_REG8(0x5de8), 0x75 },
> > +       { CCI_REG8(0x5de9), 0x75 }, { CCI_REG8(0x5dea), 0x75 },
> > +       { CCI_REG8(0x5deb), 0x75 }, { CCI_REG8(0x5dec), 0x75 },
> > +       { CCI_REG8(0x5ded), 0x75 }, { CCI_REG8(0x5dee), 0x75 },
> > +       { CCI_REG8(0x5def), 0x75 }, { CCI_REG8(0x5df0), 0x75 },
> > +       { CCI_REG8(0x5df1), 0x75 }, { CCI_REG8(0x5df2), 0x75 },
> > +       { CCI_REG8(0x5df3), 0x75 }, { CCI_REG8(0x5df4), 0x75 },
> > +       { CCI_REG8(0x5df5), 0x75 }, { CCI_REG8(0x5df6), 0x75 },
> > +       { CCI_REG8(0x5df7), 0x75 }, { CCI_REG8(0x5df8), 0x75 },
> > +       { CCI_REG8(0x5df9), 0x75 }, { CCI_REG8(0x5dfa), 0x75 },
> > +       { CCI_REG8(0x5dfb), 0x75 }, { CCI_REG8(0x5dfc), 0x75 },
> > +       { CCI_REG8(0x5dfd), 0x75 }, { CCI_REG8(0x5dfe), 0x75 },
> > +       { CCI_REG8(0x5dff), 0x75 }, { CCI_REG8(0x5e00), 0x75 },
> > +       { CCI_REG8(0x5e01), 0x75 }, { CCI_REG8(0x5e02), 0x75 },
> > +       { CCI_REG8(0x5e03), 0x75 }, { CCI_REG8(0x5e04), 0x75 },
> > +       { CCI_REG8(0x5e05), 0x75 }, { CCI_REG8(0x5e06), 0x75 },
> > +       { CCI_REG8(0x5e07), 0x75 }, { CCI_REG8(0x5e08), 0x75 },
> > +       { CCI_REG8(0x5e09), 0x75 }, { CCI_REG8(0x5e0a), 0x75 },
> > +       { CCI_REG8(0x5e0b), 0x75 }, { CCI_REG8(0x5e0c), 0x75 },
> > +       { CCI_REG8(0x5e0d), 0x75 }, { CCI_REG8(0x5e0e), 0x75 },
> > +       { CCI_REG8(0x5e0f), 0x75 }, { CCI_REG8(0x5e10), 0x75 },
> > +       { CCI_REG8(0x5e11), 0x75 }, { CCI_REG8(0x5e12), 0x75 },
> > +       { CCI_REG8(0x5e13), 0x75 }, { CCI_REG8(0x5e14), 0x75 },
> > +       { CCI_REG8(0x5e15), 0x75 }, { CCI_REG8(0x5e16), 0x75 },
> > +       { CCI_REG8(0x5e17), 0x75 }, { CCI_REG8(0x5e18), 0x75 },
> > +       { CCI_REG8(0x5e19), 0x75 }, { CCI_REG8(0x5e1a), 0x75 },
> > +       { CCI_REG8(0x5e1b), 0x75 }, { CCI_REG8(0x5e1c), 0x75 },
> > +       { CCI_REG8(0x5e1d), 0x75 }, { CCI_REG8(0x5e1e), 0x75 },
> > +       { CCI_REG8(0x5e1f), 0x75 }, { CCI_REG8(0x5e20), 0x75 },
> > +       { CCI_REG8(0x5e21), 0x75 }, { CCI_REG8(0x5e22), 0x75 },
> > +       { CCI_REG8(0x5e23), 0x75 }, { CCI_REG8(0x5e24), 0x75 },
> > +       { CCI_REG8(0x5e25), 0x75 }, { CCI_REG8(0x5e26), 0x75 },
> > +       { CCI_REG8(0x5e27), 0x75 }, { CCI_REG8(0x5e28), 0x75 },
> > +       { CCI_REG8(0x5e29), 0x75 }, { CCI_REG8(0x5e2a), 0x75 },
> > +       { CCI_REG8(0x5e2b), 0x75 }, { CCI_REG8(0x5e2c), 0x75 },
> > +       { CCI_REG8(0x5e2d), 0x75 }, { CCI_REG8(0x5e2e), 0x75 },
> > +       { CCI_REG8(0x5e2f), 0x75 }, { CCI_REG8(0x5e30), 0x75 },
> > +       { CCI_REG8(0x5e31), 0x75 }, { CCI_REG8(0x5e32), 0x75 },
> > +       { CCI_REG8(0x5e33), 0x75 }, { CCI_REG8(0x5e34), 0x75 },
> > +       { CCI_REG8(0x5e35), 0x75 }, { CCI_REG8(0x5e36), 0x75 },
> > +       { CCI_REG8(0x5e37), 0x75 }, { CCI_REG8(0x5e38), 0x75 },
> > +       { CCI_REG8(0x5e39), 0x75 }, { CCI_REG8(0x5e3a), 0x75 },
> > +       { CCI_REG8(0x5e3b), 0x75 }, { CCI_REG8(0x5e3c), 0x75 },
> > +       { CCI_REG8(0x5e3d), 0x75 }, { CCI_REG8(0x5e3e), 0x75 },
> > +       { CCI_REG8(0x5e3f), 0x75 }, { CCI_REG8(0x5e40), 0x75 },
> > +       { CCI_REG8(0x5e41), 0x75 }, { CCI_REG8(0x5e42), 0x75 },
> > +       { CCI_REG8(0x5e43), 0x75 }, { CCI_REG8(0x5e44), 0x75 },
> > +       { CCI_REG8(0x5e45), 0x75 }, { CCI_REG8(0x5e46), 0x75 },
> > +       { CCI_REG8(0x5e47), 0x75 }, { CCI_REG8(0x5e48), 0x75 },
> > +       { CCI_REG8(0x5e49), 0x75 }, { CCI_REG8(0x5e4a), 0x75 },
> > +       { CCI_REG8(0x5e4b), 0x75 }, { CCI_REG8(0x5e4c), 0x75 },
> > +       { CCI_REG8(0x5e4d), 0x75 }, { CCI_REG8(0x5e4e), 0x75 },
> > +       { CCI_REG8(0x5e4f), 0x75 }, { CCI_REG8(0x5e50), 0x75 },
> > +       { CCI_REG8(0x5e51), 0x75 }, { CCI_REG8(0x5e52), 0x75 },
> > +       { CCI_REG8(0x5e53), 0x75 }, { CCI_REG8(0x5e54), 0x75 },
> > +       { CCI_REG8(0x5e55), 0x75 }, { CCI_REG8(0x5e56), 0x75 },
> > +       { CCI_REG8(0x5e57), 0x75 }, { CCI_REG8(0x5e58), 0x75 },
> > +       { CCI_REG8(0x5e59), 0x75 }, { CCI_REG8(0x5e5a), 0x75 },
> > +       { CCI_REG8(0x5e5b), 0x75 }, { CCI_REG8(0x5e5c), 0x75 },
> > +       { CCI_REG8(0x5e5d), 0x75 }, { CCI_REG8(0x5e5e), 0x75 },
> > +       { CCI_REG8(0x5e5f), 0x75 }, { CCI_REG8(0x5e60), 0x75 },
> > +       { CCI_REG8(0x5e61), 0x75 }, { CCI_REG8(0x5e62), 0x75 },
> > +       { CCI_REG8(0x5e63), 0x75 }, { CCI_REG8(0x5e64), 0x75 },
> > +       { CCI_REG8(0x5e65), 0x75 }, { CCI_REG8(0x5e66), 0x75 },
> > +       { CCI_REG8(0x5e67), 0x75 }, { CCI_REG8(0x5e68), 0x75 },
> > +       { CCI_REG8(0x5e69), 0x75 }, { CCI_REG8(0x5e6a), 0x75 },
> > +       { CCI_REG8(0x5e6b), 0x75 }, { CCI_REG8(0x5e6c), 0x75 },
> > +       { CCI_REG8(0x5e6d), 0x75 }, { CCI_REG8(0x5e6e), 0x75 },
> > +       { CCI_REG8(0x5e6f), 0x75 }, { CCI_REG8(0x5e70), 0x75 },
> > +       { CCI_REG8(0x5e71), 0x75 }, { CCI_REG8(0x5e72), 0x75 },
> > +       { CCI_REG8(0x5e73), 0x75 }, { CCI_REG8(0x5e74), 0x75 },
> > +       { CCI_REG8(0x5e75), 0x75 }, { CCI_REG8(0x5e76), 0x75 },
> > +       { CCI_REG8(0x5e77), 0x75 }, { CCI_REG8(0x5e78), 0x75 },
> > +       { CCI_REG8(0x5e79), 0x75 }, { CCI_REG8(0x5e7a), 0x75 },
> > +       { CCI_REG8(0x5e7b), 0x75 }, { CCI_REG8(0x5e7c), 0x75 },
> > +       { CCI_REG8(0x5e7d), 0x75 }, { CCI_REG8(0x5e7e), 0x75 },
> > +       { CCI_REG8(0x5e7f), 0x75 }, { CCI_REG8(0x5e80), 0x75 },
> > +       { CCI_REG8(0x5e81), 0x75 }, { CCI_REG8(0x5e82), 0x75 },
> > +       { CCI_REG8(0x5e83), 0x75 }, { CCI_REG8(0x5e84), 0x75 },
> > +       { CCI_REG8(0x5e85), 0x75 }, { CCI_REG8(0x5e86), 0x75 },
> > +       { CCI_REG8(0x5e87), 0x75 }, { CCI_REG8(0x5e88), 0x75 },
> > +       { CCI_REG8(0x5e89), 0x75 }, { CCI_REG8(0x5e8a), 0x75 },
> > +       { CCI_REG8(0x5e8b), 0x75 }, { CCI_REG8(0x5e8c), 0x75 },
> > +       { CCI_REG8(0x5e8d), 0x75 }, { CCI_REG8(0x5e8e), 0x75 },
> > +       { CCI_REG8(0x5e8f), 0x75 }, { CCI_REG8(0x5e90), 0x75 },
> > +       { CCI_REG8(0x5e91), 0x75 }, { CCI_REG8(0x5e92), 0x75 },
> > +       { CCI_REG8(0x5e93), 0x75 }, { CCI_REG8(0x5e94), 0x75 },
> > +       { CCI_REG8(0x5e95), 0x75 }, { CCI_REG8(0x5e96), 0x75 },
> > +       { CCI_REG8(0x5e97), 0x75 }, { CCI_REG8(0x5e98), 0x75 },
> > +       { CCI_REG8(0x5e99), 0x75 }, { CCI_REG8(0x5e9a), 0x75 },
> > +       { CCI_REG8(0x5e9b), 0x75 }, { CCI_REG8(0x5e9c), 0x75 },
> > +       { CCI_REG8(0x5e9d), 0x75 }, { CCI_REG8(0x5e9e), 0x75 },
> > +       { CCI_REG8(0x5e9f), 0x75 }, { CCI_REG8(0x5ea0), 0x75 },
> > +       { CCI_REG8(0x5ea1), 0x75 }, { CCI_REG8(0x5ea2), 0x75 },
> > +       { CCI_REG8(0x5ea3), 0x75 }, { CCI_REG8(0x5ea4), 0x75 },
> > +       { CCI_REG8(0x5ea5), 0x75 }, { CCI_REG8(0x5ea6), 0x75 },
> > +       { CCI_REG8(0x5ea7), 0x75 }, { CCI_REG8(0x5ea8), 0x75 },
> > +       { CCI_REG8(0x5ea9), 0x75 }, { CCI_REG8(0x5eaa), 0x75 },
> > +       { CCI_REG8(0x5eab), 0x75 }, { CCI_REG8(0x5eac), 0x75 },
> > +       { CCI_REG8(0x5ead), 0x75 }, { CCI_REG8(0x5eae), 0x75 },
> > +       { CCI_REG8(0x5eaf), 0x75 }, { CCI_REG8(0x5eb0), 0x75 },
> > +       { CCI_REG8(0x5eb1), 0x75 }, { CCI_REG8(0x5eb2), 0x75 },
> > +       { CCI_REG8(0x5eb3), 0x75 }, { CCI_REG8(0x5eb4), 0x75 },
> > +       { CCI_REG8(0x5eb5), 0x75 }, { CCI_REG8(0x5eb6), 0x75 },
> > +       { CCI_REG8(0x5eb7), 0x75 }, { CCI_REG8(0x5eb8), 0x75 },
> > +       { CCI_REG8(0x5eb9), 0x75 }, { CCI_REG8(0x5eba), 0x75 },
> > +       { CCI_REG8(0x5ebb), 0x75 }, { CCI_REG8(0x5ebc), 0x75 },
> > +       { CCI_REG8(0x5ebd), 0x75 }, { CCI_REG8(0x5ebe), 0x75 },
> > +       { CCI_REG8(0x5ebf), 0x75 }, { CCI_REG8(0x5ec0), 0x75 },
> > +       { CCI_REG8(0x5ec1), 0x75 }, { CCI_REG8(0x5ec2), 0x75 },
> > +       { CCI_REG8(0x5ec3), 0x75 }, { CCI_REG8(0x5ec4), 0x75 },
> > +       { CCI_REG8(0x5ec5), 0x75 }, { CCI_REG8(0x5ec6), 0x75 },
> > +       { CCI_REG8(0x5ec7), 0x75 }, { CCI_REG8(0x5ec8), 0x75 },
> > +       { CCI_REG8(0x5ec9), 0x75 }, { CCI_REG8(0x5eca), 0x75 },
> > +       { CCI_REG8(0x5ecb), 0x75 }, { CCI_REG8(0x5ecc), 0x75 },
> > +       { CCI_REG8(0x5ecd), 0x75 }, { CCI_REG8(0x5ece), 0x75 },
> > +       { CCI_REG8(0x5ecf), 0x75 }, { CCI_REG8(0x5ed0), 0x75 },
> > +       { CCI_REG8(0x5ed1), 0x75 }, { CCI_REG8(0x5ed2), 0x75 },
> > +       { CCI_REG8(0x5ed3), 0x75 }, { CCI_REG8(0x5ed4), 0x75 },
> > +       { CCI_REG8(0x5ed5), 0x75 }, { CCI_REG8(0x5ed6), 0x75 },
> > +       { CCI_REG8(0x5ed7), 0x75 }, { CCI_REG8(0x5ed8), 0x75 },
> > +       { CCI_REG8(0x5ed9), 0x75 }, { CCI_REG8(0x5eda), 0x75 },
> > +       { CCI_REG8(0x5edb), 0x75 }, { CCI_REG8(0x5edc), 0x75 },
> > +       { CCI_REG8(0x5edd), 0x75 }, { CCI_REG8(0x5ede), 0x75 },
> > +       { CCI_REG8(0x5edf), 0x75 }, { CCI_REG8(0xfff9), 0x08 },
> > +       { CCI_REG8(0x1570), 0x00 }, { CCI_REG8(0x15d0), 0x00 },
> > +       { CCI_REG8(0x15a0), 0x02 }, { CCI_REG8(0x15a1), 0x00 },
> > +       { CCI_REG8(0x15a2), 0x02 }, { CCI_REG8(0x15a3), 0x76 },
> > +       { CCI_REG8(0x15a4), 0x03 }, { CCI_REG8(0x15a5), 0x08 },
> > +       { CCI_REG8(0x15a6), 0x00 }, { CCI_REG8(0x15a7), 0x60 },
> > +       { CCI_REG8(0x15a8), 0x01 }, { CCI_REG8(0x15a9), 0x00 },
> > +       { CCI_REG8(0x15aa), 0x02 }, { CCI_REG8(0x15ab), 0x00 },
> > +       { CCI_REG8(0x1600), 0x02 }, { CCI_REG8(0x1601), 0x00 },
> > +       { CCI_REG8(0x1602), 0x02 }, { CCI_REG8(0x1603), 0x76 },
> > +       { CCI_REG8(0x1604), 0x03 }, { CCI_REG8(0x1605), 0x08 },
> > +       { CCI_REG8(0x1606), 0x00 }, { CCI_REG8(0x1607), 0x60 },
> > +       { CCI_REG8(0x1608), 0x01 }, { CCI_REG8(0x1609), 0x00 },
> > +       { CCI_REG8(0x160a), 0x02 }, { CCI_REG8(0x160b), 0x00 },
> > +       { CCI_REG8(0x1633), 0x03 }, { CCI_REG8(0x1634), 0x01 },
> > +       { CCI_REG8(0x163c), 0x3a }, { CCI_REG8(0x163d), 0x01 },
> > +       { CCI_REG8(0x1648), 0x32 }, { CCI_REG8(0x1658), 0x01 },
> > +       { CCI_REG8(0x1659), 0x01 }, { CCI_REG8(0x165f), 0x01 },
> > +       { CCI_REG8(0x1677), 0x01 }, { CCI_REG8(0x1690), 0x08 },
> > +       { CCI_REG8(0x1691), 0x00 }, { CCI_REG8(0x1692), 0x20 },
> > +       { CCI_REG8(0x1693), 0x00 }, { CCI_REG8(0x1694), 0x10 },
> > +       { CCI_REG8(0x1695), 0x14 }, { CCI_REG8(0x1696), 0x10 },
> > +       { CCI_REG8(0x1697), 0x0e }, { CCI_REG8(0x1730), 0x01 },
> > +       { CCI_REG8(0x1732), 0x00 }, { CCI_REG8(0x1733), 0x10 },
> > +       { CCI_REG8(0x1734), 0x01 }, { CCI_REG8(0x1735), 0x00 },
> > +       { CCI_REG8(0x1748), 0x01 }, { CCI_REG8(0xfff9), 0x06 },
> > +       { CCI_REG8(0x5000), 0xff }, { CCI_REG8(0x5001), 0x3d },
> > +       { CCI_REG8(0x5002), 0xf5 }, { CCI_REG8(0x5004), 0x80 },
> > +       { CCI_REG8(0x5006), 0x04 }, { CCI_REG8(0x5061), 0x20 },
> > +       { CCI_REG8(0x5063), 0x20 }, { CCI_REG8(0x5064), 0x24 },
> > +       { CCI_REG8(0x5065), 0x00 }, { CCI_REG8(0x5066), 0x1b },
> > +       { CCI_REG8(0x5067), 0x00 }, { CCI_REG8(0x5068), 0x03 },
> > +       { CCI_REG8(0x5069), 0x10 }, { CCI_REG8(0x506a), 0x20 },
> > +       { CCI_REG8(0x506b), 0x04 }, { CCI_REG8(0x506c), 0x04 },
> > +       { CCI_REG8(0x506d), 0x0c }, { CCI_REG8(0x506e), 0x0c },
> > +       { CCI_REG8(0x506f), 0x04 }, { CCI_REG8(0x5070), 0x0c },
> > +       { CCI_REG8(0x5071), 0x14 }, { CCI_REG8(0x5072), 0x1c },
> > +       { CCI_REG8(0x5073), 0x01 }, { CCI_REG8(0x5074), 0x01 },
> > +       { CCI_REG8(0x5075), 0xbe }, { CCI_REG8(0x5083), 0x00 },
> > +       { CCI_REG8(0x5114), 0x03 }, { CCI_REG8(0x51b0), 0x00 },
> > +       { CCI_REG8(0x51b3), 0x0e }, { CCI_REG8(0x51b5), 0x02 },
> > +       { CCI_REG8(0x51b6), 0x00 }, { CCI_REG8(0x51b7), 0x00 },
> > +       { CCI_REG8(0x51b8), 0x00 }, { CCI_REG8(0x51b9), 0x70 },
> > +       { CCI_REG8(0x51ba), 0x00 }, { CCI_REG8(0x51bb), 0x10 },
> > +       { CCI_REG8(0x51bc), 0x00 }, { CCI_REG8(0x51bd), 0x00 },
> > +       { CCI_REG8(0x51d2), 0xff }, { CCI_REG8(0x51d3), 0x1c },
> > +       { CCI_REG8(0x5250), 0x34 }, { CCI_REG8(0x5251), 0x00 },
> > +       { CCI_REG8(0x525b), 0x00 }, { CCI_REG8(0x525d), 0x00 },
> > +       { CCI_REG8(0x527a), 0x00 }, { CCI_REG8(0x527b), 0x38 },
> > +       { CCI_REG8(0x527c), 0x00 }, { CCI_REG8(0x527d), 0x4b },
> > +       { CCI_REG8(0x5286), 0x1b }, { CCI_REG8(0x5287), 0x40 },
> > +       { CCI_REG8(0x5290), 0x00 }, { CCI_REG8(0x5291), 0x50 },
> > +       { CCI_REG8(0x5292), 0x00 }, { CCI_REG8(0x5293), 0x50 },
> > +       { CCI_REG8(0x5294), 0x00 }, { CCI_REG8(0x5295), 0x50 },
> > +       { CCI_REG8(0x5296), 0x00 }, { CCI_REG8(0x5297), 0x50 },
> > +       { CCI_REG8(0x5298), 0x00 }, { CCI_REG8(0x5299), 0x50 },
> > +       { CCI_REG8(0x529a), 0x01 }, { CCI_REG8(0x529b), 0x00 },
> > +       { CCI_REG8(0x529c), 0x01 }, { CCI_REG8(0x529d), 0x00 },
> > +       { CCI_REG8(0x529e), 0x00 }, { CCI_REG8(0x529f), 0x50 },
> > +       { CCI_REG8(0x52a0), 0x00 }, { CCI_REG8(0x52a1), 0x50 },
> > +       { CCI_REG8(0x52a2), 0x01 }, { CCI_REG8(0x52a3), 0x00 },
> > +       { CCI_REG8(0x52a4), 0x01 }, { CCI_REG8(0x52a5), 0x00 },
> > +       { CCI_REG8(0x52a6), 0x00 }, { CCI_REG8(0x52a7), 0x50 },
> > +       { CCI_REG8(0x52a8), 0x00 }, { CCI_REG8(0x52a9), 0x50 },
> > +       { CCI_REG8(0x52aa), 0x00 }, { CCI_REG8(0x52ab), 0x50 },
> > +       { CCI_REG8(0x52ac), 0x00 }, { CCI_REG8(0x52ad), 0x50 },
> > +       { CCI_REG8(0x52ae), 0x00 }, { CCI_REG8(0x52af), 0x50 },
> > +       { CCI_REG8(0x52b0), 0x00 }, { CCI_REG8(0x52b1), 0x50 },
> > +       { CCI_REG8(0x52b2), 0x00 }, { CCI_REG8(0x52b3), 0x50 },
> > +       { CCI_REG8(0x52b4), 0x00 }, { CCI_REG8(0x52b5), 0x50 },
> > +       { CCI_REG8(0x52b6), 0x00 }, { CCI_REG8(0x52b7), 0x50 },
> > +       { CCI_REG8(0x52b8), 0x00 }, { CCI_REG8(0x52b9), 0x50 },
> > +       { CCI_REG8(0x52ba), 0x01 }, { CCI_REG8(0x52bb), 0x00 },
> > +       { CCI_REG8(0x52bc), 0x01 }, { CCI_REG8(0x52bd), 0x00 },
> > +       { CCI_REG8(0x52be), 0x00 }, { CCI_REG8(0x52bf), 0x50 },
> > +       { CCI_REG8(0x52c0), 0x00 }, { CCI_REG8(0x52c1), 0x50 },
> > +       { CCI_REG8(0x52c2), 0x01 }, { CCI_REG8(0x52c3), 0x00 },
> > +       { CCI_REG8(0x52c4), 0x01 }, { CCI_REG8(0x52c5), 0x00 },
> > +       { CCI_REG8(0x52c6), 0x00 }, { CCI_REG8(0x52c7), 0x50 },
> > +       { CCI_REG8(0x52c8), 0x00 }, { CCI_REG8(0x52c9), 0x50 },
> > +       { CCI_REG8(0x52ca), 0x00 }, { CCI_REG8(0x52cb), 0x50 },
> > +       { CCI_REG8(0x52cc), 0x00 }, { CCI_REG8(0x52cd), 0x50 },
> > +       { CCI_REG8(0x52ce), 0x00 }, { CCI_REG8(0x52cf), 0x50 },
> > +       { CCI_REG8(0x52f0), 0x04 }, { CCI_REG8(0x52f1), 0x03 },
> > +       { CCI_REG8(0x52f2), 0x02 }, { CCI_REG8(0x52f3), 0x01 },
> > +       { CCI_REG8(0x52f4), 0x08 }, { CCI_REG8(0x52f5), 0x07 },
> > +       { CCI_REG8(0x52f6), 0x06 }, { CCI_REG8(0x52f7), 0x05 },
> > +       { CCI_REG8(0x52f8), 0x0c }, { CCI_REG8(0x52f9), 0x0b },
> > +       { CCI_REG8(0x52fa), 0x0a }, { CCI_REG8(0x52fb), 0x09 },
> > +       { CCI_REG8(0x52fc), 0x10 }, { CCI_REG8(0x52fd), 0x0f },
> > +       { CCI_REG8(0x52fe), 0x0e }, { CCI_REG8(0x52ff), 0x0d },
> > +       { CCI_REG8(0x5300), 0x14 }, { CCI_REG8(0x5301), 0x13 },
> > +       { CCI_REG8(0x5302), 0x12 }, { CCI_REG8(0x5303), 0x11 },
> > +       { CCI_REG8(0x5304), 0x18 }, { CCI_REG8(0x5305), 0x17 },
> > +       { CCI_REG8(0x5306), 0x16 }, { CCI_REG8(0x5307), 0x15 },
> > +       { CCI_REG8(0x5308), 0x1c }, { CCI_REG8(0x5309), 0x1b },
> > +       { CCI_REG8(0x530a), 0x1a }, { CCI_REG8(0x530b), 0x19 },
> > +       { CCI_REG8(0x530c), 0x20 }, { CCI_REG8(0x530d), 0x1f },
> > +       { CCI_REG8(0x530e), 0x1e }, { CCI_REG8(0x530f), 0x1d },
> > +       { CCI_REG8(0x5310), 0x03 }, { CCI_REG8(0x5311), 0xe8 },
> > +       { CCI_REG8(0x5331), 0x0a }, { CCI_REG8(0x5332), 0x43 },
> > +       { CCI_REG8(0x5333), 0x45 }, { CCI_REG8(0x5353), 0x09 },
> > +       { CCI_REG8(0x5354), 0x00 }, { CCI_REG8(0x5414), 0x03 },
> > +       { CCI_REG8(0x54b0), 0x10 }, { CCI_REG8(0x54b3), 0x0e },
> > +       { CCI_REG8(0x54b5), 0x02 }, { CCI_REG8(0x54b6), 0x00 },
> > +       { CCI_REG8(0x54b7), 0x00 }, { CCI_REG8(0x54b8), 0x00 },
> > +       { CCI_REG8(0x54b9), 0x70 }, { CCI_REG8(0x54ba), 0x00 },
> > +       { CCI_REG8(0x54bb), 0x10 }, { CCI_REG8(0x54bc), 0x00 },
> > +       { CCI_REG8(0x54bd), 0x00 }, { CCI_REG8(0x54d2), 0xff },
> > +       { CCI_REG8(0x54d3), 0x1c }, { CCI_REG8(0x5510), 0x03 },
> > +       { CCI_REG8(0x5511), 0xe8 }, { CCI_REG8(0x5550), 0x6c },
> > +       { CCI_REG8(0x5551), 0x00 }, { CCI_REG8(0x557a), 0x00 },
> > +       { CCI_REG8(0x557b), 0x38 }, { CCI_REG8(0x557c), 0x00 },
> > +       { CCI_REG8(0x557d), 0x4b }, { CCI_REG8(0x5590), 0x00 },
> > +       { CCI_REG8(0x5591), 0x50 }, { CCI_REG8(0x5592), 0x00 },
> > +       { CCI_REG8(0x5593), 0x50 }, { CCI_REG8(0x5594), 0x00 },
> > +       { CCI_REG8(0x5595), 0x50 }, { CCI_REG8(0x5596), 0x00 },
> > +       { CCI_REG8(0x5597), 0x50 }, { CCI_REG8(0x5598), 0x00 },
> > +       { CCI_REG8(0x5599), 0x50 }, { CCI_REG8(0x559a), 0x01 },
> > +       { CCI_REG8(0x559b), 0x00 }, { CCI_REG8(0x559c), 0x01 },
> > +       { CCI_REG8(0x559d), 0x00 }, { CCI_REG8(0x559e), 0x00 },
> > +       { CCI_REG8(0x559f), 0x50 }, { CCI_REG8(0x55a0), 0x00 },
> > +       { CCI_REG8(0x55a1), 0x50 }, { CCI_REG8(0x55a2), 0x01 },
> > +       { CCI_REG8(0x55a3), 0x00 }, { CCI_REG8(0x55a4), 0x01 },
> > +       { CCI_REG8(0x55a5), 0x00 }, { CCI_REG8(0x55a6), 0x00 },
> > +       { CCI_REG8(0x55a7), 0x50 }, { CCI_REG8(0x55a8), 0x00 },
> > +       { CCI_REG8(0x55a9), 0x50 }, { CCI_REG8(0x55aa), 0x00 },
> > +       { CCI_REG8(0x55ab), 0x50 }, { CCI_REG8(0x55ac), 0x00 },
> > +       { CCI_REG8(0x55ad), 0x50 }, { CCI_REG8(0x55ae), 0x00 },
> > +       { CCI_REG8(0x55af), 0x50 }, { CCI_REG8(0x55b0), 0x00 },
> > +       { CCI_REG8(0x55b1), 0x50 }, { CCI_REG8(0x55b2), 0x00 },
> > +       { CCI_REG8(0x55b3), 0x50 }, { CCI_REG8(0x55b4), 0x00 },
> > +       { CCI_REG8(0x55b5), 0x50 }, { CCI_REG8(0x55b6), 0x00 },
> > +       { CCI_REG8(0x55b7), 0x50 }, { CCI_REG8(0x55b8), 0x00 },
> > +       { CCI_REG8(0x55b9), 0x50 }, { CCI_REG8(0x55ba), 0x01 },
> > +       { CCI_REG8(0x55bb), 0x00 }, { CCI_REG8(0x55bc), 0x01 },
> > +       { CCI_REG8(0x55bd), 0x00 }, { CCI_REG8(0x55be), 0x00 },
> > +       { CCI_REG8(0x55bf), 0x50 }, { CCI_REG8(0x55c0), 0x00 },
> > +       { CCI_REG8(0x55c1), 0x50 }, { CCI_REG8(0x55c2), 0x01 },
> > +       { CCI_REG8(0x55c3), 0x00 }, { CCI_REG8(0x55c4), 0x01 },
> > +       { CCI_REG8(0x55c5), 0x00 }, { CCI_REG8(0x55c6), 0x00 },
> > +       { CCI_REG8(0x55c7), 0x50 }, { CCI_REG8(0x55c8), 0x00 },
> > +       { CCI_REG8(0x55c9), 0x50 }, { CCI_REG8(0x55ca), 0x00 },
> > +       { CCI_REG8(0x55cb), 0x50 }, { CCI_REG8(0x55cc), 0x00 },
> > +       { CCI_REG8(0x55cd), 0x50 }, { CCI_REG8(0x55ce), 0x00 },
> > +       { CCI_REG8(0x55cf), 0x50 }, { CCI_REG8(0x55f0), 0x04 },
> > +       { CCI_REG8(0x55f1), 0x03 }, { CCI_REG8(0x55f2), 0x02 },
> > +       { CCI_REG8(0x55f3), 0x01 }, { CCI_REG8(0x55f4), 0x08 },
> > +       { CCI_REG8(0x55f5), 0x07 }, { CCI_REG8(0x55f6), 0x06 },
> > +       { CCI_REG8(0x55f7), 0x05 }, { CCI_REG8(0x55f8), 0x0c },
> > +       { CCI_REG8(0x55f9), 0x0b }, { CCI_REG8(0x55fa), 0x0a },
> > +       { CCI_REG8(0x55fb), 0x09 }, { CCI_REG8(0x55fc), 0x10 },
> > +       { CCI_REG8(0x55fd), 0x0f }, { CCI_REG8(0x55fe), 0x0e },
> > +       { CCI_REG8(0x55ff), 0x0d }, { CCI_REG8(0x5600), 0x14 },
> > +       { CCI_REG8(0x5601), 0x13 }, { CCI_REG8(0x5602), 0x12 },
> > +       { CCI_REG8(0x5603), 0x11 }, { CCI_REG8(0x5604), 0x18 },
> > +       { CCI_REG8(0x5605), 0x17 }, { CCI_REG8(0x5606), 0x16 },
> > +       { CCI_REG8(0x5607), 0x15 }, { CCI_REG8(0x5608), 0x1c },
> > +       { CCI_REG8(0x5609), 0x1b }, { CCI_REG8(0x560a), 0x1a },
> > +       { CCI_REG8(0x560b), 0x19 }, { CCI_REG8(0x560c), 0x20 },
> > +       { CCI_REG8(0x560d), 0x1f }, { CCI_REG8(0x560e), 0x1e },
> > +       { CCI_REG8(0x560f), 0x1d }, { CCI_REG8(0x5631), 0x02 },
> > +       { CCI_REG8(0x5632), 0x42 }, { CCI_REG8(0x5633), 0x24 },
> > +       { CCI_REG8(0x5653), 0x09 }, { CCI_REG8(0x5654), 0x00 },
> > +       { CCI_REG8(0x5714), 0x03 }, { CCI_REG8(0x57b0), 0x10 },
> > +       { CCI_REG8(0x57b3), 0x0e }, { CCI_REG8(0x57b5), 0x02 },
> > +       { CCI_REG8(0x57b6), 0x00 }, { CCI_REG8(0x57b7), 0x00 },
> > +       { CCI_REG8(0x57b8), 0x00 }, { CCI_REG8(0x57b9), 0x70 },
> > +       { CCI_REG8(0x57ba), 0x00 }, { CCI_REG8(0x57bb), 0x10 },
> > +       { CCI_REG8(0x57bc), 0x00 }, { CCI_REG8(0x57bd), 0x00 },
> > +       { CCI_REG8(0x57d2), 0xff }, { CCI_REG8(0x57d3), 0x1c },
> > +       { CCI_REG8(0x5810), 0x03 }, { CCI_REG8(0x5811), 0xe8 },
> > +       { CCI_REG8(0x5850), 0x6c }, { CCI_REG8(0x5851), 0x00 },
> > +       { CCI_REG8(0x587a), 0x00 }, { CCI_REG8(0x587b), 0x38 },
> > +       { CCI_REG8(0x587c), 0x00 }, { CCI_REG8(0x587d), 0x4b },
> > +       { CCI_REG8(0x5890), 0x00 }, { CCI_REG8(0x5891), 0x50 },
> > +       { CCI_REG8(0x5892), 0x00 }, { CCI_REG8(0x5893), 0x50 },
> > +       { CCI_REG8(0x5894), 0x00 }, { CCI_REG8(0x5895), 0x50 },
> > +       { CCI_REG8(0x5896), 0x00 }, { CCI_REG8(0x5897), 0x50 },
> > +       { CCI_REG8(0x5898), 0x00 }, { CCI_REG8(0x5899), 0x50 },
> > +       { CCI_REG8(0x589a), 0x01 }, { CCI_REG8(0x589b), 0x00 },
> > +       { CCI_REG8(0x589c), 0x01 }, { CCI_REG8(0x589d), 0x00 },
> > +       { CCI_REG8(0x589e), 0x00 }, { CCI_REG8(0x589f), 0x50 },
> > +       { CCI_REG8(0x58a0), 0x00 }, { CCI_REG8(0x58a1), 0x50 },
> > +       { CCI_REG8(0x58a2), 0x01 }, { CCI_REG8(0x58a3), 0x00 },
> > +       { CCI_REG8(0x58a4), 0x01 }, { CCI_REG8(0x58a5), 0x00 },
> > +       { CCI_REG8(0x58a6), 0x00 }, { CCI_REG8(0x58a7), 0x50 },
> > +       { CCI_REG8(0x58a8), 0x00 }, { CCI_REG8(0x58a9), 0x50 },
> > +       { CCI_REG8(0x58aa), 0x00 }, { CCI_REG8(0x58ab), 0x50 },
> > +       { CCI_REG8(0x58ac), 0x00 }, { CCI_REG8(0x58ad), 0x50 },
> > +       { CCI_REG8(0x58ae), 0x00 }, { CCI_REG8(0x58af), 0x50 },
> > +       { CCI_REG8(0x58b0), 0x00 }, { CCI_REG8(0x58b1), 0x50 },
> > +       { CCI_REG8(0x58b2), 0x00 }, { CCI_REG8(0x58b3), 0x50 },
> > +       { CCI_REG8(0x58b4), 0x00 }, { CCI_REG8(0x58b5), 0x50 },
> > +       { CCI_REG8(0x58b6), 0x00 }, { CCI_REG8(0x58b7), 0x50 },
> > +       { CCI_REG8(0x58b8), 0x00 }, { CCI_REG8(0x58b9), 0x50 },
> > +       { CCI_REG8(0x58ba), 0x01 }, { CCI_REG8(0x58bb), 0x00 },
> > +       { CCI_REG8(0x58bc), 0x01 }, { CCI_REG8(0x58bd), 0x00 },
> > +       { CCI_REG8(0x58be), 0x00 }, { CCI_REG8(0x58bf), 0x50 },
> > +       { CCI_REG8(0x58c0), 0x00 }, { CCI_REG8(0x58c1), 0x50 },
> > +       { CCI_REG8(0x58c2), 0x01 }, { CCI_REG8(0x58c3), 0x00 },
> > +       { CCI_REG8(0x58c4), 0x01 }, { CCI_REG8(0x58c5), 0x00 },
> > +       { CCI_REG8(0x58c6), 0x00 }, { CCI_REG8(0x58c7), 0x50 },
> > +       { CCI_REG8(0x58c8), 0x00 }, { CCI_REG8(0x58c9), 0x50 },
> > +       { CCI_REG8(0x58ca), 0x00 }, { CCI_REG8(0x58cb), 0x50 },
> > +       { CCI_REG8(0x58cc), 0x00 }, { CCI_REG8(0x58cd), 0x50 },
> > +       { CCI_REG8(0x58ce), 0x00 }, { CCI_REG8(0x58cf), 0x50 },
> > +       { CCI_REG8(0x58f0), 0x04 }, { CCI_REG8(0x58f1), 0x03 },
> > +       { CCI_REG8(0x58f2), 0x02 }, { CCI_REG8(0x58f3), 0x01 },
> > +       { CCI_REG8(0x58f4), 0x08 }, { CCI_REG8(0x58f5), 0x07 },
> > +       { CCI_REG8(0x58f6), 0x06 }, { CCI_REG8(0x58f7), 0x05 },
> > +       { CCI_REG8(0x58f8), 0x0c }, { CCI_REG8(0x58f9), 0x0b },
> > +       { CCI_REG8(0x58fa), 0x0a }, { CCI_REG8(0x58fb), 0x09 },
> > +       { CCI_REG8(0x58fc), 0x10 }, { CCI_REG8(0x58fd), 0x0f },
> > +       { CCI_REG8(0x58fe), 0x0e }, { CCI_REG8(0x58ff), 0x0d },
> > +       { CCI_REG8(0x5900), 0x14 }, { CCI_REG8(0x5901), 0x13 },
> > +       { CCI_REG8(0x5902), 0x12 }, { CCI_REG8(0x5903), 0x11 },
> > +       { CCI_REG8(0x5904), 0x18 }, { CCI_REG8(0x5905), 0x17 },
> > +       { CCI_REG8(0x5906), 0x16 }, { CCI_REG8(0x5907), 0x15 },
> > +       { CCI_REG8(0x5908), 0x1c }, { CCI_REG8(0x5909), 0x1b },
> > +       { CCI_REG8(0x590a), 0x1a }, { CCI_REG8(0x590b), 0x19 },
> > +       { CCI_REG8(0x590c), 0x20 }, { CCI_REG8(0x590d), 0x1f },
> > +       { CCI_REG8(0x590e), 0x1e }, { CCI_REG8(0x590f), 0x1d },
> > +       { CCI_REG8(0x5931), 0x02 }, { CCI_REG8(0x5932), 0x42 },
> > +       { CCI_REG8(0x5933), 0x24 }, { CCI_REG8(0x5953), 0x09 },
> > +       { CCI_REG8(0x5954), 0x00 }, { CCI_REG8(0x5989), 0x84 },
> > +       { CCI_REG8(0x59c3), 0x04 }, { CCI_REG8(0x59c4), 0x24 },
> > +       { CCI_REG8(0x59c5), 0x40 }, { CCI_REG8(0x59c6), 0x1b },
> > +       { CCI_REG8(0x59c7), 0x40 }, { CCI_REG8(0x5a02), 0x0f },
> > +       { CCI_REG8(0x5f00), 0x29 }, { CCI_REG8(0x5f2d), 0x28 },
> > +       { CCI_REG8(0x5f2e), 0x28 }, { CCI_REG8(0x6801), 0x11 },
> > +       { CCI_REG8(0x6802), 0x3f }, { CCI_REG8(0x6803), 0xe7 },
> > +       { CCI_REG8(0x6825), 0x0f }, { CCI_REG8(0x6826), 0x20 },
> > +       { CCI_REG8(0x6827), 0x00 }, { CCI_REG8(0x6829), 0x16 },
> > +       { CCI_REG8(0x682b), 0xb3 }, { CCI_REG8(0x682c), 0x01 },
> > +       { CCI_REG8(0x6832), 0xff }, { CCI_REG8(0x6833), 0xff },
> > +       { CCI_REG8(0x6898), 0x80 }, { CCI_REG8(0x6899), 0x80 },
> > +       { CCI_REG8(0x689b), 0x40 }, { CCI_REG8(0x689c), 0x20 },
> > +       { CCI_REG8(0x689d), 0x20 }, { CCI_REG8(0x689e), 0x80 },
> > +       { CCI_REG8(0x689f), 0x60 }, { CCI_REG8(0x68a0), 0x40 },
> > +       { CCI_REG8(0x68a4), 0x40 }, { CCI_REG8(0x68a5), 0x20 },
> > +       { CCI_REG8(0x68a6), 0x00 }, { CCI_REG8(0x68b6), 0x80 },
> > +       { CCI_REG8(0x68b7), 0x80 }, { CCI_REG8(0x68b8), 0x80 },
> > +       { CCI_REG8(0x68bc), 0x80 }, { CCI_REG8(0x68bd), 0x80 },
> > +       { CCI_REG8(0x68be), 0x80 }, { CCI_REG8(0x68bf), 0x40 },
> > +       { CCI_REG8(0x68c2), 0x80 }, { CCI_REG8(0x68c3), 0x80 },
> > +       { CCI_REG8(0x68c4), 0x60 }, { CCI_REG8(0x68c5), 0x30 },
> > +       { CCI_REG8(0x6918), 0x80 }, { CCI_REG8(0x6919), 0x80 },
> > +       { CCI_REG8(0x691b), 0x40 }, { CCI_REG8(0x691c), 0x20 },
> > +       { CCI_REG8(0x691d), 0x20 }, { CCI_REG8(0x691e), 0x80 },
> > +       { CCI_REG8(0x691f), 0x60 }, { CCI_REG8(0x6920), 0x40 },
> > +       { CCI_REG8(0x6924), 0x40 }, { CCI_REG8(0x6925), 0x20 },
> > +       { CCI_REG8(0x6926), 0x00 }, { CCI_REG8(0x6936), 0x40 },
> > +       { CCI_REG8(0x6937), 0x40 }, { CCI_REG8(0x6938), 0x20 },
> > +       { CCI_REG8(0x6939), 0x20 }, { CCI_REG8(0x693a), 0x10 },
> > +       { CCI_REG8(0x693b), 0x10 }, { CCI_REG8(0x693c), 0x20 },
> > +       { CCI_REG8(0x693d), 0x20 }, { CCI_REG8(0x693e), 0x10 },
> > +       { CCI_REG8(0x693f), 0x10 }, { CCI_REG8(0x6940), 0x00 },
> > +       { CCI_REG8(0x6941), 0x00 }, { CCI_REG8(0x6942), 0x08 },
> > +       { CCI_REG8(0x6943), 0x08 }, { CCI_REG8(0x6944), 0x00 },
> > +       { CCI_REG8(0x69c2), 0x07 }, { CCI_REG8(0x6a20), 0x01 },
> > +       { CCI_REG8(0x6a23), 0x10 }, { CCI_REG8(0x6a26), 0x3d },
> > +       { CCI_REG8(0x6a27), 0x3e }, { CCI_REG8(0x6a38), 0x02 },
> > +       { CCI_REG8(0x6a39), 0x20 }, { CCI_REG8(0x6a3a), 0x02 },
> > +       { CCI_REG8(0x6a3b), 0x84 }, { CCI_REG8(0x6a3e), 0x02 },
> > +       { CCI_REG8(0x6a3f), 0x20 }, { CCI_REG8(0x6a47), 0x3b },
> > +       { CCI_REG8(0x6a63), 0x04 }, { CCI_REG8(0x6a65), 0x00 },
> > +       { CCI_REG8(0x6a67), 0x0f }, { CCI_REG8(0x6b22), 0x07 },
> > +       { CCI_REG8(0x6b23), 0xc2 }, { CCI_REG8(0x6b2f), 0x00 },
> > +       { CCI_REG8(0x6b60), 0x1f }, { CCI_REG8(0x6bd2), 0x5a },
> > +       { CCI_REG8(0x6c20), 0x50 }, { CCI_REG8(0x6c60), 0x50 },
> > +       { CCI_REG8(0x6c61), 0x06 }, { CCI_REG8(0x7318), 0x04 },
> > +       { CCI_REG8(0x7319), 0x01 }, { CCI_REG8(0x731a), 0x04 },
> > +       { CCI_REG8(0x731b), 0x01 }, { CCI_REG8(0x731c), 0x00 },
> > +       { CCI_REG8(0x731d), 0x00 }, { CCI_REG8(0x731e), 0x04 },
> > +       { CCI_REG8(0x731f), 0x01 }, { CCI_REG8(0x7320), 0x04 },
> > +       { CCI_REG8(0x7321), 0x00 }, { CCI_REG8(0x7322), 0x04 },
> > +       { CCI_REG8(0x7323), 0x00 }, { CCI_REG8(0x7324), 0x04 },
> > +       { CCI_REG8(0x7325), 0x00 }, { CCI_REG8(0x7326), 0x04 },
> > +       { CCI_REG8(0x7327), 0x00 }, { CCI_REG8(0x7600), 0x00 },
> > +       { CCI_REG8(0x7601), 0x00 }, { CCI_REG8(0x7602), 0x10 },
> > +       { CCI_REG8(0x7603), 0x00 }, { CCI_REG8(0x7604), 0x00 },
> > +       { CCI_REG8(0x7605), 0x00 }, { CCI_REG8(0x7606), 0x10 },
> > +       { CCI_REG8(0x7607), 0x00 }, { CCI_REG8(0x7608), 0x00 },
> > +       { CCI_REG8(0x7609), 0x00 }, { CCI_REG8(0x760a), 0x10 },
> > +       { CCI_REG8(0x760b), 0x00 }, { CCI_REG8(0x760c), 0x00 },
> > +       { CCI_REG8(0x760d), 0x00 }, { CCI_REG8(0x760e), 0x10 },
> > +       { CCI_REG8(0x760f), 0x00 }, { CCI_REG8(0x7610), 0x00 },
> > +       { CCI_REG8(0x7611), 0x00 }, { CCI_REG8(0x7612), 0x10 },
> > +       { CCI_REG8(0x7613), 0x00 }, { CCI_REG8(0x7614), 0x00 },
> > +       { CCI_REG8(0x7615), 0x00 }, { CCI_REG8(0x7616), 0x10 },
> > +       { CCI_REG8(0x7617), 0x00 }, { CCI_REG8(0x7618), 0x00 },
> > +       { CCI_REG8(0x7619), 0x00 }, { CCI_REG8(0x761a), 0x10 },
> > +       { CCI_REG8(0x761b), 0x00 }, { CCI_REG8(0x761c), 0x00 },
> > +       { CCI_REG8(0x761d), 0x00 }, { CCI_REG8(0x761e), 0x10 },
> > +       { CCI_REG8(0x761f), 0x00 }, { CCI_REG8(0x7620), 0x00 },
> > +       { CCI_REG8(0x7621), 0x00 }, { CCI_REG8(0x7622), 0x10 },
> > +       { CCI_REG8(0x7623), 0x00 }, { CCI_REG8(0x7624), 0x00 },
> > +       { CCI_REG8(0x7625), 0x00 }, { CCI_REG8(0x7626), 0x10 },
> > +       { CCI_REG8(0x7627), 0x00 }, { CCI_REG8(0x7628), 0x00 },
> > +       { CCI_REG8(0x7629), 0x00 }, { CCI_REG8(0x762a), 0x10 },
> > +       { CCI_REG8(0x762b), 0x00 }, { CCI_REG8(0x762c), 0x00 },
> > +       { CCI_REG8(0x762d), 0x00 }, { CCI_REG8(0x762e), 0x10 },
> > +       { CCI_REG8(0x762f), 0x00 }, { CCI_REG8(0x7630), 0x00 },
> > +       { CCI_REG8(0x7631), 0x00 }, { CCI_REG8(0x7632), 0x10 },
> > +       { CCI_REG8(0x7633), 0x00 }, { CCI_REG8(0x7634), 0x00 },
> > +       { CCI_REG8(0x7635), 0x00 }, { CCI_REG8(0x7636), 0x10 },
> > +       { CCI_REG8(0x7637), 0x00 }, { CCI_REG8(0x7638), 0x00 },
> > +       { CCI_REG8(0x7639), 0x00 }, { CCI_REG8(0x763a), 0x10 },
> > +       { CCI_REG8(0x763b), 0x00 }, { CCI_REG8(0x763c), 0x00 },
> > +       { CCI_REG8(0x763d), 0x00 }, { CCI_REG8(0x763e), 0x10 },
> > +       { CCI_REG8(0x763f), 0x00 }, { CCI_REG8(0x7640), 0x00 },
> > +       { CCI_REG8(0x7641), 0x00 }, { CCI_REG8(0x7642), 0x10 },
> > +       { CCI_REG8(0x7643), 0x00 }, { CCI_REG8(0x7644), 0x00 },
> > +       { CCI_REG8(0x7645), 0x00 }, { CCI_REG8(0x7646), 0x10 },
> > +       { CCI_REG8(0x7647), 0x00 }, { CCI_REG8(0x7648), 0x00 },
> > +       { CCI_REG8(0x7649), 0x00 }, { CCI_REG8(0x764a), 0x10 },
> > +       { CCI_REG8(0x764b), 0x00 }, { CCI_REG8(0x764c), 0x00 },
> > +       { CCI_REG8(0x764d), 0x00 }, { CCI_REG8(0x764e), 0x10 },
> > +       { CCI_REG8(0x764f), 0x00 }, { CCI_REG8(0x7650), 0x00 },
> > +       { CCI_REG8(0x7651), 0x00 }, { CCI_REG8(0x7652), 0x10 },
> > +       { CCI_REG8(0x7653), 0x00 }, { CCI_REG8(0x7654), 0x00 },
> > +       { CCI_REG8(0x7655), 0x00 }, { CCI_REG8(0x7656), 0x10 },
> > +       { CCI_REG8(0x7657), 0x00 }, { CCI_REG8(0x7658), 0x00 },
> > +       { CCI_REG8(0x7659), 0x00 }, { CCI_REG8(0x765a), 0x10 },
> > +       { CCI_REG8(0x765b), 0x00 }, { CCI_REG8(0x765c), 0x00 },
> > +       { CCI_REG8(0x765d), 0x00 }, { CCI_REG8(0x765e), 0x10 },
> > +       { CCI_REG8(0x765f), 0x00 }, { CCI_REG8(0x7660), 0x00 },
> > +       { CCI_REG8(0x7661), 0x00 }, { CCI_REG8(0x7662), 0x10 },
> > +       { CCI_REG8(0x7663), 0x00 }, { CCI_REG8(0x7664), 0x00 },
> > +       { CCI_REG8(0x7665), 0x00 }, { CCI_REG8(0x7666), 0x10 },
> > +       { CCI_REG8(0x7667), 0x00 }, { CCI_REG8(0x7668), 0x00 },
> > +       { CCI_REG8(0x7669), 0x00 }, { CCI_REG8(0x766a), 0x10 },
> > +       { CCI_REG8(0x766b), 0x00 }, { CCI_REG8(0x766c), 0x00 },
> > +       { CCI_REG8(0x766d), 0x00 }, { CCI_REG8(0x766e), 0x10 },
> > +       { CCI_REG8(0x766f), 0x00 }, { CCI_REG8(0x7670), 0x00 },
> > +       { CCI_REG8(0x7671), 0x00 }, { CCI_REG8(0x7672), 0x10 },
> > +       { CCI_REG8(0x7673), 0x00 }, { CCI_REG8(0x7674), 0x00 },
> > +       { CCI_REG8(0x7675), 0x00 }, { CCI_REG8(0x7676), 0x10 },
> > +       { CCI_REG8(0x7677), 0x00 }, { CCI_REG8(0x7678), 0x00 },
> > +       { CCI_REG8(0x7679), 0x00 }, { CCI_REG8(0x767a), 0x10 },
> > +       { CCI_REG8(0x767b), 0x00 }, { CCI_REG8(0x767c), 0x00 },
> > +       { CCI_REG8(0x767d), 0x00 }, { CCI_REG8(0x767e), 0x10 },
> > +       { CCI_REG8(0x767f), 0x00 }, { CCI_REG8(0x7680), 0x00 },
> > +       { CCI_REG8(0x7681), 0x00 }, { CCI_REG8(0x7682), 0x10 },
> > +       { CCI_REG8(0x7683), 0x00 }, { CCI_REG8(0x7684), 0x00 },
> > +       { CCI_REG8(0x7685), 0x00 }, { CCI_REG8(0x7686), 0x10 },
> > +       { CCI_REG8(0x7687), 0x00 }, { CCI_REG8(0x7688), 0x00 },
> > +       { CCI_REG8(0x7689), 0x00 }, { CCI_REG8(0x768a), 0x10 },
> > +       { CCI_REG8(0x768b), 0x00 }, { CCI_REG8(0x768c), 0x00 },
> > +       { CCI_REG8(0x768d), 0x00 }, { CCI_REG8(0x768e), 0x10 },
> > +       { CCI_REG8(0x768f), 0x00 }, { CCI_REG8(0x7690), 0x00 },
> > +       { CCI_REG8(0x7691), 0x00 }, { CCI_REG8(0x7692), 0x10 },
> > +       { CCI_REG8(0x7693), 0x00 }, { CCI_REG8(0x7694), 0x00 },
> > +       { CCI_REG8(0x7695), 0x00 }, { CCI_REG8(0x7696), 0x10 },
> > +       { CCI_REG8(0x7697), 0x00 }, { CCI_REG8(0x7698), 0x00 },
> > +       { CCI_REG8(0x7699), 0x00 }, { CCI_REG8(0x769a), 0x10 },
> > +       { CCI_REG8(0x769b), 0x00 }, { CCI_REG8(0x769c), 0x00 },
> > +       { CCI_REG8(0x769d), 0x00 }, { CCI_REG8(0x769e), 0x10 },
> > +       { CCI_REG8(0x769f), 0x00 }, { CCI_REG8(0x76a0), 0x00 },
> > +       { CCI_REG8(0x76a1), 0x00 }, { CCI_REG8(0x76a2), 0x10 },
> > +       { CCI_REG8(0x76a3), 0x00 }, { CCI_REG8(0x76a4), 0x00 },
> > +       { CCI_REG8(0x76a5), 0x00 }, { CCI_REG8(0x76a6), 0x10 },
> > +       { CCI_REG8(0x76a7), 0x00 }, { CCI_REG8(0x76a8), 0x00 },
> > +       { CCI_REG8(0x76a9), 0x00 }, { CCI_REG8(0x76aa), 0x10 },
> > +       { CCI_REG8(0x76ab), 0x00 }, { CCI_REG8(0x76ac), 0x00 },
> > +       { CCI_REG8(0x76ad), 0x00 }, { CCI_REG8(0x76ae), 0x10 },
> > +       { CCI_REG8(0x76af), 0x00 }, { CCI_REG8(0x76b0), 0x00 },
> > +       { CCI_REG8(0x76b1), 0x00 }, { CCI_REG8(0x76b2), 0x10 },
> > +       { CCI_REG8(0x76b3), 0x00 }, { CCI_REG8(0x76b4), 0x00 },
> > +       { CCI_REG8(0x76b5), 0x00 }, { CCI_REG8(0x76b6), 0x10 },
> > +       { CCI_REG8(0x76b7), 0x00 }, { CCI_REG8(0x76b8), 0x00 },
> > +       { CCI_REG8(0x76b9), 0x00 }, { CCI_REG8(0x76ba), 0x10 },
> > +       { CCI_REG8(0x76bb), 0x00 }, { CCI_REG8(0x76bc), 0x00 },
> > +       { CCI_REG8(0x76bd), 0x00 }, { CCI_REG8(0x76be), 0x10 },
> > +       { CCI_REG8(0x76bf), 0x00 }, { CCI_REG8(0x76c0), 0x00 },
> > +       { CCI_REG8(0x76c1), 0x00 }, { CCI_REG8(0x76c2), 0x10 },
> > +       { CCI_REG8(0x76c3), 0x00 }, { CCI_REG8(0x76c4), 0x00 },
> > +       { CCI_REG8(0x76c5), 0x00 }, { CCI_REG8(0x76c6), 0x10 },
> > +       { CCI_REG8(0x76c7), 0x00 }, { CCI_REG8(0x76c8), 0x00 },
> > +       { CCI_REG8(0x76c9), 0x00 }, { CCI_REG8(0x76ca), 0x10 },
> > +       { CCI_REG8(0x76cb), 0x00 }, { CCI_REG8(0x76cc), 0x00 },
> > +       { CCI_REG8(0x76cd), 0x00 }, { CCI_REG8(0x76ce), 0x10 },
> > +       { CCI_REG8(0x76cf), 0x00 }, { CCI_REG8(0x76d0), 0x00 },
> > +       { CCI_REG8(0x76d1), 0x00 }, { CCI_REG8(0x76d2), 0x10 },
> > +       { CCI_REG8(0x76d3), 0x00 }, { CCI_REG8(0x76d4), 0x00 },
> > +       { CCI_REG8(0x76d5), 0x00 }, { CCI_REG8(0x76d6), 0x10 },
> > +       { CCI_REG8(0x76d7), 0x00 }, { CCI_REG8(0x76d8), 0x00 },
> > +       { CCI_REG8(0x76d9), 0x00 }, { CCI_REG8(0x76da), 0x10 },
> > +       { CCI_REG8(0x76db), 0x00 }, { CCI_REG8(0x76dc), 0x00 },
> > +       { CCI_REG8(0x76dd), 0x00 }, { CCI_REG8(0x76de), 0x10 },
> > +       { CCI_REG8(0x76df), 0x00 }, { CCI_REG8(0x76e0), 0x00 },
> > +       { CCI_REG8(0x76e1), 0x00 }, { CCI_REG8(0x76e2), 0x10 },
> > +       { CCI_REG8(0x76e3), 0x00 }, { CCI_REG8(0x76e4), 0x00 },
> > +       { CCI_REG8(0x76e5), 0x00 }, { CCI_REG8(0x76e6), 0x10 },
> > +       { CCI_REG8(0x76e7), 0x00 }, { CCI_REG8(0x76e8), 0x00 },
> > +       { CCI_REG8(0x76e9), 0x00 }, { CCI_REG8(0x76ea), 0x10 },
> > +       { CCI_REG8(0x76eb), 0x00 }, { CCI_REG8(0x76ec), 0x00 },
> > +       { CCI_REG8(0x76ed), 0x00 }, { CCI_REG8(0x76ee), 0x10 },
> > +       { CCI_REG8(0x76ef), 0x00 }, { CCI_REG8(0x76f0), 0x00 },
> > +       { CCI_REG8(0x76f1), 0x00 }, { CCI_REG8(0x76f2), 0x10 },
> > +       { CCI_REG8(0x76f3), 0x00 }, { CCI_REG8(0x76f4), 0x00 },
> > +       { CCI_REG8(0x76f5), 0x00 }, { CCI_REG8(0x76f6), 0x10 },
> > +       { CCI_REG8(0x76f7), 0x00 }, { CCI_REG8(0x76f8), 0x00 },
> > +       { CCI_REG8(0x76f9), 0x00 }, { CCI_REG8(0x76fa), 0x10 },
> > +       { CCI_REG8(0x76fb), 0x00 }, { CCI_REG8(0x76fc), 0x00 },
> > +       { CCI_REG8(0x76fd), 0x00 }, { CCI_REG8(0x76fe), 0x10 },
> > +       { CCI_REG8(0x76ff), 0x00 }, { CCI_REG8(0x7700), 0x00 },
> > +       { CCI_REG8(0x7701), 0x00 }, { CCI_REG8(0x7702), 0x10 },
> > +       { CCI_REG8(0x7703), 0x00 }, { CCI_REG8(0x7704), 0x00 },
> > +       { CCI_REG8(0x7705), 0x00 }, { CCI_REG8(0x7706), 0x10 },
> > +       { CCI_REG8(0x7707), 0x00 }, { CCI_REG8(0x7708), 0x00 },
> > +       { CCI_REG8(0x7709), 0x00 }, { CCI_REG8(0x770a), 0x10 },
> > +       { CCI_REG8(0x770b), 0x00 }, { CCI_REG8(0x770c), 0x00 },
> > +       { CCI_REG8(0x770d), 0x00 }, { CCI_REG8(0x770e), 0x10 },
> > +       { CCI_REG8(0x770f), 0x00 }, { CCI_REG8(0x7710), 0x00 },
> > +       { CCI_REG8(0x7711), 0x00 }, { CCI_REG8(0x7712), 0x10 },
> > +       { CCI_REG8(0x7713), 0x00 }, { CCI_REG8(0x7714), 0x00 },
> > +       { CCI_REG8(0x7715), 0x00 }, { CCI_REG8(0x7716), 0x10 },
> > +       { CCI_REG8(0x7717), 0x00 }, { CCI_REG8(0x7718), 0x00 },
> > +       { CCI_REG8(0x7719), 0x00 }, { CCI_REG8(0x771a), 0x10 },
> > +       { CCI_REG8(0x771b), 0x00 }, { CCI_REG8(0x771c), 0x00 },
> > +       { CCI_REG8(0x771d), 0x00 }, { CCI_REG8(0x771e), 0x10 },
> > +       { CCI_REG8(0x771f), 0x00 }, { CCI_REG8(0x7720), 0x00 },
> > +       { CCI_REG8(0x7721), 0x00 }, { CCI_REG8(0x7722), 0x10 },
> > +       { CCI_REG8(0x7723), 0x00 }, { CCI_REG8(0x7724), 0x00 },
> > +       { CCI_REG8(0x7725), 0x00 }, { CCI_REG8(0x7726), 0x10 },
> > +       { CCI_REG8(0x7727), 0x00 }, { CCI_REG8(0x7728), 0x00 },
> > +       { CCI_REG8(0x7729), 0x00 }, { CCI_REG8(0x772a), 0x10 },
> > +       { CCI_REG8(0x772b), 0x00 }, { CCI_REG8(0x772c), 0x00 },
> > +       { CCI_REG8(0x772d), 0x00 }, { CCI_REG8(0x772e), 0x10 },
> > +       { CCI_REG8(0x772f), 0x00 }, { CCI_REG8(0x7730), 0x00 },
> > +       { CCI_REG8(0x7731), 0x00 }, { CCI_REG8(0x7732), 0x10 },
> > +       { CCI_REG8(0x7733), 0x00 }, { CCI_REG8(0x7734), 0x00 },
> > +       { CCI_REG8(0x7735), 0x00 }, { CCI_REG8(0x7736), 0x10 },
> > +       { CCI_REG8(0x7737), 0x00 }, { CCI_REG8(0x7738), 0x00 },
> > +       { CCI_REG8(0x7739), 0x00 }, { CCI_REG8(0x773a), 0x10 },
> > +       { CCI_REG8(0x773b), 0x00 }, { CCI_REG8(0x773c), 0x00 },
> > +       { CCI_REG8(0x773d), 0x00 }, { CCI_REG8(0x773e), 0x10 },
> > +       { CCI_REG8(0x773f), 0x00 }, { CCI_REG8(0x7740), 0x00 },
> > +       { CCI_REG8(0x7741), 0x00 }, { CCI_REG8(0x7742), 0x10 },
> > +       { CCI_REG8(0x7743), 0x00 }, { CCI_REG8(0x3421), 0x02 },
> > +       { CCI_REG8(0x37d0), 0x00 }, { CCI_REG8(0x3632), 0x99 },
> > +       { CCI_REG8(0xc518), 0x1f }, { CCI_REG8(0xc519), 0x1f },
> > +       { CCI_REG8(0xc51a), 0x1f }, { CCI_REG8(0xc51b), 0x1f },
> > +       { CCI_REG8(0xc51c), 0x1f }, { CCI_REG8(0xc51d), 0x1f },
> > +       { CCI_REG8(0xc51e), 0x1f }, { CCI_REG8(0xc51f), 0x1f },
> > +       { CCI_REG8(0xc520), 0x1f }, { CCI_REG8(0xc521), 0x1f },
> > +       { CCI_REG8(0x3616), 0xa0 }, { CCI_REG8(0x3615), 0xc5 },
> > +       { CCI_REG8(0xc4c1), 0x02 }, { CCI_REG8(0xc4c2), 0x02 },
> > +       { CCI_REG8(0xc4c3), 0x03 }, { CCI_REG8(0xc4c4), 0x03 },
> > +       { CCI_REG8(0xc4f6), 0x0a }, { CCI_REG8(0xc4f7), 0x0a },
> > +       { CCI_REG8(0xc4f8), 0x0a }, { CCI_REG8(0xc4f9), 0x0a },
> > +       { CCI_REG8(0xc4fa), 0x0a }, { CCI_REG8(0xc4c6), 0x0a },
> > +       { CCI_REG8(0xc4c7), 0x0a }, { CCI_REG8(0xc4c8), 0x0a },
> > +       { CCI_REG8(0xc4c9), 0x0a }, { CCI_REG8(0xc4ca), 0x14 },
> > +       { CCI_REG8(0xc4cb), 0x14 }, { CCI_REG8(0xc4cc), 0x14 },
> > +       { CCI_REG8(0xc4cd), 0x14 }, { CCI_REG8(0x3b92), 0x05 },
> > +       { CCI_REG8(0x3b93), 0x05 }, { CCI_REG8(0x3b94), 0x05 },
> > +       { CCI_REG8(0x3b95), 0x05 }, { CCI_REG8(0x3623), 0x10 },
> > +       { CCI_REG8(0xc522), 0x18 }, { CCI_REG8(0xc523), 0x12 },
> > +       { CCI_REG8(0xc524), 0x0e }, { CCI_REG8(0xc525), 0x0b },
> > +       { CCI_REG8(0xc526), 0x18 }, { CCI_REG8(0xc527), 0x12 },
> > +       { CCI_REG8(0xc528), 0x0c }, { CCI_REG8(0xc529), 0x08 },
> > +       { CCI_REG8(0xc52a), 0x18 }, { CCI_REG8(0xc52b), 0x12 },
> > +       { CCI_REG8(0xc52c), 0x0e }, { CCI_REG8(0xc52d), 0x0b },
> > +       { CCI_REG8(0xc52e), 0x18 }, { CCI_REG8(0xc52f), 0x12 },
> > +       { CCI_REG8(0xc530), 0x0e }, { CCI_REG8(0xc531), 0x0b },
> > +       { CCI_REG8(0xc532), 0x18 }, { CCI_REG8(0xc533), 0x12 },
> > +       { CCI_REG8(0xc534), 0x0e }, { CCI_REG8(0xc535), 0x0b },
> > +       { CCI_REG8(0xc536), 0x18 }, { CCI_REG8(0xc537), 0x12 },
> > +       { CCI_REG8(0xc538), 0x0e }, { CCI_REG8(0xc539), 0x0b },
> > +       { CCI_REG8(0xc53a), 0x18 }, { CCI_REG8(0xc53b), 0x12 },
> > +       { CCI_REG8(0xc53c), 0x0c }, { CCI_REG8(0xc53d), 0x08 },
> > +       { CCI_REG8(0xc53e), 0x18 }, { CCI_REG8(0xc53f), 0x12 },
> > +       { CCI_REG8(0xc540), 0x0e }, { CCI_REG8(0xc541), 0x0b },
> > +       { CCI_REG8(0xc542), 0x18 }, { CCI_REG8(0xc543), 0x12 },
> > +       { CCI_REG8(0xc544), 0x0e }, { CCI_REG8(0xc545), 0x0b },
> > +       { CCI_REG8(0xc546), 0x18 }, { CCI_REG8(0xc547), 0x12 },
> > +       { CCI_REG8(0xc548), 0x0e }, { CCI_REG8(0xc549), 0x0b },
> > +       { CCI_REG8(0x3701), 0x18 }, { CCI_REG8(0x3702), 0x38 },
> > +       { CCI_REG8(0x3703), 0x72 }, { CCI_REG8(0x3708), 0x26 },
> > +       { CCI_REG8(0x3709), 0xe6 }, { CCI_REG8(0x3a1d), 0x18 },
> > +       { CCI_REG8(0x3a1e), 0x18 }, { CCI_REG8(0x3a21), 0x18 },
> > +       { CCI_REG8(0x3a22), 0x18 }, { CCI_REG8(0x39fb), 0x18 },
> > +       { CCI_REG8(0x39fc), 0x18 }, { CCI_REG8(0x39fd), 0x18 },
> > +       { CCI_REG8(0x39fe), 0x18 }, { CCI_REG8(0xc44a), 0x08 },
> > +       { CCI_REG8(0xc44c), 0x08 }, { CCI_REG8(0xc5e8), 0x0a },
> > +       { CCI_REG8(0xc5ea), 0x0a }, { CCI_REG8(0x391d), 0x54 },
> > +       { CCI_REG8(0x391e), 0xca }, { CCI_REG8(0x3991), 0x0c },
> > +       { CCI_REG8(0x399d), 0x0c }, { CCI_REG8(0x3744), 0x24 },
> > +       { CCI_REG8(0x374b), 0x0c }, { CCI_REG8(0x3be7), 0x1e },
> > +       { CCI_REG8(0x3be8), 0x26 }, { CCI_REG8(0x3a50), 0x14 },
> > +       { CCI_REG8(0x3a54), 0x14 }, { CCI_REG8(0x3add), 0x1f },
> > +       { CCI_REG8(0x3adf), 0x24 }, { CCI_REG8(0x3aef), 0x1f },
> > +       { CCI_REG8(0x3af0), 0x24 }, { CCI_REG8(0xc57f), 0x30 },
> > +       { CCI_REG8(0xc580), 0x30 }, { CCI_REG8(0xc581), 0x30 },
> > +       { CCI_REG8(0xc582), 0x30 }, { CCI_REG8(0xc583), 0x30 },
> > +       { CCI_REG8(0xc584), 0x30 }, { CCI_REG8(0xc585), 0x30 },
> > +       { CCI_REG8(0xc586), 0x30 }, { CCI_REG8(0xc587), 0x30 },
> > +       { CCI_REG8(0xc588), 0x30 }, { CCI_REG8(0xc589), 0x30 },
> > +       { CCI_REG8(0xc58a), 0x30 }, { CCI_REG8(0xc58b), 0x30 },
> > +       { CCI_REG8(0xc58c), 0x30 }, { CCI_REG8(0xc58d), 0x30 },
> > +       { CCI_REG8(0xc58e), 0x30 }, { CCI_REG8(0xc58f), 0x30 },
> > +       { CCI_REG8(0xc590), 0x30 }, { CCI_REG8(0xc591), 0x30 },
> > +       { CCI_REG8(0xc592), 0x30 }, { CCI_REG8(0xc598), 0x30 },
> > +       { CCI_REG8(0xc599), 0x30 }, { CCI_REG8(0xc59a), 0x30 },
> > +       { CCI_REG8(0xc59b), 0x30 }, { CCI_REG8(0xc59c), 0x30 },
> > +       { CCI_REG8(0xc59d), 0x30 }, { CCI_REG8(0xc59e), 0x30 },
> > +       { CCI_REG8(0xc59f), 0x30 }, { CCI_REG8(0xc5a0), 0x30 },
> > +       { CCI_REG8(0xc5a1), 0x30 }, { CCI_REG8(0xc5a2), 0x30 },
> > +       { CCI_REG8(0xc5a3), 0x30 }, { CCI_REG8(0xc5a4), 0x30 },
> > +       { CCI_REG8(0xc5a5), 0x30 }, { CCI_REG8(0xc5a6), 0x30 },
> > +       { CCI_REG8(0xc5a7), 0x30 }, { CCI_REG8(0xc5a8), 0x30 },
> > +       { CCI_REG8(0xc5a9), 0x30 }, { CCI_REG8(0xc5aa), 0x30 },
> > +       { CCI_REG8(0xc5ab), 0x30 }, { CCI_REG8(0xc5b1), 0x38 },
> > +       { CCI_REG8(0xc5b2), 0x38 }, { CCI_REG8(0xc5b3), 0x38 },
> > +       { CCI_REG8(0xc5b4), 0x38 }, { CCI_REG8(0xc5b5), 0x38 },
> > +       { CCI_REG8(0xc5b6), 0x38 }, { CCI_REG8(0xc5b7), 0x38 },
> > +       { CCI_REG8(0xc5b8), 0x38 }, { CCI_REG8(0xc5b9), 0x38 },
> > +       { CCI_REG8(0xc5ba), 0x38 }, { CCI_REG8(0xc5bb), 0x38 },
> > +       { CCI_REG8(0xc5bc), 0x38 }, { CCI_REG8(0xc5bd), 0x38 },
> > +       { CCI_REG8(0xc5be), 0x38 }, { CCI_REG8(0xc5bf), 0x38 },
> > +       { CCI_REG8(0xc5c0), 0x38 }, { CCI_REG8(0xc5c1), 0x38 },
> > +       { CCI_REG8(0xc5c2), 0x38 }, { CCI_REG8(0xc5c3), 0x38 },
> > +       { CCI_REG8(0xc5c4), 0x38 }, { CCI_REG8(0xc5ca), 0x38 },
> > +       { CCI_REG8(0xc5cb), 0x38 }, { CCI_REG8(0xc5cc), 0x38 },
> > +       { CCI_REG8(0xc5cd), 0x38 }, { CCI_REG8(0xc5ce), 0x38 },
> > +       { CCI_REG8(0xc5cf), 0x38 }, { CCI_REG8(0xc5d0), 0x38 },
> > +       { CCI_REG8(0xc5d1), 0x38 }, { CCI_REG8(0xc5d2), 0x38 },
> > +       { CCI_REG8(0xc5d3), 0x38 }, { CCI_REG8(0xc5d4), 0x38 },
> > +       { CCI_REG8(0xc5d5), 0x38 }, { CCI_REG8(0xc5d6), 0x38 },
> > +       { CCI_REG8(0xc5d7), 0x38 }, { CCI_REG8(0xc5d8), 0x38 },
> > +       { CCI_REG8(0xc5d9), 0x38 }, { CCI_REG8(0xc5da), 0x38 },
> > +       { CCI_REG8(0xc5db), 0x38 }, { CCI_REG8(0xc5dc), 0x38 },
> > +       { CCI_REG8(0xc5dd), 0x38 }, { CCI_REG8(0x3a60), 0x68 },
> > +       { CCI_REG8(0x3a6f), 0x68 }, { CCI_REG8(0x3a5e), 0xdc },
> > +       { CCI_REG8(0x3a6d), 0xdc }, { CCI_REG8(0x3aed), 0x6e },
> > +       { CCI_REG8(0x3af1), 0x73 }, { CCI_REG8(0x3992), 0x02 },
> > +       { CCI_REG8(0x399e), 0x02 }, { CCI_REG8(0x371d), 0x17 },
> > +       { CCI_REG8(0x371f), 0x08 }, { CCI_REG8(0x3721), 0xc9 },
> > +       { CCI_REG8(0x401e), 0x00 }, { CCI_REG8(0x401f), 0xf8 },
> > +       { CCI_REG8(0x3642), 0x00 }, { CCI_REG8(0x3641), 0x7f },
> > +       { CCI_REG8(0x3ac5), 0x0c }, { CCI_REG8(0x3ac6), 0x09 },
> > +       { CCI_REG8(0x3ac7), 0x06 }, { CCI_REG8(0x3ac8), 0x02 },
> > +       { CCI_REG8(0x3ac9), 0x0c }, { CCI_REG8(0x3aca), 0x09 },
> > +       { CCI_REG8(0x3acb), 0x06 }, { CCI_REG8(0x3acc), 0x02 },
> > +       { CCI_REG8(0x3acd), 0x0c }, { CCI_REG8(0x3ace), 0x09 },
> > +       { CCI_REG8(0x3acf), 0x07 }, { CCI_REG8(0x3ad0), 0x04 },
> > +       { CCI_REG8(0x3ad1), 0x0c }, { CCI_REG8(0x3ad2), 0x09 },
> > +       { CCI_REG8(0x3ad3), 0x07 }, { CCI_REG8(0x3ad4), 0x04 },
> > +       { CCI_REG8(0xc483), 0x0c }, { CCI_REG8(0xc484), 0x0c },
> > +       { CCI_REG8(0xc485), 0x0c }, { CCI_REG8(0xc486), 0x0c },
> > +       { CCI_REG8(0x3a2f), 0x0c }, { CCI_REG8(0x3a30), 0x09 },
> > +       { CCI_REG8(0x3a31), 0x06 }, { CCI_REG8(0x3a32), 0x02 },
> > +       { CCI_REG8(0x3a34), 0x0c }, { CCI_REG8(0x3a35), 0x09 },
> > +       { CCI_REG8(0x3a36), 0x07 }, { CCI_REG8(0x3a37), 0x04 },
> > +       { CCI_REG8(0x3a43), 0x0c }, { CCI_REG8(0x3a44), 0x09 },
> > +       { CCI_REG8(0x3a45), 0x06 }, { CCI_REG8(0x3a46), 0x02 },
> > +       { CCI_REG8(0x3a48), 0x0c }, { CCI_REG8(0x3a49), 0x09 },
> > +       { CCI_REG8(0x3a4a), 0x07 }, { CCI_REG8(0x3a4b), 0x04 },
> > +       { CCI_REG8(0xc487), 0x0c }, { CCI_REG8(0xc488), 0x0c },
> > +       { CCI_REG8(0xc489), 0x0c }, { CCI_REG8(0xc48a), 0x0c },
> > +       { CCI_REG8(0x3645), 0xbd }, { CCI_REG8(0x373f), 0x00 },
> > +       { CCI_REG8(0x374f), 0x10 }, { CCI_REG8(0x3743), 0xc6 },
> > +       { CCI_REG8(0x3717), 0x82 }, { CCI_REG8(0x3732), 0x07 },
> > +       { CCI_REG8(0x3731), 0x16 }, { CCI_REG8(0x3730), 0x16 },
> > +       { CCI_REG8(0x3828), 0x07 }, { CCI_REG8(0x3714), 0x68 },
> > +       { CCI_REG8(0x371d), 0x02 }, { CCI_REG8(0x371f), 0x02 },
> > +       { CCI_REG8(0x37e0), 0x00 }, { CCI_REG8(0x37e1), 0x03 },
> > +       { CCI_REG8(0x37e2), 0x07 }, { CCI_REG8(0x3734), 0x3e },
> > +       { CCI_REG8(0x3736), 0x02 }, { CCI_REG8(0x37e4), 0x36 },
> > +       { CCI_REG8(0x37e9), 0x1c }, { CCI_REG8(0x37ea), 0x01 },
> > +       { CCI_REG8(0x37eb), 0x0a }, { CCI_REG8(0x37ec), 0x1c },
> > +       { CCI_REG8(0x37ed), 0x01 }, { CCI_REG8(0x37ee), 0x36 },
> > +       { CCI_REG8(0x373b), 0x1c }, { CCI_REG8(0x373c), 0x02 },
> > +       { CCI_REG8(0x37bb), 0x1c }, { CCI_REG8(0x37bc), 0x02 },
> > +       { CCI_REG8(0x37b8), 0x0c }, { CCI_REG8(0x371c), 0x01 },
> > +       { CCI_REG8(0x371e), 0x11 }, { CCI_REG8(0x371d), 0x01 },
> > +       { CCI_REG8(0x371f), 0x01 }, { CCI_REG8(0x3721), 0x01 },
> > +       { CCI_REG8(0x3725), 0x12 }, { CCI_REG8(0x37e3), 0x06 },
> > +       { CCI_REG8(0x37dd), 0x86 }, { CCI_REG8(0x37db), 0x0a },
> > +       { CCI_REG8(0x37dc), 0x14 }, { CCI_REG8(0x3727), 0x20 },
> > +       { CCI_REG8(0x37b2), 0x80 }, { CCI_REG8(0x37da), 0x04 },
> > +       { CCI_REG8(0x37df), 0x01 }, { CCI_REG8(0x3731), 0x11 },
> > +       { CCI_REG8(0x37dd), 0x86 }, { CCI_REG8(0x37df), 0x01 },
> > +       { CCI_REG8(0x37da), 0x03 }, { CCI_REG8(0x37b2), 0x80 },
> > +       { CCI_REG8(0x3727), 0x20 }, { CCI_REG8(0x4883), 0x26 },
> > +       { CCI_REG8(0x488b), 0x88 }, { CCI_REG8(0x3d85), 0x1f },
> > +       { CCI_REG8(0x3d81), 0x01 }, { CCI_REG8(0x3d84), 0x40 },
> > +       { CCI_REG8(0x3d88), 0x00 }, { CCI_REG8(0x3d89), 0x00 },
> > +       { CCI_REG8(0x3d8a), 0x0b }, { CCI_REG8(0x3d8b), 0xff },
> > +       { CCI_REG8(0x4d00), 0x05 }, { CCI_REG8(0x4d01), 0xc4 },
> > +       { CCI_REG8(0x4d02), 0xa3 }, { CCI_REG8(0x4d03), 0x8c },
> > +       { CCI_REG8(0x4d04), 0xfb }, { CCI_REG8(0x4d05), 0xed },
> > +       { CCI_REG8(0x4010), 0x28 }, { CCI_REG8(0x4030), 0x00 },
> > +       { CCI_REG8(0x4031), 0x00 }, { CCI_REG8(0x4032), 0x00 },
> > +       { CCI_REG8(0x4033), 0x00 }, { CCI_REG8(0x4034), 0x00 },
> > +       { CCI_REG8(0x4035), 0x00 }, { CCI_REG8(0x4036), 0x00 },
> > +       { CCI_REG8(0x4037), 0x00 }, { CCI_REG8(0x4040), 0x00 },
> > +       { CCI_REG8(0x4041), 0x00 }, { CCI_REG8(0x4042), 0x00 },
> > +       { CCI_REG8(0x4043), 0x00 }, { CCI_REG8(0x4044), 0x00 },
> > +       { CCI_REG8(0x4045), 0x00 }, { CCI_REG8(0x4046), 0x00 },
> > +       { CCI_REG8(0x4047), 0x00 }, { CCI_REG8(0x3400), 0x00 },
> > +       { CCI_REG8(0x3421), 0x23 }, { CCI_REG8(0x3422), 0xfc },
> > +       { CCI_REG8(0x3423), 0x07 }, { CCI_REG8(0x3424), 0x01 },
> > +       { CCI_REG8(0x3425), 0x04 }, { CCI_REG8(0x3426), 0x50 },
> > +       { CCI_REG8(0x3427), 0x55 }, { CCI_REG8(0x3428), 0x15 },
> > +       { CCI_REG8(0x3429), 0x00 }, { CCI_REG8(0x3025), 0x03 },
> > +       { CCI_REG8(0x3053), 0x00 }, { CCI_REG8(0x3054), 0x00 },
> > +       { CCI_REG8(0x3055), 0x00 }, { CCI_REG8(0x3056), 0x00 },
> > +       { CCI_REG8(0x3057), 0x00 }, { CCI_REG8(0x3058), 0x00 },
> > +       { CCI_REG8(0x305c), 0x00 }, { CCI_REG8(0x340c), 0x1f },
> > +       { CCI_REG8(0x340d), 0x00 }, { CCI_REG8(0x3501), 0x01 },
> > +       { CCI_REG8(0x3542), 0x48 }, { CCI_REG8(0x3582), 0x24 },
> > +       { CCI_REG8(0x3015), 0xf1 }, { CCI_REG8(0x3018), 0xf2 },
> > +       { CCI_REG8(0x301c), 0xf2 }, { CCI_REG8(0x301d), 0xf6 },
> > +       { CCI_REG8(0x301e), 0xf1 }, { CCI_REG8(0x0100), 0x01 },
> > +       { CCI_REG8(0xfff9), 0x08 }, { CCI_REG8(0x3900), 0xcd },
> > +       { CCI_REG8(0x3901), 0xcd }, { CCI_REG8(0x3902), 0xcd },
> > +       { CCI_REG8(0x3903), 0xcd }, { CCI_REG8(0x3904), 0xcd },
> > +       { CCI_REG8(0x3905), 0xcd }, { CCI_REG8(0x3906), 0xcd },
> > +       { CCI_REG8(0x3907), 0xcd }, { CCI_REG8(0x3908), 0xcd },
> > +       { CCI_REG8(0x3909), 0xcd }, { CCI_REG8(0x390a), 0xcd },
> > +       { CCI_REG8(0x390b), 0xcd }, { CCI_REG8(0x390c), 0xcd },
> > +       { CCI_REG8(0x390d), 0xcd }, { CCI_REG8(0x390e), 0xcd },
> > +       { CCI_REG8(0x390f), 0xcd }, { CCI_REG8(0x3910), 0xcd },
> > +       { CCI_REG8(0x3911), 0xcd }, { CCI_REG8(0x3912), 0xcd },
> > +       { CCI_REG8(0x3913), 0xcd }, { CCI_REG8(0x3914), 0xcd },
> > +       { CCI_REG8(0x3915), 0xcd }, { CCI_REG8(0x3916), 0xcd },
> > +       { CCI_REG8(0x3917), 0xcd }, { CCI_REG8(0x3918), 0xcd },
> > +       { CCI_REG8(0x3919), 0xcd }, { CCI_REG8(0x391a), 0xcd },
> > +       { CCI_REG8(0x391b), 0xcd }, { CCI_REG8(0x391c), 0xcd },
> > +       { CCI_REG8(0x391d), 0xcd }, { CCI_REG8(0x391e), 0xcd },
> > +       { CCI_REG8(0x391f), 0xcd }, { CCI_REG8(0x3920), 0xcd },
> > +       { CCI_REG8(0x3921), 0xcd }, { CCI_REG8(0x3922), 0xcd },
> > +       { CCI_REG8(0x3923), 0xcd }, { CCI_REG8(0x3924), 0xcd },
> > +       { CCI_REG8(0x3925), 0xcd }, { CCI_REG8(0x3926), 0xcd },
> > +       { CCI_REG8(0x3927), 0xcd }, { CCI_REG8(0x3928), 0xcd },
> > +       { CCI_REG8(0x3929), 0xcd }, { CCI_REG8(0x392a), 0xcd },
> > +       { CCI_REG8(0x392b), 0xcd }, { CCI_REG8(0x392c), 0xcd },
> > +       { CCI_REG8(0x392d), 0xcd }, { CCI_REG8(0x392e), 0xcd },
> > +       { CCI_REG8(0x392f), 0xcd }, { CCI_REG8(0x3930), 0xcd },
> > +       { CCI_REG8(0x3931), 0xcd }, { CCI_REG8(0x3932), 0xcd },
> > +       { CCI_REG8(0x3933), 0xcd }, { CCI_REG8(0x3934), 0xcd },
> > +       { CCI_REG8(0x3935), 0xcd }, { CCI_REG8(0x3936), 0xcd },
> > +       { CCI_REG8(0x3937), 0xcd }, { CCI_REG8(0x3938), 0xcd },
> > +       { CCI_REG8(0x3939), 0xcd }, { CCI_REG8(0x393a), 0xcd },
> > +       { CCI_REG8(0x393b), 0xcd }, { CCI_REG8(0x393c), 0xcd },
> > +       { CCI_REG8(0x393d), 0xcd }, { CCI_REG8(0x393e), 0xcd },
> > +       { CCI_REG8(0x393f), 0xcd }, { CCI_REG8(0x3940), 0xcd },
> > +       { CCI_REG8(0x3941), 0xcd }, { CCI_REG8(0x3942), 0xcd },
> > +       { CCI_REG8(0x3943), 0xcd }, { CCI_REG8(0x3944), 0xcd },
> > +       { CCI_REG8(0x3945), 0xcd }, { CCI_REG8(0x3946), 0xcd },
> > +       { CCI_REG8(0x3947), 0xcd }, { CCI_REG8(0x3948), 0xcd },
> > +       { CCI_REG8(0x3949), 0xcd }, { CCI_REG8(0x394a), 0xcd },
> > +       { CCI_REG8(0x394b), 0xcd }, { CCI_REG8(0x394c), 0xcd },
> > +       { CCI_REG8(0x394d), 0xcd }, { CCI_REG8(0x394e), 0xcd },
> > +       { CCI_REG8(0x394f), 0xcd }, { CCI_REG8(0x3950), 0xcd },
> > +       { CCI_REG8(0x3951), 0xcd }, { CCI_REG8(0x3952), 0xcd },
> > +       { CCI_REG8(0x3953), 0xcd }, { CCI_REG8(0x3954), 0xcd },
> > +       { CCI_REG8(0x3955), 0xcd }, { CCI_REG8(0x3956), 0xcd },
> > +       { CCI_REG8(0x3957), 0xcd }, { CCI_REG8(0x3958), 0xcd },
> > +       { CCI_REG8(0x3959), 0xcd }, { CCI_REG8(0x395a), 0xcd },
> > +       { CCI_REG8(0x395b), 0xcd }, { CCI_REG8(0x395c), 0xcd },
> > +       { CCI_REG8(0x395d), 0xcd }, { CCI_REG8(0x395e), 0xcd },
> > +       { CCI_REG8(0x395f), 0xcd }, { CCI_REG8(0x3960), 0xcd },
> > +       { CCI_REG8(0x3961), 0xcd }, { CCI_REG8(0x3962), 0xcd },
> > +       { CCI_REG8(0x3963), 0xcd }, { CCI_REG8(0x3964), 0xcd },
> > +       { CCI_REG8(0x3965), 0xcd }, { CCI_REG8(0x3966), 0xcd },
> > +       { CCI_REG8(0x3967), 0xcd }, { CCI_REG8(0x3968), 0xcd },
> > +       { CCI_REG8(0x3969), 0xcd }, { CCI_REG8(0x396a), 0xcd },
> > +       { CCI_REG8(0x396b), 0xcd }, { CCI_REG8(0x396c), 0xcd },
> > +       { CCI_REG8(0x396d), 0xcd }, { CCI_REG8(0x396e), 0xcd },
> > +       { CCI_REG8(0x396f), 0xcd }, { CCI_REG8(0x3970), 0xcd },
> > +       { CCI_REG8(0x3971), 0xcd }, { CCI_REG8(0x3972), 0xcd },
> > +       { CCI_REG8(0x3973), 0xcd }, { CCI_REG8(0x3974), 0xcd },
> > +       { CCI_REG8(0x3975), 0xcd }, { CCI_REG8(0x3976), 0xcd },
> > +       { CCI_REG8(0x3977), 0xcd }, { CCI_REG8(0x3978), 0xcd },
> > +       { CCI_REG8(0x3979), 0xcd }, { CCI_REG8(0x397a), 0xcd },
> > +       { CCI_REG8(0x397b), 0xcd }, { CCI_REG8(0x397c), 0xcd },
> > +       { CCI_REG8(0x397d), 0xcd }, { CCI_REG8(0x397e), 0xcd },
> > +       { CCI_REG8(0x397f), 0xcd }, { CCI_REG8(0x3980), 0xcd },
> > +       { CCI_REG8(0x3981), 0xcd }, { CCI_REG8(0x3982), 0xcd },
> > +       { CCI_REG8(0x3983), 0xcd }, { CCI_REG8(0x3984), 0xcd },
> > +       { CCI_REG8(0x3985), 0xcd }, { CCI_REG8(0x3986), 0xcd },
> > +       { CCI_REG8(0x3987), 0xcd }, { CCI_REG8(0x3988), 0xcd },
> > +       { CCI_REG8(0x3989), 0xcd }, { CCI_REG8(0x398a), 0xcd },
> > +       { CCI_REG8(0x398b), 0xcd }, { CCI_REG8(0x398c), 0xcd },
> > +       { CCI_REG8(0x398d), 0xcd }, { CCI_REG8(0x398e), 0xcd },
> > +       { CCI_REG8(0x398f), 0xcd }, { CCI_REG8(0x3990), 0xcd },
> > +       { CCI_REG8(0x3991), 0xcd }, { CCI_REG8(0x3992), 0xcd },
> > +       { CCI_REG8(0x3993), 0xcd }, { CCI_REG8(0x3994), 0xcd },
> > +       { CCI_REG8(0x3995), 0xcd }, { CCI_REG8(0x3996), 0xcd },
> > +       { CCI_REG8(0x3997), 0xcd }, { CCI_REG8(0x3998), 0xcd },
> > +       { CCI_REG8(0x3999), 0xcd }, { CCI_REG8(0x399a), 0xcd },
> > +       { CCI_REG8(0x399b), 0xcd }, { CCI_REG8(0x399c), 0xcd },
> > +       { CCI_REG8(0x399d), 0xcd }, { CCI_REG8(0x399e), 0xcd },
> > +       { CCI_REG8(0x399f), 0xcd }, { CCI_REG8(0x39a0), 0xcd },
> > +       { CCI_REG8(0x39a1), 0xcd }, { CCI_REG8(0x39a2), 0xcd },
> > +       { CCI_REG8(0x39a3), 0xcd }, { CCI_REG8(0x39a4), 0xcd },
> > +       { CCI_REG8(0x39a5), 0xcd }, { CCI_REG8(0x39a6), 0xcd },
> > +       { CCI_REG8(0x39a7), 0xcd }, { CCI_REG8(0x39a8), 0xcd },
> > +       { CCI_REG8(0x39a9), 0xcd }, { CCI_REG8(0x39aa), 0xcd },
> > +       { CCI_REG8(0x39ab), 0xcd }, { CCI_REG8(0x39ac), 0xcd },
> > +       { CCI_REG8(0x39ad), 0xcd }, { CCI_REG8(0x39ae), 0xcd },
> > +       { CCI_REG8(0x39af), 0xcd }, { CCI_REG8(0x39b0), 0xcd },
> > +       { CCI_REG8(0x39b1), 0xcd }, { CCI_REG8(0x39b2), 0xcd },
> > +       { CCI_REG8(0x39b3), 0xcd }, { CCI_REG8(0x39b4), 0xcd },
> > +       { CCI_REG8(0x39b5), 0xcd }, { CCI_REG8(0x39b6), 0xcd },
> > +       { CCI_REG8(0x39b7), 0xcd }, { CCI_REG8(0x39b8), 0xcd },
> > +       { CCI_REG8(0x39b9), 0xcd }, { CCI_REG8(0x39ba), 0xcd },
> > +       { CCI_REG8(0x39bb), 0xcd }, { CCI_REG8(0x39bc), 0xcd },
> > +       { CCI_REG8(0x39bd), 0xcd }, { CCI_REG8(0x39be), 0xcd },
> > +       { CCI_REG8(0x39bf), 0xcd }, { CCI_REG8(0x39c0), 0xcd },
> > +       { CCI_REG8(0x39c1), 0xcd }, { CCI_REG8(0x39c2), 0xcd },
> > +       { CCI_REG8(0x39c3), 0xcd }, { CCI_REG8(0x39c4), 0xcd },
> > +       { CCI_REG8(0x39c5), 0xcd }, { CCI_REG8(0x39c6), 0xcd },
> > +       { CCI_REG8(0x39c7), 0xcd }, { CCI_REG8(0x39c8), 0xcd },
> > +       { CCI_REG8(0x39c9), 0xcd }, { CCI_REG8(0x39ca), 0xcd },
> > +       { CCI_REG8(0x39cb), 0xcd }, { CCI_REG8(0x39cc), 0xcd },
> > +       { CCI_REG8(0x39cd), 0xcd }, { CCI_REG8(0x39ce), 0xcd },
> > +       { CCI_REG8(0x39cf), 0xcd }, { CCI_REG8(0x39d0), 0xcd },
> > +       { CCI_REG8(0x39d1), 0xcd }, { CCI_REG8(0x39d2), 0xcd },
> > +       { CCI_REG8(0x39d3), 0xcd }, { CCI_REG8(0x39d4), 0xcd },
> > +       { CCI_REG8(0x39d5), 0xcd }, { CCI_REG8(0x39d6), 0xcd },
> > +       { CCI_REG8(0x39d7), 0xcd }, { CCI_REG8(0x39d8), 0xcd },
> > +       { CCI_REG8(0x39d9), 0xcd }, { CCI_REG8(0x39da), 0xcd },
> > +       { CCI_REG8(0x39db), 0xcd }, { CCI_REG8(0x39dc), 0xcd },
> > +       { CCI_REG8(0x39dd), 0xcd }, { CCI_REG8(0x39de), 0xcd },
> > +       { CCI_REG8(0x39df), 0xcd }, { CCI_REG8(0x39e0), 0xcd },
> > +       { CCI_REG8(0x39e1), 0x40 }, { CCI_REG8(0x39e2), 0x40 },
> > +       { CCI_REG8(0x39e3), 0x40 }, { CCI_REG8(0x39e4), 0x40 },
> > +       { CCI_REG8(0x39e5), 0x40 }, { CCI_REG8(0x39e6), 0x40 },
> > +       { CCI_REG8(0x39e7), 0x40 }, { CCI_REG8(0x39e8), 0x40 },
> > +       { CCI_REG8(0x39e9), 0x40 }, { CCI_REG8(0x39ea), 0x40 },
> > +       { CCI_REG8(0x39eb), 0x40 }, { CCI_REG8(0x39ec), 0x40 },
> > +       { CCI_REG8(0x39ed), 0x40 }, { CCI_REG8(0x39ee), 0x40 },
> > +       { CCI_REG8(0x39ef), 0x40 }, { CCI_REG8(0x39f0), 0x40 },
> > +       { CCI_REG8(0x39f1), 0x40 }, { CCI_REG8(0x39f2), 0x40 },
> > +       { CCI_REG8(0x39f3), 0x40 }, { CCI_REG8(0x39f4), 0x40 },
> > +       { CCI_REG8(0x39f5), 0x40 }, { CCI_REG8(0x39f6), 0x40 },
> > +       { CCI_REG8(0x39f7), 0x40 }, { CCI_REG8(0x39f8), 0x40 },
> > +       { CCI_REG8(0x39f9), 0x40 }, { CCI_REG8(0x39fa), 0x40 },
> > +       { CCI_REG8(0x39fb), 0x40 }, { CCI_REG8(0x39fc), 0x40 },
> > +       { CCI_REG8(0x39fd), 0x40 }, { CCI_REG8(0x39fe), 0x40 },
> > +       { CCI_REG8(0x39ff), 0x40 }, { CCI_REG8(0x3a00), 0x40 },
> > +       { CCI_REG8(0x3a01), 0x40 }, { CCI_REG8(0x3a02), 0x40 },
> > +       { CCI_REG8(0x3a03), 0x40 }, { CCI_REG8(0x3a04), 0x40 },
> > +       { CCI_REG8(0x3a05), 0x40 }, { CCI_REG8(0x3a06), 0x40 },
> > +       { CCI_REG8(0x3a07), 0x40 }, { CCI_REG8(0x3a08), 0x40 },
> > +       { CCI_REG8(0x3a09), 0x40 }, { CCI_REG8(0x3a0a), 0x40 },
> > +       { CCI_REG8(0x3a0b), 0x40 }, { CCI_REG8(0x3a0c), 0x40 },
> > +       { CCI_REG8(0x3a0d), 0x40 }, { CCI_REG8(0x3a0e), 0x40 },
> > +       { CCI_REG8(0x3a0f), 0x40 }, { CCI_REG8(0x3a10), 0x40 },
> > +       { CCI_REG8(0x3a11), 0x40 }, { CCI_REG8(0x3a12), 0x40 },
> > +       { CCI_REG8(0x3a13), 0x40 }, { CCI_REG8(0x3a14), 0x40 },
> > +       { CCI_REG8(0x3a15), 0x40 }, { CCI_REG8(0x3a16), 0x40 },
> > +       { CCI_REG8(0x3a17), 0x40 }, { CCI_REG8(0x3a18), 0x40 },
> > +       { CCI_REG8(0x3a19), 0x40 }, { CCI_REG8(0x3a1a), 0x40 },
> > +       { CCI_REG8(0x3a1b), 0x40 }, { CCI_REG8(0x3a1c), 0x40 },
> > +       { CCI_REG8(0x3a1d), 0x40 }, { CCI_REG8(0x3a1e), 0x40 },
> > +       { CCI_REG8(0x3a1f), 0x40 }, { CCI_REG8(0x3a20), 0x40 },
> > +       { CCI_REG8(0x3a21), 0x40 }, { CCI_REG8(0x3a22), 0x40 },
> > +       { CCI_REG8(0x3a23), 0x40 }, { CCI_REG8(0x3a24), 0x40 },
> > +       { CCI_REG8(0x3a25), 0x40 }, { CCI_REG8(0x3a26), 0x40 },
> > +       { CCI_REG8(0x3a27), 0x40 }, { CCI_REG8(0x3a28), 0x40 },
> > +       { CCI_REG8(0x3a29), 0x40 }, { CCI_REG8(0x3a2a), 0x40 },
> > +       { CCI_REG8(0x3a2b), 0x40 }, { CCI_REG8(0x3a2c), 0x40 },
> > +       { CCI_REG8(0x3a2d), 0x40 }, { CCI_REG8(0x3a2e), 0x40 },
> > +       { CCI_REG8(0x3a2f), 0x40 }, { CCI_REG8(0x3a30), 0x40 },
> > +       { CCI_REG8(0x3a31), 0x40 }, { CCI_REG8(0x3a32), 0x40 },
> > +       { CCI_REG8(0x3a33), 0x40 }, { CCI_REG8(0x3a34), 0x40 },
> > +       { CCI_REG8(0x3a35), 0x40 }, { CCI_REG8(0x3a36), 0x40 },
> > +       { CCI_REG8(0x3a37), 0x40 }, { CCI_REG8(0x3a38), 0x40 },
> > +       { CCI_REG8(0x3a39), 0x40 }, { CCI_REG8(0x3a3a), 0x40 },
> > +       { CCI_REG8(0x3a3b), 0xcd }, { CCI_REG8(0x3a3c), 0xcd },
> > +       { CCI_REG8(0x3a3d), 0xcd }, { CCI_REG8(0x3a3e), 0xcd },
> > +       { CCI_REG8(0x3a3f), 0xcd }, { CCI_REG8(0x3a40), 0xcd },
> > +       { CCI_REG8(0x3a41), 0xcd }, { CCI_REG8(0x3a42), 0xcd },
> > +       { CCI_REG8(0x3a43), 0xcd }, { CCI_REG8(0x3a44), 0xcd },
> > +       { CCI_REG8(0x3a45), 0xcd }, { CCI_REG8(0x3a46), 0xcd },
> > +       { CCI_REG8(0x3a47), 0xcd }, { CCI_REG8(0x3a48), 0xcd },
> > +       { CCI_REG8(0x3a49), 0xcd }, { CCI_REG8(0x3a4a), 0xcd },
> > +       { CCI_REG8(0x3a4b), 0xcd }, { CCI_REG8(0x3a4c), 0xcd },
> > +       { CCI_REG8(0x3a4d), 0xcd }, { CCI_REG8(0x3a4e), 0xcd },
> > +       { CCI_REG8(0x3a4f), 0xcd }, { CCI_REG8(0x3a50), 0xcd },
> > +       { CCI_REG8(0x3a51), 0xcd }, { CCI_REG8(0x3a52), 0xcd },
> > +       { CCI_REG8(0x3a53), 0xcd }, { CCI_REG8(0x3a54), 0xcd },
> > +       { CCI_REG8(0x3a55), 0xcd }, { CCI_REG8(0x3a56), 0xcd },
> > +       { CCI_REG8(0x3a57), 0xcd }, { CCI_REG8(0x3a58), 0xcd },
> > +       { CCI_REG8(0x3a59), 0xcd }, { CCI_REG8(0x3a5a), 0xcd },
> > +       { CCI_REG8(0x3a5b), 0xcd }, { CCI_REG8(0x3a5c), 0xcd },
> > +       { CCI_REG8(0x3a5d), 0xcd }, { CCI_REG8(0x3a5e), 0xcd },
> > +       { CCI_REG8(0x3a5f), 0xcd }, { CCI_REG8(0x3a60), 0xcd },
> > +       { CCI_REG8(0x3a61), 0xcd }, { CCI_REG8(0x3a62), 0xcd },
> > +       { CCI_REG8(0x3a63), 0xcd }, { CCI_REG8(0x3a64), 0xcd },
> > +       { CCI_REG8(0x3a65), 0xcd }, { CCI_REG8(0x3a66), 0xcd },
> > +       { CCI_REG8(0x3a67), 0xcd }, { CCI_REG8(0x3a68), 0xcd },
> > +       { CCI_REG8(0x3a69), 0xcd }, { CCI_REG8(0x3a6a), 0xcd },
> > +       { CCI_REG8(0x3a6b), 0xcd }, { CCI_REG8(0x3a6c), 0xcd },
> > +       { CCI_REG8(0x3a6d), 0xcd }, { CCI_REG8(0x3a6e), 0xcd },
> > +       { CCI_REG8(0x3a6f), 0xcd }, { CCI_REG8(0x3a70), 0xcd },
> > +       { CCI_REG8(0x3a71), 0xcd }, { CCI_REG8(0x3a72), 0xcd },
> > +       { CCI_REG8(0x3a73), 0xcd }, { CCI_REG8(0x3a74), 0xcd },
> > +       { CCI_REG8(0x3a75), 0xcd }, { CCI_REG8(0x3a76), 0xcd },
> > +       { CCI_REG8(0x3a77), 0xcd }, { CCI_REG8(0x3a78), 0xcd },
> > +       { CCI_REG8(0x3a79), 0xcd }, { CCI_REG8(0x3a7a), 0xcd },
> > +       { CCI_REG8(0x3a7b), 0xcd }, { CCI_REG8(0x3a7c), 0xcd },
> > +       { CCI_REG8(0x3a7d), 0xcd }, { CCI_REG8(0x3a7e), 0xcd },
> > +       { CCI_REG8(0x3a7f), 0xcd }, { CCI_REG8(0x3a80), 0xcd },
> > +       { CCI_REG8(0x3a81), 0xcd }, { CCI_REG8(0x3a82), 0xcd },
> > +       { CCI_REG8(0x3a83), 0xcd }, { CCI_REG8(0x3a84), 0xcd },
> > +       { CCI_REG8(0x3a85), 0xcd }, { CCI_REG8(0x3a86), 0xcd },
> > +       { CCI_REG8(0x3a87), 0xcd }, { CCI_REG8(0x3a88), 0xcd },
> > +       { CCI_REG8(0x3a89), 0xcd }, { CCI_REG8(0x3a8a), 0xcd },
> > +       { CCI_REG8(0x3a8b), 0xcd }, { CCI_REG8(0x3a8c), 0xcd },
> > +       { CCI_REG8(0x3a8d), 0xcd }, { CCI_REG8(0x3a8e), 0xcd },
> > +       { CCI_REG8(0x3a8f), 0xcd }, { CCI_REG8(0x3a90), 0xcd },
> > +       { CCI_REG8(0x3a91), 0xcd }, { CCI_REG8(0x3a92), 0xcd },
> > +       { CCI_REG8(0x3a93), 0xcd }, { CCI_REG8(0x3a94), 0xcd },
> > +       { CCI_REG8(0x3a95), 0x40 }, { CCI_REG8(0x3a96), 0x40 },
> > +       { CCI_REG8(0x3a97), 0x40 }, { CCI_REG8(0x3a98), 0x40 },
> > +       { CCI_REG8(0x3a99), 0x40 }, { CCI_REG8(0x3a9a), 0x40 },
> > +       { CCI_REG8(0x3a9b), 0x40 }, { CCI_REG8(0x3a9c), 0x40 },
> > +       { CCI_REG8(0x3a9d), 0x40 }, { CCI_REG8(0x3a9e), 0x40 },
> > +       { CCI_REG8(0x3a9f), 0x40 }, { CCI_REG8(0x3aa0), 0x40 },
> > +       { CCI_REG8(0x3aa1), 0x40 }, { CCI_REG8(0x3aa2), 0x40 },
> > +       { CCI_REG8(0x3aa3), 0x40 }, { CCI_REG8(0x3aa4), 0x40 },
> > +       { CCI_REG8(0x3aa5), 0x40 }, { CCI_REG8(0x3aa6), 0x40 },
> > +       { CCI_REG8(0x3aa7), 0x40 }, { CCI_REG8(0x3aa8), 0x40 },
> > +       { CCI_REG8(0x3aa9), 0x40 }, { CCI_REG8(0x3aaa), 0x40 },
> > +       { CCI_REG8(0x3aab), 0x40 }, { CCI_REG8(0x3aac), 0x40 },
> > +       { CCI_REG8(0x3aad), 0x40 }, { CCI_REG8(0x3aae), 0x40 },
> > +       { CCI_REG8(0x3aaf), 0x40 }, { CCI_REG8(0x3ab0), 0x40 },
> > +       { CCI_REG8(0x3ab1), 0x40 }, { CCI_REG8(0x3ab2), 0x40 },
> > +       { CCI_REG8(0x3ab3), 0x40 }, { CCI_REG8(0x3ab4), 0x40 },
> > +       { CCI_REG8(0x3ab5), 0x40 }, { CCI_REG8(0x3ab6), 0x40 },
> > +       { CCI_REG8(0x3ab7), 0x40 }, { CCI_REG8(0x3ab8), 0x40 },
> > +       { CCI_REG8(0x3ab9), 0x40 }, { CCI_REG8(0x3aba), 0x40 },
> > +       { CCI_REG8(0x3abb), 0x40 }, { CCI_REG8(0x3abc), 0x40 },
> > +       { CCI_REG8(0x3abd), 0x40 }, { CCI_REG8(0x3abe), 0x40 },
> > +       { CCI_REG8(0x3abf), 0x40 }, { CCI_REG8(0x3ac0), 0x40 },
> > +       { CCI_REG8(0x3ac1), 0x40 }, { CCI_REG8(0x3ac2), 0x40 },
> > +       { CCI_REG8(0x3ac3), 0x40 }, { CCI_REG8(0x3ac4), 0x40 },
> > +       { CCI_REG8(0x3ac5), 0x40 }, { CCI_REG8(0x3ac6), 0x40 },
> > +       { CCI_REG8(0x3ac7), 0x40 }, { CCI_REG8(0x3ac8), 0x40 },
> > +       { CCI_REG8(0x3ac9), 0x40 }, { CCI_REG8(0x3aca), 0x40 },
> > +       { CCI_REG8(0x3acb), 0x40 }, { CCI_REG8(0x3acc), 0x40 },
> > +       { CCI_REG8(0x3acd), 0x40 }, { CCI_REG8(0x3ace), 0x40 },
> > +       { CCI_REG8(0x3acf), 0x40 }, { CCI_REG8(0x3ad0), 0x40 },
> > +       { CCI_REG8(0x3ad1), 0x40 }, { CCI_REG8(0x3ad2), 0x40 },
> > +       { CCI_REG8(0x3ad3), 0x40 }, { CCI_REG8(0x3ad4), 0x40 },
> > +       { CCI_REG8(0x3ad5), 0x40 }, { CCI_REG8(0x3ad6), 0x40 },
> > +       { CCI_REG8(0x3ad7), 0x40 }, { CCI_REG8(0x3ad8), 0x40 },
> > +       { CCI_REG8(0x3ad9), 0x40 }, { CCI_REG8(0x3ada), 0x40 },
> > +       { CCI_REG8(0x3adb), 0x40 }, { CCI_REG8(0x3adc), 0x40 },
> > +       { CCI_REG8(0x3add), 0x40 }, { CCI_REG8(0x3ade), 0x40 },
> > +       { CCI_REG8(0x3adf), 0x40 }, { CCI_REG8(0x3ae0), 0x40 },
> > +       { CCI_REG8(0x3ae1), 0x40 }, { CCI_REG8(0x3ae2), 0x40 },
> > +       { CCI_REG8(0x3ae3), 0x40 }, { CCI_REG8(0x3ae4), 0x40 },
> > +       { CCI_REG8(0x3ae5), 0x40 }, { CCI_REG8(0x3ae6), 0x40 },
> > +       { CCI_REG8(0x3ae7), 0x40 }, { CCI_REG8(0x3ae8), 0x40 },
> > +       { CCI_REG8(0x3ae9), 0x40 }, { CCI_REG8(0x3aea), 0x40 },
> > +       { CCI_REG8(0x3aeb), 0x40 }, { CCI_REG8(0x3aec), 0x40 },
> > +       { CCI_REG8(0x3aed), 0x40 }, { CCI_REG8(0x3aee), 0x40 },
> > +       { CCI_REG8(0x3aef), 0xcd }, { CCI_REG8(0x3af0), 0xcd },
> > +       { CCI_REG8(0x3af1), 0xcd }, { CCI_REG8(0x3af2), 0xcd },
> > +       { CCI_REG8(0x3af3), 0xcd }, { CCI_REG8(0x3af4), 0xcd },
> > +       { CCI_REG8(0x3af5), 0xcd }, { CCI_REG8(0x3af6), 0xcd },
> > +       { CCI_REG8(0x3af7), 0xcd }, { CCI_REG8(0x3af8), 0xcd },
> > +       { CCI_REG8(0x3af9), 0xcd }, { CCI_REG8(0x3afa), 0xcd },
> > +       { CCI_REG8(0x3afb), 0xcd }, { CCI_REG8(0x3afc), 0xcd },
> > +       { CCI_REG8(0x3afd), 0xcd }, { CCI_REG8(0x3afe), 0xcd },
> > +       { CCI_REG8(0x3aff), 0xcd }, { CCI_REG8(0x3b00), 0xcd },
> > +       { CCI_REG8(0x3b01), 0xcd }, { CCI_REG8(0x3b02), 0xcd },
> > +       { CCI_REG8(0x3b03), 0xcd }, { CCI_REG8(0x3b04), 0xcd },
> > +       { CCI_REG8(0x3b05), 0xcd }, { CCI_REG8(0x3b06), 0xcd },
> > +       { CCI_REG8(0x3b07), 0xcd }, { CCI_REG8(0x3b08), 0xcd },
> > +       { CCI_REG8(0x3b09), 0xcd }, { CCI_REG8(0x3b0a), 0xcd },
> > +       { CCI_REG8(0x3b0b), 0xcd }, { CCI_REG8(0x3b0c), 0xcd },
> > +       { CCI_REG8(0x3b0d), 0xcd }, { CCI_REG8(0x3b0e), 0xcd },
> > +       { CCI_REG8(0x3b0f), 0xcd }, { CCI_REG8(0x3b10), 0xcd },
> > +       { CCI_REG8(0x3b11), 0xcd }, { CCI_REG8(0x3b12), 0xcd },
> > +       { CCI_REG8(0x3b13), 0xcd }, { CCI_REG8(0x3b14), 0xcd },
> > +       { CCI_REG8(0x3b15), 0xcd }, { CCI_REG8(0x3b16), 0xcd },
> > +       { CCI_REG8(0x3b17), 0xcd }, { CCI_REG8(0x3b18), 0xcd },
> > +       { CCI_REG8(0x3b19), 0xcd }, { CCI_REG8(0x3b1a), 0xcd },
> > +       { CCI_REG8(0x3b1b), 0xcd }, { CCI_REG8(0x3b1c), 0xcd },
> > +       { CCI_REG8(0x3b1d), 0xcd }, { CCI_REG8(0x3b1e), 0xcd },
> > +       { CCI_REG8(0x3b1f), 0xcd }, { CCI_REG8(0x3b20), 0xcd },
> > +       { CCI_REG8(0x3b21), 0xcd }, { CCI_REG8(0x3b22), 0xcd },
> > +       { CCI_REG8(0x3b23), 0xcd }, { CCI_REG8(0x3b24), 0xcd },
> > +       { CCI_REG8(0x3b25), 0xcd }, { CCI_REG8(0x3b26), 0xcd },
> > +       { CCI_REG8(0x3b27), 0xcd }, { CCI_REG8(0x3b28), 0xcd },
> > +       { CCI_REG8(0x3b29), 0xcd }, { CCI_REG8(0x3b2a), 0xcd },
> > +       { CCI_REG8(0x3b2b), 0xcd }, { CCI_REG8(0x3b2c), 0xcd },
> > +       { CCI_REG8(0x3b2d), 0xcd }, { CCI_REG8(0x3b2e), 0xcd },
> > +       { CCI_REG8(0x3b2f), 0xcd }, { CCI_REG8(0x3b30), 0xcd },
> > +       { CCI_REG8(0x3b31), 0xcd }, { CCI_REG8(0x3b32), 0xcd },
> > +       { CCI_REG8(0x3b33), 0xcd }, { CCI_REG8(0x3b34), 0xcd },
> > +       { CCI_REG8(0x3b35), 0xcd }, { CCI_REG8(0x3b36), 0xcd },
> > +       { CCI_REG8(0x3b37), 0xcd }, { CCI_REG8(0x3b38), 0xcd },
> > +       { CCI_REG8(0x3b39), 0xcd }, { CCI_REG8(0x3b3a), 0xcd },
> > +       { CCI_REG8(0x3b3b), 0xcd }, { CCI_REG8(0x3b3c), 0xcd },
> > +       { CCI_REG8(0x3b3d), 0xcd }, { CCI_REG8(0x3b3e), 0xcd },
> > +       { CCI_REG8(0x3b3f), 0xcd }, { CCI_REG8(0x3b40), 0xcd },
> > +       { CCI_REG8(0x3b41), 0xcd }, { CCI_REG8(0x3b42), 0xcd },
> > +       { CCI_REG8(0x3b43), 0xcd }, { CCI_REG8(0x3b44), 0xcd },
> > +       { CCI_REG8(0x3b45), 0xcd }, { CCI_REG8(0x3b46), 0xcd },
> > +       { CCI_REG8(0x3b47), 0xcd }, { CCI_REG8(0x3b48), 0xcd },
> > +       { CCI_REG8(0x3b49), 0xcd }, { CCI_REG8(0x3b4a), 0xcd },
> > +       { CCI_REG8(0x3b4b), 0xcd }, { CCI_REG8(0x3b4c), 0xcd },
> > +       { CCI_REG8(0x3b4d), 0xcd }, { CCI_REG8(0x3b4e), 0xcd },
> > +       { CCI_REG8(0x3b4f), 0xcd }, { CCI_REG8(0x3b50), 0xcd },
> > +       { CCI_REG8(0x3b51), 0xcd }, { CCI_REG8(0x3b52), 0xcd },
> > +       { CCI_REG8(0x3b53), 0xcd }, { CCI_REG8(0x3b54), 0xcd },
> > +       { CCI_REG8(0x3b55), 0xcd }, { CCI_REG8(0x3b56), 0xcd },
> > +       { CCI_REG8(0x3b57), 0xcd }, { CCI_REG8(0x3b58), 0xcd },
> > +       { CCI_REG8(0x3b59), 0xcd }, { CCI_REG8(0x3b5a), 0xcd },
> > +       { CCI_REG8(0x3b5b), 0xcd }, { CCI_REG8(0x3b5c), 0xcd },
> > +       { CCI_REG8(0x3b5d), 0xcd }, { CCI_REG8(0x3b5e), 0xcd },
> > +       { CCI_REG8(0x3b5f), 0xcd }, { CCI_REG8(0x3b60), 0xcd },
> > +       { CCI_REG8(0x3b61), 0xcd }, { CCI_REG8(0x3b62), 0xcd },
> > +       { CCI_REG8(0x3b63), 0xcd }, { CCI_REG8(0x3b64), 0xcd },
> > +       { CCI_REG8(0x3b65), 0xcd }, { CCI_REG8(0x3b66), 0xcd },
> > +       { CCI_REG8(0x3b67), 0xcd }, { CCI_REG8(0x3b68), 0xcd },
> > +       { CCI_REG8(0x3b69), 0xcd }, { CCI_REG8(0x3b6a), 0xcd },
> > +       { CCI_REG8(0x3b6b), 0xcd }, { CCI_REG8(0x3b6c), 0xcd },
> > +       { CCI_REG8(0x3b6d), 0xcd }, { CCI_REG8(0x3b6e), 0xcd },
> > +       { CCI_REG8(0x3b6f), 0xcd }, { CCI_REG8(0x3b70), 0xcd },
> > +       { CCI_REG8(0x3b71), 0xcd }, { CCI_REG8(0x3b72), 0xcd },
> > +       { CCI_REG8(0x3b73), 0xcd }, { CCI_REG8(0x3b74), 0xcd },
> > +       { CCI_REG8(0x3b75), 0xcd }, { CCI_REG8(0x3b76), 0xcd },
> > +       { CCI_REG8(0x3b77), 0xcd }, { CCI_REG8(0x3b78), 0xcd },
> > +       { CCI_REG8(0x3b79), 0xcd }, { CCI_REG8(0x3b7a), 0xcd },
> > +       { CCI_REG8(0x3b7b), 0xcd }, { CCI_REG8(0x3b7c), 0xcd },
> > +       { CCI_REG8(0x3b7d), 0xcd }, { CCI_REG8(0x3b7e), 0xcd },
> > +       { CCI_REG8(0x3b7f), 0xcd }, { CCI_REG8(0x3b80), 0xcd },
> > +       { CCI_REG8(0x3b81), 0xcd }, { CCI_REG8(0x3b82), 0xcd },
> > +       { CCI_REG8(0x3b83), 0xcd }, { CCI_REG8(0x3b84), 0xcd },
> > +       { CCI_REG8(0x3b85), 0xcd }, { CCI_REG8(0x3b86), 0xcd },
> > +       { CCI_REG8(0x3b87), 0xcd }, { CCI_REG8(0x3b88), 0xcd },
> > +       { CCI_REG8(0x3b89), 0xcd }, { CCI_REG8(0x3b8a), 0xcd },
> > +       { CCI_REG8(0x3b8b), 0xcd }, { CCI_REG8(0x3b8c), 0xcd },
> > +       { CCI_REG8(0x3b8d), 0xcd }, { CCI_REG8(0x3b8e), 0xcd },
> > +       { CCI_REG8(0x3b8f), 0xcd }, { CCI_REG8(0x3b90), 0xcd },
> > +       { CCI_REG8(0x3b91), 0xcd }, { CCI_REG8(0x3b92), 0xcd },
> > +       { CCI_REG8(0x3b93), 0xcd }, { CCI_REG8(0x3b94), 0xcd },
> > +       { CCI_REG8(0x3b95), 0xcd }, { CCI_REG8(0x3b96), 0xcd },
> > +       { CCI_REG8(0x3b97), 0xcd }, { CCI_REG8(0x3b98), 0xcd },
> > +       { CCI_REG8(0x3b99), 0xcd }, { CCI_REG8(0x3b9a), 0xcd },
> > +       { CCI_REG8(0x3b9b), 0xcd }, { CCI_REG8(0x3b9c), 0xcd },
> > +       { CCI_REG8(0x3b9d), 0xcd }, { CCI_REG8(0x3b9e), 0xcd },
> > +       { CCI_REG8(0x3b9f), 0xcd }, { CCI_REG8(0x3ba0), 0xcd },
> > +       { CCI_REG8(0x3ba1), 0xcd }, { CCI_REG8(0x3ba2), 0xcd },
> > +       { CCI_REG8(0x3ba3), 0xcd }, { CCI_REG8(0x3ba4), 0xcd },
> > +       { CCI_REG8(0x3ba5), 0xcd }, { CCI_REG8(0x3ba6), 0xcd },
> > +       { CCI_REG8(0x3ba7), 0xcd }, { CCI_REG8(0x3ba8), 0xcd },
> > +       { CCI_REG8(0x3ba9), 0xcd }, { CCI_REG8(0x3baa), 0xcd },
> > +       { CCI_REG8(0x3bab), 0xcd }, { CCI_REG8(0x3bac), 0xcd },
> > +       { CCI_REG8(0x3bad), 0xcd }, { CCI_REG8(0x3bae), 0xcd },
> > +       { CCI_REG8(0x3baf), 0xcd }, { CCI_REG8(0x3bb0), 0xcd },
> > +       { CCI_REG8(0x3bb1), 0xcd }, { CCI_REG8(0x3bb2), 0xcd },
> > +       { CCI_REG8(0x3bb3), 0xcd }, { CCI_REG8(0x3bb4), 0xcd },
> > +       { CCI_REG8(0x3bb5), 0xcd }, { CCI_REG8(0x3bb6), 0xcd },
> > +       { CCI_REG8(0x3bb7), 0xcd }, { CCI_REG8(0x3bb8), 0xcd },
> > +       { CCI_REG8(0x3bb9), 0xcd }, { CCI_REG8(0x3bba), 0xcd },
> > +       { CCI_REG8(0x3bbb), 0xcd }, { CCI_REG8(0x3bbc), 0xcd },
> > +       { CCI_REG8(0x3bbd), 0xcd }, { CCI_REG8(0x3bbe), 0xcd },
> > +       { CCI_REG8(0x3bbf), 0xcd }, { CCI_REG8(0x3bc0), 0xcd },
> > +       { CCI_REG8(0x3bc1), 0xcd }, { CCI_REG8(0x3bc2), 0xcd },
> > +       { CCI_REG8(0x3bc3), 0xcd }, { CCI_REG8(0x3bc4), 0xcd },
> > +       { CCI_REG8(0x3bc5), 0xcd }, { CCI_REG8(0x3bc6), 0xcd },
> > +       { CCI_REG8(0x3bc7), 0xcd }, { CCI_REG8(0x3bc8), 0xcd },
> > +       { CCI_REG8(0x3bc9), 0xcd }, { CCI_REG8(0x3bca), 0xcd },
> > +       { CCI_REG8(0x3bcb), 0xcd }, { CCI_REG8(0x3bcc), 0xcd },
> > +       { CCI_REG8(0x3bcd), 0xcd }, { CCI_REG8(0x3bce), 0xcd },
> > +       { CCI_REG8(0x3bcf), 0xcd }, { CCI_REG8(0x3bd0), 0xcd },
> > +       { CCI_REG8(0x3bd1), 0xcd }, { CCI_REG8(0x3bd2), 0xcd },
> > +       { CCI_REG8(0x3bd3), 0xcd }, { CCI_REG8(0x3bd4), 0xcd },
> > +       { CCI_REG8(0x3bd5), 0xcd }, { CCI_REG8(0x3bd6), 0xcd },
> > +       { CCI_REG8(0x3bd7), 0xcd }, { CCI_REG8(0x3bd8), 0xcd },
> > +       { CCI_REG8(0x3bd9), 0xcd }, { CCI_REG8(0x3bda), 0xcd },
> > +       { CCI_REG8(0x3bdb), 0xcd }, { CCI_REG8(0x3bdc), 0xcd },
> > +       { CCI_REG8(0x3bdd), 0xcd }, { CCI_REG8(0x3bde), 0xcd },
> > +       { CCI_REG8(0x3bdf), 0xcd }, { CCI_REG8(0x3be0), 0xcd },
> > +       { CCI_REG8(0x3be1), 0xcd }, { CCI_REG8(0x3be2), 0xcd },
> > +       { CCI_REG8(0x3be3), 0xcd }, { CCI_REG8(0x3be4), 0xcd },
> > +       { CCI_REG8(0x3be5), 0xcd }, { CCI_REG8(0x3be6), 0xcd },
> > +       { CCI_REG8(0x3be7), 0xcd }, { CCI_REG8(0x3be8), 0xcd },
> > +       { CCI_REG8(0x3be9), 0xcd }, { CCI_REG8(0x3bea), 0xcd },
> > +       { CCI_REG8(0x3beb), 0xcd }, { CCI_REG8(0x3bec), 0xcd },
> > +       { CCI_REG8(0x3bed), 0xcd }, { CCI_REG8(0x3bee), 0xcd },
> > +       { CCI_REG8(0x3bef), 0xcd }, { CCI_REG8(0x3bf0), 0xcd },
> > +       { CCI_REG8(0x3bf1), 0xcd }, { CCI_REG8(0x3bf2), 0xcd },
> > +       { CCI_REG8(0x3bf3), 0xcd }, { CCI_REG8(0x3bf4), 0xcd },
> > +       { CCI_REG8(0x3bf5), 0xcd }, { CCI_REG8(0x3bf6), 0xcd },
> > +       { CCI_REG8(0x3bf7), 0xcd }, { CCI_REG8(0x3bf8), 0xcd },
> > +       { CCI_REG8(0x3bf9), 0xcd }, { CCI_REG8(0x3bfa), 0xcd },
> > +       { CCI_REG8(0x3bfb), 0xcd }, { CCI_REG8(0x3bfc), 0xcd },
> > +       { CCI_REG8(0x3bfd), 0xcd }, { CCI_REG8(0x3bfe), 0xcd },
> > +       { CCI_REG8(0x3bff), 0xcd }, { CCI_REG8(0x3c00), 0xcd },
> > +       { CCI_REG8(0x3c01), 0xcd }, { CCI_REG8(0x3c02), 0xcd },
> > +       { CCI_REG8(0x3c03), 0xcd }, { CCI_REG8(0x3c04), 0xcd },
> > +       { CCI_REG8(0x3c05), 0xcd }, { CCI_REG8(0x3c06), 0xcd },
> > +       { CCI_REG8(0x3c07), 0xcd }, { CCI_REG8(0x3c08), 0xcd },
> > +       { CCI_REG8(0x3c09), 0xcd }, { CCI_REG8(0x3c0a), 0xcd },
> > +       { CCI_REG8(0x3c0b), 0xcd }, { CCI_REG8(0x3c0c), 0xcd },
> > +       { CCI_REG8(0x3c0d), 0xcd }, { CCI_REG8(0x3c0e), 0xcd },
> > +       { CCI_REG8(0x3c0f), 0xcd }, { CCI_REG8(0x3c10), 0xcd },
> > +       { CCI_REG8(0x3c11), 0xcd }, { CCI_REG8(0x3c12), 0xcd },
> > +       { CCI_REG8(0x3c13), 0xcd }, { CCI_REG8(0x3c14), 0xcd },
> > +       { CCI_REG8(0x3c15), 0xcd }, { CCI_REG8(0x3c16), 0xcd },
> > +       { CCI_REG8(0x3c17), 0xcd }, { CCI_REG8(0x3c18), 0xcd },
> > +       { CCI_REG8(0x3c19), 0xcd }, { CCI_REG8(0x3c1a), 0xcd },
> > +       { CCI_REG8(0x3c1b), 0xcd }, { CCI_REG8(0x3c1c), 0xcd },
> > +       { CCI_REG8(0x3c1d), 0xcd }, { CCI_REG8(0x3c1e), 0xcd },
> > +       { CCI_REG8(0x3c1f), 0xcd }, { CCI_REG8(0x3c20), 0xcd },
> > +       { CCI_REG8(0x3c21), 0xcd }, { CCI_REG8(0x3c22), 0xcd },
> > +       { CCI_REG8(0x3c23), 0xcd }, { CCI_REG8(0x3c24), 0xcd },
> > +       { CCI_REG8(0x3c25), 0xcd }, { CCI_REG8(0x3c26), 0xcd },
> > +       { CCI_REG8(0x3c27), 0xcd }, { CCI_REG8(0x3c28), 0xcd },
> > +       { CCI_REG8(0x3c29), 0xcd }, { CCI_REG8(0x3c2a), 0xcd },
> > +       { CCI_REG8(0x3c2b), 0xcd }, { CCI_REG8(0x3c2c), 0xcd },
> > +       { CCI_REG8(0x3c2d), 0xcd }, { CCI_REG8(0x3c2e), 0xcd },
> > +       { CCI_REG8(0x3c2f), 0xcd }, { CCI_REG8(0x3c30), 0xcd },
> > +       { CCI_REG8(0x3c31), 0xcd }, { CCI_REG8(0x3c32), 0xcd },
> > +       { CCI_REG8(0x3c33), 0xcd }, { CCI_REG8(0x3c34), 0xcd },
> > +       { CCI_REG8(0x3c35), 0xcd }, { CCI_REG8(0x3c36), 0xcd },
> > +       { CCI_REG8(0x3c37), 0xcd }, { CCI_REG8(0x3c38), 0xcd },
> > +       { CCI_REG8(0x3c39), 0xcd }, { CCI_REG8(0x3c3a), 0xcd },
> > +       { CCI_REG8(0x3c3b), 0xcd }, { CCI_REG8(0x3c3c), 0xcd },
> > +       { CCI_REG8(0x3c3d), 0xcd }, { CCI_REG8(0x3c3e), 0xcd },
> > +       { CCI_REG8(0x3c3f), 0xcd }, { CCI_REG8(0x3c40), 0xcd },
> > +       { CCI_REG8(0x3c41), 0xcd }, { CCI_REG8(0x3c42), 0xcd },
> > +       { CCI_REG8(0x3c43), 0xcd }, { CCI_REG8(0x3c44), 0xcd },
> > +       { CCI_REG8(0x3c45), 0xcd }, { CCI_REG8(0x3c46), 0xcd },
> > +       { CCI_REG8(0x3c47), 0xcd }, { CCI_REG8(0x3c48), 0xcd },
> > +       { CCI_REG8(0x3c49), 0xcd }, { CCI_REG8(0x3c4a), 0xcd },
> > +       { CCI_REG8(0x3c4b), 0xcd }, { CCI_REG8(0x3c4c), 0xcd },
> > +       { CCI_REG8(0x3c4d), 0xcd }, { CCI_REG8(0x3c4e), 0xcd },
> > +       { CCI_REG8(0x3c4f), 0xcd }, { CCI_REG8(0x3c50), 0xcd },
> > +       { CCI_REG8(0x3c51), 0xcd }, { CCI_REG8(0x3c52), 0xcd },
> > +       { CCI_REG8(0x3c53), 0xcd }, { CCI_REG8(0x3c54), 0xcd },
> > +       { CCI_REG8(0x3c55), 0xcd }, { CCI_REG8(0x3c56), 0xcd },
> > +       { CCI_REG8(0x3c57), 0xcd }, { CCI_REG8(0x3c58), 0xcd },
> > +       { CCI_REG8(0x3c59), 0xcd }, { CCI_REG8(0x3c5a), 0xcd },
> > +       { CCI_REG8(0x3c5b), 0xcd }, { CCI_REG8(0x3c5c), 0xcd },
> > +       { CCI_REG8(0x3c5d), 0xcd }, { CCI_REG8(0x3c5e), 0xcd },
> > +       { CCI_REG8(0x3c5f), 0xcd }, { CCI_REG8(0x3c60), 0xcd },
> > +       { CCI_REG8(0x3c61), 0xcd }, { CCI_REG8(0x3c62), 0xcd },
> > +       { CCI_REG8(0x3c63), 0xcd }, { CCI_REG8(0x3c64), 0xcd },
> > +       { CCI_REG8(0x3c65), 0xcd }, { CCI_REG8(0x3c66), 0xcd },
> > +       { CCI_REG8(0x3c67), 0xcd }, { CCI_REG8(0x3c68), 0xcd },
> > +       { CCI_REG8(0x3c69), 0xcd }, { CCI_REG8(0x3c6a), 0xcd },
> > +       { CCI_REG8(0x3c6b), 0xcd }, { CCI_REG8(0x3c6c), 0xcd },
> > +       { CCI_REG8(0x3c6d), 0xcd }, { CCI_REG8(0x3c6e), 0xcd },
> > +       { CCI_REG8(0x3c6f), 0xcd }, { CCI_REG8(0x3c70), 0xcd },
> > +       { CCI_REG8(0x3c71), 0xcd }, { CCI_REG8(0x3c72), 0xcd },
> > +       { CCI_REG8(0x3c73), 0xcd }, { CCI_REG8(0x3c74), 0xcd },
> > +       { CCI_REG8(0x3c75), 0xcd }, { CCI_REG8(0x3c76), 0xcd },
> > +       { CCI_REG8(0x3c77), 0xcd }, { CCI_REG8(0x3c78), 0xcd },
> > +       { CCI_REG8(0x3c79), 0xcd }, { CCI_REG8(0x3c7a), 0xcd },
> > +       { CCI_REG8(0x3c7b), 0xcd }, { CCI_REG8(0x3c7c), 0xcd },
> > +       { CCI_REG8(0x3c7d), 0xcd }, { CCI_REG8(0x3c7e), 0xcd },
> > +       { CCI_REG8(0x3c7f), 0xcd }, { CCI_REG8(0x3c80), 0xcd },
> > +       { CCI_REG8(0x3c81), 0xcd }, { CCI_REG8(0x3c82), 0xcd },
> > +       { CCI_REG8(0x3c83), 0xcd }, { CCI_REG8(0x3c84), 0xcd },
> > +       { CCI_REG8(0x3c85), 0xcd }, { CCI_REG8(0x3c86), 0xcd },
> > +       { CCI_REG8(0x3c87), 0xcd }, { CCI_REG8(0x3c88), 0xcd },
> > +       { CCI_REG8(0x3c89), 0xcd }, { CCI_REG8(0x3c8a), 0xcd },
> > +       { CCI_REG8(0x3c8b), 0xcd }, { CCI_REG8(0x3c8c), 0xcd },
> > +       { CCI_REG8(0x3c8d), 0xcd }, { CCI_REG8(0x3c8e), 0xcd },
> > +       { CCI_REG8(0x3c8f), 0xcd }, { CCI_REG8(0x3c90), 0xcd },
> > +       { CCI_REG8(0x3c91), 0xcd }, { CCI_REG8(0x3c92), 0xcd },
> > +       { CCI_REG8(0x3c93), 0xcd }, { CCI_REG8(0x3c94), 0xcd },
> > +       { CCI_REG8(0x3c95), 0xcd }, { CCI_REG8(0x3c96), 0xcd },
> > +       { CCI_REG8(0x3c97), 0xcd }, { CCI_REG8(0x3c98), 0xcd },
> > +       { CCI_REG8(0x3c99), 0xcd }, { CCI_REG8(0x3c9a), 0xcd },
> > +       { CCI_REG8(0x3c9b), 0xcd }, { CCI_REG8(0x3c9c), 0xcd },
> > +       { CCI_REG8(0x3c9d), 0xcd }, { CCI_REG8(0x3c9e), 0xcd },
> > +       { CCI_REG8(0x3c9f), 0xcd }, { CCI_REG8(0x3ca0), 0xcd },
> > +       { CCI_REG8(0x3ca1), 0xcd }, { CCI_REG8(0x3ca2), 0xcd },
> > +       { CCI_REG8(0x3ca3), 0xcd }, { CCI_REG8(0x3ca4), 0xcd },
> > +       { CCI_REG8(0x3ca5), 0xcd }, { CCI_REG8(0x3ca6), 0xcd },
> > +       { CCI_REG8(0x3ca7), 0xcd }, { CCI_REG8(0x3ca8), 0xcd },
> > +       { CCI_REG8(0x3ca9), 0xcd }, { CCI_REG8(0x3caa), 0xcd },
> > +       { CCI_REG8(0x3cab), 0xcd }, { CCI_REG8(0x3cac), 0xcd },
> > +       { CCI_REG8(0x3cad), 0xcd }, { CCI_REG8(0x3cae), 0xcd },
> > +       { CCI_REG8(0x3caf), 0xcd }, { CCI_REG8(0x3cb0), 0xcd },
> > +       { CCI_REG8(0x3cb1), 0x40 }, { CCI_REG8(0x3cb2), 0x40 },
> > +       { CCI_REG8(0x3cb3), 0x40 }, { CCI_REG8(0x3cb4), 0x40 },
> > +       { CCI_REG8(0x3cb5), 0x40 }, { CCI_REG8(0x3cb6), 0x40 },
> > +       { CCI_REG8(0x3cb7), 0x40 }, { CCI_REG8(0x3cb8), 0x40 },
> > +       { CCI_REG8(0x3cb9), 0x40 }, { CCI_REG8(0x3cba), 0x40 },
> > +       { CCI_REG8(0x3cbb), 0x40 }, { CCI_REG8(0x3cbc), 0x40 },
> > +       { CCI_REG8(0x3cbd), 0x40 }, { CCI_REG8(0x3cbe), 0x40 },
> > +       { CCI_REG8(0x3cbf), 0x40 }, { CCI_REG8(0x3cc0), 0x40 },
> > +       { CCI_REG8(0x3cc1), 0x40 }, { CCI_REG8(0x3cc2), 0x40 },
> > +       { CCI_REG8(0x3cc3), 0x40 }, { CCI_REG8(0x3cc4), 0x40 },
> > +       { CCI_REG8(0x3cc5), 0x40 }, { CCI_REG8(0x3cc6), 0x40 },
> > +       { CCI_REG8(0x3cc7), 0x40 }, { CCI_REG8(0x3cc8), 0x40 },
> > +       { CCI_REG8(0x3cc9), 0x40 }, { CCI_REG8(0x3cca), 0x40 },
> > +       { CCI_REG8(0x3ccb), 0x40 }, { CCI_REG8(0x3ccc), 0x40 },
> > +       { CCI_REG8(0x3ccd), 0x40 }, { CCI_REG8(0x3cce), 0x40 },
> > +       { CCI_REG8(0x3ccf), 0x40 }, { CCI_REG8(0x3cd0), 0x40 },
> > +       { CCI_REG8(0x3cd1), 0x40 }, { CCI_REG8(0x3cd2), 0x40 },
> > +       { CCI_REG8(0x3cd3), 0x40 }, { CCI_REG8(0x3cd4), 0x40 },
> > +       { CCI_REG8(0x3cd5), 0x40 }, { CCI_REG8(0x3cd6), 0x40 },
> > +       { CCI_REG8(0x3cd7), 0x40 }, { CCI_REG8(0x3cd8), 0x40 },
> > +       { CCI_REG8(0x3cd9), 0x40 }, { CCI_REG8(0x3cda), 0x40 },
> > +       { CCI_REG8(0x3cdb), 0x40 }, { CCI_REG8(0x3cdc), 0x40 },
> > +       { CCI_REG8(0x3cdd), 0x40 }, { CCI_REG8(0x3cde), 0x40 },
> > +       { CCI_REG8(0x3cdf), 0x40 }, { CCI_REG8(0x3ce0), 0x40 },
> > +       { CCI_REG8(0x3ce1), 0x40 }, { CCI_REG8(0x3ce2), 0x40 },
> > +       { CCI_REG8(0x3ce3), 0x40 }, { CCI_REG8(0x3ce4), 0x40 },
> > +       { CCI_REG8(0x3ce5), 0x40 }, { CCI_REG8(0x3ce6), 0x40 },
> > +       { CCI_REG8(0x3ce7), 0x40 }, { CCI_REG8(0x3ce8), 0x40 },
> > +       { CCI_REG8(0x3ce9), 0x40 }, { CCI_REG8(0x3cea), 0x40 },
> > +       { CCI_REG8(0x3ceb), 0x40 }, { CCI_REG8(0x3cec), 0x40 },
> > +       { CCI_REG8(0x3ced), 0x40 }, { CCI_REG8(0x3cee), 0x40 },
> > +       { CCI_REG8(0x3cef), 0x40 }, { CCI_REG8(0x3cf0), 0x40 },
> > +       { CCI_REG8(0x3cf1), 0x40 }, { CCI_REG8(0x3cf2), 0x40 },
> > +       { CCI_REG8(0x3cf3), 0x40 }, { CCI_REG8(0x3cf4), 0x40 },
> > +       { CCI_REG8(0x3cf5), 0x40 }, { CCI_REG8(0x3cf6), 0x40 },
> > +       { CCI_REG8(0x3cf7), 0x40 }, { CCI_REG8(0x3cf8), 0x40 },
> > +       { CCI_REG8(0x3cf9), 0x40 }, { CCI_REG8(0x3cfa), 0x40 },
> > +       { CCI_REG8(0x3cfb), 0x40 }, { CCI_REG8(0x3cfc), 0x40 },
> > +       { CCI_REG8(0x3cfd), 0x40 }, { CCI_REG8(0x3cfe), 0x40 },
> > +       { CCI_REG8(0x3cff), 0x40 }, { CCI_REG8(0x3d00), 0x40 },
> > +       { CCI_REG8(0x3d01), 0x40 }, { CCI_REG8(0x3d02), 0x40 },
> > +       { CCI_REG8(0x3d03), 0x40 }, { CCI_REG8(0x3d04), 0x40 },
> > +       { CCI_REG8(0x3d05), 0x40 }, { CCI_REG8(0x3d06), 0x40 },
> > +       { CCI_REG8(0x3d07), 0x40 }, { CCI_REG8(0x3d08), 0x40 },
> > +       { CCI_REG8(0x3d09), 0x40 }, { CCI_REG8(0x3d0a), 0x40 },
> > +       { CCI_REG8(0x3d0b), 0xcd }, { CCI_REG8(0x3d0c), 0xcd },
> > +       { CCI_REG8(0x3d0d), 0xcd }, { CCI_REG8(0x3d0e), 0xcd },
> > +       { CCI_REG8(0x3d0f), 0xcd }, { CCI_REG8(0x3d10), 0xcd },
> > +       { CCI_REG8(0x3d11), 0xcd }, { CCI_REG8(0x3d12), 0xcd },
> > +       { CCI_REG8(0x3d13), 0xcd }, { CCI_REG8(0x3d14), 0xcd },
> > +       { CCI_REG8(0x3d15), 0xcd }, { CCI_REG8(0x3d16), 0xcd },
> > +       { CCI_REG8(0x3d17), 0xcd }, { CCI_REG8(0x3d18), 0xcd },
> > +       { CCI_REG8(0x3d19), 0xcd }, { CCI_REG8(0x3d1a), 0xcd },
> > +       { CCI_REG8(0x3d1b), 0xcd }, { CCI_REG8(0x3d1c), 0xcd },
> > +       { CCI_REG8(0x3d1d), 0xcd }, { CCI_REG8(0x3d1e), 0xcd },
> > +       { CCI_REG8(0x3d1f), 0xcd }, { CCI_REG8(0x3d20), 0xcd },
> > +       { CCI_REG8(0x3d21), 0xcd }, { CCI_REG8(0x3d22), 0xcd },
> > +       { CCI_REG8(0x3d23), 0xcd }, { CCI_REG8(0x3d24), 0xcd },
> > +       { CCI_REG8(0x3d25), 0xcd }, { CCI_REG8(0x3d26), 0xcd },
> > +       { CCI_REG8(0x3d27), 0xcd }, { CCI_REG8(0x3d28), 0xcd },
> > +       { CCI_REG8(0x3d29), 0xcd }, { CCI_REG8(0x3d2a), 0xcd },
> > +       { CCI_REG8(0x3d2b), 0xcd }, { CCI_REG8(0x3d2c), 0xcd },
> > +       { CCI_REG8(0x3d2d), 0xcd }, { CCI_REG8(0x3d2e), 0xcd },
> > +       { CCI_REG8(0x3d2f), 0xcd }, { CCI_REG8(0x3d30), 0xcd },
> > +       { CCI_REG8(0x3d31), 0xcd }, { CCI_REG8(0x3d32), 0xcd },
> > +       { CCI_REG8(0x3d33), 0xcd }, { CCI_REG8(0x3d34), 0xcd },
> > +       { CCI_REG8(0x3d35), 0xcd }, { CCI_REG8(0x3d36), 0xcd },
> > +       { CCI_REG8(0x3d37), 0xcd }, { CCI_REG8(0x3d38), 0xcd },
> > +       { CCI_REG8(0x3d39), 0xcd }, { CCI_REG8(0x3d3a), 0xcd },
> > +       { CCI_REG8(0x3d3b), 0xcd }, { CCI_REG8(0x3d3c), 0xcd },
> > +       { CCI_REG8(0x3d3d), 0xcd }, { CCI_REG8(0x3d3e), 0xcd },
> > +       { CCI_REG8(0x3d3f), 0xcd }, { CCI_REG8(0x3d40), 0xcd },
> > +       { CCI_REG8(0x3d41), 0xcd }, { CCI_REG8(0x3d42), 0xcd },
> > +       { CCI_REG8(0x3d43), 0xcd }, { CCI_REG8(0x3d44), 0xcd },
> > +       { CCI_REG8(0x3d45), 0xcd }, { CCI_REG8(0x3d46), 0xcd },
> > +       { CCI_REG8(0x3d47), 0xcd }, { CCI_REG8(0x3d48), 0xcd },
> > +       { CCI_REG8(0x3d49), 0xcd }, { CCI_REG8(0x3d4a), 0xcd },
> > +       { CCI_REG8(0x3d4b), 0xcd }, { CCI_REG8(0x3d4c), 0xcd },
> > +       { CCI_REG8(0x3d4d), 0xcd }, { CCI_REG8(0x3d4e), 0xcd },
> > +       { CCI_REG8(0x3d4f), 0xcd }, { CCI_REG8(0x3d50), 0xcd },
> > +       { CCI_REG8(0x3d51), 0xcd }, { CCI_REG8(0x3d52), 0xcd },
> > +       { CCI_REG8(0x3d53), 0xcd }, { CCI_REG8(0x3d54), 0xcd },
> > +       { CCI_REG8(0x3d55), 0xcd }, { CCI_REG8(0x3d56), 0xcd },
> > +       { CCI_REG8(0x3d57), 0xcd }, { CCI_REG8(0x3d58), 0xcd },
> > +       { CCI_REG8(0x3d59), 0xcd }, { CCI_REG8(0x3d5a), 0xcd },
> > +       { CCI_REG8(0x3d5b), 0xcd }, { CCI_REG8(0x3d5c), 0xcd },
> > +       { CCI_REG8(0x3d5d), 0xcd }, { CCI_REG8(0x3d5e), 0xcd },
> > +       { CCI_REG8(0x3d5f), 0xcd }, { CCI_REG8(0x3d60), 0xcd },
> > +       { CCI_REG8(0x3d61), 0xcd }, { CCI_REG8(0x3d62), 0xcd },
> > +       { CCI_REG8(0x3d63), 0xcd }, { CCI_REG8(0x3d64), 0xcd },
> > +       { CCI_REG8(0x3d65), 0x40 }, { CCI_REG8(0x3d66), 0x40 },
> > +       { CCI_REG8(0x3d67), 0x40 }, { CCI_REG8(0x3d68), 0x40 },
> > +       { CCI_REG8(0x3d69), 0x40 }, { CCI_REG8(0x3d6a), 0x40 },
> > +       { CCI_REG8(0x3d6b), 0x40 }, { CCI_REG8(0x3d6c), 0x40 },
> > +       { CCI_REG8(0x3d6d), 0x40 }, { CCI_REG8(0x3d6e), 0x40 },
> > +       { CCI_REG8(0x3d6f), 0x40 }, { CCI_REG8(0x3d70), 0x40 },
> > +       { CCI_REG8(0x3d71), 0x40 }, { CCI_REG8(0x3d72), 0x40 },
> > +       { CCI_REG8(0x3d73), 0x40 }, { CCI_REG8(0x3d74), 0x40 },
> > +       { CCI_REG8(0x3d75), 0x40 }, { CCI_REG8(0x3d76), 0x40 },
> > +       { CCI_REG8(0x3d77), 0x40 }, { CCI_REG8(0x3d78), 0x40 },
> > +       { CCI_REG8(0x3d79), 0x40 }, { CCI_REG8(0x3d7a), 0x40 },
> > +       { CCI_REG8(0x3d7b), 0x40 }, { CCI_REG8(0x3d7c), 0x40 },
> > +       { CCI_REG8(0x3d7d), 0x40 }, { CCI_REG8(0x3d7e), 0x40 },
> > +       { CCI_REG8(0x3d7f), 0x40 }, { CCI_REG8(0x3d80), 0x40 },
> > +       { CCI_REG8(0x3d81), 0x40 }, { CCI_REG8(0x3d82), 0x40 },
> > +       { CCI_REG8(0x3d83), 0x40 }, { CCI_REG8(0x3d84), 0x40 },
> > +       { CCI_REG8(0x3d85), 0x40 }, { CCI_REG8(0x3d86), 0x40 },
> > +       { CCI_REG8(0x3d87), 0x40 }, { CCI_REG8(0x3d88), 0x40 },
> > +       { CCI_REG8(0x3d89), 0x40 }, { CCI_REG8(0x3d8a), 0x40 },
> > +       { CCI_REG8(0x3d8b), 0x40 }, { CCI_REG8(0x3d8c), 0x40 },
> > +       { CCI_REG8(0x3d8d), 0x40 }, { CCI_REG8(0x3d8e), 0x40 },
> > +       { CCI_REG8(0x3d8f), 0x40 }, { CCI_REG8(0x3d90), 0x40 },
> > +       { CCI_REG8(0x3d91), 0x40 }, { CCI_REG8(0x3d92), 0x40 },
> > +       { CCI_REG8(0x3d93), 0x40 }, { CCI_REG8(0x3d94), 0x40 },
> > +       { CCI_REG8(0x3d95), 0x40 }, { CCI_REG8(0x3d96), 0x40 },
> > +       { CCI_REG8(0x3d97), 0x40 }, { CCI_REG8(0x3d98), 0x40 },
> > +       { CCI_REG8(0x3d99), 0x40 }, { CCI_REG8(0x3d9a), 0x40 },
> > +       { CCI_REG8(0x3d9b), 0x40 }, { CCI_REG8(0x3d9c), 0x40 },
> > +       { CCI_REG8(0x3d9d), 0x40 }, { CCI_REG8(0x3d9e), 0x40 },
> > +       { CCI_REG8(0x3d9f), 0x40 }, { CCI_REG8(0x3da0), 0x40 },
> > +       { CCI_REG8(0x3da1), 0x40 }, { CCI_REG8(0x3da2), 0x40 },
> > +       { CCI_REG8(0x3da3), 0x40 }, { CCI_REG8(0x3da4), 0x40 },
> > +       { CCI_REG8(0x3da5), 0x40 }, { CCI_REG8(0x3da6), 0x40 },
> > +       { CCI_REG8(0x3da7), 0x40 }, { CCI_REG8(0x3da8), 0x40 },
> > +       { CCI_REG8(0x3da9), 0x40 }, { CCI_REG8(0x3daa), 0x40 },
> > +       { CCI_REG8(0x3dab), 0x40 }, { CCI_REG8(0x3dac), 0x40 },
> > +       { CCI_REG8(0x3dad), 0x40 }, { CCI_REG8(0x3dae), 0x40 },
> > +       { CCI_REG8(0x3daf), 0x40 }, { CCI_REG8(0x3db0), 0x40 },
> > +       { CCI_REG8(0x3db1), 0x40 }, { CCI_REG8(0x3db2), 0x40 },
> > +       { CCI_REG8(0x3db3), 0x40 }, { CCI_REG8(0x3db4), 0x40 },
> > +       { CCI_REG8(0x3db5), 0x40 }, { CCI_REG8(0x3db6), 0x40 },
> > +       { CCI_REG8(0x3db7), 0x40 }, { CCI_REG8(0x3db8), 0x40 },
> > +       { CCI_REG8(0x3db9), 0x40 }, { CCI_REG8(0x3dba), 0x40 },
> > +       { CCI_REG8(0x3dbb), 0x40 }, { CCI_REG8(0x3dbc), 0x40 },
> > +       { CCI_REG8(0x3dbd), 0x40 }, { CCI_REG8(0x3dbe), 0x40 },
> > +       { CCI_REG8(0x3dbf), 0xcd }, { CCI_REG8(0x3dc0), 0xcd },
> > +       { CCI_REG8(0x3dc1), 0xcd }, { CCI_REG8(0x3dc2), 0xcd },
> > +       { CCI_REG8(0x3dc3), 0xcd }, { CCI_REG8(0x3dc4), 0xcd },
> > +       { CCI_REG8(0x3dc5), 0xcd }, { CCI_REG8(0x3dc6), 0xcd },
> > +       { CCI_REG8(0x3dc7), 0xcd }, { CCI_REG8(0x3dc8), 0xcd },
> > +       { CCI_REG8(0x3dc9), 0xcd }, { CCI_REG8(0x3dca), 0xcd },
> > +       { CCI_REG8(0x3dcb), 0xcd }, { CCI_REG8(0x3dcc), 0xcd },
> > +       { CCI_REG8(0x3dcd), 0xcd }, { CCI_REG8(0x3dce), 0xcd },
> > +       { CCI_REG8(0x3dcf), 0xcd }, { CCI_REG8(0x3dd0), 0xcd },
> > +       { CCI_REG8(0x3dd1), 0xcd }, { CCI_REG8(0x3dd2), 0xcd },
> > +       { CCI_REG8(0x3dd3), 0xcd }, { CCI_REG8(0x3dd4), 0xcd },
> > +       { CCI_REG8(0x3dd5), 0xcd }, { CCI_REG8(0x3dd6), 0xcd },
> > +       { CCI_REG8(0x3dd7), 0xcd }, { CCI_REG8(0x3dd8), 0xcd },
> > +       { CCI_REG8(0x3dd9), 0xcd }, { CCI_REG8(0x3dda), 0xcd },
> > +       { CCI_REG8(0x3ddb), 0xcd }, { CCI_REG8(0x3ddc), 0xcd },
> > +       { CCI_REG8(0x3ddd), 0xcd }, { CCI_REG8(0x3dde), 0xcd },
> > +       { CCI_REG8(0x3ddf), 0xcd }, { CCI_REG8(0x3de0), 0xcd },
> > +       { CCI_REG8(0x3de1), 0xcd }, { CCI_REG8(0x3de2), 0xcd },
> > +       { CCI_REG8(0x3de3), 0xcd }, { CCI_REG8(0x3de4), 0xcd },
> > +       { CCI_REG8(0x3de5), 0xcd }, { CCI_REG8(0x3de6), 0xcd },
> > +       { CCI_REG8(0x3de7), 0xcd }, { CCI_REG8(0x3de8), 0xcd },
> > +       { CCI_REG8(0x3de9), 0xcd }, { CCI_REG8(0x3dea), 0xcd },
> > +       { CCI_REG8(0x3deb), 0xcd }, { CCI_REG8(0x3dec), 0xcd },
> > +       { CCI_REG8(0x3ded), 0xcd }, { CCI_REG8(0x3dee), 0xcd },
> > +       { CCI_REG8(0x3def), 0xcd }, { CCI_REG8(0x3df0), 0xcd },
> > +       { CCI_REG8(0x3df1), 0xcd }, { CCI_REG8(0x3df2), 0xcd },
> > +       { CCI_REG8(0x3df3), 0xcd }, { CCI_REG8(0x3df4), 0xcd },
> > +       { CCI_REG8(0x3df5), 0xcd }, { CCI_REG8(0x3df6), 0xcd },
> > +       { CCI_REG8(0x3df7), 0xcd }, { CCI_REG8(0x3df8), 0xcd },
> > +       { CCI_REG8(0x3df9), 0xcd }, { CCI_REG8(0x3dfa), 0xcd },
> > +       { CCI_REG8(0x3dfb), 0xcd }, { CCI_REG8(0x3dfc), 0xcd },
> > +       { CCI_REG8(0x3dfd), 0xcd }, { CCI_REG8(0x3dfe), 0xcd },
> > +       { CCI_REG8(0x3dff), 0xcd }, { CCI_REG8(0x3e00), 0xcd },
> > +       { CCI_REG8(0x3e01), 0xcd }, { CCI_REG8(0x3e02), 0xcd },
> > +       { CCI_REG8(0x3e03), 0xcd }, { CCI_REG8(0x3e04), 0xcd },
> > +       { CCI_REG8(0x3e05), 0xcd }, { CCI_REG8(0x3e06), 0xcd },
> > +       { CCI_REG8(0x3e07), 0xcd }, { CCI_REG8(0x3e08), 0xcd },
> > +       { CCI_REG8(0x3e09), 0xcd }, { CCI_REG8(0x3e0a), 0xcd },
> > +       { CCI_REG8(0x3e0b), 0xcd }, { CCI_REG8(0x3e0c), 0xcd },
> > +       { CCI_REG8(0x3e0d), 0xcd }, { CCI_REG8(0x3e0e), 0xcd },
> > +       { CCI_REG8(0x3e0f), 0xcd }, { CCI_REG8(0x3e10), 0xcd },
> > +       { CCI_REG8(0x3e11), 0xcd }, { CCI_REG8(0x3e12), 0xcd },
> > +       { CCI_REG8(0x3e13), 0xcd }, { CCI_REG8(0x3e14), 0xcd },
> > +       { CCI_REG8(0x3e15), 0xcd }, { CCI_REG8(0x3e16), 0xcd },
> > +       { CCI_REG8(0x3e17), 0xcd }, { CCI_REG8(0x3e18), 0xcd },
> > +       { CCI_REG8(0x3e19), 0xcd }, { CCI_REG8(0x3e1a), 0xcd },
> > +       { CCI_REG8(0x3e1b), 0xcd }, { CCI_REG8(0x3e1c), 0xcd },
> > +       { CCI_REG8(0x3e1d), 0xcd }, { CCI_REG8(0x3e1e), 0xcd },
> > +       { CCI_REG8(0x3e1f), 0xcd }, { CCI_REG8(0x3e20), 0xcd },
> > +       { CCI_REG8(0x3e21), 0xcd }, { CCI_REG8(0x3e22), 0xcd },
> > +       { CCI_REG8(0x3e23), 0xcd }, { CCI_REG8(0x3e24), 0xcd },
> > +       { CCI_REG8(0x3e25), 0xcd }, { CCI_REG8(0x3e26), 0xcd },
> > +       { CCI_REG8(0x3e27), 0xcd }, { CCI_REG8(0x3e28), 0xcd },
> > +       { CCI_REG8(0x3e29), 0xcd }, { CCI_REG8(0x3e2a), 0xcd },
> > +       { CCI_REG8(0x3e2b), 0xcd }, { CCI_REG8(0x3e2c), 0xcd },
> > +       { CCI_REG8(0x3e2d), 0xcd }, { CCI_REG8(0x3e2e), 0xcd },
> > +       { CCI_REG8(0x3e2f), 0xcd }, { CCI_REG8(0x3e30), 0xcd },
> > +       { CCI_REG8(0x3e31), 0xcd }, { CCI_REG8(0x3e32), 0xcd },
> > +       { CCI_REG8(0x3e33), 0xcd }, { CCI_REG8(0x3e34), 0xcd },
> > +       { CCI_REG8(0x3e35), 0xcd }, { CCI_REG8(0x3e36), 0xcd },
> > +       { CCI_REG8(0x3e37), 0xcd }, { CCI_REG8(0x3e38), 0xcd },
> > +       { CCI_REG8(0x3e39), 0xcd }, { CCI_REG8(0x3e3a), 0xcd },
> > +       { CCI_REG8(0x3e3b), 0xcd }, { CCI_REG8(0x3e3c), 0xcd },
> > +       { CCI_REG8(0x3e3d), 0xcd }, { CCI_REG8(0x3e3e), 0xcd },
> > +       { CCI_REG8(0x3e3f), 0xcd }, { CCI_REG8(0x3e40), 0xcd },
> > +       { CCI_REG8(0x3e41), 0xcd }, { CCI_REG8(0x3e42), 0xcd },
> > +       { CCI_REG8(0x3e43), 0xcd }, { CCI_REG8(0x3e44), 0xcd },
> > +       { CCI_REG8(0x3e45), 0xcd }, { CCI_REG8(0x3e46), 0xcd },
> > +       { CCI_REG8(0x3e47), 0xcd }, { CCI_REG8(0x3e48), 0xcd },
> > +       { CCI_REG8(0x3e49), 0xcd }, { CCI_REG8(0x3e4a), 0xcd },
> > +       { CCI_REG8(0x3e4b), 0xcd }, { CCI_REG8(0x3e4c), 0xcd },
> > +       { CCI_REG8(0x3e4d), 0xcd }, { CCI_REG8(0x3e4e), 0xcd },
> > +       { CCI_REG8(0x3e4f), 0xcd }, { CCI_REG8(0x3e50), 0xcd },
> > +       { CCI_REG8(0x3e51), 0xcd }, { CCI_REG8(0x3e52), 0xcd },
> > +       { CCI_REG8(0x3e53), 0xcd }, { CCI_REG8(0x3e54), 0xcd },
> > +       { CCI_REG8(0x3e55), 0xcd }, { CCI_REG8(0x3e56), 0xcd },
> > +       { CCI_REG8(0x3e57), 0xcd }, { CCI_REG8(0x3e58), 0xcd },
> > +       { CCI_REG8(0x3e59), 0xcd }, { CCI_REG8(0x3e5a), 0xcd },
> > +       { CCI_REG8(0x3e5b), 0xcd }, { CCI_REG8(0x3e5c), 0xcd },
> > +       { CCI_REG8(0x3e5d), 0xcd }, { CCI_REG8(0x3e5e), 0xcd },
> > +       { CCI_REG8(0x3e5f), 0xcd }, { CCI_REG8(0x3e60), 0xcd },
> > +       { CCI_REG8(0x3e61), 0xcd }, { CCI_REG8(0x3e62), 0xcd },
> > +       { CCI_REG8(0x3e63), 0xcd }, { CCI_REG8(0x3e64), 0xcd },
> > +       { CCI_REG8(0x3e65), 0xcd }, { CCI_REG8(0x3e66), 0xcd },
> > +       { CCI_REG8(0x3e67), 0xcd }, { CCI_REG8(0x3e68), 0xcd },
> > +       { CCI_REG8(0x3e69), 0xcd }, { CCI_REG8(0x3e6a), 0xcd },
> > +       { CCI_REG8(0x3e6b), 0xcd }, { CCI_REG8(0x3e6c), 0xcd },
> > +       { CCI_REG8(0x3e6d), 0xcd }, { CCI_REG8(0x3e6e), 0xcd },
> > +       { CCI_REG8(0x3e6f), 0xcd }, { CCI_REG8(0x3e70), 0xcd },
> > +       { CCI_REG8(0x3e71), 0xcd }, { CCI_REG8(0x3e72), 0xcd },
> > +       { CCI_REG8(0x3e73), 0xcd }, { CCI_REG8(0x3e74), 0xcd },
> > +       { CCI_REG8(0x3e75), 0xcd }, { CCI_REG8(0x3e76), 0xcd },
> > +       { CCI_REG8(0x3e77), 0xcd }, { CCI_REG8(0x3e78), 0xcd },
> > +       { CCI_REG8(0x3e79), 0xcd }, { CCI_REG8(0x3e7a), 0xcd },
> > +       { CCI_REG8(0x3e7b), 0xcd }, { CCI_REG8(0x3e7c), 0xcd },
> > +       { CCI_REG8(0x3e7d), 0xcd }, { CCI_REG8(0x3e7e), 0xcd },
> > +       { CCI_REG8(0x3e7f), 0xcd }, { CCI_REG8(0x3e80), 0xcd },
> > +       { CCI_REG8(0x3e81), 0xcd }, { CCI_REG8(0x3e82), 0xcd },
> > +       { CCI_REG8(0x3e83), 0xcd }, { CCI_REG8(0x3e84), 0xcd },
> > +       { CCI_REG8(0x3e85), 0xcd }, { CCI_REG8(0x3e86), 0xcd },
> > +       { CCI_REG8(0x3e87), 0xcd }, { CCI_REG8(0x3e88), 0xcd },
> > +       { CCI_REG8(0x3e89), 0xcd }, { CCI_REG8(0x3e8a), 0xcd },
> > +       { CCI_REG8(0x3e8b), 0xcd }, { CCI_REG8(0x3e8c), 0xcd },
> > +       { CCI_REG8(0x3e8d), 0xcd }, { CCI_REG8(0x3e8e), 0xcd },
> > +       { CCI_REG8(0x3e8f), 0xcd }, { CCI_REG8(0x3e90), 0xcd },
> > +       { CCI_REG8(0x3e91), 0xcd }, { CCI_REG8(0x3e92), 0xcd },
> > +       { CCI_REG8(0x3e93), 0xcd }, { CCI_REG8(0x3e94), 0xcd },
> > +       { CCI_REG8(0x3e95), 0xcd }, { CCI_REG8(0x3e96), 0xcd },
> > +       { CCI_REG8(0x3e97), 0xcd }, { CCI_REG8(0x3e98), 0xcd },
> > +       { CCI_REG8(0x3e99), 0xcd }, { CCI_REG8(0x3e9a), 0xcd },
> > +       { CCI_REG8(0x3e9b), 0xcd }, { CCI_REG8(0x3e9c), 0xcd },
> > +       { CCI_REG8(0x3e9d), 0xcd }, { CCI_REG8(0x3e9e), 0xcd },
> > +       { CCI_REG8(0x3e9f), 0xcd }, { CCI_REG8(0xfff9), 0x06 },
> > +       { CCI_REG8(0xc03f), 0x01 }, { CCI_REG8(0xc03e), 0x08 },
> > +       { CCI_REG8(0xc02c), 0xff }, { CCI_REG8(0xc005), 0x06 },
> > +       { CCI_REG8(0xc006), 0x30 }, { CCI_REG8(0xc007), 0xc0 },
> > +       { CCI_REG8(0xc027), 0x01 }, { CCI_REG8(0x30c0), 0x05 },
> > +       { CCI_REG8(0x30c1), 0x9f }, { CCI_REG8(0x30c2), 0x06 },
> > +       { CCI_REG8(0x30c3), 0x5f }, { CCI_REG8(0x30c4), 0x80 },
> > +       { CCI_REG8(0x30c5), 0x08 }, { CCI_REG8(0x30c6), 0x39 },
> > +       { CCI_REG8(0x30c7), 0x00 }, { CCI_REG8(0xc046), 0x20 },
> > +       { CCI_REG8(0xc043), 0x01 }, { CCI_REG8(0xc04b), 0x01 },
> > +       { CCI_REG8(0x0102), 0x01 }, { CCI_REG8(0x0100), 0x00 },
> > +       { CCI_REG8(0x0102), 0x00 }, { CCI_REG8(0x3015), 0xf0 },
> > +       { CCI_REG8(0x3018), 0xf0 }, { CCI_REG8(0x301c), 0xf0 },
> > +       { CCI_REG8(0x301d), 0xf6 }, { CCI_REG8(0x301e), 0xf1 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_9248x6944[] = {
> > +       { CCI_REG8(0x0305), 0x98 }, { CCI_REG8(0x0306), 0x04 },
> > +       { CCI_REG8(0x0307), 0x01 }, { CCI_REG8(0x4837), 0x1a },
> > +       { CCI_REG8(0x4888), 0x10 }, { CCI_REG8(0x4860), 0x00 },
> > +       { CCI_REG8(0x4850), 0x43 }, { CCI_REG8(0x480C), 0x92 },
> > +       { CCI_REG8(0x5001), 0x21 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_8000x6000[] = {
> > +       { CCI_REG8(0x0305), 0x98 }, { CCI_REG8(0x0306), 0x04 },
> > +       { CCI_REG8(0x0307), 0x01 }, { CCI_REG8(0x4837), 0x1a },
> > +       { CCI_REG8(0x4888), 0x10 }, { CCI_REG8(0x4860), 0x00 },
> > +       { CCI_REG8(0x4850), 0x43 }, { CCI_REG8(0x480C), 0x92 },
> > +       { CCI_REG8(0x5001), 0x21 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_4624_3472[] = {
> > +       { CCI_REG8(0x034b), 0x02 }, { CCI_REG8(0x3504), 0x08 },
> > +       { CCI_REG8(0x360d), 0x82 }, { CCI_REG8(0x368a), 0x2e },
> > +       { CCI_REG8(0x3712), 0x50 }, { CCI_REG8(0x3822), 0x00 },
> > +       { CCI_REG8(0x3827), 0x40 }, { CCI_REG8(0x383d), 0x08 },
> > +       { CCI_REG8(0x383f), 0x00 }, { CCI_REG8(0x384c), 0x02 },
> > +       { CCI_REG8(0x384d), 0xba }, { CCI_REG8(0x3852), 0x00 },
> > +       { CCI_REG8(0x3856), 0x08 }, { CCI_REG8(0x3857), 0x08 },
> > +       { CCI_REG8(0x3858), 0x10 }, { CCI_REG8(0x3859), 0x10 },
> > +       { CCI_REG8(0x4016), 0x0f }, { CCI_REG8(0x4018), 0x03 },
> > +       { CCI_REG8(0x4504), 0x1e }, { CCI_REG8(0x4523), 0x41 },
> > +       { CCI_REG8(0x45c0), 0x01 }, { CCI_REG8(0x4641), 0x12 },
> > +       { CCI_REG8(0x4643), 0x0c }, { CCI_REG8(0x4915), 0x02 },
> > +       { CCI_REG8(0x4916), 0x1d }, { CCI_REG8(0x4a15), 0x02 },
> > +       { CCI_REG8(0x4a16), 0x1d }, { CCI_REG8(0x3703), 0x72 },
> > +       { CCI_REG8(0x3709), 0xe6 }, { CCI_REG8(0x3a60), 0x68 },
> > +       { CCI_REG8(0x3a6f), 0x68 }, { CCI_REG8(0x3a5e), 0xdc },
> > +       { CCI_REG8(0x3a6d), 0xdc }, { CCI_REG8(0x3721), 0xc9 },
> > +       { CCI_REG8(0x5250), 0x06 }, { CCI_REG8(0x527a), 0x00 },
> > +       { CCI_REG8(0x527b), 0x65 }, { CCI_REG8(0x527c), 0x00 },
> > +       { CCI_REG8(0x527d), 0x82 }, { CCI_REG8(0x5280), 0x24 },
> > +       { CCI_REG8(0x5281), 0x40 }, { CCI_REG8(0x5282), 0x1b },
> > +       { CCI_REG8(0x5283), 0x40 }, { CCI_REG8(0x5284), 0x24 },
> > +       { CCI_REG8(0x5285), 0x40 }, { CCI_REG8(0x5286), 0x1b },
> > +       { CCI_REG8(0x5287), 0x40 }, { CCI_REG8(0x5200), 0x24 },
> > +       { CCI_REG8(0x5201), 0x40 }, { CCI_REG8(0x5202), 0x1b },
> > +       { CCI_REG8(0x5203), 0x40 }, { CCI_REG8(0x481b), 0x35 },
> > +       { CCI_REG8(0x4862), 0x25 }, { CCI_REG8(0x3400), 0x00 },
> > +       { CCI_REG8(0x3421), 0x23 }, { CCI_REG8(0x3422), 0xfc },
> > +       { CCI_REG8(0x3423), 0x07 }, { CCI_REG8(0x3424), 0x01 },
> > +       { CCI_REG8(0x3425), 0x04 }, { CCI_REG8(0x3426), 0x50 },
> > +       { CCI_REG8(0x3427), 0x55 }, { CCI_REG8(0x3428), 0x15 },
> > +       { CCI_REG8(0x3429), 0x00 }, { CCI_REG8(0x3025), 0x03 },
> > +       { CCI_REG8(0x5250), 0x06 }, { CCI_REG8(0x0305), 0x98 },
> > +       { CCI_REG8(0x0306), 0x04 }, { CCI_REG8(0x0307), 0x01 },
> > +       { CCI_REG8(0x4837), 0x1a }, { CCI_REG8(0x4888), 0x10 },
> > +       { CCI_REG8(0x4860), 0x00 }, { CCI_REG8(0x4850), 0x43 },
> > +       { CCI_REG8(0x480C), 0x92 }, { CCI_REG8(0x5001), 0x21 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_3840x2160[] = {
> > +       { CCI_REG8(0x034a), 0x05 }, { CCI_REG8(0x034b), 0x05 },
> > +       { CCI_REG8(0x3504), 0x08 }, { CCI_REG8(0x360d), 0x82 },
> > +       { CCI_REG8(0x368a), 0x2e }, { CCI_REG8(0x3712), 0x50 },
> > +       { CCI_REG8(0x3822), 0x00 }, { CCI_REG8(0x3827), 0x40 },
> > +       { CCI_REG8(0x383d), 0x08 }, { CCI_REG8(0x383f), 0x00 },
> > +       { CCI_REG8(0x384c), 0x02 }, { CCI_REG8(0x384d), 0xba },
> > +       { CCI_REG8(0x3852), 0x00 }, { CCI_REG8(0x3856), 0x08 },
> > +       { CCI_REG8(0x3857), 0x08 }, { CCI_REG8(0x3858), 0x10 },
> > +       { CCI_REG8(0x3859), 0x10 }, { CCI_REG8(0x4016), 0x0f },
> > +       { CCI_REG8(0x4018), 0x03 }, { CCI_REG8(0x4504), 0x1e },
> > +       { CCI_REG8(0x4523), 0x41 }, { CCI_REG8(0x45c0), 0x01 },
> > +       { CCI_REG8(0x4641), 0x12 }, { CCI_REG8(0x4643), 0x0c },
> > +       { CCI_REG8(0x4915), 0x02 }, { CCI_REG8(0x4916), 0x1d },
> > +       { CCI_REG8(0x4a15), 0x02 }, { CCI_REG8(0x4a16), 0x1d },
> > +       { CCI_REG8(0x3703), 0x72 }, { CCI_REG8(0x3709), 0xe6 },
> > +       { CCI_REG8(0x3a60), 0x68 }, { CCI_REG8(0x3a6f), 0x68 },
> > +       { CCI_REG8(0x3a5e), 0xdc }, { CCI_REG8(0x3a6d), 0xdc },
> > +       { CCI_REG8(0x3721), 0xc9 }, { CCI_REG8(0x5250), 0x06 },
> > +       { CCI_REG8(0x527a), 0x00 }, { CCI_REG8(0x527b), 0x65 },
> > +       { CCI_REG8(0x527c), 0x00 }, { CCI_REG8(0x527d), 0x82 },
> > +       { CCI_REG8(0x5280), 0x24 }, { CCI_REG8(0x5281), 0x40 },
> > +       { CCI_REG8(0x5282), 0x1b }, { CCI_REG8(0x5283), 0x40 },
> > +       { CCI_REG8(0x5284), 0x24 }, { CCI_REG8(0x5285), 0x40 },
> > +       { CCI_REG8(0x5286), 0x1b }, { CCI_REG8(0x5287), 0x40 },
> > +       { CCI_REG8(0x5200), 0x24 }, { CCI_REG8(0x5201), 0x40 },
> > +       { CCI_REG8(0x5202), 0x1b }, { CCI_REG8(0x5203), 0x40 },
> > +       { CCI_REG8(0x481b), 0x35 }, { CCI_REG8(0x4862), 0x25 },
> > +       { CCI_REG8(0x3400), 0x00 }, { CCI_REG8(0x3421), 0x23 },
> > +       { CCI_REG8(0x3422), 0xfc }, { CCI_REG8(0x3423), 0x07 },
> > +       { CCI_REG8(0x3424), 0x01 }, { CCI_REG8(0x3425), 0x04 },
> > +       { CCI_REG8(0x3426), 0x50 }, { CCI_REG8(0x3427), 0x55 },
> > +       { CCI_REG8(0x3428), 0x15 }, { CCI_REG8(0x3429), 0x00 },
> > +       { CCI_REG8(0x3025), 0x03 }, { CCI_REG8(0x5250), 0x06 },
> > +       { CCI_REG8(0x0305), 0x98 }, { CCI_REG8(0x0306), 0x04 },
> > +       { CCI_REG8(0x0345), 0x90 }, { CCI_REG8(0x0307), 0x01 },
> > +       { CCI_REG8(0x4837), 0x1a }, { CCI_REG8(0x4888), 0x10 },
> > +       { CCI_REG8(0x4860), 0x00 }, { CCI_REG8(0x4850), 0x43 },
> > +       { CCI_REG8(0x480C), 0x92 }, { CCI_REG8(0x5001), 0x21 },
> > +       { CCI_REG8(0x5000), 0x01 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_2312_1736[] = {
> > +       { CCI_REG8(0x034b), 0x02 }, { CCI_REG8(0x3504), 0x08 },
> > +       { CCI_REG8(0x360d), 0x82 }, { CCI_REG8(0x368a), 0x2e },
> > +       { CCI_REG8(0x3712), 0x00 }, { CCI_REG8(0x3822), 0x08 },
> > +       { CCI_REG8(0x3827), 0x40 }, { CCI_REG8(0x383d), 0x04 },
> > +       { CCI_REG8(0x383f), 0x00 }, { CCI_REG8(0x384c), 0x01 },
> > +       { CCI_REG8(0x384d), 0x12 }, { CCI_REG8(0x3852), 0x00 },
> > +       { CCI_REG8(0x3856), 0x04 }, { CCI_REG8(0x3857), 0x04 },
> > +       { CCI_REG8(0x3858), 0x08 }, { CCI_REG8(0x3859), 0x08 },
> > +       { CCI_REG8(0x4016), 0x07 }, { CCI_REG8(0x4018), 0x01 },
> > +       { CCI_REG8(0x4504), 0x00 }, { CCI_REG8(0x4523), 0x00 },
> > +       { CCI_REG8(0x45c0), 0x01 }, { CCI_REG8(0x4641), 0x24 },
> > +       { CCI_REG8(0x4643), 0x0c }, { CCI_REG8(0x4837), 0x0b },
> > +       { CCI_REG8(0x4915), 0x02 }, { CCI_REG8(0x4916), 0x1d },
> > +       { CCI_REG8(0x4a15), 0x02 }, { CCI_REG8(0x4a16), 0x1d },
> > +       { CCI_REG8(0x5000), 0x55 }, { CCI_REG8(0x5001), 0x00 },
> > +       { CCI_REG8(0x5002), 0x35 }, { CCI_REG8(0x5004), 0xc0 },
> > +       { CCI_REG8(0x5068), 0x02 }, { CCI_REG8(0x3703), 0x6a },
> > +       { CCI_REG8(0x3709), 0xa3 }, { CCI_REG8(0x3a60), 0x60 },
> > +       { CCI_REG8(0x3a6f), 0x60 }, { CCI_REG8(0x3a5e), 0x99 },
> > +       { CCI_REG8(0x3a6d), 0x99 }, { CCI_REG8(0x3721), 0xc1 },
> > +       { CCI_REG8(0x5250), 0x06 }, { CCI_REG8(0x527a), 0x00 },
> > +       { CCI_REG8(0x527b), 0x65 }, { CCI_REG8(0x527c), 0x00 },
> > +       { CCI_REG8(0x527d), 0x82 }, { CCI_REG8(0x5280), 0x24 },
> > +       { CCI_REG8(0x5281), 0x40 }, { CCI_REG8(0x5282), 0x1b },
> > +       { CCI_REG8(0x5283), 0x40 }, { CCI_REG8(0x5284), 0x24 },
> > +       { CCI_REG8(0x5285), 0x40 }, { CCI_REG8(0x5286), 0x1b },
> > +       { CCI_REG8(0x5287), 0x40 }, { CCI_REG8(0x5200), 0x24 },
> > +       { CCI_REG8(0x5201), 0x40 }, { CCI_REG8(0x5202), 0x1b },
> > +       { CCI_REG8(0x5203), 0x40 }, { CCI_REG8(0x3684), 0x05 },
> > +       { CCI_REG8(0x481b), 0x20 }, { CCI_REG8(0x51b0), 0x38 },
> > +       { CCI_REG8(0x51b3), 0x0e }, { CCI_REG8(0x51b5), 0x04 },
> > +       { CCI_REG8(0x51b6), 0x00 }, { CCI_REG8(0x51b7), 0x00 },
> > +       { CCI_REG8(0x51b9), 0x70 }, { CCI_REG8(0x51bb), 0x10 },
> > +       { CCI_REG8(0x51bc), 0x00 }, { CCI_REG8(0x51bd), 0x00 },
> > +       { CCI_REG8(0x51b0), 0x38 }, { CCI_REG8(0x54b0), 0x38 },
> > +       { CCI_REG8(0x54b3), 0x0e }, { CCI_REG8(0x54b5), 0x04 },
> > +       { CCI_REG8(0x54b6), 0x00 }, { CCI_REG8(0x54b7), 0x00 },
> > +       { CCI_REG8(0x54b9), 0x70 }, { CCI_REG8(0x54bb), 0x10 },
> > +       { CCI_REG8(0x54bc), 0x00 }, { CCI_REG8(0x54bd), 0x00 },
> > +       { CCI_REG8(0x57b0), 0x38 }, { CCI_REG8(0x57b3), 0x0e },
> > +       { CCI_REG8(0x57b5), 0x04 }, { CCI_REG8(0x57b6), 0x00 },
> > +       { CCI_REG8(0x57b7), 0x00 }, { CCI_REG8(0x57b9), 0x70 },
> > +       { CCI_REG8(0x57bb), 0x10 }, { CCI_REG8(0x57bc), 0x00 },
> > +       { CCI_REG8(0x57bd), 0x00 }, { CCI_REG8(0x0305), 0x98 },
> > +       { CCI_REG8(0x0306), 0x04 }, { CCI_REG8(0x0307), 0x01 },
> > +       { CCI_REG8(0x4837), 0x1a }, { CCI_REG8(0x4888), 0x10 },
> > +       { CCI_REG8(0x4860), 0x00 }, { CCI_REG8(0x4850), 0x43 },
> > +       { CCI_REG8(0x480C), 0x92 }
> > +};
> > +
> > +static const struct cci_reg_sequence ov64a40_1920x1080[] = {
> > +       { CCI_REG8(0x034b), 0x02 }, { CCI_REG8(0x3504), 0x08 },
> > +       { CCI_REG8(0x360d), 0x82 }, { CCI_REG8(0x368a), 0x2e },
> > +       { CCI_REG8(0x3712), 0x00 }, { CCI_REG8(0x3822), 0x08 },
> > +       { CCI_REG8(0x3827), 0x40 }, { CCI_REG8(0x383d), 0x04 },
> > +       { CCI_REG8(0x383f), 0x00 }, { CCI_REG8(0x384c), 0x01 },
> > +       { CCI_REG8(0x384d), 0x12 }, { CCI_REG8(0x3852), 0x00 },
> > +       { CCI_REG8(0x3856), 0x04 }, { CCI_REG8(0x3857), 0x04 },
> > +       { CCI_REG8(0x3858), 0x08 }, { CCI_REG8(0x3859), 0x08 },
> > +       { CCI_REG8(0x4016), 0x07 }, { CCI_REG8(0x4018), 0x01 },
> > +       { CCI_REG8(0x4504), 0x00 }, { CCI_REG8(0x4523), 0x00 },
> > +       { CCI_REG8(0x45c0), 0x01 }, { CCI_REG8(0x4641), 0x24 },
> > +       { CCI_REG8(0x4643), 0x0c }, { CCI_REG8(0x4837), 0x0b },
> > +       { CCI_REG8(0x4915), 0x02 }, { CCI_REG8(0x4916), 0x1d },
> > +       { CCI_REG8(0x4a15), 0x02 }, { CCI_REG8(0x4a16), 0x1d },
> > +       { CCI_REG8(0x5000), 0x55 }, { CCI_REG8(0x5001), 0x00 },
> > +       { CCI_REG8(0x5002), 0x35 }, { CCI_REG8(0x5004), 0xc0 },
> > +       { CCI_REG8(0x5068), 0x02 }, { CCI_REG8(0x3703), 0x6a },
> > +       { CCI_REG8(0x3709), 0xa3 }, { CCI_REG8(0x3a60), 0x60 },
> > +       { CCI_REG8(0x3a6f), 0x60 }, { CCI_REG8(0x3a5e), 0x99 },
> > +       { CCI_REG8(0x3a6d), 0x99 }, { CCI_REG8(0x3721), 0xc1 },
> > +       { CCI_REG8(0x5250), 0x06 }, { CCI_REG8(0x527a), 0x00 },
> > +       { CCI_REG8(0x527b), 0x65 }, { CCI_REG8(0x527c), 0x00 },
> > +       { CCI_REG8(0x527d), 0x82 }, { CCI_REG8(0x5280), 0x24 },
> > +       { CCI_REG8(0x5281), 0x40 }, { CCI_REG8(0x5282), 0x1b },
> > +       { CCI_REG8(0x5283), 0x40 }, { CCI_REG8(0x5284), 0x24 },
> > +       { CCI_REG8(0x5285), 0x40 }, { CCI_REG8(0x5286), 0x1b },
> > +       { CCI_REG8(0x5287), 0x40 }, { CCI_REG8(0x5200), 0x24 },
> > +       { CCI_REG8(0x5201), 0x40 }, { CCI_REG8(0x5202), 0x1b },
> > +       { CCI_REG8(0x5203), 0x40 }, { CCI_REG8(0x3684), 0x05 },
> > +       { CCI_REG8(0x481b), 0x20 }, { CCI_REG8(0x51b0), 0x38 },
> > +       { CCI_REG8(0x51b3), 0x0e }, { CCI_REG8(0x51b5), 0x04 },
> > +       { CCI_REG8(0x51b6), 0x00 }, { CCI_REG8(0x51b7), 0x00 },
> > +       { CCI_REG8(0x51b9), 0x70 }, { CCI_REG8(0x51bb), 0x10 },
> > +       { CCI_REG8(0x51bc), 0x00 }, { CCI_REG8(0x51bd), 0x00 },
> > +       { CCI_REG8(0x51b0), 0x38 }, { CCI_REG8(0x54b0), 0x38 },
> > +       { CCI_REG8(0x54b3), 0x0e }, { CCI_REG8(0x54b5), 0x04 },
> > +       { CCI_REG8(0x54b6), 0x00 }, { CCI_REG8(0x54b7), 0x00 },
> > +       { CCI_REG8(0x54b9), 0x70 }, { CCI_REG8(0x54bb), 0x10 },
> > +       { CCI_REG8(0x54bc), 0x00 }, { CCI_REG8(0x54bd), 0x00 },
> > +       { CCI_REG8(0x57b0), 0x38 }, { CCI_REG8(0x57b3), 0x0e },
> > +       { CCI_REG8(0x57b5), 0x04 }, { CCI_REG8(0x57b6), 0x00 },
> > +       { CCI_REG8(0x57b7), 0x00 }, { CCI_REG8(0x57b9), 0x70 },
> > +       { CCI_REG8(0x57bb), 0x10 }, { CCI_REG8(0x57bc), 0x00 },
> > +       { CCI_REG8(0x57bd), 0x00 }, { CCI_REG8(0x0305), 0x98 },
> > +       { CCI_REG8(0x0306), 0x04 }, { CCI_REG8(0x0307), 0x01 },
> > +       { CCI_REG8(0x4837), 0x1a }, { CCI_REG8(0x4888), 0x10 },
> > +       { CCI_REG8(0x4860), 0x00 }, { CCI_REG8(0x4850), 0x43 },
> > +       { CCI_REG8(0x480C), 0x92 }
> > +};
> > +
> > +/* 456MHz MIPI link frequency with 24MHz input clock. */
> > +static const struct cci_reg_sequence ov64a40_pll_config[] = {
> > +       { OV64A40_PLL1_PRE_DIV0, 0x88 },
> > +       { OV64A40_PLL1_PRE_DIV, 0x02 },
> > +       { OV64A40_PLL1_MULTIPLIER, 0x0098 },
> > +       { OV64A40_PLL1_M_DIV, 0x01 },
> > +       { OV64A40_PLL2_SEL_BAK_SA1, 0x00 },
> > +       { OV64A40_PLL2_PRE_DIV, 0x12 },
> > +       { OV64A40_PLL2_MULTIPLIER, 0x0190 },
> > +       { OV64A40_PLL2_PRE_DIV0, 0xd7 },
> > +       { OV64A40_PLL2_DIVSP, 0x00 },
> > +       { OV64A40_PLL2_DIVDAC, 0x00 },
> > +       { OV64A40_PLL2_DACPREDIV, 0x00 }
> > +};
> > +
> > +struct ov64a40_reglist {
> > +       unsigned int num_regs;
> > +       const struct cci_reg_sequence *regvals;
> > +};
> > +
> > +struct ov64a40_subsampling {
> > +       unsigned int x_odd_inc;
> > +       unsigned int x_even_inc;
> > +       unsigned int y_odd_inc;
> > +       unsigned int y_even_inc;
> > +       bool vbin;
> > +       bool hbin;
> > +};
> > +
> > +static struct ov64a40_mode {
> > +       unsigned int width;
> > +       unsigned int height;
> > +       struct ov64a40_timings {
> > +               unsigned int vts;
> > +               unsigned int ppl;
> > +       } timings_default[OV64A40_NUM_LINK_FREQ];
> > +       const struct ov64a40_reglist reglist;
> > +       struct v4l2_rect analogue_crop;
> > +       struct v4l2_rect digital_crop;
> > +       struct ov64a40_subsampling subsampling;
> > +} ov64a40_modes[] = {
> > +       /* Full resolution */
> > +       {
> > +               .width = 9248,
> > +               .height = 6944,
> > +               .timings_default = {
> > +                       /* 2.6 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 7072,
> > +                               .ppl = 4072,
> > +                       },
> > +                       /* 2 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 7072,
> > +                               .ppl = 5248,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_9248x6944),
> > +                       .regvals = ov64a40_9248x6944,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 0,
> > +                       .top = 0,
> > +                       .width = 9279,
> > +                       .height = 6975,
>
> As I just noted on our Github PR, odd numbers for width or height are
> unlikely to be correct as it shifts the image when flipped.

I'm not 100% sure why they would cause issues: (ana_crop.left +
ana_crop.width) is only used to compute X_END, which counts from 0, so
using 9279 counts 9280 pixels ?

>
> This came from the conversion of what were the start and end pixel
> values, so actually ov64a40_program_geometry wants to use
> anacrop->width + anacrop->left - 1
> and
> anacrop->height + anacrop->top - 1
> to get the same register values but with sane widths and heights.

Or this is only about having width/height even here compensate it by
subtracting -1 in ov64a40_program_geometry() ?
>
>   Dave
>
> > +               },
> > +               .digital_crop = {
> > +                       .left = 17,
> > +                       .top = 16,
> > +                       .width = 9248,
> > +                       .height = 6944,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 1,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 1,
> > +                       .y_even_inc = 1,
> > +                       .vbin = false,
> > +                       .hbin = false,
> > +               },
> > +       },
> > +       /* Analogue crop + digital crop */
> > +       {
> > +               .width = 8000,
> > +               .height = 6000,
> > +               .timings_default = {
> > +                       /* 3.0 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 6400,
> > +                               .ppl = 3848,
> > +                       },
> > +                       /* 2.5 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 6304,
> > +                               .ppl = 4736,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_8000x6000),
> > +                       .regvals = ov64a40_8000x6000,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 624,
> > +                       .top = 472,
> > +                       .width = 8047,
> > +                       .height = 6031,
> > +               },
> > +               .digital_crop = {
> > +                       .left = 17,
> > +                       .top = 16,
> > +                       .width = 8000,
> > +                       .height = 6000,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 1,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 1,
> > +                       .y_even_inc = 1,
> > +                       .vbin = false,
> > +                       .hbin = false,
> > +               },
> > +       },
> > +       /* 2x2 downscaled */
> > +       {
> > +               .width = 4624,
> > +               .height = 3472,
> > +               .timings_default = {
> > +                       /* 10 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 3533,
> > +                               .ppl = 2112,
> > +                       },
> > +                       /* 7 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 3939,
> > +                               .ppl = 2720,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_4624_3472),
> > +                       .regvals = ov64a40_4624_3472,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 0,
> > +                       .top = 0,
> > +                       .width = 9279,
> > +                       .height = 6975,
> > +               },
> > +               .digital_crop = {
> > +                       .left = 9,
> > +                       .top = 8,
> > +                       .width = 4624,
> > +                       .height = 3472,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 3,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 1,
> > +                       .y_even_inc = 1,
> > +                       .vbin = true,
> > +                       .hbin = false,
> > +               },
> > +       },
> > +       /* Analogue crop + 2x2 downscale + digital crop */
> > +       {
> > +               .width = 3840,
> > +               .height = 2160,
> > +               .timings_default = {
> > +                       /* 20 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 2218,
> > +                               .ppl = 1690,
> > +                       },
> > +                       /* 15 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 2270,
> > +                               .ppl = 2202,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_3840x2160),
> > +                       .regvals = ov64a40_3840x2160,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 784,
> > +                       .top = 1312,
> > +                       .width = 7711,
> > +                       .height = 4351,
> > +               },
> > +               .digital_crop = {
> > +                       .left = 9,
> > +                       .top = 8,
> > +                       .width = 3840,
> > +                       .height = 2160,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 3,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 1,
> > +                       .y_even_inc = 1,
> > +                       .vbin = true,
> > +                       .hbin = false,
> > +               },
> > +       },
> > +       /* 4x4 downscaled */
> > +       {
> > +               .width = 2312,
> > +               .height = 1736,
> > +               .timings_default = {
> > +                       /* 30 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 1998,
> > +                               .ppl = 1248,
> > +                       },
> > +                       /* 25 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 1994,
> > +                               .ppl = 1504,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_2312_1736),
> > +                       .regvals = ov64a40_2312_1736,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 0,
> > +                       .top = 0,
> > +                       .width = 9279,
> > +                       .height = 6975,
> > +               },
> > +               .digital_crop = {
> > +                       .left = 5,
> > +                       .top = 4,
> > +                       .width = 2312,
> > +                       .height = 1736,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 3,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 3,
> > +                       .y_even_inc = 1,
> > +                       .vbin = true,
> > +                       .hbin = true,
> > +               },
> > +       },
> > +       /* Analogue crop + 4x4 downscale + digital crop */
> > +       {
> > +               .width = 1920,
> > +               .height = 1080,
> > +               .timings_default = {
> > +                       /* 60 FPS */
> > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > +                               .vts = 1397,
> > +                               .ppl = 880,
> > +                       },
> > +                       /* 45 FPS */
> > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > +                               .vts = 1216,
> > +                               .ppl = 1360,
> > +                       },
> > +               },
> > +               .reglist = {
> > +                       .num_regs = ARRAY_SIZE(ov64a40_1920x1080),
> > +                       .regvals = ov64a40_1920x1080,
> > +               },
> > +               .analogue_crop = {
> > +                       .left = 784,
> > +                       .top = 1312,
> > +                       .width = 7711,
> > +                       .height = 4351,
> > +               },
> > +               .digital_crop = {
> > +                       .left = 7,
> > +                       .top = 6,
> > +                       .width = 1920,
> > +                       .height = 1080,
> > +               },
> > +               .subsampling = {
> > +                       .x_odd_inc = 3,
> > +                       .x_even_inc = 1,
> > +                       .y_odd_inc = 3,
> > +                       .y_even_inc = 1,
> > +                       .vbin = true,
> > +                       .hbin = true,
> > +               },
> > +       },
> > +};
> > +
> > +struct ov64a40 {
> > +       struct device *dev;
> > +
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +
> > +       struct regmap *cci;
> > +
> > +       struct ov64a40_mode *mode;
> > +
> > +       struct clk *xclk;
> > +
> > +       struct gpio_desc *reset_gpio;
> > +       struct regulator_bulk_data supplies[ARRAY_SIZE(ov64a40_supply_names)];
> > +
> > +       s64 *link_frequencies;
> > +       unsigned int num_link_frequencies;
> > +
> > +       struct v4l2_ctrl_handler ctrl_handler;
> > +       struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> > +       struct v4l2_ctrl *vflip;
> > +       struct v4l2_ctrl *hflip;
> > +};
> > +
> > +static inline struct ov64a40 *sd_to_ov64a40(struct v4l2_subdev *sd)
> > +{
> > +       return container_of_const(sd, struct ov64a40, sd);
> > +}
> > +
> > +static const struct ov64a40_timings *
> > +ov64a40_get_timings(struct ov64a40 *ov64a40, unsigned int link_freq_index)
> > +{
> > +       s64 link_freq = ov64a40->link_frequencies[link_freq_index];
> > +       unsigned int timings_index = link_freq == OV64A40_LINK_FREQ_360M
> > +                                  ? OV64A40_LINK_FREQ_360M_ID
> > +                                  : OV64A40_LINK_FREQ_456M_ID;
> > +
> > +       return &ov64a40->mode->timings_default[timings_index];
> > +}
> > +
> > +static int ov64a40_program_geometry(struct ov64a40 *ov64a40)
> > +{
> > +       struct ov64a40_mode *mode = ov64a40->mode;
> > +       struct v4l2_rect *anacrop = &mode->analogue_crop;
> > +       struct v4l2_rect *digicrop = &mode->digital_crop;
> > +       const struct ov64a40_timings *timings;
> > +       int ret = 0;
> > +
> > +       /* Analogue crop. */
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL0,
> > +                 anacrop->left, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL2,
> > +                 anacrop->top, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL4,
> > +                 anacrop->width + anacrop->left, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL6,
> > +                 anacrop->height + anacrop->top, &ret);
> > +
> > +       /* ISP windowing. */
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL10,
> > +                 digicrop->left, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL12,
> > +                 digicrop->top, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL8,
> > +                 digicrop->width, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLA,
> > +                 digicrop->height, &ret);
> > +
> > +       /* Total timings. */
> > +       timings = ov64a40_get_timings(ov64a40, ov64a40->link_freq->cur.val);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLC, timings->ppl, &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLE, timings->vts, &ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov64a40_program_subsampling(struct ov64a40 *ov64a40)
> > +{
> > +       struct ov64a40_subsampling *subsampling = &ov64a40->mode->subsampling;
> > +       int ret = 0;
> > +
> > +       /* Skipping configuration */
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL14,
> > +                 OV64A40_SKIPPING_CONFIG(subsampling->x_odd_inc,
> > +                                         subsampling->x_even_inc), &ret);
> > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL15,
> > +                 OV64A40_SKIPPING_CONFIG(subsampling->y_odd_inc,
> > +                                         subsampling->y_even_inc), &ret);
> > +
> > +       /* Binning configuration */
> > +       cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > +                       OV64A40_TIMING_CTRL_20_VBIN,
> > +                       subsampling->vbin ? OV64A40_TIMING_CTRL_20_VBIN : 0,
> > +                       &ret);
> > +       cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > +                       OV64A40_TIMING_CTRL_21_HBIN_CONF,
> > +                       subsampling->hbin ?
> > +                       OV64A40_TIMING_CTRL_21_HBIN_CONF : 0, &ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
> > +                                  struct v4l2_subdev_state *state)
> > +{
> > +       const struct ov64a40_reglist *reglist = &ov64a40->mode->reglist;
> > +       const struct ov64a40_timings *timings;
> > +       unsigned long delay;
> > +       int ret;
> > +
> > +       ret = pm_runtime_resume_and_get(ov64a40->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret = cci_multi_reg_write(ov64a40->cci, ov64a40_init,
> > +                                 ARRAY_SIZE(ov64a40_init), NULL);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = cci_multi_reg_write(ov64a40->cci, reglist->regvals,
> > +                                 reglist->num_regs, NULL);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = ov64a40_program_geometry(ov64a40);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = ov64a40_program_subsampling(ov64a40);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret =  __v4l2_ctrl_handler_setup(&ov64a40->ctrl_handler);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       ret = cci_write(ov64a40->cci, OV64A40_REG_SMIA,
> > +                       OV64A40_REG_SMIA_STREAMING, NULL);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       /* Link frequency and flips cannot change while streaming. */
> > +       __v4l2_ctrl_grab(ov64a40->link_freq, true);
> > +       __v4l2_ctrl_grab(ov64a40->vflip, true);
> > +       __v4l2_ctrl_grab(ov64a40->hflip, true);
> > +
> > +       /* delay: max(4096 xclk pulses, 150usec) + exposure time */
> > +       timings = ov64a40_get_timings(ov64a40, ov64a40->link_freq->cur.val);
> > +       delay = DIV_ROUND_UP(4096, OV64A40_XCLK_FREQ / 1000 / 1000);
> > +       delay = max(delay, 150ul);
> > +
> > +       /* The sensor has an internal x4 multiplier on the line length. */
> > +       delay += DIV_ROUND_UP(timings->ppl * 4 * ov64a40->exposure->cur.val,
> > +                             OV64A40_PIXEL_RATE / 1000 / 1000);
> > +       fsleep(delay);
> > +
> > +       return 0;
> > +
> > +error_power_off:
> > +       pm_runtime_mark_last_busy(ov64a40->dev);
> > +       pm_runtime_put_autosuspend(ov64a40->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov64a40_stop_streaming(struct ov64a40 *ov64a40,
> > +                                 struct v4l2_subdev_state *state)
> > +{
> > +       cci_update_bits(ov64a40->cci, OV64A40_REG_SMIA, BIT(0), 0, NULL);
> > +       pm_runtime_mark_last_busy(ov64a40->dev);
> > +       pm_runtime_put_autosuspend(ov64a40->dev);
> > +
> > +       __v4l2_ctrl_grab(ov64a40->link_freq, false);
> > +       __v4l2_ctrl_grab(ov64a40->vflip, false);
> > +       __v4l2_ctrl_grab(ov64a40->hflip, false);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +       struct v4l2_subdev_state *state;
> > +       int ret;
> > +
> > +       state = v4l2_subdev_lock_and_get_active_state(sd);
> > +       if (enable)
> > +               ret = ov64a40_start_streaming(ov64a40, state);
> > +       else
> > +               ret = ov64a40_stop_streaming(ov64a40, state);
> > +       v4l2_subdev_unlock_state(state);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov64a40_video_ops = {
> > +       .s_stream = ov64a40_set_stream,
> > +};
> > +
> > +static u32 ov64a40_mbus_code(struct ov64a40 *ov64a40)
> > +{
> > +       unsigned int index = ov64a40->hflip->val << 1 | ov64a40->vflip->val;
> > +
> > +       return ov64a40_mbus_codes[index];
> > +}
> > +
> > +static void ov64a40_update_pad_fmt(struct ov64a40 *ov64a40,
> > +                                  struct ov64a40_mode *mode,
> > +                                  struct v4l2_mbus_framefmt *fmt)
> > +{
> > +       fmt->code = ov64a40_mbus_code(ov64a40);
> > +       fmt->width = mode->width;
> > +       fmt->height = mode->height;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +}
> > +
> > +static int ov64a40_init_cfg(struct v4l2_subdev *sd,
> > +                           struct v4l2_subdev_state *state)
> > +{
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +       struct v4l2_rect *crop;
> > +
> > +       format = v4l2_subdev_state_get_format(state, 0);
> > +       ov64a40_update_pad_fmt(ov64a40, &ov64a40_modes[0], format);
> > +
> > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > +       crop->top = OV64A40_PIXEL_ARRAY_TOP;
> > +       crop->left = OV64A40_PIXEL_ARRAY_LEFT;
> > +       crop->width = OV64A40_PIXEL_ARRAY_WIDTH;
> > +       crop->height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *state,
> > +                                 struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +
> > +       if (code->index)
> > +               return -EINVAL;
> > +
> > +       code->code = ov64a40_mbus_code(ov64a40);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_enum_frame_size(struct v4l2_subdev *sd,
> > +                                  struct v4l2_subdev_state *state,
> > +                                  struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +       struct ov64a40_mode *mode;
> > +       u32 code;
> > +
> > +       if (fse->index >= ARRAY_SIZE(ov64a40_modes))
> > +               return -EINVAL;
> > +
> > +       code = ov64a40_mbus_code(ov64a40);
> > +       if (fse->code != code)
> > +               return -EINVAL;
> > +
> > +       mode = &ov64a40_modes[fse->index];
> > +       fse->min_width = mode->width;
> > +       fse->max_width = mode->width;
> > +       fse->min_height = mode->height;
> > +       fse->max_height = mode->height;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_get_selection(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state,
> > +                                struct v4l2_subdev_selection *sel)
> > +{
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +               sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > +
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +               sel->r.top = 0;
> > +               sel->r.left = 0;
> > +               sel->r.width = OV64A40_NATIVE_WIDTH;
> > +               sel->r.height = OV64A40_NATIVE_HEIGHT;
> > +
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +               sel->r.top = OV64A40_PIXEL_ARRAY_TOP;
> > +               sel->r.left = OV64A40_PIXEL_ARRAY_LEFT;
> > +               sel->r.width = OV64A40_PIXEL_ARRAY_WIDTH;
> > +               sel->r.height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > +
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int ov64a40_set_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state,
> > +                             struct v4l2_subdev_format *fmt)
> > +{
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +       struct ov64a40_mode *mode;
> > +
> > +       mode = v4l2_find_nearest_size(ov64a40_modes,
> > +                                     ARRAY_SIZE(ov64a40_modes),
> > +                                     width, height,
> > +                                     fmt->format.width, fmt->format.height);
> > +
> > +       ov64a40_update_pad_fmt(ov64a40, mode, &fmt->format);
> > +
> > +       format = v4l2_subdev_state_get_format(state, 0);
> > +       if (ov64a40->mode == mode && format->code == fmt->format.code)
> > +               return 0;
> > +
> > +       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +               const struct ov64a40_timings *timings;
> > +               int vblank_max, vblank_def;
> > +               int hblank_val;
> > +               int exp_max;
> > +
> > +               ov64a40->mode = mode;
> > +               *v4l2_subdev_state_get_crop(state, 0) = mode->analogue_crop;
> > +
> > +               /* Update control limits according to the new mode. */
> > +               timings = ov64a40_get_timings(ov64a40,
> > +                                             ov64a40->link_freq->cur.val);
> > +               vblank_max = OV64A40_VTS_MAX - mode->height;
> > +               vblank_def = timings->vts - mode->height;
> > +               __v4l2_ctrl_modify_range(ov64a40->vblank, OV64A40_VBLANK_MIN,
> > +                                        vblank_max, 1, vblank_def);
> > +               __v4l2_ctrl_s_ctrl(ov64a40->vblank, vblank_def);
> > +
> > +               exp_max = timings->vts - OV64A40_EXPOSURE_MARGIN;
> > +               __v4l2_ctrl_modify_range(ov64a40->exposure,
> > +                                        OV64A40_EXPOSURE_MIN, exp_max,
> > +                                        1, OV64A40_EXPOSURE_MIN);
> > +
> > +               hblank_val = timings->ppl * 4 - mode->width;
> > +               __v4l2_ctrl_modify_range(ov64a40->hblank,
> > +                                        hblank_val, hblank_val, 1, hblank_val);
> > +       }
> > +
> > +       *format = fmt->format;
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> > +       .init_cfg = ov64a40_init_cfg,
> > +       .enum_mbus_code = ov64a40_enum_mbus_code,
> > +       .enum_frame_size = ov64a40_enum_frame_size,
> > +       .get_fmt = v4l2_subdev_get_fmt,
> > +       .set_fmt = ov64a40_set_format,
> > +       .get_selection = ov64a40_get_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops ov64a40_core_ops = {
> > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov64a40_subdev_ops = {
> > +       .core = &ov64a40_core_ops,
> > +       .video = &ov64a40_video_ops,
> > +       .pad = &ov64a40_pad_ops,
> > +};
> > +
> > +static int ov64a40_power_on(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +       int ret;
> > +
> > +       ret = clk_prepare_enable(ov64a40->xclk);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = regulator_bulk_enable(ARRAY_SIZE(ov64a40_supply_names),
> > +                                   ov64a40->supplies);
> > +       if (ret) {
> > +               clk_disable_unprepare(ov64a40->xclk);
> > +               dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(ov64a40->reset_gpio, 0);
> > +
> > +       fsleep(5000);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_power_off(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > +
> > +       gpiod_set_value_cansleep(ov64a40->reset_gpio, 1);
> > +       regulator_bulk_disable(ARRAY_SIZE(ov64a40_supply_names),
> > +                              ov64a40->supplies);
> > +       clk_disable_unprepare(ov64a40->xclk);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_link_freq_config(struct ov64a40 *ov64a40, int link_freq_id)
> > +{
> > +       s64 link_frequency;
> > +       int ret = 0;
> > +
> > +       /* Default 456MHz with 24MHz input clock. */
> > +       cci_multi_reg_write(ov64a40->cci, ov64a40_pll_config,
> > +                           ARRAY_SIZE(ov64a40_pll_config), &ret);
> > +
> > +       /* Decrease the PLL1 multiplier to obtain 360MHz mipi link frequency. */
> > +       link_frequency = ov64a40->link_frequencies[link_freq_id];
> > +       if (link_frequency == OV64A40_LINK_FREQ_360M)
> > +               cci_write(ov64a40->cci, OV64A40_PLL1_MULTIPLIER, 0x0078, &ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct ov64a40 *ov64a40 = container_of(ctrl->handler, struct ov64a40,
> > +                                              ctrl_handler);
> > +       int pm_status;
> > +       int ret = 0;
> > +
> > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > +               int exp_max = ov64a40->mode->height + ctrl->val
> > +                           - OV64A40_EXPOSURE_MARGIN;
> > +               int exp_val = min(ov64a40->exposure->cur.val, exp_max);
> > +
> > +               __v4l2_ctrl_modify_range(ov64a40->exposure,
> > +                                        ov64a40->exposure->minimum,
> > +                                        exp_max, 1, exp_val);
> > +       }
> > +
> > +       pm_status = pm_runtime_get_if_active(ov64a40->dev, true);
> > +       if (!pm_status)
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE:
> > +               ret = cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_EXPO,
> > +                               ctrl->val, NULL);
> > +               break;
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret = cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_GAIN,
> > +                               ctrl->val << 1, NULL);
> > +               break;
> > +       case V4L2_CID_VBLANK: {
> > +               int vts = ctrl->val + ov64a40->mode->height;
> > +
> > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_LOW, vts, &ret);
> > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_MID,
> > +                         (vts >> 8), &ret);
> > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_HIGH,
> > +                         (vts >> 16), &ret);
> > +               break;
> > +       }
> > +       case V4L2_CID_VFLIP:
> > +               ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > +                                     OV64A40_TIMING_CTRL_20_VFLIP,
> > +                                     ctrl->val << 2,
> > +                                     NULL);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +               ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > +                                     OV64A40_TIMING_CTRL_21_HFLIP,
> > +                                     ctrl->val ? 0
> > +                                               : OV64A40_TIMING_CTRL_21_HFLIP,
> > +                                     NULL);
> > +               break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               ret = cci_write(ov64a40->cci, OV64A40_REG_TEST_PATTERN,
> > +                               ov64a40_test_pattern_val[ctrl->val], NULL);
> > +               break;
> > +       case V4L2_CID_LINK_FREQ:
> > +               ret = ov64a40_link_freq_config(ov64a40, ctrl->val);
> > +               break;
> > +       default:
> > +               dev_err(ov64a40->dev, "Unhandled control: %#x\n", ctrl->id);
> > +               ret = -EINVAL;
> > +               break;
> > +       }
> > +
> > +       if (pm_status > 0) {
> > +               pm_runtime_mark_last_busy(ov64a40->dev);
> > +               pm_runtime_put_autosuspend(ov64a40->dev);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ov64a40_ctrl_ops = {
> > +       .s_ctrl = ov64a40_set_ctrl,
> > +};
> > +
> > +static int ov64a40_init_controls(struct ov64a40 *ov64a40)
> > +{
> > +       int exp_max, hblank_val, vblank_max, vblank_def;
> > +       struct v4l2_ctrl_handler *hdlr = &ov64a40->ctrl_handler;
> > +       struct v4l2_fwnode_device_properties props;
> > +       const struct ov64a40_timings *timings;
> > +       int ret;
> > +
> > +       ret = v4l2_ctrl_handler_init(hdlr, 11);
> > +       if (ret)
> > +               return ret;
> > +
> > +       v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > +                         OV64A40_PIXEL_RATE, OV64A40_PIXEL_RATE,  1,
> > +                         OV64A40_PIXEL_RATE);
> > +
> > +       ov64a40->link_freq =
> > +               v4l2_ctrl_new_int_menu(hdlr, &ov64a40_ctrl_ops,
> > +                                      V4L2_CID_LINK_FREQ,
> > +                                      ov64a40->num_link_frequencies - 1,
> > +                                      0, ov64a40->link_frequencies);
> > +
> > +       v4l2_ctrl_new_std_menu_items(hdlr, &ov64a40_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(ov64a40_test_pattern_menu) - 1,
> > +                                    0, 0, ov64a40_test_pattern_menu);
> > +
> > +       timings = ov64a40_get_timings(ov64a40, 0);
> > +       exp_max = timings->vts - OV64A40_EXPOSURE_MARGIN;
> > +       ov64a40->exposure = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +                                             V4L2_CID_EXPOSURE,
> > +                                             OV64A40_EXPOSURE_MIN, exp_max, 1,
> > +                                             OV64A40_EXPOSURE_MIN);
> > +
> > +       hblank_val = timings->ppl * 4 - ov64a40->mode->width;
> > +       ov64a40->hblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +                                           V4L2_CID_HBLANK, hblank_val,
> > +                                           hblank_val, 1, hblank_val);
> > +       if (ov64a40->hblank)
> > +               ov64a40->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       vblank_def = timings->vts - ov64a40->mode->height;
> > +       vblank_max = OV64A40_VTS_MAX - ov64a40->mode->height;
> > +       ov64a40->vblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +                                           V4L2_CID_VBLANK, OV64A40_VBLANK_MIN,
> > +                                           vblank_max, 1, vblank_def);
> > +
> > +       v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> > +                         OV64A40_ANA_GAIN_MIN, OV64A40_ANA_GAIN_MAX, 1,
> > +                         OV64A40_ANA_GAIN_DEFAULT);
> > +
> > +       ov64a40->hflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +                                          V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +       if (ov64a40->hflip)
> > +               ov64a40->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       ov64a40->vflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > +                                          V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +       if (ov64a40->vflip)
> > +               ov64a40->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +       if (hdlr->error) {
> > +               ret = hdlr->error;
> > +               dev_err(ov64a40->dev, "control init failed: %d\n", ret);
> > +               goto error_free_hdlr;
> > +       }
> > +
> > +       ret = v4l2_fwnode_device_parse(ov64a40->dev, &props);
> > +       if (ret)
> > +               goto error_free_hdlr;
> > +
> > +       ret = v4l2_ctrl_new_fwnode_properties(hdlr, &ov64a40_ctrl_ops,
> > +                                             &props);
> > +       if (ret)
> > +               goto error_free_hdlr;
> > +
> > +       ov64a40->sd.ctrl_handler = hdlr;
> > +
> > +       return 0;
> > +
> > +error_free_hdlr:
> > +       v4l2_ctrl_handler_free(hdlr);
> > +       return ret;
> > +}
> > +
> > +static int ov64a40_identify(struct ov64a40 *ov64a40)
> > +{
> > +       int ret;
> > +       u64 id;
> > +
> > +       ret = cci_read(ov64a40->cci, OV64A40_REG_CHIP_ID, &id, NULL);
> > +       if (ret) {
> > +               dev_err(ov64a40->dev, "Failed to read chip id: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       if (id != OV64A40_CHIP_ID) {
> > +               dev_err(ov64a40->dev, "chip id mismatch: %#llx\n", id);
> > +               return -ENODEV;
> > +       }
> > +
> > +       dev_dbg(ov64a40->dev, "OV64A40 chip identified: %#llx\n", id);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_parse_dt(struct ov64a40 *ov64a40)
> > +{
> > +       struct v4l2_fwnode_endpoint v4l2_fwnode = {
> > +               .bus_type = V4L2_MBUS_CSI2_DPHY
> > +       };
> > +       struct fwnode_handle *endpoint;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(ov64a40->dev),
> > +                                                 NULL);
> > +       if (!endpoint) {
> > +               dev_err(ov64a40->dev, "Failed to find endpoint\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &v4l2_fwnode);
> > +       fwnode_handle_put(endpoint);
> > +       if (ret) {
> > +               dev_err(ov64a40->dev, "Failed to parse endpoint\n");
> > +               return ret;
> > +       }
> > +
> > +       if (v4l2_fwnode.bus.mipi_csi2.num_data_lanes != 2) {
> > +               dev_err(ov64a40->dev, "Unsupported number of data lanes: %u\n",
> > +                       v4l2_fwnode.bus.mipi_csi2.num_data_lanes);
> > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!v4l2_fwnode.nr_of_link_frequencies) {
> > +               dev_warn(ov64a40->dev, "no link frequencies defined\n");
> > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (v4l2_fwnode.nr_of_link_frequencies > 2) {
> > +               dev_warn(ov64a40->dev,
> > +                        "Unsupported number of link frequencies\n");
> > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ov64a40->link_frequencies =
> > +               devm_kcalloc(ov64a40->dev, v4l2_fwnode.nr_of_link_frequencies,
> > +                            sizeof(v4l2_fwnode.link_frequencies[0]),
> > +                            GFP_KERNEL);
> > +       if (!ov64a40->link_frequencies)  {
> > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +               return -ENOMEM;
> > +       }
> > +       ov64a40->num_link_frequencies = v4l2_fwnode.nr_of_link_frequencies;
> > +
> > +       for (i = 0; i < v4l2_fwnode.nr_of_link_frequencies; ++i) {
> > +               if (v4l2_fwnode.link_frequencies[i] != OV64A40_LINK_FREQ_360M &&
> > +                   v4l2_fwnode.link_frequencies[i] != OV64A40_LINK_FREQ_456M) {
> > +                       dev_err(ov64a40->dev,
> > +                               "Unsupported link frequency %lld\n",
> > +                               v4l2_fwnode.link_frequencies[i]);
> > +                       v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +                       return -EINVAL;
> > +               }
> > +
> > +               ov64a40->link_frequencies[i] = v4l2_fwnode.link_frequencies[i];
> > +       }
> > +
> > +       v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov64a40_get_regulators(struct ov64a40 *ov64a40)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov64a40->sd);
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(ov64a40_supply_names); i++)
> > +               ov64a40->supplies[i].supply = ov64a40_supply_names[i];
> > +
> > +       return devm_regulator_bulk_get(&client->dev,
> > +                                      ARRAY_SIZE(ov64a40_supply_names),
> > +                                      ov64a40->supplies);
> > +}
> > +
> > +static int ov64a40_probe(struct i2c_client *client)
> > +{
> > +       struct ov64a40 *ov64a40;
> > +       u32 xclk_freq;
> > +       int ret;
> > +
> > +       ov64a40 = devm_kzalloc(&client->dev, sizeof(*ov64a40), GFP_KERNEL);
> > +       if (!ov64a40)
> > +               return -ENOMEM;
> > +
> > +       ov64a40->dev = &client->dev;
> > +       v4l2_i2c_subdev_init(&ov64a40->sd, client, &ov64a40_subdev_ops);
> > +
> > +       ov64a40->cci = devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(ov64a40->cci)) {
> > +               dev_err(&client->dev, "Failed to initialize CCI\n");
> > +               return PTR_ERR(ov64a40->cci);
> > +       }
> > +
> > +       ov64a40->xclk = devm_clk_get(&client->dev, NULL);
> > +       if (IS_ERR(ov64a40->xclk))
> > +               return dev_err_probe(&client->dev, PTR_ERR(ov64a40->xclk),
> > +                                    "Failed to get clock\n");
> > +
> > +       xclk_freq = clk_get_rate(ov64a40->xclk);
> > +       if (xclk_freq != OV64A40_XCLK_FREQ) {
> > +               dev_err(&client->dev, "Unsupported xclk frequency %u\n",
> > +                       xclk_freq);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = ov64a40_get_regulators(ov64a40);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ov64a40->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > +                                                     GPIOD_OUT_LOW);
> > +       if (IS_ERR(ov64a40->reset_gpio))
> > +               return dev_err_probe(&client->dev, PTR_ERR(ov64a40->reset_gpio),
> > +                                    "Failed to get reset gpio\n");
> > +
> > +       ret = ov64a40_parse_dt(ov64a40);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = ov64a40_power_on(&client->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = ov64a40_identify(ov64a40);
> > +       if (ret)
> > +               goto error_poweroff;
> > +
> > +       ov64a40->mode = &ov64a40_modes[0];
> > +
> > +       pm_runtime_set_active(&client->dev);
> > +       pm_runtime_get_noresume(&client->dev);
> > +       pm_runtime_enable(&client->dev);
> > +       pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +       pm_runtime_use_autosuspend(&client->dev);
> > +
> > +       ret = ov64a40_init_controls(ov64a40);
> > +       if (ret)
> > +               goto error_poweroff;
> > +
> > +       /* Initialize subdev */
> > +       ov64a40->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE
> > +                         | V4L2_SUBDEV_FL_HAS_EVENTS;
> > +       ov64a40->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       ov64a40->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +       ret = media_entity_pads_init(&ov64a40->sd.entity, 1, &ov64a40->pad);
> > +       if (ret) {
> > +               dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
> > +               goto error_handler_free;
> > +       }
> > +
> > +       ov64a40->sd.state_lock = ov64a40->ctrl_handler.lock;
> > +       ret = v4l2_subdev_init_finalize(&ov64a40->sd);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "subdev init error: %d\n", ret);
> > +               goto error_media_entity;
> > +       }
> > +
> > +       ret = v4l2_async_register_subdev_sensor(&ov64a40->sd);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev,
> > +                       "failed to register sensor sub-device: %d\n", ret);
> > +               goto error_subdev_cleanup;
> > +       }
> > +
> > +       pm_runtime_mark_last_busy(&client->dev);
> > +       pm_runtime_put_autosuspend(&client->dev);
> > +
> > +       return 0;
> > +
> > +error_subdev_cleanup:
> > +       v4l2_subdev_cleanup(&ov64a40->sd);
> > +error_media_entity:
> > +       media_entity_cleanup(&ov64a40->sd.entity);
> > +error_handler_free:
> > +       v4l2_ctrl_handler_free(ov64a40->sd.ctrl_handler);
> > +error_poweroff:
> > +       ov64a40_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static void ov64a40_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_subdev_cleanup(sd);
> > +       media_entity_cleanup(&sd->entity);
> > +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               ov64a40_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct of_device_id ov64a40_of_ids[] = {
> > +       { .compatible = "ovti,ov64a40" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov64a40_of_ids);
> > +
> > +static const struct dev_pm_ops ov64a40_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(ov64a40_power_off, ov64a40_power_on, NULL)
> > +};
> > +
> > +static struct i2c_driver ov64a40_i2c_driver = {
> > +       .driver = {
> > +               .name = "ov64a40",
> > +               .of_match_table = ov64a40_of_ids,
> > +               .pm = &ov64a40_pm_ops,
> > +       },
> > +       .probe  = ov64a40_probe,
> > +       .remove = ov64a40_remove,
> > +};
> > +
> > +module_i2c_driver(ov64a40_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
> > +MODULE_DESCRIPTION("OmniVision OV64A40 sensor driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.41.0
> >

