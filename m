Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6E57C5A35
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 19:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjJKR1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 13:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjJKR1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 13:27:09 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9401998;
        Wed, 11 Oct 2023 10:27:03 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39BGOSDX011115;
        Wed, 11 Oct 2023 19:26:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=rJrnzIK/vtVu3pBb3q//v
        1P/xED6/bzHDwv889QbyUU=; b=ikuaSzFsEFxCB2lyvrc0dG9H976LH83/BQKmd
        Fz+b6ZNUeEtE8P7MnELIvRmYoOWL3WvvVgml7wurPiMSQKS7/IEnaVD7S989eIfB
        LhwUNFdtMKCF3s0z3ECc5YUTb9yI/+t3byS0LnYs47m1B1ouRvuza/ZGkc+VZ0a8
        SUdntrXoNDyD7SD7Tk/SiTq7OJDNAXcEtjmvuU4PNpw0q9+VeJFHsb0gAN7oJqqO
        rNP1DOONXw/XvtCuJen6+SC+d9mAOfnFV9Od/Dk2vO1bVSi2uuAWmEKq+95TfbjU
        BHvPNvS07aMquV2sWSy/F4bIsuBLDbT6rJIDnsIe1hR0TsCpw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tnp24k13f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 19:26:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7756100057;
        Wed, 11 Oct 2023 19:26:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB9F220C900;
        Wed, 11 Oct 2023 19:26:47 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 19:26:44 +0200
Date:   Wed, 11 Oct 2023 19:26:39 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: gc2145: Galaxy Core GC2145 sensor support
Message-ID: <20231011172639.GA1737227@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230926092825.819229-1-alain.volmat@foss.st.com>
 <20230926092825.819229-3-alain.volmat@foss.st.com>
 <c2jflrljuoiudmqqjzthumwxf3fpeepr2zh4alvunoyo4hmfn2@eapdhi43qilj>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2jflrljuoiudmqqjzthumwxf3fpeepr2zh4alvunoyo4hmfn2@eapdhi43qilj>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

thanks for the review.  I comment / confirm few points prior to sending
the v2 of this serie.

On Wed, Sep 27, 2023 at 03:54:09PM +0200, Jacopo Mondi wrote:
> Hi Alain
> 
> On Tue, Sep 26, 2023 at 11:28:20AM +0200, Alain Volmat wrote:
> > Addition of support for the Galaxy Core GC2145 XVGA sensor.
> > The sensor supports both DVP and CSI-2 interfaces however for
> > the time being only CSI-2 is implemented.
> >
> > Configurations is currently based on initialization scripts
> > coming from Galaxy Core and for that purpose only 3 static
> > resolutions are supported with static framerates.
> >  - 640x480 (30fps)
> >  - 1280x720 (30fps)
> >  - 1600x1200 (20fps)
> >
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  MAINTAINERS                |    8 +
> >  drivers/media/i2c/Kconfig  |   12 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/gc2145.c | 1591 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1612 insertions(+)
> >  create mode 100644 drivers/media/i2c/gc2145.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90f13281d297..c595335812c7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8600,6 +8600,14 @@ F:	kernel/futex/*
> >  F:	tools/perf/bench/futex*
> >  F:	tools/testing/selftests/futex/
> >
> > +GALAXYCORE GC2145 SENSOR DRIVER
> > +M:	Alain Volmat <alain.volmat@foss.st.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> > +F:	drivers/media/i2c/gc2145.c
> > +
> >  GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
> >  M:	Tim Harvey <tharvey@gateworks.com>
> >  S:	Maintained
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 74ff833ff48c..78e5c8cbf916 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -50,6 +50,18 @@ config VIDEO_AR0521
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called ar0521.
> >
> > +config VIDEO_GC2145
> > +	tristate "GalaxyCore GC2145 sensor support"
> > +	depends on I2C && VIDEO_DEV
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> 
> The top-level menu already:
> 
> 	select V4L2_FWNODE
> 	select VIDEO_V4L2_SUBDEV_API
> 
> you can drop these two.

Ok done

> 
> > +	help
> > +	  This is a V4L2 sensor-level driver for GalaxyCore GC2145
> > +	  2 Mpixel camera.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called gc2145.
> > +
> >  config VIDEO_HI556
> >  	tristate "Hynix Hi-556 sensor support"
> >  	help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 80b00d39b48f..e74eded89428 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -36,6 +36,7 @@ obj-$(CONFIG_VIDEO_DW9719) += dw9719.o
> >  obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
> >  obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
> >  obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
> > +obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
> >  obj-$(CONFIG_VIDEO_HI556) += hi556.o
> >  obj-$(CONFIG_VIDEO_HI846) += hi846.o
> >  obj-$(CONFIG_VIDEO_HI847) += hi847.o
> > diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
> > new file mode 100644
> > index 000000000000..d0b065011732
> > --- /dev/null
> > +++ b/drivers/media/i2c/gc2145.c
> > @@ -0,0 +1,1591 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * A V4L2 driver for Galaxycore GC2145 camera.
> > + * Copyright (C) 2022, STMicroelectronics SA
> 
> 2023 ?
> 
> > + *
> > + * Inspired from the imx219.c driver
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/units.h>
> 
> I would have added an empy line here. Up to you

Yep, done.

> 
> > +#include <media/mipi-csi2.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/* Chip ID */
> > +#define GC2145_CHIP_ID		0x2145
> > +
> > +/* Page 0 */
> > +#define GC2145_REG_HBLANK_HIGH	0x05
> > +#define GC2145_REG_HBLANK_LOW	0x06
> > +#define GC2145_REG_VBLANK_HIGH	0x07
> > +#define GC2145_REG_VBLANK_LOW	0x08
> > +#define GC2145_REG_ROW_START_HIGH	0x09
> > +#define GC2145_REG_ROW_START_LOW	0x0a
> > +#define GC2145_REG_COL_START_HIGH	0x0b
> > +#define GC2145_REG_COL_START_LOW	0x0c
> > +#define GC2145_REG_WIN_HEIGHT_HIGH	0x0d
> > +#define GC2145_REG_WIN_HEIGHT_LOW	0x0e
> > +#define GC2145_REG_WIN_WIDTH_HIGH	0x0f
> > +#define GC2145_REG_WIN_WIDTH_LOW	0x10
> > +#define GC2145_REG_ANALOG_MODE1	0x17
> > +#define GC2145_REG_OUTPUT_FMT	0x84
> > +#define GC2145_REG_SYNC_MODE	0x86
> > +#define GC2145_SYNC_MODE_COL_SWITCH	BIT(4)
> > +#define GC2145_SYNC_MODE_ROW_SWITCH	BIT(5)
> > +#define GC2145_REG_DEBUG_MODE2	0x8c
> > +#define GC2145_REG_DEBUG_MODE3	0x8d
> > +#define GC2145_REG_CROP_ENABLE	0x90
> > +#define GC2145_REG_CROP_Y_HIGH	0x91
> > +#define GC2145_REG_CROP_Y_LOW	0x92
> > +#define GC2145_REG_CROP_X_HIGH	0x93
> > +#define GC2145_REG_CROP_X_LOW	0x94
> > +#define GC2145_REG_CROP_HEIGHT_HIGH	0x95
> > +#define GC2145_REG_CROP_HEIGHT_LOW	0x96
> > +#define GC2145_REG_CROP_WIDTH_HIGH	0x97
> > +#define GC2145_REG_CROP_WIDTH_LOW	0x98
> > +#define GC2145_REG_CHIP_ID	0xf0
> > +#define GC2145_REG_PAD_IO	0xf2
> > +#define GC2145_REG_PAGE_SELECT	0xfe
> > +/* Page 3 */
> > +#define GC2145_REG_FIFO_FULL_LVL_LOW	0x04
> > +#define GC2145_REG_FIFO_FULL_LVL_HIGH	0x05
> > +#define GC2145_REG_MIPI_DT	0x11
> > +#define GC2145_REG_LWC_LOW	0x12
> > +#define GC2145_REG_LWC_HIGH	0x13
> > +#define GC2145_REG_FIFO_GATE_MODE	0x17
> > +
> > +/* External clock frequency is 24.0MHz */
> > +#define GC2145_XCLK_FREQ	(24 * HZ_PER_MHZ)
> > +
> > +#define GC2145_NATIVE_WIDTH	1616U
> > +#define GC2145_NATIVE_HEIGHT	1232U
> > +
> > +struct gc2145_reg {
> > +	unsigned char address;
> > +	unsigned char val;
> > +};
> > +
> > +struct gc2145_reg_list {
> > +	unsigned int num_of_regs;
> > +	const struct gc2145_reg *regs;
> > +};
> > +
> > +/**
> > + * struct gc2145_mode - GC2145 mode description
> > + * @width: frame width (in pixel)
> > + * @height: frame height (in pixel)
> > + * @frame_interval: interval (fractionnal) between 2 frames
> > + * @reg_list: registers config sequence to enter into the mode
> > + * @pixel_rate: pixel_rate associated with the mode
> > + * @crop: window area captured
> > + * @hblank: horizontal blanking setting of this mode
> > + */
> > +struct gc2145_mode {
> > +	unsigned int width;
> > +	unsigned int height;
> > +	struct v4l2_fract frame_interval;
> > +	struct gc2145_reg_list reg_list;
> > +	unsigned long pixel_rate;
> > +	struct v4l2_rect crop;
> > +	u32 hblank;
> > +};
> > +
> > +static const struct gc2145_reg common_regs[] = {
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	/* SH Delay */
> > +	{0x12, 0x2e},
> > +	/* Flip */
> > +	{GC2145_REG_ANALOG_MODE1, 0x14},
> > +	/* Analog Conf */
> > +	{0x18, 0x22}, {0x19, 0x0e}, {0x1a, 0x01}, {0x1b, 0x4b},
> > +	{0x1c, 0x07}, {0x1d, 0x10}, {0x1e, 0x88}, {0x1f, 0x78},
> > +	{0x20, 0x03}, {0x21, 0x40}, {0x22, 0xa0}, {0x24, 0x16},
> > +	{0x25, 0x01}, {0x26, 0x10}, {0x2d, 0x60}, {0x30, 0x01},
> > +	{0x31, 0x90}, {0x33, 0x06}, {0x34, 0x01},
> > +	{0x80, 0x7f}, {0x81, 0x26}, {0x82, 0xfa}, {0x83, 0x00},
> > +	{0x84, 0x02}, {0x86, 0x02}, {0x88, 0x03}, {0x89, 0x03},
> > +	{0x85, 0x08}, {0x8a, 0x00}, {0x8b, 0x00}, {0xb0, 0x55},
> > +	{0xc3, 0x00}, {0xc4, 0x80}, {0xc5, 0x90}, {0xc6, 0x3b},
> > +	{0xc7, 0x46},
> > +	/* BLK */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{0x40, 0x42}, {0x41, 0x00}, {0x43, 0x5b}, {0x5e, 0x00},
> > +	{0x5f, 0x00}, {0x60, 0x00}, {0x61, 0x00}, {0x62, 0x00},
> > +	{0x63, 0x00}, {0x64, 0x00}, {0x65, 0x00}, {0x66, 0x20},
> > +	{0x67, 0x20}, {0x68, 0x20}, {0x69, 0x20}, {0x76, 0x00},
> > +	{0x6a, 0x08}, {0x6b, 0x08}, {0x6c, 0x08}, {0x6d, 0x08},
> > +	{0x6e, 0x08}, {0x6f, 0x08}, {0x70, 0x08}, {0x71, 0x08},
> > +	{0x76, 0x00}, {0x72, 0xf0}, {0x7e, 0x3c}, {0x7f, 0x00},
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x48, 0x15}, {0x49, 0x00}, {0x4b, 0x0b},
> > +	/* AEC */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{0x03, 0x04}, {0x04, 0xe2},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x01, 0x04}, {0x02, 0xc0}, {0x03, 0x04}, {0x04, 0x90},
> > +	{0x05, 0x30}, {0x06, 0x90}, {0x07, 0x30}, {0x08, 0x80},
> > +	{0x09, 0x00}, {0x0a, 0x82}, {0x0b, 0x11}, {0x0c, 0x10},
> > +	{0x11, 0x10}, {0x13, 0x7b}, {0x17, 0x00}, {0x1c, 0x11},
> > +	{0x1e, 0x61}, {0x1f, 0x35}, {0x20, 0x40}, {0x22, 0x40},
> > +	{0x23, 0x20},
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x0f, 0x04},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x12, 0x35}, {0x15, 0xb0}, {0x10, 0x31}, {0x3e, 0x28},
> > +	{0x3f, 0xb0}, {0x40, 0x90}, {0x41, 0x0f},
> > +	/* INTPEE */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x90, 0x6c}, {0x91, 0x03}, {0x92, 0xcb}, {0x94, 0x33},
> > +	{0x95, 0x84}, {0x97, 0x65}, {0xa2, 0x11},
> > +	/* DNDD */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x80, 0xc1}, {0x81, 0x08}, {0x82, 0x05}, {0x83, 0x08},
> > +	{0x84, 0x0a}, {0x86, 0xf0}, {0x87, 0x50}, {0x88, 0x15},
> > +	{0x89, 0xb0}, {0x8a, 0x30}, {0x8b, 0x10},
> > +	/* ASDE */
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x21, 0x04},
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0xa3, 0x50}, {0xa4, 0x20}, {0xa5, 0x40}, {0xa6, 0x80},
> > +	{0xab, 0x40}, {0xae, 0x0c}, {0xb3, 0x46}, {0xb4, 0x64},
> > +	{0xb6, 0x38}, {0xb7, 0x01}, {0xb9, 0x2b}, {0x3c, 0x04},
> > +	{0x3d, 0x15}, {0x4b, 0x06}, {0x4c, 0x20},
> > +	/* Gamma */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x10, 0x09}, {0x11, 0x0d}, {0x12, 0x13}, {0x13, 0x19},
> > +	{0x14, 0x27}, {0x15, 0x37}, {0x16, 0x45}, {0x17, 0x53},
> > +	{0x18, 0x69}, {0x19, 0x7d}, {0x1a, 0x8f}, {0x1b, 0x9d},
> > +	{0x1c, 0xa9}, {0x1d, 0xbd}, {0x1e, 0xcd}, {0x1f, 0xd9},
> > +	{0x20, 0xe3}, {0x21, 0xea}, {0x22, 0xef}, {0x23, 0xf5},
> > +	{0x24, 0xf9}, {0x25, 0xff},
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{0xc6, 0x20}, {0xc7, 0x2b},
> > +	/* Gamma 2 */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x26, 0x0f}, {0x27, 0x14}, {0x28, 0x19}, {0x29, 0x1e},
> > +	{0x2a, 0x27}, {0x2b, 0x33}, {0x2c, 0x3b}, {0x2d, 0x45},
> > +	{0x2e, 0x59}, {0x2f, 0x69}, {0x30, 0x7c}, {0x31, 0x89},
> > +	{0x32, 0x98}, {0x33, 0xae}, {0x34, 0xc0}, {0x35, 0xcf},
> > +	{0x36, 0xda}, {0x37, 0xe2}, {0x38, 0xe9}, {0x39, 0xf3},
> > +	{0x3a, 0xf9}, {0x3b, 0xff},
> > +	/* YCP */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0xd1, 0x32}, {0xd2, 0x32}, {0xd3, 0x40}, {0xd6, 0xf0},
> > +	{0xd7, 0x10}, {0xd8, 0xda}, {0xdd, 0x14}, {0xde, 0x86},
> > +	{0xed, 0x80}, {0xee, 0x00}, {0xef, 0x3f}, {0xd8, 0xd8},
> > +	/* ABS */
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x9f, 0x40},
> > +	/* LSC */
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0xc2, 0x14}, {0xc3, 0x0d}, {0xc4, 0x0c}, {0xc8, 0x15},
> > +	{0xc9, 0x0d}, {0xca, 0x0a}, {0xbc, 0x24}, {0xbd, 0x10},
> > +	{0xbe, 0x0b}, {0xb6, 0x25}, {0xb7, 0x16}, {0xb8, 0x15},
> > +	{0xc5, 0x00}, {0xc6, 0x00}, {0xc7, 0x00}, {0xcb, 0x00},
> > +	{0xcc, 0x00}, {0xcd, 0x00}, {0xbf, 0x07}, {0xc0, 0x00},
> > +	{0xc1, 0x00}, {0xb9, 0x00}, {0xba, 0x00}, {0xbb, 0x00},
> > +	{0xaa, 0x01}, {0xab, 0x01}, {0xac, 0x00}, {0xad, 0x05},
> > +	{0xae, 0x06}, {0xaf, 0x0e}, {0xb0, 0x0b}, {0xb1, 0x07},
> > +	{0xb2, 0x06}, {0xb3, 0x17}, {0xb4, 0x0e}, {0xb5, 0x0e},
> > +	{0xd0, 0x09}, {0xd1, 0x00}, {0xd2, 0x00}, {0xd6, 0x08},
> > +	{0xd7, 0x00}, {0xd8, 0x00}, {0xd9, 0x00}, {0xda, 0x00},
> > +	{0xdb, 0x00}, {0xd3, 0x0a}, {0xd4, 0x00}, {0xd5, 0x00},
> > +	{0xa4, 0x00}, {0xa5, 0x00}, {0xa6, 0x77}, {0xa7, 0x77},
> > +	{0xa8, 0x77}, {0xa9, 0x77}, {0xa1, 0x80}, {0xa2, 0x80},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0xdf, 0x0d}, {0xdc, 0x25}, {0xdd, 0x30}, {0xe0, 0x77},
> > +	{0xe1, 0x80}, {0xe2, 0x77}, {0xe3, 0x90}, {0xe6, 0x90},
> > +	{0xe7, 0xa0}, {0xe8, 0x90}, {0xe9, 0xa0},
> > +	/* AWB */
> > +	/* measure window */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{0xec, 0x06}, {0xed, 0x04}, {0xee, 0x60}, {0xef, 0x90},
> > +	{0xb6, 0x01},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x4f, 0x00}, {0x4f, 0x00}, {0x4b, 0x01}, {0x4f, 0x00},
> > +	{0x4c, 0x01}, {0x4d, 0x71}, {0x4e, 0x01},
> > +	{0x4c, 0x01}, {0x4d, 0x91}, {0x4e, 0x01},
> > +	{0x4c, 0x01}, {0x4d, 0x70}, {0x4e, 0x01},
> > +	{0x4c, 0x01}, {0x4d, 0x90}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xb0}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0x8f}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0x6f}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xaf}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xd0}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xf0}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xcf}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0xef}, {0x4e, 0x02},
> > +	{0x4c, 0x01}, {0x4d, 0x6e}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x8e}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xae}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xce}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x4d}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x6d}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x8d}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xad}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xcd}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x4c}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x6c}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x8c}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xac}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xcc}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xcb}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x4b}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x6b}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x8b}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0xab}, {0x4e, 0x03},
> > +	{0x4c, 0x01}, {0x4d, 0x8a}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0xaa}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0xca}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0xca}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0xc9}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0x8a}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0x89}, {0x4e, 0x04},
> > +	{0x4c, 0x01}, {0x4d, 0xa9}, {0x4e, 0x04},
> > +	{0x4c, 0x02}, {0x4d, 0x0b}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x0a}, {0x4e, 0x05},
> > +	{0x4c, 0x01}, {0x4d, 0xeb}, {0x4e, 0x05},
> > +	{0x4c, 0x01}, {0x4d, 0xea}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x09}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x29}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x2a}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x4a}, {0x4e, 0x05},
> > +	{0x4c, 0x02}, {0x4d, 0x8a}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x49}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x69}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x89}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0xa9}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x48}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x68}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0x69}, {0x4e, 0x06},
> > +	{0x4c, 0x02}, {0x4d, 0xca}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xc9}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xe9}, {0x4e, 0x07},
> > +	{0x4c, 0x03}, {0x4d, 0x09}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xc8}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xe8}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xa7}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xc7}, {0x4e, 0x07},
> > +	{0x4c, 0x02}, {0x4d, 0xe7}, {0x4e, 0x07},
> > +	{0x4c, 0x03}, {0x4d, 0x07}, {0x4e, 0x07},
> > +	{0x4f, 0x01},
> > +	{0x50, 0x80}, {0x51, 0xa8}, {0x52, 0x47}, {0x53, 0x38},
> > +	{0x54, 0xc7}, {0x56, 0x0e}, {0x58, 0x08}, {0x5b, 0x00},
> > +	{0x5c, 0x74}, {0x5d, 0x8b}, {0x61, 0xdb}, {0x62, 0xb8},
> > +	{0x63, 0x86}, {0x64, 0xc0}, {0x65, 0x04}, {0x67, 0xa8},
> > +	{0x68, 0xb0}, {0x69, 0x00}, {0x6a, 0xa8}, {0x6b, 0xb0},
> > +	{0x6c, 0xaf}, {0x6d, 0x8b}, {0x6e, 0x50}, {0x6f, 0x18},
> > +	{0x73, 0xf0}, {0x70, 0x0d}, {0x71, 0x60}, {0x72, 0x80},
> > +	{0x74, 0x01}, {0x75, 0x01}, {0x7f, 0x0c}, {0x76, 0x70},
> > +	{0x77, 0x58}, {0x78, 0xa0}, {0x79, 0x5e}, {0x7a, 0x54},
> > +	{0x7b, 0x58},
> > +	/* CC */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0xc0, 0x01}, {0xc1, 0x44}, {0xc2, 0xfd}, {0xc3, 0x04},
> > +	{0xc4, 0xf0}, {0xc5, 0x48}, {0xc6, 0xfd}, {0xc7, 0x46},
> > +	{0xc8, 0xfd}, {0xc9, 0x02}, {0xca, 0xe0}, {0xcb, 0x45},
> > +	{0xcc, 0xec}, {0xcd, 0x48}, {0xce, 0xf0}, {0xcf, 0xf0},
> > +	{0xe3, 0x0c}, {0xe4, 0x4b}, {0xe5, 0xe0},
> > +	/* ABS */
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	{0x9f, 0x40},
> > +	/* Dark sun */
> > +	{GC2145_REG_PAGE_SELECT, 0x02},
> > +	{0x40, 0xbf}, {0x46, 0xcf},
> > +};
> > +
> > +#define GC2145_640_480_PIXELRATE	(60 * HZ_PER_MHZ)
> > +static const struct gc2145_reg mode_640_480_regs[] = {
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {0xfc, 0x06},
> > +	{0xf6, 0x00}, {0xf7, 0x1d}, {0xf8, 0x86}, {0xfa, 0x00},
> > +	{0xf9, 0x8e},
> > +	/* Disable PAD IO */
> > +	{GC2145_REG_PAD_IO, 0x00},
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	/* Row/Col start - 0/0 */
> > +	{GC2145_REG_ROW_START_HIGH, 0x00}, {GC2145_REG_ROW_START_LOW, 0x00},
> > +	{GC2145_REG_COL_START_HIGH, 0x00}, {GC2145_REG_COL_START_LOW, 0x00},
> > +	/* Window size 1216/1618 */
> > +	{GC2145_REG_WIN_HEIGHT_HIGH, 0x04}, {GC2145_REG_WIN_HEIGHT_LOW, 0xc0},
> > +	{GC2145_REG_WIN_WIDTH_HIGH, 0x06}, {GC2145_REG_WIN_WIDTH_LOW, 0x52},
> > +	/* Scalar more */
> > +	{0xfd, 0x01}, {0xfa, 0x00},
> > +	/* Crop 640-480@0-0 */
> > +	{GC2145_REG_CROP_ENABLE, 0x01},
> > +	{GC2145_REG_CROP_Y_HIGH, 0x00}, {GC2145_REG_CROP_Y_LOW, 0x00},
> > +	{GC2145_REG_CROP_X_HIGH, 0x00}, {GC2145_REG_CROP_X_LOW, 0x00},
> > +	{GC2145_REG_CROP_HEIGHT_HIGH, 0x01}, {GC2145_REG_CROP_HEIGHT_LOW, 0xe0},
> > +	{GC2145_REG_CROP_WIDTH_HIGH, 0x02}, {GC2145_REG_CROP_WIDTH_LOW, 0x80},
> > +	/* Subsampling configuration */
> > +	{0x99, 0x55}, {0x9a, 0x06}, {0x9b, 0x01},
> > +	{0x9c, 0x23}, {0x9d, 0x00}, {0x9e, 0x00}, {0x9f, 0x01},
> > +	{0xa0, 0x23}, {0xa1, 0x00}, {0xa2, 0x00},
> > +	/* Framerate */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{GC2145_REG_HBLANK_HIGH, 0x01}, {GC2145_REG_HBLANK_LOW, 0x30},
> > +	{GC2145_REG_VBLANK_HIGH, 0x00}, {GC2145_REG_VBLANK_LOW, 0x0c},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	/* AEC anti-flicker */
> > +	{0x25, 0x01}, {0x26, 0x75},
> > +	/* AEC exposure level 1-5 */
> > +	{0x27, 0x04}, {0x28, 0x5f}, {0x29, 0x04}, {0x2a, 0x5f},
> > +	{0x2b, 0x04}, {0x2c, 0x5f}, {0x2d, 0x04}, {0x2e, 0x5f},
> > +};
> > +
> > +#define GC2145_1280_720_PIXELRATE	(96 * HZ_PER_MHZ)
> > +static const struct gc2145_reg mode_1280_720_regs[] = {
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {0xfc, 0x06},
> > +	{0xf6, 0x00}, {0xf7, 0x1d}, {0xf8, 0x83}, {0xfa, 0x00},
> > +	{0xf9, 0x8e},
> > +	/* Disable PAD IO */
> > +	{GC2145_REG_PAD_IO, 0x00},
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	/* Row/Col start - 240/160 */
> > +	{GC2145_REG_ROW_START_HIGH, 0x00}, {GC2145_REG_ROW_START_LOW, 0xf0},
> > +	{GC2145_REG_COL_START_HIGH, 0x00}, {GC2145_REG_COL_START_LOW, 0xa0},
> > +	/* Window size 736/1296 */
> > +	{GC2145_REG_WIN_HEIGHT_HIGH, 0x02}, {GC2145_REG_WIN_HEIGHT_LOW, 0xe0},
> > +	{GC2145_REG_WIN_WIDTH_HIGH, 0x05}, {GC2145_REG_WIN_WIDTH_LOW, 0x10},
> > +	/* Crop 1280-720@0-0 */
> > +	{GC2145_REG_CROP_ENABLE, 0x01},
> > +	{GC2145_REG_CROP_Y_HIGH, 0x00}, {GC2145_REG_CROP_Y_LOW, 0x00},
> > +	{GC2145_REG_CROP_X_HIGH, 0x00}, {GC2145_REG_CROP_X_LOW, 0x00},
> > +	{GC2145_REG_CROP_HEIGHT_HIGH, 0x02}, {GC2145_REG_CROP_HEIGHT_LOW, 0xd0},
> > +	{GC2145_REG_CROP_WIDTH_HIGH, 0x05}, {GC2145_REG_CROP_WIDTH_LOW, 0x00},
> > +	/* Framerate */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{GC2145_REG_HBLANK_HIGH, 0x01}, {GC2145_REG_HBLANK_LOW, 0x56},
> > +	{GC2145_REG_VBLANK_HIGH, 0x00}, {GC2145_REG_VBLANK_LOW, 0x11},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	/* AEC anti-flicker */
> > +	{0x25, 0x00}, {0x26, 0xe6},
> > +	/* AEC exposure level 1-5 */
> > +	{0x27, 0x02}, {0x28, 0xb2}, {0x29, 0x02}, {0x2a, 0xb2},
> > +	{0x2b, 0x02}, {0x2c, 0xb2}, {0x2d, 0x02}, {0x2e, 0xb2},
> > +};
> > +
> > +#define GC2145_1600_1200_PIXELRATE	(72 * HZ_PER_MHZ)
> > +static const struct gc2145_reg mode_1600_1200_regs[] = {
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
> > +	{GC2145_REG_PAGE_SELECT, 0xf0}, {0xfc, 0x06},
> > +	{0xf6, 0x00}, {0xf7, 0x1d}, {0xf8, 0x84}, {0xfa, 0x00},
> > +	{0xf9, 0x8e},
> > +	/* Disable PAD IO */
> > +	{GC2145_REG_PAD_IO, 0x00},
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	/* Row/Col start - 0/0 */
> > +	{GC2145_REG_ROW_START_HIGH, 0x00}, {GC2145_REG_ROW_START_LOW, 0x00},
> > +	{GC2145_REG_COL_START_HIGH, 0x00}, {GC2145_REG_COL_START_LOW, 0x00},
> > +	/* Window size: 1216/1618 */
> > +	{GC2145_REG_WIN_HEIGHT_HIGH, 0x04}, {GC2145_REG_WIN_HEIGHT_LOW, 0xc0},
> > +	{GC2145_REG_WIN_WIDTH_HIGH, 0x06}, {GC2145_REG_WIN_WIDTH_LOW, 0x52},
> > +	/* Crop 1600-1200@0-0 */
> > +	{GC2145_REG_CROP_ENABLE, 0x01},
> > +	{GC2145_REG_CROP_Y_HIGH, 0x00}, {GC2145_REG_CROP_Y_LOW, 0x00},
> > +	{GC2145_REG_CROP_X_HIGH, 0x00}, {GC2145_REG_CROP_X_LOW, 0x00},
> > +	{GC2145_REG_CROP_HEIGHT_HIGH, 0x04}, {GC2145_REG_CROP_HEIGHT_LOW, 0xb0},
> > +	{GC2145_REG_CROP_WIDTH_HIGH, 0x06}, {GC2145_REG_CROP_WIDTH_LOW, 0x40},
> > +	/* Framerate */
> > +	{GC2145_REG_PAGE_SELECT, 0x00},
> > +	{GC2145_REG_HBLANK_HIGH, 0x01}, {GC2145_REG_HBLANK_LOW, 0x56},
> > +	{GC2145_REG_VBLANK_HIGH, 0x00}, {GC2145_REG_VBLANK_LOW, 0x10},
> > +	{GC2145_REG_PAGE_SELECT, 0x01},
> > +	/* AEC anti-flicker */
> > +	{0x25, 0x00}, {0x26, 0xfa},
> > +	/* AEC exposure level 1-5 */
> > +	{0x27, 0x04}, {0x28, 0xe2}, {0x29, 0x04}, {0x2a, 0xe2},
> > +	{0x2b, 0x04}, {0x2c, 0xe2}, {0x2d, 0x04}, {0x2e, 0xe2},
> > +};
> > +
> > +/* Regulators supplies */
> > +static const char * const gc2145_supply_name[] = {
> > +	"IOVDD", /* Digital I/O (1.7-3V) suppply */
> > +	"AVDD",  /* Analog (2.7-3V) supply */
> > +	"DVDD",  /* Digital Core (1.7-1.9V) supply */
> > +};
> > +
> > +#define GC2145_NUM_SUPPLIES ARRAY_SIZE(gc2145_supply_name)
> > +
> > +/* Mode configs */
> > +#define GC2145_MODE_640X480	0
> > +#define GC2145_MODE_1280X720	1
> > +#define GC2145_MODE_1600X1200	2
> > +static const struct gc2145_mode supported_modes[] = {
> > +	{
> > +		/* 640x480 30fps mode */
> > +		.width = 640,
> > +		.height = 480,
> > +		.frame_interval = {
> > +			.numerator = 1,
> > +			.denominator = 30,
> > +		},
> > +		.reg_list = {
> > +			.num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> > +			.regs = mode_640_480_regs,
> > +		},
> > +		.pixel_rate = GC2145_640_480_PIXELRATE,
> > +		.crop = {
> > +			.top = 0,
> > +			.left = 0,
> > +			.width = 640,
> > +			.height = 480,
> > +		},
> > +		.hblank = 0x130,
> > +	},
> > +	{
> > +		/* 1280x720 30fps mode */
> > +		.width = 1280,
> > +		.height = 720,
> > +		.frame_interval = {
> > +			.numerator = 1,
> > +			.denominator = 30,
> > +		},
> > +		.reg_list = {
> > +			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
> > +			.regs = mode_1280_720_regs,
> > +		},
> > +		.pixel_rate = GC2145_1280_720_PIXELRATE,
> > +		.crop = {
> > +			.top = 160,
> > +			.left = 240,
> > +			.width = 1280,
> > +			.height = 720,
> > +		},
> > +		.hblank = 0x156,
> > +	},
> > +	{
> > +		/* 1600x1200 20fps mode */
> > +		.width = 1600,
> > +		.height = 1200,
> > +		.frame_interval = {
> > +			.numerator = 1,
> > +			.denominator = 20,
> > +		},
> > +		.reg_list = {
> > +			.num_of_regs = ARRAY_SIZE(mode_1600_1200_regs),
> > +			.regs = mode_1600_1200_regs,
> > +		},
> > +		.pixel_rate = GC2145_1600_1200_PIXELRATE,
> > +		.crop = {
> > +			.top = 0,
> > +			.left = 0,
> > +			.width = 1600,
> > +			.height = 1200,
> > +		},
> > +		.hblank = 0x156,
> > +	},
> > +};
> > +
> > +/**
> > + * struct gc2145_format - GC2145 pixel format description
> > + * @code: media bus (MBUS) associated code
> > + * @colorspace: V4L2 colospace
> > + * @datatype: MIPI CSI2 data type
> > + * @output_fmt: GC2145 output format
> > + * @row_col_switch: control of GC2145 row/col switch feature
> > + */
> > +struct gc2145_format {
> > +	unsigned int code;
> > +	unsigned int colorspace;
> > +	unsigned char datatype;
> > +	unsigned char output_fmt;
> > +	unsigned char row_col_switch;
> 
> Never initialized in the supported_formats[] list. Is this intentional ?

This was used by the RAW format but this I removed it from current serie
it became unused.  I removed it in v2.

> 
> > +};
> > +
> > +/* All supported formats */
> > +#define GC2145_DEFAULT_MBUS_FORMAT	MEDIA_BUS_FMT_YUYV8_2X8
> 
> Seems like this is not used and you use MEDIA_BUS_FMT_RGB565_2X8_BE
> in init_cfg()

Removed

> 
> > +static const struct gc2145_format supported_formats[] = {
> > +	{
> > +		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.datatype	= MIPI_CSI2_DT_YUV422_8B,
> > +		.output_fmt	= 0x00,
> > +	},
> > +	{
> > +		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.datatype	= MIPI_CSI2_DT_YUV422_8B,
> > +		.output_fmt	= 0x01,
> > +	},
> > +	{
> > +		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.datatype	= MIPI_CSI2_DT_YUV422_8B,
> > +		.output_fmt	= 0x02,
> > +	},
> > +	{
> > +		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.datatype	= MIPI_CSI2_DT_YUV422_8B,
> > +		.output_fmt	= 0x03,
> > +	},
> > +	{
> > +		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.datatype	= MIPI_CSI2_DT_RGB565,
> > +		.output_fmt	= 0x06,
> > +	},
> > +};
> > +
> > +struct gc2145_ctrls {
> > +	struct v4l2_ctrl_handler handler;
> > +	struct v4l2_ctrl *pixel_rate;
> > +	struct v4l2_ctrl *hblank;
> > +	struct v4l2_ctrl *test_pattern;
> > +	struct v4l2_ctrl *hflip;
> > +	struct v4l2_ctrl *vflip;
> > +};
> > +
> > +struct gc2145 {
> > +	struct v4l2_subdev sd;
> > +	struct media_pad pad;
> > +
> > +	struct clk *xclk;
> > +
> > +	struct gpio_desc *reset_gpio;
> > +	struct gpio_desc *powerdown_gpio;
> > +	struct regulator_bulk_data supplies[GC2145_NUM_SUPPLIES];
> > +
> > +	/* V4L2 controls */
> > +	struct gc2145_ctrls ctrls;
> > +
> > +	/* Current mode */
> > +	const struct gc2145_mode *mode;
> > +
> > +	/* Streaming on/off */
> > +	bool streaming;
> > +};
> > +
> > +static inline struct gc2145 *to_gc2145(struct v4l2_subdev *_sd)
> > +{
> > +	return container_of(_sd, struct gc2145, sd);
> > +}
> > +
> > +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > +{
> > +	return &container_of(ctrl->handler, struct gc2145,
> > +			     ctrls.handler)->sd;
> > +}
> > +
> > +static int gc2145_read_reg(struct gc2145 *gc2145, u8 addr, u8 *data,
> > +			   int data_size)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	struct i2c_msg msg[2];
> > +	int ret;
> > +
> > +	msg[0].addr = client->addr;
> > +	msg[0].flags = client->flags;
> > +	msg[0].buf = &addr;
> > +	msg[0].len = 1;
> > +
> > +	msg[1].addr = client->addr;
> > +	msg[1].flags = client->flags | I2C_M_RD;
> > +	msg[1].buf = data;
> > +	msg[1].len = data_size;
> > +
> > +	ret = i2c_transfer(client->adapter, msg, 2);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "%s: error %d: start_index=%x, data_size=%d\n",
> > +			__func__, ret, (u32)addr, data_size);
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(&client->dev, "[rd %02x] => %*ph\n", (u32)addr, data_size,
> > +		data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_write_reg(struct gc2145 *gc2145, u8 addr, u8 data)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	struct i2c_msg msg;
> > +	u8 buf[] = { addr, data };
> > +	int ret;
> > +
> > +	msg.addr = client->addr;
> > +	msg.flags = client->flags;
> > +	msg.buf = buf;
> > +	msg.len = sizeof(buf);
> > +
> > +	dev_dbg(&client->dev, "[wr %02x] <= %02xh\n", (u32)addr, data);
> > +
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "%s: error %d: addr=%x, data=%02xh\n",
> > +			__func__, ret, (u32)addr, data);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_mod_reg(struct gc2145 *gc2145, u16 reg, u8 mask, u8 val)
> > +{
> > +	u8 readval;
> > +	int ret;
> > +
> > +	ret = gc2145_read_reg(gc2145, reg, &readval, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	readval &= ~mask;
> > +	val &= mask;
> > +	val |= readval;
> > +
> > +	return gc2145_write_reg(gc2145, reg, val);
> > +}
> > +
> > +/* Write a list of registers */
> > +static int gc2145_write_regs(struct gc2145 *gc2145,
> > +			     const struct gc2145_reg *regs, u32 len)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < len; i++) {
> > +		ret = gc2145_write_reg(gc2145, regs[i].address, regs[i].val);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> From a quick look at the documentation, this sensor seems to be
> compatible with MIPI CCI. The newly merged CCI helpers would provide
> read/write functions for you. If possible I would suggest to use them

Agreed.  Everything is moved to cci calls, making the driver easier to
read especially for 16 bit registers (except for the one from Page3
(MIPI) which are sadly in LE format so I kept them in 8 bit for the time
being since I didn't find pretty to swap their value prior to calling
cci_write).

> 
> > +
> > +static const struct gc2145_format *
> > +gc2145_get_format_code(struct gc2145 *gc2145, u32 code)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
> > +		if (supported_formats[i].code == code)
> > +			break;
> > +
> > +	if (i >= ARRAY_SIZE(supported_formats))
> > +		i = 0;
> > +
> > +	return &supported_formats[i];
> > +}
> > +
> > +static void gc2145_update_pad_format(struct gc2145 *gc2145,
> > +				     const struct gc2145_mode *mode,
> > +				     struct v4l2_mbus_framefmt *fmt, u32 code)
> > +{
> > +	fmt->code = code;
> > +	fmt->width = mode->width;
> > +	fmt->height = mode->height;
> > +	fmt->field = V4L2_FIELD_NONE;
> > +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> > +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> > +	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace,
> > +							  fmt->ycbcr_enc);
> > +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +}
> > +
> > +static int gc2145_init_cfg(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *state)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +
> > +	/* Initialize try_fmt */
> > +	format = v4l2_subdev_get_pad_format(sd, state, 0);
> > +	gc2145_update_pad_format(gc2145,
> > +				 &supported_modes[0], format,
> > +				 MEDIA_BUS_FMT_RGB565_2X8_BE);
> > +
> > +	/* Initialize crop rectangle. */
> > +	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> > +	*crop = supported_modes[0].crop;
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_get_selection(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_state *sd_state,
> > +				struct v4l2_subdev_selection *sel)
> > +{
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP: {
> > +		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > +		return 0;
> > +	}
> 
> Do you need {} ?

Removed

> 
> > +
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = GC2145_NATIVE_WIDTH;
> > +		sel->r.height = GC2145_NATIVE_HEIGHT;
> > +
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = 1600;
> > +		sel->r.height = 1200;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int gc2145_enum_mbus_code(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *sd_state,
> > +				 struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index >= ARRAY_SIZE(supported_formats))
> > +		return -EINVAL;
> > +
> > +	code->code = supported_formats[code->index].code;
> > +	return 0;
> > +}
> > +
> > +static int gc2145_enum_frame_size(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *sd_state,
> > +				  struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	const struct gc2145_format *gc2145_format;
> > +	u32 code;
> > +
> > +	if (fse->index >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> > +
> > +	gc2145_format = gc2145_get_format_code(gc2145, fse->code);
> > +	code = gc2145_format->code;
> > +	if (fse->code != code)
> > +		return -EINVAL;
> 
> Is this correct ? Should you check if fse->code matches the currently
> applied format code or should you just check if fse->code is supported
> at al ? I recall the API doc was not super-clear about this, am I
> wrong ?

Indeed, hard to have a clear answer from the API doc.  I think it makes
more sense to check if the code match is supported rather than what it
currently set.  Don't you think ?

> 
> > +
> > +	fse->min_width = supported_modes[fse->index].width;
> > +	fse->max_width = fse->min_width;
> > +	fse->min_height = supported_modes[fse->index].height;
> > +	fse->max_height = fse->min_height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +gc2145_enum_frame_interval(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *sd_state,
> > +			   struct v4l2_subdev_frame_interval_enum *fie)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	const struct gc2145_format *gc2145_format;
> > +	u32 code, i;
> > +
> > +	/* Only supporting a unique framerate per resolution currently */
> > +	if (fie->index > 0)
> > +		return -EINVAL;
> > +
> > +	gc2145_format = gc2145_get_format_code(gc2145, fie->code);
> > +	code = gc2145_format->code;
> > +	if (fie->code != code)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
> > +		if (supported_modes[i].width == fie->width &&
> > +		    supported_modes[i].height == fie->height)
> > +			break;
> > +
> > +	if (i >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> > +
> > +	fie->interval.numerator = supported_modes[i].frame_interval.numerator;
> > +	fie->interval.denominator =
> > +		supported_modes[i].frame_interval.denominator;
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_set_pad_format(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *sd_state,
> > +				 struct v4l2_subdev_format *fmt)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	const struct gc2145_mode *mode;
> > +	const struct gc2145_format *gc2145_fmt;
> > +	struct v4l2_mbus_framefmt *framefmt;
> > +	struct gc2145_ctrls *ctrls = &gc2145->ctrls;
> > +	struct v4l2_rect *crop;
> > +
> > +	gc2145_fmt = gc2145_get_format_code(gc2145, fmt->format.code);
> > +	mode = v4l2_find_nearest_size(supported_modes,
> > +				      ARRAY_SIZE(supported_modes),
> > +				      width, height,
> > +				      fmt->format.width, fmt->format.height);
> > +
> > +	/* In RAW mode, VGA is not possible so use 720p instead */
> > +	if (gc2145_fmt->colorspace == V4L2_COLORSPACE_RAW &&
> > +	    mode == &supported_modes[GC2145_MODE_640X480])
> > +		mode = &supported_modes[GC2145_MODE_1280X720];
> > +
> > +	gc2145_update_pad_format(gc2145, mode, &fmt->format, gc2145_fmt->code);
> > +	framefmt = v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad);
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> > +	    (gc2145->mode != mode || framefmt->code != fmt->format.code)) {
> 
> For consistency see  6cb042908b3e ("media: i2c: imx219: Perform a full
> mode set unconditionally")

Ok, only kept the check again FORMAT_ACTIVE and removed the mode and
code checks.

> 
> > +		gc2145->mode = mode;
> > +		/* Update pixel_rate based on the mode */
> > +		__v4l2_ctrl_s_ctrl_int64(ctrls->pixel_rate, mode->pixel_rate);
> > +		/* Update hblank based on the mode */
> > +		__v4l2_ctrl_modify_range(ctrls->hblank, mode->hblank,
> > +					 mode->hblank, 1, mode->hblank);
> > +		__v4l2_ctrl_s_ctrl(ctrls->hblank, mode->hblank);
> > +	}
> > +	*framefmt = fmt->format;
> > +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, fmt->pad);
> > +	*crop = mode->crop;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct gc2145_reg common_mipi_regs[] = {
> > +	{GC2145_REG_PAGE_SELECT, 0x03},
> > +	{0x01, 0x87}, {0x02, 0x22}, {0x03, 0x10},
> > +	{0x06, 0x88}, {0x10, 0x95}, {0x15, 0x10}, {0x22, 0x04},
> > +	{0x23, 0x10}, {0x24, 0x10}, {0x25, 0x10}, {0x26, 0x05},
> > +	{0x21, 0x10}, {0x29, 0x03}, {0x2a, 0x0a}, {0x2b, 0x06},
> 
> I supposed these are undocumented in your documentation as well, right ?

I got them described (at some level) in the doc I have.  Had to confirm
with GalaxyCore it was alright to describe them in the driver.  Now
there are more details in the v2.

> 
> 
> > +};
> > +
> > +static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
> > +				   const struct gc2145_format *gc2145_format)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	u16 lwc, fifo_full_lvl, fifo_gate_mode;
> > +	int ret;
> > +
> > +	/* Common MIPI settings */
> > +	ret = gc2145_write_regs(gc2145, common_mipi_regs,
> > +				ARRAY_SIZE(common_mipi_regs));
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s failed to set mode - MIPI\n",
> > +			__func__);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * Adjust the MIPI buffer settings.
> > +	 * For YUV/RGB, LWC = image width * 2
> > +	 * For RAW8, LWC = image width
> > +	 * For RAW10, LWC = image width * 1.25
> 
> The multiplication factor is then just bpp expressed in bytes, right ?
> 
> > +	 */
> > +	if (gc2145_format->colorspace != V4L2_COLORSPACE_RAW)
> > +		lwc = gc2145->mode->width * 2;
> > +	else if (gc2145_format->code == MEDIA_BUS_FMT_SGRBG8_1X8 ||
> > +		 gc2145_format->code == MEDIA_BUS_FMT_SRGGB8_1X8 ||
> > +		 gc2145_format->code == MEDIA_BUS_FMT_SBGGR8_1X8 ||
> > +		 gc2145_format->code == MEDIA_BUS_FMT_SGBRG8_1X8)
> > +		lwc = gc2145->mode->width * 1;
> 
> The driver does not support RAW formats, right ?

Yes.  I removed that part, just keeping the comment above so that it is
already known when I had again RAW later on.

> 
> > +	else
> > +		lwc = gc2145->mode->width + (gc2145->mode->width / 4);
> > +
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_LWC_HIGH, lwc >> 8);
> > +	if (ret)
> > +		return ret;
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_LWC_LOW, (lwc & 0xff));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Adjust the MIPI Fifo Full Level
> > +	 * 640x480 RGB: 0x0190
> > +	 * 1280x720 / 1600x1200 (aka no scaler) non RAW: 0x0001
> > +	 * 1600x1200 RAW: 0x0190
> > +	 */
> > +	if (gc2145_format->colorspace != V4L2_COLORSPACE_RAW) {
> 
> Ditto, no RAW formats are supported. This applies to all other uses of
> V4L2_COLORSPACE_RAW in the driver
> 
> > +		if (gc2145->mode->width == 1280 || gc2145->mode->width == 1600)
> > +			fifo_full_lvl = 0x0001;
> > +		else
> > +			fifo_full_lvl = 0x0190;
> > +	} else {
> > +		fifo_full_lvl = 0x0190;
> > +	}
> > +
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_FIFO_FULL_LVL_HIGH,
> > +			       fifo_full_lvl >> 8);
> > +	if (ret)
> > +		return ret;
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_FIFO_FULL_LVL_LOW,
> > +			       fifo_full_lvl & 0xff);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set the fifo gate mode / MIPI wdiv set */
> > +	if (gc2145_format->colorspace == V4L2_COLORSPACE_RAW)
> > +		fifo_gate_mode = 0xf1;
> > +	else
> > +		fifo_gate_mode = 0xf0;
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_FIFO_GATE_MODE,
> > +			       fifo_gate_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set the MIPI data type */
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_MIPI_DT,
> > +			       gc2145_format->datatype);
> > +	return ret;
> > +}
> > +
> > +static int gc2145_start_streaming(struct gc2145 *gc2145,
> > +				  struct v4l2_subdev_state *state)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	const struct gc2145_format *gc2145_format;
> > +	struct v4l2_mbus_framefmt *fmt;
> > +	u8 sync_mode;
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(&client->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * TODO - configuration of the sensor will have to be moved into
> > +	 * gc2145_set_pad_format once we have a way to configure without
> > +	 * starting the sensor.  In such case, only streaming start will
> > +	 * be done here.
> > +	 */
> 
> Are you sure ? It seems correct to me to update the sensor
> configuration before starting the streaming, isn't it ?

Yes, simply removed the comment :-)

> 
> > +
> > +	/* Apply default values of current mode */
> > +	ret = gc2145_write_regs(gc2145, gc2145->mode->reg_list.regs,
> > +				gc2145->mode->reg_list.num_of_regs);
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s failed to set mode - pre ISP\n",
> > +			__func__);
> > +		goto err_rpm_put;
> > +	}
> > +
> > +	ret = gc2145_write_regs(gc2145, common_regs,
> > +				ARRAY_SIZE(common_regs));
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s failed to set common regs\n",
> > +			__func__);
> > +		goto err_rpm_put;
> > +	}
> > +
> > +	fmt = v4l2_subdev_get_pad_format(&gc2145->sd, state, 0);
> > +	gc2145_format = gc2145_get_format_code(gc2145, fmt->code);
> > +
> > +	/* Set the output format */
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_PAGE_SELECT, 0x00);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_OUTPUT_FMT,
> > +			       gc2145_format->output_fmt);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = gc2145_read_reg(gc2145, GC2145_REG_SYNC_MODE, &sync_mode, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	sync_mode &= ~(GC2145_SYNC_MODE_COL_SWITCH |
> > +		       GC2145_SYNC_MODE_ROW_SWITCH);
> > +	sync_mode |= gc2145_format->row_col_switch;
> 
> As said, this is fixed to 0. Did you get what COL/ROW_SWITCH is meant
> to be used for ?
> 
> > +
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_SYNC_MODE, sync_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Perform MIPI specific configuration */
> > +	ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Come back on page 0 by default */
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_PAGE_SELECT, 0x00);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Apply customized values from user */
> > +	ret =  __v4l2_ctrl_handler_setup(&gc2145->ctrls.handler);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	return 0;
> > +
> > +err_rpm_put:
> > +	pm_runtime_put(&client->dev);
> > +	return ret;
> > +}
> > +
> > +static void gc2145_stop_streaming(struct gc2145 *gc2145)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +
> > +	/*
> > +	 * TODO - once we have a way to turn off only streaming of the
> > +	 * sensor, we will have to do it here.
> 
> Right, what register write "starts" the streaming ?

Done now in v2, start and stop added.

> 
> > +	 */
> > +
> > +	pm_runtime_put(&client->dev);
> > +}
> > +
> > +static int gc2145_g_frame_interval(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_frame_interval *fi)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +
> > +	fi->interval = gc2145->mode->frame_interval;
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	struct v4l2_subdev_state *state;
> > +	int ret = 0;
> > +
> > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > +
> > +	if (gc2145->streaming == enable)
> > +		goto unlock;
> > +
> > +	if (enable) {
> > +		/*
> > +		 * Apply default & customized values
> > +		 * and then start streaming.
> > +		 */
> > +		ret = gc2145_start_streaming(gc2145, state);
> > +		if (ret)
> > +			goto unlock;
> > +	} else {
> > +		gc2145_stop_streaming(gc2145);
> > +	}
> > +
> > +	gc2145->streaming = enable;
> > +
> > +unlock:
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	return ret;
> > +}
> > +
> > +/* Power/clock management functions */
> > +static int gc2145_power_on(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(GC2145_NUM_SUPPLIES, gc2145->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(gc2145->xclk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clock\n");
> > +		goto reg_off;
> > +	}
> > +
> > +	/* TODO - Following delays should be tuned */
> > +	usleep_range(10000, 12000);
> 
> wow, 10 to 12 msec ?
> 
> The datasheet version I have reports "TBD" as suggested delays :/

I've checked that again.  Datasheet I have mentioned 0us as minimum so I
removed delay between regu / powerdown and reset.  However I've found
that the I2C device won't reply for the a long time after the sequence
so had to keep a rather long delay of 40ms at the very end otherwise i2c
communication is failing.

> 
> 
> > +	gpiod_set_value_cansleep(gc2145->powerdown_gpio, 0);
> > +	usleep_range(10000, 12000);
> > +	gpiod_set_value_cansleep(gc2145->reset_gpio, 0);
> > +	usleep_range(40000, 50000);
> > +
> > +	return 0;
> > +
> > +reg_off:
> > +	regulator_bulk_disable(GC2145_NUM_SUPPLIES, gc2145->supplies);
> > +
> > +	return ret;
> > +}
> > +
> > +static int gc2145_power_off(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +
> > +	gpiod_set_value_cansleep(gc2145->powerdown_gpio, 1);
> > +	gpiod_set_value_cansleep(gc2145->reset_gpio, 1);
> > +	regulator_bulk_disable(GC2145_NUM_SUPPLIES, gc2145->supplies);
> > +	clk_disable_unprepare(gc2145->xclk);
> 
> 7.2.2 Power Off Sequence shows clock being stopped before disabling
> regulators.

Yep, updated.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_suspend(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +
> > +	if (gc2145->streaming)
> > +		gc2145_stop_streaming(gc2145);
> > +
> > +	return 0;
> > +}
> > +
> > +static int gc2145_resume(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	struct v4l2_subdev_state *state;
> > +	int ret;
> > +
> > +	if (gc2145->streaming) {
> > +		state = v4l2_subdev_lock_and_get_active_state(sd);
> > +		ret = gc2145_start_streaming(gc2145, state);
> > +		v4l2_subdev_unlock_state(state);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +
> > +	return 0;
> > +
> > +error:
> > +	gc2145_stop_streaming(gc2145);
> > +	gc2145->streaming = false;
> > +
> > +	return ret;
> > +}
> > +
> > +static int gc2145_get_regulators(struct gc2145 *gc2145)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < GC2145_NUM_SUPPLIES; i++)
> > +		gc2145->supplies[i].supply = gc2145_supply_name[i];
> > +
> > +	return devm_regulator_bulk_get(&client->dev, GC2145_NUM_SUPPLIES,
> > +				       gc2145->supplies);
> > +}
> > +
> > +/* Verify chip ID */
> > +static int gc2145_identify_module(struct gc2145 *gc2145)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	int ret;
> > +	u16 chip_id;
> > +
> > +	ret = gc2145_read_reg(gc2145, GC2145_REG_CHIP_ID, (u8 *)&chip_id, 2);
> > +	if (ret) {
> > +		dev_err(&client->dev, "failed to read chip id (%d)\n", ret);
> > +		return ret;
> > +	}
> > +	chip_id = be16_to_cpu(chip_id);
> > +
> > +	if (chip_id != GC2145_CHIP_ID) {
> > +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> > +			GC2145_CHIP_ID, chip_id);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const char * const test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Colored patterns",
> > +	"Uniform white",
> > +	"Uniform yellow",
> > +	"Uniform cyan",
> > +	"Uniform green",
> > +	"Uniform magenta",
> > +	"Uniform red",
> > +	"Uniform black",
> > +};
> > +
> > +#define GC2145_TEST_PATTERN_ENABLE	BIT(0)
> > +#define GC2145_TEST_PATTERN_UXGA	BIT(3)
> > +
> > +#define GC2145_TEST_UNIFORM		BIT(3)
> > +#define GC2145_TEST_WHITE		(4 << 4)
> > +#define GC2145_TEST_YELLOW		(8 << 4)
> > +#define GC2145_TEST_CYAN		(9 << 4)
> > +#define GC2145_TEST_GREEN		(6 << 4)
> > +#define GC2145_TEST_MAGENTA		(10 << 4)
> > +#define GC2145_TEST_RED			(5 << 4)
> > +#define GC2145_TEST_BLACK		(0)
> > +
> > +static const u8 test_pattern_val[] = {
> > +	0,
> > +	GC2145_TEST_PATTERN_ENABLE,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_WHITE,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_YELLOW,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_CYAN,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_GREEN,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_MAGENTA,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_RED,
> > +	GC2145_TEST_UNIFORM | GC2145_TEST_BLACK,
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops gc2145_core_ops = {
> > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops gc2145_video_ops = {
> > +	.g_frame_interval = gc2145_g_frame_interval,
> > +	/*
> > +	 * Currently frame_interval can't be changed hence s_frame_interval
> > +	 * does same as g_frame_interval
> > +	 */
> > +	.s_frame_interval = gc2145_g_frame_interval,
> > +	.s_stream = gc2145_set_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops gc2145_pad_ops = {
> > +	.init_cfg = gc2145_init_cfg,
> > +	.enum_mbus_code = gc2145_enum_mbus_code,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> > +	.set_fmt = gc2145_set_pad_format,
> > +	.get_selection = gc2145_get_selection,
> > +	.enum_frame_size = gc2145_enum_frame_size,
> > +	.enum_frame_interval = gc2145_enum_frame_interval,
> > +};
> > +
> > +static const struct v4l2_subdev_ops gc2145_subdev_ops = {
> > +	.core = &gc2145_core_ops,
> > +	.video = &gc2145_video_ops,
> > +	.pad = &gc2145_pad_ops,
> > +};
> > +
> > +static int gc2145_set_ctrl_test_pattern(struct gc2145 *gc2145, int value)
> > +{
> > +	int ret;
> > +
> > +	if (!value) {
> > +		/* Disable test pattern */
> > +		ret = gc2145_write_reg(gc2145, GC2145_REG_DEBUG_MODE2, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		return gc2145_write_reg(gc2145, GC2145_REG_DEBUG_MODE3, 0);
> > +	}
> > +
> > +	/* Enable test pattern, colored or uniform */
> > +	ret = gc2145_write_reg(gc2145, GC2145_REG_DEBUG_MODE2,
> > +			       GC2145_TEST_PATTERN_ENABLE |
> > +			       GC2145_TEST_PATTERN_UXGA);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!(test_pattern_val[value] & GC2145_TEST_UNIFORM))
> > +		return gc2145_write_reg(gc2145, GC2145_REG_DEBUG_MODE3, 0);
> > +
> > +	/* Uniform */
> > +	return gc2145_write_reg(gc2145, GC2145_REG_DEBUG_MODE3,
> > +				test_pattern_val[value]);
> > +}
> > +
> > +static int gc2145_set_ctrl_hflip(struct gc2145 *gc2145, int value)
> > +{
> > +	return gc2145_mod_reg(gc2145, GC2145_REG_ANALOG_MODE1,
> > +			      BIT(0), (value ? BIT(0) : 0));
> > +}
> > +
> > +static int gc2145_set_ctrl_vflip(struct gc2145 *gc2145, int value)
> > +{
> > +	return gc2145_mod_reg(gc2145, GC2145_REG_ANALOG_MODE1,
> > +			      BIT(1), (value ? BIT(1) : 0));
> > +}
> > +
> > +static int gc2145_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(&client->dev);
> 
> You shouldn't resume the sensor when setting controls but rather check
> if the sensor is powered up with:
> 
> 	if (pm_runtime_get_if_in_use(&client->dev) == 0)
> 		return 0;
> 
> and as you call  __v4l2_ctrl_handler_setup() already at s_stream(1)
> time, controls will be applied before streaming start

Updated.

> 
> 
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_TEST_PATTERN:
> > +		ret = gc2145_set_ctrl_test_pattern(gc2145, ctrl->val);
> > +		break;
> > +	case V4L2_CID_HFLIP:
> > +		ret = gc2145_set_ctrl_hflip(gc2145, ctrl->val);
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		ret = gc2145_set_ctrl_vflip(gc2145, ctrl->val);
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	pm_runtime_put(&client->dev);
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops gc2145_ctrl_ops = {
> > +	.s_ctrl = gc2145_s_ctrl,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int gc2145_init_controls(struct gc2145 *gc2145)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
> > +	const struct v4l2_ctrl_ops *ops = &gc2145_ctrl_ops;
> > +	struct gc2145_ctrls *ctrls = &gc2145->ctrls;
> > +	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > +	struct v4l2_fwnode_device_properties props;
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(hdl, 12);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > +					      0, INT_MAX, 1,
> 
> You know the supported pixel rates. Why use INT_MAX ?

Fixed

> 
> > +					      supported_modes[0].pixel_rate);
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> isn't PIXEL_RATE RO by default ?

Correct

> 
> > +
> > +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > +					  supported_modes[0].hblank,
> > +					  supported_modes[0].hblank, 1,
> > +					  supported_modes[0].hblank);
> 
> Register P0:0x05 "HBlanking" is 12 bits long.
> Is the max value BIT(13) - 1 ?
> 
> I have not been able to find a min value.
> 
> However registering hblank without vblank kind of defeats the purpose
> of using the two controls to compute the frame duration..

I removed the HBLANK control since RAW is no more supported.  However
this trigs a crash within libcamera at following place:

int CameraSensor::init()
{
 (...)
        const ControlInfo hblank = ctrls.infoMap()->at(V4L2_CID_HBLANK);
        const int32_t hblankMin = hblank.min().get<int32_t>();
        const int32_t hblankMax = hblank.max().get<int32_t>();

        if (hblankMin != hblankMax) {
                ControlList ctrl(subdev_->controls());

                ctrl.set(V4L2_CID_HBLANK, hblankMin);
                ret = subdev_->setControls(&ctrl);
                if (ret)
                        return ret;
        }

If I understand it right, this crashs because the V4L2_CID_HBLANK ctrl
doesn't exist on this driver yet it tries to get a value from it.

> 
> > +	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	ctrls->test_pattern =
> > +		v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> > +					     ARRAY_SIZE(test_pattern_menu) - 1,
> > +					     0, 0, test_pattern_menu);
> > +	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
> > +					 0, 1, 1, 0);
> > +	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
> > +					 0, 1, 1, 0);
> > +
> > +	if (hdl->error) {
> > +		ret = hdl->error;
> > +		dev_err(&client->dev, "control init failed (%d)\n", ret);
> > +		goto error;
> > +	}
> > +
> > +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret = v4l2_ctrl_new_fwnode_properties(hdl, &gc2145_ctrl_ops,
> > +					      &props);
> > +	if (ret)
> > +		goto error;
> > +
> > +	gc2145->sd.ctrl_handler = hdl;
> > +
> > +	return 0;
> > +
> > +error:
> > +	v4l2_ctrl_handler_free(hdl);
> > +
> > +	return ret;
> > +}
> > +
> > +static void gc2145_free_controls(struct gc2145 *gc2145)
> > +{
> > +	v4l2_ctrl_handler_free(&gc2145->ctrls.handler);
> 
> One liners could be called directly maybe..

Done

> 
> > +}
> > +
> > +static int gc2145_check_hwcfg(struct device *dev)
> > +{
> > +	struct fwnode_handle *endpoint;
> > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	int ret = -EINVAL;
> > +
> > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > +	if (!endpoint) {
> > +		dev_err(dev, "endpoint node not found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > +		dev_err(dev, "could not parse endpoint\n");
> > +		goto error_out;
> 
> no need to v4l2_fwnode_endpoint_free() if
> v4l2_fwnode_endpoint_alloc_parse() fails.
> 
> This could be
> 
>         ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
>         fwnode_handle_put(endpoint);
>         if (ret)
>                 return ret;
> 
Updated
> 
> > +	}
> > +
> > +	/* Check the number of MIPI CSI2 data lanes */
> > +	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> > +		dev_err(dev, "only 2 data lanes are currently supported\n");
> > +		goto error_out;
> > +	}
> > +
> > +	ret = 0;
> > +
> > +error_out:
> > +	v4l2_fwnode_endpoint_free(&ep_cfg);
> > +	fwnode_handle_put(endpoint);
> > +
> > +	return ret;
> > +}
> > +
> > +static int gc2145_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct gc2145 *gc2145;
> > +	int ret;
> > +	unsigned int xclk_freq;
> 
> You can easily declare this 2 lines up (I know, reverse-xmas-tree
> nitpicking)

Go for reverse-xmas-tree :-)

> 
> > +
> > +	gc2145 = devm_kzalloc(&client->dev, sizeof(*gc2145), GFP_KERNEL);
> > +	if (!gc2145)
> > +		return -ENOMEM;
> > +
> > +	v4l2_i2c_subdev_init(&gc2145->sd, client, &gc2145_subdev_ops);
> > +
> > +	/* Check the hardware configuration in device tree */
> > +	if (gc2145_check_hwcfg(dev))
> > +		return -EINVAL;
> > +
> > +	/* Get system clock (xclk) */
> > +	gc2145->xclk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(gc2145->xclk)) {
> > +		dev_err(dev, "failed to get xclk\n");
> > +		return PTR_ERR(gc2145->xclk);
> > +	}
> > +
> > +	xclk_freq = clk_get_rate(gc2145->xclk);
> > +	if (xclk_freq != GC2145_XCLK_FREQ) {
> > +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > +			xclk_freq);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = gc2145_get_regulators(gc2145);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get regulators\n");
> 
> Can dev_err_probe help here ?

Indeed.  dev_err_probe used in several places now in v2.

> 
> > +		return ret;
> > +	}
> > +
> > +	/* Request optional enable pin */
> > +	gc2145->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						     GPIOD_OUT_HIGH);
> > +
> > +	/* Request optional enable pin */
> > +	gc2145->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > +							 GPIOD_OUT_HIGH);
> > +
> > +	/*
> > +	 * The sensor must be powered for gc2145_identify_module()
> > +	 * to be able to read the CHIP_ID register
> > +	 */
> > +	ret = gc2145_power_on(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = gc2145_identify_module(gc2145);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	/* Set default mode */
> > +	gc2145->mode = &supported_modes[0];
> > +
> > +	ret = gc2145_init_controls(gc2145);
> > +	if (ret)
> > +		goto error_power_off;
> > +
> > +	/* Initialize subdev */
> > +	gc2145->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	gc2145->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	/* Initialize source pad */
> > +	gc2145->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret = media_entity_pads_init(&gc2145->sd.entity, 1, &gc2145->pad);
> > +	if (ret) {
> > +		dev_err(dev, "failed to init entity pads: %d\n", ret);
> > +		goto error_handler_free;
> > +	}
> > +
> > +	gc2145->sd.state_lock = gc2145->ctrls.handler.lock;
> > +	ret = v4l2_subdev_init_finalize(&gc2145->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "subdev init error: %d\n", ret);
> > +		goto error_media_entity;
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev_sensor(&gc2145->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > +		goto error_subdev_cleanup;
> > +	}
> > +
> > +	/* Enable runtime PM and turn off the device */
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_idle(dev);
> > +
> > +	return 0;
> > +
> > +error_subdev_cleanup:
> > +	v4l2_subdev_cleanup(&gc2145->sd);
> > +
> > +error_media_entity:
> > +	media_entity_cleanup(&gc2145->sd.entity);
> > +
> > +error_handler_free:
> > +	gc2145_free_controls(gc2145);
> > +
> > +error_power_off:
> > +	gc2145_power_off(dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void gc2145_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct gc2145 *gc2145 = to_gc2145(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	media_entity_cleanup(&sd->entity);
> 
> Do you need to call
> 	v4l2_subdev_cleanup(&gc2145->sd);
> 
> here as well ?

Done

> 
> > +	gc2145_free_controls(gc2145);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		gc2145_power_off(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct of_device_id gc2145_dt_ids[] = {
> > +	{ .compatible = "galaxycore,gc2145" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, gc2145_dt_ids);
> > +
> > +static const struct dev_pm_ops gc2145_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(gc2145_suspend, gc2145_resume)
> 
> You can drop these function and the "streaming" flag

Okay. done.

Thanks a lot.
Alain

> 
> Thanks
>   j
> 
> See: [PATCH 00/57] media: i2c: Reduce cargo cult
> 
> > +	SET_RUNTIME_PM_OPS(gc2145_power_off, gc2145_power_on, NULL)
> > +};
> > +
> > +static struct i2c_driver gc2145_i2c_driver = {
> > +	.driver = {
> > +		.name = "gc2145",
> > +		.of_match_table	= gc2145_dt_ids,
> > +		.pm = pm_ptr(&gc2145_pm_ops),
> > +	},
> > +	.probe = gc2145_probe,
> > +	.remove = gc2145_remove,
> > +};
> > +
> > +module_i2c_driver(gc2145_i2c_driver);
> > +
> > +MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com");
> > +MODULE_DESCRIPTION("GalaxyCore GC2145 sensor driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.25.1
> >
